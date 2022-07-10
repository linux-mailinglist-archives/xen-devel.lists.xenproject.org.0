Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E556D1C4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 00:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364758.594682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAf9j-0000QY-V8; Sun, 10 Jul 2022 22:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364758.594682; Sun, 10 Jul 2022 22:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAf9j-0000OC-S1; Sun, 10 Jul 2022 22:11:59 +0000
Received: by outflank-mailman (input) for mailman id 364758;
 Sun, 10 Jul 2022 22:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cySf=XP=epam.com=prvs=9190cfa08a=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oAf9i-0000O5-2y
 for xen-devel@lists.xenproject.org; Sun, 10 Jul 2022 22:11:58 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef0db89-009d-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 00:11:56 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26AHXL8e024775;
 Sun, 10 Jul 2022 22:11:50 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3h71042uju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Jul 2022 22:11:50 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by HE1PR0301MB2393.eurprd03.prod.outlook.com (2603:10a6:3:68::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Sun, 10 Jul
 2022 22:11:47 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5417.025; Sun, 10 Jul 2022
 22:11:46 +0000
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
X-Inumbo-ID: 4ef0db89-009d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmWy954NtvBhV+7D25hwEgEpRylp4Nyku7Q1LNsX0zupYm2yutdkNzhEZ2A8B2ga9vQ3K0m8U0XDKVvFGgpQ4KjFpafCQ12ZuLvK+JvyukgaznuN5cexQNCWTd1xdRrwMG+7zF7CyjOHZRoMmr08fR7Q7kG1LK/Xycdo07GUa5z2jdjIrPidj6EikwuySI+3xNjHwQMvMZ5h04utupeCU0K2z5/JVZmzzHNBXq/kZAC/ZtMbw2XhBfBrLtyOv4a/NbODRZGZgDo0VVCV6yuefWh29Q6cC1tH/giysvcPpje/NBqzICSeAlvrf7Jj8T+hBOMao42tbhYweZPxpjQ6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snIwBG6HQyuyLhuLbg2nDk33La6TnIs4V8U4r6xt4Ck=;
 b=Jd+/SLLIXTRKVS0+KnY1x9tWp3Qmtk0Tkw97Oq1I/VUYvnNKlWUHJrdi7Jubvn1W+pnAsB6DSzFFoAwZZubLDMZn74i0fNE0KKvKlIf9mGgHSpGsexc38IkcSuRhd3cftxXsHcv3IuzacIfNE1TyZiOCHbuP4Wm09fsM1FJBYkV+Gtyis/SGzRlb0BE+XAn5wb0BK/kK8Txb9qfs9UiMxTfVQjlo2PSJe7PhkxPXtF63Mqr55zAWDrTzbxGY3mjxn6Lv4YDJset1QVxZE6TCSq8FTRb15DakTqTkt5Rfs9Jf+JTDvJSahDkJfJCDkG1j9AQd0ZSz4AWVm9ozEatQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snIwBG6HQyuyLhuLbg2nDk33La6TnIs4V8U4r6xt4Ck=;
 b=Vn0vbImaqVrJaL7cH1aV7OIblZOIb3oLkPWHPruAE/2mJqLZvRjqquB6eO/ixMysRwd4HRdif2NlxT4A57Rtqi15L64aP+2r8DoAS0/Jb5oIXNatQmTk76n6dFGsX2q5h7mAiInfeLjHgBES6X3oR8ODUiFa960ECBQM+9QSmCpKTcPSb/1QdrdDUdlwAs+FJGKl7wclfUwy3BtjLqXMJibahSmKdHb5TsfDbt2yodkfmUSFoQjHBtylMkqAW4Hr4OvipyKsuqSSyQ4e4cqFAfRBkE8e1o2LqmDcZ1UI2MQxRfuXwuhcKJowSMsHZLAavC7hn8CCZ8qbEjIeAmJblg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v10] xen/gntdev: Ignore failure to unmap
 INVALID_GRANT_HANDLE
Thread-Topic: [PATCH v10] xen/gntdev: Ignore failure to unmap
 INVALID_GRANT_HANDLE
Thread-Index: AQHYlKe9qMC33m5o/0mYv55xFOoM+614KsWA
Date: Sun, 10 Jul 2022 22:11:45 +0000
Message-ID: <ccf6557a-2fab-3e7a-e986-41a4e35eaa78@epam.com>
References: <20220710215437.1351-1-demi@invisiblethingslab.com>
In-Reply-To: <20220710215437.1351-1-demi@invisiblethingslab.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6646e8b-79c1-4dec-138c-08da62c12da3
x-ms-traffictypediagnostic: HE1PR0301MB2393:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8WSw7bqkZPtnRzUY3xAVY8JhnBerTczR8ZJg5ChnWpP5FJK+df/TpbsNfRq4a4bZROPx7NDlZW4BzaQ9LsZCOagRMQvZDXiNrnkdBL1JfGXBSkj2POQbMNeAAjYKYePhi7DGPpUNgpQp7X8huXNzUIOpSd448mPzyP1rHAOIuIR52sRBMUfZ/Yr9KRqLGsBLxKWbROJggN9l3Fjx2PffNJQzLDQJFbfaii+61q8DUOc89zTaU5dvQE78XttXwVo8iN03uTHHAQp63bYlzI58noOF1O35Bd5siouqd/NMddCUVyJuGpdod9YipFjK+H3YVtSvShC5lqxfTloiFWHDZHBy5Av4e2tQF5n3JiiBrWBEMJmtuUyypxYrzeQ8NBoJiQEW2zSxVCj9kDBLLECVCoFL4QvOgqthhzqAGlMkwN76nJ4Yts0ZPIzlUvokRTn/1ba84QheyUChoGo5CXAPuH7SAfoUCPgFf8NL8+1bjP6U4g2OvggZb2OgKmiMBk2GBQ9PI4GhSnlwSk2wbftRgfiA+2jnN+NSjMmDk9XsJNZRv7h82rCUOpAPsZJ4PVVUFlkfx+3lHFwPxuZ8R7OzGZ9VUPZAjSxUzkY+PE+sVZ10e2cPf4H3eMxhjF+ZSIvdFYMffjU2kFekBK/FDcVy5BRsVIYn8okvIoiw2HS0vWrETQPFM+rspLG0rikWWqSd178WyMmCEgTNePqbn3TYLaA3e8XRGgVv2Y2sPGg/pF6F5opKmBSfdmbGJKJmgTmKDA6Dp2Hn3XHsPugk790unjVrmrBV5AfCjKbYRQkGISJPKw4gF6McSdalmMFh/AlBu7kPq0waJI067sBnzTNQsJRPx7lk1FCQKCe5gAPZe6g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(5660300002)(6512007)(26005)(478600001)(6506007)(186003)(31686004)(36756003)(83380400001)(8936002)(55236004)(41300700001)(6486002)(2906002)(2616005)(53546011)(38100700002)(38070700005)(76116006)(64756008)(8676002)(66446008)(71200400001)(66556008)(66946007)(4326008)(66476007)(6916009)(86362001)(31696002)(91956017)(316002)(122000001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cGpCaTJGZmRWdGxxMDBvdFJVLzdkMVQzZnF1M1Frb2lPQi96b2RobTk1T2lH?=
 =?utf-8?B?dnd1TzM2MTJKbGJEUlc4dVBkLzM1RW1KbjJOb2x4d1VBZjYrVGtKZDNybU9W?=
 =?utf-8?B?dmRGa0dDK0RpVkR1enFaWHFpOXJKL3RMdGFUMTdkZThSQjN6blk3UkpaaHJD?=
 =?utf-8?B?REpILzAwb3V6UWEyeVdrbUFDSUxaNHhLQ0E3TjVTS3J2Z29aUUtjeUFLa3lM?=
 =?utf-8?B?WURrbkdKd1AwdXlDbDhad0NpazNoSzU2ZzN6UmpsNUNHZWFtOGZMbHQ4OTFX?=
 =?utf-8?B?aG4xT0FweklQY0NNaXhwbGJkVUp1c0R4VUtoT2R2azlLVVp4THZmRmR6WHJO?=
 =?utf-8?B?TlJORklHZGRrUmFkL0VsQ0tRZzd0WDBsR0g3Wi9KN3A4NEdsWUh4bXpKYlNu?=
 =?utf-8?B?eXMxYURGZ1JUVEpWMzkvZCtsMFhYMjRxN3VySnJTQXZYV3pSVVNVTXVRcEJy?=
 =?utf-8?B?WWdpaTd0bnZjbzNvSnRLalIvM285eWpwTm5LQ3AwdXJKRE9xa1cydXB0Nko1?=
 =?utf-8?B?K0R1SkQzVno5eWExMmhndmJ6OFlpUm4zUGUvbWpnanRRelZxWS92OXVaemIv?=
 =?utf-8?B?SDRQaThVQ2pKb0JDTVhJRDdBYjZpSnNMa0FoSWhFc3FNdWtXY1dSUEhHbEhQ?=
 =?utf-8?B?TFFxMWQ4NlB0WW9yamtwUUFBcnczOTVRaWkrNVJLenJraytqUm16Q0x1Z0N0?=
 =?utf-8?B?dURmNVh6OEZzNnlxRXEvVjZSL09ZYmRNdDJ3S255QXA3RGo3YmFPaHR2ODh4?=
 =?utf-8?B?VEI1NmhITFQ4b3NzMUFZallXaGp4K0kyUDRGYlp6L0dOdjBRWTJocklqWVJN?=
 =?utf-8?B?LzJ4djV4d0F6VC9RUVhFYXZrZDBjU0hDbjhLNGsveGtuR2VxZU9iQ3p3Mnds?=
 =?utf-8?B?Zm15bDJ1T2V4NFZPd0VidG5aSHNtWWl2NFV2OXhmdUVmVXMrMTg1aThlQlU2?=
 =?utf-8?B?WXZkaUhxZ09FOGlvTmIzcXlrakdnclAxbWxRMmhhZStRc2VoMUVjODZRNmww?=
 =?utf-8?B?Q1lNQWFLZ051TEMxd2JwQURqZFNOblVoOFpndytXWFNhUlZJVVM1NXVWQTBD?=
 =?utf-8?B?anFnYkcvcHdhSEZra3hBaWh0ZWkyMmRUZmlTSnQ5YVNldFlIclJIV1REMm9a?=
 =?utf-8?B?RWVvNjZSQnErdmx0SWpTN0hPWWNuZ0RlOG5tOFB1eWxPZzJqS3d2OHNYWHRG?=
 =?utf-8?B?VC9oYVZpMGlPRkJTR2NZVUNSeG1sQVp0SWFSakk4eW5Fdktpek1VUzBFaHBw?=
 =?utf-8?B?b1BWNlA3eDhmV0dBSldZTDFrN2JZRFl0bGplK285aUFxay9JWWRXcnFRS1Rr?=
 =?utf-8?B?djc0THhvMjA4QUpQaW9VTEsrazdHK2ZPTnhqZ2RkTDdSRkxDMFJKdVkzbFgx?=
 =?utf-8?B?aVdhb3RQcnFWUFdOQ2QvR0hOMGdCQ2tLV1d5N2NXWTV4VDF2RWN0K0lyM2J2?=
 =?utf-8?B?V1FIWFcyYk9lWGFPaEtJVDVrcTg0cEw1c1RLRVBvSVNQWFh4eTZmd21kc3E4?=
 =?utf-8?B?T0UxK2JRY3p0cXVkL2hJT043bFhVNCtXMGJnb0swbmlkVWs2aFZsL0VGZVRX?=
 =?utf-8?B?b3VIZmY1Sy8xVnh4aXVtdEdjSlp3L2p4Q3Q0cDJ3Y05JNlVqcHNmWFgvamRJ?=
 =?utf-8?B?cHhqM3lIbU9qZjBVWkF3VjFzUm9yQ21Uc2k2ZU8waSthZmgxT2FRQ0Y4YjZK?=
 =?utf-8?B?NU9mempiQ0s5aXA3bThZdHJzdzBsSVJhSTlHQThvVDdqblF4VTVJN3RCVW5j?=
 =?utf-8?B?ZlNBQnZHRXQzWFZWUmtCb0hIKzNQRHNveUNuR3BzYzFPdVFyY1Frc25vakU5?=
 =?utf-8?B?dTEyYm5hRFRkcmVGUjg1RHd1cUJjNEtlcVc1a05TVXJOWTYyV01xMzJuR3Ux?=
 =?utf-8?B?Slo4S2dUMk8vcW5xT0FNSzlId3hwR3NZc3haQ3cvQk5iQ2l0K0hQekFweFJ2?=
 =?utf-8?B?SVBlSEN0bGlPUWgvVUtMSmpOL3h2Q3V1UXRNKzc3bHd2Qjh5c3ZIVkxyM1ll?=
 =?utf-8?B?LzZPYUhlWDl1czB2ZVJlbU43U1EzbVB6K3EwZzNBT3FkNE1HZmhSOWJwSjBS?=
 =?utf-8?B?YVZCZHdLb2xDSTZYdGE0cEJ2dHlUU1RnbzFIWEVkTmlpWmJKR2dLSVVYYWNC?=
 =?utf-8?B?RXlJQWM1dkthaEdjMXR2Uy9LclRacHpPRzdTVTFJZWppckFLcFd1bWhTa1Jn?=
 =?utf-8?Q?v28XMbNAFyDg0W8rZ2H2aeY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B892A83642BB964CBD2799A584607327@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6646e8b-79c1-4dec-138c-08da62c12da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2022 22:11:45.9906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0ICk0vAuExrWgB1q42rQJEr+azO4czfCx0u6f1YZZV4qMtme4gjOswHqjvjvf+QtCzDyW+hg4ox6qjCxp1oIgs3D2cXtayyT4/cqcFi6ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2393
X-Proofpoint-ORIG-GUID: sc4AfgFpAWde7QLN2eLTy8qX7tR7QV9C
X-Proofpoint-GUID: sc4AfgFpAWde7QLN2eLTy8qX7tR7QV9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-10_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 mlxlogscore=799 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207100102

DQpPbiAxMS4wNy4yMiAwMDo1NCwgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KDQoNCkhlbGxv
IERlbWkgTWFyaWUNCg0KPiBUaGUgZXJyb3IgcGF0aHMgb2YgZ250ZGV2X21tYXAoKSBjYW4gY2Fs
bCB1bm1hcF9ncmFudF9wYWdlcygpIGV2ZW4NCj4gdGhvdWdoIG5vdCBhbGwgb2YgdGhlIHBhZ2Vz
IGhhdmUgYmVlbiBzdWNjZXNzZnVsbHkgbWFwcGVkLiAgVGhpcyB3aWxsDQo+IHRyaWdnZXIgdGhl
IFdBUk5fT04oKXMgaW4gX191bm1hcF9ncmFudF9wYWdlc19kb25lKCkuICBUaGUgbnVtYmVyIG9m
DQo+IHdhcm5pbmdzIGNhbiBiZSB2ZXJ5IGxhcmdlOyBJIGhhdmUgb2JzZXJ2ZWQgdGhvdXNhbmRz
IG9mIGxpbmVzIG9mDQo+IHdhcm5pbmdzIGluIHRoZSBzeXN0ZW1kIGpvdXJuYWwuDQo+DQo+IEF2
b2lkIHRoaXMgcHJvYmxlbSBieSBvbmx5IHdhcm5pbmcgb24gdW5tYXBwaW5nIGZhaWx1cmUgaWYg
dGhlIGhhbmRsZQ0KPiBiZWluZyB1bm1hcHBlZCBpcyBub3QgSU5WQUxJRF9HUkFOVF9IQU5ETEUu
ICBUaGUgaGFuZGxlIGZpZWxkIG9mIGFueQ0KPiBwYWdlIHRoYXQgd2FzIG5vdCBzdWNjZXNzZnVs
bHkgbWFwcGVkIHdpbGwgYmUgSU5WQUxJRF9HUkFOVF9IQU5ETEUsIHNvDQo+IHRoaXMgY2F0Y2hl
cyBhbGwgY2FzZXMgd2hlcmUgdW5tYXBwaW5nIGNhbiBsZWdpdGltYXRlbHkgZmFpbC4NCj4NCj4g
U3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFJldmlld2Vk
LWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IERlbWkgTWFy
aWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBGaXhlczogZGJlOTdj
ZmY3ZGQ5ICgieGVuL2dudGRldjogQXZvaWQgYmxvY2tpbmcgaW4gdW5tYXBfZ3JhbnRfcGFnZXMo
KSIpDQoNCg0KTmV4dCB0aW1lIHBsZWFzZSBhZGQgYSBjaGFuZ2Vsb2csIGFsc28gSSBhc3N1bWUg
Y3VycmVudCBwYXRjaCBvdWdodCB0byANCmJlIHYyIGluc3RlYWQgb2YgdjEwKQ0KDQoNCj4gLS0t
DQo+ICAgZHJpdmVycy94ZW4vZ250ZGV2LmMgfCA2ICsrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi9nbnRkZXYuYyBiL2RyaXZlcnMveGVuL2dudGRldi5jDQo+IGluZGV4IDRiNTZjMzlm
NzY2ZDRkYTY4NTcwZDA4ZDk2M2Y2ZWY0MGM4ZDljMzcuLjQ0YTEwNzhkYTIxYjhhMjMzM2I0NDMy
OTAwYThkYmRmYjhlMTNjNTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRldi5jDQo+
ICsrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jDQo+IEBAIC0zOTYsMTMgKzM5NiwxNSBAQCBzdGF0
aWMgdm9pZCBfX3VubWFwX2dyYW50X3BhZ2VzX2RvbmUoaW50IHJlc3VsdCwNCj4gICAJdW5zaWdu
ZWQgaW50IG9mZnNldCA9IGRhdGEtPnVubWFwX29wcyAtIG1hcC0+dW5tYXBfb3BzOw0KPiAgIA0K
PiAgIAlmb3IgKGkgPSAwOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgew0KPiAtCQlXQVJOX09OKG1h
cC0+dW5tYXBfb3BzW29mZnNldCtpXS5zdGF0dXMpOw0KPiArCQlXQVJOX09OKG1hcC0+a3VubWFw
X29wc1tvZmZzZXQgKyBpXS5zdGF0dXMgIT0gR05UU1Rfb2theSAmJg0KPiArCQkJbWFwLT5rdW5t
YXBfb3BzW29mZnNldCArIGldLmhhbmRsZSAhPSBJTlZBTElEX0dSQU5UX0hBTkRMRSk7DQoNCg0K
cy9rdW5tYXBfb3BzL3VubWFwX29wcw0KDQoNCltzbmlwXQ0KDQoNCi0tIA0KUmVnYXJkcywNCg0K
T2xla3NhbmRyIFR5c2hjaGVua28NCg==

