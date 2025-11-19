package com.taxiapi.service;

import com.taxiapi.model.Client;

public interface IClientService {
    Client create(Client client);
    Client findById(Long id);
}
