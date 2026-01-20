Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA4D3C3D1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208503.1520686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DC-0001k3-TD; Tue, 20 Jan 2026 09:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208503.1520686; Tue, 20 Jan 2026 09:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DC-0001eO-KM; Tue, 20 Jan 2026 09:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1208503;
 Tue, 20 Jan 2026 09:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8DA-00018d-ME
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:39:44 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2befd7e-f5e3-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:39:44 +0100 (CET)
Received: from SA9PR11CA0025.namprd11.prod.outlook.com (2603:10b6:806:6e::30)
 by CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:39:39 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:6e:cafe::ed) by SA9PR11CA0025.outlook.office365.com
 (2603:10b6:806:6e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Tue,
 20 Jan 2026 09:39:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:39:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:39:35 -0600
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
X-Inumbo-ID: f2befd7e-f5e3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5NMX1xnixxWayE76remcjpt71HDW8/LcsPnN3dKvHYmsYYE3dh1zmOZH8iMIzhUMOxdRJHGYVxXWYzsU/XxYTVq9sMYEiI6+OuWrBg1BOyn/doy+Gkb1/ONtiTTQywirF7UFA6WR3Ms3s0ZhozuAD6ZV4ldmq5wwR+GB0pNYltwqElPmVN1lYWt/9JpqvEr+58r5divHpDGmGfCxBO/Ez3IFJzQ+M6f33zF+ueE6eOAilfybo5k3JteGe/Q2k0pqNjDveULJzZH15byidWKK3O4Q+C7NisvpEZiAHsR3mbLAAUMOSeXi+RgE+JDUq+P7XI6vCp0RSsTLJd5fDby8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf2eRnQIuwJBbc97LjKnM7yuRHPy483HO3xHLUQdgl8=;
 b=TBZknqjaYeSwZ80AU5KI4NA70Rel4niwqDBghzkZhZYO62zCt5M/Bq/+GDyIt4GGmvDJr7qs4hzEOFtXeS/UDNDkWLzOZL0/6y0t9Aw398V0icI0HuF9hITnXCw6H2p7LH3HUtCTAky8fk7ZO+b8eH1bZhNqKzDefjvE2EHAsJsqsPFzUi/jgUfpqChSUV2uHd9OUYkFwZIqxetKisVVeJV4CnqCh/Ej3H3lPpwkYK02DhA6fgGEwcgu+Ru82C3kDhP212VtgKjV/AHsAaPbV2czKC8RTPODYbUX7u7w0kc7GhzUiYUNuIPn2S58kGnFydPryH7gP+3GJHOBBfcVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf2eRnQIuwJBbc97LjKnM7yuRHPy483HO3xHLUQdgl8=;
 b=OruciJ9/8OkKTbbXD0Uvw00MvrWkgvlt17S6UC+z19IYutFXb0qEj6Va6DFb+W8eq6BORArIdLJyagdDTpor3mkta6v4StltzPv23pSnn6cPkZXH4U3eUhuS+avDka0SZqY1EVLvE1dgUIpJpqtiyblszZJIYKipXcJiqEt3pww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair exclusion list.
Date: Tue, 20 Jan 2026 10:38:49 +0100
Message-ID: <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 990ea3d9-9690-4cfc-b9f5-08de5807d45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WCOgcKAOaHBANW35uwwUeAfvGf2eUB2iHoBaQyNByRDGpVJOIxA1WoB2EeF+?=
 =?us-ascii?Q?VH2cXESU/1JleBTtMQ0LPZjTAQ3/YI1tCKn1f0lIn28KyDkMvIE6HZxTQf4f?=
 =?us-ascii?Q?rMt66TtRGwk2o0nEkb/6YVza+aMl+A1oQeS7DUPSDdH6Mim7R6bZKybK+M6Y?=
 =?us-ascii?Q?HVj09h9SFW5AOoOc/tQcDQrrQt8vbwMPtJD+nsA1oYIA0bgrhykzSNzB67AQ?=
 =?us-ascii?Q?GbPT0smF0Dr0zLeq6SxbJNnbxvsB98MiqSi28ZBbogJJn/Yg+mJuAm5iPoHC?=
 =?us-ascii?Q?ZLoRxa9favmvbZ5CvoTnWMHP0pibjAFZ6S02zNzrB/HTRfvDNVvXD7BeP1+i?=
 =?us-ascii?Q?9lVPBCot9xMQ3XTrT0NJ1pxKAw6uW1vwmySNq5OmQnr7utTIqSeY5ulq8SZB?=
 =?us-ascii?Q?tr4oFcKb9GX2um0IWOvLumqHwe0FxELZNDDtp+2dPsIxCThYYhudUJGS7TFj?=
 =?us-ascii?Q?LRXCa+pqg/z1KF7i77sJWC6lx85ikxojpc4BqclX4spmS47KWngY8UydMFHl?=
 =?us-ascii?Q?mwNdhIWMfxESiW8cI+nFLdZwnzZoKCsoWOD6YyxMXJYceWAGruw+dS51r/Dc?=
 =?us-ascii?Q?ny7slKtGTSRClEeQvZqcuvpfjE8v47x6Hsmeu/6HQLNMtPrRyWCHNVCQ1ppF?=
 =?us-ascii?Q?3oaI51OGHVP6CeZZkyoMtDLMDBziMskXGH/6grsqUiTb+0NXfOybA6RJv3H5?=
 =?us-ascii?Q?KiBIra/xjJ2GFEX4MNP8Q5Bdu7617AK5Ly27prm2hBqZ32cdgM/7nh+nYW/R?=
 =?us-ascii?Q?XXIMziZUpzZMkD4cjrJQb+ZAhQDaXYXdqRU1odHNyWZC9b29uNebFAjk/NK1?=
 =?us-ascii?Q?+NLFVfcnjFg9BBodSsqlrZZowv2A9zKkHz0QXSgOpUkOhbBQJigYTYqbjoKW?=
 =?us-ascii?Q?I67KT8lfjkTExBwcU5ePaE2DO8TtDNbWs7XNHRZ8dYBIe83Es5oSP3jdxyci?=
 =?us-ascii?Q?wOcgF0HPvVMRRDCD237Kufvu8bdglSNfP+BheT9Otl+CSphnUt5RhZIzdrw+?=
 =?us-ascii?Q?CswLVscWuFZvjbVokYyujuDjQ5A8+JL2X/PiuQTss5HX7gCpfqNrIcY3EfjX?=
 =?us-ascii?Q?eWGQZh3oarpETM0batH6kA0o0qcoMHWsbuq1NAeZvUj1JA9pVmU48Slaia3r?=
 =?us-ascii?Q?5kIvikuQ9MxDvYd+vTiX+HE1sVosfbdTUKovDG7nHQ6QXwt9H6rGeRn2mgWq?=
 =?us-ascii?Q?HgRZSWRUKhw2S8E7MosYaQCisB9yaEaApTSgLCn4c3Hux/DZcjDGIYOk1XkJ?=
 =?us-ascii?Q?C7NusFazyWJskyjy5BdRvjAENp6c1m4mu7LbofcSjsUeubbNvGwVHKIFkuow?=
 =?us-ascii?Q?oTDYFvYugVBxgSvP044keexFNW/Xfb0CTjdWXu/evY+Sbrh3MHFIXkLQNkg1?=
 =?us-ascii?Q?Th55iDhhJh0+MHXugrn2lItyI33jiWHu8VYugVcbCPLUFoYXG6TBzYgcfrk9?=
 =?us-ascii?Q?t4n3QfH1z0Q5YLFSpp4zgDMIQC25JSXE0T51lHqWjGXW0HIP4RoTrxlS0bU/?=
 =?us-ascii?Q?IHPHaBGcjhX95uknCPfeFEi7YqEDPYzaoIRwXYraY7pJcdfrvkAB8A/5lnDZ?=
 =?us-ascii?Q?osYiLOMydyrFF8Nev99uKOeEXDnzvXD82Qd72rXBkPQky21Az1e9LPFFnvpT?=
 =?us-ascii?Q?qgUdzKUz7bVysjF+LlxZLze0z8W4+99+fzaFO8ooLqbAsOwSzfGtxuU399l2?=
 =?us-ascii?Q?/GCYuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:39:38.3398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990ea3d9-9690-4cfc-b9f5-08de5807d45c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964

It's clean.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 docs/misra/exclude-list.json | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 388397dd3b..273e24db4a 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -121,10 +121,6 @@
             "rel_path": "common/bunzip2.c",
             "comment": "Imported from Linux, ignore for now"
         },
-        {
-            "rel_path": "common/earlycpio.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
         {
             "rel_path": "common/gzip/*",
             "comment": "Imported from Linux, ignore for now"
-- 
2.43.0


