Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D62C52FB3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160025.1488263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCgZ-0004LV-HK; Wed, 12 Nov 2025 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160025.1488263; Wed, 12 Nov 2025 15:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCgZ-0004JR-Ds; Wed, 12 Nov 2025 15:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1160025;
 Wed, 12 Nov 2025 15:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJCgX-0004JE-8o
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:23:01 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 781946b2-bfdb-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:22:58 +0100 (CET)
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:22:53 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::c) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 15:22:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:22:52 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 07:22:51 -0800
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
X-Inumbo-ID: 781946b2-bfdb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIYrsoJOO4JP/4NSViIpru5xAsxEHWwTQsIXXHpVijUqnWMMfFJpJTHXWS78ixkEAUi92NScp2inMUoNDOJGwOENCuVAP+cmtukqRJdm6LgL0FtBlMQvDoO5wlirYI50FSzjdH9FKQ5N+Ri2MfBiotRwYfZrLjRigQ7ZEvqgHcC5x0JkS5aQunpa9NOxy5le/UxwgwosJ8XGogO+DCNaQ1H58TFROtkl7tiWR0bTDP35VOaQS9ApNZDyc04lhII3Vz5Z6Cd4crJlmA7AqJdTLpq5Nm0hG4hO9BaPgMobJkOoQ/slEW7jRNA+bQ/rLx1gqcrtIDhYvrtyedlLMhUwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX8R/jW53mU7NUcc3K2eBriT6B0nvPDZPTWwrtrazdE=;
 b=mGQNsdGRqqS2Xx0dV09m4QwIzY8cIgOfyFxeDeqtsnVmvQCRPHdBD6msSDkF67gTnOxPpCQoVJHU2K4tfstN8FKVgYeSg/B3O9S54S2aHw/eoqGxtJxKPaaFwPr3M9icTdwh/pzOJ1Gv4yErMz0ULEitbuBKgUj0ozeC9FZxzdUYxVleebPpjhdo1cn6xHaqhL2A+OHVYlMqvUuESq89ntlDpkgudkFetNvoUaGDMg7+bYTPfB2jSl471O/S76x8mRbfUx8+wlK40kJWhgKq8Rtr5OyasOGLZ6VvYEmqlWjlB6apZkKLezWGF9641xThBDzuDLEqwKkwFp/cVLUuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX8R/jW53mU7NUcc3K2eBriT6B0nvPDZPTWwrtrazdE=;
 b=TXOFjviL4qOTIuNKlsFfSjIKoeD+rrGPkDvZNuaPa4eunpvox7wNDk5Bw1f6HBRz1tbjppk2TxLqTXeC/3DxhKyo31f8QSsxtAtbPANsCxCmy9oKm+v0GSCR/xvG2RBrhhxex0B4ar9ShggwbDtrQkgBP1iFF3AtuU0h7FVrMfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] Code removal for !CONFIG_PV
Date: Wed, 12 Nov 2025 16:22:29 +0100
Message-ID: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: faa1f061-4588-4b46-5f14-08de21ff590e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8au46VFR4FkKiqHHKU27H38RD6RfZ4rVc7YbNOTdd1plw3uVX2uQQrbld7OZ?=
 =?us-ascii?Q?rImf1xHxcJsgmrlw3NZFS0LMHGsQ2vseW68LXaf0p/vM67KAkcqvrarI/h/l?=
 =?us-ascii?Q?Oti/QxDO99XCLp9HJk+gpDEJhl5/DOGFLDQzKKMXZT78ojsOYEBU6XaISvJi?=
 =?us-ascii?Q?jqqmr9Q3MvtIbO+vUlvltiO0d1isMG0lY0UFHaToGXnzhxFilTSQPyGbx25w?=
 =?us-ascii?Q?tEBwB/lDRSVZbS3PVRWdmpHXHWVHTJcu/0tkrK5GD8gl6T26VunYKDg43x98?=
 =?us-ascii?Q?vnBVk6obGZZOTUx25Ho7hvCt46W+bMBMS2SBixUr2gebFEWBrxU0NdBZ6nkr?=
 =?us-ascii?Q?s14C79kWKEncNxS/StzlRVIFjtMPxdgNlwei4unh4i4NnYuqPyFq2NtKeYZg?=
 =?us-ascii?Q?1SVyIoJegtIHE+Hy4Wr+UetewRLkhjQ/3hNfTP+5W+U/HY594ovvEzZJaKxr?=
 =?us-ascii?Q?0zgch1UT02NKUws3hG6fh3OBDpPacixeGInHGm8XUP8pTVrGxeTPMxYkHqNB?=
 =?us-ascii?Q?gZ4+E1YSIAEbADPNqP5WFZ59RIBDLMCCZ6bGVveVv5S1WSGvYXmkpM7SDDfA?=
 =?us-ascii?Q?yrK6trNHFm4sFmZzSLr94hCqtfj2rCnYgE7eyUicZB6NzMs1Ld7t0pUsmRrB?=
 =?us-ascii?Q?VwYD79ZcZ4sbPXyUsRu5ReQWK7XmeUzDyK5lfiTg7zp1QWMsrNx90gE5L1yL?=
 =?us-ascii?Q?ZJ/y3FIE00/+/vMfghTiTa59GNcGbr4AS5Tzni7Sqww0OAGiFEZ4R+ShatHg?=
 =?us-ascii?Q?GzsZMnZmZmraFqMrjXMGQZ5fuYm3LK9ttxSvdy39tgrAabUuQtV8N0LeF0ce?=
 =?us-ascii?Q?F2zWlrX+CzKtysFs4pXDJhdJtG+BeVoIquY02Db+qUgtI2LrExQXTjbN27h5?=
 =?us-ascii?Q?ivOM6zOhxOrs40moWgaVfhg2C98Tf1KWUCbLR8RYojC7A1ZeQc0kODor3hxi?=
 =?us-ascii?Q?ydM8Z9hKGveALwuV3rCIbXs8tkLVTRuMBTqiZmFijBshopahsB7W3XC3CjS5?=
 =?us-ascii?Q?8Dfd5optZL66ieTmK6TH8n+TD0kW3ZFLoZsLUjt6a/m3VdytafLGJ7GXcrrm?=
 =?us-ascii?Q?gdy1g+WKUh3Cyo9O5HrcOCCKAd3XjIsqUjsiZkPpTGWssxliglJwlmOdDgZ8?=
 =?us-ascii?Q?vzP2N52iC+Z3JKljnfl8MXIi5CbWuNAbOP0o6jVsUeEgnpjP4sfgWwSyteD6?=
 =?us-ascii?Q?FR4AfwVs5VdMHV5HLVcWtBduVh1QAIfrgJgZeBoMr6AhCrDCtEGbdbiPa2bs?=
 =?us-ascii?Q?erAnA3E1j4gwvTe5mISMlFQYVpSENJspRd7vWeegYb0YuWeufaTUn4En82h2?=
 =?us-ascii?Q?+zQfJOhAR/SX+XteXbaCn8v/FZ3vstahWKnXwXBtg4I/eHnAILqyWYF37wnc?=
 =?us-ascii?Q?Jk+HVBCiL8MRDeEhaWKmC4s84YkFeTmhZ/t0g0tbTUUHQNrHW0A0JEhC31Ex?=
 =?us-ascii?Q?WThp9mWSaBVc5EYuse84UF8pObT0Fj1NUxph5W8xWUx8rgrnqZtZKrV3xhr6?=
 =?us-ascii?Q?v1BIhK6thlYAwhS2Q7JNMfmsWlR69411eWUPxm/SSwxOBJW3tvTCnq4LJc1k?=
 =?us-ascii?Q?L4J9ufkfifppOBRYJd8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:22:52.6339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa1f061-4588-4b46-5f14-08de21ff590e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816

General cleanup, with marginal binary size reduction in the !CONFIG_PV case.

Some PV-only code remains in the build when !CONFIG_PV because it's in fallback
else branches and there's a number of stubs in asm/pv/domain.h that are either
irrelevant or can be made irrelevant through trivial changes to the else
branches on which they are used.

Alejandro Vallejo (2):
  x86: Conditionalise PV-only fallback branches on CONFIG_PV
  x86: Remove stubs from asm/pv/domain.h

 xen/arch/x86/cpuid.c                 |  4 ++--
 xen/arch/x86/domain.c                | 10 ++++++----
 xen/arch/x86/include/asm/pv/domain.h | 25 -------------------------
 3 files changed, 8 insertions(+), 31 deletions(-)


base-commit: e00c1673992e07ed31e9c60fefa8d053491abbe6
-- 
2.43.0


