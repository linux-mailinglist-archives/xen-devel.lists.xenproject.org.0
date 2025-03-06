Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7499A548BE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903354.1311275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq961-0000wB-D4; Thu, 06 Mar 2025 11:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903354.1311275; Thu, 06 Mar 2025 11:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq961-0000tu-6v; Thu, 06 Mar 2025 11:08:57 +0000
Received: by outflank-mailman (input) for mailman id 903354;
 Thu, 06 Mar 2025 11:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq960-0000aa-0I
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:08:56 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2407::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 645ddf26-fa7b-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 12:08:55 +0100 (CET)
Received: from MW4PR03CA0006.namprd03.prod.outlook.com (2603:10b6:303:8f::11)
 by SA1PR12MB6679.namprd12.prod.outlook.com (2603:10b6:806:252::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 11:08:48 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::75) by MW4PR03CA0006.outlook.office365.com
 (2603:10b6:303:8f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 11:08:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 11:08:48 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 05:08:45 -0600
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
X-Inumbo-ID: 645ddf26-fa7b-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ii5U1DNS/lAcElrqLMGwXTvggt3TdQOocbHb6t+xp7jJFWmsImxSEbUHCqInVbTVX8OIsTuso0AOSP0oN0pyz0+SQjWfsgYirNCPYqfbgIbqPMZ+6TzI6RpkawQjhYdMjO4w0qGVLvoTZnoK9KTBlgFdIfTOUzJpoLA052p5dQwIs66sp8hSCfiT9DBa9/SNosPIgU3oqpom/h3ShQT7qfbZYxyRX0DKeKXCxXqjkB1lu0JZlc3CUK6zvjT8oRGmZp7i3VP2B8uHEvfb0mPRKK1IXfbB1DENcz3Pcpu59L/lLD+/f13CD7rTZbW+47JYx7/MLMCKnJJxxsVNjpKIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/e/Hlw2V8fXNadO2E5iUFdqkjG160ZTKnpUmCG6fYg=;
 b=lzjtip4VnYvgQxj8Wl1noXuI/uSTT3Ohh3xmf8KGRcGrglwehR5ms2+1EQFg0b2G1K/LD1P51mIR57hZIXfOlLtN3RuYTGITYgQ0B+d3wdfjiDXBo8F3xujSRIPb2g3Q4ShUV+r2UUFWCWEGZbJMX6LdlFg+mAIwwdf8tsz0w1grxGnCoh1gBs9atsRekW1ghsBrQMCC+Az8S4tyDEPqwT1BkEwtceJYjTuRveYI0fPRyPgfN3kwpTsRtsBvKyJkjIaBsepnPNkgeoKOqISrJUU2vgyCCsWNDqhcIAmFSkei2DCefnJrhE9omr/2o2e+qQ48S2DSj1a9JzbIntooMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/e/Hlw2V8fXNadO2E5iUFdqkjG160ZTKnpUmCG6fYg=;
 b=TekTs9b+ZDDXXFpxWgoKtertBuca538ceMmDjGtv4hKitd/r0u/o6736eE3b4sqelReJ3YCOc49IsY0+HLwCGomeUIWbaTZ7G/aiZuCl5HGKBoaO+YvhoN659Cvw7cu/TuY+FmKXF6yJ4ND9VFmMDAwISY+tU0SoT+Sog8QeSL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] xen: introduces XEN_PM_PSD sub-hypercall for solely delivery of _PSD info
Date: Thu, 6 Mar 2025 19:08:21 +0800
Message-ID: <20250306110824.1506699-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306110824.1506699-1-Penny.Zheng@amd.com>
References: <20250306110824.1506699-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SA1PR12MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2018c2-8a39-4dd5-6686-08dd5c9f450e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lwNk5rhRcSrUcegox21m2QTFesJG9MCoVTEey0hWXPQm7HpZVP7+iTwKKScG?=
 =?us-ascii?Q?eafYM+BeNPJEd7h7myl/TUMj5btJ4lTEefws0/ik16KT2nkR3PJpFXUizwMO?=
 =?us-ascii?Q?TGZRqupsEbS4b0ZyQzGM+hn9G4I8PHa5kVvJvDbVwfFRicMvX18gbsWkukpD?=
 =?us-ascii?Q?6dO7tfAtktcM3l4H0rbr88e9WuM7qEqz8oLzGvydTcUk3V/vA3p0aQPEoq1x?=
 =?us-ascii?Q?FjawEVUsAZZh0J1wCOvmWOW4CaXSRpenIRay6bvOtco313NDbBz6WOM9Ran2?=
 =?us-ascii?Q?37wRZt7LJ7wG1qzQsz/uAk1Pb5vOMg8PY8/ES/2HAuSn4bL2NBRahgRWMKTM?=
 =?us-ascii?Q?kPb2SZg06VEELkcv34tOZddcVc8gEvXelHTvNwy70thmdLF4Czo4fik65Ifz?=
 =?us-ascii?Q?JcxDpqSuyolx8HeTLdgG+6Gb38b0B77AH7p2WEAAeDEVLfcT3BlXNk3mFC04?=
 =?us-ascii?Q?n1i/kiWXtczT8XbgrqJdzCR2EixDBAuURDuqYggRWKFQG+FO3UOh6yhWHhod?=
 =?us-ascii?Q?YX3argLUUJeTxM9RllGtW3Hq1Hng8sADbhEGkTLxQNyazgPHtyhN7UBR2tuM?=
 =?us-ascii?Q?Hjtnyh6YoDooD+yjHM7F4HnrUADBNy4DTl/CIMD8wrpTOevK+Pz9BI5T3N0j?=
 =?us-ascii?Q?Vro/AIHVci2cqZ5jbk8n0M/1F6KmsyqlLbCFmJLlV226wzkyhuvxEOlQ/P9E?=
 =?us-ascii?Q?WTn1JfmgR4tFOfOoxgqqqwPhOWozMx/UrxPcnc3K4QBAh5MyRHDdXHUFKg7f?=
 =?us-ascii?Q?VhOAyiS7USPDS6uEgrPH7WTpLKmxlW7GAxRrqte9BCZCayXUyjEf4MbhJG6G?=
 =?us-ascii?Q?bZA3UU6pUP61DmOfAmGod9r6LSBzFlfZg2SptWcyRmrjlAL+iVB4PcnEiaRe?=
 =?us-ascii?Q?6Od451/6OgkCTec++EFhzGEcw0hvWfEQwTuv1egZjrByqE283smLK0HQgHZI?=
 =?us-ascii?Q?q2Y4WVaf5ksCH8bKsV+k5iFLaofnBnlcsi2HRIwyErh1wv2+JWIfhVELO9cs?=
 =?us-ascii?Q?fMTOfMNTot+9Q6myAmgGQsuV4B2Fktmf8u4UkIqHuBVEx1ZM4enOCa/u1SEC?=
 =?us-ascii?Q?QUzSomjqRZyl4Tj67DMpFZ0/y6gF/9rJ+4l4ZladphZYvacFfmbb9jnroHDL?=
 =?us-ascii?Q?w2Zs67uL7VDTAVps0KGvHZoeN9lxDmWN1iapvIKNf4kPmzIPTPFZzsEaFrWv?=
 =?us-ascii?Q?/hvnyNRtRXrbcxv06TT/r0NrgDxW+uGtzIR0aVolnoX0gregJFU2zlkziFQh?=
 =?us-ascii?Q?4guAAZ8SrldCDB1RRptFlfki9OziaTxr3Rv8CCAtLxs+Hx5ei34LbQ9akUJ7?=
 =?us-ascii?Q?0CgW3a6sYcdD/lqJlijnR0bKYo1TLakF7mBOLOuqhTNf9T8kaQKPhWkZq58a?=
 =?us-ascii?Q?wCflsOZdK3/Ak4qhNwodp3ei8iZU+WepEjLB3pYWlxDb4URyA+0/kndprPlD?=
 =?us-ascii?Q?uth44JpUB/Ks9i1zbPc+q19TAozagDA+hYcJP6grjT/o6BaIPFWDGWg+q7jH?=
 =?us-ascii?Q?rRDf24lt/+uY6MY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:08:48.2730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2018c2-8a39-4dd5-6686-08dd5c9f450e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6679

_PSD(P-State Dependency) provides performance control, no matter legacy
P-state or CPPC, logical processor dependency information.

In order to re-use it for CPPC, this commit extracts the delivery of _PSD
info from push_pxx_to_hypervisor() and wrap it with a new sub-hypercall
XEN_PM_PSD.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 drivers/xen/xen-acpi-processor.c | 82 ++++++++++++++++++++------------
 include/xen/interface/platform.h |  8 ++--
 2 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index e9f38f171240..8db8631a4b9d 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -157,18 +157,40 @@ xen_copy_pss_data(struct acpi_processor *_pr,
 	}
 	return dst_states;
 }
-static int xen_copy_psd_data(struct acpi_processor *_pr,
-			     struct xen_processor_performance *dst)
+static int xen_copy_pct_data(struct acpi_pct_register *pct,
+			     struct xen_pct_register *dst_pct)
+{
+	/* It would be nice if you could just do 'memcpy(pct, dst_pct') but
+	 * sadly the Xen structure did not have the proper padding so the
+	 * descriptor field takes two (dst_pct) bytes instead of one (pct).
+	 */
+	dst_pct->descriptor = pct->descriptor;
+	dst_pct->length = pct->length;
+	dst_pct->space_id = pct->space_id;
+	dst_pct->bit_width = pct->bit_width;
+	dst_pct->bit_offset = pct->bit_offset;
+	dst_pct->reserved = pct->reserved;
+	dst_pct->address = pct->address;
+	return 0;
+}
+static int push_psd_to_hypervisor(struct acpi_processor *_pr)
 {
+	struct xen_platform_op op = {
+		.cmd                    = XENPF_set_processor_pminfo,
+		.interface_version      = XENPF_INTERFACE_VERSION,
+		.u.set_pminfo.id        = _pr->acpi_id,
+		.u.set_pminfo.type      = XEN_PM_PSD,
+	};
 	struct acpi_psd_package *pdomain;
+	int ret = 0;
 
 	BUILD_BUG_ON(sizeof(struct xen_psd_package) !=
 		     sizeof(struct acpi_psd_package));
 
-	/* This information is enumerated only if acpi_processor_preregister_performance
-	 * has been called.
+	/* This information is enumerated only if
+	 * acpi_processor_preregister_performance has been called.
 	 */
-	dst->shared_type = _pr->performance->shared_type;
+	op.u.set_pminfo.shared_type = _pr->performance->shared_type;
 
 	pdomain = &(_pr->performance->domain_info);
 
@@ -180,32 +202,30 @@ static int xen_copy_psd_data(struct acpi_processor *_pr,
 	 * running as a PVH dom0.
 	 */
 	if (pdomain->num_processors <= 1 ||
-	    dst->shared_type == CPUFREQ_SHARED_TYPE_NONE) {
+	    op.u.set_pminfo.shared_type == CPUFREQ_SHARED_TYPE_NONE) {
 		if (pdomain->coord_type == DOMAIN_COORD_TYPE_SW_ALL)
-			dst->shared_type = CPUFREQ_SHARED_TYPE_ALL;
+			op.u.set_pminfo.shared_type = CPUFREQ_SHARED_TYPE_ALL;
 		else if (pdomain->coord_type == DOMAIN_COORD_TYPE_HW_ALL)
-			dst->shared_type = CPUFREQ_SHARED_TYPE_HW;
+			op.u.set_pminfo.shared_type = CPUFREQ_SHARED_TYPE_HW;
 		else if (pdomain->coord_type == DOMAIN_COORD_TYPE_SW_ANY)
-			dst->shared_type = CPUFREQ_SHARED_TYPE_ANY;
-
+			op.u.set_pminfo.shared_type = CPUFREQ_SHARED_TYPE_ANY;
 	}
-	memcpy(&(dst->domain_info), pdomain, sizeof(struct acpi_psd_package));
-	return 0;
-}
-static int xen_copy_pct_data(struct acpi_pct_register *pct,
-			     struct xen_pct_register *dst_pct)
-{
-	/* It would be nice if you could just do 'memcpy(pct, dst_pct') but
-	 * sadly the Xen structure did not have the proper padding so the
-	 * descriptor field takes two (dst_pct) bytes instead of one (pct).
-	 */
-	dst_pct->descriptor = pct->descriptor;
-	dst_pct->length = pct->length;
-	dst_pct->space_id = pct->space_id;
-	dst_pct->bit_width = pct->bit_width;
-	dst_pct->bit_offset = pct->bit_offset;
-	dst_pct->reserved = pct->reserved;
-	dst_pct->address = pct->address;
+
+	memcpy(&(op.u.set_pminfo.domain_info), pdomain,
+	       sizeof(struct acpi_psd_package));
+
+	if (!no_hypercall)
+		ret = HYPERVISOR_platform_op(&op);
+
+	if (!ret) {
+		pr_debug("ACPI CPU%u - _PSD uploaded.\n", _pr->acpi_id);
+	} else if ((ret != -EINVAL) && (ret != -ENOSYS))
+		/* EINVAL means the ACPI ID is incorrect - meaning the ACPI
+		 * table is referencing a non-existing CPU - which can happen
+		 * with broken ACPI tables. */
+		pr_warn("(_PSD): Hypervisor error (%d) for ACPI CPU%u\n",
+			ret, _pr->acpi_id);
+
 	return 0;
 }
 static int push_pxx_to_hypervisor(struct acpi_processor *_pr)
@@ -234,10 +254,8 @@ static int push_pxx_to_hypervisor(struct acpi_processor *_pr)
 		set_xen_guest_handle(dst_perf->states, dst_states);
 		dst_perf->flags |= XEN_PX_PSS;
 	}
-	if (!xen_copy_psd_data(_pr, dst_perf))
-		dst_perf->flags |= XEN_PX_PSD;
 
-	if (dst_perf->flags != (XEN_PX_PSD | XEN_PX_PSS | XEN_PX_PCT | XEN_PX_PPC)) {
+	if (dst_perf->flags != (XEN_PX_PSS | XEN_PX_PCT | XEN_PX_PPC)) {
 		pr_warn("ACPI CPU%u missing some P-state data (%x), skipping\n",
 			_pr->acpi_id, dst_perf->flags);
 		ret = -ENODEV;
@@ -281,6 +299,10 @@ static int upload_pm_data(struct acpi_processor *_pr)
 		mutex_unlock(&acpi_ids_mutex);
 		return -EBUSY;
 	}
+
+	if (_pr->performance && _pr->performance->states)
+		err |= push_psd_to_hypervisor(_pr);
+
 	if (_pr->flags.power)
 		err = push_cxx_to_hypervisor(_pr);
 
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index 79a443c65ea9..a35e1eb958f3 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -319,11 +319,11 @@ DEFINE_GUEST_HANDLE_STRUCT(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_PSD  4
 /* Px sub info type */
 #define XEN_PX_PCT   1
 #define XEN_PX_PSS   2
 #define XEN_PX_PPC   4
-#define XEN_PX_PSD   8
 
 struct xen_power_register {
 	uint32_t     space_id;
@@ -399,8 +399,6 @@ struct xen_processor_performance {
 	struct xen_pct_register status_register;
 	uint32_t state_count;     /* total available performance states */
 	GUEST_HANDLE(xen_processor_px) states;
-	struct xen_psd_package domain_info;
-	uint32_t shared_type;     /* coordination type of this processor */
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_processor_performance);
 
@@ -410,9 +408,11 @@ struct xenpf_set_processor_pminfo {
 	uint32_t type;  /* {XEN_PM_CX, XEN_PM_PX} */
 	union {
 		struct xen_processor_power          power;/* Cx: _CST/_CSD */
-		struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
+		struct xen_psd_package              domain_info; /* _PSD */
+		struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS */
 		GUEST_HANDLE(uint32_t)              pdc;
 	};
+	uint32_t shared_type;     /* coordination type of this processor */
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_set_processor_pminfo);
 
-- 
2.34.1


