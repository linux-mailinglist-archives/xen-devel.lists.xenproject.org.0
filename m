Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43474A63FF1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 06:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916172.1321311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu3E2-00014n-1c; Mon, 17 Mar 2025 05:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916172.1321311; Mon, 17 Mar 2025 05:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu3E1-00012d-VH; Mon, 17 Mar 2025 05:41:21 +0000
Received: by outflank-mailman (input) for mailman id 916172;
 Mon, 17 Mar 2025 05:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sT4H=WE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tu3E0-00012X-Jc
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 05:41:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71a63f3e-02f2-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 06:41:17 +0100 (CET)
Received: from SA0PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:d3::22)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 05:41:12 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::29) by SA0PR11CA0017.outlook.office365.com
 (2603:10b6:806:d3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 05:41:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 05:41:11 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Mar
 2025 00:41:09 -0500
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
X-Inumbo-ID: 71a63f3e-02f2-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy/bEdxoprmy8wHIefmrQf80hGcC2asdSXO+HuAk+1bBfwHCXX+P6UR6hyqRA8qEr2BmOlKjKJqYMiJLqaOu+Z8yDclKpNwfliwxxjlkQW/FHyqAc17jKQFkp05rIICg93NgAGFcBEtJGolSqwaofBt6GhF+T/jlrP0306yswgiI56lld2QVPLj1Z3VUPNfKRaX+s49NwY1nptO8ZzoN/YwhgRK5FzM401Ln9X4w5yx1QesiADct/J1g1w4TjpBKLKWDP8hTw+n+TmSkqQTOK8WVchwlsW2dYabk9snCcxVoED6V04HWVjGV23VHSxOC/sEGy5hYMdSj1yu4+huCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBepBcTFggXypd9FVSWSsyJvz9VTo53NKGsEo5eF2NM=;
 b=Gu6Leff1NpxfPMm7gMazK6Xd7QXnjo67R0Y06M6hE9bVJ872P/gx0zD9AM71wV/9Y+6dA/hR6AVS8YLqlTjZkvzlIOlCBbcVWgiR4Fhbe6kuatu52h46HLGkIwTFJraj9HYdsbB2XQnCsriVHAhQK6s465/+mMFF0MXHsMcdu6JGbley3KkOO1cXScxhkafVi2EYA1eaxjVFyPOW9YXEhtakXBe5J7Kvg89x9BSHnBH7UAGYanuODgxfMTiDvH2m1Dhw6RCcDf5pHrnmYbzK8MrATHjdMJQElD63f5VHvhZlXsGcFCRTQ78vFTJMhZQ8HQkA3nFJngIVfS1vX0HOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBepBcTFggXypd9FVSWSsyJvz9VTo53NKGsEo5eF2NM=;
 b=GTiiPSVY0P6CrmsDu1Hn+BCWhu9uo6yCAbQBXi8J8rDZ4RrV34WuPA+eNuQk+j/i77YyEhBRP0cDYvKy7+921DazPzPdwmQPrMY/6YwAhr545IQmjEsWKhk7R6dBRHTGNMc+3ZJTQk+4LPEgnfZWka+5fpYvDaQUzik6iMaDasw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Huang Rui <ray.huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [PATCH v2] CHANGELOG.md: Mention PCI passthrough for HVM domUs
Date: Mon, 17 Mar 2025 13:40:33 +0800
Message-ID: <20250317054033.2659644-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e440444-cae6-4fb1-b44b-08dd65165339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jRAP8FWu3hwN/I1flpUhDfa3ZiA4JCbGmctPafBrcCcj7cFRF8q3NsD54uxH?=
 =?us-ascii?Q?BqHsxnZm+axGit62dn1MitZ3lrpXgYR2hpU+xqiZeZmc339ezJBfdAV68yu/?=
 =?us-ascii?Q?dZVC24i1jgiz5f9wWIjxDrrqaDB58S6sf3Ul8AETv1TvwPFVJrlTys6VYmMf?=
 =?us-ascii?Q?NeGcQpuND47nyc4ZR3Mj5akU7NVrnglQJhacv4/RDJ4CJHx/kJS7WyMPK530?=
 =?us-ascii?Q?aErC1XUWkiaUb8v8WMzfYoaChfug+m5ArLiU1R52fFYPfdZpFkicRg7A1HFx?=
 =?us-ascii?Q?F/PREq9ItOG0SZUjGHOeMQvilkQY+XOlACtrAgGkFOz5xbYTU4oXHDCNfIk1?=
 =?us-ascii?Q?nUImnAtukJBlZbJU3snjCeD7TpONoQ2uGY4Kg9gxU2hct3hyRYg2WRwnk+Yl?=
 =?us-ascii?Q?aw9tQCuyUHOgNhQqVNJ1E2E1/U0GifGe4FkjHjICdl9e+pNrdRqUmu7Uyvwv?=
 =?us-ascii?Q?GVrEGhnQr3BZEbq3SwcZOnl3T9No2/Ud+4IBN/c6LSSUW80P1sDoH1UBW9c5?=
 =?us-ascii?Q?J6rDLCUrFLcHiShFy/xu0WPX4WVgqK5X8ilvnHZLjyCo/nZ1BAtlB5J4N+HI?=
 =?us-ascii?Q?NbSoWbu5ljkdbM4FAYTfQ95rjxgn+AFGFpdUt/laNLgTYYSGdVWBbePlNmd7?=
 =?us-ascii?Q?x1mIuogoY8/tAi8s9vQW1d6r3xnkj8mXlPXNZlTXb16P2VMB3VMxk5OSuw4e?=
 =?us-ascii?Q?J2O+MrWZ6GGxa/DMCe50IKGTs6GAxpQ/JlQcrTswFG4n/Q3o1s2JqCEM4ijC?=
 =?us-ascii?Q?RnMqzJ25NZd+xopWfOav1Iq7nPETc1XPOWLOb6OlJp/O6G7ePLz8OTFikkZt?=
 =?us-ascii?Q?jF4eT7Er/v6SD9zQRd9ntPoGWfvYiZoNGueeS5SY4Wz82xSi0f9hf9XpLryq?=
 =?us-ascii?Q?a5XCTj6X3RRIM5XAkQu3lt+sBk3iPt9B2eHvVPd+D6w1coufGw2vpzTyy9rq?=
 =?us-ascii?Q?dOWcgQaLjR033haAOdO79ylBl2+qI27bJrE2swsQtwnBfllf3+Jp/1+7cOSN?=
 =?us-ascii?Q?GOUD1k1klneGkZaBGVbS+At3Ww2z3xDJY+vZuMdtM/ky7GItjAD3vwFr6X9J?=
 =?us-ascii?Q?qa0a7xONoFY51qRLNPj0a1Jlu6tCTwwBV/CTLnV448AJ7Y2O5t3TzJDXupVF?=
 =?us-ascii?Q?bBh+ve+OJqk8IButdwFZRdp6bz04Nn0Cs94hwLM7oaO1qpNw5edNrdhZeooL?=
 =?us-ascii?Q?9B/tWHiY+V6/5HlFUskJY7PhwqVdv+68vs7klPltP+KJ4sfbjQ/awKR+uXkm?=
 =?us-ascii?Q?LiQEkMUmL8XzH1kAgwHcI1cw7ML5UZynAvhS60jyRBbM/cdSp3T2i78E1mp6?=
 =?us-ascii?Q?LasQ9dQ3vCfCJkvnm0cXpAVLXkd1JKP0ZtThbQq5rl6VfMJmDsX13y7uO2EJ?=
 =?us-ascii?Q?zWnFufMauA55iMklOIpnr9o6HpmlebCNI3GFpYr6xbJUkRP33Q3yjZtZD2Cf?=
 =?us-ascii?Q?waIpJHLEeew=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 05:41:11.5829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e440444-cae6-4fb1-b44b-08dd65165339
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268

PCI passthrough is already supported for HVM domUs when dom0 is PVH
on x86. The last related patch on Qemu side was merged after Xen4.20
release. So mention this feature in Xen4.21 entry.

But SR-IOV is not yet supported on PVH dom0, add a note for it.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
iHi all,
v1->v2 changes:
* Changed to note SR-IOV is not supported on PVH dom0.
* Added A-B of Oleksii.
* Dependent patches https://lore.kernel.org/xen-devel/20250308001711.18746-1-jason.andryuk@amd.com/ were already merged.

Best regards,
Jiqian Chen.
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7201c484f899..9a5919585d43 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
+   - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
+     capability usage is not yet supported on PVH dom0).
 
 ### Removed
 
-- 
2.34.1


