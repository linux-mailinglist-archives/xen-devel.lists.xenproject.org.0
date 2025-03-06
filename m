Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7A8A5451B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903106.1311067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mS-0003oW-RX; Thu, 06 Mar 2025 08:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903106.1311067; Thu, 06 Mar 2025 08:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mS-0003m4-O8; Thu, 06 Mar 2025 08:40:36 +0000
Received: by outflank-mailman (input) for mailman id 903106;
 Thu, 06 Mar 2025 08:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mQ-00031D-SQ
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:34 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:240a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e1cd9e-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:33 +0100 (CET)
Received: from CH5P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::6)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 08:40:28 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::78) by CH5P220CA0011.outlook.office365.com
 (2603:10b6:610:1ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 08:40:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:25 -0600
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
X-Inumbo-ID: a9e1cd9e-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk7aVPNrTtGtcazS/ioVo/VS3XGTgflA0p+GinXfkS4tbRtbnviRHQEhnoy6qYPR02L9nD5kvxsDoJgnJ4ykwx3lD8zCvzXlsK8x0K8RHmi/+H2kozMDnb0HRg3Ug8EbCpiyxTH6Lc7nAHkLR+NYCAM9N9YywCJMW5/4vKzLMXla1YsArIGjhWL+r+zCc4XZT44I0CmmA9CjhhIGpzVoH+J7FnCZnjLXFSda67PKiLaafAkoJn4rWgWWjstKKNq0D8Mj07VVrfOdeTgnD8opqj7VR4jlEG/I6eEpOF90L9Jfso+kRK3ZA/Hb2mGYyOXXTelHg+d2gRIzUNu3eZtTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZp2+G1TYgiDs8/3pvuGjDp7277SjubF6dG/247ETo4=;
 b=wSeMZLK+JnxG7ufz2TZsKhLanXQGhxBhjrVxTeXVNMNZuEIjQzkwG4dfbJN8bgyp0JDnLQnDetNTevxWpzgLqxyfE6+rA0eCefJYrXQ1E9ImnlNWW2muMq3JH//5NM8rfi7gM5BW9QEqsspb3nsXXY+bwcbRoWuCr8A0TM00fbWXfOVI95pX4YAg9aQ+dN6VNu65sOcdb1D7OOVy5XiQ5rDFobH6KUKsV7a8owV84SOlnNGNNfYcuEt6ujNONo6yFZO2xjac+MQmzPs5wf9j0BTwsOXo+MW/AWr7KKpup8wqwCXqK8qoeCjiEBuLmuWto2RehdoqfvywASVftTnWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZp2+G1TYgiDs8/3pvuGjDp7277SjubF6dG/247ETo4=;
 b=hSh9taaFY9+XcZL0FOERFVxS0B3ELwd96sZAcbUaZ1JTaF1ZRdpENHHOycOfAZ3A/v61jBsJwL/QZLTOmN/MHfNwJiUupta4pBMzsvu6ecL1ffy4Ag23xtouYAIoaYxTM5fPtVxWLNChE7C8Q2eAsbN09QPVwsbBQ5ddN+eJeyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 04/15] xen/cpufreq: move XEN_PROCESSOR_PM_xxx to internal header
Date: Thu, 6 Mar 2025 16:39:38 +0800
Message-ID: <20250306083949.1503385-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 538ca215-dead-41e5-0613-08dd5c8a8c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9y7d66izbhqYTbk/WBgwZf5vgni82nYIeKNafKmpDszIQbXtz0tafC5UV/Vo?=
 =?us-ascii?Q?PwdH8XhF91oO157FtOmfbXJt9r245lcxMv2AjMt14c5gxysh2IPDh6S9yFIi?=
 =?us-ascii?Q?EKFO1+oFET+SsPlgJUIa6LHX4wpwzAGMnLBdUHkfhd7EJCz4MeUltsk61uJj?=
 =?us-ascii?Q?WtvTPIST3daSEHDzEGwEp1xncQWDeIxrkkou3zW+gWwRVOOKWwQllzngn7ho?=
 =?us-ascii?Q?oLKEkQyAjY+5YpWgxDneax+sPnqwMbarOio0dHcNy0FaA3l0+9nq5shgnIlk?=
 =?us-ascii?Q?ij/NtKlaEBi0Jy7Tv35q8/Y7sLaNydvyNNljrQs9MP6NmAM6a1zT+2f0KQfx?=
 =?us-ascii?Q?RuJGTA4AzmxF5hmbIdxT/GWtgv0yvM+Itnz3bVGd981ON7ZYZVg3vgDordqT?=
 =?us-ascii?Q?SbciPwxZgVrG1/BBUNC6Y6PjmIYpxdmDftMN3DHAg8xSUl3KtyeReF6vEH1n?=
 =?us-ascii?Q?d0hB5gbkj4hDyLgFdfgQbeabJtTjXslllmMcY6WTYB5zCreTaDnV0lNPO9Vq?=
 =?us-ascii?Q?USoilxU02r4DvJq+lqavDYn1f8S3VvhZ27vIQxuryJsnknHUKFUla/orfo89?=
 =?us-ascii?Q?BbeReaqAk5evBNrej9OQiaNHrHIV7o4+VsM7PKTtGD84ou0ySDpCVT7lPAZe?=
 =?us-ascii?Q?59Q4cJoORNAh6I553hMQVbaaYw6C4Fkl6D9ZwaDv+dYXyWidfbuQ1GevcsN8?=
 =?us-ascii?Q?HRHSrSlZDceoeZrjEhqKmIUUXfeuhc3Dog0rBNnLsXx/RkInv86HyAhjt9D+?=
 =?us-ascii?Q?N5U4TYw8lds6qrjJGBsw/sTTzkE5wRlkz19/YOVorfJlPfR19U/BcOtWCGbK?=
 =?us-ascii?Q?dQ+pXU+lu8pC/WQouoU4PaeMhXqajedlKPFSoIidVfcmnJR2SRbOVLEZ+s10?=
 =?us-ascii?Q?Co6m5KWGpj/ZMKn8Wp9PFLSEKRb++6X3d81H5p7R1sfrjk4DSWYCa+KNuqAP?=
 =?us-ascii?Q?ggXHMljxMF52q+PSiewDSExjTb37/0yT7Q37U/X3kX8XQ1ZtC8TmURnxp75i?=
 =?us-ascii?Q?vcyqf2uIea+7YWvgS9z7VzXWfsBTdAlMvHeuuGERRsTEmOrLNTrIBVi9BGBb?=
 =?us-ascii?Q?BYGzInIWDQK2ptQfc9tf/GvVZni2+jUfqGPC7qQWc1pXvBP9y+6h9s+lKRAX?=
 =?us-ascii?Q?FzxbaZ6DoPK53XLfR/hNJi242NQZRfJ9m1vVQh6S1fX0fXh1XdupLATNLPEW?=
 =?us-ascii?Q?5PcdAsJz2z9G/cp7f58ygIKDGlZ0Dnsizes7SpTtjyVRSaiv1yn1PBuFyDoF?=
 =?us-ascii?Q?ZJRku9WGJR6hrWqmV20+odB866mxbYyMHcTyyMMEnFgHz4c7kqRv0/VmpC/b?=
 =?us-ascii?Q?szB+E9tf9+jTINzG13mh6qbrqhH9o9esGR9JogiAWedH4a6Wc1QKU/bfAh97?=
 =?us-ascii?Q?10iXfRWVGuazeoM5d3IlW5pBnnkEsVUcuWCyuXtv0UxvE4wjIBLWgRkWYTUs?=
 =?us-ascii?Q?pyX0+yDhJIUn57zszqA28IZWuIXysv1nkMicFCc2Gz20KtXwYrFzOB86ndbS?=
 =?us-ascii?Q?vYDEUljGbv1FICE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:28.1102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 538ca215-dead-41e5-0613-08dd5c8a8c17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

XEN_PROCESSOR_PM_xxx are used to set xen_processor_pmbits only, which is
a Xen-internal variable only. Although PV Dom0 passed these bits in si->flags,
they haven't been used anywhere.
So this commit moves XEN_PROCESSOR_PM_xxx back to internal header
"acpi/cpufreq/processor_perf.h"

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/arch/x86/pv/dom0_build.c              | 1 -
 xen/arch/x86/setup.c                      | 1 +
 xen/common/domain.c                       | 1 +
 xen/include/acpi/cpufreq/processor_perf.h | 5 +++++
 xen/include/public/platform.h             | 5 -----
 xen/include/public/xen.h                  | 1 -
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 96e28c7b6a..a62948b0e8 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -886,7 +886,6 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
         si->flags    = SIF_PRIVILEGED | SIF_INITDOMAIN;
     if ( !vinitrd_start && initrd_len )
         si->flags   |= SIF_MOD_START_PFN;
-    si->flags       |= MASK_INSR(xen_processor_pmbits, SIF_PM_MASK);
     si->pt_base      = vpt_start;
     si->nr_pt_frames = nr_pt_pages;
     si->mfn_list     = vphysmap_start;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ebe5a9443..5101b381fe 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -62,6 +62,7 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 #include <asm/trampoline.h>
+#include <acpi/cpufreq/cpufreq.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc77111..05cfa1d885 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -43,6 +43,7 @@
 #include <xsm/xsm.h>
 #include <xen/trace.h>
 #include <asm/setup.h>
+#include <acpi/cpufreq/cpufreq.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 12b6e6b826..33edf112a0 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,6 +5,11 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
+/* ability bits */
+#define XEN_PROCESSOR_PM_CX 1
+#define XEN_PROCESSOR_PM_PX 2
+#define XEN_PROCESSOR_PM_TX 4
+
 #define XEN_CPPC_INIT 0x40000000U
 #define XEN_PX_INIT   0x80000000U
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 07f4b72014..24cc5812ed 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -353,11 +353,6 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 
 #define XENPF_set_processor_pminfo      54
 
-/* ability bits */
-#define XEN_PROCESSOR_PM_CX	1
-#define XEN_PROCESSOR_PM_PX	2
-#define XEN_PROCESSOR_PM_TX	4
-
 /* cmd type */
 #define XEN_PM_CX   0
 #define XEN_PM_PX   1
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e051f989a5..941d288ec1 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -877,7 +877,6 @@ typedef struct start_info start_info_t;
 #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
 #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
                                    /* P->M making the 3 level tree obsolete? */
-#define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm options */
 
 /*
  * A multiboot module is a package containing modules very similar to a
-- 
2.34.1


