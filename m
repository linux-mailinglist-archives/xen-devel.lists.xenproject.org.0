Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C4B50FAD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117593.1463717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQb-0008E9-1E; Wed, 10 Sep 2025 07:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117593.1463717; Wed, 10 Sep 2025 07:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQa-0008Ar-SN; Wed, 10 Sep 2025 07:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1117593;
 Wed, 10 Sep 2025 07:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQZ-0005yo-KT
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4da726d3-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:37 +0200 (CEST)
Received: from BYAPR11CA0049.namprd11.prod.outlook.com (2603:10b6:a03:80::26)
 by IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Wed, 10 Sep
 2025 07:39:31 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::d0) by BYAPR11CA0049.outlook.office365.com
 (2603:10b6:a03:80::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:13 -0700
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
X-Inumbo-ID: 4da726d3-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTZ6Qh4MTMFTbpNxxNnyEGALzfKW9QiV262qFDlKL1mXpywhu7ZQeWEA8rTWybntABpTkQdKx0VkCk4Zn/+wsbN2c/tPCcRJZ9pb+usX5qug7vlDyFtEodNvXKV0lx7t1lYXkh/b6oAOFPfA0gE27uWGSYyqwZK2ylMLpLm7VgU9nVmjF30Y/znZpUvPzJ0MRTBKH37a8PLuR3Zi6xoEKmeuCQXvTH3jC0MghgfSF5o7WvjLE1Kthm6jSL4iF0PcNEIw6OiWW5um0rHafUAU1rX4YR9spB4sOzSZYfxze74/qqkXq9pfDRlfOGzLW20t1enEth3uwEyVRkUAh8/46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTp42bSRhvcOVjyyk45wHe2EzSvJUdHkIazLuJGONW0=;
 b=rds/uSPeY8WiIi7nzMTW5acYHgbyTZeSaQioK/hJgFmwJuraL1qbVMAh2CCMXvJ7FkCAuuALhs5+dLU15M9XHFyyvSHW2XrDQw15JBRxIBnEzw2KZvgCxkShJyA5vwQp9YlG69osmqWUjQGpnboOKq1P5rBKxkNKfqUaeTKgkDGYLp/lHMn3r8KW6bSfmnqxwP6yylruC2yR2O/GkopAuKWF4d8kjWvIcqfjcx5w0WNTwFpxOhv8iv1tRB/VC1UX3Fn7wXGlH0BsCn0JTJ1AUhDcpofLDeeSCASW8fBwOzWoSZgebgT/qA7MAgOWCHPAL+r3oopMhM+z2f5kBv2gjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTp42bSRhvcOVjyyk45wHe2EzSvJUdHkIazLuJGONW0=;
 b=NaNrqsR6V0adY+a/gwrIl7TuoBEsX3k8cvmef0oFBCFk3QN2qInkfH6cChjHOHMmIX+ytaMQK/8nWb88JsnSsJgZUNovXt9q6FPnzjJ8cO0b3XTQdozlbTy/Jq9TkQ16Gb+lKmxLoqOKPrcRQASvjXbntucbjeox5bg58YvalTc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 06/26] xen/xsm: wrap xsm_vm_event_control() with CONFIG_VM_EVENT
Date: Wed, 10 Sep 2025 15:38:07 +0800
Message-ID: <20250910073827.3622177-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA1PR12MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 4343a5d8-9658-4a14-11a3-08ddf03d2dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h02Y4c5oLfnA7rjckCmcjoJuAv9ATOrf5OEH9R8o/VlA+dnjXJb76xsnXdMC?=
 =?us-ascii?Q?UHm4iWGTUuDhUz2WLH4UtF4zy/GAi+7Fi/2oKAAS23aOqylIlLr3nBqZu/bb?=
 =?us-ascii?Q?CHxic30sy/jhA9+jHSaKUNSZUwajlbdO9BisG/IBwDnv/artNPt+2z9mNdDl?=
 =?us-ascii?Q?AbRJRqE5OEM1vO3IvoDMEF27HYY1LBFrsGHG3KdXa/QfIPp/uYia3+7Kb7uf?=
 =?us-ascii?Q?YgMLdpPN57jFBQBvmWlBthPE+8OTXSLtqqlGcznp7s+m3MhKe/xbtcJPK5Vr?=
 =?us-ascii?Q?0xYUq1FmmzZqn0zTW4kgjO+wfmn6LzK/WipluFdA518dXQshRiwLABjsuadj?=
 =?us-ascii?Q?CNR7ylCzHoUGGyC89EYfkr+lA8WlGSTwMrv8Goj3aErb17DcpFIiWMHMZhcr?=
 =?us-ascii?Q?ArvFFJ/v5yoBxcBGnqw6idiIVWTfRQqy17Cd4eMFl5usdK0CG1ojVVgJrmt7?=
 =?us-ascii?Q?3Dv1QLMoA5AbFtGnmxbY1nPx2vPuot/3fnC6vrtsKdGbc00SZdFmckZy/TFO?=
 =?us-ascii?Q?Id+uWxYaLGPAiubaEs8BgEnorokbNylZR13tFQGvADvej4C8iYYwKTYf2Qb8?=
 =?us-ascii?Q?vKgkFONNaleoK+0tYylm4CsHKKeQPki66IUBjBxlqA+SyT6yVcB7TXvHs0Le?=
 =?us-ascii?Q?+Re7nwPvQitB3m+Za+HEXtQytFBeqYgqQQM9I8O9pl7p+0UGPcmdO17k50Dh?=
 =?us-ascii?Q?iRKIillq7fEIO6E1F6EhugaH15F7oih8DoxYqATYLWbzJiWQvVxHkHJZ9E+N?=
 =?us-ascii?Q?0o69pf111U8zOTGiNdhnKB4JPL3Qx65ID/+Thu+ikBfy3JapyG7Csh+8xwo6?=
 =?us-ascii?Q?cwGBb/v7hfVQLYSnEx2Yrifr3osWtw6iVYPP83U+/dgXw9khtMknUYr0awu+?=
 =?us-ascii?Q?EihSTKxxP9i0BG6wL1wme1GE9OlYGA8oT95gVmuxA625zPrazSVJ6H2TYYXu?=
 =?us-ascii?Q?nfSszLeBbOvRVn/Lyt2MMyixZex+Z4T2jrrbV8DG2Tbmd835Vt5z24aRfEAu?=
 =?us-ascii?Q?qXYi2Hsaftq7jViA0t7x1K70rVVTf3cHY2IuzXQtl6tlK9dz0FVi/xka0J9b?=
 =?us-ascii?Q?HNOXtXw2m9nfdArVWYCWxebP5TREsSxvjr5uznYgBILs9IvrXOXsJ9YK6CK5?=
 =?us-ascii?Q?Kl8QibM7yeUkzD6n9JooRivXf0F7WPbOhdCx3xrVyxR78SMsbP7g7gOXdkv1?=
 =?us-ascii?Q?FzWlw2Q/in7X5i1HKRKu3vUXbhf+9F1twJ6Pjpkn4csd3YU76PC75FXHOcN9?=
 =?us-ascii?Q?Xe5NL+M1+QYGS+pDJS2mVAwgfpUMasILAKQM1tCq2An/wr7XVlVmw2d/6+R8?=
 =?us-ascii?Q?a4eWEovTRmU2QSaBNhsbO1N8CcXP7Im1G3mBlNeBKL6NpvHs3RnmgdiAWvAG?=
 =?us-ascii?Q?ptaHWbxdWu50dBwOqcgSje7wlNz5sE4SAcfHiNcvQSSiEcR+yjtFUZ5hq9td?=
 =?us-ascii?Q?j3H5t+dw4vARIHobThzhOub/YZu6zN+m2I2i39J0ytsWw8olD7lm6amC1er9?=
 =?us-ascii?Q?pdd1nSt9+V+OIiS3IYWBhdyd6hrhFOJbUCn6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:30.6639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4343a5d8-9658-4a14-11a3-08ddf03d2dba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7709

Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
it shall be wrapped with it

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
 xen/include/xsm/xsm.h | 4 ++--
 xen/xsm/dummy.c       | 2 +-
 xen/xsm/flask/hooks.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 3c960ad909..1e4647f7db 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -155,9 +155,9 @@ struct xsm_ops {
     int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
     int (*get_vnumainfo)(struct domain *d);
 
+#ifdef CONFIG_VM_EVENT
     int (*vm_event_control)(struct domain *d, int mode, int op);
 
-#ifdef CONFIG_VM_EVENT
     int (*mem_access)(struct domain *d);
 #endif
 
@@ -649,13 +649,13 @@ static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
     return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
+#ifdef CONFIG_VM_EVENT
 static inline int xsm_vm_event_control(
     xsm_default_t def, struct domain *d, int mode, int op)
 {
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
-#ifdef CONFIG_VM_EVENT
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index f5483e0709..2c70b979d6 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -115,9 +115,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .remove_from_physmap           = xsm_remove_from_physmap,
     .map_gmfn_foreign              = xsm_map_gmfn_foreign,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control              = xsm_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access                    = xsm_mem_access,
 #endif
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 21914d3507..ec3880f631 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1365,12 +1365,12 @@ static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
 }
 
+#ifdef CONFIG_VM_EVENT
 static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
-#ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
@@ -1967,9 +1967,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .do_xsm_op = do_flask_op,
     .get_vnumainfo = flask_get_vnumainfo,
 
+#ifdef CONFIG_VM_EVENT
     .vm_event_control = flask_vm_event_control,
 
-#ifdef CONFIG_VM_EVENT
     .mem_access = flask_mem_access,
 #endif
 
-- 
2.34.1


