Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6232B0D8BB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052384.1421042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfX-0003j7-Vz; Tue, 22 Jul 2025 12:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052384.1421042; Tue, 22 Jul 2025 12:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfX-0003gM-R4; Tue, 22 Jul 2025 12:00:27 +0000
Received: by outflank-mailman (input) for mailman id 1052384;
 Tue, 22 Jul 2025 12:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfV-0003QN-Le
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2418::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72d391ba-66f3-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:00:24 +0200 (CEST)
Received: from MW3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:303:2b::12)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 12:00:18 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::77) by MW3PR05CA0007.outlook.office365.com
 (2603:10b6:303:2b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via Frontend Transport; Tue,
 22 Jul 2025 12:00:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:17 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:10 -0500
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
X-Inumbo-ID: 72d391ba-66f3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7r0vjUGfRlgoH4+o+vV4XxpEuMrwycI/bbJDw6x13bz0RHBfP8otriR4bClPqRFe8vAtfjck8hjaYc8TObMr6bKflR77o/260BvpSt15f05hgptFsHqNjztWBJxV5gPfn6Oz3TM9zdsUxK+rJ9fUeMZtqdLUTaHqAfErXCPUIZmBQ34CO+tT3PP3sxnMdxcooipbbbyDYmyOuaFMnJPEOsCfd1UQVxmcl0NvPRxBxqYdxR7apml+rfqdXDi94hFfXQ24JSlXkpvP7/aTYUTROqt77IEzRv2D4oakjnHtFaQSEcjnlqoPECri6EQDptvt8IK2mGiQY1YXJlxbvM70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHHAxnoI2fqSEb/wARAT9NpQUxHrbRq9p94gqPuSuho=;
 b=H4cDETwWDFmPEy+MFYdrXGoH1aYQD4f3O32VefRPmHG33XTOoE4x0LdGo2/6+Xkn2nmzZORhyMVdXnxOSVz6nxHkgzzl5OlMO2ywdOTeAYNST8iUE0tq7QWpRDBK4YGWZScHSh9tQM1mOsE3Lks184wd0ZLdqpckxl0dA73thKT23/9b2kxm9HZPcGhrWhX3nzKPheuluLG93X4lv/HZmNtxIf7SXyAl+wgekYJA4I+rSkTWSOZZt0smTXRf9LHwKvbSpmwU6Cy+YYQam2s7sL7JTvwCQkrv5UJXBgfFZjdlDz981kNm11ikmXG6e4X9ivxTdlZMrF/asEGHobLaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHHAxnoI2fqSEb/wARAT9NpQUxHrbRq9p94gqPuSuho=;
 b=jaKVDdp7UvkRJnT0vzuRrW3wdDiZ/kbLGkZFJ/vh8NubCP074YQrV4+Ussn2YP20f1hZoZ/hCASvy9RYAvoUbOv68FtVZoZHUNi8duzty23Nqbhoxa96uD1XWqoF9RlSGkWiTstKEsjzTuGmFrG1gbY565kV9r5gpj+xbB2LDtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Jason Andryuk <jason.andryuk@amd.com>, "Edgar E
 . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 02/10] dt: Add cf_check to device-tree.c function pointers
Date: Tue, 22 Jul 2025 13:59:42 +0200
Message-ID: <20250722115955.57167-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ba3aaa-458d-4584-2550-08ddc9175340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v54vISa3ESZp8kUqm1ybdx73XktJ72liRDzPZUr2JetafuuV5qxboiePZww1?=
 =?us-ascii?Q?yvE33nDt3klgwH84R4cr6VAb9S0TiEVObxWpnJMSQeuGutPwGBhhiVqGXRo8?=
 =?us-ascii?Q?JubVbe6i9cwnfwxVjXU1tSCFQsAshdzcJePK1+AqZQ8Bud6hL/nCr6zvj3iK?=
 =?us-ascii?Q?K3TIVBYUJjI7IzCZDyeAclQ9R7dtRhd9tuNWbxceXbHk0JBCUdBu7WAXx/l6?=
 =?us-ascii?Q?wLlTBqp15RgJ9SXS3V05sW95p5PmXRkrz4gPQXZifJIXkAkzzlTqNfHYExky?=
 =?us-ascii?Q?WYZYx2szjc8pWtXI3v0OXS6YfjLItkPak9MbmE/0X3pGNCLxr9SG0txgEQhz?=
 =?us-ascii?Q?hTTuBF1URLj7QUKaZu/CPAMS6s9zy7TWDDznrr5PqRc/HsupPEDmpvQYlLzZ?=
 =?us-ascii?Q?IEvDqtRi1TzXs4aaGEkzoOw8895XT/LcFPdqrIsTvd4uwh74cXBCqBx8WyRV?=
 =?us-ascii?Q?j2LF3eTptCZFJmtNHak+J2zczZ/BjasSCO3X6NS3dXpID+rkirHqFS6T7NgU?=
 =?us-ascii?Q?QTLACuImeZMkhDGyQaJM99eMSA7x2S6ZmSLYOj+OM3488Xp1onamVLEw28Y7?=
 =?us-ascii?Q?qgP98ucalyp5hkPFfqQ8jyVdw9R7Gfz8NgFGAOg/UOP5pkBFKDcQWfavvGA4?=
 =?us-ascii?Q?yCQxbHYsP2JeQzsOaRoT8ft25JIAkSesotCdrL6noBT1iVrELWnvIyXBU0Cr?=
 =?us-ascii?Q?u0IxWmzcsTGampAO8e12EXh1kijEbMNnXeCb3GDSHydvFap8NjotoicPEcSp?=
 =?us-ascii?Q?8Y1f7/oKzkGV1Xtxa90geSRwNvmBimbiGufCsYoAIOzYRsUao9gDxU9Dt4ma?=
 =?us-ascii?Q?Djy+R8WRTABauUIdHatPfkeoG5J2JvM/UR1frLRnEEUfU3K8lvKcZQ5ELcrC?=
 =?us-ascii?Q?28ODYHBu++95NKYFIpBTgQ+xs3P6q1i/Je72DwoFPwpNVQ+auu/2PChrjK4+?=
 =?us-ascii?Q?MwiE4uVTO0ptDrx7VClOH/lUfzAYarBFLT5GIsn3gH4dulgv65buQyCM455+?=
 =?us-ascii?Q?RslB3q501+97exlJoeMW2VTWCbMVoN7cVRnrqAB7wqw8BjEMGFjAWuQB0uKe?=
 =?us-ascii?Q?BEW0TTfLr6MUCQi9Z99hkuqAQWGhXefWsXc29vgrZclRri+Kzkm4ytoH6MCk?=
 =?us-ascii?Q?cPe+PYkw2bVmSmqgefszEYZj082Byycq9GxIJRHxOBlXC+/1jqvUu/qZ4Qlu?=
 =?us-ascii?Q?97GIsgIumh2eA+qCM9OvbWsw+3ca931QRQEbj3jiGGy7sueLoT8zBa8nvHRf?=
 =?us-ascii?Q?64esMPEUKX7IaBK+NgyRncXxjTeWUYmavzdcnB/bs2YyN7Tixq2+4/P/0YW7?=
 =?us-ascii?Q?4i0gANFFkARo+cWTcBZ2VzoDhAGB3P1Y2mbTol7A124T73fxLbCnNDvKlbFH?=
 =?us-ascii?Q?55bEboNoWqwQQ56ZwTXdCLyWxtvztLMWJd1umrjy0vuekRLdYzl0sSu4Mweq?=
 =?us-ascii?Q?LRnI1BRXBjyUABeW8dWUSgEynHUnvFhwIbbzyc/rzOtWRm7wNT/vNQZOnQEO?=
 =?us-ascii?Q?/TWD5KBc57XEJzt1D9OxBYuk+5JwwItbm1lA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:17.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ba3aaa-458d-4584-2550-08ddc9175340
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290

In preparation for it to be usable on x86 with IBT, tag targets of
function pointers with cf_check

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/common/device-tree/device-tree.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 84daa3f0ed..0b5375f151 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -538,7 +538,7 @@ int dt_child_n_size_cells(const struct dt_device_node *parent)
 /*
  * Default translator (generic bus)
  */
-static bool dt_bus_default_match(const struct dt_device_node *node)
+static bool cf_check dt_bus_default_match(const struct dt_device_node *node)
 {
     /* Root node doesn't have "ranges" property */
     if ( node->parent == NULL )
@@ -550,8 +550,8 @@ static bool dt_bus_default_match(const struct dt_device_node *node)
     return (dt_get_property(node, "ranges", NULL) != NULL);
 }
 
-static void dt_bus_default_count_cells(const struct dt_device_node *dev,
-                                int *addrc, int *sizec)
+static void cf_check dt_bus_default_count_cells(
+    const struct dt_device_node *dev, int *addrc, int *sizec)
 {
     if ( addrc )
         *addrc = dt_n_addr_cells(dev);
@@ -559,8 +559,8 @@ static void dt_bus_default_count_cells(const struct dt_device_node *dev,
         *sizec = dt_n_size_cells(dev);
 }
 
-static u64 dt_bus_default_map(__be32 *addr, const __be32 *range,
-                              int na, int ns, int pna)
+static u64 cf_check dt_bus_default_map(__be32 *addr, const __be32 *range,
+                                       int na, int ns, int pna)
 {
     u64 cp, s, da;
 
@@ -585,7 +585,7 @@ static u64 dt_bus_default_map(__be32 *addr, const __be32 *range,
     return da - cp;
 }
 
-static int dt_bus_default_translate(__be32 *addr, u64 offset, int na)
+static int cf_check dt_bus_default_translate(__be32 *addr, u64 offset, int na)
 {
     u64 a = dt_read_number(addr, na);
 
@@ -597,7 +597,7 @@ static int dt_bus_default_translate(__be32 *addr, u64 offset, int na)
 
     return 0;
 }
-static unsigned int dt_bus_default_get_flags(const __be32 *addr)
+static unsigned int cf_check dt_bus_default_get_flags(const __be32 *addr)
 {
     return IORESOURCE_MEM;
 }
@@ -616,7 +616,7 @@ static bool dt_node_is_pci(const struct dt_device_node *np)
     return is_pci;
 }
 
-static bool dt_bus_pci_match(const struct dt_device_node *np)
+static bool cf_check dt_bus_pci_match(const struct dt_device_node *np)
 {
     /*
      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
@@ -630,8 +630,8 @@ static bool dt_bus_pci_match(const struct dt_device_node *np)
         dt_node_is_pci(np);
 }
 
-static void dt_bus_pci_count_cells(const struct dt_device_node *np,
-				   int *addrc, int *sizec)
+static void cf_check dt_bus_pci_count_cells(const struct dt_device_node *np,
+				                                    int *addrc, int *sizec)
 {
     if (addrc)
         *addrc = 3;
@@ -639,7 +639,7 @@ static void dt_bus_pci_count_cells(const struct dt_device_node *np,
         *sizec = 2;
 }
 
-static unsigned int dt_bus_pci_get_flags(const __be32 *addr)
+static unsigned int cf_check dt_bus_pci_get_flags(const __be32 *addr)
 {
     unsigned int flags = 0;
     u32 w = be32_to_cpu(*addr);
@@ -658,8 +658,8 @@ static unsigned int dt_bus_pci_get_flags(const __be32 *addr)
     return flags;
 }
 
-static u64 dt_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
-		int pna)
+static u64 cf_check dt_bus_pci_map(__be32 *addr, const __be32 *range,
+                                   int na, int ns, int pna)
 {
     u64 cp, s, da;
     unsigned int af, rf;
@@ -685,7 +685,7 @@ static u64 dt_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
     return da - cp;
 }
 
-static int dt_bus_pci_translate(__be32 *addr, u64 offset, int na)
+static int cf_check dt_bus_pci_translate(__be32 *addr, u64 offset, int na)
 {
     return dt_bus_default_translate(addr + 1, offset, na - 1);
 }
-- 
2.43.0


