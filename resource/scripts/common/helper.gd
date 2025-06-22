extends Node

func isValueInDictionaryExistingAndNotNull(nodes: Dictionary, key: String) -> bool:
	return nodes.has(key) and nodes[key] != null
