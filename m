Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0340237E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180419.327080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUgR-00079E-Qb; Tue, 07 Sep 2021 06:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180419.327080; Tue, 07 Sep 2021 06:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUgR-00076X-Mu; Tue, 07 Sep 2021 06:34:15 +0000
Received: by outflank-mailman (input) for mailman id 180419;
 Tue, 07 Sep 2021 06:34:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNUgQ-00076R-Ax
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:34:14 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14c46350-cb4d-48b5-8944-7fa3ee01311a;
 Tue, 07 Sep 2021 06:34:13 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1875gv9o008521; 
 Tue, 7 Sep 2021 06:34:10 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
 by mx0b-0039f301.pphosted.com with ESMTP id 3aws4h13bn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 06:34:10 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM7PR03MB6548.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 06:34:05 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 06:34:05 +0000
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
X-Inumbo-ID: 14c46350-cb4d-48b5-8944-7fa3ee01311a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io9ggiQeyG7jx0BilvoNnv0Y5zon76kEnRVsj4ppbDCnWrfa+Plo9dSAeKFUXss+H4n/da4IfAqam5QJ9AMTfnBqJEivsX8dtTgRuNc8lQkNBpWOy27183ZZeU5sIeonDDx6jEyi+JgYb7wYQDw66yjuu/ia1Ezi3FNnVunE9DaEVbRa9SwT4XfC/0o6eT0G8GAkE3ESE2ZwwbhO7I64drCZ+Vm1oSA5k7pCBeJ6AiANZJF40VkAqnoJSd+cOhZgz47xSVotJN7xFhLe88sWX/BOKwwGTIPMcTN+QKyZW/yu5lZw0bi/xJwzmah5KELdO6nLESu+AKk+ecEjE/fTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OwCGYDqY51fg4A+y0BsNIv4jmEll0CQOVvaIhZYta9U=;
 b=Lk74jwz1fTs4WBc3ZDudkOkkHKyzaegLlR0dk/7xvuNzaZ7elTi7NJD4rhfHIUNi5tT1SIVVHuxpaTXHuqo7ibULEFB7bxihR5LD51cxGbcF1qH63rE6Qv72Sz2ce4+UXCI32UZNnEqelASe4yVWnpCj0EXXvZC7GN4blafQju8JC0gBC3NzeqTXZB1XMy/AIuwNTgeE0EzVElCoentvXnET0AcI32o6dS/LdiimDrFIGv5Hy2QNrLy2QgS7wPZD2GbtpZ9DWjellhaLZgn0/Sw5lTgVsSFLLuIaFP9hs4ilS+950bNAEL6fedar3ZT6mL2pBu9q9FME+t+9hE07EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwCGYDqY51fg4A+y0BsNIv4jmEll0CQOVvaIhZYta9U=;
 b=xOvwgJkHt0cV+OfD9dZVK8KGHoR6cPAbw1gomM/wPGMA0caYlY2lY9iZWrvurwxaTZ3duXdTKY7vwGtlRnXudaCc/yF2UDpjC0O9JVbKGp+616q+j0QzdhdPaEuRIRnNX1bPdZ04LSfEaErvlaDNkmhl6VGz2fA5ZvPaDH0bPLu126fS1bm+w4yFuGvfUt58lU+RA9Kzk/b6ckkGjiMhnm83QdzQS1jQD8IohTomEq3jNabnTNGTaTpLEAB2BvwTwpYiUsqNvcqKGlc+nGdbYg7quKIsE3gpua9OIKazfQDw9IcKAZJdaVxpeAz7btiahU44Nwl7ewYFWI2puAXGcw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Topic: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Index: 
 AQHXoJ51zxJWpxhHEEGXNqYYBqazw6uSBESAgASU4wCAAB15AIAABzeAgAALJQCAAANyAIAACPKAgAFOFwA=
Date: Tue, 7 Sep 2021 06:34:05 +0000
Message-ID: <16d93740-1016-19b4-ca58-65a9dc1aadfc@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
 <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
 <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
 <7da7f759-eab0-5e97-e8e4-980db5db1e79@xen.org>
 <b5b761bd-f5d7-34e6-691d-735af7c8b0ae@epam.com>
 <f950a37d-2773-fce5-9e77-163a64925d7d@xen.org>
 <71e0a54f-da69-5712-f826-9c38eecfa244@epam.com>
 <9482457a-fae2-eb8e-79dc-b5d7bcf2fa0a@xen.org>
In-Reply-To: <9482457a-fae2-eb8e-79dc-b5d7bcf2fa0a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c69a9c5-d084-4531-9f40-08d971c97d3a
x-ms-traffictypediagnostic: AM7PR03MB6548:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB6548D72544E29C2455DF59E3E7D39@AM7PR03MB6548.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vI3ioV4HyYVzpt9GBULiZUek3KzInzxGAGp8ytiHZXBetbFhTaXeJkWvzWNae2jSxSQ7n6k2GSDjgGLXZccLFWyyootM7gUai9Qu1XinGptzrcojll8/vMo8msfuFm99bvcZPbIwkmz+/srOJaip5K3oeyje5cUazRjI/5eOARyoDL/hVoI9HIXeSwhIuJ42LdGFoWTJZaPCHKcL528ZrpHG4P6PmPY+UUonqVgNn3470A9Hhg9bncsiJS+V4F6OpE8u8/yC6FzLC3tDrYTxIUFYtYnteaQIyUfIuTPth/yDwMmqgsSEnHcTDSRClX0sY9waPNffA4eKFmJgXxGyfRUUSFAopDZGug6mZ/S0o4n/sSWnAgov+wEQk7qZgMd1lB6WD454F9YWf0xsC1t7wR90wZElSgOcyDFRsjMSs0TgrhpF9m1LI6wlINmWa89Gu8lPyn784NnWmxNWIKO1QUBhqz1jAoq63ElLfRa2vGUVLweixSEycwFVDTK1fRo+Ay/03MKVUucF6CTEfwl0bLRQDnb+fM4+3ey0M+zsm2ARJjjtMaxY5qQZ5J9BCoBaxyGgsOudTTcV/3CVxFcrDpQ/uxXsv9ni1YR2uViwi0S5g7bZgabkg+IVHOEZRXlCP6e0srgcKW7+dK8Kkmu3cKJgEWIRdUS9TlRpoZLJTJiGDxcihQNfSn2nnRNyPavwFq7KqjIoyjGMIT3VI+/ZQ4NjHbI5CMzejrjHxPq2mOXo8Af9/csGcBE5uMSgvBgX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(6486002)(478600001)(66946007)(66476007)(6512007)(2906002)(5660300002)(53546011)(6506007)(86362001)(38100700002)(186003)(71200400001)(4326008)(26005)(31696002)(36756003)(31686004)(316002)(2616005)(66556008)(122000001)(54906003)(8676002)(64756008)(8936002)(38070700005)(91956017)(66446008)(76116006)(110136005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UUozUVY5Y3l2QWcwcS9LOUt0YkNYUTRTRFJZNFM0eWRKNFdMSmlmbXArOWls?=
 =?utf-8?B?UkJKLzdBTlFGZEkzVkltc0NGQ3FJYmNYcmNrUUVtUWdrSE0zSTVQOTlYaFEr?=
 =?utf-8?B?ZDhOSUxxWWxUN1Q2c20vdnJTR3JmQmg3WFdtVzAzSFZnUElwYnJSVXZHK3Qz?=
 =?utf-8?B?OTdEaWZRSDh0L1FhUHB0eXVWVUMyaTR1TDZkbER4R1pBendDTzNrRDJEdXpW?=
 =?utf-8?B?NzdwZ2plMW9SS29SSElidXRERjVVMVEwa3hrSk9RVllTTXI2bHNWeWxZMkJL?=
 =?utf-8?B?VStKWVRBSDYzU3BDY3hGUnVLaUk4R0xsN1VnT3BnSmswb2NUL2xySjVqTTJX?=
 =?utf-8?B?b3BYT2pPdjRFNmgrNDZSbDJaK00wOGNCaU0xQlZqeGlFVnNYL2tTV3d2VFBh?=
 =?utf-8?B?TFIvNi8rUStuRGlFbCtRd1Mva1plam0vOHZCVHlaL3E0eXhoSWVXUElGcHA1?=
 =?utf-8?B?WlgwcFdvSkRNdnYzQ1M3K3NQUHBTOU10RlpOUU1OSkNkYStvc2cwY29RU0Qr?=
 =?utf-8?B?YmtZRDlpb1ZXOUhncVZEZFBIY2xEREUycysrVWVBVHV0Zld0Q1ZwcEJGYVk1?=
 =?utf-8?B?QnFyUXhVK1RDS0RpNzhLY2JKa1VpcTNuZ0w5N2wxK1RGeklkS01IbXBablVl?=
 =?utf-8?B?M3FzMXppZW9DREZBcXVXbkNtWmF1NEZEbjZZTzF5MXRHWW5PN1lGeVBXKysy?=
 =?utf-8?B?TzBkc1RlZHlpNHdXY0Z5NzdWeitDSDM2bXRZck5mWmdiOCtpamttaC9nU3ox?=
 =?utf-8?B?SldvYWp3OUpEbVU1emRiVXZLQzZoa2grblRZa1BKRlhtODZEM3l3MUFMMXVh?=
 =?utf-8?B?RUg0V0crblB6aHFoNFRkWW9Pc2hIbzdLUmErcWlvZi9XVWJqTjdWeUxaMkpp?=
 =?utf-8?B?QkRySEc2blZMSHNaU283ejk5NmN4b2l3RitPWW02bHJlNU9hRWJRRWhHQkZS?=
 =?utf-8?B?cVp2MTdiendmdjY1MHd1ZEcrV2FMRkxpT01IcGZxdjNGOUFxSytuMkRWRnBS?=
 =?utf-8?B?NmVvbEw2N3d1VlJMMzBNT0piek9HMURscE5VRWhsOXkxMFN4cS9pU2ZQM2lM?=
 =?utf-8?B?bmNOZmFmZUE1Y0srMjlTcnREM2VqTTh0U3hxZ1FiaUZVOFZIRC90T2Z3dVBJ?=
 =?utf-8?B?S0NIWnQydXpZc0NabWRXMmttK0ZGVWgyTFJFck1sc01rVWFFQkk2ekZkNkVR?=
 =?utf-8?B?Ky82anpncWpFeks0YjRFcnJMS0d3dXR2Ym53SWJjcWl4ZVVIVWQzTVZLNjht?=
 =?utf-8?B?eGlSMi96VnEwRWZaSk90MlZyMkc1eTRaR3ZmcTVIV2FaaW5wRjRYckJQa2NM?=
 =?utf-8?B?RnV1Q1lwbzF0OER4WHBaZEtHVW0xMEc3V29yemRVTHh2bk1HODFBcUxIMjQv?=
 =?utf-8?B?cTRQdUkwM3NpMFNydDEvUXFjZm9rTHYzd0V5dFpNbC82dko3ZTRIUW1LZW5l?=
 =?utf-8?B?MEVqSm92eXp0dXczWTdQN0M5aVF3cGRwY0llRUk1dEJlNmJ1cjZTUGFlbEdm?=
 =?utf-8?B?dDF1MFRuOVlGeXJBeTV4dWJPKzNQOXdlRkRsNlJIQjUzODI4RGorZG1CR2dz?=
 =?utf-8?B?b3RneEYvM0loczJiQXphazJ5eFQ4N0Viekt3Mm1EeWsxeng2TkVMZ3Y0dkJt?=
 =?utf-8?B?Ym5IaytwRkhXVUtKTEVDaEFsMHduOXFETUh3UWNZZWZKQXFYZEJOQUEwaXRR?=
 =?utf-8?B?WjJkeGJPNTFKNy92NzVSYk1uM1RwL0gvTnNiZ1pDU3RSdC8wVTZ2SVF6bzRM?=
 =?utf-8?Q?GgZ/EBXNLx08E7ZS9YAeJluusU+raL4u9vOUBNO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE4A125459D4004594DAE15F5D2D578B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c69a9c5-d084-4531-9f40-08d971c97d3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 06:34:05.1610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8a9u+qeUiNQ/PImUze2o2BlWgmIHk8XCbhzj5C/Xds48Hy8mG1YVsjf4sX4BcO0MU5chByJyKIeOPlzsrRBlFv87bpOZP7Au2U4ATq+jnZQIbjMHMutA6nwRKHDDwauh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6548
X-Proofpoint-GUID: hPkc-jlmIuwvvC_O6sxvj_loaVVUptEu
X-Proofpoint-ORIG-GUID: hPkc-jlmIuwvvC_O6sxvj_loaVVUptEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070043

DQpPbiAwNi4wOS4yMSAxMzozOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBPbGVrc2FuZHIs
DQo+DQo+IE9uIDA2LzA5LzIwMjEgMTE6MDYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4gT24gMDYuMDkuMjEgMTI6NTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4gSG93
ZXZlciwgbG9va2luZyBhdCB0aGUgcmVzdCBvZiB0aGUgY29kZSwgd2UgYWxyZWFkeSBoYXZlIGEg
Y2hlY2sgZm9yIHZwY2kgaW4gdGhlIGNvbW1vbiBJT1JFUSBjb2RlLg0KPj4+Pj4+DQo+Pj4+Pj4g
V2hpY2ggbWF5IG5vdCBiZSBlbmFibGVkIGFzIGl0IGRlcGVuZHMgb24gQ09ORklHX0lPUkVRX1NF
UlZFUi4NCj4+Pj4+DQo+Pj4+PiBSaWdodC4gTXkgcG9pbnQgaXMgd2hlbiBDT05GSUdfSU9SRVFf
U0VSVkVSIGlzIHNldCB0aGVuIHlvdSB3b3VsZCBlbmQgdXAgdG8gY2FsbCB0d2ljZSB2cGNpX3By
b2Nlc3NfcGVuZGluZygpLiBUaGlzIHdpbGwgaGF2ZSBhbiBpbXBhY3QgaG93IG9uIGxvbmcgeW91
ciB2Q1BVIGlzIGdvaW5nIHRvIHJ1bm5pbmcgYmVjYXVzZSB5b3UgYXJlIGRvdWJsaW5nIHRoZSB3
b3JrLg0KPj4+Pg0KPj4+PiBTbywgeW91IHN1Z2dlc3QgdGhhdCB3ZSBoYXZlIGluIHRoZSBjb21t
b24gSU9SRVEgY29kZSBzb21ldGhpbmcgY2FsbCBsaWtlDQo+Pj4+DQo+Pj4+IGFyY2hfdnBjaV9w
cm9jZXNzX3BlbmRpbmc/IEluIGNhc2Ugb2YgeDg2IGl0IHdpbGwgaGF2ZSB0aGUgY29kZSBjdXJy
ZW50bHkgZm91bmQgaW4gdGhlDQo+Pj4+DQo+Pj4+IGNvbW1vbiBJT1JFUSBzb3VyY2VzIGFuZCBm
b3IgQXJtIGl0IHdpbGwgYmUgbm9wPw0KPj4+DQo+Pj4gTm8gSSBhbSBzdWdnZXN0aW5nIHRvIG1v
dmUgdGhlIGNhbGwgb2YgdGhlIElPUkVRIGNvZGUgdG8gaHZtX2RvX3Jlc3VtZSgpIChvbiB4ODYp
IGFuZCBjaGVja19mb3JfdmNwdV93b3JrKCkgKG9uIEFybSkuDQo+Pg0KPj4gT2ssIEkgY2FuIG1v
dmUgdlBDSSBjb2RlIHRvIGh2bV9kb19yZXN1bWUsIGJ1dCB2UENJIGlzIG9ubHkgdXNlZCBmb3Ig
eDg2IFBWSCBEb20wLg0KPg0KPiBBRkFJSywgUm9nZXIgaXMgcGxhbm5pbmcgdG8gdXNlIGl0IGZv
ciB4ODYgUFZIIGd1ZXN0Lg0KPg0KPj4NCj4+IERvIHlvdSBzdGlsbCB0aGluayBodm1fZG9fcmVz
dW1lIGlzIHRoZSByaWdodCBwbGFjZT8NCj4gSSB0aGluayBzby4gQUZBSUNULCBvbiB4ODYsIHRo
ZSBvbmx5IGNhbGxlciBvZiB2Y3B1X2lvcmVxX2hhbmRsZV9jb21wbGV0aW9uKCkgaXMgaHZtX2Rv
X3Jlc3VtZSgpLiBTbyBpdCBtYWtlcyBzZW5zZSB0byBwdXNoIG9uZSBsYXllciB1cC4NCg0KT2ss
IHNvIEkgZW5kZWQgdXAgd2l0aDoNCg0KLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMNCisrKyBi
L3hlbi9hcmNoL2FybS90cmFwcy5jDQpAQCAtMjMwNSwxMCArMjMwNSwxNyBAQCBzdGF0aWMgYm9v
bCBjaGVja19mb3JfdmNwdV93b3JrKHZvaWQpDQogwqDCoMKgwqAgfQ0KIMKgI2VuZGlmDQoNCi3C
oMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOw0KLcKgwqDCoCBpZiAoIGhhc192cGNpKHYtPmRvbWFp
bikgJiYgdnBjaV9wcm9jZXNzX3BlbmRpbmcodikgKQ0KLcKgwqDCoMKgwqDCoMKgIHJhaXNlX3Nv
ZnRpcnEoU0NIRURVTEVfU09GVElSUSk7DQotwqDCoMKgIGxvY2FsX2lycV9kaXNhYmxlKCk7DQor
wqDCoMKgIGlmICggaGFzX3ZwY2kodi0+ZG9tYWluKSApDQorwqDCoMKgIHsNCivCoMKgwqDCoMKg
wqDCoCBib29sIHBlbmRpbmc7DQorDQorwqDCoMKgwqDCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgp
Ow0KK8KgwqDCoMKgwqDCoMKgIHBlbmRpbmcgPSB2cGNpX3Byb2Nlc3NfcGVuZGluZyh2KTsNCivC
oMKgwqDCoMKgwqDCoCBsb2NhbF9pcnFfZGlzYWJsZSgpOw0KKw0KK8KgwqDCoMKgwqDCoMKgIGlm
ICggcGVuZGluZyApDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCivCoMKg
wqAgfQ0KVGhpcyBpcyBob3cgaXQgaXMgZG9uZSBmb3IgSU9SRVEuIEl0IHNlZW1zIHRoZXJlIGlz
IG5vIG5lZWQgdG8gcmFpc2Ugc29mdGlycS4NCg0KSSBhbHNvIG1vdmVkIHZQQ0kgZnJvbSBjb21t
b24gY29kZSB0byBodm1fZG9fcmVzdW1lIGZvciB4ODYNCg0KPg0KPiBDaGVlcnMsDQo+DQpUaGFu
a3MsDQoNCk9sZWtzYW5kcg0K

