Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45EC789B6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168662.1494696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtQ-0006aZ-CL; Fri, 21 Nov 2025 11:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168662.1494696; Fri, 21 Nov 2025 11:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtQ-0006R9-5E; Fri, 21 Nov 2025 11:01:32 +0000
Received: by outflank-mailman (input) for mailman id 1168662;
 Fri, 21 Nov 2025 11:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrK-0007TB-IU
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:22 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f082ff8-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:17 +0100 (CET)
Received: from CH0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:b0::21)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:12 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:b0:cafe::51) by CH0PR03CA0016.outlook.office365.com
 (2603:10b6:610:b0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:59:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:11 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:10 -0800
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
X-Inumbo-ID: 1f082ff8-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mP6UxM53kXBQFRzYC4irbUBA1QpxR5acj3Xd9sD6qYmem7bw47e0ntI9VhnrcIHZQ8gUp5Mv5RAbs607F1pmqvU4P8kwIXGJ4UwZ+ypKJXY7VMLge51ffUrdBrCPaOswCYpEc4b6nYbp+9ZNwHH7s0+too+aAoY/6ehypzVTc9uiY18oqMSVFfFAOYBgN+6GAbTxNm5G8DXSxGsKdbtPzRMUernmcavTVyp19C6ncSoSG8/JvHrzgIISdxfODtOOjSNI+Ix9w8fmbeivpM9ji7QtXVnRLrm/rUFmdZNacz3ue/2NzlKHY0sw5MDp18MfCc3Mpop8xALn6a6kBOT/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNMzRlErBQ12Vn+6GkVpQ076LkBKAM8h0jxV4hHbrGg=;
 b=gR5A+EXMxJpzoue0zSwlvhDOqHwNXAX6ekPEs8f76K+fwSC6pM/W7KSOEVbonVI40HwkiOQGcOudG3Z6XLsUxKiCGBoEeJJck388hMlkIOmW80TRuzgYcbumT6SDpJ4Xo/BvFfh6YikknqeL53+NQNOgpD43XWFSFRPoKAFgxwJEw309mzpcxaEMhMxPLmu1UzlnKWS+wHBPOVg7DjApkFc+fOSocTEHqJmHkD9iWO6uapBbgX1RKOlWfQ0wBnZWaxLLbHbwy3pCP2nYYXaIv5QRcZK6xM1zX/hkO1O0Yt1Q+V+9XWm6FtfMEUJoesVvN0RBpGcIAQReoiHVZT1Mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNMzRlErBQ12Vn+6GkVpQ076LkBKAM8h0jxV4hHbrGg=;
 b=S+OcfJN+8JcIN0yBmlRamMtPDjEkjaryu+ouz8jY1/xU4EOFKICXjYEXk6GmeBOeiD5+sa18+g2vqT2BQXdpo4M4WiHjYKTzsgGrCEvsXEfpeNty1mNBB6aOioeKDYsiXtcO+Fko3fVkeSfWFsUL792vpHrvqaHY7Zfy+98jHA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 16/24] xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:53 +0800
Message-ID: <20251121105801.1251262-17-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: adc24ce5-6a61-4833-cb75-08de28ed00e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tEwCc5uFCZdnqENDScLlK7Ub9mqOlZszBiePqtHyf4qt22Blr1c3Qr9iMsDV?=
 =?us-ascii?Q?NNOHVllZifLKnC/+FdSHlHAQfeonatxopbIr+eXKaTRB5O8WSPGmISxHJNEX?=
 =?us-ascii?Q?HyILqsjvFC1ZzAylTBDsHkfnhY+rEtj7EIDKwZgUaDfxPEonX6Q7dPZNqtkp?=
 =?us-ascii?Q?eJTPcoag4WO0mfcsYKXO7EW65w0g2kYcz46ooGJ1XTw9bya0xsA2XrmicSpN?=
 =?us-ascii?Q?ziLyYHKjcR8K3wOn8pS6/dxbRF3Tl/h1dmjOvV39TUUYr07DLQsMVo8n2p82?=
 =?us-ascii?Q?2N+V7h/F9+etB1m0LvI4c2/TLin6DNJXfsJjO23zF03H+6DY1j2qggG/qt2K?=
 =?us-ascii?Q?WLJsON3HNkfpS/N2qjT2Z6gkvmhbi2b+sQWRq5WdsnULdpVHqfYXSwDe8hme?=
 =?us-ascii?Q?35siiomI7lRgY2aYK9l/HfiEpyq6HOil+N87HOZZbStyzmdjc0/7IwEF0Y3z?=
 =?us-ascii?Q?1Hfd8agWcFEOR6r8A7rzYojOYkpujdGe3f0o+K80Rb1/iV3Mjw8CeiihXJfV?=
 =?us-ascii?Q?Vve2osvjcw8DHT/cZDoUcxoBDMMVn2jkrzbj0FG4ringLOI/xSH7E1lsYyy7?=
 =?us-ascii?Q?ElJzNIrnlRO/RPjH3N/3TjeuWhANFbBRqc05s7YtvnGXOHcaw/Lc131B5otb?=
 =?us-ascii?Q?YYhwYhpbKfcub53eNMEQAcTPRHJdCOn6oICDd98InBUTPhQHBzX3aTUwRtLj?=
 =?us-ascii?Q?cnmj5oN7CiP/TBx9ng/O6XV//XiphpnVZTlCGIqpR/kVJO+vrEBsFWqh5Kbk?=
 =?us-ascii?Q?LUeeuqy8kX23mtwco30OD3AV9ru1o54r991EL/GKHBTxSCWWYHfLfJSMStkt?=
 =?us-ascii?Q?8BOjxwd4fKcq7MkQiQeLIQH2lfuK94zPzZcbnh4L4xEHw79eu8Lk3zkfNrXW?=
 =?us-ascii?Q?/iMc3KH4J8tr+TXVKtAT7EP4OjOub4AfnhFSGp+EZds89yirBmM39JttM2Tj?=
 =?us-ascii?Q?qrkhaueUvKKvSiN5IeJe9eEcTvM32wg5h6MItPERCODCX7UnWRGYpy8PKL2D?=
 =?us-ascii?Q?fYAqjC3ol7JyPbtKr9Q2rfLCZlhHdj0V3756ZJUkGv9/uA0tDd94m7+cPal1?=
 =?us-ascii?Q?D5Tlax+TP61BdCvXkepYDI5YUAsYAiFH/KHQFktvpv7EsGFnl8lEVpcz32cj?=
 =?us-ascii?Q?NiPelogXC+MiloaNGzLEkwFnb8Cn0zp2OZ/d6gUgilquwmaYZlPON4Q0KbZg?=
 =?us-ascii?Q?509DbFogZy06vDTY73ztvBL/y6CCCH/r/Z1nrfk7Bp27+EOZrJDYVU3suRxO?=
 =?us-ascii?Q?99TO9p+aqZextUTr3YfMpNrA4SHwSk7ayir/2qIpAvC/jwRX47NFJD/A4xhI?=
 =?us-ascii?Q?BWSVYw5T7oHBeJLZiA+s9/UOpdATyI2C8FIi3Wv/FO9zeOfBeQIJxV22Bj6m?=
 =?us-ascii?Q?22A+tjjpwrTGh7gObL9BUOATZxlaQRC625GfYDajeF00bd56m2500+KVPE/D?=
 =?us-ascii?Q?EBWKnTaY9BB766i+7Z3gR2acR4eS+W14mbkjeScdJUgsx9TgqMhm35+/U3im?=
 =?us-ascii?Q?bpRuqxC3e/2pSh9OKdlWe5L3cNUVqb9CjAT8FWVDbi/2kPCjFQCAH6X3ivAE?=
 =?us-ascii?Q?uhlM0SUkxtbrfX/I4qI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:11.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc24ce5-6a61-4833-cb75-08de28ed00e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159

Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
Otherwise it will become unreachable when MGMT_HYPERCALLS=n, and hence
violating Misra rule 2.1

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
Commit "xen/domctl: wrap pci-subset iommu-related domctl op with
CONFIG_MGMT_HYPERCALLS" and "xen/domctl: wrap device-tree-subset iommu-related
domctl op with CONFIG_MGMT_HYPERCALLS" are the prereq commit.
---
 xen/drivers/passthrough/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..8812e38174 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -625,6 +625,7 @@ void iommu_resume(void)
         iommu_vcall(iommu_get_ops(), resume);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -645,6 +646,7 @@ int iommu_do_domctl(
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */1
 
 void iommu_crash_shutdown(void)
 {
-- 
2.34.1


