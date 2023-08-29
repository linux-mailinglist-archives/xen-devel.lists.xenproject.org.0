Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF978D04D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592508.925237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb804-0006n9-9O; Tue, 29 Aug 2023 23:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592508.925237; Tue, 29 Aug 2023 23:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb804-0006kb-6U; Tue, 29 Aug 2023 23:19:56 +0000
Received: by outflank-mailman (input) for mailman id 592508;
 Tue, 29 Aug 2023 23:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb803-0006kQ-0T
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d570ca5-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:19:51 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9f021983; Tue, 29 Aug 2023 23:19:48 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:47 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:43 +0000
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
X-Inumbo-ID: 8d570ca5-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb8bctkTG9C4wzoqZGcx3fQI+wXfN/+KWBTmmJxhRIuZ3FdpPAlOmiJy2fDW7D9lBpYzbuCxhIMOAk6d5BvilBRaY/SqtejXPoBBJprm2nvpznvi8RO4bIn+KMAC+qJrh49Q9w9FWF0yCEUZw9nSSMAOzRe+8N4B/xqv7WFXpTwyCPYeFNR4F/+dXASebDvBmCSPi/mBhPw1xbk9jX1rus0ZUsfgei3XwzdiDwSs9/sUcQ/EENbOiRL/mC5+6+b4FiBaE5uJ2DGyWQDC7uq1Q7vjn2Qf7auqFaRdk22IgoceP89jFL98zXQTZffexwnzS2j7QK0ACP1mUArJ1qFN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1exkS/uweIgKXeUpBvInyadEJMzoYayUA8BpUFSFtw=;
 b=iberMZOBsXwU5e/SktgmXy6EbrCeDNwLmSYhzfp+GgT3yKZWtQTu6db9clo10ldpNCP0qjNn+9PXUhKMvyEERDEHthSNK2ZTpUrLOX16IuDxDyMdIO1l+ynKEAzbklVn+PVSJHHdAY2W3bd3cdVzKt/QMpYHs5qNOj0vF5kvLO/JeJ7MMJSM+JMxGaTXeihJ6w0mz6dvz+1OIqFzF7wGdWzQGAXsl2fhLzFX0aUlU73rPqfPsv3Wd4FF6uQdiDMovluUICbUFIWqOlTvviwj1hQxaBIEcnicOXcktTulijxcjmeEO6C2ggXMg6iTEm/KpraXi4Bk8VoUPhSkg38sLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1exkS/uweIgKXeUpBvInyadEJMzoYayUA8BpUFSFtw=;
 b=LdIXVIEuPdohj4F/EpfidYzR6m1UWIkmFljEkD0WmvPqDivdYXE5wQh0EDDbGVbpNzB4wuFLh2D9kokeqygkBqgT/cHUnybONT2PM0fKMjseeLAL6jLYox3A5/nXH+RWcD3UAb3bSOLdIQSpmMxgnJ/QignQMiKDqJL0aoOPVxKfrau+uuBG0HKymMsu5Csan8ZM92XFyQFgPYRCqRKjufPAinH/hJhtlBdnqPZuluDCvupWjYJo8K/oQmjVJnV7gmCaNo67J3ZfraVsC/VuztsK1K6DkSSCzeh4M3O//AgC59WBsM4RjfD7KmD1AuJUWn5fljRJ3yaeZ53Qiaqz5A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 03/16] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v9 03/16] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHZ2s9K3uXHQsaiPESKImIi9IiKlw==
Date: Tue, 29 Aug 2023 23:19:42 +0000
Message-ID: <20230829231912.4091958-4-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 3f6a034c-0eed-42d7-ee2a-08dba8e66d99
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WxIQjI0a68yrnUfjB039J8OX5mdq6t9zWgtZQQs0+EylFXk0E7ALFlTKMnUt9rynIrt8UfpqSWj9OCAPEFSDmwuoBc+afygSTSKaK7AraR5DrCql9ZfineZRW4a2Lo17RR4i0+mRGqFPvUqVaCYd9q6TNfNpE8jOpkoMG4HThBE3k2gywICJcgEoA5Deb1EhN/l8M6i/JYtHOaKkg20Vb29eB/LY7JPqx3eAVTRek9x0BXIsiPJpFUnLD9Y5g2+zMSobWHn8Sw7LzP4Wfa8Fo6urI951yPGr9ao1Qv9thf5ojSp0nlv4h+0LqFcdkf+5GkH47aWJzcFWr7HpNJNjmnVBhRmIsBULmFRj+JfJFCg98jjOQNHCJze4InVjYaZPLtj0W4kM5ptc4XlpxoCMtXghEpeoelRPD9xdOEtJ3fJSic8OGJEqitquyXNxzqST6AnC1mzofsinXVGke/fQ1ghBhuBsQvrGLwQ5tniWfqMPm7jrpSQjW9LYYr65Ae4l9ecHRrIOpcSaeLYadAdYGxGsV4b72yRTW8IRLhqFuELGtShV/zLTHdzM0a5cf0TCOr9XSgjizVLe1b2JPdrsscy89FuVqa7SPHn8IorgNWr5nX6G6r5J7xAV/8SibqzJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWpHaHo2WHNySlhJcG9USUZ1bm9FQ3Jod01hZVhIRGh0MVd1OCtKNG9vY1VC?=
 =?utf-8?B?bEpVNGVGcG5ZUjlKSE9hTFRSL2tTZFgrL1Zrc2s3bXprUTJ2Rit4ZEUydHVq?=
 =?utf-8?B?SU9LcTBmSU53RUJFdlh3eUhSc2dNelFhSkFJUEV6NjRvNTk0MVh2NGpXWVBj?=
 =?utf-8?B?OW5BVW5WUUt5M0ZLUHVxeXlCemUzQ3hremxRTHVUUFgzZXFGaUdvSHVyNURv?=
 =?utf-8?B?Ukd0dldyTkZQbUlhVHpZRE5GdWVzQ01EbHZlZGVOSUlmQ2l2NDVVbU1DVGNR?=
 =?utf-8?B?dEFDemlhOFgvOFJWaUNQN1BiNU1LcVUyMVVNdEJudDUwZHZjc01PUXdDY3ov?=
 =?utf-8?B?VXRuU01SOEZoYU8wSit6a0FyVkc5ZFhBQ1kxdUppVFBMUS9kUEI2UUljNk9q?=
 =?utf-8?B?d1lrck5HL2g0eVgvVHpWbDdDSmFSV1MyM3VaVnFZajJPN09ycmJEcDdSRkJZ?=
 =?utf-8?B?MDR4Z2hWbG1mTVpMRC9sUkpvOUhkQ2N0S2JzZnR4eGRyZDhjVHBGaW5iOFNK?=
 =?utf-8?B?RStXRExENjZYaGtBc3pYMENJdU1tRGNtUnR2V1poSmFXVUZyd3d5UHRrK21V?=
 =?utf-8?B?bnFnSitBK01GR1VETFJvOWc0ZDlwT1I5aGdRTmZmV2huMENZZUROM1BIajVZ?=
 =?utf-8?B?R3YwaTR1eC91UEFkNjNBNGhvY09PaXBOWGpobnpSVGc5S2JzWkMzOEl4Smla?=
 =?utf-8?B?Sk1md0dIZy9VQ2xYMjgyNGwyVy9wbGpUdlAzUEl3VFFucjA5YlBmZzUvZ2pw?=
 =?utf-8?B?NzE1cUQ4N3JEVloyU3pDMDY0ckJxNjgyL0FocUV2ZlRWT0xrdzJjK0dtNWk1?=
 =?utf-8?B?MFgvUmMwbTFYeUx6Qm4zdHpiZmR0cGV3dThkbHhjakdINTc2VWVya3MyaU5K?=
 =?utf-8?B?Uk5zeFZHUVB5U05iL1BIcU5KY0NzZXZteWw3SFdmU1YzMkVWMTlvQjRWejVt?=
 =?utf-8?B?ZHpjd2VRb3o3YXUza0p0TC9xUGo3c25qUkdESXBxWVZGWnJHaE5kMGtKbTFW?=
 =?utf-8?B?cEFGMkZVdnlwV3k2b2t2UzMvK0ZVa00wcXVyMGY1Rmw1YzJ0UVFncU5jTUxi?=
 =?utf-8?B?dkpqL2hjUE5oRDBtemlIOU45bnYwaFVSUUh3MUxuLzdwdVJqQkFGanhyTlU3?=
 =?utf-8?B?bWRyYWZPK2pRWm5yZVVjWVo4aktEeG5QMzN0MVFhYlV3OTlldUw3c2RqNWNZ?=
 =?utf-8?B?MWg4WHY2SFlwbGlYZ3ZwdDNaRzhZMjNiU3ViRDNuZ2RzY3VmMVpyc2xqSzlp?=
 =?utf-8?B?OFcvY0ZPTkRhdVM2bndGVjFiYktQcEVIbW9od3hhbjNLaWZlbXdOQ0VBVTVS?=
 =?utf-8?B?N3FYVXZpVm95MmhqT3IrUXAwaEJvYjBOT3dHOFFNcVdCUk9DUTNpU2hZQjM0?=
 =?utf-8?B?d0FydTB4MFlnTlE3c3Z3WGsyQ01weVRlT1h4SFNkTjFVeXY2bHRHSjIvSnBP?=
 =?utf-8?B?N1B5cW1sc0lxNG80aFZWNjlONmcrbE1oMDlCSmhTOThnVWx0T0FVYTVtVzgv?=
 =?utf-8?B?SUNKakprbjNlN01FVUxKZHM0NzFYazJXZCtoL2w5endIWm9xYSthUExCcVF5?=
 =?utf-8?B?RmRvS1Ewd2dZOWdoYUF2bkF2VDIwT2hYWHI5ODVmdFhOMUxkRG9HNnp6TlJN?=
 =?utf-8?B?TTFxK3RwRzhVbklVN1NUMTJBbFN1Z3F3VEJMZUthbThKZXhyZUhNL1hmODFY?=
 =?utf-8?B?QVd2UnEzZXdSV1B4T2grTDZSellNUFBTa243NjJ0UmlDamJseXZjUHRlclM0?=
 =?utf-8?B?NEV5ZW1hOHdzbEFFUmtnbnQvTFlCU04xWG1BQUI3OFcwUjY3QkhSQmMyWkho?=
 =?utf-8?B?ZW9hQytsNEtBM0Q5ZnlLcXczeVdzS2JIN1ptNWQwQkZpUlNFTFlzNmVaVHJB?=
 =?utf-8?B?b1ZxK2lZSGhESkc4VVJqT0hadXJlRkZNMVJydmFRUjhRejVjb3lSMG1sYkdO?=
 =?utf-8?B?RWk1QlJBWTloR29qU2hXRmNVN2J2NTZ3UFMySUhQWXhScWNkZFBrSEg1cEho?=
 =?utf-8?B?MXVzdWJXVGFCZ1ZzSUpJUE1oSlU0NGZ6RUR3V1VMTlJsd0ZtNDg3NnhqelRU?=
 =?utf-8?B?Vko3c01vWWtOQ1hIa2xGWTlmaXBJTlFITk1pTmRGNml4Vng5Zk9KRjlFcjFx?=
 =?utf-8?B?d1Fla25lNWF5MHFHb09zYWlGZzNzTEs2bnZUYStSNTBJL1B4UnRER0IvbFoy?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13D18B520035FB468CB752BA33A6723A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6a034c-0eed-42d7-ee2a-08dba8e66d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:42.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRtRiv9Nf+xw0DSm16Nkle+MfmvvAE8nMhVtKiCBsm4J5bz4B987p4hUc0tkYeebI9UOdNpwfckiK3tI09ATupeaJJziSAXyq2w8rvXRJfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: at9ngLsWyGyG-BiUSJp1Xd_7n9ZHX1Dy
X-Proofpoint-GUID: at9ngLsWyGyG-BiUSJp1Xd_7n9ZHX1Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KDQpBIGd1ZXN0IHdvdWxkIGJlIGFibGUgdG8gcmVhZCBhbmQgd3JpdGUgdGhvc2Ug
cmVnaXN0ZXJzIHdoaWNoIGFyZSBub3QNCmVtdWxhdGVkIGFuZCBoYXZlIG5vIHJlc3BlY3RpdmUg
dlBDSSBoYW5kbGVycywgc28gaXQgd2lsbCBiZSBwb3NzaWJsZQ0KZm9yIGl0IHRvIGFjY2VzcyB0
aGUgaGFyZHdhcmUgZGlyZWN0bHkuDQpJbiBvcmRlciB0byBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBy
ZWFkcyBhbmQgd3JpdGVzIGZyb20vdG8gdGhlIHVuaGFuZGxlZA0KcmVnaXN0ZXJzIG1ha2Ugc3Vy
ZSBvbmx5IGhhcmR3YXJlIGRvbWFpbiBjYW4gYWNjZXNzIHRoZSBoYXJkd2FyZSBkaXJlY3RseQ0K
YW5kIHJlc3RyaWN0IGd1ZXN0cyBmcm9tIGRvaW5nIHNvLg0KDQpTdWdnZXN0ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KUmV2
aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQotLS0N
ClNpbmNlIHY5Og0KLSByZW1vdmVkIHN0cmF5IGZvcm1hdHRpbmcgY2hhbmdlDQotIGFkZGVkIFJv
Z2VyJ3MgUi1iIHRhZw0KU2luY2UgdjY6DQotIGRvIG5vdCB1c2UgaXNfaHdkb20gcGFyYW1ldGVy
IGZvciB2cGNpX3tyZWFkfHdyaXRlfV9odyBhbmQgdXNlDQogIGN1cnJlbnQtPmRvbWFpbiBpbnRl
cm5hbGx5DQotIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KTmV3IGluIHY2DQotLS0NCiB4ZW4vZHJp
dmVycy92cGNpL3ZwY2kuYyB8IDggKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jDQppbmRleCAzNGZmZjJlZjJkLi5jYjQ1OTA0MTE0IDEwMDY0NA0KLS0t
IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
DQpAQCAtMjMzLDYgKzIzMywxMCBAQCBzdGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBjaV9z
YmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCiB7DQogICAgIHVpbnQzMl90IGRhdGE7DQog
DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHJlYWQgcmVhbCBoYXJk
d2FyZS4gKi8NCisgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJlbnQtPmRvbWFpbikg
KQ0KKyAgICAgICAgcmV0dXJuIH4odWludDMyX3QpMDsNCisNCiAgICAgc3dpdGNoICggc2l6ZSAp
DQogICAgIHsNCiAgICAgY2FzZSA0Og0KQEAgLTI3Niw2ICsyODAsMTAgQEAgc3RhdGljIHVpbnQz
Ml90IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQogc3Rh
dGljIHZvaWQgdnBjaV93cml0ZV9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcs
IHVuc2lnbmVkIGludCBzaXplLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
ZGF0YSkNCiB7DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHdyaXRl
IHJlYWwgaGFyZHdhcmUuICovDQorICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50
LT5kb21haW4pICkNCisgICAgICAgIHJldHVybjsNCisNCiAgICAgc3dpdGNoICggc2l6ZSApDQog
ICAgIHsNCiAgICAgY2FzZSA0Og0KLS0gDQoyLjQxLjANCg==

