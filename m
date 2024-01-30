Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0F842B7D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 19:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673662.1048078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUsZ2-0002XN-10; Tue, 30 Jan 2024 18:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673662.1048078; Tue, 30 Jan 2024 18:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUsZ1-0002VI-Tr; Tue, 30 Jan 2024 18:10:27 +0000
Received: by outflank-mailman (input) for mailman id 673662;
 Tue, 30 Jan 2024 18:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nelp=JI=epam.com=prvs=875913d1c2=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rUsZ0-0002VC-CC
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 18:10:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6721a53-bf9a-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 19:10:25 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40UGJPXL022894; Tue, 30 Jan 2024 18:10:10 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3vy4hj8umn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jan 2024 18:10:09 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DBBPR03MB10440.eurprd03.prod.outlook.com (2603:10a6:10:53c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 18:10:06 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7249.017; Tue, 30 Jan 2024
 18:10:06 +0000
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
X-Inumbo-ID: d6721a53-bf9a-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrtR6DRvW5HyFvQEVSadSeP6xTufYtMHulsTyU0NymdpIW9DCMgMiuQyO20+bXEabRtaq9F30iUMta8BK4GFrP4mV7HKaHme2kqEN/bbBoGN0oOKiYBvVCA5ZQ5c+MixzTaDg3aYPpqAccwgAWYvNJ4VC7DS7qK+mJDXGSdScX3hLoevwanQV7tTjX3482wmw/yix5KXKuZ6Bmu95du5Sz/Gf9OCUm7uV2NUuW3zd0PDFPRiqsoF9boYsYyJAAs6Cek9jsdd/q8kf3I1ZMyvHzQHoSDofS7Kkoj2vGVHPiQV+Nm1kSCdaf4VVrgWe4uzhIrAOIaDnO3lw1ZHFBCu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YVpvWJmtnyfvFJRT7vIoRtVvt0hhVd9rXB4SJedm2E=;
 b=PLOR8fVQzS99uLgaul+y5fWkBhp1tB2QxK9avUmFpNlIE+t0Gw+iyKryAtEqzdU5/FESKy5LGtmLs2RQtDH6zWDt4VJRzvUZCReOqBTmv6KcEkBxLAot4XmWfLdx8Wu98y5rbUIunjREHgrp1bDQfpVjq0KcIGdu6kmV6PLZpeqddlgW4JXmSIe0XzAtR614dUXEtuJLMtVRujWmnMd0IEeyr7zisnSecXLceRMDx699qt6eUmgk46HOKHrpCF3hgeLuD5o6t4VZgAb1QPnn8p83PHF3Rxcvk/h6c/CDSkuaodvufjPGFl2sEUZple1fuAKfZJicU/8uROrrbjG18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YVpvWJmtnyfvFJRT7vIoRtVvt0hhVd9rXB4SJedm2E=;
 b=Yr+jsfREyBSUSy26YfsxvkuWz+Tvwckyi67zRYpxzUdH3sXi3zdxXL1K91msJj9sJ1p6QSuQnD8tArEToqLj63xbW8x6uywoolgmsUZ4msUoNV7R3tCy/KormNndq3mvPy2RzA2/bOiy0ahnRC4psgWJGlD3tE43P/vgGkMz7UuwQo+a9DRLSenxUeI6ypkqBbiRcAOObnz0iH8FlO0KrJv5yMV33FmZAFwvluNhv25bAGh67s9HnKiToxaFb+1Oqi8DiBnfwyoWF1XDD5K9z5tMpAXG57Kzn5B5Y8zUHl8LuOuh1mW+K3evFzs2EWLUnGnDn4c1Oz3d1iuY6AWyNg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal
 Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Properly clean update to init_ttbr and
 smp_up_cpu
Thread-Topic: [PATCH] xen/arm: Properly clean update to init_ttbr and
 smp_up_cpu
Thread-Index: AQHaU6HyUyltufp+KE2Jtz4dElFoO7Dyp8CA
Date: Tue, 30 Jan 2024 18:10:05 +0000
Message-ID: <0e1c942e-0a1a-4e1f-887e-d3e777a8855d@epam.com>
References: <20240130172942.52175-1-julien@xen.org>
In-Reply-To: <20240130172942.52175-1-julien@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|DBBPR03MB10440:EE_
x-ms-office365-filtering-correlation-id: 4c1e9b10-2bea-4412-d968-08dc21beafd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Hdpm1j9mZXyEVo5LaOMZ/EJAkQ6vypFeR0LuCsSPW2IwWeTcjYRkFsbx3PVRWUbRaoQfw0fI4e+REkpAYWSoDLyJDdCDqKXupNuoU2Xsj70d5FfevdUOwfL00Ta6X5BuPK0ZZIQjE3N1WScnDdF+IKy/Nc5ynWGUIBRLM+IoxSV/TFJeOyqBDWKIaLmc2jYEZ+748ZCyJ7UuMS3wTl5acD/BB+J0VOqe6iejg8qmtXoHcinOupKdyxJSiGZUmNE1SiAgetGGZfYc4W3WJJ2thB538uQzIFXd6jVqCRf4hXbO2ryNqYMwjvZrF7+NvEK7pv1frcB5sGKV/912n6sxSkAevRCfKhVaAtyWDzYy7YTblDCG1+riYPrvPq7oogCyddvyMYjZgAnjrZ7f99CoHPEdf7kittBDf+amMCLaeMng/N14WvDreuPT0jGRnNFsJEEAhQt4NZBj0pprsRgb9GQP+Jt3ZSx9PVyx97cVFoMAo41ir4z9D9FI0ZJd7z851wCHNeO45sN2+SLd9GGK+PiVN3qzm/jGbWVLfjdXp3EHcRLNwRrCSng9vjickkJvFWUGAPmqRPlleQh67xjTcZiEHqq0mKAmamWtK5G30bedLvNxuYx20xJwPY19S0Vtd7Nmh88aVL5TNM1Cxg2pNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(110136005)(36756003)(83380400001)(6512007)(38070700009)(76116006)(107886003)(6486002)(6506007)(53546011)(478600001)(71200400001)(86362001)(31696002)(2906002)(15650500001)(54906003)(66446008)(66556008)(26005)(8936002)(66476007)(316002)(64756008)(5660300002)(4326008)(2616005)(66946007)(8676002)(41300700001)(122000001)(38100700002)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bVpKdkxlSG9mNjUyNlBvUHhWb2lLVCtuLzlBY3BuSlo2S1V3SjlEUXNTK2hu?=
 =?utf-8?B?czZnVWdrZTdNTnlERktyaDN5blVNd1lsZGJqbC9SdVpWRk44Sms2dzB5b0tW?=
 =?utf-8?B?Nm50WGVnU2MxR2NnTlIxSDIybHc5M3hnYUZDY1JUc2tocndPWlZHOXZxb1JW?=
 =?utf-8?B?ZWxWcjlSaTVDQnF5S1JaZUlzM1lvY2R5VkJ3UlB0VXVJZ0RUakp1TDM1Vkpx?=
 =?utf-8?B?L3hBaHI4ODI5STRXazEydWVSUXRnSTZ6ak9Nd2NWRGIzeW1NdlZLdXN5ODNV?=
 =?utf-8?B?UkNUNlZGUjJUZTlXemp4WXNtM3BlVVo2RkJXcUZMVWErVGs5L29QbUZTd1hv?=
 =?utf-8?B?cGJUV3poU2JqUEYzUWhzRnpGdmFlbUtTVG5jSG5vSlRpTG5qaFkwS2tEYU83?=
 =?utf-8?B?WUtjSkpxcHZIRjYrY1NqRzJRZXdNMlljaFlqQmNGLy92RFdtZlN3cXhYczVU?=
 =?utf-8?B?eEUrZUppZFFhbHRoN3RQVzl0YlZuQ2NnNDhaeVNacjRrV0pVTnIwbVFHWUth?=
 =?utf-8?B?TjI4QzBhVkRYZmN3WE9SM0ZROXpleGhRc1VoZ2tibXNBYyttY0x0Tmc5QkhT?=
 =?utf-8?B?ZTlCeGVheUkrYzF3Zjc4Y2hQdlk5OXBaTzEwOEFKZUozeDdTR0lJRGNWWHd2?=
 =?utf-8?B?V0ptSkNkREQ2ZU5adXljV0FadlRmR1pWaDNUclJHUzQvWVhhczByQm1INS9L?=
 =?utf-8?B?RTFhTWkxMVB5TU5FUWZhRXpLVDBlZHBWTHI1V2VMN2FGazFXMGQ1UGxlZUJu?=
 =?utf-8?B?OGVCd29HNzdubUFOUFpFWUd0Z1ZCMWQwdlRUbHB0ak1XcEczNUh5UWI1Wk5U?=
 =?utf-8?B?M000eXV1TnU2N3Jtb1owNkpOblRmVmhFQTliYmQ4bXdpZFRsWGRIcnpiZytj?=
 =?utf-8?B?eDVad0oxQ0xRQnM5TmRGZ2dzWkQ1RkFNWHhyMFRNbVYzU0l0VVgwano2RUJH?=
 =?utf-8?B?ejk2QVEwOHZyRzhrYUY3aWM4N09uZEVqMmpiamNvNGtUcTc4dDN5RW1zSzgx?=
 =?utf-8?B?d3pBRUFqdGlROWJJbWhrcXJnUzN2VERkTCtLY0Z0RGxBdk1HU0dUM01Kbzlx?=
 =?utf-8?B?TVRwbFVvWllSempXbnRSbWpZMGlUUndKekZHejFwM0FEaEFnZFRwWUlaOGpS?=
 =?utf-8?B?N3QyVGl4K0t4ZE9TUGo4MGNydVJnSDF1Q3pHTWlwNXJGelE2WTVTREpnYXl3?=
 =?utf-8?B?anVWc0dTWXhmUXRhNERCU0dOMkk4VXgrWE12OXczL09tUXRBUit4RUo5M2tn?=
 =?utf-8?B?Z3RtUFI4bWpsOEdJTEFBYmdkS1JScWdRUXlJbHJJei9rTGQzM0ZONk9EUlhH?=
 =?utf-8?B?U0xIK3NaaUtTeDNkT1c0S2lQWE42cWVRWHg4cnlLZ2lEMzQ4SmgxSWd4T0Q5?=
 =?utf-8?B?V3hucDBLOFBMVmk5dWE2QlRPTWhXM0NmejVEUGt1Z3o1SDIvRncxUG1rdU03?=
 =?utf-8?B?ZExtNmpReEJKT3lnV2E2VTg0MGIyc0QyR2pxZlp3Z1Q2b2h0YjZiRU9SWUgz?=
 =?utf-8?B?VTBsZGgvQ0xLYmV1RU50MjhUQ3p3NzFhL1ZJMDhPK0E5ZmMyamRaTzhkT3Rw?=
 =?utf-8?B?Vk5UWmJ3VDZPeGJxcUI3R2RJbDA1ZEl3alVGNUdCWWI3R09UbTAzeUJSOFAv?=
 =?utf-8?B?a0ozQnA3NzNMRTN6Si8wR1dzU2hTME1SWE9xT2h6OFZoaU93SXFuNGxMZDAy?=
 =?utf-8?B?WU8rOVlzd2grUi9kYjNKT2JqU05zSGltd0tPVmE3eWNaWTYxK1QzRFlzMGRB?=
 =?utf-8?B?REVVK1loUWx6UzZ1d2kyMWVMZmMzamJRdlpuUkIyNW9LVk81SWlRdGxGM3ps?=
 =?utf-8?B?R1dxTFRHZEgyKzQ1U0lYYXcrQ2RyeS9pV2xVTkdKdlFVc3lnTGptOFBZa0RB?=
 =?utf-8?B?ZXpKS1FzVG0yOWZ4Rjk2WngwdHk4QlpEaFkwTmhyOGc0a0xvSDM0bUhkSlZY?=
 =?utf-8?B?VkN1ZlFVbnpCUTdkL2tSQWFRYkdQNGRJOEp4cDFOQklZczFTWFhBbnp2Mkpp?=
 =?utf-8?B?WVp6TCsxUzFmTk1VbkQ0SkhaZ2lsbVVVVEFmQ3VVQmU0SkljZGVzYnB6cURF?=
 =?utf-8?B?MkMzdmNSN0d5UFlqNUoyZ0JVVkdjZ01waVpUaFFjWll3MWxzOVlRalNMRlY1?=
 =?utf-8?B?MVhyaXE5YWdnWEswbFNKRm5ic1VvSlRoOXE1cklOK2xOTjFPZVo0L2tvSmtW?=
 =?utf-8?Q?Ixip/bCR2XgiWRklEu3znZo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7596EE5B3A32743A9D752A80B3499F8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1e9b10-2bea-4412-d968-08dc21beafd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 18:10:05.6865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TF8KQ4aQjTWoxbUiLp7pLiOaQlWzqdrlvkyYIiibGC4Layl9VtiA8s0cx5jr3RugQco4GHWcNFf7KYlWW+PgjVHUcpA+vbA4jU70rTXec8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10440
X-Proofpoint-GUID: ObZjWdr3_tRDbqGDZl56FPHWgs_3n_wt
X-Proofpoint-ORIG-GUID: ObZjWdr3_tRDbqGDZl56FPHWgs_3n_wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_09,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=618 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300135

DQoNCk9uIDMwLjAxLjI0IDE5OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCkhlbGxvIEp1bGll
bg0KDQoNCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IFJl
Y2VudCByZXdvcmsgdG8gdGhlIHNlY29uZGFyeSBib290IGNvZGUgbW9kaWZpZWQgaG93IGluaXRf
dHRiciBhbmQNCj4gc21wX3VwX2NwdSBhcmUgYWNjZXNzZWQuIFJhdGhlciB0aGFuIGRpcmVjdGx5
IGFjY2Vzc2luZyB0aGVtLCB3ZQ0KPiBhcmUgdXNpbmcgYSBwb2ludGVyIHRvIHRoZW0uDQo+IA0K
PiBUaGUgaGVscGVyIGNsZWFuX2RjYWNoZSgpIGlzIGV4cGVjdGVkIHRvIHRha2UgdGhlIHZhcmlh
YmxlIGluIHBhcmFtZXRlcg0KPiBhbmQgdGhlbiBjbGVhbiBpdHMgY29udGVudC4gQXMgd2Ugbm93
IHBhc3MgYSBwb2ludGVyIHRvIHRoZSB2YXJpYWJsZSwNCj4gd2Ugd2lsbCBjbGVhbiB0aGUgYXJl
YSBzdG9yaW5nIHRoZSBhZGRyZXNzIHJhdGhlciB0aGFuIHRoZSBjb250ZW50IGl0c2VsZi4NCj4g
DQo+IFN3aXRjaCB0byB1c2UgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKCkgdG8gYXZvaWQgY2FzdGlu
ZyB0aGUgcG9pbnRlci4NCj4gDQo+IEZpeGVzOiBhNWVkNTllNjJjNmYgKCJhcm0vbW11OiBNb3Zl
IGluaXRfdHRiciB0byBhIG5ldyBzZWN0aW9uIC5kYXRhLmlkbWFwIikNCj4gRml4ZXM6IDlhNTEx
NDA3NGIwNCAoImFybS9zbXBib290OiBNb3ZlIHNtcF91cF9jcHUgdG8gYSBuZXcgc2VjdGlvbiAu
ZGF0YS5pZG1hcCkNCj4gDQo+IFJlcG9ydGVkLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8amdyYWxsQGFtYXpvbi5jb20+DQoNCg0KW29uIFJlbmVzYXMgUi1DYXIgR2VuMyBTb0Mgd2l0
aCA4IGNvcmVzIChBcm02NCldDQpUZXN0ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS9t
bXUvc21wYm9vdC5jIHwgMiArLQ0KPiAgIHhlbi9hcmNoL2FybS9zbXBib290LmMgICAgIHwgMiAr
LQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbXUvc21wYm9vdC5jIGIveGVuL2FyY2gv
YXJtL21tdS9zbXBib290LmMNCj4gaW5kZXggYmM5MWZkZmUzMzMxLi40ZmZjODI1NGE0NGIgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbXUvc21wYm9vdC5jDQo+ICsrKyBiL3hlbi9hcmNo
L2FybS9tbXUvc21wYm9vdC5jDQo+IEBAIC04OCw3ICs4OCw3IEBAIHN0YXRpYyB2b2lkIHNldF9p
bml0X3R0YnIobHBhZV90ICpyb290KQ0KPiAgICAgICAgKiBpbml0X3R0YnIgd2lsbCBiZSBhY2Nl
c3NlZCB3aXRoIHRoZSBNTVUgb2ZmLCBzbyBlbnN1cmUgdGhlIHVwZGF0ZQ0KPiAgICAgICAgKiBp
cyB2aXNpYmxlIGJ5IGNsZWFuaW5nIHRoZSBjYWNoZS4NCj4gICAgICAgICovDQo+IC0gICAgY2xl
YW5fZGNhY2hlKHB0cik7DQo+ICsgICAgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKHB0ciwgc2l6ZW9m
KHVpbnQ2NF90KSk7DQo+ICAgDQo+ICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHB0cik7DQo+ICAg
fQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9z
bXBib290LmMNCj4gaW5kZXggMTE5YmZhMzE2MGFkLi5hODRlNzA2ZDc3ZGEgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3Qu
Yw0KPiBAQCAtNDQ5LDcgKzQ0OSw3IEBAIHN0YXRpYyB2b2lkIHNldF9zbXBfdXBfY3B1KHVuc2ln
bmVkIGxvbmcgbXBpZHIpDQo+ICAgICAgICAqIHNtcF91cF9jcHUgd2lsbCBiZSBhY2Nlc3NlZCB3
aXRoIHRoZSBNTVUgb2ZmLCBzbyBlbnN1cmUgdGhlIHVwZGF0ZQ0KPiAgICAgICAgKiBpcyB2aXNp
YmxlIGJ5IGNsZWFuaW5nIHRoZSBjYWNoZS4NCj4gICAgICAgICovDQo+IC0gICAgY2xlYW5fZGNh
Y2hlKHB0cik7DQo+ICsgICAgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKHB0ciwgc2l6ZW9mKHVuc2ln
bmVkIGxvbmcpKTsNCj4gICANCj4gICAgICAgdW5tYXBfZG9tYWluX3BhZ2UocHRyKTsNCj4gICA=

