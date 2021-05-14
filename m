Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC25380683
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 11:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127307.239241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUTG-0003Dt-Rf; Fri, 14 May 2021 09:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127307.239241; Fri, 14 May 2021 09:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUTG-0003Bm-OV; Fri, 14 May 2021 09:51:02 +0000
Received: by outflank-mailman (input) for mailman id 127307;
 Fri, 14 May 2021 09:51:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AsHw=KJ=epam.com=prvs=5768ae630b=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1lhUTE-0003Bg-D8
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 09:51:00 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ed74cc5-bf3c-40b8-a66c-889acdf13a0f;
 Fri, 14 May 2021 09:50:59 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14E9j5uc031807; Fri, 14 May 2021 09:50:58 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 38hnhp09a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 09:50:57 +0000
Received: from AM4PR0301MB2273.eurprd03.prod.outlook.com (2603:10a6:200:4d::6)
 by AM0PR03MB4385.eurprd03.prod.outlook.com (2603:10a6:208:c9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 09:50:53 +0000
Received: from AM4PR0301MB2273.eurprd03.prod.outlook.com
 ([fe80::e190:2560:abbf:5e7d]) by AM4PR0301MB2273.eurprd03.prod.outlook.com
 ([fe80::e190:2560:abbf:5e7d%8]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 09:50:52 +0000
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
X-Inumbo-ID: 5ed74cc5-bf3c-40b8-a66c-889acdf13a0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGJ2gGLeI2yl5+p4kDcrrTnslO+MFoEIrE1e/jVaEkgYa4+7EITGVFOK6oQro3c7/Ylfz0O3V1SJi7Z1EiEb3tXbMgsaekmLkrJNuRghwFC0mubCn+KDB0OJB1Xf/BSpZiFdBVONmdle89JX/CvnODjlm4ek3039Cle2PIdW1TwaVC9mM+B2XW1jcj8iw2Gez6d7hlKUqNGra4fZ4GjiLrHXNDg1GXe6n4hEbs0LsnLDn4tIKITbQRWpGcLqcyOnG/SSDjq3BQPwCZ3mh4Tw5KhqK2QRBiEhERTyoS6S8cKTWVqVSgj2DmLaYmw10Hwla+AYjLmNH1L/efJtva5kxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6M4KT2dC5AM7/cluheRXqKEVIlG68301meUjndXrnA=;
 b=Esh5+dooychwQ6dpSOzSYL48alnBRLHSLPPzVkg7yfYi1xAknrJXT6YTvoR4lIpNMoa2ZszAYTmJYr74FKwALOIzOqetQqzDbA1Cjm2WuIvA2vkumq3DbGsCdalV+Uspq+ue8e80nHdC3fUw8/RqagnXwqt+a8rxO+zO8Ydu6gZChjBdFPmOnAa7skkDwas+QDDVN8JL5bYlBoNRk8zulJp/qbRkFxhJ+Fex//EG1yX7zlwJbheuuDFHhJuZAFgf73NTy2tlGXp/ihha8NPrIiW21xmaltMIauI1QgCsyuVhECW0erO+Z0QbDSv8/rZ4AV7mGUiZJxMndkSEKEgzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6M4KT2dC5AM7/cluheRXqKEVIlG68301meUjndXrnA=;
 b=OPL4Kih7rKZ3muqPlPaQw692vxXbjLOkZesQZtQAl7lL1umKiuI8RB0nadXrAk1etXrzba5Z0VrpH6wKi3po/Kaq4qZBKFdnTaoj6yUGk5Q2Llnad0V8/ZG8mnpXV5GLbflz4EUcKdMbbVHwormaxfaUyZ7YuKGtHyGOz9ZPLr3uoLy8iw5kHFiweNt4t0fqHOi23v5ZIabVmpY/WDujFLvHmOJMRfp1NANGLJogKALCBfFdSqDwX7IyuVEhBiVdLEsfXRqsgyw381rw/cQcXytk0t41vGnfDQg+MVXFLDsiqC7en3OxL9qMjxpkPXrawM0MauGKpjopv+IQ40vDIA==
From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
To: "julien@xen.org" <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: Hand over of the Xen shared info page
Thread-Topic: Hand over of the Xen shared info page
Thread-Index: AQHXR86B8dxtD5lx60CgXee9ciHSoarhFtmAgAGmygA=
Date: Fri, 14 May 2021 09:50:52 +0000
Message-ID: <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
	 <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
In-Reply-To: <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 910ce89b-7c7b-46af-9cf6-08d916bdc33d
x-ms-traffictypediagnostic: AM0PR03MB4385:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB43853E00C501B3BFCC2C8B24F2509@AM0PR03MB4385.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5LHIjl9zInvBXpbTLPKbzv9AbPSzXLJ6WZf4iAfASzG7n2J21rQGRVPWJBXKFMdPRaUPq+4dVXpK4DCSrRyz7uYvJ03ofAL8suIb0C8mUFRgKVyh4KYH8/m1VFDwM3+B1riJMAz30m25/KTZxdUUPF8SC1pikRNLi/t0EnkBjRJ6HTfHXEHE56hLifKsWXVP2A1/ydXb/KIadA4TViTfaO77hkQADtr0bZavLi3D57KnKLFo/lafNmXslkijTUBs9Kn9x4wKJixNog/YvwOOVgIxy/QKV5R+8AF7d6+sq31YwnA2qBEMPYJk3+SU259d8tYRjnFgvCSrclTzn9EuU983qG/mMuoRgTGUjvHs1crdODbW2oGLav1CAPaHuzICQ+eq38vcDVO2Y3cV4LM66nJ+IHqjLycxt7OXeS4hdl7ORpE9ZqXprQv6S67du2iSZP0hN/FpxT/W4EXDlmWIj8VvEqL1CORDUVbL2JzM3mndMe0cUOmpNxRZedto9t3VKZvcCe/n4wCR5HnAdTAG3WF0l7NYlX9MsYphQBj1w/5hkQ0LkO2Ai+xneQMRL/elDLPKUV89l2s7yydP5m436oK5hd8QTll2AM4EnbDR10s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0301MB2273.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(64756008)(66946007)(8936002)(38100700002)(66446008)(66556008)(66476007)(122000001)(86362001)(55236004)(54906003)(91956017)(8676002)(53546011)(110136005)(316002)(26005)(36756003)(5660300002)(76116006)(107886003)(83380400001)(186003)(2616005)(478600001)(2906002)(6506007)(71200400001)(4326008)(6486002)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?UElDeFFRK1ZibEdJOGFKZVFqTGNINHN4ek5LMHpWZ21lZ0pvV1FiYjM5QmFS?=
 =?utf-8?B?WVRxTGZGOE55eWIzdzRUMXUzQmkrcjc2WGhudGUyaXJ3SE1iSFFXMXNaUVBt?=
 =?utf-8?B?TkR3WldqN01VVkJmTEltdHI4RFZxTExtcTVjTlpkRUdkemNGWlRaV2ZhVFQw?=
 =?utf-8?B?Z3JyS1d5VUJWbDRlOWVmNlNYU3RDN0pjOHEzVUs5YU80MzRYelByNHZCL2Na?=
 =?utf-8?B?LzQxZ0EzMjNQUjFMK2QzR3dLUTdJRlovcE9FcENxbEZvOW1Kb0RLUjh3RFNo?=
 =?utf-8?B?TlBPOFZXV3VYaVdRUXhLa3hkWnd4WEFoaS9wWTNMMFZ2eklVOFcrY2NTbG4x?=
 =?utf-8?B?TFMycW1paEtJT0VGb1MwWG9RU0oveVFWaGNhWGcvQ082LzZlakpnME54LzFJ?=
 =?utf-8?B?OTJFZk5wdnhZTFIwSkFDZ21oQnpyVXA2ZGk3SmlqSFR6enppb3dTNmNrK3R4?=
 =?utf-8?B?dGo2aUNKUEV3QW93dzMydkRaVXdycytqOWdBMXZ5U2xJQkhaMThMdnFZL3hW?=
 =?utf-8?B?VTJFV3dZbU9Vd3lNOENPSTlBbW5ZbmhtdW5iL2FRWCtucDIvZy9wY3gwRWFW?=
 =?utf-8?B?ZHVyVEUvMFVqWWV3SnR0OElOOWRqNVNCY2F3a2R3dFRxWWllbk4raVR3Y1g3?=
 =?utf-8?B?dTNzcVVoZm1vZ0xZc1Y3NFRpYjlNczJwUFJYMFlSTjZ1RjBodUFxWm5WbDhG?=
 =?utf-8?B?QjN6U3pYZ0RjQm5naDJNdmZVMjRPaDJqM2d4VlVpM2pMRlNpa1o4VkJkZG5a?=
 =?utf-8?B?KzhnbGdFMGE4bEZ3YUczd1U2TWpyUTRBa3FXVm1YRFVJNEp0RkJSN3grcTcx?=
 =?utf-8?B?djFWYnVtN01YRzdEYzBQVnJxM1UwTWZyb2RTdE5DaWx4dys5VVhwNzQ2bHFK?=
 =?utf-8?B?RVh5a3FyS0JtZzd6cDVOSzFldmtoeUgwSDE2b1JYUjVlUzNTblp2eFIrT0kw?=
 =?utf-8?B?NmZHY2l1NGQrTkp5ZmpQT0R3bG1ocVA3cEp5VjNOUlZRZytQYVhDWTREWHBq?=
 =?utf-8?B?dEVaSWdhTSttaDVleXpJbjhjdEgrSUhzT01VRTJrQUd3clVYM1J0RGJwbmlS?=
 =?utf-8?B?bnM3Nkkyc24raTlWNFJhVkQzQkpjcmpCTGRScURSVHpndFd6WlBDOWNHNjh6?=
 =?utf-8?B?R1Q2NEJMbi9Ub1pORnljelYwRElQaE1hUTBZMWhZM1lHelpRQW1LR2Q1eEFH?=
 =?utf-8?B?NmtuNmxEMlhzTERyeFRqNWJQZnNNUmRhQkdyL01xZ0xOcFdIVTNicHI2am8v?=
 =?utf-8?B?dUg2NGZMNjFHY2lIeDU1dTl2UHpLWDBQQnhEV2hNTk9xQ2ZaWGc0Nk5xMzRr?=
 =?utf-8?B?anp6d2ZSdkhXR2QvbEFYRHFnWXZsM0ZoRU5mUXMzcmVkeXNQUWJNMHpBR3Yr?=
 =?utf-8?B?SWhDV1JqMmovdmZ2c1NCMWdiSklCNGd2YTY2QVhHRGpmVEtGYmFPT0hROFFu?=
 =?utf-8?B?eG9JTDdOTE1wMWdVYi9YVHhlby9JcXZIRjVsYXZySk5OQWNTNktlU1BDL05h?=
 =?utf-8?B?YVc1SEZKbGZmdmJFWGc1TGRiZitzMldpMllkV2FDVnhNZzJSeCtqSGZFSVho?=
 =?utf-8?B?ZTZNZjljK3pCRHphS1BnVVV1RCs5MGFhTzRGS0I2T0k0VG5pS1JkczQvZXVM?=
 =?utf-8?B?TTZ2c1dYdVhBY3BjbG1EcWpuRDZjUlRZM0NTb3duUHpuYkhhMmI3RlZGV0E2?=
 =?utf-8?B?T3pIZ05BMTQyRVRRazEybUlHcGNvOVgwRWM2elZycncwcW1qNjF1NmVyUm5u?=
 =?utf-8?Q?vcsJfAvOqtVjbP6udRAAUGlFFXm0ymn1i3hgq+f?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B801330A931AF3409997206AC0BDBD10@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0301MB2273.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910ce89b-7c7b-46af-9cf6-08d916bdc33d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 09:50:52.8931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJQXfXhuyTqdDinjmNyh0ypMcMUnyGrqTt8ldjq4bHCB/5DZCT8Hm7hH3Ic5emPsYpHJdd4GgHTl6aQ+s2FZuyKmLar0zAr8mUNKCpkIQBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4385
X-Proofpoint-GUID: rqqcuZHCW2buPOmtFW11UUSCKiLAm1iG
X-Proofpoint-ORIG-GUID: rqqcuZHCW2buPOmtFW11UUSCKiLAm1iG
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxlogscore=834 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105140073

SGkgSnVsaWVuIQ0KDQpPbiBUaHUsIDIwMjEtMDUtMTMgYXQgMDk6MzcgKzAxMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gDQo+IE9uIDEzLzA1LzIwMjEgMDk6MDMsIEFuYXN0YXNpaWEgTHVraWFu
ZW5rbyB3cm90ZToNCj4gPiBIaSBhbGwsDQo+IA0KPiBIaSwNCj4gDQo+ID4gVGhlIHByb2JsZW0g
ZGVzY3JpYmVkIGJlbG93IGNvbmNlcm5zIGNhc2VzIHdoZW4gYSBzaGFyZWQgaW5mbyBwYWdlDQo+
ID4gbmVlZHMgdG8gYmUgaGFuZGVkIG92ZXIgZnJvbSBvbmUgZW50aXR5IGluIHRoZSBzeXN0ZW0g
dG8gYW5vdGhlciwNCj4gPiBmb3INCj4gPiBleGFtcGxlLCB0aGVyZSBpcyBhIGJvb3Rsb2FkZXIg
b3IgYW55IG90aGVyIGNvZGUgdGhhdCBtYXkgcnVuDQo+ID4gYmVmb3JlDQo+ID4gdGhlIGd1ZXN0
IE9TJyBrZXJuZWwuDQo+ID4gTm9ybWFsbHksIHRvIG1hcCB0aGUgc2hhcmVkIGluZm8gcGFnZSBn
dWVzdHMgYWxsb2NhdGUgYSBtZW1vcnkgcGFnZQ0KPiA+IGZyb20gdGhlaXIgUkFNIGFuZCBtYXAg
dGhlIHNoYXJlZCBpbmZvIG9uIHRvcCBvZiBpdC4gU3BlY2lmaWNhbGx5DQo+ID4gd2UNCj4gPiB1
c2UgWEVOTUFQU1BBQ0Vfc2hhcmVkX2luZm8gbWVtb3J5IHNwYWNlIGluICBYRU5NRU1fYWRkX3Rv
X3BoeXNtYXANCj4gPiBoeXBlcmNhbGwuICBBcyB0aGUgaW5mbyBwYWdlIGV4aXN0cyB0aHJvdWdo
b3V0IHRoZSBndWVzdCBleGlzdGVuY2UNCj4gPiB0aGlzDQo+ID4gZG9lc24ndCBodXJ0IHRoZSBn
dWVzdCwgYnV0IHdoZW4gdGhlIHBhZ2UgZ2V0cyBvdXQgb2YgYWNjb3VudGluZywNCj4gPiBlLmcu
DQo+ID4gYWZ0ZXIgYm9vdGxvYWRlciBqdW1wcyB0byBMaW51eCBhbmQgdGhlIHBhZ2UgaXMgbm90
IGhhbmRlZCBvdmVyIHRvDQo+ID4gaXQsDQo+ID4gdGhlIG1hcHBlZCBwYWdlIGJlY29tZXMgYSBw
cm9ibGVtLg0KPiA+IENvbnNpZGVyIHRoZSBjYXNlIHdpdGggVS1ib290IGJvb3Rsb2FkZXIgd2hp
Y2ggYWxyZWFkeSBoYXMgWGVuDQo+ID4gc3VwcG9ydC4NCj4gPiBUaGUgVS1ib2904oCZcyBYZW4g
Z3Vlc3QgaW1wbGVtZW50YXRpb24gYWxsb2NhdGVzIGEgc2hhcmVkIGluZm8gcGFnZQ0KPiA+IGJl
dHdlZW4gWGVuIGFuZCB0aGUgZ3Vlc3QgZG9tYWluIGFuZCBVLWJvb3QgdXNlcyBkb21haW4ncyBS
QU0NCj4gPiBhZGRyZXNzDQo+ID4gc3BhY2UgdG8gY3JlYXRlIGFuZCBtYXAgdGhlIHNoYXJlZCBp
bmZvIHBhZ2UgYnkgdXNpbmcNCj4gPiBYRU5NRU1fYWRkX3RvX3BoeXNtYXAgaHlwZXJjYWxsIFsx
XS4NCj4gPiANCj4gPiBBZnRlciBVLWJvb3QgdHJhbnNmZXJzIGNvbnRyb2wgdG8gdGhlIG9wZXJh
dGluZyBzeXN0ZW0gKExpbnV4LA0KPiA+IEFuZHJvaWQsDQo+ID4gZXRjKSwgdGhlIHNoYXJlZCBp
bmZvIHBhZ2UgaXMgc3RpbGwgbWFwcGVkIGluIGRvbWFpbuKAmXMgYWRkcmVzcw0KPiA+IHNwYWNl
LA0KPiA+IGUuZy4gaXRzIFJBTS4gU28sIGFmdGVyIHdlIGxlYXZlIFUtYm9vdCwgdGhpcyBwYWdl
IGJlY29tZXMganVzdCBhbg0KPiA+IG9yZGluYXJ5IG1lbW9yeSBwYWdlIGZyb20gTGludXggUE9W
IHdoaWxlIGl0IGlzIHN0aWxsIGEgc2hhcmVkIGluZm8NCj4gPiBwYWdlIGZyb20gWGVuIFBPVi4g
VGhpcyBjYW4gbGVhZCB0byB1bmRlZmluZWQgYmVoYXZpb3IsIGVycm9ycyBldGMNCj4gPiBhcw0K
PiA+IFhlbiBjYW4gd3JpdGUgc29tZXRoaW5nIHRvIHRoZSBzaGFyZWQgaW5mbyBwYWdlIGFuZCB3
aGVuIExpbnV4DQo+ID4gdHJpZXMgdG8NCj4gPiB1c2UgaXQgLSBkYXRhIGNvcnJ1cHRpb24gbWF5
IGhhcHBlbi4NCj4gPiBUaGlzIGhhcHBlbnMgYmVjYXVzZSB0aGVyZSBpcyBubyB1bm1hcCBmdW5j
dGlvbiBpbiBYZW4gQVBJIHRvDQo+ID4gcmVtb3ZlIGFuDQo+ID4gZXhpc3Rpbmcgc2hhcmVkIGlu
Zm8gcGFnZSBtYXBwaW5nLiBXZSBjb3VsZCB1c2Ugb25seSBoeXBlcmNhbGwNCj4gPiBYRU5NRU1f
cmVtb3ZlX2Zyb21fcGh5c21hcCB3aGljaCBldmVudHVhbGx5IHdpbGwgY3JlYXRlIGEgaG9sZSBp
bg0KPiA+IHRoZQ0KPiA+IGRvbWFpbidzIFJBTSBhZGRyZXNzIHNwYWNlIHdoaWNoIG1heSBhbHNv
IGxlYWQgdG8gZ3Vlc3TigJlzIGNyYXNoDQo+ID4gd2hpbGUNCj4gPiBhY2Nlc3NpbmcgdGhhdCBt
ZW1vcnkuDQo+IA0KPiBUaGUgaHlwZXJjYWxsIFhFTk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwIGlz
IHRoZSBjb3JyZWN0IGh5cGVyY2FsbA0KPiBoZXJlIA0KPiBhbmQgd29yayBhcyBpbnRlbnRlZC4g
SXQgaXMgbm90IFhlbiBidXNpbmVzcyB0byBrZWVwIHRyYWNrIHdoYXQgd2FzDQo+IHRoZSANCj4g
b3JpZ2luYWwgcGFnZSAoaXQgbWF5IGhhdmUgYmVlbiBSQU0sIGRldmljZS4uLikuDQo+IA0KPiBU
aGUgcHJvYmxlbSBoZXJlIGlzIHRoZSBoeXBlcmNhbGwgWEVOTUVNX2FkZF90b19waHlzbWFwIGlz
IG1pc3VzZWQNCj4gaW4gDQo+IFUtYm9vdC4gV2hlbiB5b3UgZ2l2ZSBhbiBhZGRyZXNzIGZvciB0
aGUgbWFwcGluZyB5b3UgYXJlIHRlbGxpbmcgWGVuIA0KPiAiSGVyZSBhIGZyZWUgcmVnaW9uIHRv
IG1hcCB0aGUgc2hhcmUgcGFnZWQiLiBJT1csIFhlbiB3aWxsIHRocm93DQo+IGF3YXkgDQo+IHdo
YXRldmVyIHdhcyBiZWZvcmUgYmVjYXVzZSB0aGF0IHdhcyB5b3UgYXNrZWQuDQo+IA0KPiBJZiB5
b3Ugd2FudCB0byBtYXAgaW4gcGxhY2Ugb2YgdGhlIFJBTSBwYWdlLCB0aGVuIHRoZSBjb3JyZWN0
DQo+IGFwcHJvYWNoIA0KPiBpcyB0bzoNCj4gICAgMSkgUmVxdWVzdCBYZW4gdG8gcmVtb3ZlIHRo
ZSBSQU0gcGFnZSBmcm9tIHRoZSBQMk0NCj4gICAgMikgTWFwIHRoZSBzaGFyZWQgcGFnZQ0KPiAg
ICAvKiBVc2UgaXQgKi8NCj4gICAgMykgVW5tYXAgdGhlIHNoYXJlZCBwYWdlDQo+ICAgIDQpIEFs
bG9jYXRlIHRoZSBtZW1vcnkNCj4gDQo+IFlvdSBjYW4gYXZvaWQgMSkgYW5kIDQpIGJ5IGZpbmRp
bmcgZnJlZSByZWdpb24gaW4gdGhlIGFkZHJlc3Mgc3BhY2UuDQo+IA0KPiA+IA0KPiA+IFdlIG5v
dGljZWQgdGhpcyBwcm9ibGVtIGFuZCB0aGUgd29ya2Fyb3VuZCB3YXMgaW1wbGVtZW50ZWQgdXNp
bmcNCj4gPiB0aGUNCj4gPiBzcGVjaWFsIEdVRVNUX01BR0lDIG1lbW9yeSByZWdpb24gWzJdLg0K
PiA+IA0KPiA+IE5vdyB3ZSB3YW50IHRvIG1ha2UgYSBwcm9wZXIgc29sdXRpb24gYmFzZWQgb24g
R1VFU1RfTUFHSUNfQkFTRSwNCj4gPiB3aGljaA0KPiA+IGRvZXMgbm90IGJlbG9uZyB0byB0aGUg
Z3Vlc3TigJlzIFJBTSBhZGRyZXNzIHNwYWNlIFszXS4gVXNpbmcgdGhlDQo+ID4gZXhhbXBsZQ0K
PiA+IG9mIGhvdyBvZmZzZXRzIGZvciB0aGUgY29uc29sZSBhbmQgeGVuc3RvcmUgYXJlIGltcGxl
bWVudGVkLCB3ZSBjYW4NCj4gPiBhZGQNCj4gPiBhIG5ldyBzaGFyZWRfaW5mbyBvZmZzZXQgYW5k
IGluY3JlYXNlIHRoZSBudW1iZXIgb2YgbWFnaWMgcGFnZXMgWzRdDQo+ID4gYW5kDQo+ID4gaW1w
bGVtZW50IHJlbGF0ZWQgZnVuY3Rpb25hbGl0eSwgc28gdGhlcmUgaXMgYSBzaW1pbGFyIEFQSSB0
byBxdWVyeQ0KPiA+IHRoYXQgbWFnaWMgcGFnZSBsb2NhdGlvbiBhcyBpdCBpcyBkb25lIGZvciBj
b25zb2xlIFBGTiBhbmQgb3RoZXJzLg0KPiANCj4gVGhleSBhcmUgbm90IHRoZSBzYW1lIHR5cGUu
IFRoZSBjb25zb2xlIFBGTiBwb2ludHMgbWVtb3J5IGFscmVhZHkgDQo+IHBvcHVsYXRlZCBpbiB0
aGUgZ3Vlc3QgYWRkcmVzcyBzcGFjZS4NCj4gDQo+IEZvciB0aGUgZG9tYWluIHNoYXJlZCBwYWdl
LCB0aGlzIGlzIG1lbW9yeSBiZWxvbmdpbmcgdG8gWGVuIHRoYXQgeW91IA0KPiB3aWxsIG1hcCBp
biB5b3VyIGFkZHJlc3Mgc3BhY2UuIEEgZG9tYWluIGNhbiBtYXAgaXQgYW55d2hlcmUgaXQNCj4g
d2FudHMuDQo+IA0KPiA+IFRoaXMgYXBwcm9hY2ggd291bGQgYWxsb3cgdGhlIHVzZSBvZiB0aGUg
WEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXANCj4gPiBoeXBlcmNhbGwgd2l0aG91dCBjcmVhdGlu
ZyBnYXBzIGluIHRoZSBSQU0gYWRkcmVzcyBzcGFjZSBmb3IgWGVuDQo+ID4gZ3Vlc3QNCj4gPiBP
UyBbNV0uDQo+IA0KPiBTZWUgYWJvdmUgdG8gcHJldmVudCB0aGUgZ2FwLiBJIGFwcHJlY2lhdGUg
dGhpcyBtZWFucyBhIHN1cGVycGFnZQ0KPiBtYXkgDQo+IGdldCBzaGF0dGVyZWQuDQo+IA0KPiBU
aGUgYWx0ZXJuYXRpdmUgaXMgZm9yIFUtYm9vdCB0byBnbyB0aHJvdWdoIHRoZSBEVCBhbmQgaW5m
ZXIgd2hpY2ggDQo+IHJlZ2lvbnMgYXJlIGZyZWUgKElPVyBhbnkgcmVnaW9uIG5vdCBkZXNjcmli
ZWQpLg0KDQpUaGFuayB5b3UgZm9yIGludGVyZXN0IGluIHRoZSBwcm9ibGVtIGFuZCBhZHZpY2Ug
b24gaG93IHRvIHNvbHZlIGl0Lg0KQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IGhvdyB3ZSBjb3Vs
ZCBmaW5kIGZyZWUgcmVnaW9ucyB1c2luZyBEVCBpbiBVLQ0KYm9vdD8NCg0KUmVnYXJkcywNCkFu
YXN0YXNpaWENCj4gDQo+IENoZWVycywNCj4gDQo=

