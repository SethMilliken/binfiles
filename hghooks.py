import sys, os
from mercurial import hg, ui, repo, commands, node
from subprocess import *

def p4OpenIncoming(ui, repo, **kwargs):
	_ui = ui
	_repo = repo
	for key, value in kwargs.iteritems():
		if not key.startswith('parent'):
			continue
		if value:
			_handleChangeset(ui, repo, value)
	pass
	'''
	for target in [value for key, value, somethingElse in kwargs.iteritems() if key.startswith("parent")]
		_handleChangeset(ui, repo, target)
	'''

def _handleChangeset(ui, repo, key):
	ctx = repo[key]

	changeDescription = "hg update from changeset " + key + ":\n " + ctx.description()

	p4TemplateCommand = Popen(["p4", "change", "-o"], stdout=PIPE)
	result = p4TemplateCommand.communicate(input=None)[0]
	fullTemplate = result.replace("<enter description here>", changeDescription)
	#_print(ui, fullTemplate)

	p4Command = Popen(["p4", "change", "-i"], stdin=PIPE, stdout=PIPE)
	result = p4Command.communicate(input=fullTemplate)[0]
	changeList = result.split()[1]

	_print(ui, "%-15s %20s" % ("hg changeset:", key))
	_print(ui, "%-15s %20s" % ("p4 Changelist:", changeList))
	_print(ui, "")

	for file in ctx.files():
		filePath = os.getcwd() + "\\" + file.replace("/", "\\")
		p4Command = Popen(["p4", "open", "-c", changeList.strip(), filePath], stdout=PIPE)
		result = p4Command.communicate()[0]
		_print(ui, result.strip())
	_print(ui, "")
	## Delete the changelist if it's empty.
	p4Command = Popen(["p4", "change", "-d", changeList.strip()], stdout=PIPE)
	result = p4Command.communicate()[0]
	# _print(ui, result)

def _print(ui, string):
	ui.warn(string, '\n')
