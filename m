Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7774026E4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180772.327591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY4K-0006WD-4N; Tue, 07 Sep 2021 10:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180772.327591; Tue, 07 Sep 2021 10:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY4K-0006TN-0L; Tue, 07 Sep 2021 10:11:08 +0000
Received: by outflank-mailman (input) for mailman id 180772;
 Tue, 07 Sep 2021 10:11:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNY4I-0006CT-90
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:11:06 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e952aada-0fc3-11ec-b0e1-12813bfff9fa;
 Tue, 07 Sep 2021 10:11:05 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1879gqdr023812; 
 Tue, 7 Sep 2021 10:11:02 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ax413rgxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 10:11:02 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB6981.eurprd03.prod.outlook.com (2603:10a6:20b:299::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 10:11:00 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 10:11:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e952aada-0fc3-11ec-b0e1-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVksJoTbHstAgAfeQGTuaTIT9aTYz4kxR0iSFSePZVbsJfR2Vbq6ZedSm3jACcBA9cWtR0PtZTFnJeEk7FNMzsMdjhCEkr9LaYXiXW+vfXDXZZlagIgwVuQX2RAsY73Oz/2go6EBx7cxAVzLQ7jeCQdm4jB3wAvBDkmmgcpFveIH8uNITWpteXdevt7yow5TMW/8ZZeC40PA2pO0Skx5vUYNjH0H1j069C4x6VKzPb5fMbYOon/71UklYWNh7NIjzy5G8gqVZn98Hk1X9xQEwQuaqAd3FEHbVgOnjUtHv/4IkwXCkVLwvhVxRMzxZ0NiVHYTDsSvLkrRcTAOyRnNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kOiM5RsD5xxn92IuFKhIqw2Sf/NDbqDaoMJ/mC9j85M=;
 b=DQUtEpCZ0CF8enRDwPyWE+B0y3al16aWwMUO/fxnuogthTpmy/lUo9uYUeJCgUuA7SJGMkTtZSwNusvU56Xhtrkyc37OBeEHW21hZekDzr5me93vKwloiK3XF5GSa45klvbamHmSdna30VHbbOvwFlrCZHcZb45hkIH7VOlXtq7g4nm77lO361wTyXzj052mW7Y0ghXqudxtOqjYekcJ0jukxudb1/R+b5peTNnmjjcg8Q8/VN9xfvzNCoY6yfSHmLbMihOF7idwYFyJep4Lh1ShuwxKWIY+4YntO3ZUFZejsDDV1MZpq0Ec30RiRH37Qk3YB51vdT4RSEH1RW2thA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOiM5RsD5xxn92IuFKhIqw2Sf/NDbqDaoMJ/mC9j85M=;
 b=YWo8luJZzET9nxoVRZBa/tpCzKxHw3LdiLSo1Cug/asWIWi5LIij4PzgC8PfSnMmvQRaIxVGruQCye2wBFCPjWR3TJP8fQTUZcshKiqesTdCdsU3r+uQ+K1YBP9tRF3Y4iJJoyIs8rmsYQ9XW7q5UEGNXWGTOiNBigfo9wHeWMeW2aQATCAeKxFPjmbaNgYjK/6PeS9mlEsZkjmwJrhGohuZTv4x6Fh7OZXGmsIzyXsXwJXl8joX1idvl+ZKfdiUbF8TWlI1BXgX2zPBH3k97A0zPC4DNp7MbTdB+jfXAXRfYxNer+e2WQMRWOVXTwOP7nHt8THgy8WBpPIZ2Be11w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
Thread-Topic: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
Thread-Index: AQHXoKusySJnLVveGkulaWKrBZdXpKuXEOQAgAFPE4A=
Date: Tue, 7 Sep 2021 10:11:00 +0000
Message-ID: <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
In-Reply-To: <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28d3a7ab-ea58-4f82-915a-08d971e7cac7
x-ms-traffictypediagnostic: AS8PR03MB6981:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB69815EC925AFD3E8BC3B1420E7D39@AS8PR03MB6981.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aZ7Eo3jg2n99D0rzDxiYTrVrpInJIUhV0EdvcGhVR4GZ9ZVDMh7FMCLk2aWahvzugwRiNi7QhFNDs6zY31PSpsIabhcIwl2a1EeEEUAHI6J5uJ7nui/dWqEILpDZm3p6zABOp3Ji3H4Hd8gxkC/H3haVxwP4+CVc3EymFSIMqw9ECuOB8natCm4361AsMySqHmym81PPslFhI7+DvLIZ6ysbPAuWiYY5Z6s7R7Dk5i/e/U5lK2pg2o2q0P49GjtYl1m0RhVyQv4KgUShAzjAN/bcvwaPBJqn3znJ2yqgL8PDhrKU23GMqEEk3cawklj4GxhbGYJLISlmjdpwdoIrLvThi2el1DSLwMwN+Gm7uY7eiIoxsS3pVSo9vFcOtNy/BXaklsMe/TtCYa4RvoeSQbw8yGY2laRw1Hi0g6wKy+na/oqw1Uc3Y4w0BT+dVgO2v+h/ygtKkz2pI+8Z8hnwtTTW63aZZV5pqZ+4u599sKrjMYPnr37Z2GaI2NnvdUcBojZVhReF0XyqxlQ3/GqVqn383j2jYM75Npw451iEj6FoaQCVVODTSMD9SvGFfSBcpwV08IdSXCtQ5Qc04S6/XoPEuv5C6+HnV/pcC/9tVTM7fhKEOll1I5fTDmhJaWsT2aFTezFiX/OB6rJPd26dO2PvMib/vJpgd8uV73oHbGzB26FOS7IFOb6CzuYE0tpcGC2olVKoPbm489MWQE5ppyRa7NPLLDFmCXrxzs0rG3iMXP1enbRt53wX8x2/El4U
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(2616005)(478600001)(6512007)(186003)(6486002)(122000001)(38100700002)(66556008)(64756008)(91956017)(4326008)(71200400001)(8676002)(26005)(8936002)(110136005)(6506007)(53546011)(66446008)(2906002)(76116006)(66946007)(36756003)(66476007)(5660300002)(31696002)(316002)(31686004)(86362001)(38070700005)(83380400001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YkhOR0o4MW5DUmg4NHhXNjh0YUcvekdBeTVUNDNyeUY1d3hUSmJiMzVvZnVl?=
 =?utf-8?B?aEU3VUpHMDNKMzlPS1lHVUNuKzV2SUdtcEVUUFZMUlBoY1NFUDF5UXZwU3Mw?=
 =?utf-8?B?dVNxamsxZUhKaGwrMUlLMGZHUVhzOUwwMW92TGtJNlhxVkVvOGpBazFIOUJs?=
 =?utf-8?B?OGIraStCL2hneVJwTk5qQUltazdjNHE4bkRiN0tDOVFFNWsvQVRFZVlWVVRn?=
 =?utf-8?B?cHpkY1lMNDBiYU8wLzJrcEpBUnNrMkxTZ1Nja3kzd1QxL0IzZ1ltNGNkUjgy?=
 =?utf-8?B?Q0hZanhoMEpsV0w4aTcrditwSVZwMmcyUFkxR1N4S2tIcGh3L0RlcWNtQzdF?=
 =?utf-8?B?Y09obUlIdXJHUjZWaWlsdXZuYVhRT2ZTaTZxbE9sdFhVdzhoN1lNVkw4WGVO?=
 =?utf-8?B?ZlAzZUQxQWE3UXQ0bmNpbUN1cFc3djlhL3U0VDkrU0paRUNGblZnNXBadkdH?=
 =?utf-8?B?b2JSQkpBTmdZVGNkQVNoRGJwS1pqWUZ1MGpwUHQ2cVY3ZTRIMVMxUEFhRjFv?=
 =?utf-8?B?d1lDQXNzekI3Zk9PbG4rOTUxaktrMVovWGpPL3ZoUlN2a2s3UjVVK09jZ2d3?=
 =?utf-8?B?YW95Q0p5NTNPNFJmYktNbDAzWGRiQjM3bjRRaU9YWEJtV1BDWEVRSEdEMDdW?=
 =?utf-8?B?dUg0N1dCUmhqbHRtS3l1dys1Ky9EQTlKTFU5VS9VWk80MzVMN0ZCR3RxWjVL?=
 =?utf-8?B?NDk2cWovTWliR3pQeWdJaHFRTitIV0JKVVRUdlRhd3JkeTNLMTJ5aG93NzdY?=
 =?utf-8?B?dDlsWTVQbXRnVUw1RmtMM21aYXJKYm84QUZUMXZEVEVBQWpzeWhIVkF2WXhX?=
 =?utf-8?B?ZUJiZFBJU1lweWlJZHRXcWlzRXN5NE1RYm9xV2JUSWdLbnlZaEk4K0dqcm9L?=
 =?utf-8?B?MmV4K1o3MHJ3cklWa1IxMXZOdThyL2dsclAvRnhkeXpzS3A0RG1FbnhTL01K?=
 =?utf-8?B?TUNFL2hsSi9MakZKZTBDSG4vcXR1K01mUWIzQlVHZ2tkcVdpRVQxb3JXOEMv?=
 =?utf-8?B?MEtkeXRUdUhZeGVGcS8yQzBaeEtmdmF2b1lzNlkyUGZsdmoxM0hDNHZuRi8r?=
 =?utf-8?B?bGJsVXBFZDl6VmlrVWZZUjBlbkZFaTc5S1hOai9KQmxjcjI2ZWN5bVpnZHNx?=
 =?utf-8?B?SGxyKzJxRGNUbFk2N0lKTGZFNnYvZldLNkNZRXRlMlFLU0V2aVl5NzVveTcx?=
 =?utf-8?B?elgrTk93aEJ4Znl6ZCtGenZ0NTlrYjVlemVITzArNWZMenhScG5nSmtOWFRS?=
 =?utf-8?B?dDU5eXVXUDdkeVpZc0p6VUMrMXhYQzFnc1BXVEt6U3huSlpmR0JlNG9ONjI1?=
 =?utf-8?B?a0FCQWpXc2FvRHUxOGoyN0RLQTk2TjlBd0NpR0ZrSU5GSHFwUUMxMlpGbmR5?=
 =?utf-8?B?L2s2NmJEcVV3OEV5VDUyZm54cHBGQkNqSUw2SEM5a01VRGlLZDdPMjVGT0l0?=
 =?utf-8?B?UVNQWGExV0R0eEgrZDR6NngweDJFRnZJZG00MFRtV2psTXFtaXFmUGZUZWo1?=
 =?utf-8?B?RFRVQkVEZlhoblF3dnkvNjQxVW5keVEveVQ2VEc4elJ6elE5bnhnRXZPSG1M?=
 =?utf-8?B?elEreEpxUDFzTllMYitEa0d2a2l5Rm5zTytTRWtqVkM1NmVlL0NKVWt3TFk1?=
 =?utf-8?B?aENZdm13ZytNVlVZZlNvRWNBQTdrbHVFNG5aY2d1VC9oTDcxcjBWOW1hQU5i?=
 =?utf-8?B?cWl5blI2UisrczdmbURoWVNya0lXekV2SnJDNEhQTTJYdFB1YlNWdWVpejVJ?=
 =?utf-8?Q?9c5eRYTF/gsayL65DAcStwdDZ3+lY+VzyImETO0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E45B40E42AF73741B6C7E1792C5BC149@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d3a7ab-ea58-4f82-915a-08d971e7cac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 10:11:00.1254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BfcU329x42HJVXoj9TyAvhcvrLDGPJ5/YYmN9vzjUeK2ez2DTk8y66W/VNszGsWPEiQW9XWZ5dyg7wC1lqnAfH5mYWr4v2I4yHxK5BCffoZegCES5/ha1rW9s9zWFx8f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6981
X-Proofpoint-ORIG-GUID: JnOgF-wPfdCoEbzJHmP_aiLBHCItoqRA
X-Proofpoint-GUID: JnOgF-wPfdCoEbzJHmP_aiLBHCItoqRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_03,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070066

DQpPbiAwNi4wOS4yMSAxNzoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gQEAgLTU5Myw2ICs2MjUs
MzYgQEAgc3RhdGljIGludCBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgIH0N
Cj4+ICAgUkVHSVNURVJfVlBDSV9JTklUKGluaXRfYmFycywgVlBDSV9QUklPUklUWV9NSURETEUp
Ow0KPj4gICANCj4+ICtpbnQgdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgaW50IHJjOw0KPj4g
Kw0KPj4gKyAgICAvKiBSZW1vdmUgcHJldmlvdXNseSBhZGRlZCByZWdpc3RlcnMuICovDQo+PiAr
ICAgIHZwY2lfcmVtb3ZlX2RldmljZV9yZWdpc3RlcnMocGRldik7DQo+PiArDQo+PiArICAgIC8q
IEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gYWRkIHJlZ2lzdGVycyBmb3IgaHdkb20gb3IgZ3Vlc3Qg
ZG9tYWluLiAqLw0KPj4gKyAgICBpZiAoIGQtPmRvbWFpbl9pZCA+PSBET01JRF9GSVJTVF9SRVNF
UlZFRCApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgaWYgKCBpc19oYXJk
d2FyZV9kb21haW4oZCkgKQ0KPj4gKyAgICAgICAgcmMgPSBhZGRfYmFyX2hhbmRsZXJzKHBkZXYs
IHRydWUpOw0KPj4gKyAgICBlbHNlDQo+PiArICAgICAgICByYyA9IGFkZF9iYXJfaGFuZGxlcnMo
cGRldiwgZmFsc2UpOw0KPiAgICAgIHJjID0gYWRkX2Jhcl9oYW5kbGVycyhwZGV2LCBpc19oYXJk
d2FyZV9kb21haW4oZCkpOw0KSW5kZWVkLCB0aGFuayB5b3UgOykNCj4NCj4+ICsgICAgaWYgKCBy
YyApDQo+PiArICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsDQo+PiArICAgICAgICAgICAgIiVw
cDogZmFpbGVkIHRvIGFkZCBCQVIgaGFuZGxlcnMgZm9yIGRvbSVkXG4iLCAmcGRldi0+c2JkZiwN
Cj4+ICsgICAgICAgICAgICBkLT5kb21haW5faWQpOw0KPiBQbGVhc2UgdXNlICVwZCBhbmQgY29y
cmVjdCBpbmRlbnRhdGlvbi4gTG9nZ2luZyB0aGUgZXJyb3IgY29kZSBtaWdodA0KPiBhbHNvIGhl
bHAgc29tZSBpbiBkaWFnbm9zaW5nIGlzc3Vlcy4NClN1cmUsIEknbGwgY2hhbmdlIGl0IHRvICVw
ZA0KPiAgIEZ1cnRoZXIgSSdtIG5vdCBzdXJlIHRoaXMgaXMgYQ0KPiBtZXNzYWdlIHdlIHdhbnQg
aW4gcmVsZWFzZSBidWlsZHMNCldoeSBub3Q/DQo+ICAgLSBwZXJoYXBzIGdkcHJpbnRrKCk/DQpJ
J2xsIGNoYW5nZSBpZiB3ZSBkZWNpZGUgc28NCj4NCj4+ICsgICAgcmV0dXJuIHJjOw0KPj4gK30N
Cj4+ICsNCj4+ICtpbnQgdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgLyogUmVtb3ZlIHBy
ZXZpb3VzbHkgYWRkZWQgcmVnaXN0ZXJzLiAqLw0KPj4gKyAgICB2cGNpX3JlbW92ZV9kZXZpY2Vf
cmVnaXN0ZXJzKHBkZXYpOw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+IEFsc28gLSBpbiBo
b3cgZmFyIGlzIHRoZSBnb2FsIG9mIHlvdXIgd29yayB0byBhbHNvIG1ha2UgdlBDSSB3b3JrIGZv
cg0KPiB4ODYgRG9tVS1zPyBJZiB0aGF0J3Mgbm90IGEgZ29hbA0KSXQgaXMgbm90LCB1bmZvcnR1
bmF0ZWx5LiBUaGUgZ29hbCBpcyBub3QgdG8gYnJlYWsgeDg2IGFuZCB0byBlbmFibGUgQXJtDQo+
ICwgSSdkIGxpa2UgdG8gYXNrIHRoYXQgeW91IGxpbWl0IHRoZQ0KPiBpbnRyb2R1Y3Rpb24gb2Yg
Y29kZSB0aGF0IGVuZHMgdXAgZGVhZCB0aGVyZS4NCg0KV2hhdCdzIHdyb25nIHdpdGggdGhpcyBm
dW5jdGlvbiBldmVuIGlmIGl0IGlzIGEgb25lLWxpbmVyPw0KDQpUaGlzIHdheSB3ZSBoYXZlIGEg
cGFpciB2cGNpX2Jhcl9hZGRfaGFuZGxlcnMvdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzDQoNCmFu
ZCBpZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5IHlvdSBzdWdnZXN0IHZwY2lfYmFyX2FkZF9oYW5k
bGVycy92cGNpX3JlbW92ZV9kZXZpY2VfcmVnaXN0ZXJzPw0KDQpXaGF0IHdvdWxkIHdlIGdhaW4g
ZnJvbSB0aGF0LCBidXQgeWV0IGFub3RoZXIgc2VjcmV0IGtub3dsZWRnZSB0aGF0IGluIG9yZGVy
DQoNCnRvIHJlbW92ZSBCQVIgaGFuZGxlcnMgb25lIG5lZWRzIHRvIGNhbGwgdnBjaV9yZW1vdmVf
ZGV2aWNlX3JlZ2lzdGVycw0KDQp3aGlsZSBJIHdvdWxkIHBlcnNvbmFsbHkgZXhwZWN0IHRvIGNh
bGwgdnBjaV9iYXJfYWRkX2hhbmRsZXJzJyBjb3VudGVycGFydCwNCg0KdnBjaV9yZW1vdmVfZGV2
aWNlX3JlZ2lzdGVycyBuYW1lbHkuDQoNCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5k
cg0K

