Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF352B19348
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068364.1432389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKd-00008c-7S; Sun, 03 Aug 2025 09:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068364.1432389; Sun, 03 Aug 2025 09:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKd-0008Ua-3h; Sun, 03 Aug 2025 09:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1068364;
 Sun, 03 Aug 2025 09:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKb-0005hH-9w
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 074dbaa2-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:39 +0200 (CEST)
Received: from BYAPR11CA0055.namprd11.prod.outlook.com (2603:10b6:a03:80::32)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Sun, 3 Aug 2025 09:48:35 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::1a) by BYAPR11CA0055.outlook.office365.com
 (2603:10b6:a03:80::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.19 via Frontend Transport; Sun,
 3 Aug 2025 09:48:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:32 -0500
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
X-Inumbo-ID: 074dbaa2-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4Z4kimgvxmVvYYI7PUufM6lDLeqG8Pdecay6LRqvk5VF6IVHECh75R8p5/3bpPM1domIP0IKp+SI5H1oH79PK6hNTQ0bKtm3O6XkWhUJKf71ihCZjdU5UEBvCyOYfe9+VoSiauHkIo6y+EwX6y7ao/KVxbizynyRddOSR2n4EuThrW0oyIrSdJTWh1pqoE+our5dNggOOVM5txt/6GZnBSTBSo1KEcRx7VEcfQiYISeUIJSwdClGZfz2PAYTz+CjcSBk8bb3prHH/DurekRgvSWm5OJgt6IOqOdVoEBtTi8llaoEPelGBpYpmf5Yi4cJzhuVG2pFUqc9T0by23mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXQ8n/zXbOYYZx6IWWGU89i8B3eWN2TJh2dK9/CAeFE=;
 b=GfXn12YZ78YtVQQlDYNSP2IOSb+UjLkH4GlXIC9xBWTXUlyw+xf2ZgyLqAkAIZ+uDNBy5PMqH9ijx+laioAblJZUFZGe0cFaBgQh8u7wYjy1gXfno9bPEOvgKhMMHP/4MfbQ3mF2BZ0HtvpnvRmQpS3Pm8kaXMnmeZJ1M/WFavqcdkldqJg3oQGcAHQoG+0/qssmkoM/ijW2uxVHTJSLet5Ctbg5dMw9gmaZBa88PPxy8qxbUWYvU49nJ6ty8ShVvDz2mtilfV5T3pPizEgJ8nLIHJcmbBQaSxMXkmvT3TOgbY8lSROHbl/JfpzG04Wrs9WlWmh6KtXw26FTYYgF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXQ8n/zXbOYYZx6IWWGU89i8B3eWN2TJh2dK9/CAeFE=;
 b=Xk3rjwf9HNbGvpc5j9yZT/OW+k8c3wJWhn7uBlc32SDtiqD37Mvt7/8fsOStjKzJGUOnDuStwVN39s0bYZyPEuO1NyyyrrVhxohfJerjYYPcp6oZCkEdi1TmawDxWFC5W2QAlLHqt69V+Wkh10BhzRF/5SSuHujrRD9rDv++tFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: [PATCH v1 11/25] xen/domctl: wrap around XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}
Date: Sun, 3 Aug 2025 17:47:24 +0800
Message-ID: <20250803094738.3625269-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 95377582-44af-4d9d-2faa-08ddd272e9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I0G8eTue3q1D6Quw97AAGPbWIegxlGwEoqjwP6DIJyLieFYD/KCNiMd6Wqnn?=
 =?us-ascii?Q?qsaxMQC8XasUJngLROZzrdaa1P6q5OrkIBu7IBlcfqQ8OSMrAPSNb0MNxY+u?=
 =?us-ascii?Q?hb8lQlkrrH0D2lFtIMyJl9ZfofyDr5B6GtIfbwJHyQCnK3x3GW2cQgr+YQBd?=
 =?us-ascii?Q?5gLcNZzTDG9yeSgt//aTiZ+PRZS3jSm4gG+3u69bufz3JXiYUYd8S4Mztrdc?=
 =?us-ascii?Q?q+IwEZ9yzmluLwMIm33z/uaxLA5Bgu9MJzhEdKuSHq1Awk6q7NSg/iERROEw?=
 =?us-ascii?Q?aImR90q0MCxQWiKmXyatv2elKV8rfCsqDjPqdH6KHa8JdfEjVXwmdnjv+y7k?=
 =?us-ascii?Q?Pp3Y6xXBsnXqP2B90A8YuOfymuJKXmZyu4yjO+f2Ja3c2XsKsrJ44zPX/3hx?=
 =?us-ascii?Q?2x986k1ewjJfNPU6owTbtuDk7gH67goBamOkVVFkCvXWmwGQvJ/SYAhBHHHa?=
 =?us-ascii?Q?ZZs1xao++ltFVDN+BzmpH0skiBtoRQtP/ucuW0C69FYcGZNjE7SeiJVw0WvK?=
 =?us-ascii?Q?qFl7miBvtDwD9sOgGuXbb0CdkmzlBZsUCMoDlHBgU280YHMwICXmPzwOoB6r?=
 =?us-ascii?Q?yIs5msQtY2Mt3FqIhTTRKh1uDmf0irayzqGE3FpVD7OS2h+KN2ei91/dzuYL?=
 =?us-ascii?Q?KHXp/TMPIJHBezNVttA/eV9G5m5q6czgG5rF7sIcquw1F/HGAs0ekOahmihZ?=
 =?us-ascii?Q?z3a+lmKpuQhUOJoAcDY97tWNpQru7DYb7ocC5Vk2JKOWpDWcSREnltw4b6Sn?=
 =?us-ascii?Q?8qD/cY5gSghceos9uqFuUAaZ5aV4eMRLpclS6Xt33Ty8aH6pjkbPI6DYqsm4?=
 =?us-ascii?Q?z8Mu16ReAPS+ITA1z+7Xe9+biFaMYxGODkFpGrweB1IT7eEGbRCaennbsAwt?=
 =?us-ascii?Q?EkbhOwVg7X2PJ5uR16XD1Rl63CVx9JprOjTpkkyKBMVRFE3KTKd2PDhswYZ3?=
 =?us-ascii?Q?CTCPUdd4QM386dbVKFck6Gjusx79lW/M7u5STD8T838zW3tTMc+QPUwEsIqH?=
 =?us-ascii?Q?iLh6tvBOdhj7OPBSxbdqlKIihldAOK3K5PFqQphzrfsQz9FtHLgccMoJIr44?=
 =?us-ascii?Q?Zrcmp9ybmu8aKxO/UX5d0uRfACUHTDqbWlstruD2zzM74+wJdnrsOmNRQodn?=
 =?us-ascii?Q?Xn4lpi/F6ro+VEzNTYpuge08g71kskYPB5VeXLKUQ7QTJnYbFL0QQKINO5Zj?=
 =?us-ascii?Q?jfdIWZbRddETmgGLVfR8EqDdi34GTppOi09+T/+CRsm9wpvRt0Y6x7GXpUfq?=
 =?us-ascii?Q?L/4EX21t2PTE4u0i7tbxHEFS4bY/q58r/Objzpenjk2lirD8WXORuZn4J35X?=
 =?us-ascii?Q?K/CUq9UyTA8BCQosny1C6127g2kjDli1X1mujSP1TV6/WQk2flD6Amian2J7?=
 =?us-ascii?Q?FI3XJOIRbw9lTGntw2ya5V5dkOD+cDK24vs2zzF324wv3WEYLoEq7FR0twVP?=
 =?us-ascii?Q?C3aB2TD9CjGQAQphuI4DTj/fIjn2cgjSk6oxntvB0T6Yr/oGTzn5HGRbZPLU?=
 =?us-ascii?Q?wjANB7oOqJ+RGpxKpsgVCGqaTniZVS6vuCph?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:34.5839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95377582-44af-4d9d-2faa-08ddd272e9ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964

Function vcpu_affinity_domctl() is responsible for
XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity} domctl-op, tracking its calling
chain, the following function shall be wrapped too:
- vcpu_set_soft_affinity

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/sched/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 2ab4313517..14f27fe70f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1402,10 +1402,12 @@ int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity)
     return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_hard_affinity);
 }
 
+#ifdef CONFIG_DOMCTL
 static int vcpu_set_soft_affinity(struct vcpu *v, const cpumask_t *affinity)
 {
     return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_soft_affinity);
 }
+#endif /* CONFIG_DOMCTL */
 
 /* Block the currently-executing domain until a pertinent event occurs. */
 void vcpu_block(void)
@@ -1693,6 +1695,7 @@ int vcpuaffinity_params_invalid(const struct xen_domctl_vcpuaffinity *vcpuaff)
             guest_handle_is_null(vcpuaff->cpumap_soft.bitmap));
 }
 
+#ifdef CONFIG_DOMCTL
 int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
                          struct xen_domctl_vcpuaffinity *vcpuaff)
 {
@@ -1802,6 +1805,7 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
 
     return ret;
 }
+#endif /* CONFIG_DOMCTL */
 
 bool alloc_affinity_masks(struct affinity_masks *affinity)
 {
-- 
2.34.1


