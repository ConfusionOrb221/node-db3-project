const db = require('../data/dbConfig.js');

function find(){
    return db('schemes');
}

function findById(id){
    return db('schemes').where({id: id}).catch(err =>{ return null })
}

function findSteps(id){
    return db.select('schemes.scheme_name', 'steps.id', 'steps.step_number', 'steps.instructions')
    .from('schemes')
    .where({'schemes.id': id})
    .join('steps', 'steps.scheme_id', '=', 'schemes.id')
    .orderBy('steps.step_number')
    .catch(err =>{
        return null;
    })
}

function add(scheme){
    return db('schemes').insert(scheme)
}

function addStep(step, scheme_id){
    if(step.step_number === undefined || step.instructions === undefined){
        return undefined;
    }
    return db('steps').insert({...step, scheme_id: scheme_id});
}

function update(changes, id){
    if(changes.scheme_name === undefined){
        return undefined;
    }
    return db('schemes').where('id', '=', id).update({scheme_name: changes.scheme_name})
}

function remove(id){
    return db('schemes').where('id', '=', id).delete();
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}
