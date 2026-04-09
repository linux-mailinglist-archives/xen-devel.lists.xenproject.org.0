Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4COjNQuQ12kaPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:39:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC03C9BA5
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277085.1562354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnjf-0007ze-0k; Thu, 09 Apr 2026 11:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277085.1562354; Thu, 09 Apr 2026 11:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnje-0007xF-SD; Thu, 09 Apr 2026 11:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1277085;
 Thu, 09 Apr 2026 11:39:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAnjc-0007x7-EP
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:39:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnja-0091Nh-8b
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:39:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d78ff0-e002-0a2a0a5209dd-0a2a4503e93a-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:39:43 +0200
Received: from [40.93.196.46]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d78ffd-02b3-0a2a45030019-285dc42e7912-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:39:43 +0200
Received: from PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::6)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Thu, 9 Apr
 2026 11:39:39 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::d2) by PH5P220CA0008.outlook.office365.com
 (2603:10b6:510:34a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:40:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Thu, 9 Apr 2026 11:39:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 06:39:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 06:39:37 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 9 Apr 2026 06:39:35 -0500
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
 b=k8QoljjurLraRQwcrr7CcVLAiunQ6g2alQLRfCxLN9QRQpYQKuiHryHcTBAxASoc+LN2b+Mjhj3hwzyQAnRv6Ufc4s/QpFopY2OjiW+Np0eSgOXwyi95cNT+J5jtThrF8FMhPF2HzvvmKUJBhV8GkugCbUdXJ/lX2mtXBvwEWYHQSpCZFz31O4Iw2Z6N5RJefjFZtCyPY08P2FqVUtq7/GyPwL4X3o4hJM9Z5x1KVnDwzInVt4Lo5JE4m9izt8rsoKPWiVVe3+GeQOqsFDepjus4ZM051XJj54APl3EQrkHRLLUWYkdt8BuuOZzHS5QbkTW8cB9cYdZoDFDo5HPfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkHdQhSuOILU1Lyi4V3JpOWxb5YZKjf3r8Q+r/+6rVY=;
 b=v0Uv3k0sAs73YcVHrIc+FZ4QICov6ictJOYGyQUeMchpOr0S5kalKwqqXUrhC8Cw9pbysX9ms8VPtbfKRT3pMl5jtsAvMzy4j4ulRvJ5qzBBsH4NHERyQow/NgYWj4fx2bf94u28+cP22F2emKeg1tZFDUAbEA9SNwJXMa1NUHJdU4M1ft4lgbixhwo4483tCcV3paDjQDwaZF6/Yj3A8jTSfN2IvOS+NQeRhUHXT3pZJvvr5TPIg8NIsXpGn7oGXRClYTyQGpHZQkE2gPXSiA6lBFljXuehMVcrboA5fDNXFtL/9vTQT9QxguZxeOX32vZHXzuOb359P7S4tSiGig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkHdQhSuOILU1Lyi4V3JpOWxb5YZKjf3r8Q+r/+6rVY=;
 b=4tONvX01SP3W9CPDFP2YsMhVPEbi+TO5s0GpSc5r8KgyFefYhUX/bT7cZk6i4E++iio3+gLWPgc0A9bNFtOGOTRp0ZkjkifYf4qZtwJ9D9ivkZ1Z08hf6OvoDvK/SdcUo37edIIJK8Gn67hqS0ofZ8M1QH3hxjjtlqFSTK1ffy4=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] Fix Arm off-by-one bugs
Date: Thu, 9 Apr 2026 13:39:31 +0200
Message-ID: <20260409113934.197619-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 04574b9f-5b69-49d4-b89d-08de962caeb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GHZDR7r1U2AzS8RO7cR8TkyW9S0hbiERujGlNqGVEl9cCsv8aW0OBIB2apcLL+VjoQg9o/05mB3/fc/Xjzcqi3v/BtujeCLPjvnVpv35PuIi/Fi+Yn+gM5nrEdEG6VcAMSdf8TCbbVSvTPT4RcUl2ZZ4IuCXQAucRy97chOAEmEWqA5b3rFpvupGFJhKxb5zPzR+O1x2YpHHhokuKFfXSypT1TVnv3LMV5HkFO0jI0f3e4BmSe3saeqmtzdgXvE78XPIRPEqJeqFSmBVA14Hbu0Y6+fr6RyQVfQ6QTSLHwL8Y234izZpwWggpJ7lMPa8yHNxtV6coKV8A+nlw70VCSSCrkh3cSeYt/uKQ4lLwkfZN+rZM5bxdP8jMhQU48zidkyllkWNQCtoFDli5wkxatwpN/NBHeF+6bSNYWQBIy0j5xGsjCVSA3Ip/vNx1t+KzeXMQTPuProsW+7Mf+s0NByTIglF4JJK+FidsEzxN/M1pFHaUByaFIT12Qy3CxwGAj1//+t9WSrVVxDZtgmMT+OZXASuyRAcXGZqi3SH/e4JeQeUi1Is1f7+obivWsC+yEd/y4FeNbiFtj3BPpVjBoCfyOhzZvlkaUi10B5V0II5KDRAucQ9NT3kKynzm6YcAjZ9qQ0b5yWZ0bKiwqmSjuyrIIGHo16jo5sIQCAdiT5GztsOYsO6H/HRFG0qEoY99OY/38XTlKJnOSWk5N4TwO39/TuEG80uQEtN+gXrd9fIEnvV2isybPhCNWcDOmZiUyy9ynmK843dGPtWuaEl+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qMsD1ythU67BehKK01UeIj1MVFRpEQ8Tim+1YrRL9Ndp8w7OGjNAfifTOTHE58TtvqmjW55jBXtGZzT56dR/57kpAqBV82+fRsksIZhS/cY46sPVBFKTcjt6lmewE/pySiYW+uGdWwvZdQq9iBkmasbSUQwY8jEhDV+ZloLO2MWFD/iSibBmBmqdOX2pLoWC5tefxqWSxkzEhJIvM62rAtmU3wFWzOTlZkTIefXGBPCTkF4KkgNwaKXJiaCqRnzo8CRNMdHkA3Arfw+Met/cns8dQQ/z0tY1MK6KZ6wLdMQjUTtGk0bj7e/GaGPz0Ynx1n8986eNcVPhg56h9DYRVT5CcZ/18YZzlIcL3FmTMbECVuXMZYrvAw9KbJfPwWC5l6yo3ifOGaa/4//e2spBcEMINy7z/6we249LSrbjOkAwn5Ihi3xMN5q1cOyMStZi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:39:38.5525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04574b9f-5b69-49d4-b89d-08de962caeb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
X-purgate-ID: tlsNG-33051d/1775734783-C8B33C9A-794356EC/0/0
X-purgate-type: clean
X-purgate-size: 615
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 4ABC03C9BA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adding unrelated fix as the third patch that I found while preparing 1/3
for ease of merging.

Michal Orzel (3):
  xen/arm: Fix off-by-one in iomem_deny_access() calls
  xen/common: llc-coloring: Fix off-by-one in parse_color_config()
  xen/arm: gic-v3: Use vsize instead of csize for virtual CPU interface

 xen/arch/arm/acpi/domain_build.c |  2 +-
 xen/arch/arm/gic-v2.c            |  8 ++++----
 xen/arch/arm/gic-v3-its.c        |  2 +-
 xen/arch/arm/gic-v3.c            | 10 +++++-----
 xen/common/llc-coloring.c        |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0


