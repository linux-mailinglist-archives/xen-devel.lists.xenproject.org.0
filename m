Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E17AF8EEF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033204.1406678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvV-00014J-AY; Fri, 04 Jul 2025 09:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033204.1406678; Fri, 04 Jul 2025 09:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcvV-00011v-6M; Fri, 04 Jul 2025 09:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1033204;
 Fri, 04 Jul 2025 09:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckz-0007ek-H6
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2415::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9379fcb3-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:52 +0200 (CEST)
Received: from SJ0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:a03:39f::12)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:30:48 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::92) by SJ0PR03CA0217.outlook.office365.com
 (2603:10b6:a03:39f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 09:30:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 09:30:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:43 -0500
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
X-Inumbo-ID: 9379fcb3-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZvUTyVhFHmO2WcdTrXJahpXDWZMiTA4ZWreDaY9S95TBOoGjsL4Wg3q+ePqVbhnwhTG7BPQyA2HpsAN3+b14QAMrvjax9YIu9GrSSaGC0q5r8+IzLyrLDENKomwbvkiIPNfMrI7QtPf3TbPgKbb5eHB7acuDIMaLzwVfEfAIBCWGEt+0z90Y4DBOT2EGMvBe7ofb+4ID2/5welvwEAfj38i9Ncj1aZCT1Gg6Zw00v7Z298V6FCHrpvDq8d8qDnf2hFvYXmc3St8q20F8zaSy/qeC2CvJNPf7DO2hUjOr9nUansCWozp8C1jN0lh26BOGqC3ORvvKJaZBxsVuGdi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uc/bKe0ZCt/bgI6oHn77LOKodpngQIQmpimP9vAyxM=;
 b=SOGbXvcQBF55+QdMhabgB7UpCy2s/m6NsO4xhf++t+07wAAu6mG1GE/gCIQwafYSKPtxg8K5+1RlWIVJhLhwOQ9EsaYhTlF+rh1q6Z8ozEK4PBFy25LCcfTMHuKaziYAHaVHoBjOFUQGBducPBvelZnas+ytks6RPdzJBMNsgaNaE4A4zUbGSmwvAK+xYS4eM5eX1Wdwq9Phk4XfiOcDYsIO6z1GG6ZJGpw3v4KqvP4vlj3EKq+uHdsywy3mIGlzj30Fq3v1CMJPbXisRL8xVlAhTuyJEBRu4DFNj4SriI9hvjF6UW4JmGIEcWUL2GkRCU389rwLATNwB0fsk2SDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uc/bKe0ZCt/bgI6oHn77LOKodpngQIQmpimP9vAyxM=;
 b=TTTdHGV7eta9yYYzApiCSt8zMwJ0zSQfb2S0VM8QTdCWxUpID4qbQDjh1CU54dPkcNSATq1AZ6ZdmCFgdRzY5cBblCpSBb4Oaaa3hXBSI6midk6/NjaSBP9uhw/umf/ohtsQ3mIXm7ug5VHTY71Vu3QNnM5g37dthgu6aGrhGE4=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v6 13/18] xen/sysctl: wrap around XEN_SYSCTL_physinfo
Date: Fri, 4 Jul 2025 17:29:47 +0800
Message-ID: <20250704092952.822578-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 6419e10f-cde7-462f-6525-08ddbadd7548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SQs/ka4gJRorxbrG23NQqymJt5gaYQh5HGwdLhryw72LklAzTUY0ewPgjc9h?=
 =?us-ascii?Q?EaD6AEehWUoSj1HvHrAhWTLXBpZWHi9If9voF6EmRB7qHfNyfH+tFkWdNUeh?=
 =?us-ascii?Q?BnaSmn7aaB9kdFm8el23Fui3oNr9BB8qTEoXfKpoSVFAMDKGRjRoASHgz027?=
 =?us-ascii?Q?8j4SkSo9hKzBQ9KQPa2Wa684suBKWdvsORs2BTe2X+cxDeC/cZPnxb+jk94f?=
 =?us-ascii?Q?qU9hDzwxorJXM2jR9KjLRSAcsobZcXAkPSsJ4YgMqE9u8JckZPNDWdMX4+Po?=
 =?us-ascii?Q?S91DAFD8B+BSPFJxQ/wYLZhuSSNzWBWMte/RQt7b8kxb3SVp+DqIiPYRp/a3?=
 =?us-ascii?Q?tyuk2ekFUeYuwsOCnJJlaFb9O0AcGlWCHS0YPntPyUXqQZCYl9aMwSx5FIbu?=
 =?us-ascii?Q?KH16J8kpokCo9Ihfwj9fqYAebbULdCbqAbq0bbe8uvK/vFlluIczuZE0ks9E?=
 =?us-ascii?Q?rRnJj+8/9tFpjbBljCNGDrt/ro0NaJxWo/TWo1GDG/Cuq9ySZf+jFaA5KJ60?=
 =?us-ascii?Q?mfYcJj0WYcnQff13Oqn97VC/3AY3+27Bzc8JS/bMxe30nPI7J1iCPZhYSxVw?=
 =?us-ascii?Q?90ozSNncwZ924JSqm4tnzmMrqAlW6z1hH4Xmc4RBjPNg5h96sSunLIr2po0K?=
 =?us-ascii?Q?5a/GNoTQDcMDUvoQpezTX4Fb1eLBmjPLETFpNQ0W0Uhr80NzGea5S+DqJA/y?=
 =?us-ascii?Q?yk1DzjIQTxcKGSSEOp0301aSTtszKJGm6WwQ2upl855FA0z0XiUGRpckwjL2?=
 =?us-ascii?Q?h2nscP75BYfOlJiDYKtby8ZYRviHPv2Ky47udHmkNBT5l25IdJ5G73l8ErJr?=
 =?us-ascii?Q?XfOfNZ3z1sHztZwIzOkLk8lehNZJMjhpsXaSB8olF5eQdLZphPEY+LsaNHKb?=
 =?us-ascii?Q?oOCKlGul1VPaZpJTLtLaOuzGSHjUImF/ZVMuI8y1qJnFj0O35S5/9A35rYCI?=
 =?us-ascii?Q?0c05xz+sHuElAYRQGQgoLD4nwaCzQvG9I/Wch9xoEiC8TqAbvHZ/vNqlXbi+?=
 =?us-ascii?Q?0PQfooAU/Dr1fiVpOWkfdYKyfx+mKclI1YnSlbWHPhz7SJ7522JbY8hdbD2R?=
 =?us-ascii?Q?2ilUiAZxaj8CkEtBoMKX+PoEj1FTGr0EFBqrN1i/KfHTFMgAy+7TIWU7Cu6/?=
 =?us-ascii?Q?qmBZLKvO2VozEIjughK5DtdbtF9uMfB5LBItDQVft7F6g0JGob2teQp4k6/D?=
 =?us-ascii?Q?AwLQ/X4Kv8ByNp+drwyt4g8TBlwiNCxb9fFh+HP8btgh2VWyPmkatHWMXRlT?=
 =?us-ascii?Q?NaQX01J942n6bk3ICJF6vPBf7div5lFtcuwMMpsARMb2CX6kij+1/fSCp5yG?=
 =?us-ascii?Q?KrRdv3GbMU9tOZbMUdwkyK7LT7IsnH3Gb7Fk5EOP8a3L471TZQcgR/IWV5AN?=
 =?us-ascii?Q?R6ULAAdy0LcZ/Qy+WWQT0UFuOVbv6jo3R3eOuzDPAeMviQP/IEfaet6teXaX?=
 =?us-ascii?Q?+0DleOUZjwIMUAoEQXKMceYdYDDNBF0oeWbHuspQ0Wk5Ry+ZLbDeQC1VobAh?=
 =?us-ascii?Q?SeCm6vxIgEaqkJ6HlKbfuAhCccGmZQTCj9oA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:47.3353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6419e10f-cde7-462f-6525-08ddbadd7548
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo()
- get_outstanding_claims()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/arch/arm/sysctl.c   | 2 ++
 xen/arch/riscv/stubs.c  | 2 ++
 xen/arch/x86/sysctl.c   | 2 ++
 xen/common/page_alloc.c | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..2d350b700a 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
+#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index e396b67cd3..f86a1c17cb 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -310,10 +310,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_SYSCTL */
 
 /* p2m.c */
 
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..f64addbe2b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
@@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
+#endif /* CONFIG_SYSCTL */
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index dec4cb2ab1..8177d12f50 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -601,6 +601,7 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&heap_lock);
@@ -608,6 +609,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
     *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
     spin_unlock(&heap_lock);
 }
+#endif /* CONFIG_SYSCTL */
 
 static bool __read_mostly first_node_initialised;
 #ifndef CONFIG_SEPARATE_XENHEAP
-- 
2.34.1


