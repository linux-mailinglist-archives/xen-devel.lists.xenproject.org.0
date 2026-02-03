Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AQeA/8tgmlFQAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:18:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC18DCAB4
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219504.1528374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnK2o-0004ur-9O; Tue, 03 Feb 2026 17:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219504.1528374; Tue, 03 Feb 2026 17:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnK2o-0004rg-5u; Tue, 03 Feb 2026 17:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1219504;
 Tue, 03 Feb 2026 17:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnK2l-0004ra-Va
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:18:28 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5763dd05-0124-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:18:22 +0100 (CET)
Received: from DUZPR01CA0205.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::18) by AS1PR08MB7611.eurprd08.prod.outlook.com
 (2603:10a6:20b:476::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:18:16 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::80) by DUZPR01CA0205.outlook.office365.com
 (2603:10a6:10:4b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 17:18:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 17:18:15 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB5PR08MB10192.eurprd08.prod.outlook.com (2603:10a6:10:4a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 17:17:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 17:17:12 +0000
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
X-Inumbo-ID: 5763dd05-0124-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rAtUcQ0X0TbP/mUxeMoZWJ9Mw1xtAo2WViPzPAnaBIWcNP4h5nITRYlvkq5uY5ukaV88UwgVwmfHto/C1kFWeMgXfOOTPolqA7jMr02PNUjqq1QUwtnUuJlN9SY8EpFaeyqP+wg+XKkgwkJWbzv/+NWOn7zOlEm7DUQcnZxUG9zqr8nbKeipiCxapHfciGp1s7Sqg/sKIMHlCczrvT3aOmJMzgw8UZ+3OLnkealip4c5nF02IgaWEsvOa31PMRJsIb6h2Atdp8PsVCwHkfA50TH2JTudw8bK1BBEUpxU61m6c5ecUJOlE27mYUZ4Pml+j1eSnojh7y8GtSbVaXjU1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE49mNU7o/f+UFRrp5Xw+T4iHWwq3t2m62iAvt7eISA=;
 b=TdQSBm/fYz5NefpzdBAqSmux/8zlxdQ1shNX9RSIYDw8rMcfuOdFdP181yHw01zQepLHjqFXF1FghYOu+TwIzbrSnuX8vZzt+eESjKDRR8Aw8rS0tUfgCdVhj8jiBbnnjlzOs2ZcSJYtZaaeXOjveQg9kPr3PuGNCzlBTxkvG3ygLc/jvDi/0nwiUcy925s4ouppUlJQfqw2haNaWFLaf7PPI8vjSClDPYh997tdNjhj0QpneK+7OOqiFdM+6keoZIVN2ldY548Gn+96lpgvKrHP4tYSjdc+6YOR0FtKEZLMM5lNWPfp8ahmT3ICmezJfe2G6C5jkd2qvfIUInldGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE49mNU7o/f+UFRrp5Xw+T4iHWwq3t2m62iAvt7eISA=;
 b=aM/xCH8VO5PgnFidrAZ2mPIDQdgJ7KMopdvGEHbwDPiYuNHgxPpDMxxV6sTJD4zGjoqpJf5hweXb5w4qPOwl5m8e25Yectks9g3fLNpa+Gwad1zvfhLODq1/MfIT6ZNvZQfJfKa7/6+yaqOpLhdkFQcii9EQgjXn1ft2VuveC3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiW8p0/mgzrs9F0AKcAV7wePf1CPqPJ0gmsaI2kvkuJcXAJiecbuFXfdKZL6wyj3lUDujhSglSz1BzC+PY6WLQ/XzWapaWdzRwaPe3PaK8gOBFMjnHJ0S+pK4fu9XDfCDI/H6cQKdUAfVwrMqrX4tTb0YCJJdszcnhmzgUU8Mqp2C9dYr2d6JM6rROxN38lXxFeXsXx8nH28b+v5g4qPRMo1ABjB8KzXw25ONxglGH0RLsiSaGrjz67mhShwlow5+NAuCEzAXcICG91JJMlWIT3BUI0s/pDPY0SRHKAWuZg6hlgIgxQrGhW7hVn19YizeLv7YI0lemTSKCQU2K1PfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE49mNU7o/f+UFRrp5Xw+T4iHWwq3t2m62iAvt7eISA=;
 b=NUPvYjcrhsu+OkVv15n2m60Nn4SrLFv5ly3boVh8ROr6oqbMJHUFUsUaTAGmWNOydxHySf30cB/6jd10Kq+Fr9VmUtMgVxBMqzkOpvQXijb5Y8M8CY7mLLQ0I8KFAqGLuijF5yAMJcayToxEwNxmdbj9D+ZJUu3rajiV7j5WgUGN0Vo+EDa/ppN8AMo42IehPHjwpywvvQHsQ4F6MiJe13KnWuCsEQY90Xo0w7QrxAkqJlppRzhE4h3zzTVcIuwoumgkjMkcnWvg2NrUzA7Xtrkpp59d+5xBTo7DOCb+tU47wnqWz03Fb8zkbnZkgC9a3onkZDai+lRINS3WLypWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE49mNU7o/f+UFRrp5Xw+T4iHWwq3t2m62iAvt7eISA=;
 b=aM/xCH8VO5PgnFidrAZ2mPIDQdgJ7KMopdvGEHbwDPiYuNHgxPpDMxxV6sTJD4zGjoqpJf5hweXb5w4qPOwl5m8e25Yectks9g3fLNpa+Gwad1zvfhLODq1/MfIT6ZNvZQfJfKa7/6+yaqOpLhdkFQcii9EQgjXn1ft2VuveC3o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] build: avoid Paths.mk in hypervisor build
Thread-Topic: [PATCH] build: avoid Paths.mk in hypervisor build
Thread-Index: AQHchV6cHH8qTLh8YEa40ejcvCxMQLVxVxSA
Date: Tue, 3 Feb 2026 17:17:12 +0000
Message-ID: <48832F4C-43D3-452A-91AF-27548AF6C7AD@arm.com>
References: <ab8a6f18-522c-4493-b46e-0f51c4350bc2@suse.com>
In-Reply-To: <ab8a6f18-522c-4493-b46e-0f51c4350bc2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB5PR08MB10192:EE_|DB5PEPF00014B99:EE_|AS1PR08MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c834e3-efee-4908-6835-08de634837cd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?CE/U6ZTRAk/vEJ5YaIv0Cp9QHfOl6UZA33QB7HOGZ6wzgiNHwitTjdEeny?=
 =?iso-8859-1?Q?cOr6Ru0HxGeUU25aziCh+eB9QVqh+gLzxDkQxsclfEZgPbknCGlciSqwoM?=
 =?iso-8859-1?Q?hTgvkfJGm5wZUcxvMVyPtGoSZZLdMSy2SzhyAC7n0TYVb9Xf/0cN73sRmh?=
 =?iso-8859-1?Q?KO95/yERhpNwK1Fyp91qsZzLV6igQE9drXUiAb+RKMByjn5oTQ8sW0fSfA?=
 =?iso-8859-1?Q?/5TVd86vEne/Fp4x0FDYBwH62KhhrK3hZ13xlWW2CNLsIgogUo2PmpQ53A?=
 =?iso-8859-1?Q?MfiE1YDoXDXt4KHvEYfvlZpM5A5YkKFLPFAb/nODBYXri8X6PJFOpztgOT?=
 =?iso-8859-1?Q?nBZeGDWifdmc04pmbSizbxyb2IIBOMnFgJbr4iIt9++cuSvHtb2dF5SzY1?=
 =?iso-8859-1?Q?6GnsqxJggFLOJOaMsQuSpFzYsq/zbUsZPXZO8oD8k5w5Pa/iP1YU5tqOot?=
 =?iso-8859-1?Q?0gaV5ob9/J0ZOiqNdIZe7yxKvYk4nCTX+r4vcjdLKcoC/WWYMoZ3nb6tcL?=
 =?iso-8859-1?Q?Robua6yVKenlhz8nVRm+H7nLPxl11g15bXrUwVAB4m7okH4hXMgkQT/N+P?=
 =?iso-8859-1?Q?Bf/amXPMs9432qDvTsG8S8GHzwFYveDKJFIU0uRdYk1m3u0m7h+abInwcM?=
 =?iso-8859-1?Q?l3NvuGzLW71dbcyng17aSqRDpk33shTbdVp6e6zPse9y3VCpcqSyZSushi?=
 =?iso-8859-1?Q?4RzcRKvbjfOEm4B0Ouhh/vvYYyiAJ1d1HdhmenfT+ZyiLsoA5V/V0aZmDW?=
 =?iso-8859-1?Q?bIiEytjE2SPulPwFaX1jH87YtVRe6v+2xD99ttkXmyZXb8GUSjv1ZdwDgy?=
 =?iso-8859-1?Q?N9fnYY0qU4Vd8Jb/zXPbQKQp244jIjVnYXoUOkiZdIoxbnyqCOajVamMbm?=
 =?iso-8859-1?Q?YrWj86q7ejB8rUAPsd18lWfTcn6wIvJldKbtKBn6cmFBEj2owUfDBTVC+2?=
 =?iso-8859-1?Q?NNhXL+Gn+K7HU/v+Z4ooGssfngGc+qjw5usq5N18vffZYkm82rWfcKQFMn?=
 =?iso-8859-1?Q?U2d+9Hrd4cdPSjOvfBLfNd3fh3nLDJG7ODxDs1Kn1HdQBwEJlIrrARzNo8?=
 =?iso-8859-1?Q?2D58GQ4bFya/ThQyU3qAR6qCjJeulQGSkEnocRGQouVXF+YD4Vm/T22OZ1?=
 =?iso-8859-1?Q?cSAPnqsumDMOfrUCqDn3A3kWe8bEC7KnXya7vHNygsrcTpsBYot+PU5bBX?=
 =?iso-8859-1?Q?yI3SM/c+jQuqhHeOOUaugNaFrJfOD7psksgcKnN5zppOGct8gehevHS7K9?=
 =?iso-8859-1?Q?eK5lO+8w95XVNv4FOqsGhA4m8/HBQEg8fUjPpp8XRi8C4DYiqARlBLhHmt?=
 =?iso-8859-1?Q?2e1E+/taFPXfptVqhnGTt4QXcWGHi8dOI1aBW1eDEBAH0e1xnOqFN+0Etk?=
 =?iso-8859-1?Q?UrDHEiSP8feBkrddoAbV3nBcvK1y7WUOb6l4JxillwN2GwCab7a529iNyR?=
 =?iso-8859-1?Q?zgvre+D55oZ+s7PLCZnQy3Q2sfve458JYO0+v9UtkMkdAQ+gyS2qaWGpIv?=
 =?iso-8859-1?Q?8BmgMiR2OMGt0h4dmVij06XCYWCV4WoAH5hFBHYuWY5D0KUZMVApWeyecK?=
 =?iso-8859-1?Q?Aw7luYCzcOApsgrffBPpLiOexetVYjo8eu9O+rML3I7T5UF2yDJBe/+QsF?=
 =?iso-8859-1?Q?5rHhPiTpg+fdXTknf29mkETVAJ+vFrQFI4Z/tj98oTHViH2iwQst09WoSk?=
 =?iso-8859-1?Q?HOrYjAbBrzttvEURT5o=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E49DB73959D8AB408A2ACA59358A75D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10192
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1da6910a-9023-4b14-884d-08de634811e1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?vlDfK+vcoNsHnkLDTm9KN6qmHy1qiG5RK63RBUgtDbXvJ1MOt/4IKmz7EJ?=
 =?iso-8859-1?Q?5KgNzwUO9Ck0T8Avi0rxcoC1BNDXc1WYCd6ivg9VcumniA3fEL7DYwZ3Ui?=
 =?iso-8859-1?Q?CjjNs+e8dK+UJE/RC5zsHaS1gfl9aqqJCZpXzC4PxM0ifdHChytcujXpOv?=
 =?iso-8859-1?Q?wv3acwv8UNXapjyI+FrjAVoa5zjYDrwwIOGh2P1bot+zK5qohY1pALcTS/?=
 =?iso-8859-1?Q?FSqqNrL66WM4FZM9uwxv/bxmOqBj4CD+dnUiQ4L85nlNbDxBc+Ox/FEAp7?=
 =?iso-8859-1?Q?HDRnHQR5Fj1yBsh1FnqlwvoUX6Daow3ebrIPWFVWtQ0wMdKYu686IpJD4q?=
 =?iso-8859-1?Q?kHsKr5PrOckPrX1WTW9TlBcetvJWEdLEucEbPxjvOYpw1oedzU3ZMfsul5?=
 =?iso-8859-1?Q?WuLpfPIcAbVOI1RDlXTEpTbZAPNsW4fnAW12jINSRYwVayt7/EysVzKSqi?=
 =?iso-8859-1?Q?dwNP1YQ+keJDkeXoZGNqd9iJZrsL4YR5813XiaJEieC2R1aNbD46Ey45pe?=
 =?iso-8859-1?Q?cFFmBE7qGf0oYJCJ32s3QgB7lU67CmssB9uQd2iv9Yv+5uKi+A8OD3x8vb?=
 =?iso-8859-1?Q?HOqc1TeV8eB8km93PJovAOl15p8KkabMNZYqw8qxoQ+zfa9muv79jJN1hp?=
 =?iso-8859-1?Q?whDSZj5z0rI7whi4GLz6h/Zpf36LBqe+GzjyIvNh0uMFm8Q/SWQTXs5bLi?=
 =?iso-8859-1?Q?aeSi2tBRnSX5ih63ZjNy/3CA4rMJwuLO+G40t8x1ecXwBjX+6V0feuJed7?=
 =?iso-8859-1?Q?CSDucTqaAB1O17PPdhcnoLGBHvn976+NIVXN+6VQwAzLm5wmSfbG7N6mHu?=
 =?iso-8859-1?Q?JzOyz/aiA7cInP5SysgwjATuUvjpTG1dJt0FI3ud3kpBdM2BhS4D68jxlU?=
 =?iso-8859-1?Q?dpRJcA7YXftXVt1ZLGXha7g5cLd38cI4BRgikQIi4GqbI/1DH8zmtEsl1Q?=
 =?iso-8859-1?Q?iGsn2fYHX//takie6JHkTP68wPl35DRxz64+mbfYghcpBd/bcDHTt1vlQ1?=
 =?iso-8859-1?Q?1DbWhqAPmusDbhUFxyA4dSlCNEtGxnqmx04G+FyuXQaWCAtnvxAY7C32p9?=
 =?iso-8859-1?Q?5xVKzFg0hTpGizcjTwUeMzGfBTTbKvE18uRnb8nDbI3Chgj60tF7H/Ihdk?=
 =?iso-8859-1?Q?k1WDEG/PW2ZoFhBqn7uGp/eLnXR7kUHznSr8G4DdxIdkR0VWWNcyvEKX+Y?=
 =?iso-8859-1?Q?rP7CO3argoNT0Tctfwn5Qv8pw2h8Bht7NGVFYih88Tq8Ffw/RtHmfcjYzU?=
 =?iso-8859-1?Q?MyTjr1elbhifJy1OpqMWXR+Kj901QoTnfgJaFrusX/m5qmc6Ess6GRYoVk?=
 =?iso-8859-1?Q?1UfQxV/ze1xS3KhiKnBwxXhGKtBid6BDfzsM479lqXRJJ38uFIhhKSyVR3?=
 =?iso-8859-1?Q?zqDbBabHOl6qBK81drN/ek1FhLeq4TGlwTZzlrQiEZOql6AsLppglULJA+?=
 =?iso-8859-1?Q?9267BmebWFDEFtmaBsjE4gammdYT2aMUzS1C6u7etFww/K+PfPxYs6ejXK?=
 =?iso-8859-1?Q?+VnuObV8SmrXnDuLhsGfHoIA9FD+qEXHd8/lJKalpL/KqnzCZSE7vvddlF?=
 =?iso-8859-1?Q?by6k/ZzEv06s/f2pxpCdPzVtgdnmgqsPhtbxBzB3mx4X6fFk9lPd4FvC9g?=
 =?iso-8859-1?Q?TqGdFTDx80bCvRQfb64dqHU8geogpCVOejCgJ1Fr/mSEvMlShX/29jtZol?=
 =?iso-8859-1?Q?DpyPzvc2uPIBtaZxXSG3Wqy+MtsGN7mZCgm3thaZ3nDgkZhj5wLvxXAAVf?=
 =?iso-8859-1?Q?S/sw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1cdPx/dM6pQS4BVoxAeIR+cBpE8/kElkn41ENlXdxpn6dwd611eQipzM7O37Msza8jIPMJEZeCwWQ38U4ufg7VSCpSwXzf5aBTb0xZqtWVLm0ExKgQF6qzLvmync0knGePvxBS4O6UR/Un66qS05sLedD1/OO2nQLIBLF/9Dc2WLFZmy3MvxFMRGGavFAPz8XXuLxGwDY8T04GehbVMoNsj9gRomI1yYAZgSIfv3YMCizUVIEB1vEHK0Hj3eH6btNWXqntykXAO2U7zdj08s4NShO6izaO9+RFL2qti1fjvWf+bxiwFm7j8dL1eW6KF+Tqp8nf4uSRleTumEsQw8SxmOmnv/b/W69wTAKNG5FrrYoetZPVp0Y2nGd/qQgIKnBHYPa4CWbUB0sujKw71t64u6JrUHuNwvGioMMMZPcQzRi4CGZVh8kME5nHTS6jK7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:18:15.7105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c834e3-efee-4908-6835-08de634837cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7611
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: BBC18DCAB4
X-Rspamd-Action: no action

Hi Jan,

> On 14 Jan 2026, at 15:03, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Its inclusion placed where it is, it affects the hypervisor build as well=
.
> The hypervisor build, in its _install rule, uses $(DEBUG_DIR), first in
>=20
> [ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)
>=20
> $(D) is an absolute directory (shorthand for $(DESTDIR)). $(DEBUG_DIR) as
> set by Paths.mk is, too. Both point into the build tree. The two simply
> shouldn't be glued together.
>=20
> Note that the earlier
>=20
> [ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)
>=20
> continues to be working fine, as BOOT_DIR continues to be controlled by
> config/StdGNU.mk. Its DEBUG_DIR isn't taking effect anymore, when for the
> hypervisor build it should.
>=20
> And of course behavior now differs between building xen/ in a tree where
> tools/ was built before vs in an otherwise clean tree.
>=20

I cannot fully validate this but it seems to make sense so

> Fixes: 82b9cc04a7c7 ("build: add make macro for making file from file.in"=
)
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> This is clumsy, but I can't think of anything better. Suggestions anyone?
>=20
> --- a/Config.mk
> +++ b/Config.mk
> @@ -162,7 +162,9 @@ endef
> PATH_FILES :=3D Paths.mk
> INC_FILES =3D $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f))
>=20
> +ifndef XEN_FULLVERSION
> -include $(INC_FILES)
> +endif
>=20
> BUILD_MAKE_VARS =3D $(foreach f, $(PATH_FILES), $(shell awk '$$2 =3D=3D "=
:=3D" { print $$1; }' $(XEN_ROOT)/config/$(f).in))
>=20
>=20


