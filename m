Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEeWBiMNe2k6AwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 08:32:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0EACB89
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 08:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216098.1526067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlMVm-0002dj-Ec; Thu, 29 Jan 2026 07:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216098.1526067; Thu, 29 Jan 2026 07:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlMVm-0002b0-C0; Thu, 29 Jan 2026 07:32:18 +0000
Received: by outflank-mailman (input) for mailman id 1216098;
 Thu, 29 Jan 2026 07:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6fWS=AC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vlMVl-0002au-64
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 07:32:17 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0eca153-fce4-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 08:32:14 +0100 (CET)
Received: from AM0P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::18)
 by AM8PR08MB6452.eurprd08.prod.outlook.com (2603:10a6:20b:360::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 07:32:10 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::a3) by AM0P190CA0008.outlook.office365.com
 (2603:10a6:208:190::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 07:32:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 29 Jan 2026 07:32:08 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB6598.eurprd08.prod.outlook.com (2603:10a6:20b:336::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 07:31:05 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:31:05 +0000
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
X-Inumbo-ID: a0eca153-fce4-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bRPUg4UxuwTh0R0IVX/4JfarMX71Q+XV9QcC50F6T32+0uedeUefhHaCnLGBDDIAeBs2ipXVqEMf9qQJhQK3Uo7MTJj1xEaT5WcfKaMIf5c/SAeoE/aZ1Slvses9Zxf6HaTF0LMYO4recztlpVtd/tfwT+t5vp2q7j9byOz2hWZarD1i3pym129NEsRoomfbaUnDRlBEn3s/dNgW2msPqfs4luRbuLX3Bj5jjol5iCCx8jCP/BEWRX9Qu2QPX+CzyicdehRLScORosBNtxIJiYEaYLiQW5NPvknqpv3zyfRMM6NbCsz6eeARx/F7g2OPiWqW3GWYJtqwE4k+HV1TSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjypzYN82bqcXiGPDnC3sJ0xL7gs0zz/Rwhq0tsCo8=;
 b=NLyptnpFYrQFQHT+1lCoJeQEomiLxiMWVxtrIP2dhI1QqI7VlkYCQMz3TQR7bDHwdPET/08T0GdSVozb7O4HuNCFYsOnNgmCBfyhdGg/IGCjBofZGIS/ew5r7FnONEt5naco+ZmxeTIa4TzDTQCwZnogC7h8s7kOPbfl54yyDtScOgjHwQ67FM1PPjhE0LWhr0BfTGW2K+cJlBxtoyohdarYuw19nZfxJfB7oaJEQ8K4qtyWZj8zW6pdEhaEcr8BUuFEYaf8Tt2mbJARXXB5nJHR9bW4asLarx7UWUCcIqWbrzf3KFvrKeMIOdhm8/al8sB3Q3kiTvkt5NiWypnSTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjypzYN82bqcXiGPDnC3sJ0xL7gs0zz/Rwhq0tsCo8=;
 b=VC0rJvrB0+lhjGt2vWyQNkJWU+ErpRAYph+49QEePdNqUpIHSHHnAKgtYFYL/S9yORiCWTYWHqaIl3E0CicH93hOWGw7oLBb82sbld62uPCg/8Bqotfa4iiCsE7CtnrBgUKOGAjtzfgjFjMn5pNrqjGkiAyPqrWuVZn/W5W2bPI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuOfDJZzIOVTMZzOaAqgx52OfRmR9SggYcXsX6G9pbe9NiHzUH/iVyYy5zp99FdElmg+2CxLlh8YKEN01pZJNZK3SkaDLuotz8j1kA0cbZAXnDdRy2JOLGxCRI6JAgSznDBBmq5e60G7GyLlFM2ysbNH7+Mi2V70A2Qg+z3fjoqs3Kx1G7Pyi6SRx89sR17NNY3bpC5a1PmXPK15572dh5oQiQ4GrT601kzWdtCrNZuA0oqu2a7shqeCSp3uawPQRkWXVXRdtN8N1rpSD8sL52ViEn5UFgMdCyCK7+yVw9uTd7rSyvMmrnw2yBpFe6ClwSN8ceZubI6JZ+SxymIIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjypzYN82bqcXiGPDnC3sJ0xL7gs0zz/Rwhq0tsCo8=;
 b=EDXpCjsfVQGPNnbGSYumikJru24trggMxaNClDYxHbxv9ohL3o/iSsrp7vJRBRcR8MB+k5R2Ii8dCIu6LvQtUIxJBBtfB3XDRrHZvoBM3qakjFcAgcBFBRPqzLoaxZa9fBP/f6x15NeLbMphpKrjtflNA7mXS2+SJarI9l60DAI/UFxe7cbIasp8/Q16v5dMvO43wRFPaGSbvPfYYUf8+LR78xqTgxyrart7LULhQ/ggmD0/BzK8jYZUsR8prVJHKPIOMokeZ571PjdUrdpfOvHCitz69iWEEqZhCHk0IdYsnsB9k4CM1CK2uv9gHNufl3hX6EpjVKBrxwo6zc4cwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjypzYN82bqcXiGPDnC3sJ0xL7gs0zz/Rwhq0tsCo8=;
 b=VC0rJvrB0+lhjGt2vWyQNkJWU+ErpRAYph+49QEePdNqUpIHSHHnAKgtYFYL/S9yORiCWTYWHqaIl3E0CicH93hOWGw7oLBb82sbld62uPCg/8Bqotfa4iiCsE7CtnrBgUKOGAjtzfgjFjMn5pNrqjGkiAyPqrWuVZn/W5W2bPI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, "jens.wiklander@linaro.org"
	<jens.wiklander@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Thread-Topic: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Thread-Index: AQHcbdIZ54xp46f98kibMufFF0ZVibVIDZyAgCBW4YCAAKJHgA==
Date: Thu, 29 Jan 2026 07:31:05 +0000
Message-ID: <F0754B87-A862-42DD-8115-6D56206F1045@arm.com>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
 <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com>
 <afac8ebf-71cb-411b-b821-72d82b24ef7f@xen.org>
In-Reply-To: <afac8ebf-71cb-411b-b821-72d82b24ef7f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB6598:EE_|AM3PEPF0000A795:EE_|AM8PR08MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3dc66f-7248-4078-74c7-08de5f08828a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ONWKFmx64vGFQrt+YkqvWufo9RLdgZEkv4LuK/iabvEr+lIswOXldHv4uwXI?=
 =?us-ascii?Q?1P+QSjKYN1ktQnpLllYPDgRbs8JlAlgZ3wrGWC2beOL5L/PdxUAdR6lV3ceY?=
 =?us-ascii?Q?Cz7kYzQ2f3pbbOIqaS1kljrRtRSGUNhsWceYXynkrVO1/GjUKdTH6hXVBHhL?=
 =?us-ascii?Q?HLXkGx6beUvkJ8gahSbMXTgogos56YLXEf555m+tseP6Vea+CnW0fxp5RHWE?=
 =?us-ascii?Q?7QC/Gwj/LioT5sJb9fzmhprDTlUinfV/COagvS6EOVfrnUvgZFqsPmRKe8Kj?=
 =?us-ascii?Q?rnbtw4AH4x83DnCZCkiFXX14P645HxVXjzMJ4J13qPCG81zVuhjiOoPR/csd?=
 =?us-ascii?Q?DLruCgpglKdzOU628dTNzAXNPuRhLJJZJf47TGtMMKsII+Ob3E+YHz/zqHdM?=
 =?us-ascii?Q?S+sLFnz65j4Y211sDSeD9lqHOm7EArzduJOxU+cgpXLTsJuJxnvVcYotF6N4?=
 =?us-ascii?Q?iU0kp3slvsx18mAH7SHbxQ9W0IuNdcm0GxdHResaZPR6HzyaQ2WX3KaDwObO?=
 =?us-ascii?Q?uDZ5cQoYtL6PJx9nMXHBxsIhyaQEQMdq5sS+E6btw7imn2GRGByBQuPf+VcB?=
 =?us-ascii?Q?NF38qxTZmPhZQnh9mV5OwYonOFgeKsQoB40KX210OdVMhH49c/ytUAOosU6m?=
 =?us-ascii?Q?Dqt7rO9TNGrxn6hF7/NXSbVAK3bxzVq9BLVkvR21NXQF8/50YfC8prINY7xG?=
 =?us-ascii?Q?6uhe2PirFg1xc4ynFXCXdCacbisJjzeYdGHTBJVCUufOuwW3hvOQxvX7aXPC?=
 =?us-ascii?Q?aZwumi/afr5gLFVuD2BeKvEI+p+toYOPze0fDtogdJFUaFue0EH7/Wkln2I3?=
 =?us-ascii?Q?uNMrzxf5sv3qWCsSrhkTLxSsfeGb8OuF1zZjgtvUjZcZ84c4StYS/UhZC7ff?=
 =?us-ascii?Q?9MNtTQ3+ab+XoLUeLZiT9ASacJio7981sm67sYeGviW7CCG0Iu2BhuU71yQx?=
 =?us-ascii?Q?rdX7Jm36ZShA75gfag28yH+3dJN2cPpQU5dsaeUj7lPZpGS2Z57IF7nkPLKx?=
 =?us-ascii?Q?sMjALwIPuZjstWZH+skqHbKRAbfNDwSN4D0ImZUBuZxqfNqgidlYl2mUUkA9?=
 =?us-ascii?Q?RZLs0qIdMYh7+G9LIAeF3gWbJFEILeXn+SBFknFQhZbc++GqqkxNAVSYT3Ps?=
 =?us-ascii?Q?l85VNKJHtknP4byatOWKJnf8nLmw1CVq7VomVpS5Ue3DikTOw7D833IeKa0I?=
 =?us-ascii?Q?EqIQ9B6WZpfTvGxBfSSBoi+WulBVXHtnVbsd8xe5w4JHCt0c1Epji4AQ4qmp?=
 =?us-ascii?Q?F4VzPfL4YBQ6e8Cbts5iSRN9L+1VbpqcgFZBjl3vpZs1+Wk10G/rDaTDp0DF?=
 =?us-ascii?Q?zTxEmyezIQBj2mxdlVA0ZF8kYqjHDvF6OBCcNW4XmMpyCLY0mnUBXgq+5QZc?=
 =?us-ascii?Q?/lC6aNiHyk4+zY68rlimiyHI70NFFK/Z8fkJ3l+JPnJugqDtTYd1ulFyVKeA?=
 =?us-ascii?Q?Bvl4UnLCWbGQ0FkmIOdLJ+lEWxlRGx3WlElHT2jaOmucRKYqIiDpyIKrIYUz?=
 =?us-ascii?Q?I2U16pta8aMQU18lO451m1WaIu76XmQJTBJcMnt+/9lxJ61mxLGq339Y/EzQ?=
 =?us-ascii?Q?ci9uc99tywqP5yab9q1XsuAaLofk4I8FA/EzwVxMHZnvfDJgsUhgu15MgCQh?=
 =?us-ascii?Q?PHDqp9iLOIfv9OkJBRLaGjg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7EC78C2FEF00974C920FAB450D77B68B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6598
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aed099eb-4cd2-4d90-f7d5-08de5f085ce5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|376014|1800799024|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aCEwl9aaqlTWetoZkAzzM+bLljrHOkisJJCNL4Zdf+lO0Ao80ybCiMo0kM1X?=
 =?us-ascii?Q?FnfFxtPZ1s8sChVTpQ1n6ca9YSbQxSnF9FcGAm+ttV9dPM8lG3aiEonnHYUN?=
 =?us-ascii?Q?rIG7q1tUHYzfskaZu2rptXrrnr/DsAd87mBJGoKrqdstkM6GKny8Fdpfx1TP?=
 =?us-ascii?Q?ammfnkF9h+VYQAQcb/FjzZk+Esu7zIGAl1SZgFJ+wNO/V2ZlDcyTzUkhtRzz?=
 =?us-ascii?Q?qvYuhAA9cwZHi+bo91jVtf8H/akJ/cilIvqx3JAZcMQrSjr77MjPjoyKVGLl?=
 =?us-ascii?Q?ihIKDJrIoFljptetF+Tca+XNxzec9y2Jr6Dlx5yYC9S0S+kWMgtHgaI7K9E2?=
 =?us-ascii?Q?jNvtVNmlk6zwKKNNIFPrdog74Ge4BMDuJlSK6+OaY40f9UiTT2jnx0SC4Lvr?=
 =?us-ascii?Q?v4gL8rRypfstk41vD2cr04b0pzfSEkPjxHx3/qNjvn2WVrrwxJ7i4yJ7Gyre?=
 =?us-ascii?Q?Oe7GHpi/iZmFmiqrpb44XVfdPoryyi/uz+ickGobmR7GiF0jczFAjQy+ALKk?=
 =?us-ascii?Q?19mVhdFTs8aoHvbBWRN5fbLK4TLt4+uSIM12LXqFuD+M3ihILkTkIDvVUaCt?=
 =?us-ascii?Q?h6C+OWoKjOpZqC77sS4SbMgxImVQNx9nmQ+g0L7QQbNH08Al/kf5w9isef6o?=
 =?us-ascii?Q?DPOxHrMpaTeqQXRs/kncE/MPoGomuXv7e7ETLDSaK/lqX6zb1H3XWw6lOaKh?=
 =?us-ascii?Q?qBaRREcidat2Hlv3rKiM5wLm973SOIpn247U6HiXcQr74Vqa7aF3aUVeZuMx?=
 =?us-ascii?Q?3XZkLiYSs00dNxZ4HSojbzVrp0B3HPWp/MIfHB5GuC0s3LtluvjHG3SGi66a?=
 =?us-ascii?Q?wQEBb5gSuUi2qKqqTSXsPuELQhbzjJtplaGHSkwbTKTA5UoC/oGYVwy+pH4C?=
 =?us-ascii?Q?KuPSddOrIGcaVDeacNMoxlG4Zw+lpslD/hSWHD3a91R8699Rcee2D+r+7A6w?=
 =?us-ascii?Q?kmhGq46lkom5HWgVWmkRL0RnuUA0rlRkdrnhCiXxebVhMWwO8Toov0MIcVcl?=
 =?us-ascii?Q?xM7IGtXiNzMZc9VbfO4cUM438ANA7miO2VtQPIBm56GJ4E16ox3CjjlXWnCv?=
 =?us-ascii?Q?AkEn39TkoSMj8XsEPOJFL30hLaKd65QO1mMeMbE0H3lPiHpJNkkgkdYtO4e/?=
 =?us-ascii?Q?5UhD4mZmHL0PPB7iCBKG0u6ClCDppQQjVtZl2Zy4i98/xWAljzbx0jd/E3le?=
 =?us-ascii?Q?Mg6nzs/YyrT4IQoYVPUzxyNg+xz6+H3wLCk8XYCNbSKFeyvyOpEx8n69xN51?=
 =?us-ascii?Q?7WIlr7E/LhtkcQBdaQaQXH14bH0Gn2cJDna6cKBtnjX9vXUY9cjU/R7X13qt?=
 =?us-ascii?Q?qh9XGxqXKnvm3YnooNiBNnbkr5uPmlV9vWf0awPhyTf8jSKGDqRI0HkINAfU?=
 =?us-ascii?Q?rROPFO/1NB5ytkGrJ1rl140BolGitWkbT+6BaanV5+m6Z0oPMT+5o/ASlIKZ?=
 =?us-ascii?Q?iYA481Y5xqFwftbcYZzCsQoVrfFx+WUVbcTnCG6Pw6FINWDg7ElNZPd98oq0?=
 =?us-ascii?Q?g4fyceKOsq1S3PJqq3GzGMiCpzO3EH0Qo+KQj83vh+j6TUsNRGr/MwxTt0gS?=
 =?us-ascii?Q?4ZBTr4Tq9CxrEPEW0/sDTrxKO3IZyt9pAfis+weSDzSMFiyXXjGKBH318uJv?=
 =?us-ascii?Q?2vwNf9cOtAE4CVe9O3WDba//FcOIlZMrrki4/tu/zYheejsvY3Fd2oEVqPaF?=
 =?us-ascii?Q?x1UfSA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(1800799024)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:32:08.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3dc66f-7248-4078-74c7-08de5f08828a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:michal.orzel@amd.com,m:jens.wiklander@linaro.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2EC0EACB89
X-Rspamd-Action: no action

Hi Julien,

> On 28 Jan 2026, at 22:50, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 08/01/2026 07:59, Bertrand Marquis wrote:
>> Gentle ping: This serie has been fully reviewed by Jens and would need a=
 maintainer ack or review.
>=20
> As we discussed during the last Arm maintainer call, as you maintain TEE =
with Volodymyr, you technically only need a reviewed-by from someone from t=
he community with suitable stature to review.
>=20
> I think in this case, you meet all the requirements with Jen's acked-by. =
So I will commit the series as-is.

Thanks a lot.

Would it make sense to add Jens as reviewer for tee ?
He is involved and knowledgeable in both ffa and optee implementation.

@Jens: Would you be ok with that ?

Cheers
Bertrand


