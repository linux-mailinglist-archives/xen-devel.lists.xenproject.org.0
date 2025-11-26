Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA8C8B08B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173125.1498295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIeB-0002y6-IO; Wed, 26 Nov 2025 16:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173125.1498295; Wed, 26 Nov 2025 16:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIeB-0002vS-BQ; Wed, 26 Nov 2025 16:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1173125;
 Wed, 26 Nov 2025 16:45:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIe9-0008SW-Hx
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:37 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 533336c9-cae7-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:45:34 +0100 (CET)
Received: from PH7PR17CA0071.namprd17.prod.outlook.com (2603:10b6:510:325::28)
 by CH1PR12MB9719.namprd12.prod.outlook.com (2603:10b6:610:2b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 16:45:24 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::47) by PH7PR17CA0071.outlook.office365.com
 (2603:10b6:510:325::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 16:45:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Wed, 26 Nov 2025 16:45:24 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:19 -0600
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
X-Inumbo-ID: 533336c9-cae7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUPd+14ZgHAebcKdJ9KhUwr8MOnYnR5cMNJaosy8SIdohr+VaO4L35QMda7gci/4sofa6l21TvNXcXsO4gzWRd42CPBU8tTI5IxcQfgdgLFl4CuTqkcIoTtRSWMeE25MDqqzpbEINr6E+EvlMhfEkCepMof0F7demv6X3RKt0cmAZbzZ91dUZ/UlWH2PBAEvxQtSuE0EEH+3UIWpI0SrcSPZcTAVdM4IElBvheUFehil3NWTBfqYEf5OsE6T3WtH4qkELT87xbWY9q4n7Ix19/fhuuVzvXsy3FM+LXUCilOOsVumxZpo4RYy4sS4SA4RPufNrP1UrmonSq676rrrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLhywCJxmy4RX9T82r1sPpprRxkIaAkFJKes+iOoHhc=;
 b=Jq+rb8JgkLYSgMegN8ddF6+j6sxR/mxOCeoSlI+Lj7RphP8x8aSOlPBGs04QQOg15nkE2xoKTjMcI868PEADIpi3JRFrA64YRoYItKQL99pZjiql0WcKpBjdK8GoPFE1I4hQh/Eh9itBO1OibxIjkXAMPCT/t3fYFC4dGPb1OeJbSamXTWQeFQT3dz/w37PMV9y4VhXfSPsy4EttVjEwwCKpr3hIUu/ba3YTOpEHWggUMTLWV+f3l18AMSvS1GuUlKnq4YXeo3BOqgi0wZrsfjAct9StGtpZ3A1XaZYRfA4I424Iq4DWOd3DTILTFMpAI8U6ecISMw/gHXMyz8u4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLhywCJxmy4RX9T82r1sPpprRxkIaAkFJKes+iOoHhc=;
 b=H3oU33rQec2oQplZEr+U9D5QdgMOtTgHyzgltXXLGc5U/P8ptjzKjHRqF4ZrJT2e41vn6gL6b3Hm+9PKjI9YFK6P88dY0GMan+Z9uKf09ifQ8AFShWawtgE4KqUjLQfHKudVEGiMULUcw7kdalZzOH5YY4AdT3YY6T/Sm2UNMd0=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 11/11] x86: Migrate every remaining raw vendor check to x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:13 +0100
Message-ID: <20251126164419.174487-12-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|CH1PR12MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: b11f391c-b5db-438a-3d40-08de2d0b3233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZMlPT+3Wn27o6LWoJn814qSGh5pIwZYRmFUiLnQuubN+sYP7l5JUMxTp8Pmo?=
 =?us-ascii?Q?ZP8Ob1HarOk2qBsZya4+Mn76C15sUWqXuZoJA5e2KMeUTKrmWzeD9iceNqMz?=
 =?us-ascii?Q?WwZ0LzfmuOLBcVFQcY+LJRAk03Rqawt2Em3jwxTTRn9wrPCDu86qk9cBRsVu?=
 =?us-ascii?Q?j6agBA906QB3+in70PuXWoeKmBp2cj5tlUlXo2LW5m+xiLR/bNFEa2kfMWbp?=
 =?us-ascii?Q?cGwSagtqa6SowNpzg69w2BtFVTxun6cX8Z1efoen/EL1eUUpsLslzLFiAX9Y?=
 =?us-ascii?Q?HvruOL7Nz+OXbb81Yq68twsLlHVLiZmlc3tGVcU3tMwUO60o7QaXkCuw6g1t?=
 =?us-ascii?Q?UsHWU4y3uAPAwsh79kzlr/+anApUSqlyjMrKpamcboRdHsewtvj3UqP4FpnU?=
 =?us-ascii?Q?Xc6uJUhVqovKsn7s9EJxUi7Rd+CeMO42U+ODRMmKYwb3xI5SPQL1hJiR27TR?=
 =?us-ascii?Q?0Ijh3Df3TQQIiro4GcIRrFDTWHGGRG98Ltto2evTifVWq+YQn8+Y+qy0Ah7Z?=
 =?us-ascii?Q?QAujP32u5xvtE63rC4XbRUrub4dYxo8cZCIA25GT2KXVdbHh8HmcW9URejVM?=
 =?us-ascii?Q?WFlQdm6oYF0P/sKDNXq2bX1cJsSv0dzQwVZLMxrHOB8rUmHRhnbyPXPMtQeb?=
 =?us-ascii?Q?smTqqZDjHcQf0tGhN31KNgweSgB31KEBe5oJhdmxdxSaLXEjyGSprGdLXQZf?=
 =?us-ascii?Q?Tj7q1mGOUN/84Ss01lxM+2KsDhWo8MCvlkJVoMTG91valEiyt01bwv+xmnA1?=
 =?us-ascii?Q?YuSBIKNu1eHwZyrqjZC8MLxja342wHP++KXRvpgOzXVNdlMODm9kuUleB+ne?=
 =?us-ascii?Q?Zlza79zYVT5EvFsj4pQhOkjtrMsEGfv7mRQj2+DFCTEEnVrmAkqg4CDOGw+i?=
 =?us-ascii?Q?o9gB57OiEYfjgv0sVRQG3c301Ee7rKSHctSzsJaoJBYIJE4PUPistw8au5Vl?=
 =?us-ascii?Q?I4H3gUKoJzZMtTTsc9RtMoNJv9XjZ5C99bnrB3DE2Bu9myR4oFJDjJsC4rms?=
 =?us-ascii?Q?PVo8RhbBOs4Wich8HnoCIan70p84JnaVSdtV8BiUKuMnePrzyGpjVD98svOQ?=
 =?us-ascii?Q?LiziGoUzwwnsqn13QkbetPDpBPqlcZtmBM9v2F5V7uC2QsGzX2q1iNaKvZzn?=
 =?us-ascii?Q?ieUwYWbZXyL22umzIgFRC5V/z7JCPdHivp8HV4Nfxi3bK89ZblHHcir1hhs9?=
 =?us-ascii?Q?47YHkF9Ex0jQ5i2awoRvQHf/ZhSRd2im5XRvIDH7HTJ0LAovLEZoeJW5xDW+?=
 =?us-ascii?Q?xeYvuXMAyIX+rA9svh+IjLvsT9BYi3ND675WnNNIbRvEgnNCJ9aCaRauoJcd?=
 =?us-ascii?Q?UyDUsBa8c3jvBvH+BWHkbB9/4ZV5wQ9+QVV+i45CSnSjfNs0qtkstsZ11iTB?=
 =?us-ascii?Q?KSB6ZHglhXefIf+OMKk7lk2M6FyQ28CUKbjOyWIUx11yeCVBOdyGHdo9Hm//?=
 =?us-ascii?Q?9nvs1TWNKbWR3RtGZtpXsXwKpqMqVfKSA4jGKi3d5iJU2DuwplIG57wtXS22?=
 =?us-ascii?Q?81I+f9QXF5JNI4qO0Gx58qhkgruU/3eGfyumeHeHReG6jRlXzmFxaE7zaazG?=
 =?us-ascii?Q?7h4IlzkBRMVZ1mAqUHU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:24.1973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b11f391c-b5db-438a-3d40-08de2d0b3233
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9719

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/acpi/cpu_idle.c        | 19 ++++++++++---------
 xen/arch/x86/acpi/cpufreq/acpi.c    |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c |  4 ++--
 xen/arch/x86/apic.c                 |  2 +-
 xen/arch/x86/cpu-policy.c           | 10 ++++++----
 xen/arch/x86/cpuid.c                |  4 ++--
 xen/arch/x86/dom0_build.c           |  3 ++-
 xen/arch/x86/domain.c               | 25 +++++++++++--------------
 xen/arch/x86/e820.c                 |  3 ++-
 xen/arch/x86/hvm/hvm.c              |  5 +++--
 xen/arch/x86/hvm/ioreq.c            |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c          |  6 +++---
 xen/arch/x86/include/asm/guest_pt.h |  4 ++--
 xen/arch/x86/irq.c                  |  4 ++--
 xen/arch/x86/pv/emul-priv-op.c      | 24 ++++++++++++------------
 xen/arch/x86/setup.c                |  2 +-
 16 files changed, 61 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index d60a07bfd5..1d7f19aadb 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -178,7 +178,7 @@ static void cf_check do_get_hw_residencies(void *arg)
     struct cpuinfo_x86 *c = &current_cpu_data;
     struct hw_residencies *hw_res = arg;
 
-    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
+    if ( !x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) || c->x86 != 6 )
         return;
 
     switch ( c->x86_model )
@@ -915,8 +915,8 @@ void cf_check acpi_dead_idle(void)
             mwait(cx->address, 0);
         }
     }
-    else if ( (current_cpu_data.x86_vendor &
-               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+    else if ( x86_vendor_is(current_cpu_data.x86_vendor,
+                            X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
               cx->entry_method == ACPI_CSTATE_EM_SYSIO )
     {
         /* Intel prefers not to use SYSIO */
@@ -1042,8 +1042,9 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
     flags->bm_check = 0;
     if ( num_online_cpus() == 1 )
         flags->bm_check = 1;
-    else if ( (c->x86_vendor == X86_VENDOR_INTEL) ||
-              ((c->x86_vendor == X86_VENDOR_AMD) && (c->x86 == 0x15)) )
+    else if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) ||
+              (x86_vendor_is(c->x86_vendor,
+                             X86_VENDOR_AMD) && (c->x86 == 0x15)) )
     {
         /*
          * Today all MP CPUs that support C3 share cache.
@@ -1059,7 +1060,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL &&
+    if ( x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) &&
         (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
             flags->bm_control = 0;
 }
@@ -1421,7 +1422,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
     case 0x1a:
     case 0x19:
     case 0x18:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_HYGON) )
         {
     default:
             vendor_override = -1;
@@ -1648,8 +1649,8 @@ static int cf_check cpu_callback(
         break;
 
     case CPU_ONLINE:
-        if ( (boot_cpu_data.x86_vendor &
-              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                           X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
              processor_powers[cpu] )
             amd_cpuidle_init(processor_powers[cpu]);
         break;
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index b027459417..b8bfb9fb56 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -471,7 +471,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
-    if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
+    if (x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL) && c->cpuid_level >= 6)
         on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
 
     /*
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 89e2b3d167..27770269ba 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -244,8 +244,8 @@ __initcall(cpufreq_driver_late_init);
 int cpufreq_cpu_init(unsigned int cpu)
 {
     /* Currently we only handle Intel, AMD and Hygon processor */
-    if ( boot_cpu_data.x86_vendor &
-         (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                       (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return cpufreq_add_cpu(cpu);
 
     return -EOPNOTSUPP;
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index fb38be7ec3..6e78250a4a 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -406,7 +406,7 @@ void __init init_bsp_APIC(void)
     value |= APIC_SPIV_APIC_ENABLED;
     
     /* This bit is reserved on P4/Xeon and should be cleared */
-    if ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) && (boot_cpu_data.x86 == 15))
+    if (x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) && (boot_cpu_data.x86 == 15))
         value &= ~APIC_SPIV_FOCUS_DISABLED;
     else
         value |= APIC_SPIV_FOCUS_DISABLED;
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 1acd7c5124..3f3c95eb82 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -759,7 +759,8 @@ static void __init calculate_hvm_max_policy(void)
      * long mode (and init_amd() has cleared it out of host capabilities), but
      * HVM guests are able if running in protected mode.
      */
-    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+    if ( x86_vendor_is(boot_cpu_data.vendor,
+                       X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
          raw_cpu_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, fs);
 
@@ -952,8 +953,9 @@ void recalculate_cpuid_policy(struct domain *d)
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
     p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
-                                            ((p->x86_vendor & (X86_VENDOR_AMD |
-                                                               X86_VENDOR_HYGON))
+                                            (x86_vendor_is(p->x86_vendor,
+                                                           X86_VENDOR_AMD |
+                                                           X86_VENDOR_HYGON)
                                              ? CPUID_GUEST_NR_EXTD_AMD
                                              : CPUID_GUEST_NR_EXTD_INTEL) - 1);
 
@@ -987,7 +989,7 @@ void recalculate_cpuid_policy(struct domain *d)
     if ( is_pv_32bit_domain(d) )
     {
         __clear_bit(X86_FEATURE_LM, max_fs);
-        if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             __clear_bit(X86_FEATURE_SYSCALL, max_fs);
     }
 
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 5decfad8cd..7eca6ad2f5 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -437,7 +437,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0xa:
         /* TODO: Rework vPMU control in terms of toolstack choices. */
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
              !vpmu_available(v) )
             *res = EMPTY_LEAF;
         else
@@ -483,7 +483,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0x80000001U:
         /* SYSCALL is hidden outside of long mode on Intel. */
-        if ( p->x86_vendor == X86_VENDOR_INTEL &&
+        if ( x86_vendor_is(p->x86_vendor, X86_VENDOR_INTEL) &&
              is_hvm_domain(d) && !hvm_long_mode_active(v) )
             res->d &= ~cpufeat_mask(X86_FEATURE_SYSCALL);
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..11cfd6be20 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -572,7 +572,8 @@ int __init dom0_setup_permissions(struct domain *d)
             rc |= iomem_deny_access(d, mfn, mfn);
     }
     /* HyperTransport range. */
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                       X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         mfn = paddr_to_pfn(1UL <<
                            (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f3e4ae4a4d..3c878c92a5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -370,7 +370,7 @@ void domain_cpu_policy_changed(struct domain *d)
         {
             uint64_t mask = cpuidmask_defaults._6c;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+            if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) )
                 mask &= (~0ULL << 32) | p->basic.raw[6].c;
 
             d->arch.pv.cpuidmasks->_6c = mask;
@@ -385,8 +385,8 @@ void domain_cpu_policy_changed(struct domain *d)
              * wholesale from the policy, but clamp the features in 7[0].ebx
              * per usual.
              */
-            if ( boot_cpu_data.x86_vendor &
-                 (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+            if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD |
+                                                         X86_VENDOR_HYGON) )
                 mask = (((uint64_t)p->feat.max_subleaf << 32) |
                         ((uint32_t)mask & p->feat._7b0));
 
@@ -398,7 +398,7 @@ void domain_cpu_policy_changed(struct domain *d)
             uint64_t mask = cpuidmask_defaults.Da1;
             uint32_t eax = p->xstate.Da1;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+            if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
                 mask &= (~0ULL << 32) | eax;
 
             d->arch.pv.cpuidmasks->Da1 = mask;
@@ -422,17 +422,15 @@ void domain_cpu_policy_changed(struct domain *d)
              * If not emulating AMD or Hygon, clear the duplicated features
              * in e1d.
              */
-            if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            if ( !x86_vendor_is(p->x86_vendor, X86_VENDOR_AMD |
+                                               X86_VENDOR_HYGON) )
                 edx &= ~CPUID_COMMON_1D_FEATURES;
 
-            switch ( boot_cpu_data.x86_vendor )
-            {
-            case X86_VENDOR_INTEL:
+            if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
                 mask &= ((uint64_t)edx << 32) | ecx;
-                break;
-
-            case X86_VENDOR_AMD:
-            case X86_VENDOR_HYGON:
+            else if ( x86_vendor_is(boot_cpu_data.x86_vendor,
+                                    X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+            {
                 mask &= ((uint64_t)ecx << 32) | edx;
 
                 /*
@@ -443,7 +441,6 @@ void domain_cpu_policy_changed(struct domain *d)
                 edx = cpufeat_mask(X86_FEATURE_APIC);
 
                 mask |= ((uint64_t)ecx << 32) | edx;
-                break;
             }
 
             d->arch.pv.cpuidmasks->e1cd = mask;
@@ -455,7 +452,7 @@ void domain_cpu_policy_changed(struct domain *d)
         cpu_policy_updated(v);
 
         /* If PMU version is zero then the guest doesn't have VPMU */
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) &&
              p->basic.pmu_version == 0 )
             vpmu_destroy(v);
     }
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..3cbcd98254 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -426,7 +426,8 @@ static uint64_t __init mtrr_top_of_ram(void)
 
     /* By default we check only Intel systems. */
     if ( e820_mtrr_clip == -1 )
-        e820_mtrr_clip = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
+        e820_mtrr_clip = x86_vendor_is(boot_cpu_data.x86_vendor,
+                                       X86_VENDOR_INTEL);
 
     if ( !e820_mtrr_clip )
         return 0;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4084b610fa..8e4050b8ce 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2668,8 +2668,9 @@ bool hvm_vcpu_virtual_to_linear(
         }
         else if ( last_byte > reg->limit )
             goto out; /* last byte is beyond limit */
-        else if ( last_byte < offset &&
-                  v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD )
+        else if ( x86_vendor_is(v->domain->arch.cpuid->x86_vendor,
+                                X86_VENDOR_AMD) &&
+                  last_byte < offset )
             goto out; /* access wraps */
     }
 
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..8bdf52b506 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -286,7 +286,7 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
         *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
         /* AMD extended configuration space access? */
         if ( CF8_ADDR_HI(cf8) &&
-             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
+             x86_vendor_is(d->arch.cpuid->x86_vendor, X86_VENDOR_AMD) &&
              (x86_fam = get_cpu_family(
                  d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
              x86_fam < 0x17 )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6b407226c4..769840569c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3057,7 +3057,7 @@ static bool __init has_if_pschange_mc(void)
      * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
      * this time.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.x86 != 6 )
         return false;
 
@@ -3409,7 +3409,7 @@ static void __init lbr_tsx_fixup_check(void)
      * fixed up as well.
      */
     if ( cpu_has_hle || cpu_has_rtm ||
-         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.x86 != 6 )
         return;
 
@@ -3454,7 +3454,7 @@ static void __init ler_to_fixup_check(void)
      * that are not equal to bit[47].  Attempting to context switch this value
      * may cause a #GP.  Software should sign extend the MSR.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
          boot_cpu_data.x86 != 6 )
         return;
 
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 21473f9bbc..a44909d35d 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -314,8 +314,8 @@ static always_inline bool guest_l4e_rsvd_bits(const struct vcpu *v,
                                               guest_l4e_t l4e)
 {
     return l4e.l4 & (guest_rsvd_bits(v) | GUEST_L4_PAGETABLE_RSVD |
-                     ((v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD)
-                      ? _PAGE_GLOBAL : 0));
+                     (x86_vendor_is(v->domain->arch.cpuid->x86_vendor,
+                                    X86_VENDOR_AMD) ? _PAGE_GLOBAL : 0));
 }
 #endif /* GUEST_PAGING_LEVELS >= 4 */
 #endif /* GUEST_PAGING_LEVELS >= 3 */
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 92b8604dc8..2490331ec3 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2010,8 +2010,8 @@ void do_IRQ(struct cpu_user_regs *regs)
                      * interrupts have been delivered to CPUs
                      * different than the BSP.
                      */
-                    (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
-                                                 X86_VENDOR_HYGON))) &&
+                    x86_vendor_is(boot_cpu_data.x86_vendor,
+                                  X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 225d4cff03..e69450f949 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -244,7 +244,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     start |= CF8_ADDR_LO(currd->arch.pci_cf8);
     /* AMD extended configuration space access? */
     if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
-         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
+         x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) &&
          boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
     {
         uint64_t msr_val;
@@ -868,7 +868,7 @@ static uint64_t guest_efer(const struct domain *d)
      */
     if ( is_pv_32bit_domain(d) )
         val &= ~(EFER_LME | EFER_LMA |
-                 (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL
+                 (x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL)
                   ? EFER_SCE : 0));
     return val;
 }
@@ -943,7 +943,7 @@ static int cf_check read_msr(
     case MSR_K8_PSTATE5:
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD )
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) )
             break;
         if ( unlikely(is_cpufreq_controller(currd)) )
             goto normal;
@@ -951,7 +951,7 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) ||
              boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
             break;
         /* fall through */
@@ -976,7 +976,7 @@ static int cf_check read_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
         {
             vpmu_msr = true;
             /* fall through */
@@ -1103,7 +1103,7 @@ static int cf_check write_msr(
         break;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_AMD) ||
              boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) )
@@ -1132,8 +1132,8 @@ static int cf_check write_msr(
 
     case MSR_IA32_MPERF:
     case MSR_IA32_APERF:
-        if ( !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor,
+                 X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
              wrmsr_safe(reg, val) == 0 )
@@ -1142,7 +1142,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_THERM_CONTROL:
     case MSR_IA32_ENERGY_PERF_BIAS:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+        if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) || wrmsr_safe(reg, val) == 0 )
             return X86EMUL_OKAY;
@@ -1152,13 +1152,13 @@ static int cf_check write_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) )
         {
             vpmu_msr = true;
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
-                              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            if ( vpmu_msr || x86_vendor_is(boot_cpu_data.x86_vendor, 
+                                           X86_VENDOR_AMD | X86_VENDOR_HYGON) )
             {
                 if ( (vpmu_mode & XENPMU_MODE_ALL) &&
                      !is_hardware_domain(currd) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 872a8c63f9..0eca058850 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1384,7 +1384,7 @@ void asmlinkage __init noreturn __start_xen(void)
          * supervisor shadow stacks are now safe to use.
          */
         bool cpu_has_bug_shstk_fracture =
-            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) &&
             !boot_cpu_has(X86_FEATURE_CET_SSS);
 
         /*
-- 
2.43.0


