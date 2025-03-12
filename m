Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D03A5D4E9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909657.1316554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDJC-0005Vs-4h; Wed, 12 Mar 2025 04:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909657.1316554; Wed, 12 Mar 2025 04:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDJC-0005Sk-0G; Wed, 12 Mar 2025 04:03:06 +0000
Received: by outflank-mailman (input) for mailman id 909657;
 Wed, 12 Mar 2025 04:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r9Zr=V7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tsDJA-0005Se-BY
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:03:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2413::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e409543a-fef6-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:03:02 +0100 (CET)
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:02:56 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::2e) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 04:02:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:02:55 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 23:02:32 -0500
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
X-Inumbo-ID: e409543a-fef6-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4rUGpOsTw7Zg7BbUlQ6bhiSfeXW718vR4lt+/nNxAOI3Jr5B5ZWK8WBiUZ+wI/mMaQkw/+Vhm43su8z0L1ASPXcmx52ZDTpk8sVnrYxBS4mUy+kroP49IeapSorxZ0HzOKOl4/8sIJHt9Y30Q2ktGq/fCAq8KaBwVpmwBSa5hav6nO5K8EclYkHiTXWQn3FARhEQ+/IjY1aoiD3Y0ykMmdnHvZX8C3QWYsqr+kUD2r7sNFEg0o/wJM2S1SKR40EZQV4T7T/b2s2khYf+GQDMWDbfDje8F4sRvsMSfe2XMcRPMeRR5jqoyx/x0xLFLB3dOem6W0PHi112DSclUYwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrtq4lu02GTZ3RpQc3cs8zUqgEmXOa3e11NC0hVgQSo=;
 b=yjpWYqf/xsnKgFyxq0PjL/ycwErGSSEipNesI9B76zJyWiDSS9w/ai09KBNbr7uOVlaWdm9ibRglFPm9Rkr2l8W0PRXpmb0cwRPcqg1krA2T+grONRXMA1W3lcaZvm9yOKSZ2KxQt4IdOgYJ76/K7WWd8XmWaFSJMa0GfjC3usmLE/ZW/NR58fruT4cOzymbVQEzmgCXuvc2/OC5IpizWgfoLofv8dODoX1DEtJRdOKxUafxqfUVe/NMw0ej/vn7LnY5WGPVxe7qezJ/mimxS44BIitvwYy8AvFZnrBZIajGiPuZ9c5M/DnC25JRCXeCdO0DQ0UBQhpDkMCF6FfrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrtq4lu02GTZ3RpQc3cs8zUqgEmXOa3e11NC0hVgQSo=;
 b=FkIUZ//miZL6uOuf8VDh+t1T1Mvlr1bhUF3TyrzgBgRDi0TH89kQisQERYP7MRV1V7dg/24DyFEolfiBAZCaMnYXL84UkQpIyF++FAFyHPIGUykoZPoTmCrDWCHa2eCiqfBTc3RUUCxHvahYgKMRskMnV6CDszZove2VOlKiitA=
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
Subject: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
Date: Wed, 12 Mar 2025 12:02:20 +0800
Message-ID: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf4d849-c98d-4eca-b2a6-08dd611ac52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zxlin1VBmRBpDuOvyL2BKc5OGEQHj8RPPOlafpTQC0i5JAkPlbTGXruFW3W3?=
 =?us-ascii?Q?FhKRUmo3Tf6XLx+PxmfidyeZHPX9lPcYaImYNDPXvucghCHXj4vZRwF07TZy?=
 =?us-ascii?Q?I+ZQigcDHm4kpTSkMosBe0GVLiDz2V3u8/MH3cb8lB/kelvffHRpSkm3/24a?=
 =?us-ascii?Q?Nav7hkMtbxyptxWQsy49oD7/Gxa04TQNr8vYDimWczXcMipnQVyJlf1YbLu7?=
 =?us-ascii?Q?hsVWVzdP2GzPIHcL1vro3ss+WAIHjtgOBm5pSCVb7jce8AwN+RunUQBF9o2A?=
 =?us-ascii?Q?Y5baiez38rQrP8ru01KVLHR8OF5h6xHnzVMwgNKct3PwWHZNWsyspV0skcfD?=
 =?us-ascii?Q?C2yqpB++DmDiSrNsytWf7g3lJ6pHpBvA7ct7lRg0AW9ht1QurutxSa/FAXXz?=
 =?us-ascii?Q?lxybuYctRhxYGbiu+2bo5Xqh1GWNnTwq5cjIBmV9gbgfbXLJIHZFWpYoGWYF?=
 =?us-ascii?Q?EwDnjJZ9IlLV9ChAmeG+v9uL+fZ6x9Q88ryKo0IgDn2nYAHd7DbUeGl+Z5P1?=
 =?us-ascii?Q?7eD4RldnsO8SMMZTqWsCPLpN0idXED8KuCQDrlpJyurr6g3OxR7cLX0gswqP?=
 =?us-ascii?Q?omC2TYUyyVONqO2G6lDc2pAoVpeC2/qJ0VAlHvE10xuDJj2jwRqRlSXS9FPc?=
 =?us-ascii?Q?2YObtvwRPpwu35WTux8MMNi0VoaqhAF169HrhCN1o30JbRwx70/ZfX2+e3GA?=
 =?us-ascii?Q?5eTTWS+sRdim1d42yyeGQflqATQ6DXYeqQVHgH0aVfTa/1WDoNwXOaLP0OSZ?=
 =?us-ascii?Q?Jc5OL9XM5oLnOaAT91SF7tlChJ4BJEGjEN3iADWY6z4QbvPYqso9ndtnaoeD?=
 =?us-ascii?Q?NGT2mqx1tJ25AlNRJjTNGxk8EVO3WODf9pxxYyPNzkm/ecyO48kjM/W/mIM1?=
 =?us-ascii?Q?lurHHFQl5GZdrIkHBkT5ceJ4Pq+GrcqywkbwQ12LvCRuPTq/uLv6leUwaww4?=
 =?us-ascii?Q?b1FcRr4T6Sdh8Cpg2non9tnURhU3tjfmEvDya7HSO5mObIr6eZ/BycHCXa7+?=
 =?us-ascii?Q?/wKLs7gj27ZppoknBe9V+ssen1B/t9qNSKy8RRp+Hl8MuvinKYGYPSF3xiid?=
 =?us-ascii?Q?hbnRK9Ksqs0iX8pRjkyg+SpqjVGHBJjm/Y+IKTIl+jxaDdc1zYzkx6I3Z6kv?=
 =?us-ascii?Q?NkqE7b4E1WaQklZzjE+WRnnzg5pdYeGPDpYw4n0C+7YhVf75p910p9Ltkpat?=
 =?us-ascii?Q?bo0D34usRnM430pGJoC8VUS647bY0eC7j26YbrLqdoxm0lcCruhSQ39BNqfx?=
 =?us-ascii?Q?PjGjlzAPknz5Rcda+GAF741EIn8ejl8DVE7UtMeF6xuvun95BRbd6EAtJ86D?=
 =?us-ascii?Q?3ZCAM5nkH+8FL/I6J6Va8faGwBXYHr9iO5BOg06sWZMbE2lsXC/1dPIaRHT0?=
 =?us-ascii?Q?TuGlsI2CLqra45qBuMx5+0OmPFXhfXKOQqnvfh+NGeP0Ghoy6prEhhp/O1Gq?=
 =?us-ascii?Q?38hILjVetr8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:02:55.9869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf4d849-c98d-4eca-b2a6-08dd611ac52a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961

PCI passthrough is already supported for HVM domUs when dom0 is PVH
on x86. The last related patch on Qemu side was merged after Xen4.20
release. So mention this feature in Xen4.21 entry.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7201c484f899..b6de9b72ea7a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
+   - Support PCI passthrough for HVM domUs when dom0 is PVH.
 
 ### Removed
 
-- 
2.34.1


