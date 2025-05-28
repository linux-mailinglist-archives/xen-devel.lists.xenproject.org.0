Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A899BAC65AA
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999207.1379960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyy-0004Vx-UQ; Wed, 28 May 2025 09:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999207.1379960; Wed, 28 May 2025 09:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyy-0004Sb-Qv; Wed, 28 May 2025 09:21:56 +0000
Received: by outflank-mailman (input) for mailman id 999207;
 Wed, 28 May 2025 09:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvk-0001jE-Lp
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba54bcb0-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:35 +0200 (CEST)
Received: from SN7PR04CA0171.namprd04.prod.outlook.com (2603:10b6:806:125::26)
 by IA0PPF002462CFE.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 28 May
 2025 09:18:30 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::64) by SN7PR04CA0171.outlook.office365.com
 (2603:10b6:806:125::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Wed,
 28 May 2025 09:18:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:27 -0500
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
X-Inumbo-ID: ba54bcb0-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjuELbdaXhMWVxsUtaaXb6HSARbxXtQK5BDHkdG1PybExbzXydwlefr2wYOKfhfVoidz3LEtJBxEEj07MjCEWLEeHwmc/Futy9xknwFnjYuR7xLqvZO+3jNqCtbI178/XrDoC3hn27b9dtJ2mMiMLr/N6GAlUoSj20h5borO2Oy0fI7MXN/0EftSSunNHjClGo1w88xLvzLL6nFw/DPqr4MPdoxQ6SHmOt71tqw84Saz1SPMycNJlGzLhZVuyqg8STVwoy9fF80Vs3lWOds8lVnzjNX507toYMuRY+mCQMKknXwtTHvqecFrokwTnGSNkvjszcW4XVfAVkas7RVn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOftosmSTRdHCsGYzRWYjX+g0KG6mzuEbqn5MK0YPV0=;
 b=vG7J7SnWDYB5Y1g8wLRe0pWwTTb3jTgfjZoonwUcQKK8NCvFvnZU28KTTLB0nw07dZJB2JapfuZpyqwqhWBLKX3ZRRqxG3H6CeHc1rxhd/hdn6W+pWY+rCqWyPdX6mjrkJIz9NCZLphB9GGJYm2Q6d/TbaL9Ciy9Yrphh4qlJfFmXam+WAnxstyCSPaktPIvU8ULPyYsMmdI/XW4RLexwBqPF1uUDQvhR4bxmG/iNpS7j+tJuk4sNVqocgLqpvOZKebUrleBWW/MAYUwvLFEpfDTGct/SQa//qyyvw9+VZvsNx/Jr40SeBlV+VKbG5Ql4pGq114HNya7Qf+zmaCtOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOftosmSTRdHCsGYzRWYjX+g0KG6mzuEbqn5MK0YPV0=;
 b=ySbxMAlrwrsP2rURHoE7A3ucJeJkTG/pL1I0WEIWZj+cvlIjrVZtznO+41ITH0gWHR5s7N95WPCzpcNpl9tW1X+bKyFybj8szAzrp79gcOk7Z6175ZOLdVj8av+oN2iopYTspFU5EopyJHQLr7flXm8MHBNknfDIjJCMQt+dDRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 18/20] xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
Date: Wed, 28 May 2025 17:17:06 +0800
Message-ID: <20250528091708.390767-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|IA0PPF002462CFE:EE_
X-MS-Office365-Filtering-Correlation-Id: b078c20c-e79b-4a94-1842-08dd9dc89c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wpeo6lyzhNUFuzEHr8kFXHf2zVTG9Z7ZasZHdfWLMjE1huzNK0UcrPNqvx6D?=
 =?us-ascii?Q?LbHICavaN1KdluO8gt085nBdSwBBtJ/oKLiYe5pH9cQZ2GymuV+nnWI/5XIS?=
 =?us-ascii?Q?UbxG3cEvV6/dKw0v2ZiHuJhKbIaoKIfRc9HOrx6BsQBpz5EqVPkOt1HL4xLI?=
 =?us-ascii?Q?7y/d4DosvrjhZPDgeu+6HWR9T7EqNGb/3iocm5Ewg//m0MTwH+AuP0YOtbMo?=
 =?us-ascii?Q?vGEyMtXI9LpaVCU/DoZRgl8CArueid4R3XTMdsdVk2BkLthe934i/cKYvi/2?=
 =?us-ascii?Q?Qpd6XSeiv9SpzFL7ha1ov21nV3y+p2Hpr3Oa/31jsQQrQ2Be0eBTDbhbEV1g?=
 =?us-ascii?Q?MW0dXnUUH1MoAH0CP6CaqvoIBsZ6TlULGW3p8kO+63bFSmVNBbQcr79w/QMN?=
 =?us-ascii?Q?IxOot0sr8/OA/GPkjO+N9W+9viDP6Ok8jDyFfIREhrHi9zPz9s3CgH/eswXM?=
 =?us-ascii?Q?m30gNGJN+/xSP4wsziceHt69Shp0QuzWXXYGMM9zSJyA1sLMFOyQYMQ9IpbY?=
 =?us-ascii?Q?mLWb9yDTms3Azn9KwY/S0nKDcVOsyTWYfex8+9JLPkEZmsPFGOKeSzTf28M6?=
 =?us-ascii?Q?mBdOmac6/KUDvNdLrihvWvaTgGINTyUThugK70SsLUaCiquCZIp5xd6iGaXV?=
 =?us-ascii?Q?SB43mIkyHrB1O8dtdbLrkbuW/q+2U8RtZIzPjj6TU/zNipJ9Jh+pBkmv7rH1?=
 =?us-ascii?Q?s8esKLFlHq2R6TRvc5tmg5CnVK9Py7is5JyLcjpHG/DPnuMg0Ld0/2dLKPVP?=
 =?us-ascii?Q?zeY7gp/D/XxAVVrtL8+I8stwX2u4cfwhN3VSda3gne7+MlOH5FbwzM3Aw24/?=
 =?us-ascii?Q?YbzV5mNTgiZoHak9qMBuackOkM+KhSC83YaeoAOHoVdxHktSWqcyb93Szknm?=
 =?us-ascii?Q?S3l99LrSJDiyY0BJKs70vcKRDYoCvHlCpDv/zYvBDqgzCDrC7N9pXy6msVFB?=
 =?us-ascii?Q?8H2O2hLePvMjrk/Kxb7I7rUWtO09+oosPZzLxora3MDck5qM6H0g4bvcWBnx?=
 =?us-ascii?Q?S+7WrWsQNOSNcPcou5vx6gSRRFY+iQY4UHXA03QQLoUqKaMliNoS35HlZNzO?=
 =?us-ascii?Q?s3FA4OK9RHbfgR5ceL2UH5uwoAC/LoR3gB7vfD7i62+Xu7aZuVw5nwNO+ocS?=
 =?us-ascii?Q?DDBLrn3T0GeQovTplNyKwD8lONpm9nZMVzWrTLS+XD37nGp2VRZBDpfI7Mz8?=
 =?us-ascii?Q?DXIw8ossZzKK7NprTWnLAQTKmIcHTJY7dhiTaSJu8hA66Q5wBTDOyhtwc2pT?=
 =?us-ascii?Q?zX0diDLyBKj/sWbpMVyp1kQMjGsC8b0cwK+2W2rrfhVi4pff4XlHVBvd6SpC?=
 =?us-ascii?Q?yQ2HSErdlnhEHQazJBs1ExbdGXdzRuX6I9b85dLe/9hgDWXsWEjNPF+/nwBX?=
 =?us-ascii?Q?dzqhDKsMdPN6lWintESM0l8cuCYvrDU0FaacLd71I/Dnh+MS0BbGHDOZUkLA?=
 =?us-ascii?Q?mePuu/TnWm3ZTHf18gGeL2jEACH3zQ5W7uBWW4DpYMSOj91Cmz1FXlnVEmsS?=
 =?us-ascii?Q?EnsvW6lvLi7wU3/VQUXYtJi6ikLEOlqAHvn6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:30.1464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b078c20c-e79b-4a94-1842-08dd9dc89c8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF002462CFE

LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 9bf632973e..e3b6fd6ec4 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -455,7 +455,7 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
 	select CC_SPLIT_SECTIONS
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
-- 
2.34.1


