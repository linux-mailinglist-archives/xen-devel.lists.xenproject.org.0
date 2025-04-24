Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9CA9B382
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966531.1356714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zA5-0001vS-Qb; Thu, 24 Apr 2025 16:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966531.1356714; Thu, 24 Apr 2025 16:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zA5-0001po-Lo; Thu, 24 Apr 2025 16:10:53 +0000
Received: by outflank-mailman (input) for mailman id 966531;
 Thu, 24 Apr 2025 16:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zA4-0001nN-6D
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:10:52 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2407::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af942526-2126-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 18:10:49 +0200 (CEST)
Received: from BYAPR08CA0020.namprd08.prod.outlook.com (2603:10b6:a03:100::33)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 16:10:46 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::30) by BYAPR08CA0020.outlook.office365.com
 (2603:10b6:a03:100::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 16:10:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:10:45 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:41 -0500
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
X-Inumbo-ID: af942526-2126-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au0ONRxs4r21n/+cqzlGjIPQ/we2L2J5uuDDpAcqMVlo9GOhuz1zodIysbLkbVfuf72QgjfKu4xTi7FamJKeujO6j+4EZY0H7wBKrfN4ZrlW0bEeyiizrex1DUDfsVzaqAed+L2ljSk+zeXe9sfIfHjovMyHsYVnMkjv4sHfcr4FNuLz+nlV5wcNpRLVGzWHaETMMdPByuwUk0k3MrvrA8kIOLVPK27B2oZ8ag4EPxpRysmdR93kqQYVgO/Y/BVWwvYAJiCdlJwgUpu1w4mfx6Xpj7U5bMigv0awtJ1jN1+NELVSBqkVwuu2acihFOnXx+MiCGWKZFwONADWx5BdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEc/HNT0KESzfboUNJTrwBwewE4li5sM04iz6EBbZLA=;
 b=Z8fTOysRth74p/g6tvMdsRd17+Cs5l28fgJqbeGrfcBXeXtP6NKWQ6tbGlOawOzpbMARlPyZ+uZlre2hAMZOGAQSgXjWFLL175K6R/Kntu7JC/CX3KaNoZmqIcUnMJjyCBw60Q5ds1nHE1tUBnVHHgl0hwkilLFKvzl/KkJ2ODCG1h430KsKRIEru5jjwP/AmDc7JcvxbLR8RerpECcAl2556M/bWIw17cgLclcpADIEl2bJcKKmKoeBuHP22wqOclHKW9zqaV9adv5URfG/INTAXMygvZqgC4XX3q68U6nYobnFwBrAZGEtkbMoFvkWI8xNJVCxKyr8hf5EY9db4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEc/HNT0KESzfboUNJTrwBwewE4li5sM04iz6EBbZLA=;
 b=LVuN/Yyz4FFTcMsGhXWRmfXEd9AJA1MOTizWK+7Y3m0YQoO7Y799MMzCXRqd29C9816PgWk3CussKlmGyVK5alwDqUMqAxV9uxZB8xLy0S9u1AVlGIIjL9NW983bdtg259pd3pKDfJ2udAW+RdVofr+NK7+3qG0iEhJmpyr3dxk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v5 01/12] kconfig: introduce domain builder config options
Date: Thu, 24 Apr 2025 17:10:11 +0100
Message-ID: <20250424161027.92942-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 866f05cf-6190-4ef9-a3dc-08dd834a9225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G9FCx2/Fxl3W9Y0bklNwdpjnX400xfy0QMkwQEY6daiebgnI776Bd9UmP9If?=
 =?us-ascii?Q?3onCmAQ/i1s7tEzVuggTGXEZEZ+QYsOxAfr4leq2FYEBKYuAsDzWCAZGgp6a?=
 =?us-ascii?Q?gDRNrTJPgtFQT7UFHrDIqTKG+POzNJ+TWykkzURTHjvkonWAxeMHK5NWVKxo?=
 =?us-ascii?Q?7TcyXfE/dmQXpOpw5NLUHE/Nin1o7TZ4RlKXvYMKd+i2/yUQUWfUwBT+vE+G?=
 =?us-ascii?Q?vxwdwiomgri4//TA+N69Az4yU7g5uwLWVQKnARiyIlDfiUNHi0becNBAVAuD?=
 =?us-ascii?Q?BVdPqcK35cLKfj7Cz59KClCvRwz0SShy2Ur/dN86Ugo5YTrFm+z34GeImFeQ?=
 =?us-ascii?Q?ZI7nxjbAdBG//ZKZMx0bxnoT9z67bslLEZKR0gFYwVfb8Eu4GLoRXP87mFM3?=
 =?us-ascii?Q?JGFOWI0Ppx3guEElMTJNb4LtnnDamOb/RE7KiX9612XIyqSiNOjMv8ZBjySz?=
 =?us-ascii?Q?lJ0LDG7MRWFiTRkqTwTXk9g9V7CBeTjeomuatsW+vlmwo7x9UFWtg9PEE8eC?=
 =?us-ascii?Q?ZPHNqs/3esqeDUp8VOSH9TOXWBwK69bpObDa8UJkwm/1xJXQp31g6cUkVPP3?=
 =?us-ascii?Q?cdmLze6pfWjKn+igOaLlZGzV9JDpTZoV95zSvgTWgpNbj2LmYDQKkruJIzVL?=
 =?us-ascii?Q?65Hht5NbIDfmzn/xk5DSDxG0VHtf+Rc+9tipI4Lnlv5AxQBumyB1DK+pkTI+?=
 =?us-ascii?Q?Ymt8Aa3b7BDO24fsLyjJx0FiRuBOdlUHqh2A4tT76EujjghtTf9/uaSZYFIP?=
 =?us-ascii?Q?awEJzj/TvWlZvpdzW2S4QM5nOS+AqeXswv49lywd2D0eFFWzzt9s8/jTvXXH?=
 =?us-ascii?Q?kppzBrZNT508JlY4jJ/hAZOSj4/eB16T4bJ/7aDNjBtjh9lb1k/oA+l/nlyg?=
 =?us-ascii?Q?U+KU37mknB+kpH7JhznihbuD+C3DMh4I6JHaCUKWdQiKv4ptfVIuNkJLsvQw?=
 =?us-ascii?Q?NXvO/6aJdrXJDJSWH3UFz6/PFzTfOSGC5ZIFnG73bnr8lQvqBUaQDqpIbg9c?=
 =?us-ascii?Q?oS2TPTUjvkLca/NBJjZ1m6zyHsjjx31wF/MGM7kISWlLpoq7vDVWnO2jox/1?=
 =?us-ascii?Q?Eu5x18s/2dLRxH9Z35C26AbxHr7KJO4yECSL2gUQs2Ljm4NOy0eY/IG8WItu?=
 =?us-ascii?Q?vSyhguYq6PRdU4ezcL+7HH2UbYtOYu/bNUr5Ygmo9C/buvf832ECelX6A46D?=
 =?us-ascii?Q?rv3llwy8LgrabjAyNppNOjTe4eZHHgXvp7vpngoegdzOpjOsdNQcu7uv3muJ?=
 =?us-ascii?Q?Okqko7KSzdEWu8GELLWx8TGxGr8XnjSklqI2EhiEQT2UzXSnh/HaxBSWRynK?=
 =?us-ascii?Q?ED2dGCiLwxOveP9tLnpT7RczKhagbyhhUAvvGwmfdJqYSmZ4yvC/inSWkePJ?=
 =?us-ascii?Q?0Et+U+/gLXTFVv6CwcSVZddwKNFiQeOSpFWbm+lCOBpInupMBSu9MISqs2Jm?=
 =?us-ascii?Q?RuKUREORq4v8QaaGgbAVYtNjSRHrmudsimSZ/765HuhFqyZE1tP5NKl3g+7N?=
 =?us-ascii?Q?Askjm+Hi/AoFjbCFHKx7PZyET2CuJIhHuTkc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:10:45.7987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866f05cf-6190-4ef9-a3dc-08dd834a9225
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Hyperlaunch domain builder will be the consolidated boot time domain
building logic framework. Introduces the config option to enable this
domain builder to eventually turn on the ability to load the domain
configuration via a flattened device tree.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Removed CONFIG_HAS_BOOT_INFO
  * Reworded help message
---
 xen/common/Kconfig                |  2 ++
 xen/common/domain-builder/Kconfig | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 xen/common/domain-builder/Kconfig

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index be28060716..e025fbe257 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -144,6 +144,8 @@ config STATIC_MEMORY
 
 	  If unsure, say N.
 
+source "common/domain-builder/Kconfig"
+
 menu "Speculative hardening"
 
 config INDIRECT_THUNK
diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
new file mode 100644
index 0000000000..44b8351af8
--- /dev/null
+++ b/xen/common/domain-builder/Kconfig
@@ -0,0 +1,15 @@
+menu "Domain Builder Features"
+
+config DOMAIN_BUILDER
+	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED && X86
+	select LIBFDT
+	help
+	  Support for constructing predefined domains described by a flattened
+	  device tree. This allows constructing multiple domains at boot time
+	  instead of being limited to a single dom0.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.43.0


