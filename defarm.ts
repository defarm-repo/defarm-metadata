export interface Animal {
    species: string; // Example: "cattle", "buffalo", "goat"
    breed: string; // Example: "Nelore", "Angus", "Brahman"
    sex: "male" | "female" | "castrated";
    birth_date: string; // Format: YYYY-MM-DD
    own_farm: boolean;
    identifications: Identifications;
}

export interface Identifications {
    ear_tag?: string;
    rfid?: string;
    sisbov_old?: string;
    sisbov?: string;
    internal_id?: string; // Farm-specific internal ID
}

export interface Ownership {
    owner_name: string;
    country: string;
    brazil?: BrazilRegistration;
}

export interface BrazilRegistration {
    cpf_cnpj?: string;
    property_name?: string;
    establishment_code?: string;
    exploracao_pecuaria?: "Corte" | "Leite";
    state_registration?: string;
    mapa_code?: string;
    geolocation?: string;
    municipality?: string;
    state?: string;
}

export interface MovementEntry {
    date: string; // YYYY-MM-DD
    from: string;
    to: string;
    reason: "purchase" | "transfer" | "sale" | "rotation";
}

export interface GTAEntry {
    gta_number: string;
    issue_date: string;
    valid_until: string;
    transport_type: "road" | "air" | "sea";
    vehicle_plate?: string;
    purpose: "abate" | "engorda" | "reprodução" | "exposição" | "leilão" | "esporte";
}

export interface Vaccine {
    name: string;
    date: string;
}

export interface HormoneApplication {
    hormone: string;
    date: string;
    dosage_mg: number;
}

export interface WeightEntry {
    date: string;
    unit: "kg" | "arroba";
    value: number;
}

export interface Management {
    system: "pasture" | "feedlot" | "mixed";
    supplementation: boolean;
    rotation_schedule?: string;
}

export interface AnimalRecord {
    animal: Animal;
    ownership: Ownership;
    movement_history: MovementEntry[];
    gta: GTAEntry[];
    health_events: {
        vaccines: Vaccine[];
    };
    hormone_use: HormoneApplication[];
    weight_records: WeightEntry[];
    management: Management;
}
