Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94607ACF853
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007454.1386744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaB-0003EK-DI; Thu, 05 Jun 2025 19:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007454.1386744; Thu, 05 Jun 2025 19:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaB-00039W-9R; Thu, 05 Jun 2025 19:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1007454;
 Thu, 05 Jun 2025 19:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGa9-0002tD-Kb
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:48:57 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2408::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d8bcc7f-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:48:57 +0200 (CEST)
Received: from BN9P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::33)
 by SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 5 Jun
 2025 19:48:51 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::94) by BN9P223CA0028.outlook.office365.com
 (2603:10b6:408:10b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 5 Jun 2025 19:48:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:47 -0500
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
X-Inumbo-ID: 1d8bcc7f-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqttT4haV1WbWrIVWeaTR5v2WtV6e8UNiX3ZkwWYVWsRqPHk5unITK6hMp8a9D6qIRSliKqPgdPtbOh+lPstRDu+jY4dS5c+LpDyw6On1xHnpsrz2RG7uRN+5NI8ANU1oEiiirf4G5KA2anXqX11PoserTcyA8z4k/T+e+top9qQJ7Gp/xKR0gIkQAdQph6PG/a1wxOBnFVWqIhKwGTYqu7QLmo/PJ9pmqN+qdB2UxOoSBO27IdcY0PUw9FR3fHXMw3hmyyyEtbVai70QBDK/aUNIy/Yjg1WbYDq9qgc2czrbruDtE+LuKOcwiIXWH10pH9D809eRDX1hJDnIe7a3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VkYpXY3zUXAOIvQP6YVzVO5MyvNvAMex59q1ydAmDM=;
 b=hA2UYD3tkKBV+RDbOPt5t0tLn/VRNqMjw1ee2OzljljS+u6eSnYmEYrorkZF2eD9gPvD0F6VB3RUez1iUqbBgxsK5XBDiIN7e0B6ekQGgPVw7JpGMwhoJk+q5JqgfcLA00RsFMVmfWQU9y/3Pwg18UxS8WJkNmKUJsy+R3wuRKKpwYwDITUQf2MSaGt10MaJ+ZQOtLhtbsTNTFxmTKpJ2Do2UX8znOm4sSHThDRJkz/VbFFUg5v/iVP8BzpZKvKfkQ/OYXgdQkHhyR26JKN87nXbzgraNSuKfFXYgOT5ZTjn/G7qhTjO7WY1a+mC1RvMWQZr/tYc+Fzcnr/R8VxF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VkYpXY3zUXAOIvQP6YVzVO5MyvNvAMex59q1ydAmDM=;
 b=qTa/i+OeKTw+mQZGuKDuTQ7heGlkuLiiVY0AbCD6971giuPeQ11N5Pghwlan7fOE2dv5FSKnfE1fHJQjNYKU6uRQncxPnH61erUh4O5AbqXk+LklXktj7a/OZPFsMS+B1k8vLnl1pVkhYl7ORnDCHPLiFXP+Tn3dQpdcSETq+rc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v2 04/15] x86: Preinitialise all modules to be of kind BOOTMOD_UNKNOWN
Date: Thu, 5 Jun 2025 21:47:56 +0200
Message-ID: <20250605194810.2782031-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 52aba572-4434-4afe-583a-08dda469fef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yp5qpJdcIurZPS6HYNVgpEw2lXTcfp7HauI44JIG/rdSBKBwxRgYBeyHCbXy?=
 =?us-ascii?Q?C3+FudbaGUw+z23H8iLjWtZKnorLkiHG8Ub0kkyr0acIjtsGZ9fHQn/L565t?=
 =?us-ascii?Q?jQxt00Xyt+tOlO7QNV0FgRJ036YsM8TdDLygsz4x2vJeabq9B/xN3fdlB6tb?=
 =?us-ascii?Q?UK7tLXtMH6xPlHE1NqLiKyRRcCGg4JwNyNoQRkmVqji2q3RK9c9e/t+Sxf9W?=
 =?us-ascii?Q?4QVEqpm6PXGJkgg0FbKy/MozAaRa08ct3kis+X8dlN6GZPLBQQhSEENUlmmz?=
 =?us-ascii?Q?syWVj5jMQd6wOxEMGebMthOIcubT2QCY1osBStIxBhjatNt/uq4fxydctP9V?=
 =?us-ascii?Q?hrhwzv0VioyjWGtlW5xy+N1sBHYLYr6lg7JOt7050YEBlXyM+WS7dvz6R525?=
 =?us-ascii?Q?oBJMwkIaisZMNEtnD/zuF3N3P+Pmsz3dvztv+UA1lPMmNzbIs34uAK1Ekof5?=
 =?us-ascii?Q?XO0fy1rGudLT8ICSnmHeKwXhIS7fyeUUSa0M0zaRZvZWQvHEzvCrYp3pDikX?=
 =?us-ascii?Q?LfCcmvPl8yJmTKfMuX59iDar/0pDAaNpJhq64fxMNyrZ4qe8IcRY9+Ul+bZz?=
 =?us-ascii?Q?oF1YwfTJlevL6SJpUz/+1sB7wqof9/tAxye3JsHCW23KQK3F1oOY6vvMZLPS?=
 =?us-ascii?Q?umksFa7B2aCHIPlA5i9LfyIQtS8wHsZTZpL5WNULa1BoyrjUfWJ/fyDuoEVM?=
 =?us-ascii?Q?GmnK4OmUKmR7uiU/S0FSpK5Wd/o+ZPFReBhK6xxAkZxU72DAxnZse0nZgTOD?=
 =?us-ascii?Q?qciIxEjdUsqj50MPOD3/M8/qLXCg4fOr122Rj+h+k5fKZAPyHGRSm3aB/8gl?=
 =?us-ascii?Q?ZI31R+X324adH8o4zt7oKCZF53GAQvSXnlyvN3H3iTqF1GVfOliNFLXENRwb?=
 =?us-ascii?Q?emkrncY8i8d5yCCvT0sGjZb/IdQon5WfpT+2FpNJTQrpbK6TysXzC+6Ec7WH?=
 =?us-ascii?Q?EvyYFH+9ZrmR58ULDfUw+zXJP68rA+C7DVvxu02i5/XaLUH1RpgcEQDKf5+C?=
 =?us-ascii?Q?PkPoj+vEbfg2caO0qZxYHiM8LEj9rYDE+9sBVCPibwjpA53BZGHw0LkuDZGH?=
 =?us-ascii?Q?f8NaBQ0fys/Xiwz0b/ixMQcLI1kKvUUFSS4ne5/TgnrOjrjiZ35KaZjKQryi?=
 =?us-ascii?Q?pwW27TXm9karSULsHuvHVizzpLT/Og0r6QTEsTwB0P/eRswu1jK89crDkHFd?=
 =?us-ascii?Q?vGGdPfBuW3nymZN2a3tLNJpxlKs5+S/Ui7SKXuH51D0Yw04HHsSAtrZ8dTRf?=
 =?us-ascii?Q?En2evMgaiXcNXe3PQY/KSXf+m9Pw/vyZolR7oiNopjfIj/ncqQqiIeloStvS?=
 =?us-ascii?Q?mTewl72zA2NkpRTemmBDfBYBfe3BauODz1/wINfv/ZEpXBHT2AAf/dWitPQ9?=
 =?us-ascii?Q?mOKReJhANHlYQqtg4J1ofGu6/Tk+bPC3L6QhRtI/S9zoxYT8ZeV9RB3jDTmA?=
 =?us-ascii?Q?4gxgAzh3MqujcIjKkOV0DWs/Vl+LW9Hpo6+PTWRLMy6mYrjMBtWBdNkNJDa/?=
 =?us-ascii?Q?nMiF4R1xyLzTz20ozw6RHE+cGjGd2aJd5UJZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:51.1799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52aba572-4434-4afe-583a-08dda469fef1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943

A later patch removes boot_module and replaces its uses with bootmodule.
The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
value, so it must be explicitly set in the static xen_boot_info.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2:
  * Add comment stating why mods initialiser isn't off by one.
---
 xen/arch/x86/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0..7d3b30e1db 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -298,6 +298,12 @@ struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
     .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    /*
+     * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by one.
+     *
+     * The extra entry exists to be able to add the Xen image as a module.
+     */
+    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
-- 
2.43.0


