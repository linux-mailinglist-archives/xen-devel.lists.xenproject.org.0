Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C330A8797A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949303.1345884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Edk-0002N8-8e; Mon, 14 Apr 2025 07:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949303.1345884; Mon, 14 Apr 2025 07:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Edk-0002LE-4L; Mon, 14 Apr 2025 07:54:00 +0000
Received: by outflank-mailman (input) for mailman id 949303;
 Mon, 14 Apr 2025 07:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ES8-0008Gw-4P
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:42:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2406::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed786eb8-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:51 +0200 (CEST)
Received: from CH5PR02CA0009.namprd02.prod.outlook.com (2603:10b6:610:1ed::10)
 by CH2PR12MB4213.namprd12.prod.outlook.com (2603:10b6:610:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 07:41:48 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::bc) by CH5PR02CA0009.outlook.office365.com
 (2603:10b6:610:1ed::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 07:41:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:45 -0500
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
X-Inumbo-ID: ed786eb8-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnh3RcOkQQsceU4x05xoKzygOJFhVcaZw3kN5PCP6PLmIaUJs8L4kIL6sa/B3vomUTAD33s788m2ckOkboq+6EaDwmQWYSTGVkWwWTRGqKb4n+chtSNMxLQjzSFx5CItfWY1Jv6NjMQ7HRhz1yfe6YY97L3i+eoU4okSWSdaE1c5DKAPXS0htGPXELh73xyLr45YP7OVDhz2zXmA2etDen2UxEDgnYZMwQhU+qPGjMGDDyI8JMLmSo6Nmt7z3r0dJstafYn4OtT+malsZM3dI5SHY11/6YpG25APghgmelHxeO1/itRzMIM1uh69SuwEgR8WnvDm3P96FB/dEvR4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhe9fWyzCuB1fTXHHmSUycGWCQAaLwTayINe6fFp1Yg=;
 b=r7HoCwAyOowxXxuF2+/WCdDu3y37iGqhhm1VajwqC0ntzDQRHPnGvNs8YdNAGwbJBirep+x2a35bIHcr/28uDNOn4JsF2CN5hUAj2vZ7/xMRpEjDKZiiwApprwjqpA8z1+gsrfQ+xv1+mrJXEPMOp/xIK+G+jXfglP6B/x98yNy/SdTKbiqVmf7LVNm/TEgg4XkC/gvfr4rGC/cK60rZe+N2qENWHCvk29f2PtqpjtnMJZmaKmFNqWn3TW49PbSwMKvdFsS+5twt+5i6N8y8s/OC+0khIzMD/HZnhTAbgpwy1Uz/0xm1XAxGAbqe0bLrk/GovmH7bzAlqvSWoEJatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhe9fWyzCuB1fTXHHmSUycGWCQAaLwTayINe6fFp1Yg=;
 b=WgT1kJXV0WqrrRUgGrnRdp/p1qQnZaai6LwyC68XXiJogJNkkvTSbmJQJ4yj+Bq2UyAM7zc+FBzuy9vqNNfH0R/EUvEY5ULwOB47rYg5ISWh6L5U6d7nYRErhdaNBU6Sc0vgJgBl5rImHXGewBdk+kPLarxzq/plCJHmvxGpcFs=
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
Subject: [PATCH v4 13/15] tools/xenpm: fix unnecessary scaling_available_frequencies in CPPC mode
Date: Mon, 14 Apr 2025 15:40:54 +0800
Message-ID: <20250414074056.3696888-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|CH2PR12MB4213:EE_
X-MS-Office365-Filtering-Correlation-Id: c70c26d9-e38e-4568-d466-08dd7b27d004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iqZ7gAnz48iFXw1JAJntVANLiW6mw9tFPV5rtiYM1Tf9FNZyESDtJpxDS0WA?=
 =?us-ascii?Q?ujqMuNrmIS41i0RQB6NvqsBaAZgWuw7dd9BsHDIoPdW5LvvIZDwYAuIbCC87?=
 =?us-ascii?Q?wxD7gMzQl1+3KoTrRDXu3GzG2vJXY0fgr5kmV1qDObxogZdk3Z0gXNTVokIw?=
 =?us-ascii?Q?fashnwS006UbD6K84xXLwmdhkh1NM8zEPr3Rzx6B8h8z8N/jGl+CKoS0Gi2y?=
 =?us-ascii?Q?c2gCtOoRXpKdEpe4OSSRp4rBbyxY30PnafzfzkQP30rC5DulmW0furWkrodX?=
 =?us-ascii?Q?d9FKGgkEOG1hjMwg6CgCnqc84TgTxY3RbjG4EavWrxaSuUguKEnCqwEeYxHe?=
 =?us-ascii?Q?ec2zkg4ra1P7ztW1MpawJm06taO6nSr5EZmGKAPSEp7gpghZR6XRK1gXNbXx?=
 =?us-ascii?Q?N0VCT6ZqikeTE6oHhjj2fwqbOb0Xrki7064/9aEmYPVmQVtYWo6zn+UidON1?=
 =?us-ascii?Q?t0W5xxePX3odAPrOEv4dGGHy/ZOnzJUunzeeOnpbtwEdtgdcpatUdEsQM+/m?=
 =?us-ascii?Q?SmaJL4AdwX/dWEEnIY1rlc3gByu3MoekgDI7sv5053u5NQHjfrDLCZgXQxrU?=
 =?us-ascii?Q?pryHIw1ZEB+E3TZdUBmYAlqurZQEXm8ugllz8loN6jtQ9HNi0SYG7bgNcJwI?=
 =?us-ascii?Q?1I3DAe0VDRBljk+v5rnPCOzufvM+sE8SbeKDKy84oe+nkhF64hKwrBlE1Jk3?=
 =?us-ascii?Q?kjIhJ4ESriFhna/Qw+ekKx9/DRxHMLe4ysqs/UkVy8u6Kp2dFF7xp4mNWA4n?=
 =?us-ascii?Q?9cxt/W7M72Bc18QgGMxYEOMXyWKoNa7Q/fXFLUBprpgB54FqFlbW+JE7hUcb?=
 =?us-ascii?Q?NZgsMjZF8T2qLC9fM5SEV86SGxto38nxP+0wYkEYT0ZMDydjpvh5dmw2fXCw?=
 =?us-ascii?Q?xgdlpW3xwck1a93dnaq3Gw+vFbE4MISOhidR+WKKG03u8mmLNY6DeZLf5Y5u?=
 =?us-ascii?Q?RB7e68JUZLt/o781NHkUAZK0fKYnguQcjRgJkmIemHCdUhTlR3PU+gQqFVD7?=
 =?us-ascii?Q?0+GE8c2FGxpKHd8XAhCuCsxX7hS2wWHZ6uLoIC61V1h2AXRizSf+Pfseh/sY?=
 =?us-ascii?Q?HjIcLYoLwr611Ct/oplY2PZ2NxZMg5ROLBpKRPwm9q6x+N9seOxBerPUtJLr?=
 =?us-ascii?Q?6c3gci1jxihoKzKqqzxjepSvYiezDc2eYGquxHeCRQfRBg1DG7Ctb52riZuk?=
 =?us-ascii?Q?KmApMlHQt+P+Rx4OzIoQs0TMCe+/caaN6x/smksQJK1dDPi4RC5wJuddgaqw?=
 =?us-ascii?Q?jxV3Gf6SUeGSqR0xjiJgyEwpZaigHrjD0nvbT+CnZO5ejZECRaITyQnf4z3t?=
 =?us-ascii?Q?assrWhZeaA1sORwT3HrNZncWFZ4iPhqWMqk/O7RwgrGQ1UliZz1z+jJlehgW?=
 =?us-ascii?Q?IkmKGfiZYmpZvSoWYspw20a5pok19sbQff/hF+2dHXSttFDNDZwhlUAJb31a?=
 =?us-ascii?Q?Pb+/TUGBCQkl17wP8aM4AHiGUoZif6C6MNcQKeerq88qUnkwcfohkccm4hUt?=
 =?us-ascii?Q?l+NiOhEipaUisYbI3DFLyJE+SrsB6K9OXzvI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:47.9771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70c26d9-e38e-4568-d466-08dd7b27d004
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4213

In `xenpm get-cpufreq-para <cpuid>`, para scaling_available_frequencies
only has meaningful value when cpufreq driver in legacy P-states mode.

So we drop the "has_num" condition check, and mirror the ->gov_num check for
both ->freq_num and ->cpu_num in xc_get_cpufreq_para().
In get_cpufreq_para(), add "freq_num" check to avoid copying data to
op->u.get_para.scaling_available_frequencies in CPPC mode.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- drop the "has_num" condition check
---
 tools/libs/ctrl/xc_pm.c   | 45 +++++++++++++++++++++------------------
 xen/drivers/acpi/pmstat.c | 11 ++++++----
 2 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index ff7b5ada05..2089aa41b3 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -212,34 +212,39 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
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
+    }
+    if ( user_para->freq_num )
+    {
         ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
         if ( ret )
             goto unlock_2;
-        if ( user_para->gov_num )
-            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
-        if ( ret )
-            goto unlock_3;
+    }
+    if ( user_para->gov_num )
+        ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
+    if ( ret )
+        goto unlock_3;
 
+    if ( user_para->cpu_num )
         set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
-        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
-        if ( user_para->gov_num )
-            set_xen_guest_handle(sys_para->scaling_available_governors,
-                                 scaling_available_governors);
-    }
+    if ( user_para->freq_num )
+        set_xen_guest_handle(sys_para->scaling_available_frequencies,
+                             scaling_available_frequencies);
+    if ( user_para->gov_num )
+        set_xen_guest_handle(sys_para->scaling_available_governors,
+                             scaling_available_governors);
 
     sysctl.cmd = XEN_SYSCTL_pm_op;
     sysctl.u.pm_op.cmd = GET_CPUFREQ_PARA;
@@ -258,9 +263,7 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
             user_para->gov_num  = sys_para->gov_num;
         }
 
-        if ( has_num )
-            goto unlock_4;
-        return ret;
+        goto unlock_4;
     }
     else
     {
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 0e90ffcc19..83cfef398e 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -228,10 +228,13 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     ret = copy_to_guest(op->u.get_para.affected_cpus,
                         data, op->u.get_para.cpu_num);
 
-    for ( i = 0; i < op->u.get_para.freq_num; i++ )
-        data[i] = pmpt->perf.states[i].core_frequency * 1000;
-    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                         data, op->u.get_para.freq_num);
+    if ( op->u.get_para.freq_num )
+    {
+        for ( i = 0; i < op->u.get_para.freq_num; i++ )
+            data[i] = pmpt->perf.states[i].core_frequency * 1000;
+        ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
+                             data, op->u.get_para.freq_num);
+    }
 
     xfree(data);
     if ( ret )
-- 
2.34.1


