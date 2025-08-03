Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90ADB19353
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068410.1432494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMj-0005Nf-El; Sun, 03 Aug 2025 09:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068410.1432494; Sun, 03 Aug 2025 09:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMi-0005I4-UC; Sun, 03 Aug 2025 09:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1068410;
 Sun, 03 Aug 2025 09:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKy-0005hH-7C
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2412::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 155e1c43-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:49:02 +0200 (CEST)
Received: from SJ0PR03CA0267.namprd03.prod.outlook.com (2603:10b6:a03:3a0::32)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Sun, 3 Aug 2025 09:48:56 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::48) by SJ0PR03CA0267.outlook.office365.com
 (2603:10b6:a03:3a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.19 via Frontend Transport; Sun,
 3 Aug 2025 09:48:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:52 -0500
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
X-Inumbo-ID: 155e1c43-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwi/1JIilJ/I+fYlk1YYQ7u4jun7K2iAKHUjb3r460YqeWxxZfqBHFeluIfvQpnnxeums5EdnJQ4gnAXSMRkS5kUjd+SJd8RZNSteRbnBccWYXBvDsOtnAIeFTVUyVbnBJvQBanQByfRQkYR4B0wFvrbSCqvUINsZVY126n7tG5q2Vzk333Z+QmWrETjyCG9yNy+VLihHGjucf9DCfi59+CbL0Qnm76a6dJepOxF8K9L3jFhdAre/1ArxB2fb+f0OMtAyDwVVCV8CpYI37CO6sXSaTN3Yh444F9ngl2+y0TUpS+zT3zyY1tuJ02ZGTP1URmuseW4cBALwzDho/g5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkYdDzP8GNEvmLPt9pWU8qcnGzXOWDKR8gYNHnsWjrQ=;
 b=TRoVtTFUN3thKDa5xpYMvKQ4zsj+ty+FWq5UVednIdXTNJfTPsQCNzzX4wjHEBRVphE9OmPZ9niENWbI+EYwKSvAnyiKRp/ZBYFpljoAj4j4FwsUkzpEiQJmV0HiU/S24P6X9af3/WupLPGR2qsHdo7SMM4Yk+gsDmH9kT0Xsun0lxz4VgprDmkW0U/rAXBm+eSxZbbQL4MuJmGTpOqGTIuZxdsuhdQ4TLdUijXEV5LAKlfs7NShHReDj6r8Z7/NfnBXUoY8/BigrYTEkSrr03srJQ+70K1vECopxpvcPVUqgKufuw+7eTt6pmfqojW4QmXPhHZE5WyZnsNSyySzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkYdDzP8GNEvmLPt9pWU8qcnGzXOWDKR8gYNHnsWjrQ=;
 b=NXtE8CYR5eiWZXv25k114P5oSO5mVrmfusK8jN/o4zGGsPPmmV0IyEtdjU4E8f2vkNJC0GxTKibg0JtMdUd5IY5ho/+P+48ztAiIK2JfiWLP1RfgmIBuvF9uFKJ/Rz7K3EJ4KP7zJfWpK9svz/syroR7+wIerz+OgwQ0EXn9YAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 19/25] xen: make CONFIG_VM_EVENT depend on DOMCTL
Date: Sun, 3 Aug 2025 17:47:32 +0800
Message-ID: <20250803094738.3625269-20-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab5d1a9-e408-48c8-61e3-08ddd272f670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oBULuB2hZsIyGgYxntJr+Z3C3hg/zzL1mZLYa2MDUy4/bfD+U8g3PuCVqjJC?=
 =?us-ascii?Q?Wj8NNmtabT92Pt/jCbG0i9rtTBncNJBuxziTsjoi6NbxLiXhleVb4kvJhTHR?=
 =?us-ascii?Q?1t12uOp7X4kHnJmWMXGCPN0hk8YQ9vlNKam9lnLR9rSDeqijoUcfz6ydEIJS?=
 =?us-ascii?Q?tPY3dW4fMOa8Bu9j2uRYfalNr8FJZiEJbxOrEdWZdNeKEqUUkwnriq6gKhSa?=
 =?us-ascii?Q?1QeZawr+TVurE7wkJZry1Ow8intdoUqSmtq6HpVr0KGzP1A+Ab4j3BXrnHy+?=
 =?us-ascii?Q?ONzuc5WfrKQpIaq9NUCId8XAmBOGhmFCOX5lOQ4ISyxz2V7paJfsKn3Yiu1b?=
 =?us-ascii?Q?CJokV9R7QVJC6iYqdPlJNMrZP2KoRzCDwNxJe4t1DZX6BOvcyExzAPjyoamg?=
 =?us-ascii?Q?n9Yv1uwloC0hHq1mL1lHCHGwDjg//8u++04U6SY7VHbaiClUBWvIO4cvzzKL?=
 =?us-ascii?Q?IcJBtOfKMCYzlFhIQJJxVKhx1RdBNMta2UJBlOF78rpZJV6fOzgKoL2j9MD8?=
 =?us-ascii?Q?SrJxVOqpXy5IMY3Yr5n3qipgdzXzadmDrX0/bsDaTmLHG630pXL2Ox3ygcfn?=
 =?us-ascii?Q?J+jNsQ4ZZxKPlqLFszknsdP2OaUXUL4+8DJCCAz8zf/7VZSYKHy8uVZHoKRF?=
 =?us-ascii?Q?r7LQM9d59MoOAqvaQe2V441pal/2301d25LKCcVmc5AMKTuJ78MnPin1cRw0?=
 =?us-ascii?Q?Ncvx2kbd7AdK4QVGoF1j6eu4oas0hHY3JFhfMz6aebmu45LNMGoJwYQIQLkm?=
 =?us-ascii?Q?4KpjZQjfmZ6qZ0C+BPaNzCsUF5EiSSp2uNTq1nNexLY0aob6W+Bugs2TkkXQ?=
 =?us-ascii?Q?XjwESIojzUGmvLmf6f66lBXLfrhifu4pe08QUuKDc6ho7yiaRHe3wqlXTDPF?=
 =?us-ascii?Q?TE3tDyGZhWJPaUoDQWLbYXOSogER3dUCNR0MjMrNNtR90/tdv5PpKUMldjip?=
 =?us-ascii?Q?S4fxLWcY6Wbe3HjoODlatRVJF0hVHZ/I+eCbc4oh9KBwxFsV928CoNfPNpff?=
 =?us-ascii?Q?a+r82ylONPgBZczmfSDyWumsH3Z30HSn/VDd8KAzPT7IN+U+eXr2uBGhe1Hr?=
 =?us-ascii?Q?LfxuSgyEbTsJXErGa8MZHfht5Nd5FVbH8RMwHjlJ7EEqUDamhnqEucbis4E/?=
 =?us-ascii?Q?dowC7wb55KB2/fRMKFn3Wkb9KBKnyidI/NlP/6AH72hAseITenw4nMf8Zk3U?=
 =?us-ascii?Q?CI87k/ByWxpa7f978H8ifJWGqK6PkkTNijYPFcFaq7CQ/997NSEqQ0mTi+tP?=
 =?us-ascii?Q?Z+aYIUNS03Eg1RvyTbX7k7Ak54SWb8c3TkHtIwV/vA5BZD6D1/Op/Fbq1LC1?=
 =?us-ascii?Q?RbjbFp9cHeeQkcbyppqYuWmgUCk2Wctu/hPVaVJYTUIgTpILxQByIxf4AAnw?=
 =?us-ascii?Q?/CYUrW4TSHjGst8HJMTgUzKLaNrW7d3xUo1OuqQgU02lpXLs9OEP9wTc0BeO?=
 =?us-ascii?Q?p7ydbaPVYVQSpwk83g26bG3LFmsd4DQ2aS56dveqtHIbv932cfWCn1NHswio?=
 =?us-ascii?Q?UQdFvo+N+bCX/OlNHCmvkspuPCMrvrYuXBTh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:55.7797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab5d1a9-e408-48c8-61e3-08ddd272f670
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

VM event could only be enabled/disabled via vm_event domctl-op, so
CONFIG_VM_EVENT shall depend on CONFIG_DOMCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index bf1850c154..24a7b83af9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -145,7 +145,7 @@ config MEM_ACCESS_ALWAYS_ON
 config VM_EVENT
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
-	depends on HVM
+	depends on HVM && DOMCTL
 	help
 
 	  Framework to configure memory access types for guests and receive
-- 
2.34.1


