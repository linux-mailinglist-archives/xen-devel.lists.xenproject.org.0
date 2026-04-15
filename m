Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK1xCZx432kATgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CF403E9A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282278.1564888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYc-0002Fa-A3; Wed, 15 Apr 2026 11:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282278.1564888; Wed, 15 Apr 2026 11:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYc-0002D0-5M; Wed, 15 Apr 2026 11:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1282278;
 Wed, 15 Apr 2026 11:37:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYa-0002Co-7K
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYZ-009G0r-Fb
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7867-e002-0a2a0a5209dd-0a2a450cd9b0-40
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:18 +0200
Received: from [52.101.57.26]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786d-f40c-0a2a450c0019-3465391a0986-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:18 +0200
Received: from BYAPR02CA0069.namprd02.prod.outlook.com (2603:10b6:a03:54::46)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 11:37:13 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::92) by BYAPR02CA0069.outlook.office365.com
 (2603:10b6:a03:54::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 11:37:13 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:11 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:09 -0500
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
 b=w+fOpr9kC2Blpa/vNJadYpwb/mlw1Hfhw3cFWmEJx27vdgLb9fvnAGwgqbRCsUpAgfPkq2cUQB/nTPSvhlLEEjCxNhUkxoxkXIxwPMqnu7R49rjzzvDhXGZQxxeytSWCkujGMUrVi23rRR3h7X4Es2ZLsBTL13/WitN6HdpYMzITNQxhj80R2OhWn2qAvlPbntDv9cca3UxTub8Zly6LD/8r3LfZ+6cbnWYe17cFPjaOkVl5yo6TvQ7FsMWM3zgv6TE01pGts/C/HHxYhhX7jz/sEZopg8ZTaqlwu+3FC3hk7T06xGwnlvceAteRz6D8YASYD1ucso71ieVk2c/jmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P1AkaFLYhWOON2UBch2rg76UUV/R3rJhXF5sFoZeyw=;
 b=paTeMkbAvrElntBkYpvNCXVZbn/qZkfeDkSOJN3/uaWNIM+UqxnUwDje3oxXgXMYcAILvjIW4Mnyq0PlhOO/6xB7yKxOQlYB1kRD5d0xUhByRQvZ9F64NWyvfCC7+gUSscI7GM5yYoAqMf5zP/4sPpRLofZENqpifKSazDVBTX2ntTRjuNqU42xL5s4dULt6IxTn47IQLsALpSTpFvUTCAFPUuG0fR5r7qTMKrC8NfVQPTVn1Sv9X4qkCP2H1xqNoAFyvneMbHW7i2kr0DD11KBnBXKi3sri2U3Oed/k+hHuWYiP3ECWIdoTiylmtVHxFEUgU95Pw/RofoQ3e1/fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P1AkaFLYhWOON2UBch2rg76UUV/R3rJhXF5sFoZeyw=;
 b=wN7FG22cskYd56HVuuL/lSmw/N9GGMbFXTyZgzS1H03v82qFFljGePFn8ck/beUmHNq96x9p9GeC78+2ADI5ewYUkY+0Oh94nUsxAAROVFRc3WIM9muCg4urlb3RRM1giNzRVftOvK8rboT4WCVdXJi+1WCmwWwJbbgK8Rd4rPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 0/6] dt-overlay: some fixes and improvements
Date: Wed, 15 Apr 2026 13:36:54 +0200
Message-ID: <20260415113700.107915-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 906a3078-f6b9-4451-71cc-08de9ae3560b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D1M0HXng9Yb5ddguUkr7FsK6SLlmjTTTvDVfRjAsrdEij9RNo4cQNGUx01U09pQXsdif471bDhKwRoHApQ3PEZYUGCBovwxLUGlmZLZAiCyN085cxoMuUO9CGacnPcx4VzOee+feAaOyYGahmbFfpPiI7hXRWz+hitynbeF5g0ZjTfm77b0y7lu7AXtu8TF/SkdFEwX25GYb8pb58Atr7uqBgD5oOKeSCJWR6c0aXDb7T7h4y+e44EZOAWHsN49+vfvLjShxgTYyfLqgfX2eBFoyNRXj43WfauFGilI/PX3b/MvSKnR06CNe5C5S60xrxjupl5RObuznZJXrAq10AusKgq9EAq46Vzdp61Swl7BwMBmPGH+wF+6G3uEo34GD76NdKaPhJgO6hFhhOqVuzAPTw7K0R5+mjHJXzvQOn2iBlDipbG1GUJpv2qCnCPbE/DGVdLv4JSROSjU64+8Aw8a8Z9uPwoAJjuoHk8KLBLZAj5/oQOFXVls2DlSpuW70EIRXI2AZpB3U6bYZJrv4pJQgD3PgKQI7xzZPCubpCJTNVU2Jp4TZxNHA0Wq8GZT6yLM1WqHx3/R5HOax/BQA4ZO9N5QjNkfFAGrcb7AuBe/l7OyeZvS2CaqVFNBU5ZIotX4HrZN4KYDbp4IR/MhnczUMUwgHsudU/Oyttl/bOLtfmQ7Anq44xqENCq3KYkGCzf9GPpkYVM5ikNlhMfCXhc/rabyMgc0GGKDd9rbAfe0OlO/uUuhen3foy7VvNRtZImCptz8D7FCg/jIWXreLcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B8V9olcV4lLe2Q9RJIU9ty4ecc7K3jrXDqk2Ktumxy3wO98G5dSZEXYARcm488HgYjxG033BBD6lFRCz/iNV0pMNAqEcoibM0m15GZ/9JD8owpKJ8AjokgaPXy/QmPZQiwXamGV6/5mG4pbotNGiUQjit/P0WLD4GOe3rBf8u95OaqltBjWvlfdgLIQGarcb8YmV/xtHT4sQXKbv8wfGAXFicIHZmKi5djeK/hLCmVEDSmwx3V9RwT97kP37Api88XMWhMvfYg8oYc5dsM3hVDYf3y8Bc+LY65SkGI2J5BLBwwzzfOMW8V7ycGMEtNTQFWuQjPJlVC9xZNhQK9c8eVcMxTkZ5RtbsGZb/aYizY3gqCrZl/ylbYagF0A61Yw+KyKjCDNAVDdTIblGmzeMFSvkSrtJR4Slsy85Bg5tnMZWQNNrjsOv+qAb6iU0WqwJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:12.3696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906a3078-f6b9-4451-71cc-08de9ae3560b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
X-purgate-ID: tlsNG-d25034/1776253038-FD756A3D-E1C80DDB/0/0
X-purgate-type: clean
X-purgate-size: 1409
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
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D12CF403E9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I don't like the state this feature is in right now. While the feature, even in
Linux is quite fragile, I investigated quite a lot of corner cases and many
issues are present due to the fact that we support a weird combination of
ADD/REMOVE + ATTACH without DETACH. Focusing on fixing issues and implementing
DETACH is not an easy task now. REMOVE handles things that should really be done
by DETACH. I think that the best move forward would be to strip the REMOVE
operation from the dt-overlay subsystem (I would preserve ABI). This would
eliminate the buggy, incomplete teardown code and leave a clean ADD+ATTACH
surface to later build DETACH and a proper REMOVE on top of. Thoughts?
The removal of REMOVE could be done in this release, not to carry on the buggy
code.

I tested this series with the AMD SW/HW stack.

Michal Orzel (6):
  xen/dt-overlay: fix double-free of rangesets on attach failure
  xen/dt-overlay: fix rangeset leak and dead code in domctl path
  xen/dt-overlay: check overlay size before memcmp in tracker lookup
  xen/dt-overlay: fix silent success in dt_overlay_remove_node
  xen/dt-overlay: support phandle-based targeting in
    overlay_get_nodes_info
  xen/dt-overlay: attach resources for child nodes in overlay

 xen/common/device-tree/dt-overlay.c | 120 ++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 15 deletions(-)

-- 
2.43.0


