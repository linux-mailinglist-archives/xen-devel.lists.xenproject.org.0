Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2366B447EB8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223272.385917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2e1-00070l-DR; Mon, 08 Nov 2021 11:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223272.385917; Mon, 08 Nov 2021 11:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2e1-0006xx-AN; Mon, 08 Nov 2021 11:16:57 +0000
Received: by outflank-mailman (input) for mailman id 223272;
 Mon, 08 Nov 2021 11:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncso=P3=epam.com=prvs=1946062fbd=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mk2e0-0006xr-E6
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:16:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 606a10a3-4085-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 12:16:55 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8AmcSQ024722;
 Mon, 8 Nov 2021 11:16:52 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c70xe8qus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 11:16:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2829.eurprd03.prod.outlook.com (2603:10a6:800:da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Mon, 8 Nov
 2021 11:16:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 11:16:42 +0000
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
X-Inumbo-ID: 606a10a3-4085-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwA2RrLDXgFomg6NlqCo2rBNOdDCSU8C0sQbNDE1usw8OhycJqepy1m+Zp713fHfu2TfKF8+Tjig+WNW4FMmU+h7LWkj3z7scmTbsUyi4O/atntqwltEdMHY0z6SiQX4Mrutcy/nYYt6sDeUnE63EdUZ3M7pORcgLF5puXvXl6ilqhL9OKFsToQR6DaymA7TdOe1TXa2nqdMZ65qPVLvd4OujNAUTs9pkfUHj/penZH1CJft6ls44hxbHcvRE334Wq+DbT19cCiuEHB7M7tasuDGJQfU2lKK6JuVT5baLI0rPqCUgxi0C2WP+Lv9aExHdVXeXBfoHqbswWiVNapdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGHu4N9KIv9DB6ztv5hZ39sRT7mQMRv17GmzdYBMxf0=;
 b=AVbnpvYnLIKOoDPM5htSPA7k7pzfG5cYkB6gojga74zrdW3gEMopdz0/kioPXmx8s5V5PCpXuliuqHSr0VN+MxLtAO5XnBXf7FeoWIQgR8dGXnk0O9BzwHCEGsB+wOHbnHDIZPz+Z9HiieFCoVns2CfefCUC3lTIYtHq/O4NnASjQDoLb6mmFgbj96GXZSHL8oPzO9xMbne1nxppniGle9tAzPNI4v2TowP+wNvbz4opqzAtvaHB4siG73ErDZtKQHMcEEW8hnbKAm7hjRhbuWlmDZQxBCl2VEOJ2vYbcGrgPaskBsJotvC2NIwbYv6kRClyB5xoHCQDlhZA8qo5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGHu4N9KIv9DB6ztv5hZ39sRT7mQMRv17GmzdYBMxf0=;
 b=PRILOAFDrzoYgFxNE7EH09Bzs6Qe5BOcUPJG6kGK9alZEojT2Tx6J38IgcFJjIiGKXuKcBK0t8z7ZoUVuGFn1+c1Nbk7mvjpWeVelhdN5BM9ySYdWB15GVlG8GCKLcWLMhgLXOmdCLE5LhI7EieuYr05ZfzGu3sjfXydiP0Q2YY0Fu70v8NTLldLtfp8d41rpF11lafoFL28cNyVqIPFbN3J7wJfpH7c8gLl+K7b4wCFQGFdkljr252NnCStEJWqllzSwZg7HkREQur1nZXQ4QftqkRnqb1n4kgxqcGQcVm89T0hMUBOzH8/wbNv1DR7a6ktr+j25srEURlIeoY2Ng==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHX0hJP4tGfmNyDbEa0m8z5ITSeMav5fmGAgAABr4A=
Date: Mon, 8 Nov 2021 11:16:42 +0000
Message-ID: <c05b3e98-772c-a8c7-d8f8-841289683a02@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-12-andr2000@gmail.com>
 <da36ee68-3162-0a32-f033-98af34f9c94e@suse.com>
In-Reply-To: <da36ee68-3162-0a32-f033-98af34f9c94e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dab4d283-e1f8-4b5a-a98c-08d9a2a93dfc
x-ms-traffictypediagnostic: VI1PR0302MB2829:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB282967F8E2FC9598EDF71768E7919@VI1PR0302MB2829.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 R8ol2XuYCmI0SkXiaGxGk991tMMSD4X21DlYZZv1FW5b+ZOcSvX4ja/MRaa83Moo1oMsTQRYF8CWUQQ2qD1CYM7fPhuhN+g0zL+6i57GxbfnOIQrFWTt1SV0zFHNcXaaNcm8uX07kNVQnpzuRjQDDdRuZoG5UE8TyOQqr2TDyHyrFvDKxsChiYouTEU3l21zNwUlphGddC5p44SBQRgfCbN8heHIJdasNC6VtkL0zMhEm17Tzt2XqTxCxcLaw4B7KC5WsuoCGr7s5WwptCgT0XFKaPaJalR9m90PTOjI15cXoKYSUpeEplwJp9V9Tqp3AL70Eq4PTkxv14vHP688+v7T3pLBuKvU5qTRNplhTEBKdpSyNOpNK8KSQPq47/+u1IP6g/u0xDFu+enUwEs3RqgSUZFmqpQEeS6XI6wWMQ6SB4WbeUYCSphI1nYbZjSNQMP7XkgR2DaT/kcOJc0RKY6k34+5bDfWlJpA0NkbjQYU0oTmsImdFj5Ab8juIWiUKFKqMg4n5LUlHZuZOcbgbx1OpCCjM4Znd+/EX/karyUW+LSknl2UiWOprrvSSvTNa/vizjtSnM1J4HWSZyNo1YoDmjyJZyzSTBnPeOTYHUZ82gqX8BA9DjuLV67TQmKfpK4tJ5w0qCJV9VgKa45p3Niqm2emIoHrcGtm0ytf0JvMsmqk0QCU3RwPro+VhAdP2o3cwkKLOmwJcbx78hJWATa0gZsh/Ve/yLvnrExrGAW1imTOpGe8JFjTu6RHGwwA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(31696002)(316002)(38070700005)(7416002)(2616005)(31686004)(5660300002)(83380400001)(186003)(71200400001)(26005)(2906002)(36756003)(6506007)(53546011)(8676002)(76116006)(6916009)(122000001)(4326008)(8936002)(38100700002)(6486002)(508600001)(66476007)(66556008)(64756008)(66446008)(66946007)(91956017)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RndyTmhwVm9IdWhoL0tucGNKcEV1SVIyc3hjN3ZvaTNqc1FFRnVJQ1VPak52?=
 =?utf-8?B?MWMyWFVVNGpFdUx6L2ZVRW1DN1RTaUtKeHFwamJuVCtTUXhSMlloTXR2TGVG?=
 =?utf-8?B?R2t5cHRyeS9BZHdlQ1JoeGJaVkgrbTJEY3g2M014ZkdKbHlKbVRtL084WDR1?=
 =?utf-8?B?RmpUbDc2V3huOEdKVHpnNFlneGs4bEhNMUtzYXh0SjdZTlRLT3JtZXVTK0FC?=
 =?utf-8?B?b0dTbWNBRWRVRHpXQ0Nta1l4RFpNT2ErR2dKTTVqaUpsMU5hS1VmNWsrSFdm?=
 =?utf-8?B?VlJxdEtBUVBBeStwelhWSFhuclQzNFNPVmkwNWdDOHZpZEd4RmQydFlmU0R5?=
 =?utf-8?B?RXdJbVRQcmtkK3dZMjRRS3FXWjBPYW40eWdlVmNhaUNjdk9hWkF2RjFWR2ZB?=
 =?utf-8?B?cWNMRllEUlgzQit3VWhWaVVPN2ZDYW9sVEFubWxueFVWNVpRTFRFcXQ5K29M?=
 =?utf-8?B?Vnl0R0FZVDkvYTRLOXUxaFRUSXBTTktraVVnTW9JM0dUZ3BnRHpWUXFQbnh4?=
 =?utf-8?B?QnFZVHp1clR3U1VBTzdGd2M1cVNyd2cxTTFjUXRQUTRlRWt6TlhVT3RId2dU?=
 =?utf-8?B?RThZMEhqVUVIbWIxWkV0WlM5NEwxc202TDdKblhVbWlOVWgraHdYcUs5SnI1?=
 =?utf-8?B?V29jZHpuM0dBeGdJNGs3MFQyQzEyWitNekp3UkRmM21DaXJobDJFRVJlVy85?=
 =?utf-8?B?ZTYxTUNRRGIrNkRVK0duSUd3TEFTQTR2VEprck9vWTNoNjV2NWoyZEhkeXp6?=
 =?utf-8?B?QTcweWczZE9TQm1hVVMycVJYODUwRzdZSGtzcUhaa2Y2Mm9jbytSVVpYY21j?=
 =?utf-8?B?R2RKaExWNC9oUFlqYzBHbmc3dDNVNFhuS1pjUlRWc3E0ZVlMMXpBNVFuRDZI?=
 =?utf-8?B?NklQSnI3V1RrNHptRzk2T0oxSlJ6eloyenA0dEoralFCNVEwQzBsTEpWYnNF?=
 =?utf-8?B?dDRZcjlacFN5TmlOR3FPOFQzSTZ1ZWpyU1h2STM4U0JNcTJ6eGxnQkxNTFVr?=
 =?utf-8?B?dE94d1cxM0daMUdsUFMvdzBsaVJWVHNMdU51N1hIcU9MZzFrUlZTbWcwTkRJ?=
 =?utf-8?B?ZEtKUmFDNXI2anpWYVJJZFVpYUdjbHhVMnNiTk5SbmFZTnREc0xKdEI2ZDk0?=
 =?utf-8?B?VDgxUWxDUWNDVTQ0Tm5WdHQwY3g4M0pCZGZObnQrR3Awd1FJajliK3NJUmxz?=
 =?utf-8?B?ZjFiS2YxNS9pWDJtYzVWalVERkQzUXBMOEZHSEVGRGNXckR6RmZmSENyeVZS?=
 =?utf-8?B?MkswakVab28vRTVxWVVsSHBaZ043blVEY2pTTHlsT1dCb2dtOEdDbFRCT2NV?=
 =?utf-8?B?QWVyc1R0R2QxajVtaTBUQ3dieEQ3MXZUeUNWWWJyd0ROL1NhZ0FFRkVnMUMx?=
 =?utf-8?B?TytJalorMXc3cldjM3l3Z2dGS25VYlNOUURDS0hVN1J5aGdhQmtIaVV3NjN4?=
 =?utf-8?B?ZUV5SGxYcml3TWpZYWZsd1BhVDRNMFJwYTRtOFNab1owbHR5WkU0ck5VZmN2?=
 =?utf-8?B?RzlSS21tYngxS21aY1M2NUQ3K2hIQlJ3eG9ZTk55T3pCMWkxQlIrYW5ickJn?=
 =?utf-8?B?SW1OMXZ0TnhmU0pSZGxKR0VNV2l5Y3ZkaUVvbU04WnZVMWFuZFYrUlFrYWNo?=
 =?utf-8?B?eDFGK2J1RWlUUkdQTkRBSmFza0lWcmF4V2ovckdIRzMwRXM2cUxiR2tPNUZq?=
 =?utf-8?B?cVJGcUxzV0hWV0krT1lFenNuWWd2cUdodWhobktaWEJRWm5uUDMyY2Z0bjZC?=
 =?utf-8?B?SU1SdWVzUmNCZ29VMHlZa1hUWFYwV3FCeVRacEM3emNQSlIyWWN0MkJJZTEx?=
 =?utf-8?B?cFo5Y0lsTGRsc0l5Y3MyV3FkbzFmUWZPMDFnVUFZb2t3Umc5aXJtYXlhcnNI?=
 =?utf-8?B?VFhUMWlQSCtwZS8yTVUvRnVIaE1CWnZzTnE3QnBaeXdXTUtOTDZ3dERNK2h2?=
 =?utf-8?B?bUxNRXpFZWgvaldtVXJWeGx6R0VYK0NLcVowYW4rLzFrdlkrOUgzbFUvTFlF?=
 =?utf-8?B?WFBzOVpxSHZvY2lxZnREazRBWUs5NldFRkFCMWhQaUFnaWM0UWJhTlBObUtJ?=
 =?utf-8?B?Ujd1Q3FNQW9SU0pPUGZqcXZ1dTFFdWVKbmVTVW11bFRDSVRlMENkMldQOTNV?=
 =?utf-8?B?RVIzNW9kZTJ5T1ZhQm5Yb3JRdVJ6MGd4M1Nid2ZacS9aVDIxLzZjWi9sQUIw?=
 =?utf-8?B?c0RuUVZRQlVPRXAyRU9hWDlCMExhdG5CdE9UNDBTQXNGczltN0dWeXBZQnFN?=
 =?utf-8?B?eTBtckw0RXB2MHFJZUcwOW5BQ29XVkVOaHNaTVlqdkc0Rmk1d3FPWS9nT3NT?=
 =?utf-8?B?RENDd0czMXl4Rm9kcUtEYUVId2psZFRSOUd4R1YyenZHVmNqeXFrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <438BE4B2E5F4824B9676DC16A87EB9C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab4d283-e1f8-4b5a-a98c-08d9a2a93dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 11:16:42.0915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EmARd/ZYHSD39v2shOf+p05M8VR83flevARFotUz6FSIkp3B3h0+ZEIP9SI9KomKYjMo5Ktl7KKT/KJBa7fgCjkppe0T25VOQjDZRFEYraXqZ5NhHJ3CVHY4dVmZ7Li
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2829
X-Proofpoint-GUID: uoHU8Lan1_xi8Zap5YmkMhclEEfLlVre
X-Proofpoint-ORIG-GUID: uoHU8Lan1_xi8Zap5YmkMhclEEfLlVre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080072

DQoNCk9uIDA4LjExLjIxIDEzOjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vdnBjaS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBAQCAtNDEsNiAr
NDEsMTUgQEAgc3RhdGljIGludCB2cGNpX21taW9fcmVhZChzdHJ1Y3QgdmNwdSAqdiwgbW1pb19p
bmZvX3QgKmluZm8sDQo+PiAgICAgICAvKiBkYXRhIGlzIG5lZWRlZCB0byBwcmV2ZW50IGEgcG9p
bnRlciBjYXN0IG9uIDMyYml0ICovDQo+PiAgICAgICB1bnNpZ25lZCBsb25nIGRhdGE7DQo+PiAg
IA0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gKyAgICAvKg0K
Pj4gKyAgICAgKiBGb3IgdGhlIHBhc3NlZCB0aHJvdWdoIGRldmljZXMgd2UgbmVlZCB0byBtYXAg
dGhlaXIgdmlydHVhbCBTQkRGDQo+PiArICAgICAqIHRvIHRoZSBwaHlzaWNhbCBQQ0kgZGV2aWNl
IGJlaW5nIHBhc3NlZCB0aHJvdWdoLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAhYnJpZGdl
ICYmICF2cGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZSh2LT5kb21haW4sICZzYmRmKSApDQo+
PiArICAgICAgICAgICAgcmV0dXJuIDE7DQo+IE5pdDogSW5kZW50YXRpb24uDQpPdWNoLCBzdXJl
DQo+DQo+PiBAQCAtNTksNiArNjgsMTUgQEAgc3RhdGljIGludCB2cGNpX21taW9fd3JpdGUoc3Ry
dWN0IHZjcHUgKnYsIG1taW9faW5mb190ICppbmZvLA0KPj4gICAgICAgc3RydWN0IHBjaV9ob3N0
X2JyaWRnZSAqYnJpZGdlID0gcDsNCj4+ICAgICAgIHBjaV9zYmRmX3Qgc2JkZiA9IHZwY2lfc2Jk
Zl9mcm9tX2dwYShicmlkZ2UsIGluZm8tPmdwYSk7DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdf
SEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBGb3IgdGhlIHBh
c3NlZCB0aHJvdWdoIGRldmljZXMgd2UgbmVlZCB0byBtYXAgdGhlaXIgdmlydHVhbCBTQkRGDQo+
PiArICAgICAqIHRvIHRoZSBwaHlzaWNhbCBQQ0kgZGV2aWNlIGJlaW5nIHBhc3NlZCB0aHJvdWdo
Lg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAhYnJpZGdlICYmICF2cGNpX3RyYW5zbGF0ZV92
aXJ0dWFsX2RldmljZSh2LT5kb21haW4sICZzYmRmKSApDQo+PiArICAgICAgICAgICAgcmV0dXJu
IDE7DQo+IEFnYWluLg0KV2lsbCBmaXgNCj4NCj4+IEBAIC0xNzIsMTAgKzE3NSwzNyBAQCBSRUdJ
U1RFUl9WUENJX0lOSVQodnBjaV9hZGRfdmlydHVhbF9kZXZpY2UsIFZQQ0lfUFJJT1JJVFlfTUlE
RExFKTsNCj4+ICAgc3RhdGljIHZvaWQgdnBjaV9yZW1vdmVfdmlydHVhbF9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgIHsNCj4+ICsgICAgQVNTRVJUKHBjaWRl
dnNfbG9ja2VkKCkpOw0KPj4gKw0KPj4gICAgICAgY2xlYXJfYml0KHBkZXYtPnZwY2ktPmd1ZXN0
X3NiZGYuZGV2LCAmZC0+dnBjaV9kZXZfYXNzaWduZWRfbWFwKTsNCj4+ICAgICAgIHBkZXYtPnZw
Y2ktPmd1ZXN0X3NiZGYuc2JkZiA9IH4wOw0KPj4gICB9DQo+PiAgIA0KPj4gKy8qDQo+PiArICog
RmluZCB0aGUgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIG1hcHBlZCB0byB0aGUgdmlydHVhbCBk
ZXZpY2UNCj4+ICsgKiBhbmQgdHJhbnNsYXRlIHZpcnR1YWwgU0JERiB0byB0aGUgcGh5c2ljYWwg
b25lLg0KPj4gKyAqLw0KPj4gK2Jvb2wgdnBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgcGNpX3NiZGZfdCAqc2JkZikNCj4gY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCA/DQpXaWxsIGNoYW5nZQ0KPg0KPj4gK3sNCj4+ICsgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXY7DQo+PiArICAgIGJvb2wgZm91bmQgPSBmYWxzZTsNCj4+ICsNCj4+ICsgICAgcGNpZGV2
c19sb2NrKCk7DQo+PiArICAgIGZvcl9lYWNoX3BkZXYoIGQsIHBkZXYgKQ0KPj4gKyAgICB7DQo+
PiArICAgICAgICBpZiAoIHBkZXYtPnZwY2ktPmd1ZXN0X3NiZGYuc2JkZiA9PSBzYmRmLT5zYmRm
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAvKiBSZXBsYWNlIHZpcnR1YWwgU0JE
RiB3aXRoIHRoZSBwaHlzaWNhbCBvbmUuICovDQo+PiArICAgICAgICAgICAgKnNiZGYgPSBwZGV2
LT5zYmRmOw0KPj4gKyAgICAgICAgICAgIGZvdW5kID0gdHJ1ZTsNCj4+ICsgICAgICAgICAgICBi
cmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKyAgICBwY2lkZXZzX3VubG9jaygp
Ow0KPiBJIHRoaW5rIHRoZSBkZXNjcmlwdGlvbiB3YW50cyB0byBhdCBsZWFzdCBtZW50aW9uIHRo
YXQgaW4gcHJpbmNpcGxlDQo+IHRoaXMgaXMgdG9vIGNvYXJzZSBncmFpbmVkIGEgbG9jaywgcHJv
dmlkaW5nIGp1c3RpZmljYXRpb24gZm9yIHdoeQ0KPiBpdCBpcyBkZWVtZWQgZ29vZCBlbm91Z2gg
bmV2ZXJ0aGVsZXNzLiAoUGVyc29uYWxseSwgYXMgZXhwcmVzc2VkDQo+IGJlZm9yZSwgSSBkb24n
dCB0aGluayB0aGUgbG9jayBzaG91bGQgYmUgdXNlZCBoZXJlLCBidXQgYXMgbG9uZyBhcw0KPiBS
b2dlciBhZ3JlZXMgd2l0aCB5b3UsIHlvdSdyZSBmaW5lLikNClllcywgbWFrZXMgc2Vuc2UNCj4N
Cj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

