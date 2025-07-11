Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F56CB011C5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040187.1411615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nV-0002rx-Tw; Fri, 11 Jul 2025 03:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040187.1411615; Fri, 11 Jul 2025 03:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nV-0002pG-K8; Fri, 11 Jul 2025 03:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1040187;
 Fri, 11 Jul 2025 03:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nT-0002Li-MD
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 550e312b-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:51:32 +0200 (CEST)
Received: from SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20)
 by DS5PPFDF2DDE6CD.namprd12.prod.outlook.com (2603:10b6:f:fc00::665)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 03:51:28 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::c) by SJ0PR03CA0075.outlook.office365.com
 (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 03:51:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:26 -0500
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
X-Inumbo-ID: 550e312b-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak3kQjr8Dmf9d2SK1qMwCD0mtMOzhC0kWbQlqXpAYCSpl489/DfDNgPcPTbOP6gebmkhIgQGDxZRz+tw3XCN4VeWkeC2Fe1ymI0X6e5MUw7spgPsNRYDRbYVgelQ9uXyLwReTcgy2xW7jGm4TbGbs5P3AG08YPsxg5wchGH/iNEKntX/ZJ73ZHUkGBFm4cjixuNYdwyGdKD9ZA3uVXlUwPmhZrZN35w8TuwyGeNFJebFslsGwiPI1FJeV2A8+6qH5eViiQtHqiSzXDJ5ooPrh/muenp+t2rME4yBMXQEVueDTI8eHQYJPCSPLUat7PHq8W5lit4c6NskU8RRk06zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhSTiAWCkEittLXAglOyhq0EQLZozqKFKhLHTXD6T3M=;
 b=Amhx5Y+z/xB1IJn+e1DXa5ncuOwYIhjJIw5i/03YSaBM/+7kuqsNtVIBm2W89WQLr4gPP13NC6kwM+B8QaYum1W8vEc5u8jREgEVVd5gRnGwnRgkRhGkQEMZsI2Tc+NsyKfbu74oqn6Wc6WLGkqmSW8vjsr3H0LDh2nbykgmcV62j44i3QNPY9EUmC4lhvJL3p3/XYNqz81yjt0579+hAbqweZQlwHvFJ+Mm5Fa7QwKtEMkyualQJDFBjLWa4L8J96AA6RUwxAQ/KZ5+TsqhUfIuT4IJ+EKJlqEyhLOjYP03bBp2W/AMY1poNz5K6TNryXLJXJPl4VhfSesi5UpJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhSTiAWCkEittLXAglOyhq0EQLZozqKFKhLHTXD6T3M=;
 b=EBjIVsw5YyZpBaNYU6eh2t7sPkef11Pa3elJP8PcK7eDU1oF2QENy7t+N8GH4OPgh9PDz1rovykImn4D6rGupR3lWxuEc73FkdjwDXClkumWLSP/zH/zBfm49dwKVt1OyyUYHw6qRTIXBYR5Px4m9w0o2yhvB4uV0Ouz5/wLpmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 02/19] tools: drop "has_num" condition check for cppc mode
Date: Fri, 11 Jul 2025 11:50:49 +0800
Message-ID: <20250711035106.2540522-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DS5PPFDF2DDE6CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab1382e-ea66-43f1-9a7b-08ddc02e3750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qicdqS3vNXpUPQSHTFv+TJ+XAQPQyHDR/2khT3JIgRqZRAQ6Zd3aI7+xhICD?=
 =?us-ascii?Q?Efii2HGHK1XIoXi7QGc3CWSKvfZkLy1K4LTOhYMTgerxZosNpXSVBvht/ovk?=
 =?us-ascii?Q?5Kn9pJLysoa7swx8VFxmMVEu0Rr/pGyY365lXpm60g479qQ4GSExKaGB5XJL?=
 =?us-ascii?Q?fZ9m08izlQFBy/VykjJATlXrBRtzSWkFnqpkQLkKMrSzsY4SRgYWAqSpRAVN?=
 =?us-ascii?Q?kGk7BsYhHVMNTNy6U0pF+m0lk77U/x3A0yFd4WT3tJwq/LRU1HMiMJDGlmac?=
 =?us-ascii?Q?DV9as9hCXz2Twk4q3DDvE6WGPz4WOFYvKe+KLQ9tzM2wpe41QEzy2HUPefgT?=
 =?us-ascii?Q?paV+TNC69fzq+9RD1kcT5v41cYaAWnN0RbC14nu2VDSRQO2hOQVXklG/Fbg1?=
 =?us-ascii?Q?hRHbPytmi3avLGaFLSTbJAqBOsmEn42pUtrePTFbygCnHkozNIFekt7fKkRm?=
 =?us-ascii?Q?vgd2Qp+QdTbJwywEQNKDRIz9M6BTSg0DpkC1+DuOWaK4rbNkt9D892MW3+H5?=
 =?us-ascii?Q?ZEn4AxtSSJ00FKBntItS+XxZRmhdSDqQi7eluaUJBXCh48k7sfffnl44ZsRP?=
 =?us-ascii?Q?CYVG9TGGs0fJ+2R6QGdShd07V8OfhynpFPT+k6h94vHmz31yQpImlLF75Teg?=
 =?us-ascii?Q?EnwXTR/JsO83m8HJhdzbIyl2stSoLF83p5ugc5UA6fvDQ3qbS6weQp3KrlgT?=
 =?us-ascii?Q?UFnxMuBlNb8vxM5gvWFn/835nTVj+lENGAMHdxaaNDnWrMLmrus7Sp2G+kzK?=
 =?us-ascii?Q?QJB4u1C2x3LjajY6hReUAP2NHkdg+FWLIYyNlvW/sRr3w4/hzSeCRElEhke8?=
 =?us-ascii?Q?QeEJ6KGAgR+bG6vUox/I5UxAZcAK7JZ1fwB53CgY7NkmSv7QsOJEbkkjdVT/?=
 =?us-ascii?Q?9QbIUbXF078MUOvlIfZYekJRGSW8pM27pxltQBgJ08qzeql/gBiRlv2n4nyA?=
 =?us-ascii?Q?2bbnQoP6xF7rJJVu/38dOh7MUKgCOgjqMvyko1ED+bx7+DGZxSZfmAB5YOya?=
 =?us-ascii?Q?5ocmIyZukYFxp1q2Tm01sgewp+4EZVDmsOvTGlw83CNc8NOpouriDbFZMpQ6?=
 =?us-ascii?Q?Ue9Yw8odoL7KLPd8HsMH9ireRdsdhVkIcmkbc4U36B/qhc8q2xqguKrKoIh7?=
 =?us-ascii?Q?4PyVV4sz3/nYKEMZRN8bwm10WyDW7B/h1Q6mu4xqJcFCiRXD6WpwU7oS6x3i?=
 =?us-ascii?Q?kfWpTM3CybEXllZ12fJ0EPndmZKZgdsbj0VkB+I4q/mYf7xbg1O/hb8uqamZ?=
 =?us-ascii?Q?rPqMEpIPmm5nRtukG2AfgXgY/XkQSDDX5QnGeGhIUXbMsamocWDVS1cLIyfq?=
 =?us-ascii?Q?ooSCP6BALy57pGGEgTZ6NlEu0XoMJEpJY4ie2KaXv2I1Dkp3KF3EdESoBsur?=
 =?us-ascii?Q?mVacty9mf1j02CoRK+dRR05YYoIGDUyHx6+NiRcmKEC94VH7pvB8DGYFDZjK?=
 =?us-ascii?Q?19lzV1Sof0aMgJh2OvvbeGiS8GpLkOyCwrw3oiPFDCXpPSefzyrXDVi8IFup?=
 =?us-ascii?Q?gY0ppebycqSHYiNC4Us6jFnU20hWWRSgoCiS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:28.4185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab1382e-ea66-43f1-9a7b-08ddc02e3750
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDF2DDE6CD

In `xenpm get-cpufreq-para <cpuid>`, ->freq_num and ->cpu_num checking are
tied together via variable "has_num", while ->freq_num only has non-zero value
when cpufreq driver in legacy P-states mode.

So we drop the "has_num" condition check, and mirror the ->gov_num check for
both ->freq_num and ->cpu_num in xc_get_cpufreq_para().

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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


