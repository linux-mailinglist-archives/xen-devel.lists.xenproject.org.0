Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D94024FC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180585.327310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWJX-0003KH-8c; Tue, 07 Sep 2021 08:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180585.327310; Tue, 07 Sep 2021 08:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWJX-0003HJ-4V; Tue, 07 Sep 2021 08:18:43 +0000
Received: by outflank-mailman (input) for mailman id 180585;
 Tue, 07 Sep 2021 08:18:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNWJU-0003H6-Mf
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:18:40 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34d25f74-0fb4-11ec-b0da-12813bfff9fa;
 Tue, 07 Sep 2021 08:18:39 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1877hJUh002674; 
 Tue, 7 Sep 2021 08:18:37 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ax2jngdvj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:18:37 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4695.eurprd03.prod.outlook.com (2603:10a6:20b:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 08:18:34 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 08:18:34 +0000
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
X-Inumbo-ID: 34d25f74-0fb4-11ec-b0da-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTSnc8k0z9+pblZq22nD0t1fgXmhduQuhih1IY1gGEZl9W/2EI1a8b5PJVRc5N5tw2dVx6UrWE7xqxcy7pm/glHLya2OP2+3XlSVSIwRZxhLbJrt6SQIO6xjmPOltCfVOFp1hyf7QZ1P4T4M/pts5B5A8QR0oVrh62VlsW31zT2l6nZsU3raScdiRO9Si8qKGyi6mrdhzJoleqWxJwYBA2lWl5Hsdz0QXboq5wPml3FNjwZSdcKwRfRX+h3F5/94tXNsBryoXomC9uUMBFYRnEIdPunBYzAt2YwN2IhdNSEizzSiFEa7iqrCoWAcQo/9qG6SchK0FylxksP+91t9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g9FL1dpPHRZyfhmVFJHfBWM1lqcz7ec+X2EeUF80IHM=;
 b=GFtRRX5L56B5MHIbu7t5W6adWjo5EgbAd3N9xb5AbiCijZGEsPbLm1bg90xzukZAYXZhkHtNTQvQfpyKfEwUQHAQc1SQpFpVNPsZnfRri4bWLpRmXxxKfPGZjOZUsoJzTa4gGX8WFv8GIMalsdAXYHDHDRAC6s6ds3W7fXhyzssyA4g3nXu/EiWqwzEHuI45rDSEWTNErHvFy2gHf/P00akRtDMD8aDJLpQWiF4dAwVdYiu76bgDQfc+z2D32hRnHCbxB5VeMWYdvwCPP27Yh5GnK1XoCgcYQutkYNCsnVIrLxwgxVRA9Ll01oRojey2DlmUfxSgfmxQXEqAt776gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9FL1dpPHRZyfhmVFJHfBWM1lqcz7ec+X2EeUF80IHM=;
 b=wuW6nht+sO8HhQhW0txFhOjracm/au/xYy4QuwiYu5XyZQDfsn+Q7pbF0H9qTUDRhzc68e39PUZhWApXTKkdOTRHp1ZVM7IRq7Nn8faFmYiUl1aktMh4OXvBC/X6YYMyVp9oFJzUVJLPd4Fk5Q2aO9fuSrZ7cZQOXPx4PjvxIl5K4oB/X4NXgv9ZMHNxC+zBhtZGVJFhIoggxXz2P7FoBnVdFqlbe61PCBk/wvPfYW/ilUiU0dfFqEV/jbGrZ4oF7E2LwV+t+/1mjvgBZ8r13YJR0UilwnBzepfHLxuJklO4IlRjOf4u/179geYNk0iv9PPfc15Vmn2FWHYUh0OBgQ==
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
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgA
Date: Tue, 7 Sep 2021 08:18:34 +0000
Message-ID: <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
In-Reply-To: <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80ec8ef6-7e8b-4b10-3570-08d971d8160d
x-ms-traffictypediagnostic: AM6PR03MB4695:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB469543BB4D93577C73B49E74E7D39@AM6PR03MB4695.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /EailDQw6DYN+N3MSDGmyX3V9KS1+MFivTTkztG2iC4uwDH7ch+fnvwO+9XzJvREChYRNDRC+DImLJuJLX7B+7IpX7F93mJd0QShSXktMhhK/BQTtylX+3CMvF4nBMjp6Cg0no6ol2AqRDC5SwaHpNj4EEUSHMI2wtjO2VGXEMEDVAEQTeFJ7gY/w0q69atHRxR1ov4hTgN3GApF+UjStkPexrol6tfLrFKd7oXUHW4q9cj2cc3wq14kEHzr+6QOYQ9IfW3f2he/mt12Vkrxeup5Wo8/R1rkYFv4ZBp/HcFdPMTL0YtjyfUheAXpvMxhV4RYN2h9A+ZNlUV7KED+AJO9TUPOhAec3SWFJ/x2ib5VwVS3OCyGOcQuzVJcPPsB6w18bPzp893fl74EdTKvqZKNPg4YCZlsnIWG1KLYH5WMFR6n7/xFiiHFqEt+KXXduketbUNM5iIbJuQLKQk9oIDHCu2DUdgeQJK7/rFxoB9EMHi1iZEtRjiL21s4+uZ1fQzJsh7leqIGH5gj26KvMgictdZA4XSpnPgTHiwmTo0rn7kK68jeyXHLvE2psY/CXosrOwIStIKh8JqYUGeUHTcMcnNERG7ydE3dxObD5cBdYRZdl1vhz3IeBW2+IGAx8oOKCFXUfJDVbwb/J6jBvs/Mh4Scby9BJNYyPbQySscZZfr2eafKIhmHpmTFXWU3RX+PwUUpjgXR4KBHcatwxVFoaGonV5/D0kNoqT4sOBRRFKx5lTmVBF/ZC7dfXMqi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(36756003)(66446008)(66556008)(31686004)(83380400001)(2616005)(66476007)(2906002)(76116006)(110136005)(66946007)(122000001)(38070700005)(38100700002)(91956017)(86362001)(31696002)(8936002)(6486002)(8676002)(64756008)(316002)(71200400001)(54906003)(478600001)(6506007)(5660300002)(53546011)(186003)(26005)(4326008)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RDZpK2JhYjNqRFpOVVNHT2J3N2JlWndVVW1KN2sxeE9NRTFOSnY3ZkYyNXFm?=
 =?utf-8?B?VVlhSVFLT3VPSjI4U0I0OVArbDBNUFVwRXJRWGtnUXJ2dkROZzh5RlpOSTlR?=
 =?utf-8?B?Yyt1SGlab0pkR1hKa1JQQzJ6UnlSM1llNU1XZ05FVnF5dk8ram9Zb2g4MG9F?=
 =?utf-8?B?Y2dGMkszd01KQkdNdEd5eTcwQWorZ0UxK1pCUEswUUVyd3JvcmlVSnVHTWEy?=
 =?utf-8?B?UGRIR1Ztc2tpMHY5Qmk3aFFLc0c2R2syNVlyR3BpU0lFYVhFaStRRlR6aTdh?=
 =?utf-8?B?Y2ZNaElCdThsY09pVzViL2JuMzVYOXBncld2V0ZTMFJ2a1FrZFhpZlBHWXEw?=
 =?utf-8?B?RkxHUmR2L0twSGRPNk5SL1c0SXhGUURWcEhwZHRyNzlPLytoMm45UHl1TTNr?=
 =?utf-8?B?c2RqZmF5MkE4Zjd3c1pkYjYvWEFvYVdZdmx2eHpnWUJLY2Z2V3FBWjlSbDdi?=
 =?utf-8?B?dXA4ZUZvamZ1alJ4bHFXcmZHaEk0MVlyWEZnWmhYcy80NWU0a3FKWThRQk5K?=
 =?utf-8?B?MXZZYXd3YktnNEtUY0QzTDhqQzBRcTdBRC96MU9OeVlWV2tnSWttQzVIMUlt?=
 =?utf-8?B?ZjFSa0xvaWhTSHRzL1ZJZzgrdTZjM1g4NjREOVMyLzRFNHdWNXFUb3VPWmJF?=
 =?utf-8?B?QjkxQkN6WEVmK1dGY3BRNzRpQWlRamsvdUZ5T29zVW5zTTJNWW1NZzN5elly?=
 =?utf-8?B?Q0FKUHB2NGEwZWFBZUlOWDBCbXpxUG1HWnNNc1BaS2g2NFpUSHZVdFlxazRP?=
 =?utf-8?B?UThKSk9ybUdza28vT2c4azhpSm9tQW1SK2czRDlTYkxZYW5DWXh4WTJjWW1n?=
 =?utf-8?B?Y2p3N3hXZmIzL2hTa2ZyZ09kOXpPTDZxQVBBVVBvMWsxU3B2S3ZFa2JnWWNK?=
 =?utf-8?B?aTMzQUxuWG1VRVU4U1NnRkMvVkYxZ0JLMWFNbHJwYnlsQ1NUVnQyQ2ZUcWpt?=
 =?utf-8?B?dS9vbjNhcUZaWHVRek53RGRET2lic2JSSjJHZkFERUVkOHNST1dZNFRwS0ZB?=
 =?utf-8?B?cTl5RUp2VlVPNVVpdWF1NWlESWpLVTF5a1dSenNEOXgrNWtJSGExSk92MVBp?=
 =?utf-8?B?TVdBQU5Ra2FKMG5KWERXMTZZeFNlUkM5bUo1VlJMY0JRNEdkYTQvMW5oQW9t?=
 =?utf-8?B?RWhIREtubVFEV1NXMnlmdjF3bkZmTUNrbmluYWI0YmxrMkpGTjVxYU9UbUhs?=
 =?utf-8?B?Qy9wdlQwL2dKZW1sMTdvZkIzVlRGTzIzdXJGQUtHOXZLWDBmWUV1anlKYk5Y?=
 =?utf-8?B?dTFCdm5vYTExWEtFVHA0Wk1qT3pDTlV0SCtLN0NaL1JPay8zL1NJVy83cE0v?=
 =?utf-8?B?YUNEa0ZqbU5RRWtGM2JWcCtWems1QldFd0JaNDZwL3d5OFdSUFFRb1hDSjJQ?=
 =?utf-8?B?ZVlYSkxMMEQ0UWxVdmlhVVRGL01tRWpWSnZUbEVmbjBwUThKaXhIN0NUQWl1?=
 =?utf-8?B?MlcyUHkrZFAwSmRFdkNEaUVWV2JtZ2xJNmFJdWtwTFdvZU1FQTJtOUhKT3Ev?=
 =?utf-8?B?M3B0OVRjZUgyOHBhSHQyT21WNUJJYnYxd3hVOEpRQ3NYRWd5am5saHk5Qk0y?=
 =?utf-8?B?R09JbHFEcXlHaVpBakZWYzlkRXprdmwwQ0NWd1BKVGpUMExncVZ0TENnRHRi?=
 =?utf-8?B?LzVLREs3V3pNL05Wa1VqMXRBdFBCL2F2MkpEZGRhSWt6VXdjSkdHSFVSSGd4?=
 =?utf-8?B?VFlzd1IzRDUwVFZWUGRlQWtvTE8vQ1pBSCtPQ1NhZkNOSzFWSm4wTlUxWHVY?=
 =?utf-8?Q?1fvXBoHJYZ6GRDY91VkUcbbo2YolLRGRAk36uOD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EF03F4C88D4E44E810E69FA9E17AFE9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ec8ef6-7e8b-4b10-3570-08d971d8160d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 08:18:34.5608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s8t+v7+sps+QIUclH28VBXhcdovCSRxu0gIXEqxa3rmqjtbexIDWfYjLC+O/Mgsnzp80JCXWPnKNxA0LvmpvXaa2d5R0kjrUo3DkIcVAblVEH5l1oOgUIMK2c71GKM8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4695
X-Proofpoint-ORIG-GUID: MOPuO5Nv1ur17sk8Con6XVQ1JhWNLWkG
X-Proofpoint-GUID: MOPuO5Nv1ur17sk8Con6XVQ1JhWNLWkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070055

DQpPbiAwNy4wOS4yMSAxMTowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MDk6NDMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDYuMDkuMjEgMTc6
NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4gQEAgLTgxMSw2
ICs4MTEsMTYgQEAgaW50IHZwY2lfYmFyX2FkZF9oYW5kbGVycyhjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gICAgICAgICAgICBncHJpbnRrKFhFTkxP
R19FUlIsDQo+Pj4+ICAgICAgICAgICAgICAgICIlcHA6IGZhaWxlZCB0byBhZGQgQkFSIGhhbmRs
ZXJzIGZvciBkb20lZFxuIiwgJnBkZXYtPnNiZGYsDQo+Pj4+ICAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIFJlc2V0IHRoZSBj
b21tYW5kIHJlZ2lzdGVyOiBpdCBpcyBwb3NzaWJsZSB0aGF0IHdoZW4gcGFzc2luZw0KPj4+PiAr
ICAgICAqIHRocm91Z2ggYSBQQ0kgZGV2aWNlIGl0cyBtZW1vcnkgZGVjb2RpbmcgYml0cyBpbiB0
aGUgY29tbWFuZA0KPj4+PiArICAgICAqIHJlZ2lzdGVyIGFyZSBhbHJlYWR5IHNldC4gVGh1cywg
YSBndWVzdCBPUyBtYXkgbm90IHdyaXRlIHRvIHRoZQ0KPj4+PiArICAgICAqIGNvbW1hbmQgcmVn
aXN0ZXIgdG8gdXBkYXRlIG1lbW9yeSBkZWNvZGluZywgc28gZ3Vlc3QgbWFwcGluZ3MNCj4+Pj4g
KyAgICAgKiAoZ3Vlc3QncyB2aWV3IG9mIHRoZSBCQVJzKSBhcmUgbGVmdCBub3QgdXBkYXRlZC4N
Cj4+Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIFBD
SV9DT01NQU5ELCAwKTsNCj4+PiBDYW4geW91IHJlYWxseSBibGluZGx5IHdyaXRlIDAgaGVyZT8g
V2hhdCBhYm91dCBiaXRzIHRoYXQgaGF2ZSB0byBiZQ0KPj4+IHVuZGVyIGhvc3QgY29udHJvbCwg
ZS5nLiBJTlRYX0RJU0FCTEU/IEkgY2FuIHNlZSB0aGF0IHlvdSBtYXkgd2FudCB0bw0KPj4+IGhh
bmQgb2ZmIHdpdGggSS9PIGFuZCBtZW1vcnkgZGVjb2Rpbmcgb2ZmIGFuZCBidXMgbWFzdGVyaW5n
IGRpc2FibGVkLA0KPj4+IGJ1dCBmb3IgZXZlcnkgb3RoZXIgYml0IChpbmNsdWRpbmcgcmVzZXJ2
ZWQgb25lcykgSSdkIGV4cGVjdCBzZXBhcmF0ZQ0KPj4+IGp1c3RpZmljYXRpb24gKGluIHRoZSBj
b21taXQgbWVzc2FnZSkuDQo+PiBBY2NvcmRpbmcgdG8gIlBDSSBMT0NBTCBCVVMgU1BFQ0lGSUNB
VElPTiwgUkVWLiAzLjAiIEkgaGF2ZSBhdCBoYW5kLA0KPj4gc2VjdGlvbiAiNi4yLjIgRGV2aWNl
IENvbnRyb2wiIHNheXMgdGhhdCB0aGUgcmVzZXQgc3RhdGUgb2YgdGhlIGNvbW1hbmQNCj4+IHJl
Z2lzdGVyIGlzIHR5cGljYWxseSAwLCBzbyB0aGlzIGlzIHdoeSBJIGNob3NlIHRvIHdyaXRlIDAg
aGVyZSwgZS5nLg0KPj4gbWFrZSB0aGUgY29tbWFuZCByZWdpc3RlciBhcyBpZiBpdCBpcyBhZnRl
ciB0aGUgcmVzZXQuDQo+Pg0KPj4gV2l0aCByZXNwZWN0IHRvIGhvc3QgY29udHJvbDogd2UgY3Vy
cmVudGx5IGRvIG5vdCByZWFsbHkgZW11bGF0ZSBjb21tYW5kDQo+PiByZWdpc3RlciB3aGljaCBw
cm9iYWJseSB3YXMgb2sgZm9yIHg4NiBQVkggRG9tMCBhbmQgdGhpcyBtaWdodCBub3QgYmUgdGhl
DQo+PiBjYXNlIG5vdyBhcyB3ZSBhZGQgRG9tVSdzLiBUaGF0IGJlaW5nIHNhaWQ6IGluIG15IGlt
cGxlbWVudGF0aW9uIGd1ZXN0IGNhbg0KPj4gYWx0ZXIgY29tbWFuZCByZWdpc3RlciBhcyBpdCB3
YW50cyB3aXRob3V0IHJlc3RyaWN0aW9ucy4NCj4+IElmIHdlIHNlZSBpdCBkb2VzIG5lZWQgcHJv
cGVyIGVtdWxhdGlvbiB0aGVuIHdlIHdvdWxkIG5lZWQgYWRkaW5nIHRoYXQgYXMNCj4+IHdlbGwg
KGlzIG5vdCBwYXJ0IG9mIHRoaXMgc2VyaWVzIHRob3VnaCkuDQo+Pg0KPj4gTWVhbndoaWxlLCBJ
IGFncmVlIHRoYXQgd2UgY2FuIG9ubHkgcmVzZXQgSU8gc3BhY2UsIG1lbW9yeSBzcGFjZSBhbmQg
YnVzDQo+PiBtYXN0ZXIgYml0cyBhbmQgbGVhdmUgdGhlIHJlc3QgdW50b3VjaGVkLiBCdXQgYWdh
aW4sIHdpdGhvdXQgcHJvcGVyIGNvbW1hbmQNCj4+IHJlZ2lzdGVyIGVtdWxhdGlvbiBndWVzdHMg
Y2FuIHN0aWxsIHNldCB3aGF0IHRoZXkgd2FudC4NCj4gWWVzLCB3cml0ZXMgdG8gdGhlIHJlZ2lz
dGVyIHdpbGwgbmVlZCBlbXVsYXRpbmcgZm9yIERvbVUuDQoNCkJ1dCB0aGVuIEkgYW0gd29uZGVy
aW5nIHRvIHdoYXQgZXh0ZW50IHdlIG5lZWQgdG8gZW11bGF0ZSB0aGUgY29tbWFuZA0KDQpyZWdp
c3Rlcj8gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIGJpdHMgaW4gdGhlIGNvbW1hbmQgcmVnaXN0ZXI6
DQoNCiNkZWZpbmXCoCBQQ0lfQ09NTUFORF9JT8KgwqDCoCDCoMKgwqAgMHgxwqDCoMKgIC8qIEVu
YWJsZSByZXNwb25zZSBpbiBJL08gc3BhY2UgKi8NCiNkZWZpbmXCoCBQQ0lfQ09NTUFORF9NRU1P
UlnCoMKgwqAgMHgywqDCoMKgIC8qIEVuYWJsZSByZXNwb25zZSBpbiBNZW1vcnkgc3BhY2UgKi8N
CiNkZWZpbmXCoCBQQ0lfQ09NTUFORF9NQVNURVLCoMKgwqAgMHg0wqDCoMKgIC8qIEVuYWJsZSBi
dXMgbWFzdGVyaW5nICovDQojZGVmaW5lwqAgUENJX0NPTU1BTkRfU1BFQ0lBTMKgwqDCoCAweDjC
oMKgwqAgLyogRW5hYmxlIHJlc3BvbnNlIHRvIHNwZWNpYWwgY3ljbGVzICovDQojZGVmaW5lwqAg
UENJX0NPTU1BTkRfSU5WQUxJREFURcKgwqDCoCAweDEwwqDCoMKgIC8qIFVzZSBtZW1vcnkgd3Jp
dGUgYW5kIGludmFsaWRhdGUgKi8NCiNkZWZpbmXCoCBQQ0lfQ09NTUFORF9WR0FfUEFMRVRURSAw
eDIwwqDCoMKgIC8qIEVuYWJsZSBwYWxldHRlIHNub29waW5nICovDQojZGVmaW5lwqAgUENJX0NP
TU1BTkRfUEFSSVRZwqDCoMKgIDB4NDDCoMKgwqAgLyogRW5hYmxlIHBhcml0eSBjaGVja2luZyAq
Lw0KI2RlZmluZcKgIFBDSV9DT01NQU5EX1dBSVQgwqDCoMKgIDB4ODDCoMKgwqAgLyogRW5hYmxl
IGFkZHJlc3MvZGF0YSBzdGVwcGluZyAqLw0KI2RlZmluZcKgIFBDSV9DT01NQU5EX1NFUlLCoMKg
wqAgMHgxMDDCoMKgwqAgLyogRW5hYmxlIFNFUlIgKi8NCiNkZWZpbmXCoCBQQ0lfQ09NTUFORF9G
QVNUX0JBQ0vCoMKgwqAgMHgyMDDCoMKgwqAgLyogRW5hYmxlIGJhY2stdG8tYmFjayB3cml0ZXMg
Ki8NCiNkZWZpbmXCoCBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgMHg0MDAgLyogSU5UeCBFbXVs
YXRpb24gRGlzYWJsZSAqLw0KDQpXZSB3YW50IHRoZSBndWVzdCB0byBhY2Nlc3MgZGlyZWN0bHkg
YXQgbGVhc3QgSS9PIGFuZCBtZW1vcnkgZGVjb2RpbmcgYW5kIGJ1cyBtYXN0ZXJpbmcNCg0KYml0
cywgYnV0IGhvdyBkbyB3ZSBlbXVsYXRlIHRoZSByZXN0PyBEbyB5b3UgbWVhbiB3ZSBjYW4gbWF0
Y2ggdGhlIHJlc3QgdG8gd2hhdCBob3N0DQoNCnVzZXMgZm9yIHRoZSBkZXZpY2UsIGxpa2UgUENJ
X0NPTU1BTkRfSU5UWF9ESVNBQkxFIGJpdD8gSWYgc28sIGFzIHBlciBteSB1bmRlcnN0YW5kaW5n
LA0KDQp0aG9zZSBiaXRzIGdldCBzZXQvY2xlYXJlZCB3aGVuIGEgZGV2aWNlIGlzIGVuYWJsZWQs
IGUuZy4gYnkgTGludXgga2VybmVsL2RldmljZSBkcml2ZXIgZm9yIGV4YW1wbGUuDQoNClNvLCBp
ZiB3ZSBoYXZlIGEgaGlkZGVuIFBDSSBkZXZpY2Ugd2hpY2ggY2FuIGJlIGFzc2lnbmVkIHRvIGEg
Z3Vlc3QgYW5kIGl0IGlzIGxpdGVyYWxseSB1bnRvdWNoZWQNCg0KKG5vdCBlbmFibGVkIGluIERv
bTApIHRoZW4gSSB0aGluayB0aGVyZSB3aWxsIGJlIG5vIHN1Y2ggcmVmZXJlbmNlIGFzICJob3N0
IGFzc2lnbmVkIHZhbHVlcyIgYXMNCg0KbW9zdCBwcm9iYWJseSB0aGUgY29tbWFuZCByZWdpc3Rl
ciB3aWxsIHJlbWFpbiBpbiBpdHMgYWZ0ZXIgcmVzZXQgc3RhdGUuDQoNClRodXMsIEkgYW0gbm90
IHF1aXRlIHN1cmUgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgY2FuIGVhc2lseSBiZSBlbXVsYXRlZC4N
Cg0KUGxlYXNlIGNvcnJlY3QgbWUgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyB3cm9uZyBoZXJlLg0K
DQo+ICAgUmVwb3J0aW5nIHRoZQ0KPiBlbXVsYXRlZCByZWdpc3RlciBhcyB6ZXJvIGluaXRpYWxs
eSBpcyBwcm9iYWJseSBhbHNvIHF1aXRlIGZpbmUgKHRvDQo+IG1hdGNoLCBhcyB5b3Ugc2F5LCBt
YW5kYXRlZCByZXNldCBzdGF0ZSkuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2Fu
ZHINCg==

