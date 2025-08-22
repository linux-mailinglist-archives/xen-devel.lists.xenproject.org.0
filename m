Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F4B315D4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089853.1447335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO5-0008Qh-QI; Fri, 22 Aug 2025 10:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089853.1447335; Fri, 22 Aug 2025 10:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO5-0008KF-MP; Fri, 22 Aug 2025 10:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1089853;
 Fri, 22 Aug 2025 10:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPO4-0008I9-GW
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2418::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23551f44-7f46-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 12:52:47 +0200 (CEST)
Received: from BN0PR07CA0025.namprd07.prod.outlook.com (2603:10b6:408:141::28)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 22 Aug
 2025 10:52:41 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::81) by BN0PR07CA0025.outlook.office365.com
 (2603:10b6:408:141::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 10:52:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:37 -0500
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
X-Inumbo-ID: 23551f44-7f46-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGYnH9iRJJJqSAAe5QHL5Bi5IR3prLO2BLaJzgN5gx2CHcFIDvVCdqfcH1dTPtFC+9qaUzlSry646lA0JA485hqryyN6am/KL3Jh8p4Jhjxxugizup6hTa0OtYAfqX/rJCI1GJwhBl73cUcZCE7q3gmz9Ssp6c30mZVaKGeQn3iXenrDcGAv2zKYOOPOkTK2YlYOJy5kAWAHe6LQRLruLR05rKCNal8VSuVZ7VM5dxskI1xnyENra54MMCCmfdE0zqYKk2zlPWg7LPv6eiQ4W9SFuxsRhOMzIonaEEuuTnvq7sTgmDEqmQP9f7z5kxTf7F2qDKUY5apaw4Jmm7KYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xYv/Uz23PS+DveGlKjctHnqXJdmBqFpCRHDX8qCCZ8=;
 b=NL7OZoDuWh2a2NS1F31GNK2ZIS0Ys8WkhtV8naiZKWA+jQNEFrJz3r+UB0Xtz7SSi2qy9nI8ircv+2YokVOn9QT1wVBfODzrhUDx8jWzRwyHJNUhsnhE+6VzYyjrbqekZf+OdRWJZiOXbkOErnVWgIf4wCXlY43hVfUspyKm8CAyWB/ZtA7kwIXHKCYbr+vj+FKoLz/N9UV0qcL6B625Hyo7Ydg5Wf3xiM1Utgs3nj4p9Ry+vwjf82h5I/eRHwFJeOKTyp7v3SI2fb0zlV+D/WyiDJQbSWM9NoTPwqm9qsp4iWNvPz5Vqnn167zM+JdAD1kPkGjVmaqQyn7pO/GzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xYv/Uz23PS+DveGlKjctHnqXJdmBqFpCRHDX8qCCZ8=;
 b=lY0Ri9x2bstTeY5zJs673VGYPR00n76/aAIOSU1wm+ThIkXRw3KnL9Lhy5JbwDSHtzT2sFw6HxeLc/DZbk5nBE4BamunIQzIy+u65/Dp2GTDbbYe7RiXG7ZaV0lQ8V/bnVxtjKFrgQrTsqLlPSbvuEij5zNpyClodxsyYCGmQb8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v7 02/13] cpufreq: rename "xen_cppc_para" to "xen_get_cppc_para"
Date: Fri, 22 Aug 2025 18:52:07 +0800
Message-ID: <20250822105218.3601273-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ca2818-0844-4e88-3c4d-08dde16a0400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XT6yUCX9qEiRs52SzoNWCZ37xrO0Bdti6RhN0cgmfu8hTVAO0NdU3SWn7K3m?=
 =?us-ascii?Q?o2xcd71cwheYKfDdMNsNYb8lDFcT3H8IgDtG/q9b1B4LDMUt2uRm+9IGObcb?=
 =?us-ascii?Q?AK6y5dWtKBu7JCzBncISHlkMGHoUuYslepzhD4hKBZLEzQx7PkpPJtZOQvv4?=
 =?us-ascii?Q?3iTehY/pykJZ/BwFAJbVq3o4sR56COShMucxeZKEmPclmxpENVOnT2U0/ORz?=
 =?us-ascii?Q?G7U4fiqRErP4U4Chmue+yDXDLsoTF92unkjvzj93+G2DL1Pyc1YwXAxzxTbV?=
 =?us-ascii?Q?PAdwzkwIc3KNGHacnL2CmSli4qujKHezwWvk1Sz8/FuSO8Sb6rtMJGe1z7z1?=
 =?us-ascii?Q?HRyesplCy9Klk+U0O7XGEd+0Mj5TI5GJoY+hdcJspP6YbIlIy8xjpz5DUXK/?=
 =?us-ascii?Q?ALudKXWmlhJBR91itqXZaeApe7YrGhKHnTP8+Qaa/UbATPKwUeFeyzJ2ahpR?=
 =?us-ascii?Q?FSE2dNZCEP+Pb0fYS5FFdFGLKISXYQXlHCTFHxPCrDSJ8AaCPRk+B/nn5K8z?=
 =?us-ascii?Q?GsbCepqmhdDDYADCn7yucExLgoxr6MlEDK7M0Xp/17M/Wv/ZTiVwGo6mL57/?=
 =?us-ascii?Q?nJoIpHa3upyMLO31aZasg3tp66DZrfUD41zX0bM1FZ2597P5me4xQhffWkC3?=
 =?us-ascii?Q?6yjuEWDEeP94TDGK5E2LDc8AuZkmYB/mzJ99l92ogQoEaFHsF6XifaTtRBkm?=
 =?us-ascii?Q?XcWHeJ6TFeLe5q5vxW75LHN+H0lkCw16ITY3PIqWVXrCclS65lvcDSczGteg?=
 =?us-ascii?Q?FH0lrd/296RgisZvmvz5zfRegbQuV8g6xb4GktClwWqhqo2e3a9cwmpKWsgl?=
 =?us-ascii?Q?Vg519Z+x50OuqY9HlMsR+t+AiT9NIAnLIr8nxebhZbDt7koeiyV3pnutLKaK?=
 =?us-ascii?Q?Yqm17GxbmJp6sYiMl11rvjLW9dfbp22+NDRnnzcF6dfDItuCbvMKqMiQUb5A?=
 =?us-ascii?Q?DurEv4EdExnhX+x7xLu5RTr+p5RP4fKICRCCEZA7cX5iwHURFkWwUvByewNG?=
 =?us-ascii?Q?y0FdPriZY8UBd6QBLp7BXjuj78TvN4VEdJnEdi2QVvkiNmXGj9VWYH+vrrMj?=
 =?us-ascii?Q?BO93y9zCYdFxnU4Y+7kQ54KeL610nMTPlZX5C0AOLYMMVqXK2mLASz9m5dU+?=
 =?us-ascii?Q?PEVHYdaRd2TKk2L/xAHEpZ6AS1K7zFxhikcuviYKFDzREqwib+tP1RNVVqdZ?=
 =?us-ascii?Q?fhByzLKpjMsdDQoeUXxGDSGvUErapi/JlL47rcyoAQRWzEX/knFc+SGdM9/Y?=
 =?us-ascii?Q?S5m80rvtt0A9NzOIUtDe1kcRXiKlkS1Vy/HtKoiu9qxtMaTbEzj/rQfTZyT7?=
 =?us-ascii?Q?O5WxjRn2Mn6oh3/PZZc/Xm4l5CLIXRXsqUGrcx0aWNQF6yJIvzYx4Duxdiyl?=
 =?us-ascii?Q?1L49MHaWVNZLl/xCc1rHosRkiTABPw4i5EOJrBtuJNiJZsG50NXOeBh8vCNd?=
 =?us-ascii?Q?N+iL7XEa02WxFouVjpL2cub8gWcoir9CQcHiKTFn36fWsQWzYVMBd0ePaus/?=
 =?us-ascii?Q?Vz197nX4wa57U7AC/SE241/ZVj/nb0ilXerF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:40.5947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ca2818-0844-4e88-3c4d-08dde16a0400
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982

As we are going to add "struct xen_cppc_para" in "struct xen_sysctl_pm_op" as
a new xenpm sub-op later to specifically dealing with CPPC-info, we need to
follow the naming pattern, to change the struct name to "xen_get_cppc_para",
which is more suitable than "xen_cppc_para".

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
v5 -> v6:
- new commit
---
 tools/include/xenctrl.h            | 2 +-
 xen/arch/x86/acpi/cpufreq/hwp.c    | 2 +-
 xen/include/acpi/cpufreq/cpufreq.h | 2 +-
 xen/include/public/sysctl.h        | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 4955981231..965d3b585a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1906,7 +1906,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
-typedef struct xen_cppc_para xc_cppc_para_t;
+typedef struct xen_get_cppc_para xc_cppc_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 36ecb0ed9d..7d14a4abd5 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -529,7 +529,7 @@ hwp_cpufreq_driver = {
 
 #ifdef CONFIG_PM_OP
 int get_hwp_para(unsigned int cpu,
-                 struct xen_cppc_para *cppc_para)
+                 struct xen_get_cppc_para *cppc_para)
 {
     const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0742aa9f44..fd530632b4 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -266,7 +266,7 @@ static inline bool hwp_active(void) { return false; }
 #endif
 
 int get_hwp_para(unsigned int cpu,
-                 struct xen_cppc_para *cppc_para);
+                 struct xen_get_cppc_para *cppc_para);
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b7325b0f72..aafa7fcf2b 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -336,7 +336,7 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
-struct xen_cppc_para {
+struct xen_get_cppc_para {
     /* OUT */
     /* activity_window supported if set */
 #define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
@@ -442,7 +442,7 @@ struct xen_set_cppc_para {
          XEN_SYSCTL_CPPC_SET_ACT_WINDOW  )
     /* IN/OUT */
     uint32_t set_params; /* bitflags for valid values */
-    /* See comments in struct xen_cppc_para. */
+    /* See comments in struct xen_get_cppc_para. */
     /* IN */
     uint32_t minimum;
     uint32_t maximum;
@@ -490,7 +490,7 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
-        struct xen_cppc_para cppc_para;
+        struct xen_get_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.34.1


