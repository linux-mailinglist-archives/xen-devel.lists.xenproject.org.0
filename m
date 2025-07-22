Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17FB0D8BC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052387.1421062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfa-0004FR-JT; Tue, 22 Jul 2025 12:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052387.1421062; Tue, 22 Jul 2025 12:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfa-0004CG-FT; Tue, 22 Jul 2025 12:00:30 +0000
Received: by outflank-mailman (input) for mailman id 1052387;
 Tue, 22 Jul 2025 12:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfY-0003QN-PQ
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74f307be-66f3-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:00:28 +0200 (CEST)
Received: from SJ0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:a03:3a0::19)
 by IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:00:22 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::1) by SJ0PR03CA0254.outlook.office365.com
 (2603:10b6:a03:3a0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:00:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:21 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:19 -0500
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
X-Inumbo-ID: 74f307be-66f3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBwiuOcibXaB4OVZqtKs/zfFDgC8T6YMTR8GCBaYVOaWrwPx6VAVpJAR0hk/Gy8NYu+fQEYgXuamyI8pkUdgbeymX5FokmqMXlX7ROMFEeDvOXAg7RuJJkitDQI7JaDrVl7FRxj/eUoXAcVC0nxGIHsaiUl/58Mt6dT6Sh5UNInONAH7XYRgQyYXDxN658kBER9VenaROE50zx7apM6jzPAuLgbwfb7OZYH8wUno5mqeh4AKtWWWW7WYlCU2zQpJl9uYNS/0BfTXwJ/ZXjQ7XG/OVKLLAO8chvALAlYyRJe8IhqJgSUdjbxaK0NaAfEkL6yzrrcb790fDepuQqOBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrf99HU62dHMAqZMXbO8Ll5PTDmRKKXf7pelbmJ2joo=;
 b=Oad5xUajcxvvEshJf2rqu0dDx0Tjhtba0FTY+Xtz4RGt8IdO0eT6JlZ/c6ldfqFLCNpZGjUTogx6s7H8VzmzgFhCXJ7BCf/P6zXc4QoocfA+Y3P10qJfwbOYBCKP9pkEnbG3Cb95bjoHGcMSoBNqq22cLn99bT9Tv2VGXFGkqZFDS8eDb5wuCRHxdkMWqsvh3Z11mXFPPiFfx5W/Rji8lnNT7Ngw+RIjnnzh5HGKAV3TGnCQ2kBn2+cti6N6wVzJ7zLYbM5VfoF3ERx5tI+CQgZ7n8oaX8ynee5fWxL2s8zaTSHD/Wcy3OFcUlhXIdof7Eqt7sb99U9iGsA/AjmzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrf99HU62dHMAqZMXbO8Ll5PTDmRKKXf7pelbmJ2joo=;
 b=pF2tzLWvhzKutIOqNTK+r54WN92FsXZqchmKCV9/UtJ8t71H4GpVXrA7sS4fdjo6vDq8bOgedEJM/BkqkVxVyOYvAFkTk1OfS18Male75Z2z2FZbwwvobNv/oa3PO4KYvCLBp2+fyJCXBFEo//LZ2HO5vqznrXebsOwDX3EZfsw=
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
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 06/10] dom0less: Create llc_color_str field in boot_domain
Date: Tue, 22 Jul 2025 13:59:46 +0200
Message-ID: <20250722115955.57167-7-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: c217366b-3c5a-4425-9d04-08ddc91755d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rGEFXR+D1NvqYpjUtChSYXe1/24tgkx3nHNhWznFK3wXttCrJaD4YBkSWhpt?=
 =?us-ascii?Q?+0/s6oes8jsaKbHLnMaoHlizCWLekrcHbRnAdJI3SWvAswp3fsGZcaKCSyl1?=
 =?us-ascii?Q?bkEDiCikafCZykXHOclFLrW6hS2bCH0mcvhJdNZwkHXQy1GKEPUstzvpeNgP?=
 =?us-ascii?Q?OzscBOJry/ua4ukTpHmizpOseiB4AhLM9gigElM4fZtjVO8bU7F42tllgPkR?=
 =?us-ascii?Q?7lFzriUxl5az8XOVptH5DZaMfXD5r3co1/Y/wD8osmLy4Nr5Zqk3hG48RLS6?=
 =?us-ascii?Q?rkeTzvvqyGgFM8dSUKgP9IA71pcyqE2ZFx0RZEPZiuBLTMLjF8vEMux7anhi?=
 =?us-ascii?Q?abdsJjWzmfpaauQORmC9d129jzSV/JLO0/VYLZXOvutjgiJDgqCw28Csaj3X?=
 =?us-ascii?Q?/P66z831JNJ2P4aof47ZqcWs+JThchSMzMQOj14ptPBandLLlaxIijHSFPc4?=
 =?us-ascii?Q?MBtQc5DV6jqAo1mKHZ0QX/GM5q31zLcHa3cwfmh/UYishMtiRFC7Z6syfu+d?=
 =?us-ascii?Q?uke0d1JJsFUeXdpplWOpBP1osRIa+Z4blHaxwQecmXXCHDtd7DXX4whlQse1?=
 =?us-ascii?Q?Cw+RmfzeX2jbN7z7PwQ+yOVsi2S2O8Z/bfK4tLoDsdclviATxQBWC8WXSC+Y?=
 =?us-ascii?Q?0kOHW3I+5dCiDr4KlcSc/r0TINPE+JBB/BnFW50VJIUKFNxQEpyTHZDPIH0X?=
 =?us-ascii?Q?/oCekjQixjW0lUFEaxWw6xcet/eAr8lGjdteCZ8L7Piql2lR6yauZuRHeYHy?=
 =?us-ascii?Q?UtZTAHpdJTzKJD3uHXLi7CTkuGkKg5lToiYbZuxe13+aVg1LbCAC3UgpYIo5?=
 =?us-ascii?Q?sgHDcwOmydYDbpcJaiKX0HH2kM2WtSv6oPv59SlnR7lt0A7OxUipkb2joUSh?=
 =?us-ascii?Q?5/3o7ID5EFkjsUePvfgL7JT7CiTCI32/439F9+xHlyIZCuWwqPuAkT11ln5C?=
 =?us-ascii?Q?4Dfp2rWJ7J3/pRgAblqw36RcVRPlu1aBzqu070m8TrhuPw08e0uyDXQ3bQeY?=
 =?us-ascii?Q?Kh79NarrUTzJzhFmr5G7vtJlBJKIx3OjL3ehly3Ee7GTENUnKgVQVl07DUAl?=
 =?us-ascii?Q?GUjgNdCrp6dgWtLRM58GstptySb/ehm34nShMsGoJwKGZBtsoqWVdAWxbrYX?=
 =?us-ascii?Q?j4p1ear9W5WjYI0uV38oPp5w63UwV9IU+93605UX34nSjyiMBH96IPkd4stp?=
 =?us-ascii?Q?qASO5k9RayRKskYJPs/+sYKWus98jMne99mp+SS7QeFEiLSXFndm6R8JOmOP?=
 =?us-ascii?Q?shPvIaODko4fae4N0/466ABv1QlAYXTxPNN6hBuKpKFoH5ouv/urkOjAu1Jn?=
 =?us-ascii?Q?BzxHnEfYOcyuonayphT9OZm5pOkfjmQA7nTAwixavxfi9TmD39uWWQz/c2sk?=
 =?us-ascii?Q?zACHCuwA804GKR9Ud1DCGmncQpfyzVd8FDE/RubAfO+SYDz0B4944LdwtX+g?=
 =?us-ascii?Q?KpPPQ8Zq5fyFaJWi73LY/CcFBgUi0vTzqwTDpfPLYZStcSCXQJ99fnqg+MTZ?=
 =?us-ascii?Q?Lj9we9KvImkJ2A6cxxwPFyoEtDd6SzdovTQM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:21.6633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c217366b-3c5a-4425-9d04-08ddc91755d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626

Later patches move the bindings to a separate function and expect the
outputs to land in fields of a boot_domain. Adjust llc_color_str to
live inside boot_domain so it can be parsed later on.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/device-tree/dom0less-build.c | 12 ++++++++----
 xen/include/xen/bootfdt.h               |  5 +++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index cee666786e..e1d723c796 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -834,7 +834,6 @@ void __init create_domUs(void)
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
     {
-        const char *llc_colors_str = NULL;
         struct kernel_info ki = KERNEL_INFO_INIT;
         struct xen_domctl_createdomain *d_cfg = &ki.bd.create_cfg;
         unsigned int *flags = &ki.bd.create_flags;
@@ -955,9 +954,11 @@ void __init create_domUs(void)
             d_cfg->max_maptrack_frames = val;
         }
 
-        dt_property_read_string(node, "llc-colors", &llc_colors_str);
-        if ( !llc_coloring_enabled && llc_colors_str )
+#ifdef CONFIG_HAS_LLC_COLORING
+        dt_property_read_string(node, "llc-colors", &ki.bd.llc_colors_str);
+        if ( !llc_coloring_enabled && ki.bd.llc_colors_str )
             panic("'llc-colors' found, but LLC coloring is disabled\n");
+#endif
 
         arch_create_domUs(node, d_cfg, *flags);
 
@@ -972,10 +973,13 @@ void __init create_domUs(void)
             panic("Error creating domain %s (rc = %ld)\n",
                   dt_node_name(node), PTR_ERR(ki.bd.d));
 
+#ifdef CONFIG_HAS_LLC_COLORING
         if ( llc_coloring_enabled &&
-             (rc = domain_set_llc_colors_from_str(ki.bd.d, llc_colors_str)) )
+             (rc = domain_set_llc_colors_from_str(ki.bd.d,
+                                                  ki.bd.llc_colors_str)) )
             panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
+#endif /* CONFIG_HAS_LLC_COLORING */
 
         ki.bd.d->is_console = true;
         dt_device_set_used_by(node, ki.bd.d->domain_id);
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index f107099263..0e82ccea2f 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -125,6 +125,11 @@ struct boot_domain {
     /* Input arguments to create_domain() */
     struct xen_domctl_createdomain create_cfg;
     unsigned int create_flags;
+
+#ifdef CONFIG_HAS_LLC_COLORING
+    /* LLC color selection string */
+    const char *llc_colors_str;
+#endif
 };
 
 #define BOOTMOD_MAX_CMDLINE 1024
-- 
2.43.0


