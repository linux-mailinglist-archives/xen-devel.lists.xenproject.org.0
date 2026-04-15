Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEXoG5h432kATgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE6403E8B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282282.1564920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYg-00030w-Fx; Wed, 15 Apr 2026 11:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282282.1564920; Wed, 15 Apr 2026 11:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYg-0002uj-AR; Wed, 15 Apr 2026 11:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1282282;
 Wed, 15 Apr 2026 11:37:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYe-0002dH-Li
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYe-00EiIN-1m
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786a-5cb7-0a2a0a5109dd-0a2a4507bd00-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:23 +0200
Received: from [40.107.201.51]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7872-ba2d-0a2a45070019-286bc933c55f-4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:23 +0200
Received: from BL1PR13CA0147.namprd13.prod.outlook.com (2603:10b6:208:2bb::32)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 11:37:18 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::fe) by BL1PR13CA0147.outlook.office365.com
 (2603:10b6:208:2bb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 11:37:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:17 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:16 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7c2MUcoSltDJUc6qWC1367mtrZT8LhDV06G0jiBjnoBSUy28cYKmw4x8RnEJWXevbexQbRpcZwpamzZ0wcNQHxJeK988yh87V7BbG+jf9qTxoTETPn4dRV177rH3mndv22zs89mAtvzqy6waqAudTBjD380dl3bpzvSgWfsExH/6hk+yKMwWMQgF2yl5YZCq7cZoTeHwQGoMoXfbiNbesTOW8dZGnGEzVFRSYklrjvd0wuYw8swU/idUvblys+kyz6Ogj4Ch7WtjbNwMobRB1rSnNZqMTukgohb0aFdNGM0ite6fIV8OeH2FDuYAzj8538HiojMXoKrxy02sTFjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKYP4E5I1ro3m4rC4xatOfhu9k8oT84Qye3Au8P0bR0=;
 b=a8GxZYSDyZkJoI361q3k74wq5Q2IR8W4iJ/UzrDJOtWXNfezZSLvApAsSvzq+E/0UjdLMwyf/BqWxeJYDexn277F0m1imBFEAVOOPIZ8FkSOp7jpLujnEFbsG1tl6GJOKvLdvSQyAmM0OOBnBOFnnCgKVMclZ9oEW6MDzE15zk8v30aQMFn8qbO4oSColCBxtgpu3XczY5BH4D2pVk4qI4y9VGU7BjtHiDb51hS6DV4dT9mqPbs2WVKPimLIw3Z9UqDiqiC5X/B+jFAt9dS2zlozHveXcAuqjehOcZpcXtbH+6HJz8/+Prj3BEXOd3ZXO/MewX62my30y+cukuDrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKYP4E5I1ro3m4rC4xatOfhu9k8oT84Qye3Au8P0bR0=;
 b=IhRuXLL0WJFHHpohU+gDFz48G4zc11Rfib0rv56XdwvSWBfQlmKc8XSrypBRLhwM96pezj26/uZaCzX8Kf1+G8LTl/RxxAxGhjLtIQM64FbgoAjXxGoE2Kmz/zA26LSMIR+DtDY6kyUzjT2ptoTm5gErCODeYJoc3UOAWirLq1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 4/6] xen/dt-overlay: fix silent success in dt_overlay_remove_node
Date: Wed, 15 Apr 2026 13:36:58 +0200
Message-ID: <20260415113700.107915-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415113700.107915-1-michal.orzel@amd.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a0a1e9-c4d6-4cfd-656d-08de9ae35982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	93CgH3e2sS/b2ZGNQk5HLUMslz1U3svMNW24DSv+ZyTldX8rcOdDCBVPywxARZ3WkIqFxatrGRzTd8JjN8//Rs9hBtvhoAgyRgxP6DIYJj6wwIZ33yT/+s4LD/jUDDNqAKxQWewm1pz17IkPyKYduMgmbMG6798AuDqBgZoLjUPkq+UzYFaJQY8lCMUOKIhovOKhl93J3p5aFXqkdzdz74waqTXj3pOxgnyCwjhmUsrRKGU7qk6vYBuFpENz3wBcsZQoICkdQ0FeiEJBC7FTeuq+9hryJcDJcA/4ikfUonCT9iDRIan4S5Muu50QNk/Sfhl2Vn2VjMfRo67lMlAxfigGgb1Qs/Q8VGMmMzjILD2hXNyEo+M2ZA9fvctLi0X+exs2puHyxfVGOqJ0rYaaJ1FtX/kQO7oI9AKw8QPKqtsW19ceYTgG9Egv5Wjz4v/g2P7nR6p/ui70u2CVXBIBvsIEUOrerztocIHFkXvld+L3KvVIoKOZV17x3vKo9RHMGiLNZpHY9r+BlnTRyYdTMEdqEg2Ek2mMPUEZ6y8OjGMgSvc+hsZy5NoJEyWXd/Tb7DemHtbsz2w2leVgXNH7+N2GFNsrcG06mXB38TMF+teHHQYKeo85rmM8cAeZNBBGrrZ/C6f9d08LYzbvCp6QWOmCGUBAKgZG5wYx9wkrM2XGf7LTkO8Tcmokyba7ScPKzf6+94T+k6MbmYXbKnPTOZXBiAchoSwrZ90IwyuzeVDoZWm850qMmo7PqvTpOKVHV5ajPFTfHZUNeuM3zM1GNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2d94dy0encczEHStc3OvEWPDL/aLJdp5kytPmukhxjhPfDlx0Nf5D9aBavkkOZtxWIf/5egMUtWD9Ga0R0mLZRF51f9FsT67aS5yBJmz57fD9MebNYXTslNyjdgRUxLaq4n5L7+Emwg0bycX3RzJppktHOrKA8qWdOddwQSKJD/dHjNXIVJ95VXDmr/mfgCgsDEs0KM8nbebXmgroT/7k6KAhI9k2PXIQz9L3K3RIQxKv4hRUkz3uSvC1zvUyi93ha7rJxa9hukq0QT3rK0pkGEPXwByRteGGhYHIhimBYl4eFddnL2osG+FTngwevVkYu9tN+1etOo+KzRfzxdYcaGo7EozKmg4EbnthR93t4P8VmL146IdW8963AXfkaJhaI7L86tHAD3dSyjK/SEvlKSgPw6jYvni+iO5vAE489qTV46qSGxR+Z6036o/UzdP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:18.2720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a0a1e9-c4d6-4cfd-656d-08de9ae35982
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510
X-purgate-ID: tlsNG-ef75cf/1776253043-12B4841E-F97C014B/0/0
X-purgate-type: clean
X-purgate-size: 1224
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 23BE6403E8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dt_overlay_remove_node() silently returns 0 when the target node is not
found in the parent's sibling list.  The loop simply exits without
matching and falls through to "return 0", making the caller believe the
node was successfully removed.

Return -ENODEV after the loop when no match is found, and change the
found-path from break to an explicit return 0 so the two outcomes are
distinct.

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/dt-overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 0eed1532a10d..d3d4669718ac 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -125,11 +125,11 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
             else
                 np->allnext = np->allnext->allnext;
 
-            break;
+            return 0;
         }
     }
 
-    return 0;
+    return -ENODEV;
 }
 
 static int dt_overlay_add_node(struct dt_device_node *device_node,
-- 
2.43.0


