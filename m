Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4AC9D2256
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 10:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839835.1255620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKNX-0005X9-MT; Tue, 19 Nov 2024 09:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839835.1255620; Tue, 19 Nov 2024 09:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKNX-0005Ui-JN; Tue, 19 Nov 2024 09:18:35 +0000
Received: by outflank-mailman (input) for mailman id 839835;
 Tue, 19 Nov 2024 09:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pc1c=SO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tDKNV-0005Uc-T5
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 09:18:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f403:260e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c414f11-a657-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 10:18:27 +0100 (CET)
Received: from DU7P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::7) by
 DB4PR08MB8078.eurprd08.prod.outlook.com (2603:10a6:10:386::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Tue, 19 Nov 2024 09:18:23 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::25) by DU7P194CA0027.outlook.office365.com
 (2603:10a6:10:553::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 09:18:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14 via
 Frontend Transport; Tue, 19 Nov 2024 09:18:22 +0000
Received: ("Tessian outbound 6a0f5b372c2e:v490");
 Tue, 19 Nov 2024 09:18:22 +0000
Received: from Lc0b7a44e1a31.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECB4F871-C890-434A-AF61-1464B53D036B.1; 
 Tue, 19 Nov 2024 09:18:15 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc0b7a44e1a31.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 Nov 2024 09:18:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB7833.eurprd08.prod.outlook.com (2603:10a6:10:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Tue, 19 Nov
 2024 09:18:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 09:18:10 +0000
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
X-Inumbo-ID: 3c414f11-a657-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwZTo6NjE0IiwiaGVsbyI6IkVVUjAzLUFNNy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjNjNDE0ZjExLWE2NTctMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDA3OTA3Ljk4ODY1NSwic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LDNg97vumSDN9oSnTmW1vE3dQpcNIquC4fcIp0qsFsanlKh3j2j7WONnuLLY3iGa3C0ZN13tSC+cFkcLZs8D6bk7LVMyIK22ocC4V2/Bur9VE9oN8BsOC0RPBdfXKu91MzS1/FcVDNqrwc2uRAYtvQ76WTDxgiKXFgy+jymD1fnHyIllIjLoflOtZ4tQWyiSivKfMkWETT5vTmMvCUwKFm7aVamTZzwtm9l7D+9UxXjB3ZtWnGjL3roETN26elLcdnSjzZM48Z+zww7bn7nowxAFNQtY6cI4w5+nmlTBdXzOW9psW3rmfavbpkKi4DV5Yhl7cbAq8H4t7wEag2yGPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUPiuruflUY973woLs3xzsxWQIgJssVRO/EZEaZQwAw=;
 b=Gc/1RPT+u5Tkodl17iJIYJrrxr31sOP8hbFwtQoi7O5llqBr49jes5vtJ7EpmLUpoJMdaKleZZnINgfLoG+kxoVLzaFanS/cO5USr60Cr7TdxJSO7P9vRQ/X861+5yjNy+0mNXdN9a4kWHrnp5Nh4ByAQygOqXZcj1OYS23dodeZWN0EWwLWol0XmVWpCTORqSb4gYkTxqRIOANTQSUT4voC+4aotspWAiFfy4eQnHJLa3HlVo9uJy7Bq2flaZaVHzpudz2O0b7O1mgJIc4CzXPdEN6ncmdeKDG0buRW3ykzX5BMGnZsoKJpo+Lvd+poR3LkiksD13l16RU1XFfF/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUPiuruflUY973woLs3xzsxWQIgJssVRO/EZEaZQwAw=;
 b=QWoM98W7YDMsgfp170T6g+jhvOEg6pdXy7rvGb1Un8GxmOHJ1zMXQycnxS4EbKAtJv6mQXu6NSuFxC7gBFMegYA/Ud+l9aREx2dtthgKQPAQsMll7wJKwU+8TrvGDOAY2f1hvFQm2h/fV8Ip0jckVHsGn8+HnerXDntZ+z48c4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9fb23bb16d900091
X-TessianGatewayMetadata: TY/+ICtCHG4/6up3DMHB/wrXi4wPBs3+KsVHfU8f7NMw0QLjJkgAfdK2MsVIvMeXANjad10Uk38Y/GVE+enz2OcsOqQOnoDjRuSFGzYCcSN9LEi4Hmo3r+x2EWhpmNYrLWDjXVLMfewd1Lza/SRlmiF4DvlNPlPpuKpyOpkiNgg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv2rKAubCIHJ9OI3iduSLP8yTaJvbzibX7CQlu0dByJ2M1YBGZUUgVr+vJ3pA3Ul0hHtRiy1mL8VxaKEpv4EoYIZrMx1AFVQupbt0mAZ0z/LS/rOJXsHjwM2DkAQX7LceANwqcVUJZ2ytljhs5k5F6tdCDbiaQAojMNssf1ViKfbZkZ1qSKTpyn32dFi/4apwQ/kmBr4GS49EefOADdGuJhC8lYcTlvUWnAwEpEkmbGW/nGW95ERd1qceNtC6YK+vkT37lzJfHbcX9XTQWwtU/oGhqbKKfu4+PF77/QflAJB8fb3DjYOZqbE9oP/vEcYMTfLUAaQcz+yXTzNQPQYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUPiuruflUY973woLs3xzsxWQIgJssVRO/EZEaZQwAw=;
 b=lalR7m6yZeUtxgrkN5Zs6iK4rA2CsScKnIHyc2S2lwjwcENoagsawysWVlW1e/PJPYsyQCcrV9a7Przr3OJgmg5xJojpCcdeEZtI/MVAZGJJWUNvjl1OxxUti7APXOfS1VDsTtwrVtVQMUYNNFCxwXiSbRsAk/vcGiJU5Z3fzzYoaJJdhKoRjd/K756y3K0VUFk315/hmHUMMG1NDhuPFV6o9Lr7z8RQUg5EJy4j+02MaGKCuC6jUy4YioCFTGEu2RniPQTD3+B5d76GzrmxgWIk5JrLUkyz1/eIo88S3NhUtlmTPwDoQBSvrX/qadEvWjdcxTQK2mW6OSo9HEkSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUPiuruflUY973woLs3xzsxWQIgJssVRO/EZEaZQwAw=;
 b=QWoM98W7YDMsgfp170T6g+jhvOEg6pdXy7rvGb1Un8GxmOHJ1zMXQycnxS4EbKAtJv6mQXu6NSuFxC7gBFMegYA/Ud+l9aREx2dtthgKQPAQsMll7wJKwU+8TrvGDOAY2f1hvFQm2h/fV8Ip0jckVHsGn8+HnerXDntZ+z48c4Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for mapping domain address
 to machine address
Thread-Topic: [PATCH] docs: fusa: Add requirements for mapping domain address
 to machine address
Thread-Index: AQHbLuyoRTuz7iztXUutJtgpv3MjBbK+agEA
Date: Tue, 19 Nov 2024 09:18:10 +0000
Message-ID: <E3099862-A23A-4856-801E-2C2C6B30154F@arm.com>
References: <20241104190608.3036159-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241104190608.3036159-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB7833:EE_|DU6PEPF0000A7E2:EE_|DB4PR08MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: dd595d7f-7327-44d0-5137-08dd087b1d82
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?aY13O44EhjTJZdGUpi7gP5W+zYyHuANRnZS+u3mK8r66iNdwy+BSIuJVjyaN?=
 =?us-ascii?Q?63Tsrxxt/CHaifGmqD0I93OynA6LvGnB479CJYd/ep+bOiDPfwfcVMn0qIos?=
 =?us-ascii?Q?Zpb+pSABkd6p0Hc5AQAJdoDPhasfsZe0BanpMcS9b6b78qxX8Dsq/W4XF4Xr?=
 =?us-ascii?Q?XV3yq2lPxWR4HjB4EThmGuagFkbELJYtQl2jauiwQ3HwlY8SzTLy8oZedQHz?=
 =?us-ascii?Q?FiVd3naPVGP2W08vfa+et7SOU0psjzDvv+hMKj/rRm2lsaMJ1JE8wKlQJMla?=
 =?us-ascii?Q?oa57jHYdPlzL0Uj8XCXobNMZPvwFwxap7Mn9H4NvjIUMn+Ocj6OGtTrGC5CS?=
 =?us-ascii?Q?kYUU4rm06XEZZv4rALiNz8iFikSZEBsc8tvuMsZ+RMbM/65AOCW6Cnh4za0L?=
 =?us-ascii?Q?5eWKF+slGeEOgYd0KdTCZI+KZVH+C+oIsNrLAb7swJa3yce9OerWplsYLrrr?=
 =?us-ascii?Q?YYuzCXfZA3eILixpkbL3Dk3FRR1VrU2P5/lh2XsbcmCwJDBhtsDdg9/aTRse?=
 =?us-ascii?Q?0b3T5GKbhWo28/dsXcVe849uzv2HnSRDoj+X4F/KY5p62tnXhjduS3NDV9xY?=
 =?us-ascii?Q?6+ZHChCty5LlqwpIu25TISUdanwcKW3HnwDmNx54njdIra3B6aFZco71x0tz?=
 =?us-ascii?Q?JG5DwFHvgaXoJsfIFAeGMViUX8O3JyFgByGgi6SOExmPHdNYOtRYYVzLipAc?=
 =?us-ascii?Q?jcI6o8sUO1ve0Yd+xX1Xpt765xF2x8/xHtQUQe8JvwZbso5mf5SwDxiQG6w6?=
 =?us-ascii?Q?uvXbhZeWJRmY7/Y84DA1g3wTMCoMBUlEAO7XOLBYMe+W8pC4876m7MkXYmf3?=
 =?us-ascii?Q?eNZ7KDnleQEzpMkCrz3s0sF/WckLc4PWnWux47HOTLpM0y9rcb2a4fC84COY?=
 =?us-ascii?Q?3vmOAe0Tx0MXsVoIheqllFmFgPW4OcrE8BG3txh3iM0GB7gKRFevdByqWkFk?=
 =?us-ascii?Q?YVLEgzW80yvL4Tr01Wy9aGe6aCPA326Jlyfeoz/WF3bHowVYyBp4jVpxlQZi?=
 =?us-ascii?Q?qIrhrV3S0DfXEuT3juMDo14udRFLuLNM+yy3W6vu5mF0MouQOjGHVode5jt8?=
 =?us-ascii?Q?R4aK1usejCcm+olajsa70r6Cu9uefI2hNDKXPk2mFFVjxS0/zNIeKpr+TLpS?=
 =?us-ascii?Q?ccxarZ5eyBiBhUSenmzRGysxG+UaxSuu/zn05I4kcHVM6eBJtw3QNaXeTzxI?=
 =?us-ascii?Q?gWwfTiDXQRNiZA0Um/1p24Q6vfVEP893rT6YuzdZd8fo/C5Mwcv7El/T0Xht?=
 =?us-ascii?Q?VvJofwrIOTEevSFbBLegqqwtm5MvQ5znPqydsu1gPAWjoaYWrmsyqJFqkO4P?=
 =?us-ascii?Q?4p9I4eG69WJ1DEj+qyC0mhJ7m6I24APMvFs/jlXZry4y+GkhjeNanQr7lA0t?=
 =?us-ascii?Q?1Dxfel4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B3F8DEF35EBF614CA10C90C19D46E6B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7833
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1999964-8e2d-4c6c-8597-08dd087b165d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lbd3iFUslHjdLFrOKuupaLDXO3ipejT+x3CVLGhR/gSaaSN8ZGDoE2N5tu2W?=
 =?us-ascii?Q?ZRB3YxDm0w8O1MowT/DJY0yxdPBJk4t6Gp5Kx7SS4cj73FZ7F1M326FxnlXY?=
 =?us-ascii?Q?cBxGLrz+arobxx+3IFzE3dUb/77+cgCrafkEU7gxioIY+7WekijFHC2p0was?=
 =?us-ascii?Q?AlLBI3f81pQEG1Uw5/ArMpgi9xxFBTduxYvY3yjtml54L7KoogiDhBtK8J3P?=
 =?us-ascii?Q?TdbECp6uF3ufbeiqgtHU0AXY/3pCz6OdxCdp0MWG6o3P6uSk0Glsrx0wS2MC?=
 =?us-ascii?Q?p/7Y0OjrAmp5zHlJj4SVTzXemN/9M2OaR8niQfVcI+l76roFj3V907QavL5K?=
 =?us-ascii?Q?M8bbXOPgRgjtyFLwa4s4uUUD938tJfhzDT0oV8uhAo7eVIZuYwT8qRYuu0hf?=
 =?us-ascii?Q?Zj1Yv8hH2lkmwEAiDB28yMWOJ2NjorbsQk/nRscTRJkX2Q1G6b0+DFo+IbKZ?=
 =?us-ascii?Q?tbKGFkiPdvYbpygnKTuj4tvVlgWtPijGJZ8ohDpVWy1DFtnWXq0fKXUnmf+6?=
 =?us-ascii?Q?r+16BA1CCRE3q7HP4zS/pe1XRhSTP9q55hCEmGBTp4F8CCysSGsO/SAeqJOb?=
 =?us-ascii?Q?7lmymGI+9FJQSffGEQY4E5XLtEikSBoR1/FLbp+jateg7BVKq2QcnRK9s+tS?=
 =?us-ascii?Q?NssY/aeEFEirsbWOUSTG3kZeblmVVsHm3f/ILYaiIzcHpiQwStsjoZ1Z/2KB?=
 =?us-ascii?Q?qm+4OMz3tba+6cuJ4GFaT+mxMFSFiWsG/ovsTYTYe7Y4uUtmt19LZol6BwBB?=
 =?us-ascii?Q?xyaf0jmlSWonYyBTZcexO9oxRyOMiU9RcfpptGabBvzZaCavsCQvG6Pd7xvi?=
 =?us-ascii?Q?lYmBNdZwCKZC9grs+tgCs6dmYIR+GTJzVBIn7KuKtaj6Cx4+CWAd4n/5fYjZ?=
 =?us-ascii?Q?C5Otk3hdtwQ7oY/gk4Xi0jFz8B3EDBKt8xKj62HWs4/GhEat7eB+ififyMPB?=
 =?us-ascii?Q?ixSB0vQM5khLoFBPiu57A6YefmOUFhB3PbRn9fene8SF+B0uCe52pU+OGGLd?=
 =?us-ascii?Q?d9Odb4Q6+W+MPne0HgkzbORWaHX7Z++aGOAsu/cM29D9OZEyWZZVnFHAzNsN?=
 =?us-ascii?Q?i56bhqwBlsR5x1Nq61CKRQ8/7UWfwK8T94ne7nYNOyO5dDQKbBPky7ZKw4xf?=
 =?us-ascii?Q?rrne/oXbdh1DWP6xjW0IVbSaC9mylbTR7rAtSNbzauceP/iiuMqP9xKtpkHQ?=
 =?us-ascii?Q?o5CaENEXN1izL3ArZaAQxraaNjqWsTK3r/WphkBf7zZ2EjSCVwXVPklQE55p?=
 =?us-ascii?Q?08sg51k4Y2+H2LuAJaAcGwUt/Ljk1lt4H7knZ5sTqkQPj9KMOK8MYEqWRMKC?=
 =?us-ascii?Q?Ut6P9Z+Isj3PwIgtBi8kG9/krKjG4qsXuUfEFhDizPXoPXT3uY8SZi5lG62k?=
 =?us-ascii?Q?bpOstaIjdUig1M8d3ZkmNwK3V+K7FdMWWm+km5buNtGI1cjJgQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:18:22.5557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd595d7f-7327-44d0-5137-08dd087b1d82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8078

Hi Ayan,

First a general comment: you use some terms such as machine address or doma=
in
address which are a bit undefined to me. This needs some definition first f=
or those to
be clear. Maybe use Virtual, IPA and PA instead all the time.

> On 4 Nov 2024, at 20:06, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> The following are the requirements written mapping :-
> domain virtual address to machine address
> intermediate physical address to machine address
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> .../design-reqs/arm64/domain_buffer_copy.rst  | 172 ++++++++++++++++++
> docs/fusa/reqs/market-reqs/reqs.rst           |  30 +++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  40 +++-
> 3 files changed, 240 insertions(+), 2 deletions(-)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rs=
t
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst b/do=
cs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst
> new file mode 100644
> index 0000000000..67a70a35c4
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst
> @@ -0,0 +1,172 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Translate domain address to machine address
> +-------------------------------------------
> +
> +`XenSwdgn~arm64_translate_domain_addr_to_machine_addr~1`
> +
> +Description:
> +Xen shall translate a domain address to machine address using Address
> +Translation Stage 1+2 Non-Secure Kernel Read/Write registers.

domain address here is a bit unprecise. Do you mean VA or IPA ?

Also is this only in the MPU case ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~translate_domain_va_to_ma~1`
> +
> +Get machine address
> +-------------------
> +
> +`XenSwdgn~arm64_get_machine_addr~1`
> +
> +Description:
> +Xen shall be able to get the machine address for a domain by reading
> +the physical address register.

This needs rephrasing to remove the "be able to":
Xen shall use the physical address register to retrieve the machine address=
.

Also what you mean by "machine address" needs to be defined here.

> +
> +Rationale:
> +
> +Comments:
> +It should return the fault information if the translation has failed.

I do not understand this one. Maybe this requirement needs more context to =
be understood.

> +
> +Covers:
> + - `XenProd~translate_domain_va_to_ma~1`
> + - `XenProd~access_check_fetch_page~1`
> +
> +Translate domain address to intermediate physical address
> +---------------------------------------------------------
> +
> +`XenSwdgn~arm64_translate_domain_addr_to_ipa~1`
> +
> +Description:
> +Xen shall translate a domain address to intermediate physical address us=
ing
> +Address Translation Stage 1 Non-Secure Kernel Read/Write registers.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Set domain address as intermediate physical address
> +---------------------------------------------------
> +
> +`XenSwdgn~arm64_set_ipa_eq_gva~1`
> +
> +Description:
> +Xen shall set domain virtual address as intermediate physical address wh=
en EL1
> +MMU is disabled.

Here you start using virtual address. I also do not get what is to be set h=
ere.
Do you mean that Xen shall consider VA=3DIPA when EL1 MMU is disabled ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Walk the domain's stage 1 page tables to translate 4KB domain address to=
 IPA
> +------------------------------------------------------------------------=
----
> +
> +`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr0~1`
> +
> +Description:
> +Xen shall walk the stage 1 page tables to translate domain address to
> +intermediate physical address for 4KB page granularity using TTBR0
> +for intermediate physical address size =3D 48 bits.

Is this always the case ? aren't there cases where we should not do that ?

Do we really want in the certified case to accept to have to walk stage 1 p=
age
tables instead of using the hardware way ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Walk the domain's stage 1 page tables to translate 16KB domain address t=
o IPA
> +------------------------------------------------------------------------=
-----
> +
> +`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbbr0~1`

Req is name 4KB for 16KB

> +
> +Description:
> +Xen shall walk the stage 1 page tables to translate domain address to
> +intermediate physical address for 16KB page granularity using TTBR0 for
> +intermediate physical address size =3D 48 bits.

I am not quite sure that it is a good solution to duplicate for each page t=
able size here.
Do you want to support all possibilities ?

> +
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Walk the domain's stage 1 page tables to translate 64KB domain address t=
o IPA
> +------------------------------------------------------------------------=
-----
> +
> +`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr0~1`

Same here

> +
> +Description:
> +Xen shall walk the stage 1 page tables to translate domain address to
> +intermediate physical address for 64KB page granularity using TTBR0 for
> +intermediate physical address size =3D 48 bits.

Ditto

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Walk the domain's stage 1 page tables to translate 4KB domain address to=
 IPA
> +------------------------------------------------------------------------=
----
> +
> +`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr1~1`
> +
> +Description:
> +Xen shall walk the stage 1 page tables to translate domain address to
> +intermediate physical address for 4KB page granularity using TTBR1 for
> +intermediate physical address size =3D 48 bits.
> +

You duplicate the requirement for TTBR1 but do not say when TTBR0 or TTBR1
shall be used.

> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Walk the domain's stage 1 page tables to translate 16KB domain address t=
o IPA
> +------------------------------------------------------------------------=
-----
> +
> +`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbbr1~1`
> +
> +Description:
> +Xen shall walk the stage 1 page tables to translate domain address to
> +intermediate physical address for 16KB page granularity using TTBR1 for
> +intermediate physical address size =3D 48 bits.
> +
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> +Walk the domain's stage 1 page tables to translate 64KB domain address t=
o IPA
> +------------------------------------------------------------------------=
-----
> +
> +`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr1~1`
> +
> +Description:
> +Xen shall walk the stage 1 page tables to translate domain address to
> +intermediate physical address for 64KB page granularity using TTBR1 for
> +intermediate physical address size =3D 48 bits.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~access_check_fetch_page~1`
> +
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index ca020f9a33..9b6852d746 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -60,5 +60,35 @@ Rationale:
>=20
> Comments:
>=20
> +Needs:
> + - XenProd
> +
> +Copy buffer to domain
> +---------------------
> +
> +`XenMkt~copy_buffer_to_domain~1`
> +
> +Description:
> +Xen shall support copying a buffer to a domain.

What kind of buffer ?
This requirement is very generic and not that precise.
At the end this is just saying that Xen shall be able to copy memory.

> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> +
> +Copy buffer from domain
> +-----------------------
> +
> +`XenMkt~copy_buffer_from_domain~1`
> +
> +Description:
> +Xen shall support copying a buffer from a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> Needs:
>  - XenProd
> \ No newline at end of file
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> index 0453dbb862..e2ab5ea43e 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -53,10 +53,46 @@ Rationale:
>=20
> Comments:
>=20
> +Covers:
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Translate domain virtual address to machine address
> +---------------------------------------------------
> +
> +`XenProd~translate_domain_va_to_ma~1`
> +
> +Description:
> +Xen shall support translating domain's virtual address to machine addres=
s.

I find the "support" here a bit strange.

Maybe it would be simpler to define that Xen shall have a function named xx=
x to
do this ?

I am not quite convince this is not only a design req.

> +
> Rationale:
>=20
> +Comments:
> +
> Covers:
> - - `XenMkt~static_vm_definition~1`
> + - `XenMkt~copy_buffer_from_domain~1`
> + - `XenMkt~copy_buffer_to_domain~1`
>=20
> Needs:
> - - XenSwdgn
> \ No newline at end of file
> + - XenSwdgn
> +
> +Access check and fetch page from domain
> +---------------------------------------
> +
> +`XenProd~access_check_fetch_page~1`
> +
> +Description:
> +Xen shall support access check and fetching page from a domain.

This should be split in 2 reqs.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~copy_buffer_from_domain~1`
> + - `XenMkt~copy_buffer_to_domain~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20


