Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376222CA6DC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 16:20:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42169.75830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7SE-0000mw-6U; Tue, 01 Dec 2020 15:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42169.75830; Tue, 01 Dec 2020 15:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7SE-0000mX-2c; Tue, 01 Dec 2020 15:20:34 +0000
Received: by outflank-mailman (input) for mailman id 42169;
 Tue, 01 Dec 2020 15:20:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk7SB-0000mP-La
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 15:20:31 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 424ac773-b536-4afe-9604-cb4549e77c20;
 Tue, 01 Dec 2020 15:20:30 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1FEwPJ012102; Tue, 1 Dec 2020 15:20:29 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 355q3hgdks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 15:20:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5555.eurprd03.prod.outlook.com (2603:10a6:208:16d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Tue, 1 Dec
 2020 15:20:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 15:20:26 +0000
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
X-Inumbo-ID: 424ac773-b536-4afe-9604-cb4549e77c20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ne4e24vNTq7BGhOqI+cKdCEVddJykG/t/+Fb0I6Dmv5Ph/c+8GanJNKH6Sl0C0Hr837n+pEoT7AQk/dLHdUG+VQAULFJxUvfUY7Bh2ddcnvq77is3bE1g5Bjhkrg32h4zhJYEPJmcs+3XhJ6VXOYT42UA1+pkbJtsmksf5Z9C59E/6mjwwnMROeUbcNLhGJ3o7KORZuvZrcPXnWU6LOD4ojKpJMFqB+GBZPZa8lKD/u1XwV5PpHy3C2om13uXJrur8itDFcfY7K0fG0Z4K2j84Wt3Qs640rKKeHd3B1IlIDa18kLGm9t6y59E1MF1rXQG4SLvENqFF8XZ/EXAWLBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpHT8MI2KZOG8h1yXjHL9YFDFZiOlGf6i/sOnfTamDQ=;
 b=NKPVK94hbnoFAYk+FbcsmsKXi4GxCM/Kh+WUcBcXndNXcUDmlIT/FRi4qvgpdqcDyAoQZBKdKC509VNN9OyVo909wbVqNoBNufdcJnQjBzdzXrjPc8Ks0v8g6IuEKGTpthg6JPp3gkv3Y8y+Iwl2VLjRrJwsco/5FVTTDs722dD+jst0pMgniUJn30PIp4Oqbdk9BH5jKNa8a38K382cDNTltt+X9mDLgTwwFf6z0PglRMVOR0Y/LlNMeVqzMLsTykXAb+h7VzWWB52VRO+ET0fvKJKxVD/qsOdLcayGOVLi56M6anX1nMRg8rTewC3CIiNMTmlKgncseCa75jLa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpHT8MI2KZOG8h1yXjHL9YFDFZiOlGf6i/sOnfTamDQ=;
 b=mrMq+8hQr4uxZoK6kav6qJ79kmMt0fqf4ON2a85cE00ZS6qx4GM89rYYqSpzP2hhVF/soqFOiend0oJJoZovaidJIyDUxs9Duv6/aeAn8C1jViVXNjEsvh/tKePWqHnhnGZ5uFUiSZ9WxkHJlkEwhmtTwPH+/+Gn22U3EUBIL291JDznU+2TelLpjIJe0IE17owijkTvxRZtRULebq8lQhbHkNWCLnqrGnPZSNBpEtE48Kd61ezEU2T0s8ykNDoGO2p3Nf2xOBSJE03B3FJidmFEpK/DlxyWqlrHZ3nJdeuyOppiRcPwpwrQVr+56yHk2TGGc29F4f0qj23ECKUudQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/23] libxl: use COMPARE_PCI() macro
 is_pci_in_array()...
Thread-Topic: [PATCH v4 13/23] libxl: use COMPARE_PCI() macro
 is_pci_in_array()...
Thread-Index: AQHWx/V+Aj8+RUjOSEaa4IIEDCcUXQ==
Date: Tue, 1 Dec 2020 15:20:26 +0000
Message-ID: <7951d30a-006e-2c42-2373-117decfe4508@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-14-paul@xen.org>
In-Reply-To: <20201124080159.11912-14-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cbc9eba-2753-4e8e-eada-08d8960ca144
x-ms-traffictypediagnostic: AM0PR03MB5555:
x-microsoft-antispam-prvs: 
 <AM0PR03MB5555615CB3583C5002F7CD68E7F40@AM0PR03MB5555.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XjdTmkGz693yj+hWvniY+bkNN8DbSZ6ernHOlZT5QSOFBJC2HyqcE5fnIX4xgagoTJ+XuS0fratR0/6IVZciQFMJCxgFr012YRBDanGunqX6Wlciweh6W7l/rQoPCtPily3sGdvRMjpbwZ10fPecFwkpMtO7ewba9cE64P92G3NabSL0k86/61oEO8G4gBZyAvm7emaBUpjZGY86feReNJtW4JZGmAvmxL8ud6zdQUh0C+fc8lPXRSYAs7XvyYKEnvFRZKPIwFqvG4HxYgl8QebbiytxuNhzEjcO8xZmatkwNnaYlq+UEmEgJhd8MelbHkR8AS5pdBEpxFMseNpqXg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(498600001)(36756003)(8676002)(31696002)(8936002)(71200400001)(6512007)(5660300002)(2906002)(53546011)(4326008)(83380400001)(186003)(54906003)(31686004)(86362001)(76116006)(66946007)(110136005)(6506007)(2616005)(66446008)(6486002)(26005)(66556008)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?TkI5d3JVZXcwZHByd3U4R2RvcEI0bmd0TmVUbFAzSVJEMmF1VXpUR3I3TkEr?=
 =?utf-8?B?TFhaeGhXRngyYXRkdmE4dG1zU3Z3dTVhdFhKSktETW1BU0JRUlprb0l2bTBv?=
 =?utf-8?B?WXF6VDBGNHViU29wK0cxeEdFbHNnd2QrekdiZmJoeERoU0VUdXF1cndlM3Mw?=
 =?utf-8?B?RWFhUnRaRzRhWkJPWFdjTG9XaXJMRTdWQjVrNlZTbVJBVHZ0RUl3L0R0dGJz?=
 =?utf-8?B?NVgxNjZNMWVOMDh5b1ZKSlJKVC9FdHc2QmhyMXV0YTdxeTFkVjk0YXV1UDdn?=
 =?utf-8?B?ckF4WktoU2FsamlSZjFuRERwRmcwNy9UOUlGclFBOGp3Qjk0L0gvdTNRTzNW?=
 =?utf-8?B?YUJxc05qS2c2S0JlREdlY3NaVFJRVk9PQkJta0VWT3BBWjBIOTVPR2FtOG9z?=
 =?utf-8?B?RFhQeGdEWnZuU3pSdEpVTXRESUhqM2pGNWRaSWRVamJrRUhWbzErRDBxb2Nn?=
 =?utf-8?B?aG5TVnZEVVNEUHJFdzU0WlJkZWZORDZRcVpucjR0Rnl0RVRGZ1NHN1ROd0Vp?=
 =?utf-8?B?R2ZNUCtqN016b25rdnpVUE9mczJPeXgxRnZSQ2tkUmQweDlwWWxtWUY4NVFy?=
 =?utf-8?B?M3Ard2crTENqZGhmNlZ5MVN3OXppd2xJUEg1R3IrbWF6RGRtNmlXVjMxNVJY?=
 =?utf-8?B?d1FDODUzTmxsVEhYM0RmL0xxeVZNbk1vQmttLzZrTk9na21Rb1VyeEJ2bnhZ?=
 =?utf-8?B?Ly9lbWhQTi9VSEVpK2lCdGhDVFN3WFpzbkprdnhOZXZwN3MyMFVsVHVydEtP?=
 =?utf-8?B?ZlhVd2VFeFk2TlloNktxTmU3NTFjMXY2dVhJTHJJMFBWZTJnMFEvekhxOHFW?=
 =?utf-8?B?UEExL0RhUFU5bU9xclFGa2VEaU9lRVRVM2M2Y2pYU3JjaEtZbVZrM2JKYk9J?=
 =?utf-8?B?Yk45eXhSMEtHb1VUT3RpUnRTa1JjK3k5dXJwUlpzU1VJbklHQXBrSENQdWZR?=
 =?utf-8?B?NVl4bHZpa25yMmdtY0JCMzRNMW5JU3YwZG8zbVVRcXRYOUQrSnFmZ3AyRjBi?=
 =?utf-8?B?cjM1UEt1a2ovc2xjaFRsemxSNGJONUYxcDBocVpVZUgvREhOdVRRMmMyMFNX?=
 =?utf-8?B?ZlNpd1hXOFNXRFZQbVRvY3VZaHczZGtQcmlBc3N3K0VBbHB0Mk90dzhrc2kw?=
 =?utf-8?B?bE9HVW9NWTNSSVNJRWdqRCtGWlVtQ3VOVFRtWE1WOSs1NWlHOE1DTkkwS0pB?=
 =?utf-8?B?cDBSZWpzZE9saXFFSWJaYU5JU2dNTkt1ak43OERYaHk3d21kbjN4d0R5QkZJ?=
 =?utf-8?B?aHBJZ05HQm9BazFTdHlDeE1lWVU5L1hMVTRHT3RidDQ4RlRKOElsT3g5UnJZ?=
 =?utf-8?Q?GgqYiT7Elh5d6xiOv7FzyKOKF+Uua17gt9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E0AD44350126E41B1FB5CD6CC99927C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbc9eba-2753-4e8e-eada-08d8960ca144
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 15:20:26.1521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzW+/Mfc1jOceULjuPLifKo8IHimtkHzzbNdGgdbtXfrRPgPKgVLgShXDeNbXiYGSqIlqQAQi57gj4KU93gxlGtimeT7Lqkp+zhrs8FO0KMbLT3pD503v4MijfTKfo4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5555
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_07:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010098

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gLi4uIHJhdGhl
ciB0aGFuIGFuIG9wZW4tY29kZWQgZXF1aXZhbGVudC4NCj4NCj4gVGhpcyBwYXRjaCB0aWRpZXMg
dXAgdGhlIGlzX3BjaV9pbl9hcnJheSgpIGZ1bmN0aW9uLCBtYWtpbmcgaXQgdGFrZSBhIHNpbmds
ZQ0KPiAnbGlieGxfZGV2aWNlX3BjaScgYXJndW1lbnQgcmF0aGVyIHRoYW4gc2VwYXJhdGUgZG9t
YWluLCBidXMsIGRldmljZSBhbmQNCj4gZnVuY3Rpb24gYXJndW1lbnRzLiBUaGUgYWxyZWFkeS1h
dmFpbGFibGUgQ09NUEFSRV9QQ0koKSBtYWNybyBjYW4gdGhlbiBiZQ0KPiB1c2VkIGFuZCBpdCBp
cyBhbHNvIG1vZGlmaWVkIHRvIHJldHVybiAnYm9vbCcgcmF0aGVyIHRoYW4gJ2ludCcuDQo+DQo+
IFRoZSBwYXRjaCBhbHNvIG1vZGlmaWVzIGxpYnhsX3BjaV9hc3NpZ25hYmxlKCkgdG8gdXNlIGlz
X3BjaV9pbl9hcnJheSgpIHJhdGhlcg0KPiB0aGFuIGEgc2VwYXJhdGUgb3Blbi1jb2RlZCBlcXVp
dmFsZW50LCBhbmQgYWxzbyBtb2RpZmllcyBpdCB0byByZXR1cm4gYQ0KPiAnYm9vbCcgcmF0aGVy
IHRoYW4gYW4gJ2ludCcuDQo+DQo+IE5PVEU6IFRoZSBDT01QQVJFX1BDSSgpIG1hY3JvIGlzIGFs
c28gZml4ZWQgdG8gaW5jbHVkZSB0aGUgJ2RvbWFpbicgaW4gaXRzDQo+ICAgICAgICBjb21wYXJp
c29uLCB3aGljaCBzaG91bGQgYWx3YXlzIGhhdmUgYmVlbiB0aGUgY2FzZS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KUmV2aWV3ZWQtYnk6
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0KPiAtLS0NCj4gQ2M6IElhbiBKYWNrc29u
IDxpd2pAeGVucHJvamVjdC5vcmc+DQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiAtLS0N
Cj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFsLmggfCAgNyArKysrLS0tDQo+ICAg
dG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyAgICAgIHwgMzggKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDI4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oDQo+IGlu
ZGV4IGVjZWU2MWI1NDEuLjAyZjhhMzE3OWMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvbGln
aHQvbGlieGxfaW50ZXJuYWwuaA0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVy
bmFsLmgNCj4gQEAgLTQ3NDYsOSArNDc0NiwxMCBAQCB2b2lkIGxpYnhsX194Y2luZm8yeGxpbmZv
KGxpYnhsX2N0eCAqY3R4LA0KPiAgICAqIGRldmljZXMgaGF2ZSBzYW1lIGlkZW50aWZpZXIuICov
DQo+ICAgI2RlZmluZSBDT01QQVJFX0RFVklEKGEsIGIpICgoYSktPmRldmlkID09IChiKS0+ZGV2
aWQpDQo+ICAgI2RlZmluZSBDT01QQVJFX0RJU0soYSwgYikgKCFzdHJjbXAoKGEpLT52ZGV2LCAo
YiktPnZkZXYpKQ0KPiAtI2RlZmluZSBDT01QQVJFX1BDSShhLCBiKSAoKGEpLT5mdW5jID09IChi
KS0+ZnVuYyAmJiAgICBcDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAoYSktPmJ1cyA9
PSAoYiktPmJ1cyAmJiAgICAgIFwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIChhKS0+
ZGV2ID09IChiKS0+ZGV2KQ0KPiArI2RlZmluZSBDT01QQVJFX1BDSShhLCBiKSAoKGEpLT5kb21h
aW4gPT0gKGIpLT5kb21haW4gJiYgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgKGEp
LT5idXMgPT0gKGIpLT5idXMgJiYgICAgICAgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKGEpLT5kZXYgPT0gKGIpLT5kZXYgJiYgICAgICAgXA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGEpLT5mdW5jID09IChiKS0+ZnVuYykNCj4gICAjZGVmaW5lIENPTVBBUkVfVVNC
KGEsIGIpICgoYSktPmN0cmwgPT0gKGIpLT5jdHJsICYmIFwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoYSktPnBvcnQgPT0gKGIpLT5wb3J0KQ0KPiAgICNkZWZpbmUgQ09NUEFSRV9V
U0JDVFJMKGEsIGIpICgoYSktPmRldmlkID09IChiKS0+ZGV2aWQpDQo+IGRpZmYgLS1naXQgYS90
b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2ku
Yw0KPiBpbmRleCA1YTMzNTJjMmVjLi5lMGI2MTZmZTE4IDEwMDY0NA0KPiAtLS0gYS90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNp
LmMNCj4gQEAgLTMzNiwyNCArMzM2LDE3IEBAIHJldHJ5X3RyYW5zYWN0aW9uMjoNCj4gICAgICAg
cmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGludCBpc19wY2lfaW5fYXJyYXkobGli
eGxfZGV2aWNlX3BjaSAqYXNzaWduZWQsIGludCBudW1fYXNzaWduZWQsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQgZG9tLCBpbnQgYnVzLCBpbnQgZGV2LCBpbnQgZnVuYykNCj4g
K3N0YXRpYyBib29sIGlzX3BjaV9pbl9hcnJheShsaWJ4bF9kZXZpY2VfcGNpICpwY2lzLCBpbnQg
bnVtLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV9wY2kgKnBj
aSkNCj4gICB7DQo+ICAgICAgIGludCBpOw0KPiAgIA0KPiAtICAgIGZvcihpID0gMDsgaSA8IG51
bV9hc3NpZ25lZDsgaSsrKSB7DQo+IC0gICAgICAgIGlmICggYXNzaWduZWRbaV0uZG9tYWluICE9
IGRvbSApDQo+IC0gICAgICAgICAgICBjb250aW51ZTsNCj4gLSAgICAgICAgaWYgKCBhc3NpZ25l
ZFtpXS5idXMgIT0gYnVzICkNCj4gLSAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAtICAgICAgICBp
ZiAoIGFzc2lnbmVkW2ldLmRldiAhPSBkZXYgKQ0KPiAtICAgICAgICAgICAgY29udGludWU7DQo+
IC0gICAgICAgIGlmICggYXNzaWduZWRbaV0uZnVuYyAhPSBmdW5jICkNCj4gLSAgICAgICAgICAg
IGNvbnRpbnVlOw0KPiAtICAgICAgICByZXR1cm4gMTsNCj4gKyAgICBmb3IgKGkgPSAwOyBpIDwg
bnVtOyBpKyspIHsNCj4gKyAgICAgICAgaWYgKENPTVBBUkVfUENJKHBjaSwgJnBjaXNbaV0pKQ0K
PiArICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICByZXR1cm4gMDsN
Cj4gKyAgICByZXR1cm4gaSA8IG51bTsNCj4gICB9DQo+ICAgDQo+ICAgLyogV3JpdGUgdGhlIHN0
YW5kYXJkIEJERiBpbnRvIHRoZSBzeXNmcyBwYXRoIGdpdmVuIGJ5IHN5c2ZzX3BhdGguICovDQo+
IEBAIC0xNDg3LDIxICsxNDgwLDE3IEBAIGludCBsaWJ4bF9kZXZpY2VfcGNpX2FkZChsaWJ4bF9j
dHggKmN0eCwgdWludDMyX3QgZG9taWQsDQo+ICAgICAgIHJldHVybiBBT19JTlBST0dSRVNTOw0K
PiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgbGlieGxfcGNpX2Fzc2lnbmFibGUobGlieGxfY3R4
ICpjdHgsIGxpYnhsX2RldmljZV9wY2kgKnBjaSkNCj4gK3N0YXRpYyBib29sIGxpYnhsX3BjaV9h
c3NpZ25hYmxlKGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9kZXZpY2VfcGNpICpwY2kpDQo+ICAgew0K
PiAgICAgICBsaWJ4bF9kZXZpY2VfcGNpICpwY2lzOw0KPiAtICAgIGludCBudW0sIGk7DQo+ICsg
ICAgaW50IG51bTsNCj4gKyAgICBib29sIGFzc2lnbmFibGU7DQo+ICAgDQo+ICAgICAgIHBjaXMg
PSBsaWJ4bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVfbGlzdChjdHgsICZudW0pOw0KPiAtICAgIGZv
ciAoaSA9IDA7IGkgPCBudW07IGkrKykgew0KPiAtICAgICAgICBpZiAocGNpc1tpXS5kb21haW4g
PT0gcGNpLT5kb21haW4gJiYNCj4gLSAgICAgICAgICAgIHBjaXNbaV0uYnVzID09IHBjaS0+YnVz
ICYmDQo+IC0gICAgICAgICAgICBwY2lzW2ldLmRldiA9PSBwY2ktPmRldiAmJg0KPiAtICAgICAg
ICAgICAgcGNpc1tpXS5mdW5jID09IHBjaS0+ZnVuYykNCj4gLSAgICAgICAgICAgIGJyZWFrOw0K
PiAtICAgIH0NCj4gKyAgICBhc3NpZ25hYmxlID0gaXNfcGNpX2luX2FycmF5KHBjaXMsIG51bSwg
cGNpKTsNCj4gICAgICAgbGlieGxfZGV2aWNlX3BjaV9hc3NpZ25hYmxlX2xpc3RfZnJlZShwY2lz
LCBudW0pOw0KPiAtICAgIHJldHVybiBpICE9IG51bTsNCj4gKw0KPiArICAgIHJldHVybiBhc3Np
Z25hYmxlOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBkZXZpY2VfcGNpX2FkZF9zdHVi
ZG9tX3dhaXQobGlieGxfX2VnYyAqZWdjLA0KPiBAQCAtMTgzNCw4ICsxODIzLDcgQEAgc3RhdGlj
IHZvaWQgZG9fcGNpX3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsIHBjaV9yZW1vdmVfc3RhdGUgKnBy
cykNCj4gICAgICAgICAgIGdvdG8gb3V0X2ZhaWw7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICBh
dHRhY2hlZCA9IGlzX3BjaV9pbl9hcnJheShwY2lzLCBudW0sIHBjaS0+ZG9tYWluLA0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5j
KTsNCj4gKyAgICBhdHRhY2hlZCA9IGlzX3BjaV9pbl9hcnJheShwY2lzLCBudW0sIHBjaSk7DQo+
ICAgICAgIGxpYnhsX2RldmljZV9wY2lfbGlzdF9mcmVlKHBjaXMsIG51bSk7DQo+ICAgDQo+ICAg
ICAgIHJjID0gRVJST1JfSU5WQUw7

