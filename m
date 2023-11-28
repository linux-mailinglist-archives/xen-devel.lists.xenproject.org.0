Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D57FCAF6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 00:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643602.1003981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r87m9-0001BR-Cf; Tue, 28 Nov 2023 23:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643602.1003981; Tue, 28 Nov 2023 23:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r87m9-00019C-9r; Tue, 28 Nov 2023 23:45:57 +0000
Received: by outflank-mailman (input) for mailman id 643602;
 Tue, 28 Nov 2023 23:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQ+o=HJ=epam.com=prvs=6696a101d4=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r87m8-000196-3I
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 23:45:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43cf900a-8e48-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 00:45:53 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASMjU3v023509; Tue, 28 Nov 2023 23:45:41 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3unjsm9rdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:45:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS2PR03MB9193.eurprd03.prod.outlook.com (2603:10a6:20b:5fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 23:45:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 23:45:34 +0000
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
X-Inumbo-ID: 43cf900a-8e48-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExKageRZj9JVBJepveNFNXbxdUkBT+ijsjM0gF7YG8vwurdsflOXT35BbVbNoCka/OeSmS2lhk+NTz+et5DxnTHo8Ov0pjJ/frVK+SbnwkloAJQfY1JbXduMTNSY0KPe/ZgjaFzKQDW/JxWys/saxv7kD4MN0e3zU75e1XM548BrtE5OQ3acKNnK9GXnQqZKLFuKgAbsLkO54tjYmddSpVG8IbL9w03NW3eY4RP3MItKs84eaeQiMB4SXTozBY1/Iw6o3KU8DoQQbI1JEmaZ6/039yxxk45JBNx5LlNxFxdaTpAU/vOj15onFmgF0eu0Hml1LTzQTgO/U6ni5W7gBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUF2HtVycfSDWw3/A4DL4AWuV9Ws3sJQj0NAAblpbJ0=;
 b=K1y4QvEEkRAgYxlo9VubVVxv8oMaC5CJcwLmsoy0KW4vzvQFOTXHUjECUKQW3+xtj3xOtGVanyT4KthKBmSAZ5yIy+ulEe1xQnpxrLKQCXQT13A5x719Rb2EDz18Vgm79Zq40rNqMIhz7hQdY9IpXfEil7q0i8lNizPitl+EiNyrLtTCgMaOFJa8Qtwaqw8qe3gkDPePy7qnjjFguUxaxblJ7ysx7IezyYdGF9Y4EkK/qdzIKXBrz2ZP26mhfVlUXcjmO4VPlftukHGvpEtsQw0D7uT7bulU7GB1sxhJmL3H+/MlRiO2eS+LZMrOhCmwkm2ilifwPYLM6nWyL7z66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUF2HtVycfSDWw3/A4DL4AWuV9Ws3sJQj0NAAblpbJ0=;
 b=pXs4wtbY1ikHFEG3jgc+WkIa0W/s7wY6CX88DOO2tEQO2dyaWEioG9HVH+TSxmUcHVIrhC/ZKY+WKqPz3jtov6ck/Re8XZRNylXyounroCgQRwGNTuqIibbDjgOUMsFBgwWb+DYJvRfDEJ95ZW8Dq89ierUs2rMPxW+QF54fgyfhzonwX9hVXo5TCYQ/vsPnOL4lM3yPJsNY7WvecD4FDMn3i01PURKq1SMdhY4hNfy5HXCpaLsRdh49wZoP+d4G938FIAPVBjRxgtvUVEgnoCutXeruim7edoAMYL1qWY1eMw0Wczv75WUuC5xr2dfLa4UglxW+RWsunLxNRcJXYw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: 
 AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRLB9UyCAgAB7YgCAAAiUAIAAEHKAgADZXQCAAEyPgIAAGSwAgAAczgCAAAOwAIAALzmAgASxF4CAAZ+8gIAAs0sAgACdvQCAALuWAIAI2veA
Date: Tue, 28 Nov 2023 23:45:34 +0000
Message-ID: <87a5qxtpb6.fsf@epam.com>
References: <87a5rc4gk7.fsf@epam.com>
 <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org> <8734x43zxi.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
 <87edgo2f6j.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop>
 <87ttpg0wdx.fsf@epam.com>
 <alpine.DEB.2.22.394.2311211712090.2053963@ubuntu-linux-20-04-desktop>
 <ZV3r1uc3av1wQu4W@macbook>
 <alpine.DEB.2.22.394.2311221306060.2053963@ubuntu-linux-20-04-desktop>
 <ZV8NhPohwTDWXOTk@macbook>
In-Reply-To: <ZV8NhPohwTDWXOTk@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS2PR03MB9193:EE_
x-ms-office365-filtering-correlation-id: b20966c6-8ccb-41c4-4ea9-08dbf06c1da3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t6iGD0YQ7HdLIY5mpCXdu0HkloHU8m5/D/EXRo3Vmv5bh5kY/44y8PqAPgMiwdEsfJkyTgR62uZv8yjs6f83bL4aRjUQzZGnyRacXse3ItWnitgb6lhyt5EUYIuPkoUim5CWfby7AZag2QaxUUQsxiXm8vKFKe3nAV+mP7XKVnzyM/kUmNOGRIWZHj9YsuxOZVWhPGBmLVm/HVCiRMulpKRioMSxwhKEotqnK8S0lJAq4Z4VWSWcUis8/84Suacy1N/PYQmR7TI59Gd6jSORPMfN4cQE9ceJ6ZOCljPiGKYQ3iiSkCsl/eP7fnHASfXAiN6s6pSJl85zB/ThZfLTlAhis+FKMHpbB/2u7RSicG5pJIOXLUypWv5EPLd30ogoMg+SOVM18gynnz7FzDTOeyCwOF0zFL3ByCgCzgvhIRMj4rpIPzNDQ3iVzBrKA4I1Ck+k7bcHhRYwDXXbMgC9qCl5yEUNuBxljOjJWBWCgN2rzdzxpCwEM2xLC5GK1bq4h7cNcUqK4j6b/fi4Vycd2Yo1dniM+DHDym79gMVUSLF4NlQEupChZDgmugBXzCUL+Ekj6lhv+M3WBrW8i1zeSyoXUi0eaFlQx8dmYuhpHW57y4dp/S+Vx3kceuBrrsty
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8676002)(8936002)(4326008)(6916009)(41300700001)(66446008)(66476007)(76116006)(64756008)(66946007)(66556008)(54906003)(91956017)(316002)(71200400001)(6506007)(6486002)(478600001)(26005)(6512007)(2616005)(55236004)(66899024)(38100700002)(83380400001)(38070700009)(36756003)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzdCNWZmZFZiNTBZeEJ6bjdQNlQzQ3BFdmRYQXlvWlpGVkVnUXlURTkwV1kz?=
 =?utf-8?B?V1hXZkF6K0tkOGo0aFJJdVMrV2E1cU5uZkIveXpzVHhKSlRWRjN1M1NsaDRD?=
 =?utf-8?B?UUFUUTZPL3ZGRHlLVzdXK2RWSFlRbzQ3dUt1UlQ1encvQ1FzcDRqanhrWU9l?=
 =?utf-8?B?UW5pUFhHVkxPemkwVkd5RDEvRFE3a0ovLzBVcGpmWjVzVUkvZmRaUm1TMDJx?=
 =?utf-8?B?NXEycFpyaWFuU2FmanJnRFljRUNqQXVONmJTWFRPODAxOS9Kc1ZtM21rb091?=
 =?utf-8?B?U3RWYWd0NGExUGxEY1FIRkl4eFNtZjN0WFdSM2VkNFU5cjZPSHU1UFV2TUxM?=
 =?utf-8?B?eFNyQzk1US9vYmN3SXlEYVVXK0V4K2ltZFJvYTNvVk5pNStvNWN0ZzBGN0t6?=
 =?utf-8?B?dG80UkJrUHp6VFNJQkR5dk81U2hhbUxDNVlYM2h5MU94bnl4TlhENEczb1Jq?=
 =?utf-8?B?Z0RNNW9mbFBqZkhtcElDTkdtYmJlVkRENzYrSFUwWDh0TGJwbWxqNDgrTHJp?=
 =?utf-8?B?bWR4MFVWYUtwVW4zeXJOR2pDMkFMWUZtbVEvVzRHV0JtYUZVY3pYaVJOS0VY?=
 =?utf-8?B?NlV4MGk0UExIUHRXd2FHWFVMRHVEUjZKNC9TK0tKRjFCeElMVG9zaDNoSEVV?=
 =?utf-8?B?N0lOL2NIMnEwNUFDNE9XbUV6TTdQbjV6T3FCbTlrMU1PUGxPS1BJcGRENGgw?=
 =?utf-8?B?UC9ueHF6MmVwWmxzTFJFdUtQZEk2ZG56cGxFNXZDMnNiZVFMQTBzUEthaDJu?=
 =?utf-8?B?bm5hMStxZTVyTCswbjJPaUZlY0E4TkYyM2N4VzM5c1dKZmNSOGNuRUwzMmhG?=
 =?utf-8?B?OXI5S2s2NXV1ZE9EanVHVVYvcmI2cjBxVkZuTmo2dFdGMmQ2eUVSem1reEZD?=
 =?utf-8?B?L1VMU1lOVzNKdUIvLzdiQVJuRUgzUFhNbXBRZFg3RjN3cWMxK2ZmTkthNkFi?=
 =?utf-8?B?Tm1wdUJpbkZ1cldoT0xHMnlHSFZqdWxDK0tHRitMWEh4SUZVVGYzaERzNXpj?=
 =?utf-8?B?NUdCTkE1VDM3R2VWM0pCbnRGK2xqSzFSbEFtQ3Exc3B1QmJrM0N1M09JL3Q1?=
 =?utf-8?B?SnRsRHZUeUtMK1V3K2t6YU13UW1rY3FEeTdaUlNVc04yby9PTVo1azFNQSta?=
 =?utf-8?B?RkxJMjE5SmpQTVRMM1JSYkNSbXp2VmR6SlBIM3k2RVN0ekprY2NIZHdZZEdQ?=
 =?utf-8?B?cnZKS2FOb0lTSDRCbmNrSU9qcS9ydjdOUDJzNWlRNW9iNmhJeWZ3UTgrYW9V?=
 =?utf-8?B?MUE3cjZZVzRLRFQ1cVFKUlJJM1hjS1U4d1hXZElJeEJsbkZKUEgwaWc1UEJi?=
 =?utf-8?B?TGJHNHo0OGlBc0huRnJOV1J0MzYrS0ZGUVV4VkFpdm5scE5WaFlpUmlJTVF4?=
 =?utf-8?B?YXlTeVIwSlYrUHFkRDlsK2JHbEZ1MDhSVm5rTklMdlRmcC9qWkdieXpTczEy?=
 =?utf-8?B?eFhLSXFhdllta3paZjlKNmZXaXVZMXBIVERKRkpuT0w3VmtKeUpNdXNTMVlT?=
 =?utf-8?B?WEROSG13bWNFcXhudHFpVXo3eXNEeU9vR1IvUzdCbER0U3B6dXYyaDIyQjg3?=
 =?utf-8?B?RnVEcC90ajMyUUg2VDlrVGtYUUhCQWhUV2dkL3JiWDlUdXk4anQyc1JYbEQx?=
 =?utf-8?B?akxoTmhwYmk0cmFQbmI4T055amRLczIwVVh6Qi9HSHVGSDVjOUNIaFRWNFM2?=
 =?utf-8?B?aWw2STlXbm1rcFlqRDc1bUNVTWNwU1pLSkFLZDZ4d2pTcFozVURoYmYvYXdz?=
 =?utf-8?B?WE9uZjhpc3NPNXBnN0tyNFR6ei9DSGxSYkluT0ZyR1hpU2NEY3F1eXBROXhs?=
 =?utf-8?B?NDRPbGNFbUZrUnVNSE1adjBvRmZRRks5VFlNaUdjTXhDT3laMlBzeFdIR2ZL?=
 =?utf-8?B?NGYycUdxMEtVOFdpQ0ZqYnN2bXQwclE1WFIxWVF0WnJ1c2NaTkdlLyt3MHhO?=
 =?utf-8?B?QVNkV2ZUYUl2WVJza1ZQakI0aFJ4WTAzWTdmZVoreit0NExYYzFCcW1iNlpm?=
 =?utf-8?B?Y2JTTkQrcnAwWjFVOFhTRGVqMEI4QXIrbG1acVRCM2ZzSDdrRzNtSmkydlAx?=
 =?utf-8?B?bi82ZTdRbTBMVnowS1ZaYkNaZWNsL3VoMFAyWHhIUERXUWFWZUpDeUpscnBU?=
 =?utf-8?B?RmNha1FBb05FWm1qbHJpeHF2eEZwSU4wbzhsZVJrRFprNFFJRk55czdrY3pV?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2791F40C6F63E844AEDA7241C213DA9A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20966c6-8ccb-41c4-4ea9-08dbf06c1da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 23:45:34.7090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7mzi0ImClKj9RcG1qy0ncurlevDrc7xsobKV5Z1MDgS+4h3YKqA1/e6KH50x7mQhOk5LFtUAXfBWNJP82g/25Ju/aFdqsIKSizMcHaKyjjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9193
X-Proofpoint-ORIG-GUID: OpUPn34Nw7NfJ4G2zXezzvzAm0EqOLDm
X-Proofpoint-GUID: OpUPn34Nw7NfJ4G2zXezzvzAm0EqOLDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_25,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=833
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280186

SGkgUm9nZXIsDQoNClJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0
ZXM6DQoNCj4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMDE6MTg6MzJQTSAtMDgwMCwgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gV2VkLCAyMiBOb3YgMjAyMywgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+ID4gT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMDU6MTI6MTVQTSAtMDgw
MCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gPiA+IExldCBtZSBleHBhbmQgb24gdGhp
cy4gTGlrZSBJIHdyb3RlIGFib3ZlLCBJIHRoaW5rIGl0IGlzIGltcG9ydGFudCB0aGF0DQo+PiA+
ID4gWGVuIHZQQ0kgaXMgdGhlIG9ubHkgaW4tdXNlIFBDSSBSb290IENvbXBsZXggZW11bGF0b3Iu
IElmIGl0IG1ha2VzIHRoZQ0KPj4gPiA+IFFFTVUgaW1wbGVtZW50YXRpb24gZWFzaWVyLCBpdCBp
cyBPSyBpZiBRRU1VIGVtdWxhdGVzIGFuIHVubmVlZGVkIGFuZA0KPj4gPiA+IHVudXNlZCBQQ0kg
Um9vdCBDb21wbGV4LiBGcm9tIFhlbiBwb2ludCBvZiB2aWV3LCBpdCBkb2Vzbid0IGV4aXN0Lg0K
Pj4gPiA+IA0KPj4gPiA+IEluIHRlcm1zIGlmIGlvcmVxIHJlZ2lzdHJhdGlvbiwgUUVNVSBjYWxs
cw0KPj4gPiA+IHhlbmRldmljZW1vZGVsX21hcF9wY2lkZXZfdG9faW9yZXFfc2VydmVyIGZvciBl
YWNoIFBDSSBCREYgaXQgd2FudHMgdG8NCj4+ID4gPiBlbXVsYXRlLiBUaGF0IHdheSwgWGVuIHZQ
Q0kga25vd3MgZXhhY3RseSB3aGF0IFBDSSBjb25maWcgc3BhY2UNCj4+ID4gPiByZWFkcy93cml0
ZXMgdG8gZm9yd2FyZCB0byBRRU1VLg0KPj4gPiA+IA0KPj4gPiA+IExldCdzIHNheSB0aGF0Og0K
Pj4gPiA+IC0gMDA6MDIuMCBpcyBQQ0kgcGFzc3Rocm91Z2ggZGV2aWNlDQo+PiA+ID4gLSAwMDow
My4wIGlzIGEgUENJIGVtdWxhdGVkIGRldmljZQ0KPj4gPiA+IA0KPj4gPiA+IFFFTVUgd291bGQg
cmVnaXN0ZXIgMDA6MDMuMCBhbmQgdlBDSSB3b3VsZCBrbm93IHRvIGZvcndhcmQgYW55dGhpbmcN
Cj4+ID4gPiByZWxhdGVkIHRvIDAwOjAzLjAgdG8gUUVNVSwgYnV0IG5vdCAwMDowMi4wLg0KPj4g
PiANCj4+ID4gSSB0aGluayB0aGVyZSdzIHNvbWUgd29yayBoZXJlIHNvIHRoYXQgd2UgaGF2ZSBh
IHByb3BlciBoaWVyYXJjaHkNCj4+ID4gaW5zaWRlIG9mIFhlbi4gIFJpZ2h0IG5vdyBib3RoIGlv
cmVxIGFuZCB2cGNpIGV4cGVjdCB0byBkZWNvZGUgdGhlDQo+PiA+IGFjY2Vzc2VzIHRvIHRoZSBQ
Q0kgY29uZmlnIHNwYWNlLCBhbmQgc2V0dXAgKE1NKUlPIGhhbmRsZXJzIHRvIHRyYXANCj4+ID4g
RUNBTSwgc2VlIHZwY2lfZWNhbV97cmVhZCx3cml0ZX0oKS4NCj4+ID4gDQo+PiA+IEkgdGhpbmsg
d2Ugd2FudCB0byBtb3ZlIHRvIGEgbW9kZWwgd2hlcmUgdlBDSSBkb2Vzbid0IHNldHVwIE1NSU8g
dHJhcHMNCj4+ID4gaXRzZWxmLCBhbmQgaW5zdGVhZCByZWxpZXMgb24gaW9yZXEgdG8gZG8gdGhl
IGRlY29kaW5nIGFuZCBmb3J3YXJkaW5nDQo+PiA+IG9mIGFjY2Vzc2VzLiAgV2UgbmVlZCBzb21l
IHdvcmsgaW4gb3JkZXIgdG8gcmVwcmVzZW50IGFuIGludGVybmFsDQo+PiA+IGlvcmVxIGhhbmRs
ZXIsIGJ1dCB0aGF0IHNob3VsZG4ndCBiZSB0b28gY29tcGxpY2F0ZWQuICBJT1c6IHZwY2kNCj4+
ID4gc2hvdWxkIHJlZ2lzdGVyIGRldmljZXMgaXQncyBoYW5kbGluZyB3aXRoIGlvcmVxLCBtdWNo
IGxpa2UgUUVNVSBkb2VzLg0KPj4gDQo+PiBJIHRoaW5rIHRoaXMgY291bGQgYmUgYSBnb29kIGlk
ZWEuDQo+PiANCj4+IFRoaXMgd291bGQgYmUgdGhlIHZlcnkgZmlyc3QgSU9SRVEgaGFuZGxlciBp
bXBsZW1lbnRlZCBpbiBYZW4gaXRzZWxmLA0KPj4gcmF0aGVyIHRoYW4gb3V0c2lkZSBvZiBYZW4u
IFNvbWUgY29kZSByZWZhY3RvcmluZyBtaWdodCBiZSByZXF1aXJlZCwNCj4+IHdoaWNoIHdvcnJp
ZXMgbWUgZ2l2ZW4gdGhhdCB2UENJIGlzIGF0IHYxMCBhbmQgaGFzIGJlZW4gcGVuZGluZyBmb3IN
Cj4+IHllYXJzLiBJIHRoaW5rIGl0IGNvdWxkIG1ha2Ugc2Vuc2UgYXMgYSBmb2xsb3ctdXAgc2Vy
aWVzLCBub3QgdjExLg0KPg0KPiBUaGF0J3MgcGVyZmVjdGx5IGZpbmUgZm9yIG1lLCBtb3N0IG9m
IHRoZSBzZXJpZXMgaGVyZSBqdXN0IGRlYWwgd2l0aA0KPiB0aGUgbG9naWMgdG8gaW50ZXJjZXB0
IGd1ZXN0IGFjY2VzcyB0byB0aGUgY29uZmlnIHNwYWNlIGFuZCBpcw0KPiBjb21wbGV0ZWx5IGFn
bm9zdGljIGFzIHRvIGhvdyB0aGUgYWNjZXNzZXMgYXJlIGludGVyY2VwdGVkLg0KPg0KPj4gSSB0
aGluayB0aGlzIGlkZWEgd291bGQgYmUgYmVuZWZpY2lhbCBpZiwgaW4gdGhlIGV4YW1wbGUgYWJv
dmUsIHZQQ0kNCj4+IGRvZXNuJ3QgcmVhbGx5IG5lZWQgdG8ga25vdyBhYm91dCBkZXZpY2UgMDA6
MDMuMC4gdlBDSSByZWdpc3RlcnMgdmlhDQo+PiBJT1JFUSB0aGUgUENJIFJvb3QgQ29tcGxleCBh
bmQgZGV2aWNlIDAwOjAyLjAgb25seSwgUUVNVSByZWdpc3RlcnMNCj4+IDAwOjAzLjAsIGFuZCBl
dmVyeXRoaW5nIHdvcmtzLiB2UENJIGlzIG5vdCBpbnZvbHZlZCBhdCBhbGwgaW4gUENJIGNvbmZp
Zw0KPj4gc3BhY2UgcmVhZHMgYW5kIHdyaXRlcyBmb3IgMDA6MDMuMC4gSWYgdGhpcyBpcyB0aGUg
Y2FzZSwgdGhlbiBtb3ZpbmcNCj4+IHZQQ0kgdG8gSU9SRVEgY291bGQgYmUgZ29vZC4NCj4NCj4g
R2l2ZW4geW91ciBkZXNjcmlwdGlvbiBhYm92ZSwgd2l0aCB0aGUgcm9vdCBjb21wbGV4IGltcGxl
bWVudGVkIGluDQo+IHZQQ0ksIHdlIHdvdWxkIG5lZWQgdG8gbWFuZGF0ZSB2UENJIHRvZ2V0aGVy
IHdpdGggaW9yZXFzIGV2ZW4gaWYgbm8NCj4gcGFzc3Rocm91Z2ggZGV2aWNlcyBhcmUgdXNpbmcg
dlBDSSBpdHNlbGYgKGp1c3QgZm9yIHRoZSBlbXVsYXRpb24gb2YNCj4gdGhlIHJvb3QgY29tcGxl
eCkuICBXaGljaCBpcyBmaW5lLCBqdXN0IHdhbnRlZCB0byBtZW50aW9uIHRoZQ0KPiBkZXBlbmRl
bmN5Lg0KPg0KPj4gT24gdGhlIG90aGVyIGhhbmQgaWYgdlBDSSBhY3R1YWxseSBuZWVkcyB0byBr
bm93IHRoYXQgMDA6MDMuMCBleGlzdHMsDQo+PiBwZXJoYXBzIGJlY2F1c2UgaXQgY2hhbmdlcyBz
b21ldGhpbmcgaW4gdGhlIFBDSSBSb290IENvbXBsZXggZW11bGF0aW9uDQo+PiBvciB2UENJIG5l
ZWRzIHRvIHRha2Ugc29tZSBhY3Rpb24gd2hlbiBQQ0kgY29uZmlnIHNwYWNlIHJlZ2lzdGVycyBv
Zg0KPj4gMDA6MDMuMCBhcmUgd3JpdHRlbiB0bywgdGhlbiBJIHRoaW5rIHRoaXMgbW9kZWwgZG9l
c24ndCB3b3JrIHdlbGwuIElmDQo+PiB0aGlzIGlzIHRoZSBjYXNlLCB0aGVuIEkgdGhpbmsgaXQg
d291bGQgYmUgYmVzdCB0byBrZWVwIHZQQ0kgYXMgTU1JTw0KPj4gaGFuZGxlciBhbmQgbGV0IHZQ
Q0kgZm9yd2FyZCB0byBJT1JFUSB3aGVuIGFwcHJvcHJpYXRlLg0KPg0KPiBBdCBmaXJzdCBhcHBy
b3hpbWF0aW9uIEkgZG9uJ3QgdGhpbmsgd2Ugd291bGQgaGF2ZSBzdWNoIGludGVyYWN0aW9ucywN
Cj4gb3RoZXJ3aXNlIHRoZSB3aG9sZSBwcmVtaXNlIG9mIGlvcmVxIGJlaW5nIGFibGUgdG8gcmVn
aXN0ZXIgaW5kaXZpZHVhbA0KPiBQQ0kgZGV2aWNlcyB3b3VsZCBiZSBicm9rZW4uDQo+DQo+IFhl
blNldmVyIGFscmVhZHkgaGFzIHNjZW5hcmlvcyB3aXRoIHR3byBkaWZmZXJlbnQgdXNlci1zcGFj
ZSBlbXVsYXRvcnMNCj4gKGllOiB0d28gZGlmZmVyZW50IGlvcmVxIHNlcnZlcnMpIGhhbmRsaW5n
IGFjY2Vzc2VzIHRvIGRpZmZlcmVudA0KPiBkZXZpY2VzIGluIHRoZSBzYW1lIFBDSSBidXMsIGFu
ZCB0aGVyZSdzIG5vIGludGVyYWN0aW9uIHdpdGggdGhlIHJvb3QNCj4gY29tcGxleCByZXF1aXJl
ZC4NCj4NCg0KT3V0IG9mIGN1cmlvc2l0eTogaG93IGxlZ2FjeSBQQ0kgaW50ZXJydXB0cyBhcmUg
aGFuZGxlZCBpbiB0aGlzIGNhc2U/IEluDQpteSB1bmRlcnN0YW5kaW5nLCBpdCBpcyBSb290IENv
bXBsZXgncyByZXNwb25zaWJpbGl0eSB0byBwcm9wYWdhdGUNCmNvcnJlY3QgSVJRIGxldmVscyB0
byBhbiBpbnRlcnJ1cHQgY29udHJvbGxlcj8NCg0KWy4uLl0NCg0KLS0gDQpXQlIsIFZvbG9keW15
cg==

