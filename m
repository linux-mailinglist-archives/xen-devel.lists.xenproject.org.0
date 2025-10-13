Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F31BD28E8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141998.1476234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlV-0004MT-Q6; Mon, 13 Oct 2025 10:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141998.1476234; Mon, 13 Oct 2025 10:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlV-0004AZ-Iv; Mon, 13 Oct 2025 10:26:53 +0000
Received: by outflank-mailman (input) for mailman id 1141998;
 Mon, 13 Oct 2025 10:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcT-0004Rd-Nc
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:33 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3fe1650-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:32 +0200 (CEST)
Received: from BN9PR03CA0370.namprd03.prod.outlook.com (2603:10b6:408:f7::15)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:26 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::bc) by BN9PR03CA0370.outlook.office365.com
 (2603:10b6:408:f7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Mon,
 13 Oct 2025 10:17:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:22 -0700
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
X-Inumbo-ID: d3fe1650-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+TmLhYvkUxrsb9HH6OioB5u3TU0zlCEisx0Ae8ECYzGBz9cPKpZw/QIgwthcPPdf0QpoC62B0mhaLuFhyi/r++IU1G/yB0vhT//EJQ97ASL3I1FenkjrFO61KvWU2lYMK1qaKQ+krrPH2+tSvb20pUH9+SkXzqLB83Q7dC9YAy1D/7mwdlFbmiM6ILQzp6yRNLhKxTCi3brApSbSGrKdnqv0DpGuo8srxBsPxuALHGjmJMQ20qTdMdr3e0zWN1R8rsxd0I1jOUuhtee68g+9ZC0/HS6YvKAAoJtNSNs09BdqaaihjwkbHN8Pv+yMffLXM54HxaZijelxeR4YOSy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YELLYuqS3beGRGCdrjmEPSo/sZ0bAJFVyR31X1lY/ik=;
 b=vohwMXFVMzL5e9LJjOYLmqV4bGqGi0GPSGi2AC6bGIJaTFUcFgjLzOCXNPlmpGtOPTXRgJvwkFrpuRGw5G0jQkc6w3iJ0WgNXvo2/dJYDgzENQAUICXaeu5d9JNMCAbuaM4YKwL8sPbLO5VBJhmYtihmbM5gKKQFKBzLXJ3+2zbvqRoIAh7bEge4GON18CX6qo6y9H2ql1tzhXXjpTEEMl3+tq4N9hBhMRvl8NTr5EvTxKcFCSXRufs4g4HmT4+ImV6cb7aVfyj8U2YXYpPTymp1kMKwrRSd2dWqkG/WssvzYQ/uB5KQo1xnEKN6ts8Ug0opU45Bs5qZ7LIb1wCyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YELLYuqS3beGRGCdrjmEPSo/sZ0bAJFVyR31X1lY/ik=;
 b=3U4/OU6hVNWZktulCuyjRTkSCuognFVOO9YxGhbp119RLd09miqT+qUqSWl1ECYmqjEyMlAmq4Fu6ovmOlXgjG9GV6J3054gx66PC7bb0mpraD+K1wk9HPX1C7i88VouohTuk2lm/sfSduuyQ6I9YLVkPi+aNsArPiZ+wEy6XqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 20/28] xen/domctl: wrap arch-specific domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:32 +0800
Message-ID: <20251013101540.3502842-21-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 888f4350-605c-4439-b2d4-08de0a41b540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/Com2fQ96KKIm2r/l7fZKdWYyY9mvSOi2MFRT40MsnzfI4XoqpJVK526chs?=
 =?us-ascii?Q?Ae8GG5Ab/EucdwElYAApuJhR7NMmReK+SzfMqdGTxqb8/FehT6M9Yxerbf13?=
 =?us-ascii?Q?bNCZezS/Li3eIEPqefEcRoojAzCW03mSrm0czEIxFKzP2LyIwA6L7cwE+LoJ?=
 =?us-ascii?Q?szdmSn1sKyhR2bWRxglGtF/MWNnsBIPmWdDdKQbSohyrgnuESay89VNxkQBK?=
 =?us-ascii?Q?G4s967/6CCigDzIF3kiDElN+W/Rg4MUh0A9egHNU0AcJZSQmsslbv9tR4qtS?=
 =?us-ascii?Q?W4LEIh/Lj+kxlVUWV0TItOUKXCDOQBim4LxC2B7vmW71DeLTJl0ANJK+J/9I?=
 =?us-ascii?Q?paubkYmWsxEiJZOcPtYyQTXNarAdt/YGN3Hxu0AtGJT7B5pWR34bXWrEjdpf?=
 =?us-ascii?Q?T8fdHxtlhKZ8yLw8kK/WTyiXYMlHLw/ID+MbKBXxR1g7bS4iJk3EKvO8HOji?=
 =?us-ascii?Q?HvIGd9hbcgYazhFE86SMWZLOHcL4nIHeIiM31A1/dcCWieUg3nKSRsK3LvSv?=
 =?us-ascii?Q?FIx9Y2h9j9RkO5OSxUcaFju7krH0LzjJDUs04JFx/l4UBIXM3yRoe516sffI?=
 =?us-ascii?Q?wJ4l8dSfH9Uc9p0ToPAprRcySSzOAbLSUuZqC308k5IeyfyjVah+gtwdGKVQ?=
 =?us-ascii?Q?d2ldF/2dUejO3lorpW7NICjzY8TTw/gRKkvvS6i61dI9p/Bdr4NgDjkiedo0?=
 =?us-ascii?Q?oXyG37KhHRfO/JK3hdfbrF3HIaesyAuwoGfO9RGOXBZHmEQnxcUOYaa29p3w?=
 =?us-ascii?Q?ySXOCO1jGnciWoXkTO0sb28AjuX+nJen8M94V4p3Hck2xwI5zHSlduieeKvI?=
 =?us-ascii?Q?Qwb/l4dOl4H+d847ZVNhE99na1nmOa9dAOqKHmqdFumXzLnByPANfvH0cq1S?=
 =?us-ascii?Q?d56uFQOK62mUZ6/QXrbTvBW55sVDpRdmvv85ku41UgsTs5MoE4MM+PGv894X?=
 =?us-ascii?Q?AUp70UVSUnOeqwQsBFi8Cj3d3sjp7WhCUauj753MHhJR50M4fxSG2M8Li1CZ?=
 =?us-ascii?Q?paXrxZbZFhubmXH/hOEWdBnesrdp8yQdWRzhToz+KqMQLiSDzbZ6wkCfKpTh?=
 =?us-ascii?Q?inwCnfvIYH3AGU2A4WOc8LOMFZ7h02CmYsNKdYoN1TMFKGNTFbQHo4BmyAQQ?=
 =?us-ascii?Q?GnRSDoTN9A38b+XPEuuyMpqIDRZotH6Wnm4hmD7Mt1zqdWl/CL9g9nRLzCw1?=
 =?us-ascii?Q?RH3xlTwRQmv5bWSBhhycSfS2drv3LCp0VAUium3IkH2gcQH8sNnvpnTzeAPR?=
 =?us-ascii?Q?MMKOmfh5kKjGlQiJg9mnYcF8BVtwcmCFl/rGxJaA8BDZObh2zsxBy+S8+alB?=
 =?us-ascii?Q?qYrSZzQnM4rbCOMTD8aW88TFEuK2a9ov2A8uFNfU7SlJt9dEbID+Pp5jsD+V?=
 =?us-ascii?Q?6ET6vhIKRll3fulEN4AU2gW9XfMNNkt3LR/3RjoGVspxNUxcXbAhiO5WI2op?=
 =?us-ascii?Q?Lx3Jc9Q2nWcL0n6cjOwPOIlmT0upq++n+O5ob5bUbj5MbsN6GdUViMpgZZ6z?=
 =?us-ascii?Q?FbblQCqzu1zh8IK8mu0c0pDyu8s8m9vW/1GEK6LoE4IDPFXgkwApbUDNB+Pv?=
 =?us-ascii?Q?b6i8HkeRtVacNVjVrhM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:26.2823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 888f4350-605c-4439-b2d4-08de0a41b540
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243

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
index e74d30d258..dfed0b0ab8 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -365,12 +365,14 @@ void force_update_vcpu_system_time(struct vcpu *v)
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
index 3e4280dee1..be1cadc362 100644
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
index 59129f419d..e7394ce8cf 100644
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


