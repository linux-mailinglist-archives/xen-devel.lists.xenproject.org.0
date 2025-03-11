Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B52A5BD56
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907673.1314875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwbo-0000Uc-Ju; Tue, 11 Mar 2025 10:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907673.1314875; Tue, 11 Mar 2025 10:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwbo-0000SP-Gb; Tue, 11 Mar 2025 10:13:12 +0000
Received: by outflank-mailman (input) for mailman id 907673;
 Tue, 11 Mar 2025 10:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azTi=V6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trwbm-0000SH-L6
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:13:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061a.outbound.protection.outlook.com
 [2a01:111:f403:260d::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6db97157-fe61-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:13:08 +0100 (CET)
Received: from CWLP123CA0073.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::13)
 by DU0PR08MB7740.eurprd08.prod.outlook.com (2603:10a6:10:3bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:13:01 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:401:5b:cafe::dc) by CWLP123CA0073.outlook.office365.com
 (2603:10a6:401:5b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 10:13:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 10:12:59 +0000
Received: ("Tessian outbound 0ad77f8d5963:v585");
 Tue, 11 Mar 2025 10:12:58 +0000
Received: from L9aa06caec18b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB6AFEB6-81C3-46A7-8C89-C68E1C0E029B.1; 
 Tue, 11 Mar 2025 10:12:52 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L9aa06caec18b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 10:12:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9848.eurprd08.prod.outlook.com (2603:10a6:10:443::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Tue, 11 Mar
 2025 10:12:50 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:12:49 +0000
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
X-Inumbo-ID: 6db97157-fe61-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LERqqdXFoB+LftNCf8wzRgbQBNikt9ZEy1Ebw7fWfneYcLznrQKq4rXETrQGfPKYgfQGi8Bg6oefrqXLlfYj5/4Q5k1BkFcs2JTnLn3ldZSMg/FuFZFiPcdtwHmhRc6g9jxmqHlPUdfVVHxinG1i6UF8i4q06YcqRKFwWjVO6pZ7YymnvZrJulHFdN/HsBmk3Y4d+TyisLT/yuOTQ17UXhFmRcsaarydKUcLNAu8TiSq7Dg+SjWOpxHZzOWpwApRFzIlhlosSRs/e9YIpJPZti+cr+PYaPjpnpgBzAxEkNGXohwVnUnwfDod/4/lOFyZFHZELwH6C04oLhQBbQTt7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqXRkNJj/GExad2D0Ni1U+hHNoKohuJvuRLi5cvzO30=;
 b=dKsEp89JdsSM4YtDMwJ4S3OkLfoOeca/KZN4slW+gg9JfPrKtNVBGf81IQKOxLYuYvBzfGkK8jPPNRYTrg8XN4SEd4CUAUjGWM6A7bFxPz/Tbjuh7V8hThPtDhoL6h5Zg7y38Jc5QtVVjNew2mDpd9gG/gflQkLGWRRo50kxpz9iBHrPnBOpTTAqnAlyKyfFn7DgLK74YQxrOaNOPUSipRASmBq9dfA9/B4LtsfJe6Ac2BDNfNVdaym3rphMzzePOl53mmcr4exEVT0Tm+mIJSZqB4LfMMAB4SNiWqdeJ0bvbPJQ64zO+gFCi7ryhNK+y4wD61QbaKPNCCzCyfiUxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqXRkNJj/GExad2D0Ni1U+hHNoKohuJvuRLi5cvzO30=;
 b=ewspIjVhINIsue96H3VEM1HpWY5nisAR47knT+adnOB0rUpKpCLKQraq0a0txQgMMtGGI+kZ8Jry6t9XjUV8KaYe9JHSY/4HM3lubOKV0yLrU+7m6XW2hZmltnzm91ynVbL9oml2LF+A73pUgRtnj+MmQTnyrAZEzF97xkN29lU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf2a2fdd20b8c853
X-TessianGatewayMetadata: wjWgMrrekHD/h1+NoU8Z1Z+Wj08LD/KUeKrRORDKl4RR+SaZUPeLyWkv/1JGvVYSXmFumb5cmtD0kKCMAcG1qTBqfy/jSYaQrtMhnJHbeSZC8Huoj4BDLk6Jeu+D1HhZZd2QOSaEnUu54aLH4+QZ+uIrpKL/rm8pC4NWMTmtaBs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUTfmP0CtiaWkouTPXmShPrIz1xC10iZpew/MH3WyIiU7ovzR4KoQ7XS7aOg1fTURUdg8ksL6UhZbMKNN0mYpOo2xPWt22Zw0//D/FoY5Nwca4w0E+jKZA7+1sTBDbGttUCjZ0q/m4KfTkWqrznOYCl++zVOW9RRzi2r+X2gPSbGW/XiaAnuZEmDBpB5tz/XJcBFR3bLMVU+MP0q6KvRhUfTyfCnyIw2oY1T8G1+OYRUNAjagBBVuyYW4n/A5D8YI8rf4DoBLE3oBx2X6zw2uZ86PPMYa1/vy68a4igFZdIEhdqDu5t58ehpr/cx10wA0bl5swvH/dBkgu2oKeBS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqXRkNJj/GExad2D0Ni1U+hHNoKohuJvuRLi5cvzO30=;
 b=WdDm4FY41BEHlfH8NQ2b4KTz5FqSj5zMKdO3ud8qNcj5+40Q8WkbTRLfOimfVhf4qb1YceS01Iy6YTpXE0ilIp1wp5/h2xERrpX1PbX5wJ1i7MeOyzEqOI2KIegSF1jCtogHR9cLaU5QBH9sNZHl2oJXJHfrOMaZoLFWZOMm+FC1A+C4s4Im4DR+C0B1b1SRMGu/qjuj9OO7JzVWilb6obV9JGn+tqwSIHGfveA4UUOCGoz27C5KcNOF9a9idTsNiTNAklWEXoasIIRmVJ46lJPAjQVRiW0Wn1ae0nmFcaHfRKeURYnVCSqhyTUSP5qToHk6lvYok4mtWDCaPXCXcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqXRkNJj/GExad2D0Ni1U+hHNoKohuJvuRLi5cvzO30=;
 b=ewspIjVhINIsue96H3VEM1HpWY5nisAR47knT+adnOB0rUpKpCLKQraq0a0txQgMMtGGI+kZ8Jry6t9XjUV8KaYe9JHSY/4HM3lubOKV0yLrU+7m6XW2hZmltnzm91ynVbL9oml2LF+A73pUgRtnj+MmQTnyrAZEzF97xkN29lU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Topic: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Index: AQHbkmScFxwSwnbWbUmo6sX8GQY3CLNtq7oAgAAILgCAAAOLgA==
Date: Tue, 11 Mar 2025 10:12:49 +0000
Message-ID: <17173844-577F-44C0-AA74-984ACAEBABC3@arm.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
 <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
 <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
In-Reply-To: <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9848:EE_|AMS1EPF0000004B:EE_|DU0PR08MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd5716f-c83d-4047-edaf-08dd60854cc2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ZedvKcnslWoLfBNmDctKWXvGiqcdSKgyPLneDJGvSFfXMDR2Dx/KqDiX+7IA?=
 =?us-ascii?Q?NmZe5//4thnNbOsGpASa6UzUaWYiJ/lEL0cQ9N7VI/n88/0FVGF9+r3Lulru?=
 =?us-ascii?Q?6/To2f213+ooOa7u1fhZFkf7Q0fhQkcCLDkiAhlXME3ShQoBHbDx7zmZXSQ2?=
 =?us-ascii?Q?LCwHWDOmXPTGXhEJvlyZYZUZwjWsdFgyQz3cwN9eMvPUx3gc9tQRrdLLQpzC?=
 =?us-ascii?Q?YmlMvpPrF0iixz5apeVRZW16hcNzKiI614Vi2Jq+qsIE5HVD3047dOfkz5G6?=
 =?us-ascii?Q?BX9NUv8wEpn95QtAsc9z9WXeSZ+ZTFj9sZ9nA7pP6TDyIZyvs9a+aGl7Gfuz?=
 =?us-ascii?Q?Vv+Uix3dwZRkG1X+2kklo5MG55r16+hu2oj0fiqBe31OKLAbF4xuUksbZv1d?=
 =?us-ascii?Q?HfEuXqe9Ab79r86f8k/t4aIUVvDGmWqnk3cM16ami/v6rpUpHq1CggKSQnb2?=
 =?us-ascii?Q?UR93NfcKspIzIGX5JyxmldVm6sBn0OeyoAULaP1IExPJOpd27a5wf2CDEJqn?=
 =?us-ascii?Q?WFRO839y885fAue2GVdyorW3E2njT3FRkd50uX18F7wtS+InJ8ueAu5ZXqQz?=
 =?us-ascii?Q?/xpncBpfGZit0++HfoSUiUFABcIfVk7uIXkzrtihNJKwy05i2QjqYAHyCbrx?=
 =?us-ascii?Q?NOt22Hcov/Sp81VJnRbvZcuiHBSb80JwF/TaUdaDQxCNgrooeyegaldE5XYe?=
 =?us-ascii?Q?rpWWr5eqoXv3RRVpNQop8OSou4Tiedrwsb3/WbHHESVddj8uO2rY0xFPrWQ5?=
 =?us-ascii?Q?3pgqB/UdaHXL63ApPyAo7ZyV9kSw/PqrMlVeIrDHxLO77rStmZTznVOMvVOs?=
 =?us-ascii?Q?/tbCWPcJ45R4nx8hytRhFRCeSnUi4ZIAmes2r8roz7ecsyudl2Ap6mNxhSjh?=
 =?us-ascii?Q?Kd2AgDe39SAj5AkZfRLaIhh40Cs5cI6xl2UKgaQQTkKD6PFyhSR/Kj9kaYf+?=
 =?us-ascii?Q?Ks/G/slDITxUD0I99mubd/lCQn5qAu5T/tLG/4dgXXpOzgm6E7tMlaSgDu4q?=
 =?us-ascii?Q?aJKIr+tmmWQGtSCtYz1FRVI0BecnuxvXYNX5YEvLuaMwTvN14OhSx1pFdIIa?=
 =?us-ascii?Q?807htsoSDPFxTeKhU0HhDG33v1YwInj65aI9wu80CATbxuL7tifEDfV6FU92?=
 =?us-ascii?Q?cI7NmWRvVtVScwa7Z7zKfRxyrgKvMgWmUJ0F7ErPdIoKbIoLckB/9Zm58zJI?=
 =?us-ascii?Q?IIj7LtWr2YiwWuyC/xvEaTF8vPIZnEsTk5+3ZQKHtsgbucy00fsrZLqV1cuJ?=
 =?us-ascii?Q?GiwjHd9Ca95KURZgL4GJq8E0YQt9OUiW3/DXm/L0um/P53RDGHuIkpJRXC03?=
 =?us-ascii?Q?Vp2R19tdFsjA5NlM1xR5uzgj7a72MtnevleQjcZHFlrFnsjt2KV3dz/7issN?=
 =?us-ascii?Q?oZqT15OPQ7t+Jc6M1p5h9SAKotAShALixjkZ/LPPgfRnieQTTEhDezRJCsgu?=
 =?us-ascii?Q?nQaAIRIuSjLTEAxT+2avvODay6S4WI3d?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28011CB6A1249B48BC581BF566DC00E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9848
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d4ed5dd-0a98-45d1-c8a9-08dd60854736
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|35042699022|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BQqMbo2hoW71gTLDUe8fw2olfZ+gBTX6I+qNM5p8Vq+eKEzzWIr/Dmvt35/H?=
 =?us-ascii?Q?g4kwGqwNBgloWZ9eKhB2Tcbeqe26t+dkyXCA0Z3lSc1rRDBZiFBWnQjNDDQ5?=
 =?us-ascii?Q?8AohPB3EURTVB6+Wk1Vacu212yDKlC2FzTaoZOEtipqcManX1fLOPRu3cQGp?=
 =?us-ascii?Q?YQCgiIHKEoFYiuPZWxwlJU6/LOvLU+abUwlAvlaKnQ+PAZ+jrXmdqjPgA8jr?=
 =?us-ascii?Q?jCYei1zXJf0UiHux6yu+u6ZJD9fbWlrq0OP7K0Brcu/61W+mmf+lASkFMdhP?=
 =?us-ascii?Q?xcFy53qI1qLurP8Uh3Qb6HTG3Z66HlIfeA1h25K7WTPBLbBkeyvL0KfDlzUB?=
 =?us-ascii?Q?mVB8vQMaG7DzgS+LdmRBw91oov8hWbsp8GSrQJU2zYEmBq1O5Xqp3Ur6DBut?=
 =?us-ascii?Q?ngPrxcxJaa8dsqbqxMzo0tYTPyKpLJzh1MQ+exp+iFM8mDTBrHRzqXSVwcM+?=
 =?us-ascii?Q?1p0GBCG84df/CKl0QnkUa3b0yeKswbXlb9O67IMwKeIPIKss5pvSxIK2Vtcr?=
 =?us-ascii?Q?+zG+WTkZMitRsTJZjD8ZFkTfaPpZq8MFo5RQyJ7rrkcmpHOtzGnYkEK0OhZ6?=
 =?us-ascii?Q?NFJVaJFDXFlGD/JnE/jgCmlKiKDFMKgbKw7ii1Nv8OVCVF0Zh+Z9lQWVF6Df?=
 =?us-ascii?Q?BFwYf0KLcSmB4MaEjxi23KchBKlkQJzW3m2wHFAyXo+P8rfN7ysd/bENTLWB?=
 =?us-ascii?Q?LV0C6lVliHjZ9BdqYvyv9JR2TJTPBm9/pnWJwepjlbtB8Q/RHaUAnq4xmADn?=
 =?us-ascii?Q?Mn2PgYlubgCrn1vFsnnJNEXySLjRSkdon/bvrY63C8KtYFBxI5AQHTQJnP46?=
 =?us-ascii?Q?U7kElcGXj8idCz/k+T3hIZGhPHfcY5fiTs8LSG/DlW7bUMqRXhYTLreSQDdr?=
 =?us-ascii?Q?NvrxPiN/ozokzyiz7Vu8Z12OLnWbNZbwLkbtag9VEUl/c28RI8+L6daBsR9R?=
 =?us-ascii?Q?y9ZYtOvDox9pKEMyXIyJosOggCfa7XXYDDgiyJXD+sG1imPLnGBOydXQ03CT?=
 =?us-ascii?Q?phJeW+x9r5Oum+bVh+dIPKzcxetitSl8LejbEbIxt9E+7lvgI4iW+2f0z1AZ?=
 =?us-ascii?Q?gI1IJVDv8vAE4IlflTO13CKeKR/TGMwH7X0jXeMTnIb/lPgc+gVIEddWJPbH?=
 =?us-ascii?Q?ATxL6r+aGCEnkBowYj3QDPDFeGXyvV4RzPWPQNBeYGhaI0rdI8JgtJo7+zVw?=
 =?us-ascii?Q?DQ7jGR+JCF1HrKkkLkjkNALlg29Q36cQWEc7tze3K7N7dz3oS0GzmwcxpX0M?=
 =?us-ascii?Q?tbFcczX/h/j5bmQsEAkbFuhsqzc4sk/7eVOGGLwf2QYMAiW8tSSv6B6GH/x6?=
 =?us-ascii?Q?oIl9P/FFMwchX0NqIbsPYxHhaJcLXFIGI66kEKyfDIa6k3UQq0z0wlIixbqK?=
 =?us-ascii?Q?vNTKnq7J+vcM6JzrbUhQPaMasE5Em+edHkWVVUPyzix0k8bkbdwRB5rupY6H?=
 =?us-ascii?Q?XQ/zYiLV6pczshLGcOYreDs7GIZfwk5HelyfK31/y9ifIdfxc/HYVXnRV9kw?=
 =?us-ascii?Q?v+K09CJhDo0V6AA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(35042699022)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 10:12:59.0613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd5716f-c83d-4047-edaf-08dd60854cc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7740



> On 11 Mar 2025, at 10:59, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 11/03/2025 10:30, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>> At the moment, we print a warning about max number of IRQs supported by
>>> GIC bigger than vGIC only for hardware domain. This check is not hwdom
>>> special, and should be made common. Also, in case of user not specifyin=
g
>>> nr_spis for dom0less domUs, we should take into account max number of
>>> IRQs supported by vGIC if it's smaller than for GIC.
>>>=20
>>> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value=
.
>>> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
>>> IRQs comparison common.
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> xen/arch/arm/dom0less-build.c   | 2 +-
>>> xen/arch/arm/domain_build.c     | 9 ++-------
>>> xen/arch/arm/gic.c              | 3 +++
>>> xen/arch/arm/include/asm/vgic.h | 3 +++
>>> 4 files changed, 9 insertions(+), 8 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
>>> index 31f31c38da3f..9a84fee94119 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>>>        {
>>>            int vpl011_virq =3D GUEST_VPL011_SPI;
>>>=20
>>> -            d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
>>> +            d_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_IR=
QS) - 32;
>>=20
>> I would suggest to introduce a static inline gic_nr_spis in a gic header=
 ...
> Why GIC and not vGIC? This is domain's nr_spis, so vGIC.

yes vGIC sorry.

> But then, why static inline if the value does not change and is domain ag=
nostic?
> I struggle to find a good name for this macro. Maybe (in vgic.h):
> #define vgic_def_nr_spis (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> to denote default nr_spis if not set by the user?

Yes that would work. My point is to prevent to have 2 definitions in 2 diff=
erent
source file and a risk to forget to update one and not the other (let say i=
f some
day we change 32 in 64).

>=20
>>=20
>>>=20
>>>            /*
>>>             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 7cc141ef75e9..b99c4e3a69bf 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>>>=20
>>>    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>> -    /*
>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>> -     * 32 are substracted to cover local IRQs.
>>> -     */
>>> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 9=
92) - 32;
>>> -    if ( gic_number_lines() > 992 )
>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n=
");
>>> +    /* 32 are substracted to cover local IRQs */
>>> +    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_IRQS) -=
 32;
>>=20
>> and reuse it here to make sure the value used is always the same.
>>=20
>>>    dom0_cfg.arch.tee_type =3D tee_get_type();
>>>    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>>>=20
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index acf61a4de373..e80fe0ca2421 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -251,6 +251,9 @@ void __init gic_init(void)
>>>        panic("Failed to initialize the GIC drivers\n");
>>>    /* Clear LR mask for cpu0 */
>>>    clear_cpu_lr_mask();
>>> +
>>> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
>>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n"=
);
>>=20
>> I am a bit unsure with this one.
>> If this is the case, it means any gicv2 or gicv3 init detected an imposs=
ible value and
>> any usage of gic_number_lines would be using an impossible value.
> Why impossible? GIC can support up to 1020 IRQs. Our vGIC can support up =
to 992
> IRQs.

Maybe unsupported is a better wording, my point is that it could lead to no=
n working system
if say something uses irq 1000.

>=20
>>=20
>> Shouldn't this somehow result in a panic as the gic detection was wrong =
?
>> Do you think we can continue to work safely if this value is over VGIC_M=
AX_IRQS.
>> There are other places using gic_number_lines like in irq.c.
> I can add a panic, sure. This would be a change in behavior because we us=
ed this
> check for hwdom unconditionally. I'd need others opinion for this one.

ok.

Cheers
Bertrand

>=20
> ~Michal



