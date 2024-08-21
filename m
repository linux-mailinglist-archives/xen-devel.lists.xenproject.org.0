Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1695A0F4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 17:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781232.1190779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgmwP-0007Fg-8l; Wed, 21 Aug 2024 15:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781232.1190779; Wed, 21 Aug 2024 15:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgmwP-0007DQ-5c; Wed, 21 Aug 2024 15:08:05 +0000
Received: by outflank-mailman (input) for mailman id 781232;
 Wed, 21 Aug 2024 15:08:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oI7=PU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sgmwN-0007DK-DT
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 15:08:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2612::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27ec1f14-5fcf-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 17:08:00 +0200 (CEST)
Received: from AS9PR06CA0688.eurprd06.prod.outlook.com (2603:10a6:20b:49c::30)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 15:07:58 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:49c:cafe::9c) by AS9PR06CA0688.outlook.office365.com
 (2603:10a6:20b:49c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Wed, 21 Aug 2024 15:07:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Wed, 21 Aug 2024 15:07:57 +0000
Received: ("Tessian outbound 1b5e57ba80b9:v403");
 Wed, 21 Aug 2024 15:07:56 +0000
Received: from L4fcc6769370a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E81C6C2B-4B3B-41D2-AAA2-8DDF77954C67.1; 
 Wed, 21 Aug 2024 15:06:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4fcc6769370a.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Aug 2024 15:06:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB6345.eurprd08.prod.outlook.com (2603:10a6:10:252::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 15:06:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:06:46 +0000
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
X-Inumbo-ID: 27ec1f14-5fcf-11ef-8776-851b0ebba9a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nBs55hzK6XoLqHCgsw+EARkOkF+8pzNhBZgfCX42QpRZuKFkeu0NQmGFOW671VPn7K4NBU+7OGrDHlSH6Er5ws6FvxSjS5ZTjNJ0rnXrJhp/qLYEatx0vjKuaffJUZPe678qC8ztMEt1vNqWVQBQR4pVxeY4APau3VDIv//F426QjUEzU9GhUmzrQuN251xOdy0Dpc7CGWpd7UlMikT5PPb9E5DK+TO3vvfoKcB4D8LJdREjSv9aSiy/DYeq0ZA0a0sFe/ebqJ+N4w9vw6x2w85JmjWrKoxlzwh4aH5ZmZ70/6RjXrmotjIUazvi0y1MHbzvIih53Yt3CzkJ4moV9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uWScQgZ/FGTixKPh5t+4Rh/Q7ataUUkp3iF9Bmccmo=;
 b=LkWnhr4xqNbxMAgzJ5cmRR+41GvM92L4db35gzKQbiyQoKxOicbukTtwksEBgitWRaMHmKqDuGRbBJiyjRfsv1V3xOh2LRjSBCY4bus0M3U91cGLTrkmFBo4addizd9mIffKujOSCoZmIPv3Prq0BPKksTw8CjVa+3bDetn6RAkKISnZkzmWwwTXlGPFw5qJspxkflCaE8NYN6G3cY0DSghJiwi3xlF/xoPrPbqi+iu2HNAF0/xQkAROqPyP6IR0bGmTNG2fucRuqYuFnc4aQ4JojgP2Q9PfZnBnc2pRzzUw1V7UJyUvR3P3ftCw37YlLVZU7QdjWVNy24RmwsS7Cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uWScQgZ/FGTixKPh5t+4Rh/Q7ataUUkp3iF9Bmccmo=;
 b=d3nIXFwJYT3XH/jVHRmhdXTNtoo5Df1b54KDiFTDxhk+19x/pgp8EW7ZtMstsZ+Dx4i5LsaKBUvKEXqQDX/FFn4M+MOTW4TRGr4bR+cqvniOOukG01WKpEW9H5oWI0AMUuYVRHjJSXV21Td4OPBYoVF2VP8lUJNylJQEvQ56qp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31c7dd35aa5799e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHZyjH+m/bbzx/oy4gjCZfI7EzX1bI8Hz5MypX6j3Ln519tTVtFUDu11mRQxj4Sgbb1Qlxsjbh8l5akKQW91LLm7C7FIZ+DVNvDQwRF1j12j82xOZDb+gadRpZJCC77pmDP4ylvImOvTUAyUGZcT79hWFh8Cy9bVXUZkhYcnS1snspzAW03+ntV/95SY+Zgs3LmXKlxsuv8h0Pqvr2fBnt4JA+ohtJ7Jx2f068Xin3sInaTMv4YqGvrjH6jgFSRRTmpz0mVItJMjBwTTEEnhI7z9pD5mpsP86vUsf8hmNMvowrH9+eLibvUVJWHl7ejN5VDGAXSrAD7uXawQY+JoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uWScQgZ/FGTixKPh5t+4Rh/Q7ataUUkp3iF9Bmccmo=;
 b=rPd8+gkKlXMId2hm9g61FtPzDDsA1Cmg53uSxH0Xn4d/SFx8qwlAnYXqL8nD6ZlF3v8rdRov2sWea9nAEivwMOrErEABOYdPu7odpRrws6fIfWaV6eT/3qyNbE98v0/BUeDtFrdHdPTKfD0252ZSnp5C3YzqpanLShCcmrHZc0+RE1vifI2du/1MIzpkBKR7vF5qaV1dtMJeoBXiS3nAjkPNg8aDoBDyEEp285cfDse74h/EcOEv4T0vhs4O0LMydqteVhgNFRDNmoRE6efaGIqTbxbxXdSRbnIFn5/uiB1XP4rd+FmWcjHPVjErFgUF8ZzXeHXQdNgtDnJmAVqUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uWScQgZ/FGTixKPh5t+4Rh/Q7ataUUkp3iF9Bmccmo=;
 b=d3nIXFwJYT3XH/jVHRmhdXTNtoo5Df1b54KDiFTDxhk+19x/pgp8EW7ZtMstsZ+Dx4i5LsaKBUvKEXqQDX/FFn4M+MOTW4TRGr4bR+cqvniOOukG01WKpEW9H5oWI0AMUuYVRHjJSXV21Td4OPBYoVF2VP8lUJNylJQEvQ56qp0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Artem
 Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
Thread-Topic: [PATCH] docs: fusa: Add requirements for generic timer
Thread-Index: AQHa8u0jnfgC5boSJE+t9AfK5MrS+7Ix0ZQA
Date: Wed, 21 Aug 2024 15:06:46 +0000
Message-ID: <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB6345:EE_|AMS0EPF00000196:EE_|AS8PR08MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: 50eee2cc-743b-4ee6-e565-08dcc1f30a62
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?o+4crYmguIcFxuiXgO6GeWlrd/JIvJKiuOJlE7vz6VahJ2q/sSrRSsjpFw+U?=
 =?us-ascii?Q?h/21ibuPTZ5EAKE+uq14TG+XjBoeFa7Vm1gw07WuK7Axprdvrdfqa9jKAsWc?=
 =?us-ascii?Q?0DC4DjTpuK0Yfay2XsXIbIgo6vqt7JdNdEq9ZoBbRSd7wVK84kXI256YzYcy?=
 =?us-ascii?Q?7C18LmSsymOre1Wh2L8bYtuyAFeQ3LENQ6FpdlDxAYWBMffb1UBPJUpnHaWO?=
 =?us-ascii?Q?+fXEmKYzoGx5SSGYbVyxjIu2IQr62riw7H0dxELH508zVMXwV4QOBlags+NE?=
 =?us-ascii?Q?k4lr8KKnw25HXZtiopyD64PYRpBh01n0HPWqbh79ku4IuEQdZRfD1KlMrwy6?=
 =?us-ascii?Q?KDkJb0ahTBw/yydVyxAT6GQYMWmM7qQMrgAMF1z5X5jJH8GE+wyS7wPvHo1i?=
 =?us-ascii?Q?np6mpPNK9A5+3Um1xC+9d6Ic7GJ2kwd9Xj9f1Ur2acEtu5SZXZGU/ue6H9rh?=
 =?us-ascii?Q?Hbv0lA6Dzib/zx2QQiJIElW0C9RDJvrx5ZyLE0ySZFLKxMy5JvgXFUry6RBd?=
 =?us-ascii?Q?Czgyo/z5crZeDB36W92Upo5twO5bfXFvX0oJOfvduVVqLa47I8cShvBwYpBC?=
 =?us-ascii?Q?NuXWRa7c4dHNmTmYaOKFKAVjHL3IwLIP4VLPtOUbKVMYiP8rzrITisKHsd2e?=
 =?us-ascii?Q?5HQHPakRjA/joVDjDPdhlbyirPraqnYJ6goK969Vh78Hq1ahuTrDmmaRgc/c?=
 =?us-ascii?Q?uXpmhRNnRhhUwlICd1kyDfZmQrtPQsHLlOZ7yhxeg7dWNo+zmJA+myBy/2kk?=
 =?us-ascii?Q?09lruQHoqeTKhshnygGShewjqVZTaW3Z6t67v4pCVllMLVlvQ3oMkiYOwdbz?=
 =?us-ascii?Q?pMvSL1+qhczifx1rizmEsYr2+tr8qsxoPjfGAnrotlJGFSki2LNVy4SMnA/R?=
 =?us-ascii?Q?xUjYZKL8i60U6FGZYh3loUcNq2dLO381YrIy2BgCt3PbYUC7W9ksu187W8Eu?=
 =?us-ascii?Q?iBgOor1f9+mzLfZ+Yf2C1YeFDKgg0E+v4sOZSASjmNCorrlaYTZLXHvmeSto?=
 =?us-ascii?Q?kw3TnXH1NnRW/oLAA1lT5KBfIhGqCQDUfGhJNBZ2k97hzb3xJ7N6IsykWo05?=
 =?us-ascii?Q?M+7q2uXbnxshGyCvoLeY96ai4uFQxZSXCFBfPA7maRY54BwdkXGSKg/mc09C?=
 =?us-ascii?Q?+6st+SQLI7LdU6ueCpPIAdVJFTT1VvMpVEMQoQJQmIhVT6zznxMe7To36bNb?=
 =?us-ascii?Q?P5kMwy+Y3oiiR6l3c/EwCe7eBw0sC1jpylM0WyjO7F42niNW+wwVSEEpIsKt?=
 =?us-ascii?Q?baXSEHRkVAfjYA11qie+6uFpl9SfjpcbPbcfQTm8k4XrkUw6W5Xk6ilPx5vL?=
 =?us-ascii?Q?vOvkUbBitr0e+2wwPsE6MPuqGNS6uQZE7u09Pekwq8gMjvJwU9bzIEfFjzuZ?=
 =?us-ascii?Q?eS+gYHzKFrjs/3PgWHOmZE886ntNNSUGthUMy4zTTMGwyjOYaQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1CC4C41CF7F3FE49B005512CDD6E0811@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6345
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0a239a7-5b28-4e01-ad67-08dcc1f2e045
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NwopqBFNYMeqSjQbTIBp/hS5xikaXx5reIYi3sFvqWB9liMGEBufSN4g+FkI?=
 =?us-ascii?Q?hbdkTatVq98muoPdhT4gcoDz+GPWdJuB6bhbn+38gabjoZ+J7Ri5PU+NKBAE?=
 =?us-ascii?Q?pazwp0LgbAPZ0Geg0mSxysmQd6S2pAFOX85QaEdRYe9+U6NHMU1x/2HqoG0M?=
 =?us-ascii?Q?WesZJUMaMmSlmiGbeZMGy8D7rumdGfKglsh1AaiQRvFPYs48qIwgbFg725R2?=
 =?us-ascii?Q?Cs05+NUrL7jUQHynok/GjmQoQ8DtzLP4PT7FaRNIWt62BhBPpJC2qJyd6jBD?=
 =?us-ascii?Q?RLKB/vQRjg3rOHaHJp/ZdJyCCToYDssTKcxNPiE933IztR5ODGHoNGnpSkgM?=
 =?us-ascii?Q?MdSzedBR868bCE7WykARv/QEtrfRQbof7jto0QXTqyGDAq/7kizxmjnHRHyB?=
 =?us-ascii?Q?rB4e0o2nX/EVVh52swSe73Sdg8V1FKToC3uAhCrQvfLu1m84A+YR2QqeWEC6?=
 =?us-ascii?Q?n+EQ60Lf9dSz9p54KesMQMiD8atig+51ahurPdAh48+t7jD5b9u3zBPm2nQE?=
 =?us-ascii?Q?z6i/PwXEUtIXcqkfN78PWYJU7ks89PUexaK5nAYqtm0jDay4Lfc++pqRIuUt?=
 =?us-ascii?Q?/S65hztN9EA8s18HatMMiB50qeoJgJ7D/xhjhFc7mLyWiL9fOaFLDP/HdYxE?=
 =?us-ascii?Q?KB1ClQRWJFdkVerFcT36lA/NaFFnQPGaxy3mutjdajzx2FkZkmqjwx7i7VSY?=
 =?us-ascii?Q?3FC+Uj74BP17qvMvqyGmvMFvWz66yCkZCDAyfAhX22tUpU3XzbrovUzT2t/j?=
 =?us-ascii?Q?T9GgGYT5T64Okp/g2R2GJ1ffSEDSX/8zHAtU+243An5gQd+J+x40XlxXnBOq?=
 =?us-ascii?Q?lpGVarT24RUGsYNOJCxY3bUTkX+4WzCpEGl4E3uWm4J/K23w8yI3W1xbuayS?=
 =?us-ascii?Q?//teqH02/y3+ZiGsVm467Wui6flgOZEoY5aXFZsIPDgCUgzpN+opqtE/MLke?=
 =?us-ascii?Q?IdNa5cqmKb3rEEDoMEnjrjtYcqXq+ZJhwLC4jstZGUkR0Tze1JBFWjWOsJPW?=
 =?us-ascii?Q?sYqTIjKeJ3N5Ya/DvEAnCwq3SMkKTRfV/boiXPkGS0moMWmsnxd5S8qgo+yD?=
 =?us-ascii?Q?9gO8qSHHFAR2HLxmNnt0si1d4EGERUGNdv78GFGDflXPqNwTJUfZq52FOg5I?=
 =?us-ascii?Q?KRvFb/84QOTzYvyKb5NTn1z4QbQNnLnfG0ZY6yQYSqbhqKA7Le5Me9lYIXcV?=
 =?us-ascii?Q?aSSG30OaLBzcSVNGggB++u0lPlLkpEqFGIY0T0R5msVdbJWmP6NdYH2+MqOJ?=
 =?us-ascii?Q?SfVYYqckZRd79ak8z3Nmc/j6WWy+/IsVur0a6ZXCzd3zDUmLb0pBUQ5l/WHV?=
 =?us-ascii?Q?g2JtpnLkaBAkoxa712D8LIV7mu6ljxpz1ENt1QPO8hezSsjcw8xQEPOy0Zj5?=
 =?us-ascii?Q?ZIqQoLVQC9MVvlRM+LcX9ETHYdpZZfrPNmIpZdgFiUy2lrNXILRIrRAt+wAz?=
 =?us-ascii?Q?BweTrFn7kNgYOdbtjoFl7IIobioU1MM6?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:07:57.4609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50eee2cc-743b-4ee6-e565-08dcc1f30a62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976

Hi Ayan,

> On 20 Aug 2024, at 12:38, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add the requirements for the use of generic timer by a domain
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> .../reqs/design-reqs/arm64/generic-timer.rst  | 139 ++++++++++++++++++
> docs/fusa/reqs/index.rst                      |   3 +
> docs/fusa/reqs/intro.rst                      |   3 +-
> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
> 5 files changed, 202 insertions(+), 1 deletion(-)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fu=
sa/reqs/design-reqs/arm64/generic-timer.rst
> new file mode 100644
> index 0000000000..bdd4fbf696
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -0,0 +1,139 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Generic Timer
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following are the requirements related to ARM Generic Timer [1] inte=
rface
> +exposed by Xen to Arm64 domains.
> +
> +Probe the Generic Timer device tree node from a domain
> +------------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
> +
> +Description:
> +Xen shall generate a device tree node for the Generic Timer (in accordan=
ce to
> +ARM architected timer device tree binding [2]).

You might want to say where here. The domain device tree ?

> +
> +Rationale:
> +
> +Comments:
> +Domains shall probe the Generic Timer device tree node.

Please prevent the use of "shall" here. I would use "can".
Also detect the presence of might be better than probe.

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Read system counter frequency
> +-----------------------------
> +
> +`XenSwdgn~arm64_generic_timer_read_freq~1`
> +
> +Description:
> +Xen shall expose the frequency of the system counter to the domains.

The requirement would need to say in CNTFRQ_EL0 and in the domain device tr=
ee xxx entry.

> +
> +Rationale:
> +
> +Comments:
> +Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" devic=
e tree
> +property.

I do not think this comment is needed.

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Access CNTKCTL_EL1 system register from a domain
> +------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
> +
> +Description:
> +Xen shall expose counter-timer kernel control register to the domains.

"counter-timer kernel" is a bit odd here, is it the name from arm arm ?
Generic Timer control registers ? or directly the register name.

> +
> +Rationale:
> +
> +Comments:
> +Domains shall access the counter-timer kernel control register to allow
> +controlling the access to the timer from userspace (EL0).

This is documented in the arm arm, this comment is not needed.

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Access virtual timer from a domain
> +----------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
> +
> +Description:
> +Xen shall expose the virtual timer registers to the domains.
> +
> +Rationale:
> +
> +Comments:
> +Domains shall access and make use of the virtual timer by accessing the
> +following system registers:
> +CNTVCT_EL0,
> +CNTV_CTL_EL0,
> +CNTV_CVAL_EL0,
> +CNTV_TVAL_EL0.

The requirement to be complete should give this list, not the comment.

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Access physical timer from a domain
> +-----------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
> +
> +Description:
> +Xen shall expose physical timer registers to the domains.
> +
> +Rationale:
> +
> +Comments:
> +Domains shall access and make use of the physical timer by accessing the
> +following system registers:
> +CNTPCT_EL0,
> +CNTP_CTL_EL0,
> +CNTP_CVAL_EL0,
> +CNTP_TVAL_EL0.

same as upper

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Trigger the virtual timer interrupt from a domain
> +-------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
> +
> +Description:
> +Xen shall enable the domains to program the virtual timer to generate th=
e
> +interrupt.

I am not sure this is right here.
You gave access to the registers upper so Xen responsibility is not really =
to
enable anything but rather make sure that it generates an interrupt accordi=
ng to
how the registers have been programmed.

> +
> +Rationale:
> +
> +Comments:
> +Domains shall program the virtual timer to generate the interrupt when t=
he
> +asserted condition is met.

What a timer is used for should not really be documented here

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Trigger the physical timer interrupt from a domain
> +--------------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_trigger_physical_interrupt~1`
> +
> +Description:
> +Xen shall enable the domains to program the physical timer to generate t=
he
> +interrupt

same as upper

> +
> +Rationale:
> +
> +Comments:
> +Domains shall program the physical timer to generate the interrupt when =
the
> +asserted condition is met.

same as upper

> +
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +[1] Arm Architecture Reference Manual for A-profile architecture, Chapte=
r 11
> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 78c02b1d9b..183f183b1f 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -7,3 +7,6 @@ Requirements documentation
>    :maxdepth: 2
>=20
>    intro
> +   market-reqs
> +   product-reqs
> +   design-reqs/arm64
> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
> index d67b18dd9f..245a219ff2 100644
> --- a/docs/fusa/reqs/intro.rst
> +++ b/docs/fusa/reqs/intro.rst
> @@ -55,7 +55,8 @@ Title of the requirement
>   be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or desig=
n
>   requirement.
>   name - This denotes name of the requirement. In case of architecture sp=
ecific
> -  requirements, this starts with the architecture type (ie x86_64, arm64=
).
> +  requirements, this starts with the architecture type (eg x86_64, arm64=
)
> +  followed by component name (eg generic_timer) and action (eg read_xxx)=
.
>   revision number - This gets incremented each time the requirement is mo=
dified.
>=20
>=20
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> new file mode 100644
> index 0000000000..9c98c84a9a
> --- /dev/null
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Functional Requirements
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Run Arm64 VMs
> +-------------
> +
> +`XenMkt~run_arm64_vms~1`
> +
> +Description:
> +Xen shall run Arm64 VMs.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> +
> +Provide timer to the VMs
> +------------------------
> +
> +`XenMkt~provide_timer_vms~1`
> +
> +Description:
> +Xen shall provide a timer to a VM.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> new file mode 100644
> index 0000000000..9b579cc606
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Domain Creation And Runtime
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Emulated Timer
> +--------------
> +
> +`XenProd~emulated_timer~1`
> +
> +Description:
> +Xen shall emulate Arm Generic Timer timer on behalf of domains.

Xen is not emulating but giving access or providing one.
How it is done is down to the implementation.

> +
> +Rationale:
> +
> +Comments:
> +Domains shall use it for scheduling and other needs.

This comment should be removed.

> +
> +Covers:
> + - `XenMkt~run_arm64_vms~1`
> + - `XenMkt~provide_timer_vms~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20

Cheers
Bertrand



