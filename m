Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B73B817D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 13:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148181.273807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyYlz-0000Ew-Hj; Wed, 30 Jun 2021 11:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148181.273807; Wed, 30 Jun 2021 11:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyYlz-0000Cy-E6; Wed, 30 Jun 2021 11:52:55 +0000
Received: by outflank-mailman (input) for mailman id 148181;
 Wed, 30 Jun 2021 11:52:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+GI=LY=epam.com=prvs=7815400710=sergiy_kibrik@srs-us1.protection.inumbo.net>)
 id 1lyYlx-0000CY-Rk
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 11:52:54 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47d5ea32-0d0e-45f8-87c5-11498747ee5e;
 Wed, 30 Jun 2021 11:52:53 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UBkj55000314; Wed, 30 Jun 2021 11:52:51 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 39gr1k80xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:52:51 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::8)
 by VI1PR0302MB3437.eurprd03.prod.outlook.com (2603:10a6:803:20::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 11:52:48 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::24c9:276d:e56c:34d4]) by AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::24c9:276d:e56c:34d4%5]) with mapi id 15.20.4242.023; Wed, 30 Jun 2021
 11:52:48 +0000
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
X-Inumbo-ID: 47d5ea32-0d0e-45f8-87c5-11498747ee5e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmehO9Lr4oo4Nl5tSEuqFnl0kPwoooheDdPNp/YpFuHra63brUy4LjqCYcFeWfLG897YWKjZ8IBFfks2siSGMgWcVRCTKT7SniteQzw2H/FywBP1vbBINmjJr7m6ijjrr37LZk3Y0jkBllvlh71fwU/UgJdkG6ifl30My4dLH87kAgQnncRADgEQ8OwYRmowmjLCJ2rOgoonx/VGFKawThO3FlrFwTvR1JwxZGvmXrDnIK0FCIVsXdtrp5zET5I3YsPDlsDbHmRHIVnK1MTbKJ7BEgxxagzKaUzxyuw0EzcFkfDCs2yef2CJrwrYc/ad40nC8A/UoLiiHI1/nYM50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkKWOIBLkgshZvIsBGS/x4npvpbIkst102jI46Ov3D4=;
 b=XsvQDCDhSkvddNqzzfwUsc54n31srq9gFvcqq3OrVHGLqxyjo8kJlGgF5BU6C4ZBPok7eEkuKENnk4IQLapveU1x/C/exAFc1Q9A3IVZN1VGat1JWmrc+XVmyBPtMNEeE33X/Nh0z+pCWsRtJTJ/bt6Pvxjbb3yKVsWObkFUmVNvZEHtvwGyONPSkyZugDV7SVYmTCrzg37cbC86okDb9Wa9B/VXsSdZltHtYw+F7dZ1B1PHiNMTjcqgBGVe3GCxRlZsQGZGxeOyNMaCGMzIRRuWHYIgn9UOaP+oxHcVVvVTRHzURpvigibdZk7mdhrbJ8CuQ8Ty+2V0Yca8g134NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkKWOIBLkgshZvIsBGS/x4npvpbIkst102jI46Ov3D4=;
 b=qlBGvruciRCgf1vC+ndFTFUGYbRBYGKY+4mldZBnfb3ML+VDlsaQJXB1YbyVQIVh0SsnZp5tP1msp36rlVbhXf2LCDlgWtxQDTqMcDizHY2KEV8IY7HE7mSKs2JYSO6tb7dM24YZIGnYjQ8bPllbwMQJyPgAfYIDKVVYY+4DtS/Va1tykeQt1r2WKgybxquEoo5ir1QJa/2Daoi74br4pAUNoTU5zdBUJCbyr8S6mmUPHbTUpGuLzsXs5BaQF4iQ2cgpNlen5ELYilD0kLIKaYAVgbT8QT8WexrT+9732D5TtZ4qG00tN8+0l7B3B8fibawT3+0T7+L31RPbUxQehQ==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v2] libxl/arm: provide guests with random seed
Thread-Topic: [XEN PATCH v2] libxl/arm: provide guests with random seed
Thread-Index: AQHXWHmL+0MzhpKbOUCds4qOsNnv3qssf+sAgAAbmYA=
Date: Wed, 30 Jun 2021 11:52:48 +0000
Message-ID: 
 <AM9PR03MB683611963AAB15208D1EECB3F0019@AM9PR03MB6836.eurprd03.prod.outlook.com>
References: <20210527085233.69917-1-Sergiy_Kibrik@epam.com>
 <78b26e15-a3ca-e218-9afa-9f443e234260@xen.org>
 <658a814d-2a99-00ff-8855-134a1e707e97@xen.org>
In-Reply-To: <658a814d-2a99-00ff-8855-134a1e707e97@xen.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [91.206.32.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09f24d7b-a22a-4dcd-588a-08d93bbd952b
x-ms-traffictypediagnostic: VI1PR0302MB3437:
x-microsoft-antispam-prvs: 
 <VI1PR0302MB34370564193C1C20A31F6831F0019@VI1PR0302MB3437.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tzBwWCDvLpxoZLljtnX/W6/b/n/WknhaOYrvPgmAFbWhA0PghIY+/vSR8cOrYFS6vxMve4dL0yHK4fqUKTodBVcFidWZ1QVINf53/CJKRYUdJnk9vFlHyrgnEjAlkpdSpjpvmvrdBq4AKqCR1m8fF+/gGqM1BTWXSFH7dUUEQD3YkVWcidkDkBNF1OI5osO100gortdwX3Pn0Zar7T1wWKoocrKBR9u1B2ENd/4voKNLdFm36y6ZuUYT+S4UwTPVkzy3NK/3jdRQrqX7IeAjvjM2Moh4HvOXrWvhwLcldh/o58dIcB1vsPlRJfEf6EOb+zdrpltGFbd3z8sjYqVVO6ZO6sCdlfuh2B/WJOmG2GfylJtcL+aQRtZdrOV7ehODZZTVhLL2XSP7eHIPqMixYzRh3xJCZM9YffyRlkpgWhCAekhWjCsqkZ6RIY3sIkGlwSYrKSAeNI4hUUxoowt3BPJ46vSfEwe/pBQNr2ff9L45bt2g16HsXrXM9SCvSCkdNxyiuEWyFMq/R6/XOLv+LJwr8xraOQvTTKyT83aqHW7c5iWCaK5aa/31gGiPi01YSn2sBW2S2w0A+exKW4WDEBO/HZ2gflbvD2UIFYLLaZJ/ncBoKyi6k15L/VF/ftroTtHSUaulwWiT9tmTyaKaTQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6836.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(71200400001)(52536014)(6506007)(38100700002)(53546011)(5660300002)(186003)(7696005)(26005)(9686003)(122000001)(55016002)(4326008)(54906003)(110136005)(4744005)(2906002)(316002)(478600001)(8936002)(33656002)(66946007)(76116006)(66556008)(86362001)(64756008)(66446008)(8676002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?alV6VHd1cmcyVWZrZ2NMcm0zeFpMOFNTdmpvYll4Tnd0QWc3TmRicnNsWkUw?=
 =?utf-8?B?Z1dvUHlqdnQ3UVh0K1ZIS20rUjJkM3V6WHdISVpCeGV2UUxURnFSOTdRYzUr?=
 =?utf-8?B?dXB3WXE2NTM3VldMMzI1VC9kWElsbUl1NVc2SWtEcUhIYUtTNnZqRDlEMlhN?=
 =?utf-8?B?aTlBN1NRM2xJckdhWmQ5MVFiSmxEMUI1MW9VZ1l6a1BSOFpHVExwK2ViUTNk?=
 =?utf-8?B?Nk5rSHR4d2JUUVJoTVh4ZGdrWmZYNjNScHlmendkN0c5dWJ3Z2Z5UG1hL2Uy?=
 =?utf-8?B?cy9aZHBrOWt3VTdLOTJTQ203aERTSVhFVEJZOWExa3lydW4vanpvRldKUXp1?=
 =?utf-8?B?Qmg1TFhMV3hBQ2wxWFlMZ3BEL0NwV01lWHFzRHZLSVM3N2ErR28vT3laSUlH?=
 =?utf-8?B?TTFYNDZyWHBIRGRkTkNLYUpOTitNUkdrM2xYRnZlMmpjL1pXclQ0RGhVYUEw?=
 =?utf-8?B?eTdkUFJkSXM0eGlTalp4M05MeGdySlUyZW95MUFpc0x1QkJoQ2VzUTh5UVZX?=
 =?utf-8?B?enFHQkFoZWg5YzFqZHhsKzlkelRUSCtMRmV4R2tyVWdIQmpoQWtoRDhXT25J?=
 =?utf-8?B?S1Z2TDhFTWlOYmJDTDkvOElDcG9TeFIrSkpPSENyYkI5RXVTTXJ3M3IzNlNn?=
 =?utf-8?B?Sm5naWtRc2x0NlEvZTJXc0JPdHdRb3RpbEZkOWsrbk5zYmFyaXNNVk9hWEZG?=
 =?utf-8?B?TGtmc0lrWWdyL0NUNjZtVTZkK2F3Q1Z1czFWUktTUTBaTVZ4OTZnWmtNcGI4?=
 =?utf-8?B?OFBhMklkOHVpM3N4NVJZOGF0M0pkUkRPQjhoVlg5bVdLbmtheW4xc1ZUOFFO?=
 =?utf-8?B?M0hHbVBHQXNhZnMwbWlPeDlPclRObytncGs3UWlwSzMwbjQxd1lPRlhldFph?=
 =?utf-8?B?M0NWZWVIV3RwM0dhMW9ab3ErK1FSZXo5cUxjcnZNQnMrZGNSa3p3NGN6SEYx?=
 =?utf-8?B?aXdHWHo2clRjYXRjS2JkSFZodWoydjJsQlEvMjNFbjFhamFOOXJsWVF1eHo4?=
 =?utf-8?B?RnV1aEIyME0velduajVwc0NNTkZvem1pR24zbXhGa2liV2NwSTBROHRUZXdW?=
 =?utf-8?B?dkt2RjJqdEdWcVhXdHdSbm4wUnVKc3QwNzRQR2kyMEhwcUFxTjBFSllGby8w?=
 =?utf-8?B?bkU4a2QrbWM1c1ZiZkZqeWlJdWZUU0YvUXRlQ2hmdFg1R1RsVDVQVVpsbldz?=
 =?utf-8?B?ZnNTVlljRnViYUZ6QkRiY0kvcHRyeG0yMTFGaWJ3NmNMZlhYTXdqMGpsazdq?=
 =?utf-8?B?TjFjdFFnRlhoWXBUOGx1aThMZDhaTWFVVTNObGdaTkFUVW9Iak9nMm53S3RS?=
 =?utf-8?B?NWs5ZWFaeFRDaXlsWG5RWTBSdXdCRFp6ZTMzTGRQSXRDS1kyalE3RGo3UEQv?=
 =?utf-8?B?dmgzbHlWRlh1cDRUZS9MeUxmQUFuNXQydndOOUsrUW1LT2g1YU45cjdoYksy?=
 =?utf-8?B?bmNhbDljZnN4U1BXcjZmOXNhRzV5MDJ0WWEydnJGWmlqejZVT1l4bU1SaFRI?=
 =?utf-8?B?VVpTRmN2NHM2TUNsV1FhemN5bDZ6OW9iV3g4aVJ1bVVCcWE1QnYzMWI2bXZm?=
 =?utf-8?B?ZnBNbjFQajh6WHJTMG9QRmZVaTJ3bDBMdE4xOEJDUkt2azJWcndINXh2M1FO?=
 =?utf-8?B?dU9JU2EwWk5tWXlCaVZrVlZETUYzMUJ6eDVCalZGSkNZbGFlY053eXBTYzNa?=
 =?utf-8?B?ZFRSZ0svUUVEYUJieXRITGlrWGtheFF6QmkyZVNxSUc4TDZuckIzUVg2OWgy?=
 =?utf-8?Q?cf1O1ZErGzsxwxZmSw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6836.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f24d7b-a22a-4dcd-588a-08d93bbd952b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 11:52:48.5785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xhRdGyIKZeM4IgQxngF5lD0F+MWkdv2+AGyiKQbHX4l5UqGvy8ubJumgsTJhga6OztzuaWyy9qJZnbWhzx/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3437
X-Proofpoint-ORIG-GUID: ZcP-6ZyxZzfIxUdDgwD4tKvAh3aLn5zY
X-Proofpoint-GUID: ZcP-6ZyxZzfIxUdDgwD4tKvAh3aLn5zY
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300075

PiBPbiAwMy8wNi8yMDIxIDE0OjA4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQpbLi5dDQo+IA0KPiBU
aGlzIGhhcyBiZWVuIHNpdHRpbmcgb24gdGhlIE1MIGZvciBxdWl0ZSBhIHdoaWxlLiBJIHdhcyBn
b2luZyB0byBjb21taXQgaXQgYXMNCj4gdGhpcyBsb29rcyB1bmNvbnRyb3ZlcnNpYWwgYnV0IHRo
ZSBwYXRjaCBkb2Vzbid0IGFwcGx5IG9uIHRoZSBsYXN0ZXN0IFhlbg0KPiAodG9vbHMvbGlieGwg
d2FzIG1vdmVkIGluIHRvb2xzL2xpYnMvbGlnaHQpLg0KPiANCj4gQFNlcmdpeSwgd291bGQgeW91
IGJlIGFibGUgdG8gcmViYXNlIHRoZSBwYXRjaD8NCj4gDQoNClN1cmUsIEknbGwgcG9zdCByZWJh
c2VkIHZlcnNpb24uDQoNCi0tDQpSZWdhcmRzLA0KICBTZXJnaXkNCg==

