Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABB9606291
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 16:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426832.675553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWHz-0004qo-LN; Thu, 20 Oct 2022 14:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426832.675553; Thu, 20 Oct 2022 14:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWHz-0004oT-HX; Thu, 20 Oct 2022 14:12:51 +0000
Received: by outflank-mailman (input) for mailman id 426832;
 Thu, 20 Oct 2022 14:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pcz+=2V=epam.com=prvs=22920ca83a=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1olWHy-0004mw-GW
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 14:12:50 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 457b3caa-5081-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 16:12:47 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KDSQR4032470;
 Thu, 20 Oct 2022 14:12:35 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3kahuen4yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 14:12:35 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS8PR03MB7939.eurprd03.prod.outlook.com (2603:10a6:20b:426::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.28; Thu, 20 Oct
 2022 14:12:31 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::93be:22b1:654c:e4bc]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::93be:22b1:654c:e4bc%5]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 14:12:31 +0000
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
X-Inumbo-ID: 457b3caa-5081-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H04TIrwetXRfZsJna7Wqgrlj+Zj3qSMF1JmSihd8W1Z+HdQCuIhxK8brp1cc95djFlPAWC+yBYRwGh+dLLgOhSwkzPj0YHNTdrNzY2GJyHZ6ehz98Glu9ibHthq5/jzvHZBP06f8uTZmqYs8xl/tQxqXo4GGy32foSUgMdFCMMfSvN9sPHxi2/YmBPp+ilmvSGEKrQQiUe1bD/+kItr96v9HBWjaMsQGhLCwJew0Qjhc/AiCIU2wBKSP8Uu179uDkp8oDNZ+dbY87Y2mhtNvTxnZJW90/R+sRQ0cIXN+IFKyXns/5mzrOBplJyx/mhESHK8Ox0Zx88eVT7KR+Vjypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydXFaMIy1chL1FmcQPcJxnNko47lbx0qOtUoxTLrX78=;
 b=YyvppI+FQMCf3iTgyIO7L9k1g11Z+u7M+YmCDdwWT6D7e0rqfj/RGAWdo8Nxl1KuxoGf+eoCE9HTzymWxvaJHNjDiqdQ7p8d9LOTQswjlvgO96TDuGOMz7JvQl0PWz6i2dgYHY+AQy7MuabJDdErGOqeLwLH5W9chGfQ+NFi4P0MU3nXdGzNW1WoAtbr3XoskUk2RapfjBoee1pQQSer4iNHkag6Dh/W740TqRd9jLqYbA8moajurKR40pnssITzus9HJh9MCEYYrur/LwW1F9nW9+Ro3knnmghED/ZNFpVRh2txovxbRVluhfbXgL8IuyOg0+/drsfnRlk95EfKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydXFaMIy1chL1FmcQPcJxnNko47lbx0qOtUoxTLrX78=;
 b=WH1oWmTT0FbxJzuqITmN73ujdE/ygpd8CNYvOESeZFE6ShQor14XUffGA75sZUcpOVAQr6DklBSucZ0dMvOb3+tkVeut12hSuYmTlqvfLbBFHzER7SxOaHra3ghTLbVIjXcuLOpQ8brRUBY0xeO5ZtGwIPnNXp+mKpmvsQW4RylM7lAXvj3SisyHKmEG1GgDVoST+rOCMVECS8FK0X0RNqeYfMIF2uG21BuxwMPAFFhf3zJ/FpNuoFtTdgXyS8s2NBRhxWUPxQoOghZKIvjbHkOKMO9B6d8iluBVcwkkZPFzYPkQv7GmXK29G2EMQPilz+A1AbxP7Yo5MZUMW29W6Q==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Juergen Gross
	<jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr
 Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V2] xen/virtio: Handle PCI devices which Host controller
 is described in DT
Thread-Topic: [PATCH V2] xen/virtio: Handle PCI devices which Host controller
 is described in DT
Thread-Index: AQHY4Kumvdf5iGxWnUC7MiB1sxm3b64U6lSAgACDRYCAALaPgIAA1SMAgABhSgA=
Date: Thu, 20 Oct 2022 14:12:31 +0000
Message-ID: <ded6c520-8f1a-6ee3-bbfa-3de7e1f74779@epam.com>
References: <20221015153409.918775-1-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2210181734440.4587@ubuntu-linux-20-04-desktop>
 <19823a2a-bc84-5458-bb69-7ac0c1b81573@gmail.com>
 <41b56c3f-1b81-a953-2e75-5a3ab8ef82a2@epam.com>
 <da0d72d1-3398-8005-1c40-b5f341ff9fc8@gmail.com>
In-Reply-To: <da0d72d1-3398-8005-1c40-b5f341ff9fc8@gmail.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS8PR03MB7939:EE_
x-ms-office365-filtering-correlation-id: b32f40b6-0207-4b10-5bc2-08dab2a520ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tCGTgBwvU6wz0ci5IYZDQ80QMNXk/6kPltQKYdWdVbjLKxHUROWChC9N/fXCESrTEXGoFtIhm9Lzw98TEsN7tKKayio+annHGYCJOKrnCb9/2tL9xYji5etQrOMpNX84HAdef9HYm5bH35ntHhHmco+xFwvLUwKUd3FL1sT0PxjvRcw1Kg/wFhS4X56AMEGsOqm/bZgsL/Y77uTzCiIpGkuy988/jK/XWwlLHoXCzJoTak0hqAcbz92y56uZTTKb/iU/u3JEjV5Xw7Kdx8PL9g7uBCwRYVpv0HWnVwjTv3REq8jX+JaLyfdQQyzQ+m5G2mf9ABEbLL8Ylbk0YNeTfdQBnO8RAe9F32KK9C/MejBieJEUIxjmCImDI9FtPNqYKcpsr+48M4jLOdfeY4rcFUb0k2MbZIUPfi/pkIr8aq7viG8U7hkbkEwPlyJ0pswo5PAfx7RMoXk9Ys/UhSCsm1MjAJuOkN/uM71MIQ4OPR+NBuoRzci2kQkE6DefxNNZ1KB7xvop6EzsevtxgCTWyPB+6I0XB+z/DZ/wcrvNN4AI9RpAtxP9vFp+FnKHc/xhrjjOuEG/PFaQO26kPCnM5CX75SyyP/2jv2XgEVvOf5CEBqm673LSBWxT1C/7xr91dkduPOLHL95nfsP63SDfmvXBwH6eFHt3M6mPQQMj8mZZEh4pozy/ieOrbDeat2MhxhCJvs5QAiqor5xcjrC/xcvv2Eqeo8+t+MEpA8eYhBfPLZEwSK8TLSt6cwRGpaXqknp7W2Lmm9ZJaQLpvs0qAJrFA1vc67mMdpNsXcrSs11rbYZnDNRs87fcgL78q/ADmAkJA+Q1a8KyZOgF/w+qiYA5Mml6O0vOe7IZVVnB2UVMawJ0rIwmshFgL5Ayz2Vf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199015)(6916009)(316002)(31686004)(71200400001)(66476007)(66556008)(91956017)(66946007)(478600001)(54906003)(64756008)(66446008)(76116006)(966005)(8676002)(4326008)(6486002)(6506007)(53546011)(55236004)(41300700001)(8936002)(5660300002)(2616005)(26005)(186003)(2906002)(6512007)(30864003)(122000001)(83380400001)(38070700005)(36756003)(38100700002)(31696002)(86362001)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RkZlZ0ZhL1hjZXNKZ2I3NmpQMTM1bVV2VWw5NmVLYndNZzhGemxxSVF6NUNP?=
 =?utf-8?B?UDdvTkxFaDBXYVdibm12WFpNWXU3SVBjc0FBMEFCbzhjamd4VzRsV1ZGY2xE?=
 =?utf-8?B?SWlMYVU1Tmc3ZEpORUZZMlJYd1NWMEo2amR5TGVIRmxlclJHVDFsN2Y4enpo?=
 =?utf-8?B?bmhOV2d6dXpHRHYrU1pMTGl1Mi90MHZFRzNodExUcWs1V052QkYzZWttalNK?=
 =?utf-8?B?WWYxZXFaSzEyZ3ZUb1RqTVUvRVBRYWcwaWdjQStSVGViWG82RCtqRkNORDJB?=
 =?utf-8?B?WE11czY2bk0rWVNJZXo1bTdNRnd5S0VTbE45Y05YVjJFT1dSbmNOdlRFMDVy?=
 =?utf-8?B?cmtJNEpHeVJCVzNaSnpFeHVJV0I2OVp5QW9DdmVWR3pJcFArbWRqQmxwdGhS?=
 =?utf-8?B?QndQWFNYNW9nT2t6bVQ5WS9xMnVzcjlNaWFDbU5tdTFhM1QyaU9SRlVSaWVt?=
 =?utf-8?B?TWUraWNNSytkU2dqVHUrRDB5RzRJbXJGVS9SN0djdUNaWXZPZjBXdHhIV3Nu?=
 =?utf-8?B?WExFR05iMWJENjZNdFE3L0pITjRhbEtwalFqUU00K0V6Rnc1cmoxUG4rSTJT?=
 =?utf-8?B?K3Y1Zm1sT0FZQzg1OTJYMzdZVzFITzdiRFh5SGpMMXJNMzBvUTZaYzZRZTVq?=
 =?utf-8?B?K0E4Nkc5bjdwYXpYeVBpTW02VEwybVFvQzU4QTFPeHZPbkhLMmZFcTJ3Rng2?=
 =?utf-8?B?YWM3alUySG9xTENRZitLek1KL3F2Q3hrTjFPZlVxK2hZRUdET01ETUZEWWNT?=
 =?utf-8?B?ZzFlWnkzY0o1L0M2Vy9yMUtmUjEwNDRBSThNcHZ4KzhKK0pEbmh3NWkyN3Fs?=
 =?utf-8?B?RmpMMlZIY0xDVkNlMTJ1ODdTcjdIWjQxVHJDZjV4eVhuVmszMTFpODR2d2ds?=
 =?utf-8?B?WXhtTi9ja1ExWlBXOGx2S0h1am9IYVlDRnhpNTgxRGFFdG9oazhQTUxhQXZL?=
 =?utf-8?B?bGxMaWx3R0l0UDRDeVB6aUZoaGVHZXdQYkVPNkZqNkFQclpCSFhmSUF2U1lo?=
 =?utf-8?B?dEV4SnEwdGx4dUNKOGtpaGtnNlNOcWNIL3pGS1p1d0tNdFl2UmlITnc5YlN5?=
 =?utf-8?B?OGVmQm5MM1RLWUFzMExUSStqaG1DN1c2RjRXSyswdVZyUk96Y1BnTE1UYlpS?=
 =?utf-8?B?WVc4NnpQVmVXb3hkNG81eW9TYnZBdk5SMnpGdkQ3R2VjZXozTVExUjV3ek1z?=
 =?utf-8?B?bENwc2pqUDBwN0hDdldFckRkbkpZQVRVcWtleU9QdlIyd1p6MjFtRTNIcmF6?=
 =?utf-8?B?akROQ2NzT1pyZGNOUFhyQXRobXNJK0dFcnpySk5HaXhNWERHYzcvTFE2VVhP?=
 =?utf-8?B?QjVkSVI3Zis5ZXF1cDhGVFpDT1ljVHRJbUZiaXhabmUwdmYzZjhCdm5tWTN6?=
 =?utf-8?B?MDZzTTJWMFg2VEI5RGViaVhpdVRVRXZ4Ti9NSURSelJvR1o0V1dIYlc0R1N6?=
 =?utf-8?B?MlRUa2dvVVBYSmlKWGszQ3V0VE5uR0trOGF3ZGFZOGdHZVVRdUdlQmw3R1lY?=
 =?utf-8?B?eEtnM21mcDM1c25qZHRJR0djQzd3YTFIOTBEcFFrMkxDdGR2Wm13M1k4dGxT?=
 =?utf-8?B?cHpDZ3RFZnlCdGcrUnBaL0NGNllSZjZydXZMeVdYRCt5WkVXY3VIQlRtMjdl?=
 =?utf-8?B?Y2EvNFQyakE0dzFvdkR0UzdrZkFYQkRUTlZVU2xZTk80bERUZ0MvMGxLb2lu?=
 =?utf-8?B?SnhLWk45VUp6VFpEVjBSTHhGTnhpejhJaHVEOEVNb1cramxSZG5yVThpTnBz?=
 =?utf-8?B?YlR0T3BVNkpMNzk5OE9JTmc4QmRyZzViWGNyS0ZKWnZsZHpkTnJWaGxrbkto?=
 =?utf-8?B?SzdVemNoNEc5QXRpMnBSUGY2NmtOcFN4OVZ1QnFVdzVpbG5HU3VaME45Qk5k?=
 =?utf-8?B?Rll1UGJxdXQvY1VwdUU4VGhFZXlIZlc0UmkwdmpwVXFNVnhRVENDVnFDSEZH?=
 =?utf-8?B?M2dCNFNraStHdlIzNzBWYm5oVWpVOXp0enI3ajY0R1BGTVB4eEJlNXY3SW5G?=
 =?utf-8?B?RW56a3ZKb3NPVEQvSENhZWpnUzZKaUZ0Zjhrc21MMExwS2I2K29CaDRBakV2?=
 =?utf-8?B?UStPZDJ1NmlHM2NkZjhZWDhJNG5GaW1YNUl4L1pOTzBRTEF3ZWsxVkdNd2hN?=
 =?utf-8?B?amVNNGY0LzBsRXk4UUNxR01SempwTUV3MVMrbXBjQ2l6VDF4dStBc0dsTnFW?=
 =?utf-8?Q?rKGpv/+FBHd/4meTE1/J0Ac=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17DA34C02769AD429D3679361248C07E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32f40b6-0207-4b10-5bc2-08dab2a520ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 14:12:31.7808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+O1NC1mfJuXO41mWUXsUopJ8cZxlU0EeNbvNjjD7Asc5iv7pczE9i+1Ap8eBjYTTIniaIXuJ99hhcPmlQiuUX2wsntDDZOPRmuLPGid8Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7939
X-Proofpoint-ORIG-GUID: 86xUW2O90f1br-LSDZvQiLEPmwKGInZN
X-Proofpoint-GUID: 86xUW2O90f1br-LSDZvQiLEPmwKGInZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_05,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200084

DQpPbiAyMC4xMC4yMiAxMToyNCwgWGVuaWEgUmFnaWFkYWtvdSB3cm90ZToNCj4gT24gMTAvMTkv
MjIgMjI6NDEsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPg0KPiBIaSBPbGVrc2FuZHIN
Cg0KDQpIZWxsbyBYZW5pYQ0KDQoNCj4NCj4+DQo+PiBPbiAxOS4xMC4yMiAxMTo0NywgWGVuaWEg
UmFnaWFkYWtvdSB3cm90ZToNCj4+DQo+PiBIZWxsbyBYZW5pYQ0KPj4NCj4+PiBPbiAxMC8xOS8y
MiAwMzo1OCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBTYXQsIDE1IE9jdCAy
MDIyLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IEZyb206IE9sZWtzYW5kciBU
eXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+DQo+Pj4+PiBV
c2UgdGhlIHNhbWUgInhlbi1ncmFudC1kbWEiIGRldmljZSBjb25jZXB0IGZvciB0aGUgUENJIGRl
dmljZXMNCj4+Pj4+IGJlaGluZCBkZXZpY2UtdHJlZSBiYXNlZCBQQ0kgSG9zdCBjb250cm9sbGVy
LCBidXQgd2l0aCBvbmUNCj4+Pj4+IG1vZGlmaWNhdGlvbi4NCj4+Pj4+IFVubGlrZSBmb3IgcGxh
dGZvcm0gZGV2aWNlcywgd2UgY2Fubm90IHVzZSBnZW5lcmljIElPTU1VIGJpbmRpbmdzDQo+Pj4+
PiAoaW9tbXVzIHByb3BlcnR5KSwgYXMgd2UgbmVlZCB0byBzdXBwb3J0IG1vcmUgZmxleGlibGUg
Y29uZmlndXJhdGlvbi4NCj4+Pj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgUENJIGRldmljZXMgdW5k
ZXIgdGhlIHNpbmdsZSBQQ0kgSG9zdCBjb250cm9sbGVyDQo+Pj4+PiBtYXkgaGF2ZSB0aGUgYmFj
a2VuZHMgcnVubmluZyBpbiBkaWZmZXJlbnQgWGVuIGRvbWFpbnMgYW5kIHRodXMgaGF2ZQ0KPj4+
Pj4gZGlmZmVyZW50IGVuZHBvaW50cyBJRCAoYmFja2VuZCBkb21haW5zIElEKS4NCj4+Pj4+DQo+
Pj4+PiBTbyB1c2UgZ2VuZXJpYyBQQ0ktSU9NTVUgYmluZGluZ3MgaW5zdGVhZCAoaW9tbXUtbWFw
L2lvbW11LW1hcC1tYXNrDQo+Pj4+PiBwcm9wZXJ0aWVzKSB3aGljaCBhbGxvd3MgdXMgdG8gZGVz
Y3JpYmUgcmVsYXRpb25zaGlwIGJldHdlZW4gUENJDQo+Pj4+PiBkZXZpY2VzIGFuZCBiYWNrZW5k
IGRvbWFpbnMgSUQgcHJvcGVybHkuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pg0KPj4+
PiBOb3cgdGhhdCBJIHVuZGVyc3Rvb2QgdGhlIGFwcHJvYWNoIGFuZCB0aGUgcmVhc29ucyBmb3Ig
aXQsIEkgY2FuIA0KPj4+PiByZXZpZXcNCj4+Pj4gdGhlIHBhdGNoIDotKQ0KPj4+Pg0KPj4+PiBQ
bGVhc2UgYWRkIGFuIGV4YW1wbGUgb2YgdGhlIGJpbmRpbmdzIGluIHRoZSBjb21taXQgbWVzc2Fn
ZS4NCj4+Pj4NCj4+Pj4NCj4+Pj4+IC0tLQ0KPj4+Pj4gU2xpZ2h0bHkgUkZDLiBUaGlzIGlzIG5l
ZWRlZCB0byBzdXBwb3J0IFhlbiBncmFudCBtYXBwaW5ncyBmb3INCj4+Pj4+IHZpcnRpby1wY2kg
ZGV2aWNlcw0KPj4+Pj4gb24gQXJtIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZS4gVGhlIFhl
biB0b29sc3RhY2sgc2lkZSBpcyBub3QNCj4+Pj4+IGNvbXBsZXRlbHkgcmVhZHkgeWV0Lg0KPj4+
Pj4gSGVyZSwgZm9yIFBDSSBkZXZpY2VzIHdlIHVzZSBtb3JlIGZsZXhpYmxlIHdheSB0byBwYXNz
IGJhY2tlbmQgZG9taWQNCj4+Pj4+IHRvIHRoZSBndWVzdA0KPj4+Pj4gdGhhbiBmb3IgcGxhdGZv
cm0gZGV2aWNlcy4NCj4+Pj4+DQo+Pj4+PiBDaGFuZ2VzIFYxIC0+IFYyOg0KPj4+Pj4gwqDCoMKg
wqAgLSB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uDQo+Pj4+PiDCoMKgwqDCoCAtIHJlYmFzZQ0K
Pj4+Pj4gwqDCoMKgwqAgLSByZXdvcmsgdG8gdXNlIGdlbmVyaWMgUENJLUlPTU1VIGJpbmRpbmdz
IGluc3RlYWQgb2YgZ2VuZXJpYw0KPj4+Pj4gSU9NTVUgYmluZGluZ3MNCj4+Pj4+DQo+Pj4+PiBQ
cmV2aW91cyBkaXNjdXNzaW9uIGlzIGF0Og0KPj4+Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIyMTAwNjE3NDgwNC4yMDAz
MDI5LTEtb2xla3N0eXNoQGdtYWlsLmNvbS9fXzshIUdGXzI5ZGJjUUlVQlBBITMtdnE3RWRtM1hm
S3RENWNuTmpuT3pEUXZ1b19YcmhKNzN5SC1uUGZxT2tHR1UwSWpMRzdSN01SX25BSkNBUGVPdXRI
UkxUNDR3S1l3UXd6M1NhdUFDaWVfWkF5JCANCj4+Pj4+DQo+Pj4+PiBbbG9yZVsuXWtlcm5lbFsu
XW9yZ10NCj4+Pj4+DQo+Pj4+PiBCYXNlZCBvbjoNCj4+Pj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC94
ZW4vdGlwLmdpdC9sb2cvP2g9Zm9yLWxpbnVzLTYuMV9fOyEhR0ZfMjlkYmNRSVVCUEEhMy12cTdF
ZG0zWGZLdEQ1Y25Oam5PekRRdnVvX1hyaEo3M3lILW5QZnFPa0dHVTBJakxHN1I3TVJfbkFKQ0FQ
ZU91dEhSTFQ0NHdLWXdRd3ozU2F1QUVuTURIQXEkIA0KPj4+Pj4NCj4+Pj4+IFtnaXRbLl1rZXJu
ZWxbLl1vcmddDQo+Pj4+PiAtLS0NCj4+Pj4+IMKgwqAgZHJpdmVycy94ZW4vZ3JhbnQtZG1hLW9w
cy5jIHwgODcNCj4+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4+
Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMg
DQo+Pj4+PiBiL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYw0KPj4+Pj4gaW5kZXggZGFhNTI1
ZGY3YmRjLi5iNzlkOWQ2Y2UxNTQgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi9ncmFu
dC1kbWEtb3BzLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYw0KPj4+
Pj4gQEAgLTEwLDYgKzEwLDcgQEANCj4+Pj4+IMKgwqAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pg0KPj4+Pj4gwqDCoCAjaW5jbHVkZSA8bGludXgvZG1hLW1hcC1vcHMuaD4NCj4+Pj4+IMKgwqAg
I2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPj4+
Pj4gwqDCoCAjaW5jbHVkZSA8bGludXgvcGZuLmg+DQo+Pj4+PiDCoMKgICNpbmNsdWRlIDxsaW51
eC94YXJyYXkuaD4NCj4+Pj4+IMKgwqAgI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19hbmNob3IuaD4N
Cj4+Pj4+IEBAIC0yOTIsMTIgKzI5Myw1NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9tYXBf
b3BzDQo+Pj4+PiB4ZW5fZ3JhbnRfZG1hX29wcyA9IHsNCj4+Pj4+IMKgwqDCoMKgwqDCoCAuZG1h
X3N1cHBvcnRlZCA9IHhlbl9ncmFudF9kbWFfc3VwcG9ydGVkLA0KPj4+Pj4gwqDCoCB9Ow0KPj4+
Pj4gwqDCoCArc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqeGVuX2R0X2dldF9wY2lfaG9zdF9u
b2RlKHN0cnVjdCBkZXZpY2UNCj4+Pj4+ICpkZXYpDQo+Pj4+PiArew0KPj4+Pj4gK8KgwqDCoCBz
dHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsNCj4+Pj4+ICvCoMKgwqAgc3Ry
dWN0IHBjaV9idXMgKmJ1cyA9IHBkZXYtPmJ1czsNCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqAgLyog
V2FsayB1cCB0byB0aGUgcm9vdCBidXMgdG8gbG9vayBmb3IgUENJIEhvc3QgY29udHJvbGxlciAq
Lw0KPj4+Pj4gK8KgwqDCoCB3aGlsZSAoIXBjaV9pc19yb290X2J1cyhidXMpKQ0KPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGJ1cyA9IGJ1cy0+cGFyZW50Ow0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqDCoCBy
ZXR1cm4gb2Zfbm9kZV9nZXQoYnVzLT5icmlkZ2UtPnBhcmVudC0+b2Zfbm9kZSk7DQo+Pj4+PiAr
fQ0KPj4+Pg0KPj4+PiBJdCBzZWVtcyBzaWxseSB0aGF0IHdlIG5lZWQgdG8gd2FsayB0aGUgaGll
cmFjaHkgdGhhdCB3YXksIGJ1dCBJDQo+Pj4+IGNvdWxkbid0IGZpbmQgYW5vdGhlciB3YXkgdG8g
ZG8gaXQNCj4+Pj4NCj4+Pj4NCj4+Pj4+ICtzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICp4ZW5f
ZHRfZ2V0X25vZGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPj4+Pj4gK3sNCj4+Pj4+ICvCoMKgwqAg
aWYgKGRldl9pc19wY2koZGV2KSkNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4geGVuX2R0
X2dldF9wY2lfaG9zdF9ub2RlKGRldik7DQo+Pj4+PiArDQo+Pj4+PiArwqDCoMKgIHJldHVybiBv
Zl9ub2RlX2dldChkZXYtPm9mX25vZGUpOw0KPj4+Pj4gK30NCj4+Pj4+ICsNCj4+Pj4+ICtzdGF0
aWMgaW50IHhlbl9kdF9tYXBfaWQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25v
ZGUNCj4+Pj4+ICoqaW9tbXVfbnAsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUz
MiAqc2lkKQ0KPj4+Pj4gK3sNCj4+Pj4+ICvCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0
b19wY2lfZGV2KGRldik7DQo+Pj4+PiArwqDCoMKgIHUzMiByaWQgPSBQQ0lfREVWSUQocGRldi0+
YnVzLT5udW1iZXIsIHBkZXYtPmRldmZuKTsNCj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9u
b2RlICpob3N0X25wOw0KPj4+Pj4gK8KgwqDCoCBpbnQgcmV0Ow0KPj4+Pj4gKw0KPj4+Pj4gK8Kg
wqDCoCBob3N0X25wID0geGVuX2R0X2dldF9wY2lfaG9zdF9ub2RlKGRldik7DQo+Pj4+PiArwqDC
oMKgIGlmICghaG9zdF9ucCkNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsN
Cj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqAgcmV0ID0gb2ZfbWFwX2lkKGhvc3RfbnAsIHJpZCwgImlv
bW11LW1hcCIsICJpb21tdS1tYXAtbWFzayIsDQo+Pj4+PiBpb21tdV9ucCwgc2lkKTsNCj4+Pj4+
ICvCoMKgwqAgb2Zfbm9kZV9wdXQoaG9zdF9ucCk7DQo+Pj4+PiArwqDCoMKgIHJldHVybiByZXQ7
DQo+Pj4+PiArfQ0KPj4+Pj4gKw0KPj4+Pj4gwqDCoCBzdGF0aWMgYm9vbCB4ZW5faXNfZHRfZ3Jh
bnRfZG1hX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+Pj4+PiDCoMKgIHsNCj4+Pj4+IC3C
oMKgwqAgc3RydWN0IGRldmljZV9ub2RlICppb21tdV9ucDsNCj4+Pj4+ICvCoMKgwqAgc3RydWN0
IGRldmljZV9ub2RlICppb21tdV9ucCA9IE5VTEw7DQo+Pj4+PiDCoMKgwqDCoMKgwqAgYm9vbCBo
YXNfaW9tbXU7DQo+Pj4+PiDCoMKgIC3CoMKgwqAgaW9tbXVfbnAgPSBvZl9wYXJzZV9waGFuZGxl
KGRldi0+b2Zfbm9kZSwgImlvbW11cyIsIDApOw0KPj4+Pj4gK8KgwqDCoCBpZiAoZGV2X2lzX3Bj
aShkZXYpKSB7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHhlbl9kdF9tYXBfaWQoZGV2LCAm
aW9tbXVfbnAsIE5VTEwpKQ0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZh
bHNlOw0KPj4+Pj4gK8KgwqDCoCB9IGVsc2UNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpb21tdV9u
cCA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAiaW9tbXVzIiwgMCk7DQo+Pj4+PiAr
DQo+Pj4+PiDCoMKgwqDCoMKgwqAgaGFzX2lvbW11ID0gaW9tbXVfbnAgJiYNCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoaW9tbXVfbnAs
ICJ4ZW4sZ3JhbnQtZG1hIik7DQo+Pj4+PiDCoMKgwqDCoMKgwqAgb2Zfbm9kZV9wdXQoaW9tbXVf
bnApOw0KPj4+Pj4gQEAgLTMwNyw5ICszNTEsMTcgQEAgc3RhdGljIGJvb2wgeGVuX2lzX2R0X2dy
YW50X2RtYV9kZXZpY2Uoc3RydWN0DQo+Pj4+PiBkZXZpY2UgKmRldikNCj4+Pj4+IMKgwqAgwqAg
Ym9vbCB4ZW5faXNfZ3JhbnRfZG1hX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+Pj4+PiDC
oMKgIHsNCj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4+Pj4+ICsNCj4+
Pj4+IMKgwqDCoMKgwqDCoCAvKiBYWFggSGFuZGxlIG9ubHkgRFQgZGV2aWNlcyBmb3Igbm93ICov
DQo+Pj4+PiAtwqDCoMKgIGlmIChkZXYtPm9mX25vZGUpDQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHhlbl9pc19kdF9ncmFudF9kbWFfZGV2aWNlKGRldik7DQo+Pj4+PiArwqDCoMKgIG5w
ID0geGVuX2R0X2dldF9ub2RlKGRldik7DQo+Pj4+PiArwqDCoMKgIGlmIChucCkgew0KPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGJvb2wgcmV0Ow0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJldCA9IHhlbl9pc19kdF9ncmFudF9kbWFfZGV2aWNlKGRldik7DQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgb2Zfbm9kZV9wdXQobnApOw0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7
DQo+Pj4+PiArwqDCoMKgIH0NCj4+Pj4NCj4+Pj4gV2UgZG9uJ3QgbmVlZCB0byB3YWxrIHRoZSBQ
Q0kgaGllcmFjaHkgdHdpY2UuIE1heWJlIHdlIGNhbiBhZGQgdGhlDQo+Pj4+IG9mX25vZGUgY2hl
Y2sgZGlyZWN0bHkgdG8geGVuX2lzX2R0X2dyYW50X2RtYV9kZXZpY2U/DQo+Pj4+DQo+Pj4NCj4+
PiBJIHRoaW5rIGluIGdlbmVyYWwgd2UgY291bGQgcGFzcyBkaXJlY3RseSB0aGUgaG9zdCBicmlk
Z2UgZGV2aWNlIGlmDQo+Pj4gZGV2X2lzX3BjaShkZXYpICh3aGljaCBjYW4gYmUgcmV0cmlldmVk
IHdpdGgNCj4+PiBwY2lfZ2V0X2hvc3RfYnJpZGdlX2RldmljZSh0b19wY2lfZGV2KGRldiksIGFu
ZCBhZnRlciBkb25lIHdpdGggaXQNCj4+PiBwY2lfcHV0X2hvc3RfYnJpZGdlX2RldmljZShwaGIp
KS4NCj4+PiBTbyB0aGF0LCB4ZW5faXNfZHRfZ3JhbnRfZG1hX2RldmljZSgpIGFuZA0KPj4+IHhl
bl9kdF9ncmFudF9pbml0X2JhY2tlbmRfZG9taWQoKSB3b24ndCBuZWVkIHRvIGRpc2NvdmVyIGl0
IHRoZW1zZWx2ZXMuDQo+Pj4gVGhpcyB3aWxsIHNpbXBsaWZ5IHRoZSBjb2RlLg0KPj4NCj4+DQo+
PiBHb29kIHBvaW50LiBJIGhhdmUgc29tZSByZW1hcmsuIENhbiB3ZSB1c2UgcGNpX2ZpbmRfaG9z
dF9icmlkZ2UoKQ0KPj4gaW5zdGVhZD8gVGhpcyB3YXkgd2UgZG9uJ3QgaGF2ZSB0byBhZGQgI2lu
Y2x1ZGUgIi4uL3BjaS9wY2kuaCIsIGFuZCBoYXZlDQo+PiB0byBkcm9wIHJlZmVyZW5jZSBhZnRl
cndhcmRzLg0KPj4NCj4+IFdpdGggdGhhdCB4ZW5fZHRfZ2V0X3BjaV9ob3N0X25vZGUoKSB3aWxs
IGJlY2FtZSB0aGUgZm9sbG93aW5nOg0KPj4NCj4+DQo+PiBzdGF0aWMgc3RydWN0IGRldmljZV9u
b2RlICp4ZW5fZHRfZ2V0X3BjaV9ob3N0X25vZGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPj4gew0K
Pj4gwqAgwqDCoCDCoHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSA9DQo+PiBwY2lfZmlu
ZF9ob3N0X2JyaWRnZSh0b19wY2lfZGV2KGRldiktPmJ1cyk7DQo+Pg0KPj4gwqAgwqDCoCDCoHJl
dHVybiBvZl9ub2RlX2dldChicmlkZ2UtPmRldi5wYXJlbnQtPm9mX25vZGUpOw0KPj4gfQ0KPj4N
Cj4NCj4gWW91IGFyZSByaWdodC4gSSBwcmVmZXIgeW91ciB2ZXJzaW9uIGluc3RlYWQgb2YgdGhl
IGFib3ZlLg0KDQoNCm9rLCB0aGFua3MNCg0KDQo+DQo+DQo+Pg0KPj4gV2l0aCBTdGVmYW5vJ3Mg
c3VnZ2VzdGlvbiwgd2Ugd29uJ3Qgd2FsayB0aGUgUENJIGhpZXJhcmNoeSB0d2ljZSB3aGVuDQo+
PiBleGVjdXRpbmcgeGVuX2lzX2dyYW50X2RtYV9kZXZpY2UoKSBmb3IgUENJIGRldmljZToNCj4+
DQo+PiB4ZW5faXNfZ3JhbnRfZG1hX2RldmljZSgpIC0+IHhlbl9pc19kdF9ncmFudF9kbWFfZGV2
aWNlKCkgLT4NCj4+IHhlbl9kdF9tYXBfaWQoKSAtPiB4ZW5fZHRfZ2V0X3BjaV9ob3N0X25vZGUo
KQ0KPj4NCj4+DQo+PiBXaGF0IGRvIHlvdSB0aGluaz8NCj4+DQo+DQo+IEkgd2FzIHRoaW5raW5n
IHBhc3NpbmcgdGhlIGRldmljZV9ub2RlIGFsb25nIHdpdGggdGhlIGRldmljZSBpbiB0aGUgDQo+
IGZ1bmN0aW9uIGFyZ3VtZW50cy4gTW9yZSBzcGVjaWZpY2FsbHksIG9mIGRvaW5nIHRoaXMgKG5v
dCB0ZXN0ZWQsIGp1c3QgDQo+IGFuIGlkZWEpOg0KPg0KPiBib29sIHhlbl9pc19ncmFudF9kbWFf
ZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gew0KPiDCoMKgwqAgc3RydWN0IGRldmljZV9u
b2RlICpucDsNCj4gwqDCoMKgIGJvb2wgaGFzX2lvbW11ID0gZmFsc2U7DQo+DQo+IMKgwqDCoCAv
KiBYWFggSGFuZGxlIG9ubHkgRFQgZGV2aWNlcyBmb3Igbm93ICovDQo+IMKgwqDCoCBucCA9IHhl
bl9kdF9nZXRfbm9kZShkZXYpOw0KPiDCoMKgwqAgaWYgKG5wKQ0KPiDCoMKgwqDCoMKgwqDCoCBo
YXNfaW9tbXUgPSB4ZW5faXNfZHRfZ3JhbnRfZG1hX2RldmljZShkZXYsIG5wKTsNCj4gwqDCoMKg
IG9mX25vZGVfcHV0KG5wKTsNCj4gwqDCoMKgIHJldHVybiBoYXNfaW9tbXU7DQo+IH0NCj4NCj4g
c3RhdGljIGJvb2wgeGVuX2lzX2R0X2dyYW50X2RtYV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
LA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQo+IHsNCj4g
wqDCoMKgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqaW9tbXVfbnAgPSBOVUxMOw0KPiDCoMKgwqAgYm9v
bCBoYXNfaW9tbXU7DQo+DQo+IMKgwqDCoCBpZiAoZGV2X2lzX3BjaShkZXYpKSB7DQo+IMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPiDCoMKg
wqDCoHUzMiBpZCA9IFBDSV9ERVZJRChwZGV2LT5idXMtPm51bWJlciwgcGRldi0+ZGV2Zm4pOw0K
PiDCoMKgwqDCoMKgwqDCoCBvZl9tYXBfaWQobnAsIGlkLCAiaW9tbXUtbWFwIiwgImlvbW11LW1h
cC1tYXNrIiwgJmlvbW11X25wLCANCj4gTlVMTCk7DQo+IMKgwqDCoCB9IGVsc2Ugew0KPiDCoMKg
wqDCoMKgwqDCoCBpb21tdV9ucCA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJpb21tdXMiLCAwKTsN
Cj4gwqDCoMKgIH0NCj4NCj4gwqDCoMKgIGhhc19pb21tdSA9IGlvbW11X25wICYmIG9mX2Rldmlj
ZV9pc19jb21wYXRpYmxlKGlvbW11X25wLCANCj4gInhlbixncmFudC1kbWEiKTsNCj4gwqDCoMKg
IG9mX25vZGVfcHV0KGlvbW11X25wKTsNCj4NCj4gwqDCoMKgIHJldHVybiBoYXNfaW9tbXU7DQo+
IH0NCg0KDQpJIGdvdCBpdC4NCg0KeGVuX2lzX2dyYW50X2RtYV9kZXZpY2UoKSBmb3IgVjMgd29u
J3QgY2FsbCB4ZW5fZHRfZ2V0X25vZGUoKSwgYnV0IGNhbGwgDQp4ZW5faXNfZHRfZ3JhbnRfZG1h
X2RldmljZSgpIGRpcmVjdGx5Lg0KDQpzdGF0aWMgYm9vbCB4ZW5faXNfZHRfZ3JhbnRfZG1hX2Rl
dmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQp7DQogwqDCoCDCoHN0cnVjdCBkZXZpY2Vfbm9kZSAq
aW9tbXVfbnAgPSBOVUxMOw0KIMKgwqAgwqBib29sIGhhc19pb21tdTsNCg0KIMKgwqAgwqBpZiAo
ZGV2X2lzX3BjaShkZXYpKSB7DQogwqDCoCDCoMKgwqDCoCBpZiAoeGVuX2R0X21hcF9pZChkZXYs
ICZpb21tdV9ucCwgTlVMTCkpDQogwqDCoCDCoMKgwqDCoCDCoMKgwqAgcmV0dXJuIGZhbHNlOw0K
IMKgwqAgwqB9IGVsc2UgaWYgKGRldi0+b2Zfbm9kZSkNCiDCoMKgIMKgwqDCoMKgIGlvbW11X25w
ID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJpb21tdXMiLCAwKTsNCiDCoMKgIMKg
ZWxzZQ0KIMKgwqAgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOw0KDQogwqDCoCDCoGhhc19pb21tdSA9
IGlvbW11X25wICYmDQogwqDCoCDCoMKgwqDCoCDCoMKgwqAgb2ZfZGV2aWNlX2lzX2NvbXBhdGli
bGUoaW9tbXVfbnAsICJ4ZW4sZ3JhbnQtZG1hIik7DQogwqDCoCDCoG9mX25vZGVfcHV0KGlvbW11
X25wKTsNCg0KIMKgwqAgwqByZXR1cm4gaGFzX2lvbW11Ow0KfQ0KDQpib29sIHhlbl9pc19ncmFu
dF9kbWFfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldikNCnsNCiDCoMKgIMKgLyogWFhYIEhhbmRs
ZSBvbmx5IERUIGRldmljZXMgZm9yIG5vdyAqLw0KIMKgwqAgwqByZXR1cm4geGVuX2lzX2R0X2dy
YW50X2RtYV9kZXZpY2UoZGV2KTsNCn0NCg0KDQoNCj4NCj4gSSAnbSB3b25kZXJpbmcgLi4uIGlz
IGl0IHBvc3NpYmxlIGZvciB0aGUgaG9zdCBicmlkZ2UgZGV2aWNlIG5vZGUgdG8gDQo+IGhhdmUg
dGhlIGlvbW11cyBwcm9wZXJ0eSBzZXQ/IG1lYW5pbmcgdGhhdCBhbGwgb2YgaXRzIHBjaSBkZXZz
IHdpbGwgDQo+IGhhdmUgdGhlIHNhbWUgYmFja2VuZD8NCg0KR29vZCBxdWVzdGlvbi4gSSB0aGlu
aywgaXQgaXMgcG9zc2libGUuLi4gVGhpcyBpcyB0ZWNobmljYWxseSB3aGF0IFYxIGlzIA0KZG9p
bmcuDQoNCg0KQXJlIHlvdSBhc2tpbmcgYmVjYXVzZSB0byBzdXBwb3J0ICJpb21tdXMiIGZvciBQ
Q0kgZGV2aWNlcyBhcyB3ZWxsIHRvIA0KZGVzY3JpYmUgdGhhdCB1c2UtY2FzZSB3aXRoIGFsbCBQ
Q0kgZGV2aWNlcyBoYXZpbmcgdGhlIHNhbWUgZW5kcG9pbnQgSUQgDQooYmFja2VuZCBJRCk/DQpJ
ZiB5ZXMsIEkgdGhpbmssIHRoaXMgY291bGQgYmUgc3RpbGwgZGVzY3JpYmVkIGJ5ICJpb21tdS1t
YXAiIHByb3BlcnR5LCANCnNvbWV0aGluZyBsaWtlIHRoYXQgKGlmIHdlIGRvbid0IHdhbnQgdG8g
ZGVzY3JpYmUgbWFwcGluZyBmb3IgZWFjaCBQQ0kgDQpkZXZpY2Ugb25lLWJ5LW9uZSkuDQoNCmlv
bW11LW1hcCA9IDwweDAgJmlvbW11IFggMHgxPjsNCg0KaW9tbXUtbWFwLW1hc2sgPSA8MHgwPjsN
Cg0Kd2hlcmUgdGhlIFggaXMgYmFja2VuZCBJRC4NCg0KDQpJdCBmZWVscyB0byBtZSB0aGF0IGl0
IHNob3VsZCBiZSB3cml0dGVuIGRvd24gc29tZXdoZXJlIHRoYXQgZm9yIA0KcGxhdGZvcm0gZGV2
aWNlcyB3ZSBleHBlY3QgImlvbW11cyIgYW5kIGZvciBQQ0kgZGV2aWNlcyB3ZSBleHBlY3QgDQoi
aW9tbXUtbWFwL2lvbW11LW1hcC1tYXNrIiB0byBiZSBwcmVzZW50Lg0KDQoNCg0KPg0KPg0KPj4+
DQo+Pj4+DQo+Pj4+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPj4+Pj4gwqDCoCB9DQo+
Pj4+PiBAQCAtMzI1LDEyICszNzcsMTkgQEAgYm9vbCB4ZW5fdmlydGlvX21lbV9hY2Moc3RydWN0
IHZpcnRpb19kZXZpY2UNCj4+Pj4+ICpkZXYpDQo+Pj4+PiDCoMKgIHN0YXRpYyBpbnQgeGVuX2R0
X2dyYW50X2luaXRfYmFja2VuZF9kb21pZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVu
X2dyYW50X2RtYV9kYXRhICpkYXRhKQ0KPj4+Pj4gwqDCoCB7DQo+Pj4+PiAtwqDCoMKgIHN0cnVj
dCBvZl9waGFuZGxlX2FyZ3MgaW9tbXVfc3BlYzsNCj4+Pj4+ICvCoMKgwqAgc3RydWN0IG9mX3Bo
YW5kbGVfYXJncyBpb21tdV9zcGVjID0geyAuYXJnc19jb3VudCA9IDEgfTsNCj4+Pj4+IMKgwqAg
LcKgwqDCoCBpZiAob2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoZGV2LT5vZl9ub2RlLCAiaW9t
bXVzIiwNCj4+Pj4+ICIjaW9tbXUtY2VsbHMiLA0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMCwgJmlvbW11X3NwZWMpKSB7DQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYs
ICJDYW5ub3QgcGFyc2UgaW9tbXVzIHByb3BlcnR5XG4iKTsNCj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVTUkNIOw0KPj4+Pj4gK8KgwqDCoCBpZiAoZGV2X2lzX3BjaShkZXYpKSB7DQo+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHhlbl9kdF9tYXBfaWQoZGV2LCAmaW9tbXVfc3BlYy5u
cCwgaW9tbXVfc3BlYy5hcmdzKSkgew0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
X2VycihkZXYsICJDYW5ub3QgdHJhbnNsYXRlIElEXG4iKTsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRVNSQ0g7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4g
K8KgwqDCoCB9IGVsc2Ugew0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChvZl9wYXJzZV9waGFu
ZGxlX3dpdGhfYXJncyhkZXYtPm9mX25vZGUsICJpb21tdXMiLA0KPj4+Pj4gIiNpb21tdS1jZWxs
cyIsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAsICZpb21tdV9zcGVj
KSkgew0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJDYW5ub3Qg
cGFyc2UgaW9tbXVzIHByb3BlcnR5XG4iKTsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRVNSQ0g7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4gwqDCoMKgwqDC
oMKgIH0NCj4+Pj4+IMKgwqAgwqDCoMKgwqDCoCBpZiAoIW9mX2RldmljZV9pc19jb21wYXRpYmxl
KGlvbW11X3NwZWMubnAsIA0KPj4+Pj4gInhlbixncmFudC1kbWEiKSB8fA0KPj4+Pj4gQEAgLTM1
NCw2ICs0MTMsNyBAQCBzdGF0aWMgaW50DQo+Pj4+PiB4ZW5fZHRfZ3JhbnRfaW5pdF9iYWNrZW5k
X2RvbWlkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+Pj4+IMKgwqAgdm9pZCB4ZW5fZ3JhbnRfc2V0
dXBfZG1hX29wcyhzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+Pj4+PiDCoMKgIHsNCj4+Pj4+IMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgeGVuX2dyYW50X2RtYV9kYXRhICpkYXRhOw0KPj4+Pj4gK8KgwqDCoCBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGRhdGEgPSBmaW5k
X3hlbl9ncmFudF9kbWFfZGF0YShkZXYpOw0KPj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChkYXRhKSB7
DQo+Pj4+PiBAQCAtMzY1LDggKzQyNSwxMyBAQCB2b2lkIHhlbl9ncmFudF9zZXR1cF9kbWFfb3Bz
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoIWRhdGEpDQo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsNCj4+Pj4+IMKgwqAgLcKgwqDCoCBpZiAo
ZGV2LT5vZl9ub2RlKSB7DQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHhlbl9kdF9ncmFudF9p
bml0X2JhY2tlbmRfZG9taWQoZGV2LCBkYXRhKSkNCj4+Pj4+ICvCoMKgwqAgbnAgPSB4ZW5fZHRf
Z2V0X25vZGUoZGV2KTsNCj4+Pj4+ICvCoMKgwqAgaWYgKG5wKSB7DQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgaW50IHJldDsNCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSB4ZW5f
ZHRfZ3JhbnRfaW5pdF9iYWNrZW5kX2RvbWlkKGRldiwgZGF0YSk7DQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgb2Zfbm9kZV9wdXQobnApOw0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOw0KPj4+Pj4gwqDCoMKg
wqDCoMKgIH0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFO
VCkpIHsNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvKGRldiwgIlVzaW5nIGRv
bTAgYXMgYmFja2VuZFxuIik7DQo+Pj4+PiAtLSANCj4+Pj4+IDIuMjUuMQ0KPj4+Pj4NCj4+Pj4N
Cj4+Pg0KPg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5rbw0K

