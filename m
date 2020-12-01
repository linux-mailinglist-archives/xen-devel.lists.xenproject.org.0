Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434572CA380
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 14:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42013.75554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5TW-0003Vx-2u; Tue, 01 Dec 2020 13:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42013.75554; Tue, 01 Dec 2020 13:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5TV-0003VY-Vx; Tue, 01 Dec 2020 13:13:45 +0000
Received: by outflank-mailman (input) for mailman id 42013;
 Tue, 01 Dec 2020 13:13:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk5TU-0003VS-FO
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 13:13:44 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e6c9e84-e9c2-4ffc-9bdb-881248c158fc;
 Tue, 01 Dec 2020 13:13:43 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1DA1Nv008856; Tue, 1 Dec 2020 13:13:42 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 353ybc6raj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 13:13:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3716.eurprd03.prod.outlook.com (2603:10a6:208:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Tue, 1 Dec
 2020 13:13:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 13:13:36 +0000
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
X-Inumbo-ID: 5e6c9e84-e9c2-4ffc-9bdb-881248c158fc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5MHKD+9dD1r6wYhB7+5bhQrFOM+sx1KJC6lQved12nvoez5yGt0pZawB5ggH8VVbN8vz36jiFtMnh/1Fm7D1YqhRdBCRyaISbO32D3bdU+MtlvWJ33H9X/ZHUzgV4E+kmg90FSUcMRccsoBqCeIWjAuSGkPVy44y2wZMPokLAQar4wPdohmt93TguXq4Gy6naqBv3hRqbwVI2sErUqmsCxiL5FCtQIn8NosPSXMcRPVE/HI5QgZqMprufKABXUXOwss7g3v9tuqFq0DhLdI6guvzfDqus8hw2B0xvVb+FSRpvBDfgSxqivN6V4YiGp6wC1q7WQimZytaG5weENKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSZK4GsuDxjXeeDPQJFPwK6N7RDuYzRGJ4q4fzKFPlY=;
 b=CmGGcKtO2saonGHhbsYfRA1cGVjsWtOHBq3hyzpDHYepcM4x50pTX7nn59Y1c1vYFvOxXNa8DYeU0mI5onVUZL+cvrV7nmNO657m9eBiY4mkhX9T6s1/Ink/ejGNYgUi4+R7ZofMMlxVEPlW6PwtmYgOqujyYtSxiVfnn9oAerMMKFoK7B6miSvnD9oxo82IQ5WYtfgDOY4hszST3hOt62b2qRLz9kVA1+stfi/SQwlcp8BnKZqjYjNePs3td6E4lzRXHvo4jLr+eXoTn+Hn9sooppOr50pQZ0z18iO1JKZrY5xKhoPADr2Nvm1avj7WHkYUuB2gocS8TP/kNPYMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSZK4GsuDxjXeeDPQJFPwK6N7RDuYzRGJ4q4fzKFPlY=;
 b=aaXtJgcGHtGiiDjQi1RZG9ekSQ7EXsNPZcvH5F0xH9T9plMcwAU4aKQ5Gj/MVnrzGfiBGrqnNOVZIxUX8/FnDI3p4YQaNvlcAio8Xq2UI/rSxcyXhyuetneXy44vXMM7qSp26Tv2CmjTOO0yz8HASEojCM2JHtIWIYAToV8ATW4NqGtbsNk4ARYqRYXXKEfq1d5eWhyftpO1lUEmZWuc8WdOBOBDQHoBXOx4QUrwUPz/b/LIFmLvcKeGlCA1uZVmZ1DolM4O/g3cqTdOjMHw6f+okqgdmpNksC0STfTy4rG/Py7QMDVYXZIxq5b5j9hDH/xAslnWkp5VyASplUyhmQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v4 04/23] libxl: add/recover 'rdm_policy' to/from PCI
 backend in xenstore
Thread-Topic: [PATCH v4 04/23] libxl: add/recover 'rdm_policy' to/from PCI
 backend in xenstore
Thread-Index: AQHWx+PHjW13DPVvRE2wVjnAvNUDaw==
Date: Tue, 1 Dec 2020 13:13:36 +0000
Message-ID: <d37041d4-c0f8-8347-0e2d-c50bac78eb6f@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-5-paul@xen.org>
In-Reply-To: <20201124080159.11912-5-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20858cdd-02f4-4776-790d-08d895fae9a1
x-ms-traffictypediagnostic: AM0PR03MB3716:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3716EA8A4B52AA4DF06B8563E7F40@AM0PR03MB3716.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dg3yeh8k/vk9cOd/w/5/OFHrMKGM7jvY36Fr3U7IUN7fDDl+kQZKbaT4LPebabD6TfeqlS9O33qtt9GCLd1umfbooGbnv4sthnIsHzPGnyCiGcQkNBbt/lYYeKhlGaMu/kcbYg3RXYkXtVTNxF4Nf4hlayM3G2+H5fsUMi5+t8iczo9npVeBKg7bWSUV2U4A+ygMj6UxMK5V++1bwfKcy7ANiDnraePnLFXBTf5uGmJDEhlREpFYmqlo+NB55WIqVmIiruz406mngirye+4T9WJ4pPiWCw1jQywO7VLh0McMAWFZOR3Ij+i/GlSeaE+X3/Ba4kjqEucM4PGBrhllaA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(8936002)(2906002)(31696002)(86362001)(4326008)(478600001)(83380400001)(71200400001)(6486002)(316002)(5660300002)(110136005)(186003)(2616005)(36756003)(54906003)(26005)(6506007)(76116006)(6512007)(53546011)(66556008)(64756008)(66946007)(66476007)(66446008)(31686004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RmRMdEhONVpobUx4cDdHVUszL3I1WWdQZEx1cU9zWWVJZUdGWlBRN016N3NE?=
 =?utf-8?B?NVNOYzQ3R2lvUjJob0lDRGY0bHl3TVNtQlhmY3FJNUk3YWJOOHFubWh1bXF4?=
 =?utf-8?B?eGxJSisrYlVoRDFWcjYvZmd4emR6eVQ5MUpNSEk4SmdZRmRNS1N1SXNNa3kr?=
 =?utf-8?B?MGkydk0wMThjeGsyc3FFclNiUlBlSThiMXNtYzA1MEZFVjQwUVRHU3JxbHEx?=
 =?utf-8?B?ZzF0Z3h5aXBaWjFsblhwL3dNZXQ0WmdIenR6WDVHazZBVThIdFVHS1pkTTRW?=
 =?utf-8?B?TEVxVVNRTVlqcDNDUHJwWlVFSVprbjd4dzFUREw3a3ZIWFFWZ1poMzg3aTZi?=
 =?utf-8?B?dDEwUWUxNjNtNW9uYmlUL21VRGxtZE5hZFpwVjUrbUtOT3FBbjFienZyWGFB?=
 =?utf-8?B?SkRsYzBhVU45Sk51OFVMRmV2YVNGWEpGNjZKYXZ5ajZyWDlwYlNPai80OVd3?=
 =?utf-8?B?d1l0RGNIVnFLc3dkeWpNYkExMDE1OGdYTnVhM1ZKdHlLZnQzVGQycnhyS2xB?=
 =?utf-8?B?VE1LOUVJSjZrYVpSNkJEWE4zMHlLUVJTRDEvNlJCdHgveWdhL05NWE1DM2Vj?=
 =?utf-8?B?eHNNOUZDbzJ0STJqRkZtNDN3aTZJWlgxZ2pkSzEzdG4zNnhGczdkRzk4WFJH?=
 =?utf-8?B?dHp1MHZHUTZjb2pOWmYxeWxMMUNZQmZnQU8wdDc4d0JPQXNmcGwvZ05UVEFn?=
 =?utf-8?B?UUhkUTBaSVVVb3VUc29QdFQ2bGc3ZjVydytpM3dONmYyNzUxK2JXeUpkWUYw?=
 =?utf-8?B?RExSTjZyOVZGcUg0MDdMNWpTVUxWLzdQWEk0RWthbmVuOCtwUFFROU52VHpB?=
 =?utf-8?B?YW9idzE1MGpNQVdEMUVyVHBXZTJmQzJjYnNnYW12T3N0eENZR2NNOUV3UC9E?=
 =?utf-8?B?cEhpV1g5MWV1VEVRR3Fhd095cFdJVVpJajcrdFB6bDBHeDZhVmFRSzRuRE1q?=
 =?utf-8?B?UHJ0aXc5dVc4RDk5TGV1OTdHK1c0ZDRrYXpTQmJidTV0cURZbDk1b01vRjR3?=
 =?utf-8?B?OW02MHdRdVlNazF2NUF0TjI3QlpyWEJlclJST0p0OEhQblJXaE82T05LbmlU?=
 =?utf-8?B?ZUZ3Q2pOcFhYdmp6blZFYUFoSDJKdjUzMW9ndTRnVDF3ZkpoTWlCSm03bUNu?=
 =?utf-8?B?Z2lLUy9zZnRkZWlWekEvcmwydVAxTHBoQ1RWVjhKZE1Bc3Z0TFhBSGtmaC9o?=
 =?utf-8?B?TkVVUkdPMW9PVU5BM093dDlWLzJDTWo2VDNDU2d2bmMrSHNqNUFBYnI2bXMx?=
 =?utf-8?B?MDhWNjM0eVBLSWo4TUtaUkJSNWJpMEZmd3VxYmdLdWdEWlhjTDlvVDlmV1ZJ?=
 =?utf-8?Q?w9732+Il1Uo7vpclYAnb/L38hMM18BH7Ju?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D2F2D770C743B438E95DA9FF3AE9C2C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20858cdd-02f4-4776-790d-08d895fae9a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 13:13:36.6334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2Kpa/z/IosJFAFJuFLC28JMvU74C6NYQXaz+9Nm12xuukHDM6TTA5ofVj4SRZJDHLFRBMVyxC/NQraBIhRxYF51AB0EI4ltWfV+/EAmf4KblEh9LJKsJxBK01jGQIk2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3716
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_05:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010084

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gT3RoZXIgcGFy
YW1ldGVycywgc3VjaCBhcyAnbXNpdHJhbnNsYXRlJyBhbmQgJ3Blcm1pc3NpdmUnIGFyZSBkZWFs
dCB3aXRoDQo+IGJ1dCAncmRtX3BvbGljeScgYXBwZWFycyB0byBiZSBoYXZlIGJlZW4gY29tcGxl
dGVseSBtaXNzZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHIN
Cg0KPiAtLS0NCj4gQ2M6IElhbiBKYWNrc29uIDxpd2pAeGVucHJvamVjdC5vcmc+DQo+IENjOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiAtLS0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3Bj
aS5jIHwgOSArKysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9w
Y2kuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4gaW5kZXggZGEwMWM3N2JhMi4u
NTBjOTZjYmZhNiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0K
PiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+IEBAIC02MSw5ICs2MSw5IEBA
IHN0YXRpYyB2b2lkIGxpYnhsX2NyZWF0ZV9wY2lfYmFja2VuZF9kZXZpY2UobGlieGxfX2djICpn
YywNCj4gICAgICAgICAgIGZsZXhhcnJheV9hcHBlbmRfcGFpcihiYWNrLCBHQ1NQUklOVEYoInZk
ZXZmbi0lZCIsIG51bSksIEdDU1BSSU5URigiJXgiLCBwY2ktPnZkZXZmbikpOw0KPiAgICAgICBm
bGV4YXJyYXlfYXBwZW5kKGJhY2ssIEdDU1BSSU5URigib3B0cy0lZCIsIG51bSkpOw0KPiAgICAg
ICBmbGV4YXJyYXlfYXBwZW5kKGJhY2ssDQo+IC0gICAgICAgICAgICAgIEdDU1BSSU5URigibXNp
dHJhbnNsYXRlPSVkLHBvd2VyX21nbXQ9JWQscGVybWlzc2l2ZT0lZCIsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBjaS0+bXNpdHJhbnNsYXRlLCBwY2ktPnBvd2VyX21nbXQsDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+cGVybWlzc2l2ZSkpOw0KPiArICAg
ICAgICAgICAgICBHQ1NQUklOVEYoIm1zaXRyYW5zbGF0ZT0lZCxwb3dlcl9tZ210PSVkLHBlcm1p
c3NpdmU9JWQscmRtX3BvbGljeT0lcyIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwY2kt
Pm1zaXRyYW5zbGF0ZSwgcGNpLT5wb3dlcl9tZ210LA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgcGNpLT5wZXJtaXNzaXZlLCBsaWJ4bF9yZG1fcmVzZXJ2ZV9wb2xpY3lfdG9fc3RyaW5nKHBj
aS0+cmRtX3BvbGljeSkpKTsNCj4gICAgICAgZmxleGFycmF5X2FwcGVuZF9wYWlyKGJhY2ssIEdD
U1BSSU5URigic3RhdGUtJWQiLCBudW0pLCBHQ1NQUklOVEYoIiVkIiwgWGVuYnVzU3RhdGVJbml0
aWFsaXNpbmcpKTsNCj4gICB9DQo+ICAgDQo+IEBAIC0yMzc0LDYgKzIzNzQsOSBAQCBzdGF0aWMg
aW50IGxpYnhsX19kZXZpY2VfcGNpX2Zyb21feHNfYmUobGlieGxfX2djICpnYywNCj4gICAgICAg
ICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAocCwgInBlcm1pc3NpdmUiKSkgew0KPiAgICAgICAg
ICAgICAgICAgICBwID0gc3RydG9rX3IoTlVMTCwgIiw9IiwgJnNhdmVwdHIpOw0KPiAgICAgICAg
ICAgICAgICAgICBwY2ktPnBlcm1pc3NpdmUgPSBhdG9pKHApOw0KPiArICAgICAgICAgICAgfSBl
bHNlIGlmICghc3RyY21wKHAsICJyZG1fcG9saWN5IikpIHsNCj4gKyAgICAgICAgICAgICAgICBw
ID0gc3RydG9rX3IoTlVMTCwgIiw9IiwgJnNhdmVwdHIpOw0KPiArICAgICAgICAgICAgICAgIGxp
YnhsX3JkbV9yZXNlcnZlX3BvbGljeV9mcm9tX3N0cmluZyhwLCAmcGNpLT5yZG1fcG9saWN5KTsN
Cj4gICAgICAgICAgICAgICB9DQo+ICAgICAgICAgICB9IHdoaWxlICgocCA9IHN0cnRva19yKE5V
TEwsICIsPSIsICZzYXZlcHRyKSkgIT0gTlVMTCk7DQo+ICAgICAgIH0=

