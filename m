Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127EA91CD4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957513.1350629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgD-0005IV-SW; Thu, 17 Apr 2025 12:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957513.1350629; Thu, 17 Apr 2025 12:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgD-0005F8-Oi; Thu, 17 Apr 2025 12:49:21 +0000
Received: by outflank-mailman (input) for mailman id 957513;
 Thu, 17 Apr 2025 12:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgC-0004z9-81
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:20 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2406::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9ced41-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:16 +0200 (CEST)
Received: from CH2PR05CA0068.namprd05.prod.outlook.com (2603:10b6:610:38::45)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 12:49:13 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::39) by CH2PR05CA0068.outlook.office365.com
 (2603:10b6:610:38::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 12:49:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:13 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:11 -0500
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
X-Inumbo-ID: 5e9ced41-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfBHU4xP3XXqWV57k5LaHxKKvFAY76m7MYpfFqvD81H/NE16m5JZxdlKTiEm0YvKq7jVcG7QhE8CpouEaniCWuVHOY3bTqeDEaBCxBLyX94URj8i533AMDIlID39/a8F3P6Dqr7EUOWGWREcR6JDYJYWVsVD+AsFzglLhKAjZsMXXKncJ/O03591Gt3Blk8kn0dWEYZLKEWLVqLVrfp9VR4ZxrVgby9RLGdzPzpDYJ7+Q1G/thEUEIMlcKqPabgL6+dD+lUxcdtwtBf4Z2PrUuAcxflFKsG24C0uCuzxcuW+DEUKmJ/Q4pLiXAnGMObDtoDSPRr4xHaM5JHTtyyIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIYq/gaN+DmB5Pd6q8CgN7KNVQO3TY8xLL5l0FVWPA8=;
 b=cY9sgqJEIprYbYmH6tA/g/BZ1+0GGMRVT55A+h1RyJoi14kXtItTznTsGWX1HuHISdLKiUcRDRuqParjKDwmlYxInGhc/nEkU3pOTRbYw2jTIp7ljah1M4T7hIWzc5chouz5eRTvTVNB0y7dq22NJz+oeAxM2BG9WC01B29LpDxPhAPiwLUJ2Ez9FV+a1jvN4ISvQbfmqOYVhrjbWHBTJSZJVcIeBpTRj/I57EKG6FD9KykHcGV/M9NJgcIhSysFU5SuGD2o1KiWqrhQxU9op5tY44n8nEKBVEHziW9Yavw4apPOEnpPeDLpetdSBXCs7yns73TyBtgurSVWrMUEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIYq/gaN+DmB5Pd6q8CgN7KNVQO3TY8xLL5l0FVWPA8=;
 b=RT33a3zqGYh9BeE2jtKizGLjVWmzEeD3JYnLxlqRkiNtfxnQX9nGItTQd9iBxceZ32OZGRWcfGdKl9Mgyv1Qx5TdR8HrGJjGL+05yIzT3A77bcyCloymZZI2cXXK2RwnwNsaRXgZH9EAQY6V+HG+hsiYJzKiUUD8mDbeFCkto/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 02/13] kconfig: introduce domain builder config options
Date: Thu, 17 Apr 2025 13:48:24 +0100
Message-ID: <20250417124844.11143-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bf1418-6478-459a-f154-08dd7dae415e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YXo2npJ4/9XnMBhHmc6l8IRa10rv67uZ7WDFj8j/ivb3zX3pG+QfZuH6LjTM?=
 =?us-ascii?Q?7Mhn0l0GBblonLd0YUtFCuKCtJtt3sGKGExcMVJAwWPYehZ/tvMqRid4FNg3?=
 =?us-ascii?Q?6/vUwn93ulHgPS6Wpzarn9qlCxl0FseHv8hFNv3Aw0qjGijS1PZYU92s8rf6?=
 =?us-ascii?Q?E7l+M33XmCuLkneYEPV7gcUvs4GU1hTIVvCb8/06ayeQeGtn7U30WzF1zTsm?=
 =?us-ascii?Q?rJR4tJLWdPmSQFbgzQXjRB9lAIX3psJGsXd9shHed0de9f1k2CLkOu2kS3H7?=
 =?us-ascii?Q?9S/x/QElbM/JM22kQXDq76KWMjbZ+LQN40wv38G+WtW9DY28p0vEAO+u0H6b?=
 =?us-ascii?Q?aohkHfsVEUzq46qn5mYdAZqts847g4gtrnR3zC6dqz8zPThAXFxjcptAnkmt?=
 =?us-ascii?Q?k49N/+p/DfVy75EGmHY6dnOJvlOgUT25UJHpHdZov+FJRvAzxwml+lQ4PskN?=
 =?us-ascii?Q?ew3XsV5dwtkKQFghCo/+VEueoStoM2ASQHy5z3bGsI+qJrBHm3xdkfvMH/yO?=
 =?us-ascii?Q?HIlNzVnCr4XZiZoFkb1e72PAcWhWEWKqF/oKObk7oWmuNe8G8THrhF7rYzji?=
 =?us-ascii?Q?eexgUk/Z/Tyj+1ZR/3OWWD+AUCTYvgaoIKCHvBUI20WMULY2EUeezaj5de11?=
 =?us-ascii?Q?3PjmMh8Ggy1y8NcIbGMt9sG+b0xmNf3ZEPi9KVWC/Wfn+u7z95/WbcRNiQ0D?=
 =?us-ascii?Q?c9baIUy6eBgGMar5lOLI1PAg3RkZbXDLNpcMXMl1ZBwfjPBlrwOyNVP39pjE?=
 =?us-ascii?Q?v9a4lquO8R6D80ZHxrMPWwQl1nLK9XbLCPN0QIgNZYtzRk5lHEoa7YpMxhCO?=
 =?us-ascii?Q?fsdirc6NX2ae/7E3+7phXqGSD2O1cBGZatr2FwF3XPKooilIjIfGFFB6C2Jc?=
 =?us-ascii?Q?o1qD9HnO1Pif+mwsAM3Tg2AuCdyvErE3hPSoOTy1kdzHO1WcosDGcjEi66WR?=
 =?us-ascii?Q?CkSWtG1mIiJUt2o7DAWTLz+4IS43t0BUzMpCxf9uForvmD2Zv3YAobElaZ78?=
 =?us-ascii?Q?JyRTJf7/0i7ESirjlk3qAysjn0L1KjQ96FYBudQK8MP4j7X64bV6NM28G1J+?=
 =?us-ascii?Q?Q3c/s8P94+2ASpmRAgTDjRBWOyGt7Mp+hXxNsVjV6GCpJ5khSaAn2tq7paBw?=
 =?us-ascii?Q?9yR3q4Bi//zAkDRgsA+5hpbh2lN1OMYRERZNQBxxXurzxu0pYjKpDCwjcgx+?=
 =?us-ascii?Q?7eTyTxQvSniBD5640rgEZcwG0weszqLFCixT8TNt7VDr3lFBhHFH1NthcJ76?=
 =?us-ascii?Q?pGDpZZ/LZHlQ6Z0gs3nf+jwZmoMrLARJDUBeaiL3+f4lQkQmro5XtVyGtXSK?=
 =?us-ascii?Q?pJ7H3E/QuBx6fMiSHyDkJTxQyuMjiTcd6+XAWf4U3BCysyAqemPXu63YdDcB?=
 =?us-ascii?Q?aKvkxDMo1QGcEUSIykwAQ4S4cSEsxcgxhnV9GEMnW1cycWXqZp3sGkrTcyr/?=
 =?us-ascii?Q?g0cBelL3G5QuNdOZbN1iC0p0uUb6YVAR/9kqC4RtLu8u8P3sg/6WXVs1RWcc?=
 =?us-ascii?Q?bYrRZF6Umh4kD4+Ty4QdDCI7n1/osUnYoiNU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:13.0349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bf1418-6478-459a-f154-08dd7dae415e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Hyperlaunch domain builder will be the consolidated boot time domain
building logic framework. Introduces the config option to enable this
domain builder to eventually turn on the ability to load the domain
configuration via a flattened device tree.

This is common code, but it's tightly integrated with boot_info, so the
whole builder is gated on CONFIG_HAS_BOOT_INFO, autoselected on x86 only
for the time being.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Moved from arch/x86 to common/
  * Present the domain builder submenu for X86 only.
  * s/LIB_DEVICE_TREE/LIBFDT/
  * Reworded Kconfig to be a bit more user-friendly.
  * Dropped Jason's R-by, due to the new Kconfig option.
---
 xen/arch/x86/Kconfig              |  1 +
 xen/common/Kconfig                |  5 +++++
 xen/common/domain-builder/Kconfig | 18 ++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 xen/common/domain-builder/Kconfig

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index de2fa37f08..67de2decc5 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -15,6 +15,7 @@ config X86
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
+	select HAS_BOOT_INFO
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_DIT
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index be28060716..5c9d4eb3ab 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -67,6 +67,9 @@ config GENERIC_BUG_FRAME
 config HAS_ALTERNATIVE
 	bool
 
+config HAS_BOOT_INFO
+	bool
+
 config HAS_COMPAT
 	bool
 
@@ -144,6 +147,8 @@ config STATIC_MEMORY
 
 	  If unsure, say N.
 
+source "common/domain-builder/Kconfig"
+
 menu "Speculative hardening"
 
 config INDIRECT_THUNK
diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
new file mode 100644
index 0000000000..5b137e4c2b
--- /dev/null
+++ b/xen/common/domain-builder/Kconfig
@@ -0,0 +1,18 @@
+
+menu "Domain Builder Features"
+depends on HAS_BOOT_INFO
+
+config DOMAIN_BUILDER
+	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
+	select LIBFDT
+	help
+	  Xen has a built-in mechanisms to automatically construct domains
+	  (like dom0) during the boot phase. The domain builder is an enhanced
+	  form of that mechanism to enable constructing predefined domains
+	  described on a flattened device tree.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.43.0


