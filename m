Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9AB1934E
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068399.1432448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMd-0003st-G6; Sun, 03 Aug 2025 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068399.1432448; Sun, 03 Aug 2025 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMd-0003kk-5W; Sun, 03 Aug 2025 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1068399;
 Sun, 03 Aug 2025 09:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVLF-0005K3-DL
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2048608c-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:49:20 +0200 (CEST)
Received: from BY3PR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:254::25)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Sun, 3 Aug
 2025 09:49:13 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::77) by BY3PR05CA0020.outlook.office365.com
 (2603:10b6:a03:254::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.9 via Frontend Transport; Sun, 3
 Aug 2025 09:49:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:49:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:49:06 -0500
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
X-Inumbo-ID: 2048608c-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+0Gis5ZuDhbnOduOrP3aEJbz4r/D7XP7Od8Jil6GiT9bFMxpRRoM1Lkkes2YDVWxazXlShs+KdodqRNeWFnPGnTjVZtUy2lJjr/N19b80gle01h8124kiyGbG3u8b0925owHN9zO1+RDGb3NrWIYoX/X5gQRLJ5IewEUCqax6zYyheMexNkYxCl1UeKZL0kR6jPeRI5+NMgjD5h5H4ZH/dMd6nXIOyOsxn3kPvDzrg4ooL5Mn5qyefOIAOWi5os7Ebf+9v7LN0wqNC/b8gWpkdUqcwUsft8zjsLwVvNanNBCnwzuroWEXpsdeYhRIHSOGxGes9RQeCqfUTBg1hhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqsSafNY4ierJ81EwiM5+LNW4uoi1U1UYjSCIbvM1aU=;
 b=bHYHS0h9SAoEPp6uMCG8jYtf/0qKTLjWZ8ubx7AdiXHKCxNscESq+Fs7+io+1p1vl0/WH9JhIKWq31XuPEBVQ1TY/lgl8+hPNrYeSaL4lKF5lfJfkpl2irIYieKGLW/aE+krPqvhHwENad+m/SUnkFLyseZnzr/xES6yPnP5i4bwNuPtYN86JYKq0nA98jxe5N0od+37vxdXPkNEhcNad3zQdXuBW9cz3FjqajNzu48YWOgqBg4SZvxsSQj1vhX+wF2UsqOhiiNTG1iNgXs4P0RihY86LJnMDM5suNJ9+R9X/7wZF2V3bCGx9YwuA5GnvrO4PjTJeJBgx7wPIzjAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqsSafNY4ierJ81EwiM5+LNW4uoi1U1UYjSCIbvM1aU=;
 b=MTUAfBn8pNXPYjcdsR/7imYTkpUZAmjhwStf09KIaDAH99ViDWJsJPmZ43pyXzFif8+r9gUKSlAtmxL8mv1PLajUZa5dcM+4aqbj/UUWqmwfw1o/D0/lVwzBmQQv1l8bk+5OHGfXo3EYqjhKLC+A9NlIzoHu64NGccGPUuky+L8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 24/25] xen/domctl: wrap around arch-specific domctl op
Date: Sun, 3 Aug 2025 17:47:37 +0800
Message-ID: <20250803094738.3625269-25-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 7740e4fc-b0a5-4c9b-f465-08ddd27300bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vLR9Ocf/Cyx/1ZnKlLDgi6URU1motvfWrWdjfUIoZ71N/PE9Rv0ocDZuVaKA?=
 =?us-ascii?Q?Lx4vvZvNrppWXqFBGDwfqYOjYHPBJ0inQ7bsLMY2SUMLh7aWU1EMnEpBCdL2?=
 =?us-ascii?Q?MhJgS9f6KZPgJEK/A+QWVup4JJ2KHahnR0NBPWeVAwUvd87CXTTIu4M7rdUu?=
 =?us-ascii?Q?FxWbBNvCtyCunckLyBxLkgsLiaraFBH3WlHfR9+BMeoPU+bKhRCpuz20yBsh?=
 =?us-ascii?Q?Grd4xfUsKpLpjP+2LMpxlAmkxl+0ZPkTYl7BIUCCWp64IEdBQ4xntoMk/GJ1?=
 =?us-ascii?Q?OdgTpB4i2BasnnEeFRfwTGRsHRAHEXeCvGjiSM2aCj15NVz5hxJ7Hz47SpCQ?=
 =?us-ascii?Q?SOFpyDzLNc0R8+a5l974AV6brBMfHr/oqDt3urHIuH6LedX9M4GNu5CBX+iY?=
 =?us-ascii?Q?LG61nBM1FV/mKGdQp5ip5Z0Q5r21QXPvF1/pLLkwMnWO4MzwwMJO3iGGxA8U?=
 =?us-ascii?Q?Hm5NlG9LjtaDsNieeiYJ7t/8tvahpggk92wslZQTjmCqQjYCDyoUPAHMcUcf?=
 =?us-ascii?Q?dZZW03I5YV+UOi0VU2nbOXgNgh7i5Sf9Ez9tyRVrL6G8Zlv63G1LOThEw6mm?=
 =?us-ascii?Q?/RmE3IQuiF+yT/cNRp/uJD426LXRL31kT9hL+wivz5QnfD6xXmiHkYzEEKoj?=
 =?us-ascii?Q?xrwofK5jCfZykwf3m3CTHUaZDMmsTMb8mXCGsS65xj8LmpMkNuTqVsmydU8q?=
 =?us-ascii?Q?TnnnSEhCodWkRVr/ZxesyOrqeSq1YkEzrVTvCmIsJWnTtBE9zfJujLNXCXNZ?=
 =?us-ascii?Q?DKeg/gFR9aLrV62iORsADuPXMOLR0/i8mYq51LgCiDo3NGmxjZprrnf6fGTi?=
 =?us-ascii?Q?ZsmpZ+POeMFK4B9wQ9W6arvOf2lo2uOvBgLFRxK1QlNgl7fXMyk/E3LVr5Mh?=
 =?us-ascii?Q?GZN/72pRZ7+w8rYEV5bDeTeqZO/ajax0CiSvkZsRUWEmCYnZNTNeO1FIlqFK?=
 =?us-ascii?Q?PMqFMsXmQOadd++r4b3Kz4BcQ2TYw+RJcZT38lhP95wQR0aassOBZAC9w2me?=
 =?us-ascii?Q?b5tyjmN7Uayt6CggvOzrrSmRQMW7u12t+6Ys34xV9oQwLohllutt0DZ2LSxu?=
 =?us-ascii?Q?SKQS9rx95krIkk5euLBh2Mcx4g8c2PMAuxJqX8OJZknbSRqqBMyRUYx6T6Ek?=
 =?us-ascii?Q?oTh0Lg/uk+4tOuVpvYQsB+GPQVLQ8JalvoUXvB3vuQWvnyNbieWf1CufNflf?=
 =?us-ascii?Q?koaKOndGLJvM+KoLI7M8aZ9knU1fHTI0o1oY9xWK1zNIEolpC+ivvRahS3zz?=
 =?us-ascii?Q?JzgWSP20DhL9CvuXXh8Mj3fXWgnfuriAAY2nfIeYuASJqTLP7zipWCdgNXpJ?=
 =?us-ascii?Q?xo1uKDmi4/YPZRyaLMsSLXeVQa0sx882h1z6PpWg9+jL+4lUVRQTNLeApZVe?=
 =?us-ascii?Q?/ZKR+sNlWrZ9YLGipPVfJEOKi7rkpwyuHnaJ3aKdPkovPLMiAv6T86HnvJjC?=
 =?us-ascii?Q?9S3tf3mKgEyAA7J4x9dMLA6NTFkCaRgtuLlKVpGbDD4ou7Yxh7GkulsMTROi?=
 =?us-ascii?Q?HRDNSn2KMvHvvTmmCDJvysV2Q8K6R7wg0TXw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:49:13.0520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7740e4fc-b0a5-4c9b-f465-08ddd27300bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113

Function arch_do_domctl() is responsible for arch-specific domctl-op,
and the following functions shall be wrapped:
- xsm_domctl
For x86:
- hvm_save_one
- hvm_acpi_power_button
- hvm_acpi_sleep_button
- xsm_{bind,unbind}_pt_irq
- xsm_ioport_permission
- xsm_ioport_mapping
- hvm_debug_op
- mem_sharing_domctl
- make P2M_AUDIT depend on CONFIG_DOMCTL
- make PG_log_dirty depend on CONFIG_DOMCTL
- gdbsx_domctl
  - gdbsx_guest_meminfo
    - dgb_rw_guest_mem
      - dbg_hvm_va2mfn
      - dbg_pv_va2mfn
- make policy.o depend on CONFIG_DOMCTL
- do_vmtrace_op
  - hvm_vmtrace_control
    - hvm_funcs.vmtrace_control
  - hvm_vmtrace_get_option
    - hvm_funcs.vmtrace_get_option
  - hvm_vmtrace_set_option
    - hvm_funcs.vmtrace_set_option
For ARM:
- subarch_do_domctl

Also, remove all #ifdef CONFIG_DOMCTL-s in arch-specific domctl.c, as
we put the guardian in Makefile for the whole file.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/arm32/Makefile        |  2 +-
 xen/arch/arm/arm64/Makefile        |  2 +-
 xen/arch/arm/domctl.c              |  2 --
 xen/arch/x86/Makefile              |  2 +-
 xen/arch/x86/domctl.c              |  2 --
 xen/arch/x86/gdbsx.c               |  4 ++++
 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/pmtimer.c         |  2 ++
 xen/arch/x86/hvm/save.c            |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c         |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++++
 xen/arch/x86/include/asm/p2m.h     |  2 +-
 xen/arch/x86/include/asm/paging.h  |  2 +-
 xen/arch/x86/mm/mem_sharing.c      |  2 ++
 xen/include/xsm/xsm.h              | 12 ++++++++----
 xen/lib/x86/Makefile               |  2 +-
 xen/xsm/dummy.c                    |  6 ++++--
 xen/xsm/flask/hooks.c              | 12 ++++++++----
 18 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a..384aaea398 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_MPU) += mpu/
 
 obj-y += cache.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b..f2f547df9a 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -6,7 +6,7 @@ obj-y += cache.o
 obj-y += cpufeature.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index d508ee2880..ad914c915f 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -184,7 +184,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOMCTL
 void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     struct vcpu_guest_context *ctxt = c.nat;
@@ -200,7 +199,6 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     if ( !test_bit(_VPF_down, &v->pause_flags) )
         ctxt->flags |= VGCF_online;
 }
-#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 17f0e1dbc9..c48759650c 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,7 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 29f9db89a1..156c74e07a 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1367,7 +1367,6 @@ long arch_do_domctl(
     return ret;
 }
 
-#ifdef CONFIG_DOMCTL
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
@@ -1526,7 +1525,6 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     c(vm_assist = d->vm_assist);
 #undef c
 }
-#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index 21442f5dff..df1a3ce9fb 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -23,6 +23,7 @@
 #include <asm/gdbsx.h>
 #include <asm/p2m.h>
 
+#ifdef CONFIG_DOMCTL
 typedef unsigned long dbgva_t;
 typedef unsigned char dbgbyte_t;
 
@@ -166,6 +167,7 @@ static int gdbsx_guest_mem_io(
 
     return iop->remain ? -EFAULT : 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 void domain_pause_for_debugger(void)
 {
@@ -179,6 +181,7 @@ void domain_pause_for_debugger(void)
         send_global_virq(VIRQ_DEBUGGER);
 }
 
+#ifdef CONFIG_DOMCTL
 int gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)
 {
     struct vcpu *v;
@@ -245,6 +248,7 @@ int gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f464f401aa..aca1e5ba69 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5212,6 +5212,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc = 0;
@@ -5251,7 +5252,6 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     return rc;
 }
 
-#ifdef CONFIG_VM_EVENT
 void hvm_toggle_singlestep(struct vcpu *v)
 {
     ASSERT(atomic_read(&v->pause_count));
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 87a7a01c9f..e4d0f001ff 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -56,6 +56,7 @@ static void pmt_update_sci(PMTState *s)
         hvm_isa_irq_deassert(s->vcpu->domain, SCI_IRQ);
 }
 
+#ifdef CONFIG_DOMCTL
 void hvm_acpi_power_button(struct domain *d)
 {
     PMTState *s = &d->arch.hvm.pl_time->vpmt;
@@ -81,6 +82,7 @@ void hvm_acpi_sleep_button(struct domain *d)
     pmt_update_sci(s);
     spin_unlock(&s->lock);
 }
+#endif /* CONFIG_DOMCTL */
 
 /* Set the correct value in the timer, accounting for time elapsed
  * since the last time we did that. */
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 8ab6405706..ffaf731ddc 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -121,6 +121,7 @@ size_t hvm_save_size(struct domain *d)
     return sz;
 }
 
+#ifdef CONFIG_DOMCTL
 /*
  * Extract a single instance of a save record, by marshalling all records of
  * that type and copying out the one we need.
@@ -195,6 +196,7 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
     xfree(ctxt.data);
     return rv;
 }
+#endif /* CONFIG_DOMCTL */
 
 int hvm_save(struct domain *d, hvm_domain_context_t *h)
 {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 9e4ad864fa..f562ab90b6 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2577,6 +2577,7 @@ static bool cf_check vmx_get_pending_event(
     (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
      RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
 
+#ifdef CONFIG_DOMCTL
 static int cf_check vmtrace_get_option(
     struct vcpu *v, uint64_t key, uint64_t *output)
 {
@@ -2685,6 +2686,7 @@ static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
 
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
@@ -2873,10 +2875,14 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
+#ifdef CONFIG_DOMCTL
     .vmtrace_control = vmtrace_control,
+#endif
     .vmtrace_output_position = vmtrace_output_position,
+#ifdef CONFIG_DOMCTL
     .vmtrace_set_option = vmtrace_set_option,
     .vmtrace_get_option = vmtrace_get_option,
+#endif
     .vmtrace_reset = vmtrace_reset,
 
     .get_reg = vmx_get_reg,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index bd53fcf155..dd106bac42 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -236,10 +236,14 @@ struct hvm_function_table {
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 
     /* vmtrace */
+#ifdef CONFIG_DOMCTL
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
+#endif
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
+#ifdef CONFIG_DOMCTL
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
+#endif
     int (*vmtrace_reset)(struct vcpu *v);
 
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
@@ -740,6 +744,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
     return false;
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     if ( hvm_funcs.vmtrace_control )
@@ -747,6 +752,7 @@ static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 
     return -EOPNOTSUPP;
 }
+#endif
 
 /* Returns -errno, or a boolean of whether tracing is currently active. */
 static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
@@ -757,6 +763,7 @@ static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
     return -EOPNOTSUPP;
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int hvm_vmtrace_set_option(
     struct vcpu *v, uint64_t key, uint64_t value)
 {
@@ -774,6 +781,7 @@ static inline int hvm_vmtrace_get_option(
 
     return -EOPNOTSUPP;
 }
+#endif
 
 static inline int hvm_vmtrace_reset(struct vcpu *v)
 {
@@ -938,16 +946,19 @@ static inline bool hvm_has_set_descriptor_access_exiting(void)
 }
 #endif /* CONFIG_VM_EVENT */
 
+#ifdef CONFIG_DOMCTL
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
     return -EOPNOTSUPP;
 }
+#endif
 
 static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
     return -EOPNOTSUPP;
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int hvm_vmtrace_set_option(
     struct vcpu *v, uint64_t key, uint64_t value)
 {
@@ -959,6 +970,7 @@ static inline int hvm_vmtrace_get_option(
 {
     return -EOPNOTSUPP;
 }
+#endif /* CONFIG_DOMCTL */
 
 static inline uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
 {
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 9c92f67443..e20c1a0d4a 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>    /* for pagetable_t */
 
 /* Debugging and auditing of the P2M code? */
-#if !defined(NDEBUG) && defined(CONFIG_HVM)
+#if !defined(NDEBUG) && defined(CONFIG_HVM) && defined(CONFIG_DOMCTL)
 #define P2M_AUDIT     1
 #else
 #define P2M_AUDIT     0
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 956b83215c..c35ef44fff 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#if defined(CONFIG_HVM)
+#if defined(CONFIG_HVM) && defined(CONFIG_DOMCTL)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 7858565429..74706da2f9 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2317,6 +2317,7 @@ out:
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
 {
     int rc;
@@ -2334,6 +2335,7 @@ int mem_sharing_domctl(struct domain *d, struct xen_domctl_mem_sharing_op *mec)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 void arch_dump_shared_mem_info(void)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 6bbf3df702..86a1aa5d06 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -64,8 +64,8 @@ struct xsm_ops {
 #endif
 #ifdef CONFIG_DOMCTL
     int (*set_target)(struct domain *d, struct domain *e);
-#endif
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
+#endif
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
 
@@ -115,9 +115,9 @@ struct xsm_ops {
     int (*map_domain_irq)(struct domain *d, int irq, const void *data);
     int (*unmap_domain_pirq)(struct domain *d);
     int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
+#ifdef CONFIG_DOMCTL
     int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
     int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-#ifdef CONFIG_DOMCTL
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
@@ -196,10 +196,12 @@ struct xsm_ops {
     int (*update_va_mapping)(struct domain *d, struct domain *f,
                              l1_pgentry_t pte);
     int (*priv_mapping)(struct domain *d, struct domain *t);
+#ifdef CONFIG_DOMCTL
     int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
                              uint8_t allow);
     int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
                           uint8_t allow);
+#endif
     int (*pmu_op)(struct domain *d, unsigned int op);
 #endif
     int (*dm_op)(struct domain *d);
@@ -273,13 +275,13 @@ static inline int xsm_set_target(
 {
     return alternative_call(xsm_ops.set_target, d, e);
 }
-#endif
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d,
                              unsigned int cmd, uint32_t ssidref)
 {
     return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
 }
+#endif /* CONFIG_DOMCTL */
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
@@ -509,6 +511,7 @@ static inline int xsm_unmap_domain_irq(
     return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int xsm_bind_pt_irq(
     xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
@@ -521,7 +524,6 @@ static inline int xsm_unbind_pt_irq(
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
-#ifdef CONFIG_DOMCTL
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
@@ -759,6 +761,7 @@ static inline int xsm_priv_mapping(
     return alternative_call(xsm_ops.priv_mapping, d, t);
 }
 
+#ifdef CONFIG_DOMCTL
 static inline int xsm_ioport_permission(
     xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
@@ -770,6 +773,7 @@ static inline int xsm_ioport_mapping(
 {
     return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
 }
+#endif /* CONFIG_DOMCTL */
 
 static inline int xsm_pmu_op(
     xsm_default_t def, struct domain *d, unsigned int op)
diff --git a/xen/lib/x86/Makefile b/xen/lib/x86/Makefile
index 780ea05db1..77f2831e84 100644
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,3 +1,3 @@
 obj-y += cpuid.o
 obj-y += msr.o
-obj-y += policy.o
+obj-$(CONFIG_DOMCTL) += policy.o
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index b5174e610b..04b9b4e579 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -26,8 +26,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 #endif
 #ifdef CONFIG_DOMCTL
     .set_target                    = xsm_set_target,
-#endif
     .domctl                        = xsm_domctl,
+#endif
 #ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
     .readconsole                   = xsm_readconsole,
@@ -75,9 +75,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .map_domain_irq                = xsm_map_domain_irq,
     .unmap_domain_pirq             = xsm_unmap_domain_pirq,
     .unmap_domain_irq              = xsm_unmap_domain_irq,
+#ifdef CONFIG_DOMCTL
     .bind_pt_irq                   = xsm_bind_pt_irq,
     .unbind_pt_irq                 = xsm_unbind_pt_irq,
-#ifdef CONFIG_DOMCTL
     .irq_permission                = xsm_irq_permission,
     .iomem_permission              = xsm_iomem_permission,
 #endif
@@ -149,8 +149,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .mmuext_op                     = xsm_mmuext_op,
     .update_va_mapping             = xsm_update_va_mapping,
     .priv_mapping                  = xsm_priv_mapping,
+#ifdef CONFIG_DOMCTL
     .ioport_permission             = xsm_ioport_permission,
     .ioport_mapping                = xsm_ioport_mapping,
+#endif
     .pmu_op                        = xsm_pmu_op,
 #endif
     .dm_op                         = xsm_dm_op,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 254e1323e5..00c4ac94e6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -669,7 +669,6 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
                                  &dsec->target_sid);
     return rc;
 }
-#endif /* CONFIG_DOMCTL */
 
 static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
                                  uint32_t ssidref)
@@ -861,6 +860,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
         return avc_unknown_permission("domctl", cmd);
     }
 }
+#endif /* CONFIG_DOMCTL */
 
 #ifdef CONFIG_SYSCTL
 static int cf_check flask_sysctl(int cmd)
@@ -1082,6 +1082,7 @@ static int cf_check flask_unmap_domain_irq(
     return rc;
 }
 
+#ifdef CONFIG_DOMCTL
 static int cf_check flask_bind_pt_irq(
     struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
@@ -1115,7 +1116,6 @@ static int cf_check flask_unbind_pt_irq(
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
 
-#ifdef CONFIG_DOMCTL
 static int cf_check flask_irq_permission(
     struct domain *d, int pirq, uint8_t access)
 {
@@ -1640,6 +1640,7 @@ static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
 }
 #endif /* PG_log_dirty */
 
+#ifdef CONFIG_DOMCTL
 struct ioport_has_perm_data {
     uint32_t ssid;
     uint32_t dsid;
@@ -1695,6 +1696,7 @@ static int cf_check flask_ioport_mapping(
 {
     return flask_ioport_permission(d, start, end, access);
 }
+#endif /* CONFIG_DOMCTL */
 
 static int cf_check flask_mem_sharing_op(
     struct domain *d, struct domain *cd, int op)
@@ -1904,8 +1906,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 #endif
 #ifdef CONFIG_DOMCTL
     .set_target = flask_set_target,
-#endif
     .domctl = flask_domctl,
+#endif
 #ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
     .readconsole = flask_readconsole,
@@ -1953,9 +1955,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .map_domain_irq = flask_map_domain_irq,
     .unmap_domain_pirq = flask_unmap_domain_pirq,
     .unmap_domain_irq = flask_unmap_domain_irq,
+#ifdef CONFIG_DOMCTL
     .bind_pt_irq = flask_bind_pt_irq,
     .unbind_pt_irq = flask_unbind_pt_irq,
-#ifdef CONFIG_DOMCTL
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
 #endif
@@ -2028,8 +2030,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .mmuext_op = flask_mmuext_op,
     .update_va_mapping = flask_update_va_mapping,
     .priv_mapping = flask_priv_mapping,
+#ifdef CONFIG_DOMCTL
     .ioport_permission = flask_ioport_permission,
     .ioport_mapping = flask_ioport_mapping,
+#endif
     .pmu_op = flask_pmu_op,
 #endif
     .dm_op = flask_dm_op,
-- 
2.34.1


