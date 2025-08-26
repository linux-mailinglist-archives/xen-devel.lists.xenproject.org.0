Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E221FB373E7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 22:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095101.1450226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0LD-0002Cb-CQ; Tue, 26 Aug 2025 20:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095101.1450226; Tue, 26 Aug 2025 20:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0LD-0002AT-9B; Tue, 26 Aug 2025 20:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1095101;
 Tue, 26 Aug 2025 20:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dtCc=3G=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ur0LC-0002AI-M5
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 20:32:26 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c49d5207-82bb-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 22:32:23 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 57QKVpur086407
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 26 Aug 2025 16:31:56 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 57QKVokP086406;
 Tue, 26 Aug 2025 13:31:50 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c49d5207-82bb-11f0-a32c-13f23c93f187
Date: Tue, 26 Aug 2025 13:31:50 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, xen-users@lists.xenproject.org,
        xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Paul Leiber <paul@onlineschubla.de>
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
Message-ID: <aK4Ztm8QE3O6Ifcc@mattapan.m5p.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <5b85b5da-dfa3-465a-9708-62fc55fe48bb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LfyIUR3M96B+0imR"
Content-Disposition: inline
In-Reply-To: <5b85b5da-dfa3-465a-9708-62fc55fe48bb@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com


--LfyIUR3M96B+0imR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 25, 2025 at 10:07:18AM +0200, Jan Beulich wrote:
> On 22.08.2025 22:09, Elliott Mitchell wrote:
> > On Fri, Aug 15, 2025 at 10:14:42AM +0200, Jan Beulich wrote:
> >> On 14.08.2025 23:27, Demi Marie Obenour wrote:
> >>> On 8/14/25 02:55, Jan Beulich wrote:
> >>>>
> >>>> Parties interested in changing the support status of any component are the
> >>>> primary candidates to actually carry out the necessary work.
> >>>
> >>> What is that work?
> >>
> >> To determine what exactly needs doing is part of the exercise. I, for one, am
> >> unaware of a concrete written down set of things which need doing.
> > 
> > Since you're not pointing to anything definite, could it be everything
> > has been resolved?
> 
> Possible. Yet even then the state of things needs fully writing down, perhaps
> in a commit message for the patch changing the support status. That's likely
> still a time consuming job.

Issue is much of this is better done by the people doing those projects.
Most of what I've done is checking a real hardware/software platform and
confirmed functionality.  Presently it boots, but the framebuffer doesn't
work.  VMs appear to work fine though.

How does the attached patch look for enabling ACPI?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



--LfyIUR3M96B+0imR
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-xen-arm-ACPI-Change-default-configuration.patch"

From 492ea48f537934e7b54de66c5018c349c0123c9a Mon Sep 17 00:00:00 2001
Message-Id: <492ea48f537934e7b54de66c5018c349c0123c9a.1756239431.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Date: Wed, 22 Jul 2020 10:43:57 -0700
Subject: [PATCH] xen/arm: ACPI: Change default configuration

Xen/ARM64 support for ACPI has been mostly implemented.  The remaining
issue is handling the IORT table for proper IOMMU support.  This means
systems booting with ACPI will not be protected from misbehaving or
misprogrammed hardware.  Pass-through of hardware will be unsafe.

Systems without an IOMMU are already unsafe so there is no additional
warning.  For such systems defaulting ACPI enabled may allow easier
setup, so change the default.

Presently device-trees are honored before ACPI tables are.  This seems
the best default balance right now.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 xen/arch/arm/Kconfig                  |  7 ++++++-
 xen/drivers/passthrough/arm/smmu-v3.c | 25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5355534f3d..a420889eb9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -100,13 +100,18 @@ endchoice
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
+	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
 	depends on ARM_64 && ARM_EFI
+	default y
 	help
 
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64. This requires UEFI.
 
+	  Note this is presently EXPERIMENTAL.  If a given device has both
+	  device-tree and ACPI support, it is presently (September 2025)
+	  recommended to boot using the device-tree.
+
 config ARM_EFI
 	bool "UEFI boot service support"
 	depends on ARM_64 && !MPU
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 5e9e3e048e..580da2e210 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -82,6 +82,7 @@
 #include <xen/linux-compat.h>
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/param.h>
 #include <xen/rbtree.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
@@ -2364,6 +2365,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static bool allow_ignore_iort = false;
+boolean_param("allow_ignore_iort", allow_ignore_iort);
+
 #ifdef CONFIG_ACPI
 static void acpi_smmu_get_options(u32 model, struct arm_smmu_device *smmu)
 {
@@ -2386,6 +2390,23 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 	struct device *dev = smmu->dev;
 	struct acpi_iort_node *node;
 
+	if (!allow_ignore_iort) {
+		printk(XENLOG_ERR
+"A SMMUv3 is present, but only ACPI support is present in firmware.  At this\n"
+"time Xen's ACPI support is incomplete.  In particular Xen is unable to make\n"
+"use of IORT tables and is thus unable to make use of IOMMU functionality.\n"
+"Booting in this configuration disables protection against malicious or\n"
+"malfunctioning hardware.  This also compromises pass-through of hardware.\n"
+"\n"
+"If you accept the risks of booting without IOMMU support, you can add\n"
+"\"allow_ignore_iort=true\" to Xen's command-line.  You are also welcome to\n"
+"sponsor implementing support for IORT tables.\n");
+
+		panic("SMMUv3 is present, but IORT support is incomplete\n");
+	}
+
+	printk(XENLOG_ERR "using incomplete IORT due to command-line param\n");
+
 	node = *(struct acpi_iort_node **)dev_get_platdata(dev);
 
 	/* Retrieve SMMUv3 specific data */
@@ -2402,6 +2423,10 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 static inline int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 					     struct arm_smmu_device *smmu)
 {
+	if (allow_ignore_iort)
+		printk(XENLOG_INFO "allow_ignore_iort has been set, but ACPI "
+			"support is absent\n");
+
 	return -ENODEV;
 }
 #endif
-- 
2.39.5


--LfyIUR3M96B+0imR--

