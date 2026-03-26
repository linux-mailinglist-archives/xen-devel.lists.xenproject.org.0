Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOAMOPCXxGnn1AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 03:20:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC432E53E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 03:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263223.1555287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5aJl-0002Dz-5T; Thu, 26 Mar 2026 02:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263223.1555287; Thu, 26 Mar 2026 02:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5aJk-0002Az-Uh; Thu, 26 Mar 2026 02:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1263223;
 Thu, 26 Mar 2026 02:19:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w5aJj-0002At-Lj
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 02:19:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5aJh-00EWxc-GH
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 03:19:27 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c4977c-2eae-0a2a0a5409dd-0a2a45049880-38
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 03:19:26 +0100
Received: from [40.107.209.61]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c497ac-c823-0a2a45040019-286bd13dc6aa-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 03:19:26 +0100
Received: from BN9PR03CA0927.namprd03.prod.outlook.com (2603:10b6:408:107::32)
 by CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 02:19:20 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::f0) by BN9PR03CA0927.outlook.office365.com
 (2603:10b6:408:107::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 02:19:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 02:19:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 25 Mar
 2026 21:19:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Mar
 2026 21:19:19 -0500
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Wed, 25
 Mar 2026 21:19:18 -0500
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
 b=QU8two/LqyWynI0ZBPBe8o4qwy5a9755vAGtykTm56HXjUaqCRQWh9g8SN83FcLNnmqrVCe9ZBkcMb8Ew6/Hr16+Insftaw+EHgWFkh1zGR1wgvjZGDOLw68ERTHQqYMhsfMn7rCM8wIuq0rkrRCCIZRcqyqtqOsJCAb5VumZEXuXRo4yI0QOtcgseI7rM5TA1lL52UqMEoAiN950Oi2xJEggoL+8AI3jODre1YIbgwPxHq7BvmJ2qKClLhBHWFVCPZaKLMFBieRxVgUzSnqdr2Jw0nmQZyZxKdpeU5ag2/neWYHNlHdydBYwOMnJZ20VpTWIHaUHauBl7ZfihslaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYlzIjD3JfzhhfUSRTGanYorEI5YvO428R5m6MXnJBo=;
 b=myFKihjt25GP/bct0Dx1++y7xoZDVP96ECJF6xwc8u0muA5aemhSLN3nIVCc83ENAIoUzcM3LF06WDGBxi6nGdhHPoDxYauX7E9euuLkKEwLvAwFt0Tv59HAsphcLJjBhJSkTNCyWNsLyfRW78h2lWiPU2NYkWeNxnseYt1vfEo+CyrZwiMjYtlK7qHLkr/OMlll4j8Kd20K23EPztwK21HUqiPQEapQMK7TFhBiIrgAZHciLucSwJ31/UkPob3CbR/3WAkbvjW1TL81l6ctdozhN9S9X8+X+HVRWLLsY6g+ORZmq27cktrmW0VVBtwVgOfN2VCIrRgW9w0edSi+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=dornerworks.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYlzIjD3JfzhhfUSRTGanYorEI5YvO428R5m6MXnJBo=;
 b=i+RSHKhb6EePwRjORm+ez7ugr43aod99VFs8O9VMwflm2NyBksijA3LMnupg5RV6uyvyzYOeiP4kiw/SQmx7BETyglPkrUjZ+qUBPswBocg4hsInED8t0dGYyds+UqIFWv4cXPRj7SiDtUt5Y7BFaqcVhdbFuUyygLC4w7fF1h8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@dornerworks.com>, <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Jan Beulich"
	<jbeulich@suse.com>
Subject: [PATCH] arinc653: remove idle period in default schedule
Date: Wed, 25 Mar 2026 22:19:09 -0400
Message-ID: <20260326021911.782516-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|CY8PR12MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: dcad2469-186a-485a-b1bc-08de8ade16ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OrULxt0rb1LYyzoYSdDHefRBd4NRjhuV8js/jZVLBgDIYyoyfvGKOfjBteca8rGemE1Lw8y2yVUjZB4VktvNrRwGfe5+GLDyoeHl2G9/i7b1uMMqrscADdni0kWpm345fh9PdE9JADXu26RpO7uXzkvYZjEryBVA6qydW7GTNV1blU5ZqQZL5wgOfVymAruXRsRJ6IDBda8SNaYxRiYTtQIojW6mKscC1co+LbtkTilzX5NAPcJc/QMmD3nxnQnbVl+VQgOPsUUm6oYgQTNR3r8aZLZ6eZFVxfAfet9y4zJV1T3+C1Wk7A3vV4R/WurDbA2Gez+BocbqML06Gai+KVWO6/9TT54x1dtuwZYBQQGVhtUtiYkdThOh+D56X4yW1aiIclxqNfFh9M2Ray5Wp5mH/vlWcH77HdfPlyICYoIWmbHI/f5jYJxTJ/2k0x4nN1A7iWp21dVQvBnsfAXEPbMjDqsAYoTkvsHnrYdbS/oOnZbv9MfBFmpTZUwb77hPic3yH/k2+P8gsuCBE4hzjHDXNWHFK03VvkeJJBikHwIIM3BPsluHeFZiTFRaTl7OZH6PCQjv/t4xG2daGdENtFsLj/VKItEhxfJYtsA17E50SBH/hLQxlQsqzAH+/PvSOpvfHCokgRhIyqx10bo/MtiUI+jznhgjeT7z+ojKnfdts2lNTR3+L13J9tosPylHu47oO7lQ7DgleYDf5Rmb/L1V1m2J4E+WQbmcJohTHkF7YTVD0vr8H1qfqhiqHzrvOdKhopb+rBhnYHX+E1X2Ug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+NBTowrE7MHJ9zrcGtlv2syBQF+GJirKF/qK9PK47Vk4jjDgQCsEO5Sa8/dj/JI7ItH8bZSt85b5RDt6O74ulpUNPxVuxhyVkwLAZL+xTtfaYVVMlCvkvKuPYwyT7qBG44B7akOXxPUaq7tzladKr4OFQB/9gseQzlI56F+HX1ztPReEJAJJ7moRtifQkepIieYqo/ktdqaZWI0ctv4vv8/R8halSQU/brxQQfwIluWOoxVTw10E7XYWbX6UyAHsCt+EFVgQ+dFbKM4Qqz8jRs2jTu3ULnBxGCCdlzYklDHjznRu39q4AOKgoNv2nTrItWBrGLoONsFepTBL5qzHU0UXcKAO4aZyLkslebFfg9sHMFhB//IlZBcWzgjQJqGAm4ZvNg2MhR9qxYukkYKoSwHlyYGMRQFhc3DnItlgxO42tJj11uWyKw/VL5wGtRk6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 02:19:20.4935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcad2469-186a-485a-b1bc-08de8ade16ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8193
X-purgate-ID: tlsNG-ebf023/1774491566-106659D1-C7FB828D/0/0
X-purgate-type: clean
X-purgate-size: 1145
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@dornerworks.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:nathan.studer@dornerworks.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 97FC432E53E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

By initializing major_frame in a653sched_init(), an idle period was
inadvertently introduced into the default schedule. Account for the
initial value of major_frame when populating the default schedule.

Fixes: f2927d8343ae ("xen/arinc653: fix delay in the start of major frame")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/sched/arinc653.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 8a4f4259d8b3..b709bcfcc8a4 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -425,7 +425,8 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
             sched_priv->schedule[entry].runtime = DEFAULT_TIMESLICE;
             sched_priv->schedule[entry].unit = unit;
 
-            sched_priv->major_frame += DEFAULT_TIMESLICE;
+            if ( entry )
+                sched_priv->major_frame += DEFAULT_TIMESLICE;
             ++sched_priv->num_schedule_entries;
         }
     }

base-commit: 5ebd4dd14118e4eb24f1d409a7ca3773f77e7e41
-- 
2.53.0


