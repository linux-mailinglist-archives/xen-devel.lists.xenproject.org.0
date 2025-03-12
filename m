Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE1A5D507
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909833.1316763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQu-0001Fc-FJ; Wed, 12 Mar 2025 04:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909833.1316763; Wed, 12 Mar 2025 04:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQu-0001EG-9G; Wed, 12 Mar 2025 04:11:04 +0000
Received: by outflank-mailman (input) for mailman id 909833;
 Wed, 12 Mar 2025 04:11:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNl-0007Fd-8d
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eaae1b2-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:48 +0100 (CET)
Received: from BN7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:408:34::25)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:44 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:34:cafe::71) by BN7PR06CA0048.outlook.office365.com
 (2603:10b6:408:34::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:39 -0500
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
X-Inumbo-ID: 8eaae1b2-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehZKLArNo+g2hkYGs45gAzYCfV9FwGlw9dmEP3CAVlgyyB3HIfKxu56LGPegy1N8/P7MN5/525Skm25jHTXsj0OpTMHVnq2Z5tKl9/RTYfDZobrJ/0PvnBB/4bliabml52pmHGds/+A1J6GS7rKCjW3kKR/cG7/zOu5aUmn9AcxY6dWnmFpQSYtvGG9VpqvXK+Mi33u34U+8NWbO6iLkviMEhI0tQgZM0nzRuQ9iEx30ygbnllfeGreMK6wVOIEbXNpKgLyCtXUpwOsH4MDj0sHSz8l3UVioq+kB7UKjCFlmpzkUAccHjbicvTjM9xDHzs9zX8EkewhwgvgGgqObJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOqgE+bQRqJSaGdfrE8a8XEAc5wqmWyygxWbNzkBWt0=;
 b=BJDYrCJFI+9mSbNI/4RuMavJo799b282+0nfXRaJVei4f0QjIaLFQHOf/JFWDXNxk/s0HrGEE5Qi/NVMdO7eJLKcGVAPjy7qWAgXeyuJg5PGroYCv5+71yz30ehMwocp2EHsvsg4mqAf9lDK/r63udXHcrQ5/XUjdpyUJjf54nfL4CmQINyM4Drv4RpTq9b23qDimVW5Rlx4zEHslp2E1SlymUYHiFSWFYiAsA7JKr3YFx0SOatnfHa1mOi4CUQ+DZP+6NgvN4ZRzhh71oY66xjmlLi8yMlbMQt42/3yJc3WRYfQQdQa+wGDt5pG2rzP6G9hPsrej7c867igzbpkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOqgE+bQRqJSaGdfrE8a8XEAc5wqmWyygxWbNzkBWt0=;
 b=AAFS89iqoiWiYFeTJP7pd1IPuzj4TYxSWnuSE9ATYP2cUS4h824aPUdAZUogXaB308PQy69Ri/o5HXP4zkHKMWOVFbA9oJLfRzaNIDb99fC5rm9a8YC5UXTECw4uG7Z/RuHAOPd7l5jCLH/JKGOrT6JRekSoLi9HUandw4dXKco=
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
Subject: [PATCH v1 16/19] xen/sysctl: wrap around XEN_SYSCTL_coverage_op
Date: Wed, 12 Mar 2025 12:06:29 +0800
Message-ID: <20250312040632.2853485-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c576de-a960-4b81-5276-08dd611b702e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+DwtiM1Yq2yPb327dykMvTGwo6c3IaklmnFUJ1SQtPHcOBv4E1ELZ42sNf7q?=
 =?us-ascii?Q?XKD7S4w7+YxAAMLOuGtQjEmAGKQdAdd/cOB295uioyCobimVzwB0LHxdchSv?=
 =?us-ascii?Q?fb8uoTiMZT4CntSFwJxOXYfi232rRFhqqjIZujYudDHp1XQ1ktQYKdM1LV7c?=
 =?us-ascii?Q?t39yABCBU1vH2CPYGyZhHZJY0afAdJvAETtxKNO5MEgiuBBL246UCgDM2RIj?=
 =?us-ascii?Q?zV1HIXOQHjTSeKK0ri4Sli7X6y6L/Sies3CN3G3Aechu1dahPhVXDSOuQbx6?=
 =?us-ascii?Q?onpYjC1xKrfl5C4aBB+MHyCveg+U6bHsdT+JnPZRamDoS4gRcJqHrQCpvKn7?=
 =?us-ascii?Q?XhJ+VxAUQnJXYBTwUooigfNdJ/G/zwlHVpF5Ys6Tem3E2scmlv0Dyq0KxZ2w?=
 =?us-ascii?Q?gemhyRGN8roZZsFpSJxkgnVjhsxICBd774sSPA3eallb/TSYrUXju452mKv4?=
 =?us-ascii?Q?nnUc/0NgqFQn9epUhsU0VjWYSK+ziJa12C0siasmtb/qSdw31R1zj/OUqFgF?=
 =?us-ascii?Q?WOCBSF7c7SP7KRaYFk+DHVe2KjtF1QEG+mkdxXE70vlwPTGLoGAfqOIrBLbR?=
 =?us-ascii?Q?sQOUkXPuYdHnLuBCtKjOQj2veV0WTMoAB4b3MTGBB4MgCkm1O6zxqVZjfMHA?=
 =?us-ascii?Q?+Q23xxZYHTKoyNzDn8+TwIcIc5rDroHyKxpsXHQJcSoGvfcc/aXBAx/bRat/?=
 =?us-ascii?Q?9GT8/ctGIA1b8/2XXSnPU7xFMBVWfsfmLSHBS0Op8v5LSQi8SMRX/qr6u7AB?=
 =?us-ascii?Q?4AdAA2DpFpQPZJO1yW2xB5k0rX3NXi1HbS32CnNmAkWqLpOyQwgdNijjMe07?=
 =?us-ascii?Q?Ts49u7bFjt+deC6BAYg5N3wnq+UT+kExfxzxHh/HIRMBnYC10PFXwZ5b1Lwn?=
 =?us-ascii?Q?mDxWW5ab0TY36P34d6VFP6xUIdsxJSdJhz0fQZC4fdRX7XRLnddn63rthXMA?=
 =?us-ascii?Q?jzBYshH+jD+mkwaJ+ro26K/HAkwC7wQGsbiLZVQeRI9bGumEUgzm0lRPWO9e?=
 =?us-ascii?Q?6pfi/6wCQc/osBqwNQoigLwVm0U2uzVe1Gct++m6OneHW1c1vE/MtVPaQfAF?=
 =?us-ascii?Q?VVP8mYuvqNXZL+k46aB5Ova3cQBDnFGjzEbAIEfegy7p+yFJRjdR6BlxKMtj?=
 =?us-ascii?Q?Lf5eMZsfo1AWNV5eMkWD05yrP/Yu5nkIiODGsXfADdQBlN5YhXGXxy3uJkEo?=
 =?us-ascii?Q?vk1up5hgdmwxea7JIcFnK8WKnZTJ55GVpda3tQv8cQKEV6AUxwQdE6Faalj3?=
 =?us-ascii?Q?RJR26DL/L9EkSUkcAA6LchS5EV2/NkAmEUewSsXst094cE7F/ZFlyryuztlt?=
 =?us-ascii?Q?ZxDRt43S0C9kyQdtZMnsQ7XZuJWMLH0dnjBr31nknG1RlQ7sDj9p+8gXg3qT?=
 =?us-ascii?Q?KZgJ+iOY2t7QXlvKadVmEmeY/LI7SpTV+N/4Ts3c+n+emST38lggwZaTkDjp?=
 =?us-ascii?Q?IGYxP1pvMAhobXQY5grGyNxySc3E++q+Z5IIAy1MyRhGDzgV05SYwvVGmrAh?=
 =?us-ascii?Q?C1ZZP8s/A5/Qphw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:43.0104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c576de-a960-4b81-5276-08dd611b702e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902

All coverage-related op shall be wrapped around with CONFIG_SYSCTL,
so this commit makes CONFIG_COVERAGE depend on CONFIG_SYSCTL.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index c4a8d86912..b226ca9b6e 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -37,7 +37,7 @@ config SELF_TESTS
 
 config COVERAGE
 	bool "Code coverage support"
-	depends on !LIVEPATCH
+	depends on !LIVEPATCH && SYSCTL
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
 	help
 	  Enable code coverage support.
-- 
2.34.1


