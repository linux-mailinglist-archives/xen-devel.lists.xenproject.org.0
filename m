Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F511D18AE2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201590.1517207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP7-0005Lx-Oi; Tue, 13 Jan 2026 12:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201590.1517207; Tue, 13 Jan 2026 12:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP7-0005KQ-Jf; Tue, 13 Jan 2026 12:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1201590;
 Tue, 13 Jan 2026 12:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfdP6-0004bR-EP
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:21:44 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4f0484-f07a-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 13:21:42 +0100 (CET)
Received: from MN2PR16CA0043.namprd16.prod.outlook.com (2603:10b6:208:234::12)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:21:35 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::41) by MN2PR16CA0043.outlook.office365.com
 (2603:10b6:208:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 12:21:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 12:21:35 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 06:21:32 -0600
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
X-Inumbo-ID: 6a4f0484-f07a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AilEAogS4ja1pODbCOBOKMS4Cx1w8bFan3u0bIkw+CeuDjNuLz+93FmT+Wyks7M83Hp6sHE9Qc4c7cEIJB3t2KPqC9Cj9XnNs2j3yhbdHlbbYu2l/VJsvN3FbtV3Ib+W+fRiP9gHmwpNhjbdgSt2xq1M+uIhDgyUNtOo7tOg0eB+lGTc6R9BOBW9PzkJ04ADfYPm3qCDN6Xe4UGTeK8cTavtAzUzPBgIq5Dkz+Ki+Gio5YrVx9djkl+CFrDk5EldeFbOdQQwwiSihuRjBf47Pg1AugbZFike4GZK6ZtVWM5ZGBI9anC0pNCEqjkYuXQeURALpnLVp03lloKrdp6psQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUv6GaP4ZnzcennMc/wtXjho6dE/fymYbH5erIs2GIc=;
 b=wTJxP/jFTcvfxGh1ey4vOeQztLdcGYWjDxkZbRCs6mTXP8Lx9AFtg1w74AoZAOd+TfRoDHSyEVrTkATPl0snOxFwAuy7aw2cIUSPq02EzqRhozUcqpCh7vrDSe+5cmKatsc1BXFa47mv2jKqYOa5oCMxYUebTFqM/qAPyiy0eOMF5kR4ytS4LsZwiYS+3tuNmKlqcHWDrl8jyLlNGkgWV15yR6Lpu2rYS5+lodtGdpZgztyTGNwS8zxK9c+Iz7N/UK6HjwZMBGYgAC1nDab80Nzoi4LbkHK0oQ8s3wEPvK5bvKBnyyOyWVmGlnG01fWXgfAwMzfuNLuN05TKI06Kmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUv6GaP4ZnzcennMc/wtXjho6dE/fymYbH5erIs2GIc=;
 b=H9aZxTLL/1TTsBN1TPAIUjwj8T8C2bmsTW+NDrtrDiiB7FyP+MI8Y0ju01HzJ7M5dCm2Q8kpmiKVO/q6l4MvbgU+ivOI5GxrU+8eb5TdYziv58wf6Kz72993dApjq+J96p7yY0fcHBBOTxjVf/2PcEnKUeBtqwxDW3DaF6fEnOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/4] x86/ucode: Rename UCODE_SCAN_DEFAULT to MICROCODE_SCAN_DEFAULT
Date: Tue, 13 Jan 2026 13:21:02 +0100
Message-ID: <20260113122109.62399-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 337c51fb-67f2-4f78-dbbd-08de529e4b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YUcsi54qLmSMqVSpk5TKbCSNEg5ZQLpc7p6jYsQZACCm9I6C2pMVULJB6gUA?=
 =?us-ascii?Q?5xaeirQiJVAggZPrY6hV2mdeZjuIr3Uj6eu+he92/UGCFzbVLn1WrvF7g2nS?=
 =?us-ascii?Q?tAmPAjedSFieTB3hmw5tFytk1Hp65GcNkKkySBbtZEL8W5Bz57GY+rcUXFZN?=
 =?us-ascii?Q?9o+0sTlZmP3sv5Q6XWuOt9pHr4zcJTn6eiM/TZZTF+umC2J0wg8qOxSfZjS5?=
 =?us-ascii?Q?lMXOQeXZr3uacKw0gvPIK1Y1IFXm93cKNAHhPxd+ukiPeGErjCxuIzaY8N/A?=
 =?us-ascii?Q?dknx+neE0CGjPBt3jmFW2EJtKkQSbcgJ+826hJpY1M3M1gqrLpyEuPUdiGkM?=
 =?us-ascii?Q?+//oqLCsSRFmAMAMVzJi1ZweT/ztqOMkaZcg406pYsz7dDP656lYL8HhJom1?=
 =?us-ascii?Q?ELZANx/Mi56efk7XSq+OzkDwMTyWPBpx5avBcJO9SXXOzsd6O1QOZCJwg8Pa?=
 =?us-ascii?Q?5+nCnMKJmHNRCHvVhWhSZ7N4nqfS0jnsDO8CWPCa7yUJcsjaogbFcPBqdzwJ?=
 =?us-ascii?Q?ERtWnJBZT8SFkMsDnL4jm2vEMaSIrpL1Jzp7RBl6ZIASo0RvDXjpRn08xj+Q?=
 =?us-ascii?Q?3PoVSbpHC5W/714s/Utp5vzHHsVkS94Z8kgLGfHi9jM7HILIxGSx9tNRb5MV?=
 =?us-ascii?Q?lEOmeRRVKBoVOUVNAjerXShIOm1vNUu7IQmwW+DegcuQ2Y7cfpcYtHcIK2yW?=
 =?us-ascii?Q?/SYMzK8bmDxW001bCFvDV9VUZDaxRXQ4EuJ+LWZlhcPcvUEFSP13HhHhWV49?=
 =?us-ascii?Q?SQu8r0vUiEwkx192IT+JedRT1sOcNLSchcw5icIKgtkQbgIy4x98BSq32dFx?=
 =?us-ascii?Q?gLWUbJ+WunK4pEdlKPrXttQn1ZinSc/uLALGMxQmQNZBD0QNtf5MrbLlDsAT?=
 =?us-ascii?Q?rMiAkQ/tbuGeTB+y8lHuX64hlw6kFTQMgx+Bhcd6SPW3x51fK+LrWy00TsbQ?=
 =?us-ascii?Q?W9/1XJTHKaHzJ6iT43Cn6bLkt7VZl8HB469XFSvsOu961KJnWPP4DKsWk3br?=
 =?us-ascii?Q?ZC8GK8aQlPVK2Ymxs4jx5lOoHNWx6DoDoERemxBInmC1RUSluuMM37ODsf+F?=
 =?us-ascii?Q?9arjnqCPhAeAVWI1HEkZncXxTnDcZHV9ZneozhspSRPQoznbKdaB4WDEuR8d?=
 =?us-ascii?Q?t4Evwnr59EPCU52RzK2MuObDYzJxxn5uCmRoPo5GzwtmtuQznvApYjRgD0Tx?=
 =?us-ascii?Q?1OFTe/NKehlK3ZPzi915uC43A/vkoo2ouxxieTr2/ugs6zUySwryyohf83GR?=
 =?us-ascii?Q?KLjOusdh+/mVEs9ww3wfPHNb1rUy0R43Ze4L13nivnx/EvCLhMxfLLWG4zqa?=
 =?us-ascii?Q?qjiyX4DwfNlBNcHM745BOzkafCQjtjl0ty66JT6YJe/xu2fBW3dIdXANerP0?=
 =?us-ascii?Q?af6/wDsIZiLgfo9RYHO96tMWwof0FNpGBWarUz9XqsZMBnlwoNEY4o91HeOr?=
 =?us-ascii?Q?vIZ6VOeSnc2zGi0XBIGir8+H2P1WtoHHB2oki9BXWrfczKSQ/Awwc8CNVnlZ?=
 =?us-ascii?Q?LhoYhNgb67jmLgcrWW1iXvOwL9H4xZNH1nuxb42ZZaQLPoDBUmD/dd9Nyjbu?=
 =?us-ascii?Q?AVjMRi+g1JoveSLgrSA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:21:35.5954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 337c51fb-67f2-4f78-dbbd-08de529e4b64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042

We'd rather have the full spelling in Kconfig. Adjusts every other
reference to the name too.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * New patch. Previously integrated in larger patch.
---
 automation/gitlab-ci/build.yaml   | 2 +-
 docs/misc/xen-command-line.pandoc | 2 +-
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a6fc55c2d5..b69bad9202 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -310,7 +310,7 @@ alpine-3.18-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
-      CONFIG_UCODE_SCAN_DEFAULT=y
+      CONFIG_MICROCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
 debian-13-x86_64-gcc-debug:
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 50d7edb248..15f7a315a4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2773,7 +2773,7 @@ microcode in the cpio name space must be:
   - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
 When using xen.efi, the `ucode=<filename>` config file setting takes
 precedence over `scan`. The default value for `scan` is set with
-`CONFIG_UCODE_SCAN_DEFAULT`.
+`CONFIG_MICROCODE_SCAN_DEFAULT`.
 
 'nmi' determines late loading is performed in NMI handler or just in
 stop_machine context. In NMI handler, even NMIs are blocked, which is
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index c808c989fc..d5705e4bff 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -331,7 +331,7 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
 
-config UCODE_SCAN_DEFAULT
+config MICROCODE_SCAN_DEFAULT
 	bool "Scan for microcode by default"
 	help
 	  During boot, Xen can scan the multiboot images for a CPIO archive
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fe47c3a6c1..dabdb95b4c 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -101,7 +101,7 @@ static struct microcode_patch *microcode_cache;
  * location we require that they are not both active together.
  */
 static int __initdata opt_mod_idx;
-static bool __initdata opt_scan = IS_ENABLED(CONFIG_UCODE_SCAN_DEFAULT);
+static bool __initdata opt_scan = IS_ENABLED(CONFIG_MICROCODE_SCAN_DEFAULT);
 bool __ro_after_init opt_digest_check = true;
 
 /*
-- 
2.43.0


