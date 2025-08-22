Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91987B315D5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089851.1447317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO2-00085T-47; Fri, 22 Aug 2025 10:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089851.1447317; Fri, 22 Aug 2025 10:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO2-00084H-1Q; Fri, 22 Aug 2025 10:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1089851;
 Fri, 22 Aug 2025 10:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPO0-00083s-Iw
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20ca5261-7f46-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:52:42 +0200 (CEST)
Received: from BN9P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::21)
 by IA1PR12MB6577.namprd12.prod.outlook.com (2603:10b6:208:3a3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Fri, 22 Aug
 2025 10:52:38 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::70) by BN9P221CA0027.outlook.office365.com
 (2603:10b6:408:10a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 10:52:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:35 -0500
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
X-Inumbo-ID: 20ca5261-7f46-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOM+OK6mTv3YVYdNvU5TI3zGg2YGNtQLXJE/zH0dz5hI7LmUq3miRHewJdtFuUYJzdsP0WONL6aybHDHEkBchqZLwrvnQdz2thuRg8RrqkCURCiC0nhHuszPAQQ9CfnetyKbWQaMtDTV3MnrBdli7Uaq0noX6NfZQ3Y7/5JVyiT1rb6ckPNN+xbgJrM/TvgqQMCsAFMg9/HEhA2srhgu5Z2YdBA23D+kKpsZwUU5RmHfRtmVfDGBBhgIivh5cmtH4ksNnwM+PIMTAnzQzJay/i400xZNaITvutD7gMPdPpR8JYLU+y4WG0QokvYJyYEJeWAZEURc4G74AZZrPhzvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eH/jkTHsefwa7S1Y7DsPs08pvFQTnoxyzgg34DHQ+4=;
 b=wJJBs+AxdsKnlmDCJ5wyxDUGjhTvEApmsQucKhVRLxY/Ce62f9z1NzAi7pBPeqzmpLxzWVo9Twaubqe2mQRHYkT/2xQSv03yG43Nj9aMroek+40UlmN4yzPCseBs2fmG87rTO69D7BxYxKmGKk0HzEPtG+uam8ppyvvSho+rdrXvNGy4oPH8A6Q8shUPsmwHkcJQrBQBeO4jpL/YrkAq6aEHjZLtuIio0xZmSQBjPR1RKqeUUWFrux7wVY31ijXXkqmbgWlA0Ag6iw1bs15fc4uV/wtkzTvFAEUiXE/rXVLBX4ZiC2L9WCO0g6SLDdk2TRD4QU8w6N5ITxQhOu5LdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eH/jkTHsefwa7S1Y7DsPs08pvFQTnoxyzgg34DHQ+4=;
 b=4VoouHyXeOx8cVUzbZDjGzIeeDnD1ncxicjQsNAJJuoADvM7T1aqXi3nxS8eYZH5hJHDDS7h+BJt1lsf/vBpgtyz7aVYZbsH0AhjaSf8vo9xnFndquoVTGzRIkMzjwk8LHj7b3ux17z8C5k51MauWPJ6BvMZaEhNES92ZiE6K7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v7 01/13] tools: drop "has_num" condition check for cppc mode
Date: Fri, 22 Aug 2025 18:52:06 +0800
Message-ID: <20250822105218.3601273-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|IA1PR12MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: f60bc6de-b8c5-4987-36d2-08dde16a0242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BnhvUBKhViLYt1S2TpRf0DeUOfVnkJPKd1GXlC17La1YcJ+4Wknl5IUBBRL5?=
 =?us-ascii?Q?sNdp0tnbZx1Dkl/o6FXwm9HSa8D5yrIjzra8OyecqBmpH348uSpXW0ZJLSGL?=
 =?us-ascii?Q?OrKaC8cKDP9eNoLQvgd6pBrj/KYC/94qhJy+0T4s4w/IHOSo537r2LYcNODj?=
 =?us-ascii?Q?OTvhagu3FCL8VDtWPy7yP2AgA07nrFc/sF5lKslHlmRtatrX3e172uPJb5lX?=
 =?us-ascii?Q?jeqLEAFU/AJhKg0ChR+xZjaADXmiiUF5T7/G1XPRocW5rzDv1v3HHCEUxzEu?=
 =?us-ascii?Q?tAS9b8/yr+Pr80P59JM/YfmWd2eKiJ/dyGJyaiJsUH23VY8tHXxBfa89qIae?=
 =?us-ascii?Q?+xYlyE1E5FGrmSVDp1Iyz9ejSZZArmS8nA0EbcBFD1OYRVTxD4cY0a0ctRtp?=
 =?us-ascii?Q?4zQSyB4BWHivlc/jRTeg0rnqmgf+nwrv4S7K6amPRXMraCSSq6YnIdEwT+WS?=
 =?us-ascii?Q?9qxM3Ifc0uxRPwwNeE6ywquaFWueKvv753eISDSfN6Y6B7wiDuTxYzGUbeAI?=
 =?us-ascii?Q?Cp+uf1NuXsJvcyZo3XyMLlib8+pJRd+1KFb5x94QhWA9gy1XT+5p3jOegrCC?=
 =?us-ascii?Q?CyYNvTiF1Tta6BySKR5avBtaOt3dXc31oA9VzEY46ocJJkA2Benz+QHibG0t?=
 =?us-ascii?Q?PqYxECqZIkQYjchnM26nwIACdyB6pUZNLvZTUpWhRYjOyuG5n+sZMQq/sKQB?=
 =?us-ascii?Q?cvVi45FAcPj/737CCqSx8RkqELDgngJv7mEdstun9AFG3sv54nfsFs4Zm3xD?=
 =?us-ascii?Q?T5KP+/AuLqvLFSFbEyL7Z95OnCemgcIWoiHo21dOBMKPd5zkr+vnJIZvEB5z?=
 =?us-ascii?Q?jIsor9cjahS+Ba6iNmFiTUreIgKb7dVuJn5dvAz/xLV6atnBvpBBYAjB0c6C?=
 =?us-ascii?Q?//u1YPh5VozwapAHN1hFyeqUHeLOZom4UgH/N8+YEy8Wof50u3SHA885CrRG?=
 =?us-ascii?Q?32L9OmPModgdWRs8JoqLZTJ9Fiqq9EsmeZ73ZCuTGRNUFjilsheqJQqyj9LT?=
 =?us-ascii?Q?S9cECiFQHeMYxpldunjLXZlOoH5hVHjnvZ2wzIQITFRJWjCSRMq8z+XcMpGk?=
 =?us-ascii?Q?qKkvdKPiLbXbuuQpyUWkDNO0DnslriCbtHFSigU6EJFOjjFT6/JpiUAp13Jf?=
 =?us-ascii?Q?AjHSlkA8iih6vv7OoB+wKCLxOysoNNyj5z/ArRWvyemH5VbjBIhvBl5rjnsk?=
 =?us-ascii?Q?qpuLdt+p6GGnreJih9zd1lf12TkqL8bSlmV3c5N1Vu8yDGhi8l4bnq2ZuPMD?=
 =?us-ascii?Q?lf6kAQw5UMK4zsIfij3Gmw7ty5yOkWYwfubc6NZ87M5f+UXeiuoM2OqWYSG5?=
 =?us-ascii?Q?K+dPxxGzOpl5ry+bgD3NRkCooq0BpKe44wVSEd7SZNX21Sg/65cYUBxHQrDT?=
 =?us-ascii?Q?G6UZWB7pedSsvcxr7SwubwBJXDvbo5IdnpNdBC3EQoxwA4OSRWQRhMzmrzdn?=
 =?us-ascii?Q?MvQk147vpeGsUAByYUriqYXb/nzrLGi+8iqQWNu55bnUOFq5iUCdNU0xtk4z?=
 =?us-ascii?Q?PTqKlz5/f1YdSji0KCcV/ScIdqpQ3frLmpyQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:37.6729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60bc6de-b8c5-4987-36d2-08dde16a0242
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6577

In `xenpm get-cpufreq-para <cpuid>`, ->freq_num and ->cpu_num checking are
tied together via variable "has_num", while ->freq_num only has non-zero value
when cpufreq driver in legacy P-states mode.

So we drop the "has_num" condition check, and mirror the ->gov_num check for
both ->freq_num and ->cpu_num in xc_get_cpufreq_para().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v3 -> v4:
- drop the "has_num" condition check
---
v4 -> v5:
- refactor title and commit
- make all three pieces (xc_hypercall_bounce_pre()) be as similar as possible
---
v5 -> v6:
- move set_xen_guest_handle() up to the bottom of the identical conditional
---
 tools/libs/ctrl/xc_pm.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 1f2430cac2..6fda973f1f 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -210,33 +210,36 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
     DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
 			 user_para->scaling_available_governors,
 			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    bool has_num = user_para->cpu_num && user_para->freq_num;
 
-    if ( has_num )
+    if ( (user_para->cpu_num && !user_para->affected_cpus) ||
+         (user_para->freq_num && !user_para->scaling_available_frequencies) ||
+         (user_para->gov_num && !user_para->scaling_available_governors) )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+    if ( user_para->cpu_num )
     {
-        if ( (!user_para->affected_cpus)                    ||
-             (!user_para->scaling_available_frequencies)    ||
-             (user_para->gov_num && !user_para->scaling_available_governors) )
-        {
-            errno = EINVAL;
-            return -1;
-        }
         ret = xc_hypercall_bounce_pre(xch, affected_cpus);
         if ( ret )
             return ret;
+        set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
+    }
+    if ( user_para->freq_num )
+    {
         ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
         if ( ret )
             goto unlock_2;
-        if ( user_para->gov_num )
-            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
+        set_xen_guest_handle(sys_para->scaling_available_frequencies,
+                             scaling_available_frequencies);
+    }
+    if ( user_para->gov_num )
+    {
+        ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
         if ( ret )
             goto unlock_3;
-
-        set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
-        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
-        if ( user_para->gov_num )
-            set_xen_guest_handle(sys_para->scaling_available_governors,
-                                 scaling_available_governors);
+        set_xen_guest_handle(sys_para->scaling_available_governors,
+                             scaling_available_governors);
     }
 
     sysctl.cmd = XEN_SYSCTL_pm_op;
@@ -256,9 +259,7 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
             user_para->gov_num  = sys_para->gov_num;
         }
 
-        if ( has_num )
-            goto unlock_4;
-        return ret;
+        goto unlock_4;
     }
     else
     {
-- 
2.34.1


