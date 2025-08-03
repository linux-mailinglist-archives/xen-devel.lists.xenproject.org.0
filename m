Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9516B1933E
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068341.1432339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKI-00065O-4u; Sun, 03 Aug 2025 09:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068341.1432339; Sun, 03 Aug 2025 09:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKI-00062u-0w; Sun, 03 Aug 2025 09:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1068341;
 Sun, 03 Aug 2025 09:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKG-0005K3-HD
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:20 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2407::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc0d94fd-704e-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:19 +0200 (CEST)
Received: from BYAPR21CA0018.namprd21.prod.outlook.com (2603:10b6:a03:114::28)
 by CH1PPF6D0742E7B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::613) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:11 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::b) by BYAPR21CA0018.outlook.office365.com
 (2603:10b6:a03:114::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.0 via Frontend Transport; Sun, 3
 Aug 2025 09:48:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:11 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:06 -0500
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
X-Inumbo-ID: fc0d94fd-704e-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IC0NaRaDI2pu/xzL5DuhIccR8iIPDArRIDuf0laeJyyLigOMcdc78IhEollBIMyCvhAHxvz3LVPvlxxhdMjUt739gwseXU/t47IBUH3waIz9WmD/aJWPb2WexZYvKF/78TA1D/QtO2vDKISRaFOTorbbFJWjs8sfAJc59eHLtjzE1Qmk8/ZvIlYWmtos9Rj8AyvLBGHzsilKSLBk6omaIjjv3vpS8BKVZxTVXi98Fr0lRcuxwFf2CRp0cZYSZiNtLCVXQPktOPggwKTCaph+et+xU2eo507FEJ1z+b1M62/iNyW6pQa4t3impYb/T04+MOVkvXRG3vHA2TlkYYpb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKfaBv21hy3PX6mTeeZ/7uP64ANF3Yth3995UwDHufA=;
 b=IasKbFx7FM7HgS5gS0BF1sSYl9r7vcZVe/Na7/p99c5Wz99bnb9UCN/o1UZb18z5BwU/dOyb/qJDMjBXGZp/1NoQH0pWQDa7p6/D4c7ovT1ioPPuIrN+WTpthKRbbrzQ5AQNiUIzEwOMU7ff67QceC/BBXzGdZHRumAAgkQa9uddk7qUHVhSfR0SftL4WL8XFqakdPFrXH0ZMvloOR0FjkZq9Q9UnjfSNoGCyhzIKkb/YxgWzP/UlM0UZ6Q+u5VQXIHzm6VS64vzMJGo6bmgaM99qmntv8mu1hrH92uunZbBfZHNiWNeR+/4dQdm/ghRuXMQt2Bo3t5m/RHmiCNsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKfaBv21hy3PX6mTeeZ/7uP64ANF3Yth3995UwDHufA=;
 b=F5wx4QJXy5dWPoiOlC25MUJgKI57YSBpPqTLK55yKK1fsAM1ghAgzlxI6x5MKzY5bnk87DO+SZqqM1w35lYphJPNn4DHfPze01byw/PvAn4/Ww3BAOnUYiS/aKF+9/SL/yi51YB3MkS2GN40c0qoD1TUFJAe3k6i0h8IicxwFpQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Tim
 Deegan" <tim@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 03/25] xen/x86: complement PG_log_dirty wrapping
Date: Sun, 3 Aug 2025 17:47:16 +0800
Message-ID: <20250803094738.3625269-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|CH1PPF6D0742E7B:EE_
X-MS-Office365-Filtering-Correlation-Id: 6067b92f-dc78-4a64-2d08-08ddd272dbcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GroV81B/IAcb3fGo5yeEWjymRA6wFRGfSON/lzd10fWY94pP8ivf4FVQNk7v?=
 =?us-ascii?Q?RSLxHCgeHtYYACwuWwdirdKSRBJDkhLSOgYeTJKlgw+iogTrAfI6FKzWrQ6A?=
 =?us-ascii?Q?jY9alHFnL9n+RgqEgniH1Q4dHDq7mWdLKKZnJEDXc+iFPdro1z5jngVboi11?=
 =?us-ascii?Q?gxHrRbK7YwIiqN0pFEj1wqY2xTeerBI6i2/64aHf5XtXqSx7HgfEszfCjMwl?=
 =?us-ascii?Q?V750CTQ1t0WN/C7PgU9qU+fiVrzMwP1N0DJ/cQHkwTF4MN9ZMXu5RYlhYtgB?=
 =?us-ascii?Q?4sn/X3lo5xgK94gSB5FJ4Bd9wSv4n+Qcir8IqtYx1warMPkWP+LppYJoC+ga?=
 =?us-ascii?Q?TZrQzzWAjQXibV9oo1uyDllNb2fBCURHmryBzl4eUri/UFJMRQ1PCEoyq640?=
 =?us-ascii?Q?A55Lu9NC1xL9YzPR6Ljbi7nSbVlI/Sifc8ZpvxSHW9xXxJQpPgajUEQu/3rq?=
 =?us-ascii?Q?QEJT8eZK/gYzoBh4SvHV0R92NlcJqbOxNJA+BbctzTe40WDRujVcB17mcTzI?=
 =?us-ascii?Q?zYGU6yNGhrZLPhFjI4ShOlduXctkAr1zA2n0+FbU9sIa1zYlsbzfm3nQs/P3?=
 =?us-ascii?Q?7Rr9YvCnrfJOIFwjORx3lZtKqwGcPb1tvrOGVV6FlPasc8k+5u/4JxKhpZPW?=
 =?us-ascii?Q?YY+3M4Q3VUXWzJdN8BskjX4aqtQ2di0O5YalcCfDH9nbq6YIFqCl652fZNcq?=
 =?us-ascii?Q?etv6Z+WDqLZXm345PwzDH46BFDCYxt9QEfGrtzzTTvbZT0UDVx7mKjg6y4Dg?=
 =?us-ascii?Q?y8X9uLfdIfjy1gl0RYs1SL3fUY5BFV31wzosATX9jBgCfnk5c/z+SYKYfpD4?=
 =?us-ascii?Q?U/cxZ8/cTJx5yplQWv9NqVbtRmTyjzkkALWAAfuMDxWGi0nhY4oDW8bFppd1?=
 =?us-ascii?Q?NVg7n1l85H/s+oZurMLzsVq/go6e4HFzLTlheBJQjfiXiGPaDKk/Eg4BEYn5?=
 =?us-ascii?Q?qcKNEAaPRxC3vGGMc6aqnBS+lV9vgMVD5eXghLgSBMqeYNHwivcv6aeiZF2g?=
 =?us-ascii?Q?rNwvsUa8OuKl4WbQkPOLBPQDXE4vZWuLyJFEDKpueEHGW1p/fuWXBqcJNbh0?=
 =?us-ascii?Q?h734kHmtKIr+4G+ML959skVAPLYQJi7DXroMeUwQu3hxFq0X7icRoosxv+zR?=
 =?us-ascii?Q?MqFtHmypAz0SDtHU8jaFLP5V7KiH9iH8jGhHAJYsGKhPmbrzLV4+IoLteYaH?=
 =?us-ascii?Q?h+6SohpXIU2oAChylHDHh6TewUlAu8afOp8E9dp0M3/3riSnZXco6tMzdnRo?=
 =?us-ascii?Q?ndyQK9ULtqYOHYdK/5I655RdiS/JPregkJv+IbJMcRGSF7rliCWeZJLaNoFT?=
 =?us-ascii?Q?6mcZn8Nq+vlPYM8t80yl2NFqx6ITBN7wIXEvT0esz6memQzNf9Ss/49vbHGG?=
 =?us-ascii?Q?iwKd8YRd5z6V2ZhgTS2tZ3m1arK/FkMzTQJehDBZp2Lptofy/SnGyrasIVR8?=
 =?us-ascii?Q?0vWLKmdJ5ypTId8ESSNNd0sMjz6pofCbczTQddcyttNK+HeJDD0NV5o4hFON?=
 =?us-ascii?Q?WYbXnws6s8y/XBJdBUQuaYEMCpSsPvpJJCp4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:11.0770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6067b92f-dc78-4a64-2d08-08ddd272dbcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6D0742E7B

We have PG_log_dirty flag to wrap codes about paging log-dirty support.
The main entry is paging_domctl(), and tracking its call chain, the
following functions needs wrapping too:
- xsm_shadow_control
- hvm_mapped_guest_frames_mark_dirty
- hap_domctl
- shadow_domctl
  - shadow_test_disable
    - shadow_one_bit_disable
  - shadow_test_enable
  - shadow_get_allocation
- log_dirty_ops.enable
  - hap_enable_log_dirty
  - sh_enable_log_dirty
  - _toggle_log_dirty
- log_dirty_ops.disable
  - hap_disable_log_dirty
  - sh_disable_log_dirty
- log_dirty_ops.clean
  - hap_clean_dirty_bitmap
  - sh_clean_dirty_bitmap
  - _clean_dirty_bitmap
Wrap paging_domctl hypercall-defs with PG_log_dirty and release PG_log_dirty
from PV_SHIM_EXCLUSIVE, as PV_SHIM_EXCLUSIVE will be cleaned up in the future.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/domctl.c                | 4 ++++
 xen/arch/x86/hvm/hvm.c               | 2 ++
 xen/arch/x86/include/asm/hypercall.h | 2 ++
 xen/arch/x86/include/asm/paging.h    | 2 +-
 xen/arch/x86/mm/hap/hap.c            | 6 ++++++
 xen/arch/x86/mm/shadow/common.c      | 8 ++++++++
 xen/arch/x86/mm/shadow/none.c        | 4 ++++
 xen/include/hypercall-defs.c         | 4 ++++
 xen/include/xsm/xsm.h                | 4 ++++
 xen/xsm/dummy.c                      | 2 ++
 xen/xsm/flask/hooks.c                | 4 ++++
 11 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3044f706de..156c74e07a 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -213,10 +213,14 @@ long arch_do_domctl(
     {
 
     case XEN_DOMCTL_shadow_op:
+#if PG_log_dirty
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
             return hypercall_create_continuation(
                        __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
+#else
+        ret = -EOPNOTSUPP;
+#endif /* PG_log_dirty */
         copyback = true;
         break;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index cb8ecd050d..ea97815deb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2831,6 +2831,7 @@ void hvm_unmap_guest_frame(void *p, bool permanent)
     put_page(page);
 }
 
+#if PG_log_dirty
 void hvm_mapped_guest_frames_mark_dirty(struct domain *d)
 {
     struct hvm_write_map *track;
@@ -2840,6 +2841,7 @@ void hvm_mapped_guest_frames_mark_dirty(struct domain *d)
         paging_mark_dirty(d, page_to_mfn(track->page));
     spin_unlock(&d->arch.hvm.write_map.lock);
 }
+#endif /* PG_log_dirty */
 
 static void *hvm_map_entry(unsigned long va, bool *writable)
 {
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index f6e9e2313b..fac93527ce 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -16,7 +16,9 @@
 #include <public/arch-x86/xen-mca.h> /* for do_mca */
 #include <asm/paging.h>
 
+#if PG_log_dirty
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
+#endif
 
 #ifdef CONFIG_PV
 void pv_hypercall(struct cpu_user_regs *regs);
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 173a569610..956b83215c 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#if defined(CONFIG_HVM) || !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#if defined(CONFIG_HVM)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 668a233923..ccbc9128dd 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -189,6 +189,7 @@ out:
     return rc;
 }
 
+#if PG_log_dirty
 /************************************************/
 /*            HAP LOG DIRTY SUPPORT             */
 /************************************************/
@@ -254,6 +255,7 @@ static void cf_check hap_clean_dirty_bitmap(struct domain *d)
     p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
+#endif /* PG_log_dirty */
 
 /************************************************/
 /*             HAP SUPPORT FUNCTIONS            */
@@ -468,9 +470,11 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap);
 void hap_domain_init(struct domain *d)
 {
     static const struct log_dirty_ops hap_ops = {
+#if PG_log_dirty
         .enable  = hap_enable_log_dirty,
         .disable = hap_disable_log_dirty,
         .clean   = hap_clean_dirty_bitmap,
+#endif
     };
 
     /* Use HAP logdirty mechanism. */
@@ -662,6 +666,7 @@ out:
     paging_unlock(d);
 }
 
+#if PG_log_dirty
 int hap_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -692,6 +697,7 @@ int hap_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return -EINVAL;
     }
 }
+#endif /* PG_log_dirty */
 
 static const struct paging_mode hap_paging_real_mode;
 static const struct paging_mode hap_paging_protected_mode;
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0176e33bc9..f678e7b149 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -69,9 +69,11 @@ const uint8_t sh_type_to_size[] = {
 
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
+#if PG_log_dirty
 static int cf_check sh_enable_log_dirty(struct domain *);
 static int cf_check sh_disable_log_dirty(struct domain *);
 static void cf_check sh_clean_dirty_bitmap(struct domain *);
+#endif
 
 static void cf_check shadow_update_paging_modes(struct vcpu *);
 
@@ -80,9 +82,11 @@ static void cf_check shadow_update_paging_modes(struct vcpu *);
 int shadow_domain_init(struct domain *d)
 {
     static const struct log_dirty_ops sh_ops = {
+#if PG_log_dirty
         .enable  = sh_enable_log_dirty,
         .disable = sh_disable_log_dirty,
         .clean   = sh_clean_dirty_bitmap,
+#endif
     };
 
     INIT_PAGE_LIST_HEAD(&d->arch.paging.shadow.pinned_shadows);
@@ -1414,6 +1418,7 @@ int shadow_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
     return 0;
 }
 
+#if PG_log_dirty
 /* Return the size of the shadow pool, rounded up to the nearest MB */
 static unsigned int shadow_get_allocation(struct domain *d)
 {
@@ -1422,6 +1427,7 @@ static unsigned int shadow_get_allocation(struct domain *d)
     return ((pg >> (20 - PAGE_SHIFT))
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
+#endif /* PG_log_dirty */
 
 /**************************************************************************/
 /* Hash table for storing the guest->shadow mappings.
@@ -2958,6 +2964,7 @@ static int shadow_one_bit_enable(struct domain *d, u32 mode)
     return 0;
 }
 
+#if PG_log_dirty
 static int shadow_one_bit_disable(struct domain *d, u32 mode)
 /* Turn off a single shadow mode feature */
 {
@@ -3158,6 +3165,7 @@ int shadow_domctl(struct domain *d,
     }
 }
 
+#endif /* PG_log_dirty */
 
 /**************************************************************************/
 /* Auditing shadow tables */
diff --git a/xen/arch/x86/mm/shadow/none.c b/xen/arch/x86/mm/shadow/none.c
index 2a4005a795..6c6971b458 100644
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -1,6 +1,7 @@
 #include <xen/mm.h>
 #include <asm/shadow.h>
 
+#if PG_log_dirty
 static int cf_check _toggle_log_dirty(struct domain *d)
 {
     ASSERT(is_pv_domain(d));
@@ -11,6 +12,7 @@ static void cf_check _clean_dirty_bitmap(struct domain *d)
 {
     ASSERT(is_pv_domain(d));
 }
+#endif /* PG_log_dirty */
 
 static void cf_check _update_paging_modes(struct vcpu *v)
 {
@@ -21,9 +23,11 @@ int shadow_domain_init(struct domain *d)
 {
     /* For HVM set up pointers for safety, then fail. */
     static const struct log_dirty_ops sh_none_ops = {
+#if PG_log_dirty
         .enable  = _toggle_log_dirty,
         .disable = _toggle_log_dirty,
         .clean   = _clean_dirty_bitmap,
+#endif
     };
 
     paging_log_dirty_init(d, &sh_none_ops);
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index a2f2a7fa75..c70f745ac2 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -198,7 +198,9 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
 domctl(xen_domctl_t *u_domctl)
+#if PG_log_dirty
 paging_domctl_cont(xen_domctl_t *u_domctl)
+#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
@@ -294,6 +296,8 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
+#if PG_log_dirty
 paging_domctl_cont                 do       do       do       do       -
+#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9a23d2827c..dad69905c9 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -173,7 +173,9 @@ struct xsm_ops {
 
 #ifdef CONFIG_X86
     int (*do_mca)(void);
+#if PG_log_dirty
     int (*shadow_control)(struct domain *d, uint32_t op);
+#endif
     int (*mem_sharing_op)(struct domain *d, struct domain *cd, int op);
     int (*apic)(struct domain *d, int cmd);
     int (*machine_memory_map)(void);
@@ -687,11 +689,13 @@ static inline int xsm_do_mca(xsm_default_t def)
     return alternative_call(xsm_ops.do_mca);
 }
 
+#if PG_log_dirty
 static inline int xsm_shadow_control(
     xsm_default_t def, struct domain *d, uint32_t op)
 {
     return alternative_call(xsm_ops.shadow_control, d, op);
 }
+#endif
 
 static inline int xsm_mem_sharing_op(
     xsm_default_t def, struct domain *d, struct domain *cd, int op)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8b7e01b506..8a893c6eee 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -132,7 +132,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .platform_op                   = xsm_platform_op,
 #ifdef CONFIG_X86
     .do_mca                        = xsm_do_mca,
+#if PG_log_dirty
     .shadow_control                = xsm_shadow_control,
+#endif
     .mem_sharing_op                = xsm_mem_sharing_op,
     .apic                          = xsm_apic,
     .machine_memory_map            = xsm_machine_memory_map,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b0308e1b26..0382182f94 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1605,6 +1605,7 @@ static int cf_check flask_do_mca(void)
     return domain_has_xen(current->domain, XEN__MCA_OP);
 }
 
+#if PG_log_dirty
 static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
 {
     uint32_t perm;
@@ -1631,6 +1632,7 @@ static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
 
     return current_has_perm(d, SECCLASS_SHADOW, perm);
 }
+#endif /* PG_log_dirty */
 
 struct ioport_has_perm_data {
     uint32_t ssid;
@@ -2003,7 +2005,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .platform_op = flask_platform_op,
 #ifdef CONFIG_X86
     .do_mca = flask_do_mca,
+#if PG_log_dirty
     .shadow_control = flask_shadow_control,
+#endif
     .mem_sharing_op = flask_mem_sharing_op,
     .apic = flask_apic,
     .machine_memory_map = flask_machine_memory_map,
-- 
2.34.1


