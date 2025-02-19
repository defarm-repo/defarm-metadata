const mongoose = require("mongoose");

const IdentificationsSchema = new mongoose.Schema({
    ear_tag: String,
    rfid: String,
    sisbov_old: String,
    sisbov: String,
    internal_id: String
});

const MovementHistorySchema = new mongoose.Schema({
    date: Date,
    from: String,
    to: String,
    reason: {
        type: String,
        enum: ["purchase", "transfer", "sale", "rotation"]
    }
});

const GTASchema = new mongoose.Schema({
    gta_number: String,
    issue_date: Date,
    valid_until: Date,
    transport_type: {
        type: String,
        enum: ["road", "air", "sea"]
    },
    vehicle_plate: String,
    purpose: {
        type: String,
        enum: ["abate", "engorda", "reprodução", "exposição", "leilão", "esporte"]
    }
});

const VaccineSchema = new mongoose.Schema({
    name: String,
    date: Date
});

const HormoneSchema = new mongoose.Schema({
    hormone: String,
    date: Date,
    dosage_mg: Number
});

const WeightSchema = new mongoose.Schema({
    date: Date,
    unit: {
        type: String,
        enum: ["kg", "arroba"]
    },
    value: Number
});

const ManagementSchema = new mongoose.Schema({
    system: {
        type: String,
        enum: ["pasture", "feedlot", "mixed"]
    },
    supplementation: Boolean,
    rotation_schedule: String
});

const AnimalSchema = new mongoose.Schema({
    species: String,
    breed: String,
    sex: {
        type: String,
        enum: ["male", "female", "castrated"]
    },
    birth_date: Date,
    own_farm: Boolean,
    identifications: IdentificationsSchema,
    ownership: {
        owner_name: String,
        country: String,
        brazil: {
            cpf_cnpj: String,
            property_name: String,
            establishment_code: String,
            exploracao_pecuaria: {
                type: String,
                enum: ["Corte", "Leite"]
            },
            state_registration: String,
            mapa_code: String,
            geolocation: String,
            municipality: String,
            state: String
        }
    },
    movement_history: [MovementHistorySchema],
    gta: [GTASchema],
    health_events: {
        vaccines: [VaccineSchema]
    },
    hormone_use: [HormoneSchema],
    weight_records: [WeightSchema],
    management: ManagementSchema
});

module.exports = mongoose.model("Animal", AnimalSchema);
