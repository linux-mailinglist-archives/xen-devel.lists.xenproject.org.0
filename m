Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE72DA3D57F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893726.1302590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3GL-0005iN-DR; Thu, 20 Feb 2025 09:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893726.1302590; Thu, 20 Feb 2025 09:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3GL-0005fk-AM; Thu, 20 Feb 2025 09:54:33 +0000
Received: by outflank-mailman (input) for mailman id 893726;
 Thu, 20 Feb 2025 09:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gblN=VL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tl3GJ-0005fY-FE
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:54:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2407::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad3e8c42-ef70-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 10:54:29 +0100 (CET)
Received: from DM5PR07CA0108.namprd07.prod.outlook.com (2603:10b6:4:ae::37) by
 SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 09:54:23 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::d1) by DM5PR07CA0108.outlook.office365.com
 (2603:10b6:4:ae::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 09:54:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 09:54:22 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Feb
 2025 03:54:19 -0600
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
X-Inumbo-ID: ad3e8c42-ef70-11ef-9aa8-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDqMY78f7/YpH8rG1+o5yzcMkO3g4kSWtfWOV+iA/MuvOYRSGlUpqyEi4qtm3vyD9NCCOChV1+WQxPRYR6YcgfjdWwyzYK6H2GD3FNHFs5lZdNGsrbzDOj/fKOB8nb7yVMHrpvNZGTbL8qEMly8+/WRnAYsMj4ed5oKGLJyMI1+YPzrP9MZbjabgzxHiU7VNsVpnmTEFl98KJXUJ46pKZ2j2aZgFebetiDNbp7gOHF17d0SdLJXA1J3s6PhFuQtS6leJpQd2cc2WVc/+nMuFO0kT0mP2T+P7LqRI3frFCoRw/LV1wpnDYj5BJ11HgfjilzUq3M/2JFjAZ6ZkYsQsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jguRpQumSYfrCTS3CNMWJUYQXN7iVHAgzHE7mZNL2Eo=;
 b=rbFjmJ3O0mdgTSgZUdnbHzjlGY0Gg14N/Vs4v+ppNM14IZ0Qi3ENiAKgH8EiqC1P7Ld++mONwEfNT0g4oPFNecZdEnWmmIyVGULblbnDSHm0c8GL+yNFtGOzCgtblqo1eiygKC/1AUN6iB9mW0zp/bsU7kTfVOFA0Z9AD/KZ543E2d2RCY+qV6n8xCc99QhSVjWZ86v7ffusMVVa2qoEH52LbYSJsRLGVQPHZf3rqHIMJS3nY5UaB3KAg5xu0pJ8fA2ifZ8Wzp7D1iOcnFrBs8STPkpfVjwQ6SMDOOlRrPKTSqXKw1Zy8U7gSz7DJXI2mWSdwJ5/R8VNX/a1LYkBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jguRpQumSYfrCTS3CNMWJUYQXN7iVHAgzHE7mZNL2Eo=;
 b=C728JsQlx7iSnI078/4lWp6LhvgdiQa/5WXWkLHQoaK5yO+p7s145SsVY3NoJexiYiloAZ2fhHUxtDvyJ852K+4wAuMEq1TaJRuHeIPmL4/E4+vr5z1NkBJTgd6rTrDIZKD8BaiJjQndh7+fyFfyRsk4BNlUgkk4IZ+HvyOpTx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Sergiy
 Kibrik" <Sergiy_Kibrik@epam.com>, Huang Rui <ray.huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [PATCH v2 1/2] x86/hvm: make stdvga support optional
Date: Thu, 20 Feb 2025 17:53:48 +0800
Message-ID: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 69852a51-fb9c-44e2-8b02-08dd51948d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aLBW+Hqk4Vkgz7LZ7bVLMBzTCnnluqCJOi13OMZl2vaCf5ZdAwzICm+RrKFU?=
 =?us-ascii?Q?QSSU5xDeEwMQO24X1JvIRPlNRORBRazUpdPziPzI40OGaH68qONs9OoBo6Fb?=
 =?us-ascii?Q?aAKcd2ceCF7408yHWrhpD+M8pkGRy2vnMLtxhEGvugbz+3b7knwsqhIwjFwP?=
 =?us-ascii?Q?yozj2sKjzwFbr95M/D2EVqUT1L8qINYxaRS4QHixg+KGjCoXpYtoqpudCo5n?=
 =?us-ascii?Q?NLkCOeUFxzlXpRvGr6VTIkFT5AvVQM6pZpE7gVGrjKpkdUwb0GjYQKwmg6iL?=
 =?us-ascii?Q?/g7KhaMJTVR0H5AfayV7FQzmnFdtDPbkOR57hyowZ87uo1NGICuKsGrGghx2?=
 =?us-ascii?Q?ThUcx5dngscna1NeC87BqRIn+PlDl+/Z05ciDkVkyFez60bwRZ6q+ug7rYnh?=
 =?us-ascii?Q?MEkm8xtgRQAqcT0nrGLc5mcyTGnfIbLosVtDYfImQBvV2Eozmk/6uHBd27Cx?=
 =?us-ascii?Q?yZdwqW+tQkZsas8iFUa4qa1i1jjdlgYKfGADuRT5xr1MZL3vmB6xsyI33pxN?=
 =?us-ascii?Q?9RyoyLT4lp/1YNgnCj8SI0cNQ2Bts7u8+ROszghowIDTmA7VuvxY+XNFLbeP?=
 =?us-ascii?Q?jPzzOaOG9yyVCysrABPaae6fHfGeS2SCW2HbBjDfp9UfCSCIKlAeFC2Y3ioN?=
 =?us-ascii?Q?clWym8qD8sPSAOizJcwLVFPDrYP6PkU0IWMYrnVW65sY19gNk7o+nw+ntlVJ?=
 =?us-ascii?Q?uEDdt+FfDuUayHsUsBGobe25edKC6hf70jsMCQD9zbKjUy0syX1UicpMtJBg?=
 =?us-ascii?Q?vZgozdQ7IjpRkt9oPARvkYYXXfo1gHl9WGk/oSpkJXDyYcFR4yJpvmvLTUcd?=
 =?us-ascii?Q?Ah9dHjJlGB9AZPPyfTUmFjMA6inGpk1au9cLAYaLx/u8+lShrgC/PD+hNeDU?=
 =?us-ascii?Q?QkzMejYS/iT9/bCTS6xfxxD6vAT5qU++nv8Iv+17QjZOltoYPRJHmVh68mqF?=
 =?us-ascii?Q?yHXwYVDDuuK9mCe2aYEb26iytPHfAVxlQM7qhuJDu/vTt0GoVHW+YJwn6v1v?=
 =?us-ascii?Q?EdxCS7DTZvsqDw5Nr57mHRAMspHPkO9xNdX70Sr++TTlDRzVj8j5Lf751lBK?=
 =?us-ascii?Q?yrIJWPh+YkbQJp513iyLmohCXdgANtlb+cNSgDTjbU7N9sCqe5KZYdIS9K4Y?=
 =?us-ascii?Q?UjaNU4URY7cQHs6vjv96Zo+i88FO01TlMDlu5lZL0vlNuhMMVlRoJOnlZStR?=
 =?us-ascii?Q?06z6glYuUrWOqbcQcnrygN1f/Vh8dgftM8lCTEpOyY9+IHYUNqF6kDdgX4ad?=
 =?us-ascii?Q?Osww8KW+c2/mQOc1VDRhiWyj9p6SDSfvPTubRcBL3cWMhGpVUTSzAYGG8cti?=
 =?us-ascii?Q?6MI/pgshlZb16LDIcKZONcKabA2uVvVCeWzkTR0lQa6xdyG9aLlrlAMo3B/I?=
 =?us-ascii?Q?ENzr3c/gOTySvMC4iJqRcEHv+RH4Ub/tdfk1X2t2Kxu77F5H4Ugg5SYXsORD?=
 =?us-ascii?Q?uenY/RIqgCo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 09:54:22.3613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69852a51-fb9c-44e2-8b02-08dd51948d53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Introduce config option X86_STDVGA so that stdvga driver can be
disabled on systems that don't need it.

What's more, in function emulation_flags_ok, to check if toolstack
pass any emulation flag that disabled in building time.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,
this is a rework for https://lore.kernel.org/xen-devel/20240912085709.858052-1-Sergiy_Kibrik@epam.com/T/#u.

v1->v2 changes:
* For emulation flags, added a new file "arch/x86/hvm/Kconfig.emu" to be a separate seletion,
  and moved definition of "config X86_STDVGA" into it.
* Added a new macro "#define DISABLED_EMU_MASK (!IS_ENABLED(CONFIG_X86_STDVGA) ? X86_EMU_VGA : 0)",
  and checked it in function emulation_flags_ok.
* Adjusted macro "has_vvga".

Best regards,
Jiqian Chen.
---
 xen/arch/x86/Kconfig              |  2 ++
 xen/arch/x86/domain.c             |  2 ++
 xen/arch/x86/hvm/Kconfig.emu      | 14 ++++++++++++++
 xen/arch/x86/hvm/Makefile         |  2 +-
 xen/arch/x86/include/asm/domain.h |  6 +++++-
 xen/arch/x86/include/asm/hvm/io.h |  4 ++++
 6 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/hvm/Kconfig.emu

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa..e4fedf7e54d8 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -123,6 +123,8 @@ config HVM
 
 	  If unsure, say Y.
 
+source "arch/x86/hvm/Kconfig.emu"
+
 config AMD_SVM
 	bool "AMD-V" if EXPERT
 	depends on HVM
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..289c91459470 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -758,6 +758,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
              (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
              emflags != X86_EMU_LAPIC )
             return false;
+        if ( emflags & DISABLED_EMU_MASK )
+            return false;
     }
     else if ( emflags != 0 && emflags != X86_EMU_PIT )
     {
diff --git a/xen/arch/x86/hvm/Kconfig.emu b/xen/arch/x86/hvm/Kconfig.emu
new file mode 100644
index 000000000000..aa60b6227036
--- /dev/null
+++ b/xen/arch/x86/hvm/Kconfig.emu
@@ -0,0 +1,14 @@
+menu "Emulated device support"
+	visible if EXPERT
+
+config X86_STDVGA
+	bool "Standard VGA card emulation support" if EXPERT
+	default y
+	depends on HVM
+	help
+	  Build stdvga driver that emulates standard VGA card with VESA BIOS
+	  Extensions for HVM guests.
+
+	  If unsure, say Y.
+
+endmenu
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2bf..4d1f8e00eb68 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -22,7 +22,7 @@ obj-y += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
-obj-y += stdvga.o
+obj-$(CONFIG_X86_STDVGA) += stdvga.o
 obj-y += vioapic.o
 obj-y += vlapic.o
 obj-y += vm_event.o
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c..68be23bf3bf4 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -494,13 +494,17 @@ struct arch_domain
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
                                  X86_EMU_VPCI)
 
+#define DISABLED_EMU_MASK \
+    (!IS_ENABLED(CONFIG_X86_STDVGA) ? X86_EMU_VGA : 0)
+
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
 #define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
 #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
 #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
 #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
-#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
+#define has_vvga(d)        (IS_ENABLED(CONFIG_X86_STDVGA) && \
+                            !!((d)->arch.emulation_flags & X86_EMU_VGA))
 #define has_viommu(d)      (!!((d)->arch.emulation_flags & X86_EMU_IOMMU))
 #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index f2b8431facb0..32a2490fbcb2 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -108,7 +108,11 @@ struct vpci_arch_msix_entry {
     int pirq;
 };
 
+#ifdef CONFIG_X86_STDVGA
 void stdvga_init(struct domain *d);
+#else
+static inline void stdvga_init(struct domain *d) {}
+#endif
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
 
-- 
2.34.1


