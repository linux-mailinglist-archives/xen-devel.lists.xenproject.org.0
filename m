Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8AA4FA22
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901994.1309980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl6X-0002bj-1m; Wed, 05 Mar 2025 09:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901994.1309980; Wed, 05 Mar 2025 09:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl6W-0002Yx-U3; Wed, 05 Mar 2025 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 901994;
 Wed, 05 Mar 2025 09:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpfQ=VY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpl6U-0002Xz-Qk
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:31:50 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a99c5713-f9a4-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:31:48 +0100 (CET)
Received: from DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) by DBBPR08MB6105.eurprd08.prod.outlook.com
 (2603:10a6:10:20d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 09:31:45 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::de) by DUZPR01CA0307.outlook.office365.com
 (2603:10a6:10:4ba::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Wed,
 5 Mar 2025 09:31:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Wed, 5 Mar 2025 09:31:44 +0000
Received: ("Tessian outbound bc832f6acacf:v585");
 Wed, 05 Mar 2025 09:31:43 +0000
Received: from L02102847e657.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40AEC814-C4DB-47DA-86E3-4C30BE417020.1; 
 Wed, 05 Mar 2025 09:31:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L02102847e657.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 05 Mar 2025 09:31:33 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DBBPR08MB6074.eurprd08.prod.outlook.com (2603:10a6:10:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:31:30 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 09:31:30 +0000
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
X-Inumbo-ID: a99c5713-f9a4-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U3YGKUY1KZfg4z6VsBdCYNOOoBuFKHlevRX4AYrqDAP2UvLCBNti92tBGKIeFc8gCtyxSmgQnjz2c06MbomGVCM5ZTylPCanQ8R4/TLu/qrg/NuI89nsigjwwnVjAoeN3X3PXQp6Pzr80ZYAa7D3S/NsnYmNB3jDXVMGo6uQgLlmGo3TxurPBqeU3Yx7OtdL+PUfadysNZMQLyW7Elde22aiYlge++tB4JpG3DLfaSfUiwJmCrPWMJE0/JqPgFGG5ObS4DscIS4yO10Y9I4sNwUwugnR/jnEAUZEh8qL7sp0BZpBkH+DTNZHq1mB0Ui733i3dBxGeCghQqw5cmDHVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjyjR77J+79eh113GD6sGyDIILtCHJFfCAmwTrd5IzQ=;
 b=G6/NZXmUZJTGoBcRVl58LpzeDJ3aGvYXZtzztnfjKfxEwmTp3ihJhV4p+qJs4+K+fm18uNoF2TkhzAijUI+SdyFovoXc12bJ7fHm2/6OSTYqmNwqxaAx0rq913GvqRq7mPhZdrSacDu+NgQv5AsU6H3wx0qTO4QlwjH4tchL622T5Pv+hZDFVkvMAjGA70kI/kzFsYXbxCZAycfkRra0avGlZkdMG9CY96w9Ur2YBNu751wVEG9Iy9iMiLrC/8lplAUJliF5jQAudGQ6SsEKaFSEDWPuTT5j4cwiVaG8rIrQCFcv3kGbFCyEeKRomxl0DsBGimcSqCaXqlUZcogQ9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjyjR77J+79eh113GD6sGyDIILtCHJFfCAmwTrd5IzQ=;
 b=MGtsMctJFeIMQE26vkzm9CnJC7OtncF52/ElrbrYnWsYsr7YOtWmMggL/akaXpcr4oK6NQgmh6rWV5/x2sjnY9s7EY6M4RJyRDcPa6K4y4rWDRs/JhQ35hUErdDMzIN8MlwgmLejCiSX/ssUnWS51hvm/hCZYGS/0n1wp3qBSWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f651c6acfc3f125d
X-TessianGatewayMetadata: bpkw4H1uRbpS2+UdANHrazcM2U1keQx/QeeDcX4zyQMoIyoeE5iaTbJF6wjQzwKngifkDaMfW9oSQMDmqqGYjeW7CBbqK2UVYzUjAktb8NUbIAzYyrvyde0EPfwClLZz13AhNlfneAA6Vn0TwKTTsbEnN0SH13fFz5X1LIAel1s=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlfDaOupcI5g4tDFCRNv7D5Aepndt6a0EZ5yFitl6jL8sZKz0vowHJhb1Xxl9Udm3dtipw1o3BtYNCj43r9MALneql0ASLqEdTwVA8/M4IVIsWxuet+G6MRCfPP0cLXCG8yD8OymtcQTfSWCW2mnjSJ0JPtsYglSjKteuxP83LFOT+FwonOnFrRswIxS9bzYh27++lMDEoc64tWmaEkmQfrp2VD2ByMeYijgDJgUPmZab7zf+a4ly3UB8ai4tNF2hB6C/1XvICtcmVyfQtAXq8kdTetGyjRndYPLWJWU7KDcyVuKBqPQ73CI6+GwXaKSCTC8JL9lwghtxY07987eXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjyjR77J+79eh113GD6sGyDIILtCHJFfCAmwTrd5IzQ=;
 b=oI/EwvN1gkLOgBf3Jq1NORL3lTO6mVedv4pHexlohbiPSLVEIg5USfYMVFAjSJF8QUqaO+KHrpX1qUTAFOe4jtiVWyOo/asjHADuex3q7Q0kjONAhvqj1SA3MD0Hs2EBLLVa0pKgL920LYYuFDYvTvfS60y/nj/VbR8JVZPPHd/8SIlRR0xHnp8c0QKN84ZEmABDg18XX7Y5sg75okcwsJ/1wcZA81jw8p1/Yvp+MeavjmpdvHQPpUnbwY1pNx0XAq6Eex5pWg2FzNv0+t+plflGt3ObSQgNvaF5gIEXvrFpQFRJmJjVqiZbv5h2I6aZvYDIzPTIKqgNPl9qDWCf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjyjR77J+79eh113GD6sGyDIILtCHJFfCAmwTrd5IzQ=;
 b=MGtsMctJFeIMQE26vkzm9CnJC7OtncF52/ElrbrYnWsYsr7YOtWmMggL/akaXpcr4oK6NQgmh6rWV5/x2sjnY9s7EY6M4RJyRDcPa6K4y4rWDRs/JhQ35hUErdDMzIN8MlwgmLejCiSX/ssUnWS51hvm/hCZYGS/0n1wp3qBSWI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/arm: mpu: Ensure that the page size is 4KB
Thread-Topic: [PATCH v2 2/2] xen/arm: mpu: Ensure that the page size is 4KB
Thread-Index: AQHbjS7ssDK5AjPkJUWNUGxv5wptWLNkSD4A
Date: Wed, 5 Mar 2025 09:31:30 +0000
Message-ID: <8CECC290-DE5A-4DAB-AFED-673C93DA2F18@arm.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
 <20250304175708.2434519-3-ayan.kumar.halder@amd.com>
In-Reply-To: <20250304175708.2434519-3-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DBBPR08MB6074:EE_|DB1PEPF000509FA:EE_|DBBPR08MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: bf628d01-7432-4310-58de-08dd5bc88b48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?AjEXSqm67VGYTJGu7FPW6o8BrP94OVV+bY13FjgAsIVkdAbpbF1CWOrcvj1R?=
 =?us-ascii?Q?BVYfAXQMn03tV+D6XkGjyztU3WiHL9F4tsT52wBWqn9YPgrNGDcoJktfat6v?=
 =?us-ascii?Q?suHJCCpcClL7NE9ZwXO70eN0oDqONsPm5NeR3rgO0SjV6KUNqC+/0qI0Y4KA?=
 =?us-ascii?Q?Ggd9pMIt8IexnKqjFFBWdGX/0k8ILgPmkBmztBLLFdSHaaERQU14Mw5xsQ8e?=
 =?us-ascii?Q?TgIiTtc93wqD9sq3q9dGQeJhpeJLGYtgm2YehLwAv+7fn++Tk9h/lgl4WJTE?=
 =?us-ascii?Q?dsGkP4xBt+KXdG0vS+D2ybTT0xIuOXYNXTC2+NnSWRY/KJfX0jM0FJnA3Al9?=
 =?us-ascii?Q?B4quDUiImbSwuTQOnjH3cilfBgcFkVWZX3wxErqqGHN4nRtlKnAdv76qlj6C?=
 =?us-ascii?Q?EajYvXnHh5m9SFUD/lIkkLw6L3Lqz7/0XsJmrXh12wXIHIPt786R3j/u5u1G?=
 =?us-ascii?Q?L0soPtWXqvtZO12QxL6i3qNi1rh+AwrtFwIoHKYgqgXsUS/qdgots12EThQT?=
 =?us-ascii?Q?sKG3Or6ilty4Y6Xgas0i2frZBr6whXWzEOUKIwWHXSV/bFG4Jvx42AufrRnp?=
 =?us-ascii?Q?Bi5HOOhA25VxJAC57ZOH0Yprv/Kunbsj3VhsSomNk/6YoRbGOpYDm0TssdaT?=
 =?us-ascii?Q?dn5kEZxv+LDWwnnzIZqtQoqXBHRJ4Ut54r8A8vOgPRUPm91g/Es+YrWTujOI?=
 =?us-ascii?Q?O6Ixb3s+rIvCkcmaEtoo7f7kpZSzZw/lDYjtf4PdE7a8e/kL8sHfq8Cs4xlb?=
 =?us-ascii?Q?WgVQ3meCFB0ASflilegFMDLu1Dy4Wh0WUlDUhcsbfGty0Da/gVGlU9pn5HxM?=
 =?us-ascii?Q?BZ3+opt1QqGaGTxb6HW9A64G/hN6j/0L9HMdSUYWlO9c90kHO4A6wSVyxIr0?=
 =?us-ascii?Q?P3wymVywEtDCLgPrMlFUI8rETjx1gvG0rbQk5uupw+d7xaD8QT6EIcyfVbft?=
 =?us-ascii?Q?+JdA1CjKEwfPSkZZX9Z9ZNvb6aEOLAhAfLwXqR0h+60Qrb28bmtXA9cMynwS?=
 =?us-ascii?Q?4TPrkF/H0YbxuR7eEn32Qt8bMUYrEpvGMpRaV4ZKqjo385ipeGGo2e7zu2ZA?=
 =?us-ascii?Q?i0tQRaZN5G6NuS6raftdzpbgzX9n0xdfPfzfOX8LLf+fEqjPDyMtbRerpPeq?=
 =?us-ascii?Q?TfeAs9EwKkAojFuzXfZkGnBs+7+jX8b3GFjl+k6+KQ68S0KpdHzfD96OIKQ3?=
 =?us-ascii?Q?QYu+yIV1imRImnMYg0eYEmTZ/iwfDwcZPfSfUJ58QetMmy6FCd3YF7TNCUx1?=
 =?us-ascii?Q?73upCke8AoUVmha5df9MxaFD7ikY3C87MpiNh1SnTXshl3Z3W3sRz5JIsmAY?=
 =?us-ascii?Q?BKvA7w779J1PxY0mYf5p8lMpiYYTifJwdlc2DvGV2KCBqN971nQjcRKeelHc?=
 =?us-ascii?Q?K/zSkLQXENPdd7TL72CBGClL/eiEOH55RVbuOd0B/X+SS9f9Qrm0zZtnljNs?=
 =?us-ascii?Q?QVjOz88ZHIMVN3x5vEOVL3ub4bziWXY/?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2024C37508C7D648AD99C6EF5FF5C22F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6074
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	731d1275-97eb-4742-55c0-08dd5bc8831b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fGls2wZGrbNhO2hRQyaJsdTZRhBgb240Z+HlQolq3AzaeffGFCOl4elZoxkK?=
 =?us-ascii?Q?JgoIbG49O8S2vSmvz3niwCZWPAijvbxVni3SL+iSUaMtuJ/0eXuoo4i41MWy?=
 =?us-ascii?Q?VihirDHilU2FZ7BvTcxYAMBDp7ImS/T+ylSitxXsxZ6EoNqHc0EM2IEzsDPa?=
 =?us-ascii?Q?bmPk3kopm1yKQTLmOux3hUDtO8YueoZtMnZmy5arCou4oIEXow6LdX6xCLFR?=
 =?us-ascii?Q?NeB97RlMkKowusSE8X/rpMQAuFZ1SHmAchpwG3HFMf0rDNzD5Ur1JgMqAtX2?=
 =?us-ascii?Q?XhfJcRQEkQfnsPHUj3WukL0G0NrxVPnP5Po4x3zXPOkqEX4HPbMN9IH71ME7?=
 =?us-ascii?Q?S7iIaKkm8IxpFgh2lgQ/sdvIJcHxbYvrhkh+jByiKwucpTikP53lV9Scn4YD?=
 =?us-ascii?Q?3RXWDem4JJKovvYnr9tfdFqB1MOoK9g5DexHVZuwilrtuFqo6M8HZDQqL5Cq?=
 =?us-ascii?Q?843n1uzt+EGwhZh9GhSCvJyOFZKKFZCHdiqRYwIgwLW7T+5InwvBZHhKJCUa?=
 =?us-ascii?Q?nl/yt3rLkJklWGPAyo81Yci7rV6203+IlnpHT3MR2+jVGwEiBn9AcKQW/7bB?=
 =?us-ascii?Q?Ojy00Shvbwr8OLeGQQTYf1BSIQH4NhLMKsN4CxQyIOZ2TWPrDWRaBg1IneHW?=
 =?us-ascii?Q?IqPCOsmCkvgbmFf5lBwmNezxwlJwNSKtHpiZkK2TaOvCHBw40uMEbqY6lghe?=
 =?us-ascii?Q?QOEpIuH2h9oKMBfYHlrl/h/K0Yk4MiH/6W9W5RCNjVI9X27gwMJV+u4eEUJk?=
 =?us-ascii?Q?Aiqo6Jvbzyht0t5qfF1vbCBNSWzTBarkH90DF4/a7nV6NSqYTcZ8uqKKgadW?=
 =?us-ascii?Q?gWJKwu6oS9alCpET50NyUg+jXg+di2HcjwG124a2WgCiTgBxIyBXy4lc4/ka?=
 =?us-ascii?Q?DHfMmxGXLslqYzGVmFEogb20EJU5KM25MWgz+qAbo2WPZOvx8qC0KlC/TvSU?=
 =?us-ascii?Q?i+2pOpHuubHd/0eQIGwbGqL25PvM1Jj6lwSukTf4TYMREIzRngY41fBA9Swf?=
 =?us-ascii?Q?Uu8D9z1q+0fBk1KeMw44A3jdIa2N6OonVIVdBvUZrAqTU/HvR4znao8ILPTf?=
 =?us-ascii?Q?Rt+e2DxRNGjZX6knoFF7mJ+leWmLTKQYSkBzU6nMoD+gosJ2zj0B6Mw1jO6d?=
 =?us-ascii?Q?e/l5Q4/wXClHuyb6GhDWxtWfyCXxysw3DfeSxqhWv8Blu3PXbgdUYM2Jr+HY?=
 =?us-ascii?Q?W1ODyMRCy/LOFR5f017XyLVJ566/cs6F0nJwMLy2kmbOyQlUIscL+YTuOMUk?=
 =?us-ascii?Q?aK/RLDi0PDc1942C7Bazm/mBw18NcXrNJBjjwRgTx8EfhKsg10Tx7cX1/k9W?=
 =?us-ascii?Q?ZlrE3nCR19L6cZWFeGYLmS1bdxRM6VJm1ZOFhHH9VznxIyqYYYEp1A+qF+lA?=
 =?us-ascii?Q?nbunXE5b9pPBzzJFAPgOe5mzNzP4by3c8IbAtF8ORU9isSpgdzfI2YZjrm9/?=
 =?us-ascii?Q?DIugykW7RRPdUqQ14OTJECaDkSfHONgNzwTPeMktcC2+Wl57/VGUGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:31:44.4839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf628d01-7432-4310-58de-08dd5bc88b48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6105

Hi Ayan,

> On 4 Mar 2025, at 17:57, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Similar to commit (d736b6eb451b, "xen/arm: mpu: Define Xen start address =
for
> MPU systems"), one needs to add a build assertion to ensure that the page=
 size
> is 4KB on arm32 based systems as well.
> The existing build assertion is moved under "xen/arch/arm/mpu" as it appl=
ies
> for both arm64 and arm32 based systems.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



