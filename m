Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC9AC658B
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999067.1379819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvG-0002ks-BP; Wed, 28 May 2025 09:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999067.1379819; Wed, 28 May 2025 09:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvG-0002ia-6Y; Wed, 28 May 2025 09:18:06 +0000
Received: by outflank-mailman (input) for mailman id 999067;
 Wed, 28 May 2025 09:18:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvF-0000yL-8a
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:05 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2405::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a85e61ee-3ba4-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:18:03 +0200 (CEST)
Received: from MW4PR04CA0062.namprd04.prod.outlook.com (2603:10b6:303:6b::7)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Wed, 28 May
 2025 09:17:59 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::cd) by MW4PR04CA0062.outlook.office365.com
 (2603:10b6:303:6b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Wed,
 28 May 2025 09:17:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:17:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:53 -0500
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
X-Inumbo-ID: a85e61ee-3ba4-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B66ofrYcdS8hRX4OqQIujY8x5VZyws54qL9DTCYX8wkTCgNTqtw1i2CVLCsPPMt8CIbtnYp3XlHp3VwwaLbC3qqDJyp5l8FYEkyKCCRGUQYNmc0paJ6M1Uhm7CvMRkhiySjN+B4ZkckEBxzCgHV3C+zj+Ko5k+5DQtc+HURT2BStQqassOo4RQShS4+t5o/+Rb8omUnFZ6WASnVBvhgIazStbHwFSH6DmxYM+QdcE37NkxL0pZaxN52WMzhux9/zrHoNUTeOBd/v6AxFlFOqPN2o3BxhRk9Ocbor3YeAD8wjWeucDdQwfBc0Ukiw+xIqkQhYY1Zq25PUVIOEhXaNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qImUlx0P5uZHWU7BQHSJftezN9uBylMqS/nrwHVyNac=;
 b=lfXCN/48/qlOsu0zGLNsegQ+6/plB1EdTce/z9fCHjMuHXB3AgoPJDBOq5UvmhiKRvr1YnVOJegHNh/X4HyrcYnhqDMv3YL7YlpiF0fyRe60nPrew1quaZq+78nIN2gOZl+qkFPCPHp4M3C5267iAAaQ1K/GpOFVgT95MGHsXMI86Wa3YcqZkGlPL7xSpS9MfAFRZm1/i6oXQLXaQT0k7lvzQbd8HtiAuRU4BeqBJWwKJ+aR0/wDFf21Bp1e7gupNyqou7SB67PdJffLMUdzBaf1WT/76vHsQY0Z5edGSBt2BjRy3RgyWztC4SFY1EyGnewoGzLSLZnz2rILqGm6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qImUlx0P5uZHWU7BQHSJftezN9uBylMqS/nrwHVyNac=;
 b=jlINwZBveFZu5KTSCPWLDxguqyFPVEi33vY06XnyrljL5Bclo1mbDjsaWNo2h6/Jp5J5IMoLSlZ/vTQ09s6r6VpyS1BPjicyuSHkb66Tobb4FstCRr5tQ+cDRQasqcaEmn6TXWeVGCTqmfVyujbkx7/M7CdAnlaVfuBCSXp0rnY=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 06/20] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Date: Wed, 28 May 2025 17:16:54 +0800
Message-ID: <20250528091708.390767-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c19b35-1c55-41fc-c8e7-08dd9dc88971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rschc184AdWvIMqbMStz/gIZkMGjGRtGkmuh3ZLbVZsXAI6VgDhHU2ebCd9q?=
 =?us-ascii?Q?HJizJPuMZtdV5gihk2dizNbqCUKGMBpOe3Rsjicwsm5ER/2pHzOKejUSgeq+?=
 =?us-ascii?Q?CzDjZ6/fonAD/Y+gNUKxXqUarI0U4EirAN1neqHVi91x0Go5We97eOz8jX3C?=
 =?us-ascii?Q?+K6Oeo3+PbpmyWit1RljS7ygxq+37ds+tu5FyEYDnRlOJuOHQ3zgIuxPV0Ae?=
 =?us-ascii?Q?s/UGKpb5TWU+FiJK2OagNP/64q2Gi+YOw+FyMMQyMf8tgFjfTIboayHLW7k4?=
 =?us-ascii?Q?cPaJzzMio87TYwy1mMWAXT4zWEYEjdMg5N1wWGKxz8+vlOnImx4FOX5+Jmcm?=
 =?us-ascii?Q?6woFAppqYzTpI/Co4LOkXX6r9l+1OLSe8QbyZCPCx7I2WBSlIChe60NkwhXd?=
 =?us-ascii?Q?qFYzeuZGMOp3c0AtitNC8ix0X/INhSvkrELS3mOlpfWHNJLelZwtQaddi2MR?=
 =?us-ascii?Q?4ZHuZPAqjrlAGLOF+dyIW0XQ20cV8tRsUFSuzFhxaLbbo51YL1KZmFZ5/BnX?=
 =?us-ascii?Q?tPVPLrlpqkBu8FWKKSVHqoEypTPzi8Ki/svWTpARUecg2R4TXtSayELP1fAa?=
 =?us-ascii?Q?dOO3LJKQ7oR+JGUklTDR/Jt5DcgAeT3VhH9FeogJufw5GFs1R/7UULRF/APN?=
 =?us-ascii?Q?R4XmGkevp0NkgF//zFuumelo2A32+Bp3o2gLT+QffrWcmFcGG8vOHTM+SLCX?=
 =?us-ascii?Q?barj8nfpQs8afPObUhFizSBlLEsEeC3I65bna7hwOGQmBiIzUwTm90GiSUNF?=
 =?us-ascii?Q?A247RT3386aOAAvdehE4b0Tg2T76qP0fhQNiyIqcmqwsF86IlgAyGcr6h5mJ?=
 =?us-ascii?Q?3hOhR8q02ffoEz8U1k0wAYFgLn/E7Y+OTYDcfrQwHlSNvbUgvFSXONSMWc83?=
 =?us-ascii?Q?NYW00gsHCKWUKd/94qK14iQdQVtIK6bdTHe3IfumQtcigZYGWqpbeQVG4lD3?=
 =?us-ascii?Q?U7buVAuuSLw7zJIBfhCgfWsoo4mE6HPrl0hwBRACLTXdqVXl/6LxUZxu9XaA?=
 =?us-ascii?Q?Ni206UN7vVQBrfI8fs5NhKUGO90Mpzr3UoTp4snSnN1467UKt9wuUF46nwjS?=
 =?us-ascii?Q?aoJ1HLGZTuk3dz0XFZZQixgNDKKbjeRXcPnRaLxCfU1SJOE7aXStfq7+6DpZ?=
 =?us-ascii?Q?fgfniyeu3nPzdMEYjS9AIiw0XohjL/iANxyWM39eiOK7q1kWZH69q2a0ho1T?=
 =?us-ascii?Q?dugqMCNGT6YINXEsygq7/LUfi/K3e6QW6p4VWRJ3uzuBonet1vxzhTX4hjgF?=
 =?us-ascii?Q?+UGjCPrpn6p2WASbNiX32qyZ0Zt7eKDA+heBTfHQHaG6H+XQI1LrHXPT09H9?=
 =?us-ascii?Q?BinXvcVhs9VbED2u05uRcDbSeM5oy1eJ+IpATdFhOfq91RDh8mmGIamdDxz4?=
 =?us-ascii?Q?oyVXMxbf/Wbgr9hlUjDtq4irKlqCKG+NYBHDLiIX42Q/EPcOFMeVsBqyvxx4?=
 =?us-ascii?Q?5DhB2zyWzEk4gQdeDNl5PMN6KMpIbMX9SEMC5cqdTu9Lg2jDRh8bm6VJApaj?=
 =?us-ascii?Q?2nSwCK1NPLDCqJ2Zts/qJfq1/VeO/kh4Gpcj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:17:58.0779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c19b35-1c55-41fc-c8e7-08dd9dc88971
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105

The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
shall be wrapped:
- xsm_readconsole()
- read_console_ring()

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/drivers/char/console.c | 2 ++
 xen/include/xsm/xsm.h      | 4 ++++
 xen/xsm/dummy.c            | 2 +-
 xen/xsm/flask/hooks.c      | 4 ++--
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c15987f5bb..2413cd6c51 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -368,6 +368,7 @@ static void conring_puts(const char *str, size_t len)
         conringc = conringp - conring_size;
 }
 
+#ifdef CONFIG_SYSCTL
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
     XEN_GUEST_HANDLE_PARAM(char) str;
@@ -410,6 +411,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 
 /*
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 22e2429f52..042a99449f 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -270,7 +270,11 @@ static inline int xsm_sysctl(xsm_default_t def, int cmd)
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
+#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.readconsole, clear);
+#else
+    return -EOPNOTSUPP;
+#endif
 }
 
 static inline int xsm_evtchn_unbound(
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93a0665ecc..cd0e844fcf 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -24,8 +24,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .domctl                        = xsm_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl                        = xsm_sysctl,
-#endif
     .readconsole                   = xsm_readconsole,
+#endif
 
     .evtchn_unbound                = xsm_evtchn_unbound,
     .evtchn_interdomain            = xsm_evtchn_interdomain,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3a43e5a1d6..df7e10775b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -934,7 +934,6 @@ static int cf_check flask_sysctl(int cmd)
         return avc_unknown_permission("sysctl", cmd);
     }
 }
-#endif /* CONFIG_SYSCTL */
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
@@ -945,6 +944,7 @@ static int cf_check flask_readconsole(uint32_t clear)
 
     return domain_has_xen(current->domain, perms);
 }
+#endif /* CONFIG_SYSCTL */
 
 static inline uint32_t resource_to_perm(uint8_t access)
 {
@@ -1888,8 +1888,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .domctl = flask_domctl,
 #ifdef CONFIG_SYSCTL
     .sysctl = flask_sysctl,
-#endif
     .readconsole = flask_readconsole,
+#endif
 
     .evtchn_unbound = flask_evtchn_unbound,
     .evtchn_interdomain = flask_evtchn_interdomain,
-- 
2.34.1


