Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7067A5BC4F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907527.1314766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvxD-0000oJ-9w; Tue, 11 Mar 2025 09:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907527.1314766; Tue, 11 Mar 2025 09:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvxD-0000ko-6X; Tue, 11 Mar 2025 09:31:15 +0000
Received: by outflank-mailman (input) for mailman id 907527;
 Tue, 11 Mar 2025 09:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azTi=V6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trvxB-0000is-T8
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:31:14 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90078362-fe5b-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:31:08 +0100 (CET)
Received: from DU2PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:10:3b::7) by
 GVXPR08MB10520.eurprd08.prod.outlook.com (2603:10a6:150:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:31:04 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::bc) by DU2PR04CA0002.outlook.office365.com
 (2603:10a6:10:3b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 09:31:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 11 Mar 2025 09:31:02 +0000
Received: ("Tessian outbound 8a1969cea684:v585");
 Tue, 11 Mar 2025 09:31:02 +0000
Received: from Lfdb907fe3050.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8704D4C8-FE2C-414A-B171-E8183A1BF731.1; 
 Tue, 11 Mar 2025 09:30:55 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lfdb907fe3050.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 09:30:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB10428.eurprd08.prod.outlook.com (2603:10a6:800:1b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:30:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 09:30:53 +0000
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
X-Inumbo-ID: 90078362-fe5b-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uj2Rhl28WiqCu5ZfexaJ7BWCZHx81Ri9hZm0nTR4pWOG1Be74dPpozoC18a6FKLPzISwpf322fAN0t0CuE3mQsecx1jeSfgLxRktEBDqbn2IpjUPNgP5yhV5HDMAbKeYI6GFRtIRD0GVvgkWUJuevR2QVYWkwD9NWKtf6TeUS4HUDrwlTtjQ9K+VVak5B+wEU147ZyigPXACxhiI/TznUTxNRxTRloSHIGuXH/Xd9EB9h2ZHUZt91BK4a2yRqryhDw/Ew9z7s9PVMDwRlyeFHtcqPH4GFPD1kyEhbI7u3eLmPYslh9/y2IT3lFiYxzIiMDm07rivDlUtmi7kGKQZDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5MFWdEUnP9vj/jX5gTEQcm/wFdBf9rXhqZIObbaEfI=;
 b=mjboyu6gI6R4sufZOOm2Rm5NDk9I3LPWGOkKB3XSNgjX4Ngt3naK+1IGOH8SHxZDaTMbNlAzCCz72WeAmN2O4OK1Tt4oISA4HKpsyoU1fGyOghD2aTc+/R72vbuhHOnYT2jypKAXZG/RcwpXcQYIBpDucVDiog9QGxHrTI/y6LGU2UmUQCwiDKMjDW42muHBC3+lv7QW2PdeYifNM1kfQWJLsl0fX7SiAizvspqEqMBfq7qPqTSvCQSK+Ek8CfNQnmMgLyxSKQM319iPbWO0WscH7z259Hy9FX5s80n5EjurLy9L/hNiKrZGLXG4hCR4MwuHMURTBe/33QShn9MKIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5MFWdEUnP9vj/jX5gTEQcm/wFdBf9rXhqZIObbaEfI=;
 b=XQBeWeD4sxT4f6fmDVpr3GehuDHggojfgTEExptXSm9iG1rxgnPiOknFJwyssfYVqaj5pmjAPZDbI3d4rty3PzxQ5AJRBNUANqpjK8bXkt/xx6Vt6cQvywmiDaPQx8+eIY1hFXgkN53YFMoAV3eHD+x3qi7WJAP4YeDrpTR1Auo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39943f0493b8565f
X-TessianGatewayMetadata: /5TJGac9twwa3L2cOF64X/cGRbdOUIwcg2c1QpyT67dtKyqAdCymbrG7j2ixFquHl3x3f9fmIzmg7hjeFkw6QTe1WgOktYinGLNBPZYoPKoMK0nMNnYVO9XohQTULPfY9I05ruq+09b9vJtfDc4mJ28sTEhRhBTtFKVAqFlkKjc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODVVaOlCeHVJKVAa1BC2VM7VRlgWYFb/i5ogSNyV5mIjKVothcLXw4OmhwmhYrwbUm5dDYQP+aGxbfm9uWJkzu+3kPTSkVbW/wh3L9fR9QZq+FhTm+HPWwbZwwr/HQYkoQVghj9JOQj3RIOthSpaFCb1DeQWhIewEs0++fXWqirvZi3znts6wVjc3dHabTI/gSUr7EAmHpbwe59VFJ/oJ2QuZ8kOo1Z6gjbjp0erSoBm56dcTJ4WkreZmnrc9eHKSWV/NArkc8l2OsyF40ePQgMuCYrKvb22a4qU/HapBYX1ArC4NvRmSgiip+iu2tJfDhycxCjw+zKECiD2FszKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5MFWdEUnP9vj/jX5gTEQcm/wFdBf9rXhqZIObbaEfI=;
 b=xKGUyJq8SjK28WA+ZRAd4rvFNlsyDFL0ynOAL5K77y+0fSVcI9Ov5MO7jpsw9MlTLFaQY6zJYpBLw1bFDz/Zvz4gKew3G5Y51pBYDWK3TzslbOq5461u64zJKzwELnD4Y0oZGZHs1+if9LVez+sYgKSD4tfzmOrcGKm6OMqRQAATKpOXnoq/UNJvFqZK9N/ny9l1r//WtBcONkecW9DxuDcoFnAC8MphEOK5nEs//WS+f6uxGOIbJGhY3dPJDtIsVLZ83/24KATSZm1R1eZCCHF0erD1aXNXrq8tfTJzcEstVRQB4a9Dn1BCocoNdsspOXdyq8rjKyrOmCCU8GxiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5MFWdEUnP9vj/jX5gTEQcm/wFdBf9rXhqZIObbaEfI=;
 b=XQBeWeD4sxT4f6fmDVpr3GehuDHggojfgTEExptXSm9iG1rxgnPiOknFJwyssfYVqaj5pmjAPZDbI3d4rty3PzxQ5AJRBNUANqpjK8bXkt/xx6Vt6cQvywmiDaPQx8+eIY1hFXgkN53YFMoAV3eHD+x3qi7WJAP4YeDrpTR1Auo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Topic: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Index: AQHbkmScFxwSwnbWbUmo6sX8GQY3CLNtq7oA
Date: Tue, 11 Mar 2025 09:30:52 +0000
Message-ID: <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
In-Reply-To: <20250311090409.122577-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB10428:EE_|DU2PEPF00028D04:EE_|GVXPR08MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: a2dd116e-7b49-49f9-f6c0-08dd607f70dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?X8Qq048X1dx1VHj2CsgvvRV6mGrIEHew4H991+8rlvGJY/EqaanMvvvNewHf?=
 =?us-ascii?Q?cBFhywzQhxN/hJb+zZq5X0WIaE0kuRH1XG2zRIo1bQfyFgZ9Ua21Aaol6r68?=
 =?us-ascii?Q?bW6NghKYPmU3qCZOIKu9FfNyAiC6zsWvmiM4esMwXWvgEyj/sB1pJswFWl/w?=
 =?us-ascii?Q?c7npxpVMJuskeYaheajEa5Jn84jPMNx6uXeIBcNc1omO028k7TmFHZ7Hwhxl?=
 =?us-ascii?Q?W+GGCmLcc8+JrMoukcAiFuKLWG+/RiRlyBkdvwaoR8aN7VIuJPzoS09O28iR?=
 =?us-ascii?Q?Ox5Gf7ef1k7WYzU97SXNMBTg9k59lDajYzQYC7rJoPCOu/jSf8uo6ITjuabg?=
 =?us-ascii?Q?N3wtfMcfVxn5FwrSswcuhOw1xKyD9n4GehKRSKkvh8oufjGjJFLSqTng8abw?=
 =?us-ascii?Q?nyxcpaI1/z1yqOeZSGdl6nv+hczLeLfLbgL/QkTsRDuPcXiOcpsmdthriGGX?=
 =?us-ascii?Q?ECxXY3IBZo1yw6QeY046A1T+3n3pCp9GUEqNyJZrozX6jCmd55/aaz8rn+7+?=
 =?us-ascii?Q?J/RqeoiaBdqlZXV0wrHk53t6I+MCGkWZ4zg5Zi4zXvce2X7Jnf0Y+eEKs27y?=
 =?us-ascii?Q?PDBy1phMUckSnyTw3gV7I9ihwOQ6oagy7yN/C/FYhgZ89kHEmV7G+KE0oljF?=
 =?us-ascii?Q?o/YuLhzMwWyBZjRGT+EG0MnttGnWJ6lCQM1iyWVIgM6s0kh+9hO6BF/9yIL1?=
 =?us-ascii?Q?ykf72Rxwcu0s0WGUFDuQF/SQTSdSsU35BNMFsNWM993cMZXBM+IRwQITPP3w?=
 =?us-ascii?Q?+bGYycjDpxxLa1mi4jHixUrPlV/du+tZWrPc2Hq1sDriGsuPUkl5xBdE8RiS?=
 =?us-ascii?Q?fCr9jy2nZaNfZkz08kXYy2akNH+uhwpBcGMz4H797RWmzACiKofQMcNSeq6V?=
 =?us-ascii?Q?i0eHneZgTlxKYjDlTgoTyxbX2083nB9uH0gCdDF+6EXJzzuK9TzbeuB2zAGT?=
 =?us-ascii?Q?F5X2eBo6Juc7qZECYVqTqxVlp4QNQMxfUiptKIyfNTGgR2ZYQM0S46EZ7lgb?=
 =?us-ascii?Q?cDS16fQXI/Fm7u0bLSAHyEX1DLSjymfTTaakzru/pm/2UEgbJP9OasSWMk6a?=
 =?us-ascii?Q?u6siZZZX36GJLO5Tgtr3mq11IHdRSYuqUYsWwY5ZLaLfNMqsjI9Y2V9NPeqe?=
 =?us-ascii?Q?KGy7mTZ5FBxIYO5ZxK5hNF/K4u9PwErC4sxjeyEurAB7/peqvXWm/UTfs99O?=
 =?us-ascii?Q?ext359B8EQPtm5o0sGN7tU+TjDUrRaBTD4ziG/bhUXx0rCJSRn+CBy6jcOvl?=
 =?us-ascii?Q?iWWLvixR+c0cJrfaFdtp60l2782pj70gWmoyWANZMsydOyRkWous+8NVza0n?=
 =?us-ascii?Q?RuNPDfzF9EuEuFhzQDRaoh/Exlf8x8EoXTMDraV1Cu/jgvooaOwUeK4mlyQ0?=
 =?us-ascii?Q?rYuA7FujalC3XxMdDmr/oaA3S0GDNK3WICFV+TxGdWw1u3fwgGb+9p/uc45R?=
 =?us-ascii?Q?nk4oTZy32XNn4G7jjM5YS1EfUzmvuTOS?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69450265090D754EA8B53CF330FA79B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10428
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a4d4a61-7f6d-41f5-bb6d-08dd607f6b18
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|14060799003|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OINo2hw2sEqeCvyZsdaa66bbDd+mXOtITCg70kaKCJt1Bb9z6TK9Tif6AJFG?=
 =?us-ascii?Q?B6tmokJPxQNcrCJwdQ2BDZ/4OvK6IlX0muoulJjPwt/XU9gyuseQSwjMOQY4?=
 =?us-ascii?Q?UkSiZkK9v4OCtuN/BOtRiV/T4PrAcka+ehdaGiG4YGo4dTXGZmNAlnb4nh/s?=
 =?us-ascii?Q?tb/UMPvITVaGzFbWKJW1Hoz+btcsQQRHqeH+PCk5/G3d7zTfR0rXJ52e7Kl0?=
 =?us-ascii?Q?fDnT+6gXUrTWMUdP4QHudS0t2YICge2TT/CnM4U/wiKmqvWee5KaRQzc+Qvj?=
 =?us-ascii?Q?uEVnpXl1YFjvO44ycDqta3Q5Us3/IdKZksVEyNTeYA7BKGDxMFMIbspN1J5N?=
 =?us-ascii?Q?4zP+7y46HHmk4mb1G4g//otTzyNcw98kc0gVu369kOGxqVYArNT2Ew8xpeMK?=
 =?us-ascii?Q?VKRQ0T8idNjyP8O4wG88wepnEOyIoFYSWrZj7j1yY7pJejJgOrOxLGJCalu+?=
 =?us-ascii?Q?KJvWr/aQgj37lhVfJl4Y6vOFFoBAYgULOUFkh0tZq4jdgvoHgv9QUwutBaSb?=
 =?us-ascii?Q?QnmQkM8l0DmnZbf/YdkD3CfTNdvKogdm7UpzXQ/KwuHuBGtjYaL7CYofosP3?=
 =?us-ascii?Q?NL4328t7KAtapw0mRfYhQd1RSGp9uqnnqZAp0Ala22sjYWrJNxqmZGbQ2wsJ?=
 =?us-ascii?Q?091ouf+HczPZL9cMx87xY9yBlasSkJ2n/SKmH0vYFeRFbXdqnRYfgSg8Os8U?=
 =?us-ascii?Q?5N4nZaIafzs73lMMV0ZDRUXfDSUbiRxKFWP3SvD5Ac2ybqb7iDkaQsRBJBcp?=
 =?us-ascii?Q?cAh2h84V1ujmssjEdSlC8hjLBtSpUkISMsfwdXoi2WmWL8GhdUllBd4Uc+UW?=
 =?us-ascii?Q?MaKbw0B0Jx+Y/+OCA4r/Xoh98UUGueQkxdP9U0wVyavq9FFwy2LXg6OuSRuj?=
 =?us-ascii?Q?B5+25oQxMurCYLUjHc+sAAVbCg4lhAwv2u4JeXNyln0yVbI9zbY+NdeeseXN?=
 =?us-ascii?Q?we7XTWDeccf6o40rJEEOevCfXhqnj63eKv6y1K88dNdSVl0HZ/D1FelcO96u?=
 =?us-ascii?Q?YJb0+c0daRC4JKa4vGQhqGBf231yI3G4nWwiLSwUG0oFCfobGNvN9KjmNuI4?=
 =?us-ascii?Q?hOW0U1isVgU3ciVsk7K7PL848B8wz+GBqx8S9ucc/iFCeMN8mQ3QOEuKOBud?=
 =?us-ascii?Q?+3wN07UWq/E6FCtKMljAve02mLpR0mFn6DMcgl9hsRhCdzAF/mHSV8wCt0Ll?=
 =?us-ascii?Q?vsd7UShgm/ONfpaVJiHsyl66f/APMEZAREdWHHr9+6+ADTC1Gkv7SWwX5yqW?=
 =?us-ascii?Q?dcfuhv8ZSWWYg9GBxmygrTPjsSriCfYDlBjCRBffpsgm7uToUcZY26nf69J4?=
 =?us-ascii?Q?9iW+ov3N3zCvEa8wiyXWicz03p5zUfosCOGVn3qPK5QNmVa6TBAr6vd6T2ku?=
 =?us-ascii?Q?IVIxLz5tv8lGjIViLibqKDVvru7SzIf1VeFMLbvCrASomwkx7SLYWBofnt0H?=
 =?us-ascii?Q?W8AXQh43doB89mcWag72/EGqvy5vGPCTnypc6fWbSVBWhJWTKFHY8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:31:02.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dd116e-7b49-49f9-f6c0-08dd607f70dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10520

Hi Michal,

> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, we print a warning about max number of IRQs supported by
> GIC bigger than vGIC only for hardware domain. This check is not hwdom
> special, and should be made common. Also, in case of user not specifying
> nr_spis for dom0less domUs, we should take into account max number of
> IRQs supported by vGIC if it's smaller than for GIC.
>=20
> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
> IRQs comparison common.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> xen/arch/arm/dom0less-build.c   | 2 +-
> xen/arch/arm/domain_build.c     | 9 ++-------
> xen/arch/arm/gic.c              | 3 +++
> xen/arch/arm/include/asm/vgic.h | 3 +++
> 4 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index 31f31c38da3f..9a84fee94119 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>         {
>             int vpl011_virq =3D GUEST_VPL011_SPI;
>=20
> -            d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
> +            d_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_IRQS=
) - 32;

I would suggest to introduce a static inline gic_nr_spis in a gic header ..=
.

>=20
>             /*
>              * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7cc141ef75e9..b99c4e3a69bf 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>=20
>     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -    /*
> -     * Xen vGIC supports a maximum of 992 interrupt lines.
> -     * 32 are substracted to cover local IRQs.
> -     */
> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 992=
) - 32;
> -    if ( gic_number_lines() > 992 )
> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n")=
;
> +    /* 32 are substracted to cover local IRQs */
> +    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_IRQS) - 3=
2;

and reuse it here to make sure the value used is always the same.

>     dom0_cfg.arch.tee_type =3D tee_get_type();
>     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>=20
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index acf61a4de373..e80fe0ca2421 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -251,6 +251,9 @@ void __init gic_init(void)
>         panic("Failed to initialize the GIC drivers\n");
>     /* Clear LR mask for cpu0 */
>     clear_cpu_lr_mask();
> +
> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");

I am a bit unsure with this one.
If this is the case, it means any gicv2 or gicv3 init detected an impossibl=
e value and
any usage of gic_number_lines would be using an impossible value.

Shouldn't this somehow result in a panic as the gic detection was wrong ?
Do you think we can continue to work safely if this value is over VGIC_MAX_=
IRQS.
There are other places using gic_number_lines like in irq.c.

Cheers
Bertrand


> }
>=20
> void send_SGI_mask(const cpumask_t *cpumask, enum gic_sgi sgi)
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index e309dca1ad01..c549e5840bfa 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -329,6 +329,9 @@ extern void vgic_check_inflight_irqs_pending(struct v=
cpu *v,
>  */
> #define vgic_num_irqs(d)        ((d)->arch.vgic.nr_spis + 32)
>=20
> +/* Maximum number of IRQs supported by vGIC */
> +#define VGIC_MAX_IRQS 992U
> +
> /*
>  * Allocate a guest VIRQ
>  *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCPU
> --=20
> 2.25.1
>=20


