Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAE4C789C8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168685.1494735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtZ-0008J0-8W; Fri, 21 Nov 2025 11:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168685.1494735; Fri, 21 Nov 2025 11:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtY-0008Di-LC; Fri, 21 Nov 2025 11:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1168685;
 Fri, 21 Nov 2025 11:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrQ-0007TB-Mc
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:28 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212e5862-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:20 +0100 (CET)
Received: from CH2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:610:38::37)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:59:04 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:38:cafe::57) by CH2PR05CA0060.outlook.office365.com
 (2603:10b6:610:38::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 10:59:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:59 -0800
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
X-Inumbo-ID: 212e5862-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eno/fBYc+iGKUmo7leJPLHZpMQMcCQNnU/ZA5H7n+/WsJzUqcv7d5KCfuJhSJBRi5iHlA5pdu+OrKONYj934gKev/t/6ttZx7Z/b8vQ8eydjDmEJTGS40hhJ3JHYm8oYVgUvyLE3jpgojMryw+ffoI9iXRjNmtNNim5ZrThqaSR4QmfDYXRDF05ZDljzVG5ZwcFkQRyFthTV9U8dkb0oNAQ+CyH3owZItIoq3Af/9n5vZTA+xKFRPHBtl1no/l+M/V2/bjwWtGUBQf9JGDKtQSlbwdfN4hWdqEN2rMglAIgKK8oAE8UG0k0rSzEIlOqaqqTAgYjp4Jb2AB1MLcrmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3UFs5sCDheraCgj0VMwmwGxoRmq66F8fjZzyOxlM6M=;
 b=HCcCS1HiMzeYggwnFuV6wWq+/R7m16MZvPxGLy8ZRN9Uco0JiqqVLP0vSL42Qq0oqhz3TFs+ybGAfF6gRX1hSldcpJZ/8wFc/kpL3j4oJp3SwNexJOyJ+hfLz6LHwmYcc00ykJhDVXzWCrQoWLPBvzfg9PUmwRhOYRPswoTroTccB8u2JQxFisA92ay4LKVJ5PqAU4mEC9lJ1ArzVge4nowhvupv0KA2p1o/a54kgjlDCeyJ8ekXPybfArGC/zyqn+ei6QkTKrUHCz1ydqSeOsxEGQfoCJdtAuhEncpQ6FGSg5zS5dsPKsw/JGYSDg5blLzYqiEPPw5/mIeRf3DWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3UFs5sCDheraCgj0VMwmwGxoRmq66F8fjZzyOxlM6M=;
 b=KadVtFv07EgKo1bOv8HPDBCSTxtIeu6qS6VfUuF/vBW6O5B0DZZSJKjnM+CvB6OfpIgYrItQn7lYkhZW9st2qN6KfJpXS4mCOktAC3JeCQG2C+0G4kQP+cgzUCE5NAm5oHrl7PlB4p8hC8R9Gygq2V6wv2Yt2bIbseHSuE+/Qz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 12/24] xen/domctl: wrap arch-specific domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:49 +0800
Message-ID: <20251121105801.1251262-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 844d5909-5abc-49f4-05f3-08de28ecfbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UsgNclqnHkocyuiQULa40XQ+Sbul8Dilo8yj/i10sN//rhohEvY3snhtXtaT?=
 =?us-ascii?Q?WRiHyNVeVBfGFMvL1ZeFkwoCm9T9Tp0dWA9IqxxNErZ+40loTQO1y/inmJSh?=
 =?us-ascii?Q?eN6OFeq0eGW0ApvuTwPZHm6GiqbEGR4VbFd17N9/DdSlzhJke4/PebHqHBby?=
 =?us-ascii?Q?M83ovemdYHvM+4hlKcjITB+OHRBi2b35iDXz0MD2Vip7yuBwlSMtpqFo37Dp?=
 =?us-ascii?Q?SVwXZnISu6rbvBpcbsYMMD1Rnh5OD4JNd5wDgBE2BrbEY0hi+IkG/dXHHCFb?=
 =?us-ascii?Q?MmBCeMMFY2NauKU8RzwO/xuPPlyJu0gwfOGumVJN4/9/bsz4P5IlQ8XQ56Xp?=
 =?us-ascii?Q?64Rwn9Qdna50l75Y2E/Ekp6G/q4TFOWxALs+v4Ocw5rTzGL20t8ZlSd0UuTI?=
 =?us-ascii?Q?wKozgyGc8ir+NxmhWlBNNNxsG11bP341CFe9dqPGMFebfhcABEbk+XB/BVWr?=
 =?us-ascii?Q?lMCMzZfXYFNtPetzeOYWv34/SX4pHc/KsjZsrUQBlPJthkrLibBJqfyg6xmS?=
 =?us-ascii?Q?qiLrJwXvA4x0Va5DbSFViQB6JIfKA0nXbZ+DJBQGVZTdnpoByClGavfVAH+U?=
 =?us-ascii?Q?dnJ0aS4NiRTiF+r3TCfoareOp7DIbmNmVN+/b/c4nctXhtR1MhPqX865ap4O?=
 =?us-ascii?Q?+zKisQeDrvmVv/8Y7PB7BhyK8V8xyraRr6ENt6NMgY+H8fEX9hoYJG0WogaF?=
 =?us-ascii?Q?7yDox2m7/ZDFw/dnVaQ5Trg5wuVhioKBr2iK0DR/JCYNOhKD0fMj6iTq1v9r?=
 =?us-ascii?Q?QqfEviLe12S7p816lPQVWWk+M2I+IPSzj9tiswWKFEPKBA1Do1dkPph5+QWL?=
 =?us-ascii?Q?warLALIBtkWYpA8E/VJYJasGePgA2Z5Z0zeQlx+/0HZH0e3Ai89CcnlZ4IOP?=
 =?us-ascii?Q?+chTzsQbgBZMztPGAc0tIiXA8P0WzMM0Ns2BbUxxS3uKmIY1MFyLXpNTVvTI?=
 =?us-ascii?Q?JW/X9ipXIQX8i+5bSyXPMbs4HtQ6+ZlPRtS3g7f78TTZp4HyaDzppP1Wew5z?=
 =?us-ascii?Q?xb2peddHl9dg/UkntCZTkJoHqztlEMzqwiHdLx9ugQZDNOPeYNhMkBbOy4hm?=
 =?us-ascii?Q?Rq8epYrmHGhHSLJ4JVaBzVu1uONAchvuq+ZwX+GABR6KLJDCzpheNRk6YYGe?=
 =?us-ascii?Q?SKNNiS38dm/QqAUhDMxtSP8DpvgpuMXTfapCXgdfKLIBu82t3UZQroaGSurm?=
 =?us-ascii?Q?FH17kJSmvHml4iCliFF5LKt0T9m7MjJHgeOntlPhH1QDMphE38c3hZgOaEEj?=
 =?us-ascii?Q?jAX43i/84WmT/LZZMgtE1Gk6erwWUqtfgVJgWsGIInX9+EmDXJgiEIfyVade?=
 =?us-ascii?Q?rI/5qltkQWtgahfe6ePptTQv/8jKOZE7eBnToNZAzvRTZxpQksyHR7d5f8Z7?=
 =?us-ascii?Q?roJI737cRyU+DaDAjK2XG8poeQfXmYDUmKKncX3sTOyyVYPiIF04t7LefLrJ?=
 =?us-ascii?Q?ZGpnyYkqIj2J+9DGp4l3HkaqHR8RvMzsOBzFa1g8njzM5bawLQAAPX5kldss?=
 =?us-ascii?Q?GKa1StVVqynzeYI3OwqnGKCxQdQvjj1IXGhGoowrP8cqwyrrqd2laUV26inF?=
 =?us-ascii?Q?JFx3ACQ94BT6LLe4Y1A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:03.7093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d5909-5abc-49f4-05f3-08de28ecfbf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191

Arch-specific domain_set_time_offset() is responisble for
XEN_DOMCTL_settimeoffset domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreachable when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com> # x86
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_settimeoffset-case transiently
---
v2 -> v3:
- add back stub wrapping for riscv
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_settimeoffset-case
---
 xen/arch/arm/time.c    | 2 ++
 xen/arch/riscv/stubs.c | 2 ++
 xen/arch/x86/time.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 3710eab109..a40b233f9d 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -378,12 +378,14 @@ void force_update_vcpu_system_time(struct vcpu *v)
     update_vcpu_system_time(v);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
     d->time_offset.set = true;
     /* XXX update guest visible wallclock time */
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 42bac26aa7..b414a85177 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -31,10 +31,12 @@ void send_timer_event(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* domctl.c */
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index ece9ae0b34..8ba2dd9395 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1841,6 +1841,7 @@ static void update_domain_rtc(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
@@ -1849,6 +1850,7 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
         rtc_update_clock(d);
     update_domain_wallclock_time(d);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int cpu_frequency_change(u64 freq)
 {
-- 
2.34.1


