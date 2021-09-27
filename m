Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F220418FBA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196364.349178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkp4-0004Pb-0H; Mon, 27 Sep 2021 07:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196364.349178; Mon, 27 Sep 2021 07:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkp3-0004NG-SQ; Mon, 27 Sep 2021 07:13:09 +0000
Received: by outflank-mailman (input) for mailman id 196364;
 Mon, 27 Sep 2021 07:13:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUkp2-0004N9-Gu
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:13:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf16c6d-1f62-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 07:13:07 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R5wd0B000498; 
 Mon, 27 Sep 2021 07:13:05 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3batvnhbv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 07:13:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4883.eurprd03.prod.outlook.com (2603:10a6:208:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 27 Sep
 2021 07:13:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:13:02 +0000
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
X-Inumbo-ID: 5cf16c6d-1f62-11ec-bc42-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6g6/hO7JxWdox9vQxSFiAOFGXLDyACpYzgGV/eoG8KeTaK8ImdaeoC1MmESXx1xT9TktfgRf0z5J2l08XFf/LdGoiCPUbbUSM7XxRF7gwI9VZ/2Cg14uyruATXtLu/LHOb8dXqkcy2srIHegOBC1c/Fq7vglColIOR7ePpmCHFk2y1ra80sQBI9unxRziPHdGAU0BNRWSfWUaJwUTIy3aeWNEq4UqsuPZA3011NiSrp1A4wofk9FPU/KoqZ+J/5JZTF0i5mVA0Me4UcTPE6usUHqktAvRf3Ubn6183Gxo5OG6z5CNLq7KhPGXw2zwbmnc3GXWpjylN16sY5jBtEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Y+ESMEu4hP8xXjB/6BY/qKC3yxOu5l7lpWUzJGOCDDk=;
 b=bLEwixzeGxse3Sksu7cpxpxeo6srRzKXmzHX4nBube7XFqsS0DlSK1C6ZMevrZid/cP7BTWrXA2My3Lb0Ksb1kL4gCZxaGcTnWZc2V8dok8iyYSaoNlhKGzO15xTKZM7W9SsC6ajsODfmz5NPAehpl/jw7hPGuaQH4AbNMswkhn79AsC8R6BxGpZXipWmsnDcHILuDyY7HY4XPZJA5GrS8ejowji94EDOmvmGHJ/9HyJK5Bc+q8QkmeWKo18HQq93dkCcW0J2bLRyplMfQyZgxcP7/uMf8vGeibDxMcsXfe1tvC9td7xmrDtY3fW0apmFOX1oienMgIOBZx1bLTbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+ESMEu4hP8xXjB/6BY/qKC3yxOu5l7lpWUzJGOCDDk=;
 b=6ORVfs8nQvgw369C6mKiLqFlroARXfol8/Zv9jlNGRIY04iR7B4Kzf0zZnLu1O3VjP5gWzZ5WXKG8KKhh11tTwUQmX4vXI/Z6MeChh7XUkqDDqyjdjVvRG4cOLxWhgkx1KiB1Ws5Gsnoi0WjwDTB+kgfj/zMZX4/S/dn7EcIrhMb7HOZIv+6hOyMRREOVT0es+J6WDPMWIMrF23XbUTx3FiRQ3Mc2kY1RmOHx0Sqvxp1A18eG2197QKE4/ltg+Xh30lHopKWlFseQToRVW5PTrpYLq/iw04OOMZDWNZk3SEQGZmXvZGqtnF50Vl90rOprkBadBgrK0SvR783Qpx5zg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: AQHXsHoyHtx3VKSfZEKPQekyrs7GEauz3gOAgAOfP4A=
Date: Mon, 27 Sep 2021 07:13:02 +0000
Message-ID: <bf937f7d-4d7f-501a-2763-8b7a3bf72804@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <alpine.DEB.2.21.2109241653510.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241653510.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 977131c9-b71e-4fd8-b46a-08d981863e7e
x-ms-traffictypediagnostic: AM0PR03MB4883:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4883AF021EDC72189ABAD9F0E7A79@AM0PR03MB4883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Yq7QpCu3JR9cc9yauSbKNbA5fLpMFCHgeu6FjpeboCImcusAARCUsZzENFIpCzhPfJv4qAPxiGUjNbvQUcwk84A6mJsUXKM8IYW3WmRxw4D79+3jOGK6OPYEljcxx9xztXG0xngynMKqkjalkucYaWklYpzmhuQjelHp7TQ/fe6vh9miMzyNRcl7U5xcrvKpY2bOiVL4KdV+3ryMzwEiuknEiXmdo+JbxSmyf7MFidpWPjwl0szB7mjP47z07nhun2fafnLlu9G7qHf0VJAXNAsLwK7FbifNusA0sfqj+NPNnr9rKm7fqZnECNS2JNt5aVqcjWY365dFtcKOQpRseEYjO632QA+S9oia+WneFkOtLfPCb0ulcBU7rbLJgI/WHWt2yYLKt2Pq6DPU4t5GgyNLUiC2loHiwzb3duZtSv9a2G1BdS9aUbM0G1LOKnIdR1xzJq95z3xxFCCI4GvjzXJiSHRB2FnjbugxNa36o6GhR9lF//2kojKOqCTscdRZHqyJTXPDAlhd5cEP1MqI1VqWpcC0/V3M3rNVfuaDW9r5G9B2yGUDh+3rPavJ9bx+dJAc1UJAklUAjCwifbw4hyksgElnEuLBYMnBe9yCcvI6KO0punBGgl7JvV2L42KmjFxlFSa2lWxYIYFlclEdH3J9O+3/XhPaN1NxKPTgn7AbWeBehhha/eQ4wjUMqDOcdx6PH2GkaGHe5lWcRgDJ5TbHy1f95hcGKKjLCJx4QwQKDaIJ7xrmcs/ebClU38R4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(91956017)(122000001)(38100700002)(6916009)(2616005)(26005)(76116006)(8676002)(64756008)(66946007)(71200400001)(508600001)(316002)(186003)(66476007)(2906002)(38070700005)(6486002)(66446008)(66556008)(6512007)(55236004)(86362001)(6506007)(53546011)(5660300002)(107886003)(36756003)(31696002)(4326008)(31686004)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZXk5cmtOeklLT25hRHhzUUlzbXhISWZjRy9TeGc0NEpqVjBrKzhLRXVHMHlP?=
 =?utf-8?B?NEU3RkFnaVprNkdFQktubXBURGloTlgyTzc0eUFuSmRPU0grRHRTUmFGS0hk?=
 =?utf-8?B?Uys0MEJNakRjRytBdUF4ZGV2cmR6WEw3cDVWZkFLUHFxeFArOXo2QkgxL2R3?=
 =?utf-8?B?VWRzdU5OM3luVlFub1p3d0hZSUY5THVqSjVFR3Nkc00zWVRvdmFwbk5leEpQ?=
 =?utf-8?B?TGg1LzZsTkNCTnJqa0UzUkozcnJRSUZwSFdLekxPY3VDak1ONnYrVTdRb3I5?=
 =?utf-8?B?QkxXNjRCVXhlTjNDYy8wTnNOdWN2UjUvY0phSEt1RUdjR2g3UXgvSFFvbTlj?=
 =?utf-8?B?STRJRkN2SXZUZElQT1BzSlVsdzZ0L1FFYzN5N1VwNE5USFlackpMUUtzajVQ?=
 =?utf-8?B?VlIyYkVRRXpJZHhXaFNjV2hiOUZNVnllNFpQTkJQZUtsVWh4WWdxZEVqV1Y3?=
 =?utf-8?B?TUhJSEYra2pNWXVMc1g4TkUvamVzNFF1UHY4cGRjYmFuK3kxbmNPMHFOOU93?=
 =?utf-8?B?R09DVjIrTUMycENGd1BFZ0toN0piMGpRdDNGeXpnUGJQaXRrMFg0dTI4VkdR?=
 =?utf-8?B?bjNNNndqM09oNHZ4S1NRZmNMZlVna1dPbjNHS0ovNW1ERlMza25Ed2xaTXlu?=
 =?utf-8?B?bFdvZlhrY2JWWUJMVmJ2TmRaZ3BJMXpUNmlSY1Y5QSsvNk5DUllCR2tlcWRI?=
 =?utf-8?B?SmMxZktwSUV4Vkl1ckVzTFhPZE5td0NLa0pjQnNLTGRNTDFYWlZtYnlsZHJo?=
 =?utf-8?B?RnZFbHVBMVJjdjBac08yRmdqd1RFYTBOMktMVVZxSVFHUDNuajhGaFVPS0NU?=
 =?utf-8?B?RFpLdzRSeG90cmowTWNmWDBhdENMRjR1UmVuNlBLVXA0Qml4UlZTeFp6b0kw?=
 =?utf-8?B?bzNML2hDN2J5c0FLY1FWRnRxSnZwVCtiQjcrOEt3VExaWFZsbUk0bmVlcEpn?=
 =?utf-8?B?anpRQ25mMFoxaUpDcThacXIwTGNseHh3QmpGQzlvWmJIc3V6TnRlekpNWU9h?=
 =?utf-8?B?cTBDTWNvaVdaMzdYb0txTlpHK3hMZSs1cnJRWGlyQ1lKTlNGZGtwOFF1Szlv?=
 =?utf-8?B?TkxLWUZ0NGxnYnN2clZQMEFNWnN3eXRjczg2dmdHSU5ySjFIbTI0OWROL05X?=
 =?utf-8?B?NzdINGV5ZllqaU5ScTdHVkNjakt4enAvakw2b3B5SnRuck5DQXBVZkcwTjcv?=
 =?utf-8?B?dEF2NEpIMnpWUHhFK2NvY05WMTBLVVE3eHpkMHI0MVkvTDBPUzhmVlZWOEJw?=
 =?utf-8?B?Q2RJM0phdERYZ2o3WXZOOTdQdE9vbUtjWW9NUlZxSlQ4cS9PTU0ydmQveVVn?=
 =?utf-8?B?ZjRUbEFBK3MrMFNibU52NFk1UlpuSGNVbnc5V25NSXE4cGVyQTh5TjVxMmNR?=
 =?utf-8?B?VkZOQ2ljWUhBZFFPa1NEVkVidTRBUlRDcXdiVlhnbk05dE9pRlBucVFsVWJ0?=
 =?utf-8?B?dmpicFJ5Y2t6ektpOWlrTzN4bXRsbWJoVnhPUHdXL1IxOGFscGlQRXBBOFNn?=
 =?utf-8?B?QTNZenZqd2JRR2E4TlNJWUUwbGU0aVBwaTBDMUJnTFNYUmlSL0tTa01yRCtl?=
 =?utf-8?B?WThkVGFVRUtvZnZqMGhRcHRtNkF3bkxqdUtUQXhmTzcvVnBwSVRUQnZkcldN?=
 =?utf-8?B?aW1UR3o4b2gyNnRlMlhwYUJmOGpRQzRZMGdQNHhxRk5CMVB4RFRyQ09rekJZ?=
 =?utf-8?B?Qm5Zcm8raXgyL2t4dG9Uc3FVbncvdmV6Nkx5a2ZiYWFaTlU1RXlQQU9WZEU5?=
 =?utf-8?B?Z0xpbEhyUFc5RVJrWU1vaUl5R3NnM21HRndlTFUwRWFSRk5PQXdZaWFiMko5?=
 =?utf-8?B?RXRUbnVjSDVTYW1QWlRmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAF197FB324E6D40B0414424585E0040@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977131c9-b71e-4fd8-b46a-08d981863e7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 07:13:02.2752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YA4dSOIElwI6ZJEzE+lbclLFB9Kjfn/s36kcGj+YM/h+vW2brAqVMrsnz6cn/rCKdeOktBQ/fqDTNphF245lkhnoRrTNaar03ryOrxk+JQsxaso/JJryl5x1B6zYfkvt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4883
X-Proofpoint-GUID: VpeoV-92FZEyV2FM-992j8lofK9H1mLQ
X-Proofpoint-ORIG-GUID: VpeoV-92FZEyV2FM-992j8lofK9H1mLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109270047

DQpPbiAyNS4wOS4yMSAwMjo1NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUaHUs
IDIzIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+DQo+PiBXaGlsZSBhZGRpbmcgYSBQQ0kgZGV2aWNlIG1hcmsgaXQgYXMgc3VjaCwgc28gb3Ro
ZXIgZnJhbWV3b3Jrcw0KPj4gY2FuIGRpc3Rpbmd1aXNoIGl0IGZvcm0gRFQgZGV2aWNlcy4NCj4g
ICAgICAgICAgICAgICAgICAgICAgIF4gZnJvbQ0KV2lsbCBmaXgNCj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4NCj4NCj4NCj4+IC0tLQ0KPj4gU2luY2UgdjE6DQo+PiAgIC0gTW92ZWQgdGhlIGFz
c2lnbm1lbnQgZnJvbSBpb21tdV9hZGRfZGV2aWNlIHRvIGFsbG9jX3BkZXYNCj4+IC0tLQ0KPj4g
ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDMgKysrDQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gaW5kZXgg
NjMzZTg5YWMxMzExLi5mYzM0NjliYzEyZGMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMN
Cj4+IEBAIC0zMjgsNiArMzI4LDkgQEAgc3RhdGljIHN0cnVjdCBwY2lfZGV2ICphbGxvY19wZGV2
KHN0cnVjdCBwY2lfc2VnICpwc2VnLCB1OCBidXMsIHU4IGRldmZuKQ0KPj4gICAgICAgKigodTgq
KSAmcGRldi0+YnVzKSA9IGJ1czsNCj4+ICAgICAgICooKHU4KikgJnBkZXYtPmRldmZuKSA9IGRl
dmZuOw0KPj4gICAgICAgcGRldi0+ZG9tYWluID0gTlVMTDsNCj4+ICsjaWZkZWYgQ09ORklHX0FS
TQ0KPj4gKyAgICBwY2lfdG9fZGV2KHBkZXYpLT50eXBlID0gREVWX1BDSTsNCj4+ICsjZW5kaWYN
Cj4+ICAgDQo+PiAgICAgICByYyA9IHBkZXZfbXNpX2luaXQocGRldik7DQo+PiAgICAgICBpZiAo
IHJjICkNCj4+IC0tIA0KPj4gMi4yNS4xDQo+Pg==

