Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A1849FF5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 17:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676382.1052542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2Cs-0006un-3p; Mon, 05 Feb 2024 16:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676382.1052542; Mon, 05 Feb 2024 16:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2Cs-0006sD-11; Mon, 05 Feb 2024 16:52:30 +0000
Received: by outflank-mailman (input) for mailman id 676382;
 Mon, 05 Feb 2024 16:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q1ha=JO=epam.com=prvs=8765dbd22b=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rX2Cq-0006rm-Ly
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 16:52:28 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f025c0b2-c446-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 17:52:26 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 415F2mM8026052; Mon, 5 Feb 2024 16:52:21 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3w2v44ssvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Feb 2024 16:52:20 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by PAXPR03MB7869.eurprd03.prod.outlook.com (2603:10a6:102:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 16:52:16 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 16:52:16 +0000
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
X-Inumbo-ID: f025c0b2-c446-11ee-8a46-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZJ47ThzbMwGwcntNa7tFv2XcqQgiyASQ8/jfJxTRcbprxGOIG3cBnUQdE8peA6Qz2nENpzXroodqe97GMMXAVTrzq8WLivkScRkGNoI71x6YuZm0+NNR1zSctfly2Zoamv8iIqRLg4nx1dKQ7GhMmKUaHaY9oEqFgh2UqxTamok7mQecOpF0/lqrB7zM8ZuqoiAfBja9uPxVsqUPFw6gKii9buTxGv6v/Pb5MynY/fAqesqO9NgELImm1f0P1h9Tb9NLYhTqdNl3KsFKs7PCpaLg1dP/ETh53jF/3aJmvEFR6gR6w+3Deu8KNa1H+NJytiLrJsO8Dv4FMgVnAI3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hH4fDEl3SduQIsesqnjYXAGmusAaoKxOQK7fjzydhE=;
 b=ny452bJCAZZer+jwQcnuIZVXgf7c3YtaEwvdd1oAttfpXfNZJAass2TuIRYfb+Phq3cJz+ZHf33DyGaZ3+6/0pdFsXww6GZgcmfWgCMwq5+mbq0LCxJTGGpSv1r5a+vrwByJ5Qxai6y6EatmkyXkJAmGrU6voFGukAwRnpZ6YCVrSQOweNv6OZ058EMo57/6RLtWXBgKLpx8QN3fgPTDRDMKXsV4wr63Cyus7aKZORUQH1FLDmGTPmgd3I6r52qNsR6ubaV2sMPcsvDnljR8vQTI/vmyKdTepdOy6CAXuew9+x2TP/TFMiNgNfyGGN+mIY2H1wPOmYmGALcMWmXHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hH4fDEl3SduQIsesqnjYXAGmusAaoKxOQK7fjzydhE=;
 b=na/LV8pogA6trEsLxAH5ZVgQhMfQ9y0CZLMrH8+PjNdXSH0ngGmQ8Bcu3PTAfI3KzXkykerqOpMGv8sSkUJW3+9/J9OZBOTOjbe7cC93t6oePBxc/R78ijBDykErmEop86p9i8QNhClb+RDRv8s4gy+Yoy4QMQrIjk9NpOQEK4VwOCWLXMj5W3Jo7N+uj48dxxmp3oJg3KmtTsBLrc6qZlbquF4JnBCnjizh0dR3qDKflRr0IOKKYV8noSXakl7yw/RG/W+4GXN30hEd/t2/D2ixB5wRZT0y/yFPx8O0iz/YxhB7lRr3BMLy37ySDoOBe819pys/jq1wSdzHWfd4wg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Nick Rosbrook <rosbrookn@gmail.com>, Juergen
 Gross <jgross@suse.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Topic: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Index: AQHaVcWXJV0m8uwkbEKeSgAhd5N6SLD734GAgAAcRoA=
Date: Mon, 5 Feb 2024 16:52:16 +0000
Message-ID: <78bc7890-cfcb-4de4-a676-a3c2bbbb6d9f@epam.com>
References: <20240202104903.1112772-1-olekstysh@gmail.com>
 <ace5b3c8-38e7-4661-9401-ac9ac77a5e9f@perard>
In-Reply-To: <ace5b3c8-38e7-4661-9401-ac9ac77a5e9f@perard>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|PAXPR03MB7869:EE_
x-ms-office365-filtering-correlation-id: bc5096ca-edd4-4a4b-6e30-08dc266acf52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P9vWiNHEcycHqOaM5Z8ON4FvJcAXl72xIVtXaB/7bzvQZR9PSQuk6sZHn4hY42mEtzPMlW3L1Y68k6zB3oFVYBX9hMD1E6TSzVp3xbnfacexYzlwiuB4JMBNpIv1l6Qh5nfE/MwbvTTEMArBdPNiyclKEb0oLadZ0gTgaRm4rggFBLyhFyIdA6VVUPy6wrYfWqMVMatPVtwSDrS5uwV03A1afsckFgvFVfZweumWhap7bAq+4rCi7Eo2coF95nbmnm68zdR8ywfjVmhi52lGaJs9E4bxZEgqccKbYZYjcTPywzvHr2cZTq/nqCyCZy5PC/Nk7kkKAc1xS9Innzsl8TegkCJaWhYGEpEKxS/6/hWPSQ31ezig4d+4qy5IUN3ii/IIM/24TEzoitV8bDzbQWaMtNa5fyia9nPY/TPbZrtL8ito2s0BF1GUdYGts85p8UgqoNgqMN1kG0HVB6W1hFM7nWDvIK3tNmeXxxjFWt36HaPOK0+bq9TIOSuHyvm8fVTIw7iS2IW/QLVBFxJTfjOSCMQAvVSUBq1RYTLpgXcSF0qNjHX0pegk5pYXKPSnZDIlhnVu4aOioXZLidAL7xJuOy3cXh5Hp1R0ggvTvOezx2T9lin9LQcLXGrh+2hPhfhmV6ziPHPK9Un1xpVEQg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(38070700009)(6916009)(54906003)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(36756003)(316002)(2906002)(5660300002)(8676002)(8936002)(4326008)(83380400001)(31686004)(38100700002)(122000001)(71200400001)(6506007)(6512007)(53546011)(478600001)(6486002)(2616005)(26005)(86362001)(31696002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dDJZWlcvVEU4cEo5QnhTblRzZi9YU2drejZJVVUySlJMV2EzRVMyZmdlY2s0?=
 =?utf-8?B?SGxWRXdHZ05ESzRLODFDQXR2N282NUJNQnJ6Vkg1K0FweTJ2b1hxTVFUQTg2?=
 =?utf-8?B?cEovM2dhQzBwUFJrZDAzL2F6ZUE1OERmMnFRUGEvQW03MCt3TVlQbjhwYzB5?=
 =?utf-8?B?eThpckRwY3lmSnVEaVJXNDN4SEprU1p3bndiV0kvemkraFk2LzdlSS83Wlo0?=
 =?utf-8?B?ZVdNaDZ4REZyNXdMK2tObHRQbkwraXBWS3lsSjM2ZTNVd2JtUnRvalBNWTBF?=
 =?utf-8?B?bDZJK0VkSEhBYjFCUnI0dFc4SUpWVmZzVHZmMVhoN2ZFMWtreXkwazhPQUVC?=
 =?utf-8?B?cExiYVpJTDV5KzhsaHZFcmZ0TUhSaHBQMWJLWjhvdVNyNHlES3JQZXVYLy83?=
 =?utf-8?B?djUwalZlczBZMklzYkNEbFBCZ2lteGhoOGVvR2cycnZubW9xckNsTXlnODUy?=
 =?utf-8?B?aXFteHJURnhmbVNEQ0Rtc09NSVBGVlVSVzBBM1prUVhPcWsvQnFpZ0FNWHdU?=
 =?utf-8?B?Y2FnMEFWcnJZblFNQ013TzFpQkRsbHhNRlBHMnVISkQ3SUZhZjBnL3FWM3Vp?=
 =?utf-8?B?N2tQaW9GS3VuQ1ozSWFmcWxhUld3clFUR09GWlZTYlFyRlZkcEsyUDZiRDh1?=
 =?utf-8?B?dG5JeiswT2ZZZE93QlBGQzI0TTNpbWY4ZXFoUUM1MzRTVE1HaFEzeVZDdTBB?=
 =?utf-8?B?ZVR2MGlNUFRaNTRnR3pnVmtGOW85a21tMDlNdzl4ak5zL1VyTFNIdStrRm1F?=
 =?utf-8?B?U2JRczNndUZxcE5MRE9OTnAzWjZRb2laSlhYY3Z4dy9zRVp2ellKM09MRE5R?=
 =?utf-8?B?NUFEcUhOV2RTcW9BVjNva2I5QVlmckhubnN4WHVxK3ZjWkRHd2ltdE1DUTRr?=
 =?utf-8?B?VHFVY0RmdlRucjZLWGNwWFVFNEJRcFNrR3BKa2VxRUNRa1IzZkZaMGxzVG05?=
 =?utf-8?B?MU5DMWtSVWVSMmJDc0VpN0toMUdkaTZEYkhvWTZ6REZEakg3cGNBcUcra09i?=
 =?utf-8?B?YU53TzdpWCtKcHhYSkx2OTBvTVZXRnloTCtiZ25xdGVxTGNQKzhzVjFsU0Jk?=
 =?utf-8?B?MHc5YU44UUp4d09kZCtYbzV1L3hYcUloR1JISU56L1V0MkpVeHZ4bFlDR01x?=
 =?utf-8?B?Mlc1Y0I2YU04WWloME94QkwvNFlVY2lEVmtsUjZXM1N2bUpqTWFEWmFUMHZC?=
 =?utf-8?B?aThzV1dpancrYVc3Mk9MRmpyRFFMYkUyUFQ4aUJtVDU4VUVQN3RUWEpyMFMy?=
 =?utf-8?B?a1lDRFNieWprKzlQaVNYTmd0cTE1S2FWK0Y0djJwODEycmF3b2dwbnAzd2Jj?=
 =?utf-8?B?azQ2S1N6OUU4ak1LM2Y3ZXJIYTBqVndzTXgrb1JUbXZGekdRRVg4Vjc1OVho?=
 =?utf-8?B?Rk9NZjdkUHJ0MHlEN1hweHI1WUdUQWRkcVF5SVZwQVZkbTFoRG02OEpSSEQv?=
 =?utf-8?B?Q2Yxb1g3R2VkSnplT0dQUmR3WVdGMFpnRHVIeG4yMll1Zlc2bVQwYUJEQVdR?=
 =?utf-8?B?VlNibE1Gb2lLaTUwd3Q4WVZsYWpBaVhNdkJ4RHRjK011a0diUWt0TWdxb01k?=
 =?utf-8?B?YlBOVnhPVWRoejY0NDVpa3lpb0N6NDYwWXNVaXo4UjZjcU52bUM3Q2VNT0pQ?=
 =?utf-8?B?cTVWaDl6S09xUXpQYnM1NTJUZWtNa2lhNWhOVWJLYnA2aERwV09ScFk5TmZW?=
 =?utf-8?B?SmY4Vi9QblJJNnZ0WkNmMUdoaWJZOFRQV2FPNkdGWU9mS1o3VmVNSjM3ZXBU?=
 =?utf-8?B?Nmh0S1RYWm1oaHg1ZDc3NjBkM09FSDVuMVNrY2hsc1VQVmk1cDVoVHNYVlZl?=
 =?utf-8?B?M0pRMGxucVlrOUlKUFIzS0NQcXQvMWNGNkVQNUhHV0IxSDdSNkJ2VUJPNjUv?=
 =?utf-8?B?ZXc2VjVNTHRqRTZneDk4SUdnWjQvVSttOURhMjU1Q3hjU1FmVytscXBUNWxR?=
 =?utf-8?B?cTFpdEpBT05VSWxQQnB4YnNLdVFHQ1lBaTBmTi9WUC9CNXUzbXJwc0lwNVk4?=
 =?utf-8?B?U3JHakxPTGQ0dUFQNWprdm4yL3FoOXJuVFhtQXlCWmxKR3J1ZTQ5YitBRjg2?=
 =?utf-8?B?R1dVay94RmxQSlRlNmhmYlIwV1pENnl3WWtVeUhGeDc3NHJrREl2ZDlLRGN6?=
 =?utf-8?B?RGxYQkxnSzVzR1kxckV6cjhBK0pSL3hPbFlpYk5vaFJyT1ZaTFVlVy9xclY5?=
 =?utf-8?Q?FPoTJ7giIUKeJBbnMONXC6E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1F6A9E794E0F7409EFA6FB155E95365@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5096ca-edd4-4a4b-6e30-08dc266acf52
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 16:52:16.5862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLiescpjSUCMZcF7Pa53V622f/WKqISGN+OTkcLrBocLKkGbwnV+0QK6piNOBBFakJ9KdXG77iqhaU0WNhpY/zjbHBzP5piSooIgn8Hj4fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7869
X-Proofpoint-GUID: AuFMKlunBdAuBreQXdJACUFPx8l_qjOn
X-Proofpoint-ORIG-GUID: AuFMKlunBdAuBreQXdJACUFPx8l_qjOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050127

DQoNCk9uIDA1LjAyLjI0IDE3OjEwLCBBbnRob255IFBFUkFSRCB3cm90ZToNCg0KSGVsbG8gQW50
aG9ueQ0KDQoNCj4gT24gRnJpLCBGZWIgMDIsIDIwMjQgYXQgMTI6NDk6MDNQTSArMDIwMCwgT2xl
a3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy91dGls
L2xpYnhsdV9kaXNrX2wubCBiL3Rvb2xzL2xpYnMvdXRpbC9saWJ4bHVfZGlza19sLmwNCj4+IGlu
ZGV4IDZkNTNjMDkzYTMuLmYzN2RkNDQzYmQgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL3V0
aWwvbGlieGx1X2Rpc2tfbC5sDQo+PiArKysgYi90b29scy9saWJzL3V0aWwvbGlieGx1X2Rpc2tf
bC5sDQo+PiBAQCAtMjIwLDYgKzIyMCw5IEBAIGhpZGRlbi1kaXNrPVteLF0qLD8JeyBTVFJJUCgn
LCcpOyBTQVZFU1RSSU5HKCJoaWRkZW4tZGlzayIsIGhpZGRlbl9kaXNrLCBGUk9NRVFVDQo+PiAg
IHRydXN0ZWQsPwkJeyBsaWJ4bF9kZWZib29sX3NldCgmRFBDLT5kaXNrLT50cnVzdGVkLCB0cnVl
KTsgfQ0KPj4gICB1bnRydXN0ZWQsPwkJeyBsaWJ4bF9kZWZib29sX3NldCgmRFBDLT5kaXNrLT50
cnVzdGVkLCBmYWxzZSk7IH0NCj4+ICAgDQo+PiArZ3JhbnRfdXNhZ2U9MSw/CQl7IGxpYnhsX2Rl
ZmJvb2xfc2V0KCZEUEMtPmRpc2stPmdyYW50X3VzYWdlLCB0cnVlKTsgfQ0KPj4gK2dyYW50X3Vz
YWdlPTAsPwkJeyBsaWJ4bF9kZWZib29sX3NldCgmRFBDLT5kaXNrLT5ncmFudF91c2FnZSwgZmFs
c2UpOyB9DQo+IA0KPiBGb3Igb3RoZXIgYm9vbGVhbiB0eXBlIGZvciB0aGUgZGlzaywgd2UgaGF2
ZSAidHJ1c3RlZC91bnRydXN0ZWQiLA0KPiAiZGlzY2FyZC9uby1kaXNjYXJkIiwgImRpcmVjdC1p
by1zYXZlLyIsIGJ1dCB5b3UgYXJlIGFkZGluZw0KPiAiZ3JhbnRfdXNhZ2U9MS9ncmFudF91c2Fn
ZT0wIi4gSXMgdGhhdCBmaW5lPyBCdXQgSSBndWVzcyBoYXZpbmcgdGhlIG5ldw0KPiBvcHRpb24g
c3BlbGxlZCAiZ3JhbnRfdXNhZ2UiIG1pZ2h0IGJlIGJldHRlciwgc28gaXQgbWF0Y2ggdGhlIG90
aGVyDQo+IHZpcnRpbyBkZXZpY2VzIGFuZCB0aGUgaW1wbGVtZW50YXRpb24uIA0KDQoNClllcywg
SSBub3RpY2VkIHRoYXQgaG93IGJvb2xlYW5zIGFyZSBkZXNjcmliZWQgZm9yIHRoZSBkaXNrLiBJ
IGRlY2lkZWQgDQp0byB1c2UgdGhlIHNhbWUgcmVwcmVzZW50YXRpb24gb2YgdGhpcyBvcHRpb24g
YXMgaXQgd2FzIGFscmVhZHkgdXNlZCBmb3IgDQp2aXJ0aW89Wy4uLl0uIEJ1dCBJIHdvdWxkIGJl
IG9rIHdpdGggb3RoZXIgdmFyaWFudHMgLi4uDQoNCg0KQnV0IG1heWJlDQo+ICJ1c2UtZ3JhbnQv
bm8tdXNlLWdyYW50IiBtaWdodCBiZSBvaz8NCg0KICAgLi4uIGxpa2UgdGhhdCwgYnV0IHByZWZl
cmFibHkgd2l0aCBsZWF2aW5nIGxpYnhsX2RldmljZV9kaXNrJ3MgZmllbGQgDQpuYW1lZCAiZ3Jh
bnRfdXNhZ2UiIChpZiBubyBvYmplY3Rpb24pLg0KDQoNCj4gDQo+IEluIGFueSBjYXNlLCB0aGUg
aW1wbGVtZW50YXRpb24gbmVlZCB0byBtYXRjaCB0aGUgZG9jdW1lbnRhdGlvbiwgYW5kDQo+IHZp
Y2UgdmVyc2EuIFNlZSBiZWxvdy4NCg0KDQpTdXJlLg0KDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEv
ZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kLmluIGIvZG9jcy9tYW4veGwtZGlz
ay1jb25maWd1cmF0aW9uLjUucG9kLmluDQo+PiBpbmRleCBiYzk0NWNjNTE3Li4zYzAzNTQ1NmQ1
IDEwMDY0NA0KPj4gLS0tIGEvZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kLmlu
DQo+PiArKysgYi9kb2NzL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QuaW4NCj4+IEBA
IC00MDQsNiArNDA0LDMxIEBAIFZpcnRpbyBmcm9udGVuZCBkcml2ZXIgKHZpcnRpby1ibGspIHRv
IGJlIHVzZWQuIFBsZWFzZSBub3RlLCB0aGUgdmlydHVhbA0KPj4gKz1pdGVtIEI8Z3JhbnRfdXNh
Z2U9Qk9PTEVBTj4NCj4+DQo+PiArPW92ZXIgNA0KPj4gKw0KPj4gKz1pdGVtIERlc2NyaXB0aW9u
DQo+PiArDQo+PiArU3BlY2lmaWVzIHRoZSB1c2FnZSBvZiBYZW4gZ3JhbnRzIGZvciBhY2Nlc3Np
bmcgZ3Vlc3QgbWVtb3J5LiBPbmx5IGFwcGxpY2FibGUNCj4+ICt0byBzcGVjaWZpY2F0aW9uICJ2
aXJ0aW8iLg0KPj4gKw0KPj4gKz1pdGVtIFN1cHBvcnRlZCB2YWx1ZXMNCj4+ICsNCj4+ICtJZiB0
aGlzIG9wdGlvbiBpcyBCPHRydWU+LCB0aGUgWGVuIGdyYW50cyBhcmUgYWx3YXlzIGVuYWJsZWQu
DQo+PiArSWYgdGhpcyBvcHRpb24gaXMgQjxmYWxzZT4sIHRoZSBYZW4gZ3JhbnRzIGFyZSBhbHdh
eXMgZGlzYWJsZWQuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGlzIHdyb25nLCB0aGUgaW1w
bGVtZW50YXRpb24gaW4gdGhlIHBhdGNoIG9ubHkNCj4gc3VwcG9ydCB0d28gdmFsdWVzOiAxIC8g
MCwgbm90aGluZyBlbHNlLCBhbmQgdHJ5aW5nIHRvIHdyaXRlICJ0cnVlIiBvcg0KPiAiZmFsc2Ui
IHdvdWxkIGxlYWQgdG8gYW4gZXJyb3IuIChXZWxsIGFjdHVhbGx5IGl0J3MgImdyYW50X3VzYWdl
PTEiIG9yDQo+ICJncmFudF91c2FnZT0wIiwgdGhlcmUncyBub3RoaW5nIHRoYXQgY3V0IHRoYXQg
c3RyaW5nIGF0IHRoZSAnPScuKQ0KDQoNCllvdSBhcmUgcmlnaHQsIG9ubHkgMSAvIDAgY2FuIGJl
IHNldCB1bmxpa2UgZm9yIHZpcnRpbz1bLi4uXSB3aGljaCBzZWVtcyANCmhhcHB5IHdpdGggZmFs
c2UvdHJ1ZS4NCg0KDQo+IA0KPiBBbHNvLCBkbyB3ZSByZWFsbHkgbmVlZCB0aGUgZXh0cmEgdmVy
YmFsIGRlc2NyaXB0aW9uIG9mIGVhY2ggdmFsdWUgaGVyZT8NCj4gSXMgc2ltcGx5IGhhdmluZyB0
aGUgZm9sbG93aW5nIHdvdWxkIGJlIGVub3VnaD8NCj4gDQo+ICAgICAgPWl0ZW0gU3VwcG9ydGVk
IHZhbHVlcw0KPiANCj4gICAgICAxLCAwDQo+IA0KPiBUaGUgZGVzY3JpcHRpb24gaW4gIkRlc2Ny
aXB0aW9uIiBzZWN0aW9uIHdvdWxkIGhvcGVmdWxseSBiZSBlbm91Z2guDQoNCg0KSSB0aGluaywg
dGhpcyBtYWtlcyBzZW5zZS4NCg0KU28sIHNoYWxsIEkgbGVhdmUgImdyYW50X3VzYWdlPTEvZ3Jh
bnRfdXNhZ2U9MCIgb3IgdXNlIHByb3Bvc2VkIG9wdGlvbiANCiJ1c2UtZ3JhbnQvbm8tdXNlLWdy
YW50Ij8NCg0KDQo+IA0KPj4gKz1pdGVtIE1hbmRhdG9yeQ0KPj4gKw0KPj4gK05vDQo+PiArDQo+
PiArPWl0ZW0gRGVmYXVsdCB2YWx1ZQ0KPj4gKw0KPj4gK0lmIHRoaXMgb3B0aW9uIGlzIG1pc3Np
bmcsIHRoZW4gdGhlIGRlZmF1bHQgZ3JhbnQgc2V0dGluZyB3aWxsIGJlIHVzZWQsDQo+PiAraS5l
LiBlbmFibGUgZ3JhbnRzIGlmIGJhY2tlbmQtZG9taWQgIT0gMC4NCj4+ICsNCj4+ICs9YmFjaw0K
Pj4gKw0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfZGlzay5jIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9kaXNrLmMNCj4+IGluZGV4IGVhMzYyM2RkNmYuLmYzOWY0Mjcw
OTEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rpc2suYw0KPj4gKysr
IGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kaXNrLmMNCj4+IEBAIC0xODEsNiArMTgxLDkgQEAg
c3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX2Rpc2tfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLCB1
aW50MzJfdCBkb21pZCwNCj4+ICAgICAgICAgICAgICAgcmV0dXJuIEVSUk9SX0lOVkFMOw0KPj4g
ICAgICAgICAgIH0NCj4+ICAgICAgICAgICBkaXNrLT50cmFuc3BvcnQgPSBMSUJYTF9ESVNLX1RS
QU5TUE9SVF9NTUlPOw0KPj4gKw0KPj4gKyAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0
KCZkaXNrLT5ncmFudF91c2FnZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkaXNrLT5iYWNrZW5kX2RvbWlkICE9IExJQlhMX1RPT0xTVEFDS19ET01JRCk7DQo+PiAgICAg
ICB9DQo+PiAgIA0KPj4gICAgICAgaWYgKGhvdHBsdWcgJiYgZGlzay0+c3BlY2lmaWNhdGlvbiA9
PSBMSUJYTF9ESVNLX1NQRUNJRklDQVRJT05fVklSVElPKSB7DQo+PiBAQCAtNDI5LDYgKzQzMiw4
IEBAIHN0YXRpYyB2b2lkIGRldmljZV9kaXNrX2FkZChsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90
IGRvbWlkLA0KPj4gICAgICAgICAgICAgICBmbGV4YXJyYXlfYXBwZW5kKGJhY2ssIGxpYnhsX19k
ZXZpY2VfZGlza19zdHJpbmdfb2ZfdHJhbnNwb3J0KGRpc2stPnRyYW5zcG9ydCkpOw0KPj4gICAg
ICAgICAgICAgICBmbGV4YXJyYXlfYXBwZW5kX3BhaXIoYmFjaywgImJhc2UiLCBHQ1NQUklOVEYo
IiUiUFJJdTY0LCBkaXNrLT5iYXNlKSk7DQo+PiAgICAgICAgICAgICAgIGZsZXhhcnJheV9hcHBl
bmRfcGFpcihiYWNrLCAiaXJxIiwgR0NTUFJJTlRGKCIldSIsIGRpc2stPmlycSkpOw0KPj4gKyAg
ICAgICAgICAgIGZsZXhhcnJheV9hcHBlbmRfcGFpcihiYWNrLCAiZ3JhbnRfdXNhZ2UiLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZWZib29sX3ZhbChkaXNr
LT5ncmFudF91c2FnZSkgPyAiMSIgOiAiMCIpOw0KPj4gICAgICAgICAgIH0NCj4+ICAgDQo+PiAg
ICAgICAgICAgZmxleGFycmF5X2FwcGVuZChmcm9udCwgImJhY2tlbmQtaWQiKTsNCj4+IEBAIC02
MjMsNiArNjI4LDE0IEBAIHN0YXRpYyBpbnQgbGlieGxfX2Rpc2tfZnJvbV94ZW5zdG9yZShsaWJ4
bF9fZ2MgKmdjLCBjb25zdCBjaGFyICpsaWJ4bF9wYXRoLA0KPj4gICAgICAgICAgICAgICBnb3Rv
IGNsZWFudXA7DQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIGRpc2stPmlycSA9IHN0cnRv
dWwodG1wLCBOVUxMLCAxMCk7DQo+PiArDQo+PiArICAgICAgICB0bXAgPSBsaWJ4bF9feHNfcmVh
ZChnYywgWEJUX05VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHQ1NQUklO
VEYoIiVzL2dyYW50X3VzYWdlIiwgbGlieGxfcGF0aCkpOw0KPj4gKyAgICAgICAgaWYgKCF0bXAp
IHsNCj4+ICsgICAgICAgICAgICBMT0coRVJST1IsICJNaXNzaW5nIHhlbnN0b3JlIG5vZGUgJXMv
Z3JhbnRfdXNhZ2UiLCBsaWJ4bF9wYXRoKTsNCj4+ICsgICAgICAgICAgICBnb3RvIGNsZWFudXA7
DQo+IA0KPiBJIHdvbmRlciBpZiBpdCdzIHN1Y2ggYSBnb29kIGlkZWEgdG8gbWFrZSB0aGlzIG5v
ZGUgbWFuZGF0b3J5LiBDb3VsZCB3ZQ0KPiBqdXN0IGFwcGx5IHRoZSBkZWZhdWx0IHZhbHVlIGlm
IHRoZSBwYXRoIGlzIG1pc3Npbmc/IEkgZG9uJ3QgdGhpbmsgdGhlDQo+IHZhbHVlIGlzIGdvaW5n
IHRvIGJlIHVzZWQgYW55d2F5IGJlY2F1c2UgSSBkb24ndCB0aGluayBmcm9tX3hlbnN0b3JlKCkg
aXMNCj4gdXNlZCBkdXJpbmcgZ3Vlc3QgY3JlYXRpb24sIGFuZCBpdCBsb29rcyBsaWtlICJncmFu
dF91c2FnZSIgaXMgb25seQ0KPiB1c2VmdWwgZHVyaW5nIGd1ZXN0IGNyZWF0aW9uLiBBbHNvLCB0
aGUgImdyYW50X3VzYWdlIiBub2RlIGlzbid0DQo+IG1hbmRhdG9yeSBpbiAibGlieGxfdmlydGlv
LmMiLCBzbyBubyBuZWVkIHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQNCj4gZm9yIGRpc2suDQoN
CkkgYWdyZWUgd2l0aCB5b3VyIGFuYWx5c2lzLCBubyBuZWVkIHRvIHJhaXNlIGFuIGVycm9yIGlm
IG1pc3NpbmcsIGxldCdzIA0KYXBwbHkgYSBkZWZhdWx0IHZhbHVlIHdoaWNoIGlzIHRoZSByZXN1
bHQgb2YgImRpc2stPmJhY2tlbmRfZG9taWQgIT0gDQpMSUJYTF9UT09MU1RBQ0tfRE9NSUQiLg0K
DQoNCj4gDQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBsaWJ4bF9kZWZib29sX3NldCgmZGlz
ay0+Z3JhbnRfdXNhZ2UsIHN0cnRvdWwodG1wLCBOVUxMLCAwKSk7DQo+PiAgICAgICB9DQo+PiAg
IA0KPj4gICAgICAgZGlzay0+dmRldiA9IHhzX3JlYWQoY3R4LT54c2gsIFhCVF9OVUxMLA0KPiAN
Cj4gVGhhbmtzLA0KPiA=

