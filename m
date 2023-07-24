Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B8A75E5CB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 02:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568390.887666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNj7L-0002gU-Uq; Mon, 24 Jul 2023 00:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568390.887666; Mon, 24 Jul 2023 00:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNj7L-0002dT-R6; Mon, 24 Jul 2023 00:08:03 +0000
Received: by outflank-mailman (input) for mailman id 568390;
 Mon, 24 Jul 2023 00:08:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CttD=DK=epam.com=prvs=15690d6cff=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qNj7J-0002dK-H2
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 00:08:01 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23295923-29b6-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 02:07:59 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 36NKvGKS021049;
 Mon, 24 Jul 2023 00:07:53 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3s12208uq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jul 2023 00:07:52 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS2PR03MB10193.eurprd03.prod.outlook.com (2603:10a6:20b:5fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Mon, 24 Jul
 2023 00:07:49 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 00:07:49 +0000
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
X-Inumbo-ID: 23295923-29b6-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvNSJdgdbARLywpXSnLaNmjgocDyZsfyKm6zscmEBg5Vj8YzLDF0VNHbvKNjN5OHze6N0kFoA55lpvJzRhKmt2QCzXD3VUxznhUW4qA4IrQWE+wCJL07qmRsTQkMF67tgZzNIO3fEwEH46bhQkhEefD6Zch7B3vYjNHCV1X9GB70r7xcTtHFIhNtU3QEoJSSYiXFIq+8MvQ+XNOxwa56XdQsh0atiQT7IdiM2v0Mph8WFIgcgd5mEE6nhZoNLiEM2MrhpJGuvBMfWgkTXrj+5fzUBtLMkzX4ViEK2T7bNg07jhv+WP2KWYC9emXV05E9R0aHiAo1sqaT5Db3apotng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD7/Jabcn1UV7MQK1uTOOIY4SnZey2eDV/1k0Ya8ttE=;
 b=Ki3tb9DkIS88lWAgbMyFGZHdyBMU+ZE4gfg/tFT63eMIOJ1QkXfeFdBbh2HwO97HOJG2Ugd3uN9S5sXqVmN2osaj8ERlvt9e7IawGoPsfgG4aLa390DCBD8x8SIhbGNWrTzfXnzFg22ZmLlbOt2iYMm71pXfGlucZxGovXMlHz77STSssDjuawgL0ppQ8i/l44+56V2S2FpsCzg/Tofu/iOuRsaHYc76hCKOxqgLjv4H2gDQ3I/4CoYJNUfcNAe8PMpj5452TRTbV0ex1xAAw2f8dFe+ZqjCzNGSw5qahdJONMyIFFlo/k0PgRP31e9Cbsg7zQXmcyRMbhIofbVWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD7/Jabcn1UV7MQK1uTOOIY4SnZey2eDV/1k0Ya8ttE=;
 b=bmFIaF+Cw4OUruAkDjIOp3mu77F8kGD2oUl/Hk47rWzCTi8OJ4QVHItHiK5fIKkNPNkgVXzvuQ3awEOutcKbug8vUfoxsc/ASsKT3e9RyeWjGoNxZDpPykXY6utSt/vfCdtaiWeIEmw/7L8wo5iNDkcg+4u91wwUZzxeS+VVh2WG1DvR4bMrh13FviGeu9CC8YhbuB2ylFF7J6RXvPhewDrcNdnC5N+Tq+hk2Z5DoFoBYx07QVnMgDPT3rr/kFu5eZgTN52VQ2f7WxSi6LoQxcQTc0X5+mPWQ/+is5p3Q9AwfTrJ6OLJ3SftQ8PuQZa7z/Rn+e30bsJOGh9129LBiw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Topic: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Index: AQHZuqGrLMJPz1ipBEu4urExXp8yi6/CgxUAgAAjhICAAAaPAIAFYwcA
Date: Mon, 24 Jul 2023 00:07:48 +0000
Message-ID: <87fs5edve5.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <08ec7e54-1abf-5e1e-e1ee-7026a69e0279@suse.com>
 <ZLk7wh39Cc3GdIuB@MacBook-Air-de-Roger.local>
In-Reply-To: <ZLk7wh39Cc3GdIuB@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS2PR03MB10193:EE_
x-ms-office365-filtering-correlation-id: 19ce8c0c-36b9-4646-fd22-08db8bda0402
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 orqBlVaYX+tJsDLi+PoD7SFLWxyGuCGcJKafS9k5ZL0QeBVOqRXCusP0CLdjtcXTNCID2yMGhAkeSGS9VrjB/D42mzLghuvAkMtHUqKO1gl+Orlbc2cDxltSLltJ99KdISATuBNMgTJg9VQ/88leY5EVYfwuDmcHY4RmcLq6Y1ALQpG6NyUE0wxFAXhk5sFKkVw57OVSDf/2/I4vDS6/94Hwx4WlW+2U+tC9ZaCjrU5p+wJlYBKqK2n7DEqeys2E0iVQffNcCDI1JJiEDK2f2f8TBX6cSSTrDs47//JWHl0SnUSQNxrgzqQcSG4HG4GCywkTClgLcQD7XgD/KsHpeTsnqjas7YSyS6mHAR+daPbeF6H9qBVlvAY+bYwO4mQi1MI1+Jq6L5GnTYowQZbTQ4P+Q6p5v0xLlbGX1Ib9hwfndAW5hbUzb0VcBRmrclCELyXA1jYKM0wqyzSssB82FwL2n71/g/8/ZvRWihVd3QPFqstHb4xQAg08x4+Rao//3QWeKwchN17OJvcujhh71EGyduhFmbL1LyiCO0gfRwTcX5mtQfhy2LqiRRG4OySfkdN/xXCYsoz0BqymD96QnfvQCCgltHI8S4fUkQHzjiCPqjQhYNITpH3aNa+vODbP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(6512007)(6486002)(478600001)(91956017)(71200400001)(54906003)(2616005)(55236004)(53546011)(186003)(6506007)(26005)(107886003)(2906002)(316002)(76116006)(41300700001)(66946007)(4326008)(66476007)(6916009)(66556008)(64756008)(5660300002)(8676002)(8936002)(66446008)(38100700002)(122000001)(36756003)(38070700005)(86362001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QTJhMnd1V3JYZWgyWlhDSVJkNkhSNXBqK3JkaERaa1R4QzdiUWNrRjFWU3U0?=
 =?utf-8?B?K2w0TWpXVHhWOUFBbHEyamE2UnZnV2xNMkxlVHNsRUFia3hia2hqNXRnQ0Yr?=
 =?utf-8?B?R2JsRU5zUWsxblJTNmFnM0gzQlVVRmlDdFQrQzRQNkEwTVlHUDhTN3Zydjhq?=
 =?utf-8?B?cHVDczFGNVdaQ1doRURyekMvWkZRc25kV2owQjFJZlIvR1E4UCtaQ1dpV1Yx?=
 =?utf-8?B?RGVSUHlsVG01ZytNaGtlRkdseER6VUxpTGhuZFZoSUU1K2VzRjN0NnUyd0Yy?=
 =?utf-8?B?ZVBGbUh0Z21iWE42cDhwejRmTldhakNGb2FoaDYxc043UEo1d1Z1WGNwaEJl?=
 =?utf-8?B?TnNyeTBFdHNwcGJDVU54UTR4a09BTlBqMjkrOHpEd0d1ckRWYjBxajZiSnVa?=
 =?utf-8?B?bFpqdUVZdG5uZnN2THRIS00zR1Q2cGZvRCtpeHdmYWk0dHVTZlRqVEc0VFBv?=
 =?utf-8?B?UzdwalZxdVh5RHE5c0dsNGQ0bTNJaEtZWUp0UWNVRE9nRmQrOWx5K3RLYkt0?=
 =?utf-8?B?ZVBHeDJtOWdlTUErb1QzNlVub0Q2eEFzVUFzQ1BsT3lRbDdheGp4TUxNelpD?=
 =?utf-8?B?dzUrZTN2bDM2cU5TWGVNb0NjbWRQQnZ2enV2b0dyNHJhWUJsOGMrV3l2N0Vi?=
 =?utf-8?B?UElqR2R4R0x3OWtiQmpmdXE3N0F0blFnVXFueURCMHNIMy81eGs3L3RUOHlX?=
 =?utf-8?B?SXJCNmd6aEdFckI3NkpsSjNrbi9FR2F0cjZRbWVOTVlWa0svZWJVbXRJT2l6?=
 =?utf-8?B?bzZOTE11Uk10akN5RTdDc3pCNjEvdzRzVTJzd2RocjgwRUxxcFU1YzdqWHNP?=
 =?utf-8?B?WEllWXEzQmNUQ2ZxbENGUnNvSG5Jb3dJTklTUEt2Y09ScGtUK2lQeDVZenRY?=
 =?utf-8?B?VVRNVXB3L0gwNHprVkNkazR6S1dwb1NPTWVWZFc2S0JKdjhaS0trWmpaRTVR?=
 =?utf-8?B?UFM1MFNjU1BKbGFzS0U5Uk00eUdsemsyMzJpYUJ4c1FLVU1BelRsU3JHSEtD?=
 =?utf-8?B?RTJrd3BXSE56UEk2V3plL2xCVU5raFRwZU1SYXVqWVQrR3F2NHc5VDBHVENP?=
 =?utf-8?B?ajQxRHpyUkFRTXJLZ2NSKzFWVWhmb3F0cm9GTHpBUTFkQWlUaUhRclFwWWlU?=
 =?utf-8?B?UkhjU2tqTFBFM2gwMHBHeTZxZ3lZU0hmMlRJeml4VnZPNkx1bEJTREhtdUlY?=
 =?utf-8?B?ekNtY1dpVTh3R0tja2t5cmxaVk96enRnZnBuUHdrQTRnMWVvT1ZIQVIzNG9P?=
 =?utf-8?B?M2RiL1JoWW0rODNTYWNheU9OanR4MGZMd0Z6Y091OTk1SkFQR3RjVHBVUUNz?=
 =?utf-8?B?V00wSlFJbXlucFhNUnRQMUxFVmIwNEpna1dRWnJmbUZIdDhEZEJpckhHa0lD?=
 =?utf-8?B?NU9EYzBvd2FCNHoybytteSszelgzN25ld05jclNlMjhEY2sxSSs5MlJ2UzN1?=
 =?utf-8?B?SUFLQXlzc2NKVGt3TXRzeEltQmJHeWFFemM0dmpNVW1pRkZ1TnE2MmNxUEht?=
 =?utf-8?B?TzFBM3hNK3BTbXU2Rk9WeHRNeGZLbHdCWmJpWUJvVXRYY0NId0VVckZUNDhF?=
 =?utf-8?B?RCs3QWs0TjlCWnlIelJtNk9mMWQ1bWpLWnJITGhvai9RZWN5bWU3S29Fay94?=
 =?utf-8?B?V3VTWm9EeHNVZ2E5a3F6UUFXZm1yRTFJWmVSYkhmdHVCMFd4VXVZU3lnNFBr?=
 =?utf-8?B?SnhrWUNQTGRxdmMyekhZaVR5Y0NCV1BjcGFreHNKS0JYNmNheFlNZHQxL3NK?=
 =?utf-8?B?U3FOZ2ZLRTc1cG0wTVVVRDdjQU16cXlUeEN6VmpmeldMOHdFaGx5YzZ3dVZR?=
 =?utf-8?B?eittMDM2b3FBYkl1dmhScEJCbVdNVXNGRVUyY2JhdWNqYnVmSTFmb0VudWpT?=
 =?utf-8?B?NFMvMXI2d2FXTFBSNmNJeG1VTFZ4ZHZVT0VJQlRxVWZPcFNveTdXL0pvc0ZT?=
 =?utf-8?B?UEl3T3lOR1h1UWRTM3VyUkVodUUyOTZBM1NFY0NraGVBZTliNjZhcDl5dVNl?=
 =?utf-8?B?VWJrenFxZjM3ZE5kYjhHd1dLcHhEZGdLNFpORjRVZEtRcHVZNjkzNUpYekxm?=
 =?utf-8?B?dFh1bk1GdDVUbytPdzJXYW82MitndDY3WElNa2JSei9kN3Jyb1NDNWwxUXk5?=
 =?utf-8?B?dEQzekFPb21Ubk5qay9rcXVicnhPcGtMM0J4UWp5SjljWWYxRUxXTERMY1pr?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <252B72878C8B3641A50DD7F45175DA84@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ce8c0c-36b9-4646-fd22-08db8bda0402
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 00:07:48.8889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hyh7q0tS78iu8uEaIdU/BYBSFfP6HR4UdBju0U4pgqEs+vj3uaNFkTM/ytoscdrLvSmmLRWaRSIpQLxxoSkncqeX73Plh4a+WBJiVduV49M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10193
X-Proofpoint-GUID: voecXZTw4vBrXREslpOiEhPIY-ciOim2
X-Proofpoint-ORIG-GUID: voecXZTw4vBrXREslpOiEhPIY-ciOim2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-23_11,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=989 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240000

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAwMzoyNzoyOVBNICswMjAwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+IE9uIDIwLjA3LjIwMjMgMTM6MjAsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6DQo+PiA+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDEyOjMyOjMxQU0gKzAwMDAsIFZv
bG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4gPj4gQEAgLTQ0Nyw4ICs0NzYsMTYgQEAgdm9pZCB2
cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50
IHNpemUsDQo+PiA+PiAgDQo+PiA+PiAgICAgIC8qDQo+PiA+PiAgICAgICAqIEZpbmQgdGhlIFBD
SSBkZXYgbWF0Y2hpbmcgdGhlIGFkZHJlc3MsIHdoaWNoIGZvciBod2RvbSBhbHNvIHJlcXVpcmVz
DQo+PiA+PiAtICAgICAqIGNvbnN1bHRpbmcgRG9tWEVOLiAgUGFzc3Rocm91Z2ggZXZlcnl0aGlu
ZyB0aGF0J3Mgbm90IHRyYXBwZWQuDQo+PiA+PiArICAgICAqIGNvbnN1bHRpbmcgRG9tWEVOLiBQ
YXNzdGhyb3VnaCBldmVyeXRoaW5nIHRoYXQncyBub3QgdHJhcHBlZC4NCj4+ID4+ICsgICAgICog
SWYgdGhpcyBpcyBod2RvbSwgd2UgbmVlZCB0byBob2xkIGxvY2tzIGZvciBib3RoIGRvbWFpbiBp
biBjYXNlIGlmDQo+PiA+PiArICAgICAqIG1vZGlmeV9iYXJzIGlzIGNhbGxlZCgpDQo+PiA+IA0K
Pj4gPiBUeXBvOiB0aGUgKCkgd2FudHMgdG8gYmUgYXQgdGhlIGVuZCBvZiBtb2RpZnlfYmFycygp
Lg0KPj4gPiANCj4+ID4+ICAgICAgICovDQo+PiA+PiArICAgIHJlYWRfbG9jaygmZC0+cGNpX2xv
Y2spOw0KPj4gPj4gKw0KPj4gPj4gKyAgICAvKiBkb21feGVuLT5wY2lfbG9jayBhbHdheXMgc2hv
dWxkIGJlIHRha2VuIHNlY29uZCB0byBwcmV2ZW50IGRlYWRsb2NrICovDQo+PiA+PiArICAgIGlm
ICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+ID4+ICsgICAgICAgIHJlYWRfbG9jaygmZG9t
X3hlbi0+cGNpX2xvY2spOw0KPj4gPiANCj4+ID4gRm9yIG1vZGlmeV9iYXJzKCkgd2UgYWxzbyB3
YW50IHRoZSBsb2NrcyB0byBiZSBpbiB3cml0ZSBtb2RlIChhdCBsZWFzdA0KPj4gPiB0aGUgaHcg
b25lKSwgc28gdGhhdCB0aGUgcG9zaXRpb24gb2YgdGhlIEJBUnMgY2FuJ3QgYmUgY2hhbmdlZCB3
aGlsZQ0KPj4gPiBtb2RpZnlfYmFycygpIGlzIGl0ZXJhdGluZyBvdmVyIHRoZW0uDQo+PiANCj4+
IElzbid0IGNoYW5naW5nIG9mIHRoZSBCQVJzIGhhcHBlbmluZyB1bmRlciB0aGUgdnBjaSBsb2Nr
Pw0KPg0KPiBJdCBpcy4NCj4NCj4+IE9yIGVsc2UgSSBndWVzcw0KPj4gSSBoYXZlbid0IHVuZGVy
c3Rvb2QgdGhlIGRlc2NyaXB0aW9uIGNvcnJlY3RseTogTXkgcmVhZGluZyBzbyBmYXIgd2FzDQo+
PiB0aGF0IGl0IGlzIG9ubHkgdGhlIHByZXNlbmNlIChhbGxvY2F0aW9uIHN0YXR1cyAvIHBvaW50
ZXIgdmFsaWRpdHkpIHRoYXQNCj4+IGlzIHByb3RlY3RlZCBieSB0aGlzIG5ldyBsb2NrLg0KPg0K
PiBIbSwgSSBzZWUsIHllcy4gIEkgZ3Vlc3MgaXQgd2FzIGEgcHJldmlvdXMgcGF0Y2ggdmVyc2lv
biB0aGF0IGFsc28NCj4gdG9vayBjYXJlIG9mIHRoZSBtb2RpZnlfYmFycygpIGlzc3VlIGJ5IHRh
a2luZyB0aGUgbG9jayBpbiBleGNsdXNpdmUNCj4gbW9kZSBoZXJlLg0KPg0KPiBXZSBjYW4gYWx3
YXlzIGRvIHRoYXQgbGF0ZXIsIHNvIGZvcmdldCBhYm91dCB0aGF0IGNvbW1lbnQgKGZvciBub3cp
Lg0KDQpBcmUgeW91IHN1cmU/IEknZCByYXRoZXIgcmV3b3JrIHRoZSBjb2RlIHRvIHVzZSB3cml0
ZSBsb2NrIGluIHRoZQ0KbW9kaWZ5X2JhcnMoKS4gVGhpcyBpcyB3aHkgd2UgYmVnYW4gYWxsIHRo
aXMgam91cm5leSBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNCi0tIA0KV0JSLCBWb2xvZHlteXI=

