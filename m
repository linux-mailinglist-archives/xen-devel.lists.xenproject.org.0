Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHo2EZZ432kATgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:37:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9F403E76
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282281.1564916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYg-0002tj-2s; Wed, 15 Apr 2026 11:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282281.1564916; Wed, 15 Apr 2026 11:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYf-0002r6-VK; Wed, 15 Apr 2026 11:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1282281;
 Wed, 15 Apr 2026 11:37:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYe-0002d0-7r
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYd-00EiIN-Kx
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786a-5cb7-0a2a0a5109dd-0a2a4507bd00-42
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:23 +0200
Received: from [40.107.200.54]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7871-ba2d-0a2a45070019-286bc836ac84-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:23 +0200
Received: from BYAPR02CA0043.namprd02.prod.outlook.com (2603:10b6:a03:54::20)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Wed, 15 Apr
 2026 11:37:15 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::6) by BYAPR02CA0043.outlook.office365.com
 (2603:10b6:a03:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 11:37:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 06:37:14 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:13 -0500
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
 b=eIOVP1pq34duUHo5i2GxCl23UlwJTbMy5nxJphsYdCuqdn5dVU0JNcV4098vB59WAHcF0iABR4g3n7QKCNCECPG9bm5wLfoHjeazfJsI5uCqzps8ZgcTHqObFu5hzsp1oxYu2OUce7vJ7sKTVmHkCQ668T7OH2r6ZaTVy5tRpjTl3R0nGQe5YXZLHv4Pk3yKqsWkHHoDfxD5suCJ8qHGtFRseG4JTMaRqIpzYwvl+4svGX8zscAUG0Df5KBkl7Z0Pan37Z5Sg+BacybO4YUG62XbUC1gZeoWOHiUYHmIkK7Jq8mXt3ZhMrfvSLdN+muHzS4AwraLp6XQI2GKoakALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZfueW+bKtEtsepdRhebqYHJ0nLM0ZVvpZlJIzZj62s=;
 b=lEaXK0HisMtgZXPLUUFLrynEtYWUmG0WKOV0n4wsrI0XfBw6r1suvNRQ+RQZtofWWwswN6BTa56+qRHveSwRVcG4EbprDDVOffiblIp6qIHbLstJMGvfE73Qi/ppIZTD2gG8loUFpwmtCz1XCGZi+l4k5AmJgZm0kpSVTXdkANs9SlnrBfRN6lq88ePzXr3CbIA7Vf2+Pe/mrxrE99Vv+wQXccvB4QEaPXnIDjEC+G0wtsOSh9PCJn/gnNv9C3JLOEDBppgQ6Y1d5baMzTQG0QxRtBpTh9k+BP2YaDQynbO5C3FN6NhO7HtrGHvIfhuE+6/vm1lDYI2wg9UVwW3J9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZfueW+bKtEtsepdRhebqYHJ0nLM0ZVvpZlJIzZj62s=;
 b=OzfMrVrA4AmoDbJP4E59sNfkcNsYP1zvnATR+21kIJLfg2RTjNQLP5MycEUEctk7FXWZllr38SJHtyjWyeJ5EunxLfZ3BsIimrnEGBzlBKnL9f9a4mOCnehPmsxrwNGsZLyF6rxjPXkK9vRg/zxmDzfgWE9+3l1UhKNIuo3LQyY=
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
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/6] xen/dt-overlay: fix rangeset leak and dead code in domctl path
Date: Wed, 15 Apr 2026 13:36:56 +0200
Message-ID: <20260415113700.107915-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415113700.107915-1-michal.orzel@amd.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a18a0f7-b228-4b80-4af8-08de9ae357a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qPO6hjxaGQmUMM0azdX7IAkw1TgaZHb8DRgEvjRavQu0YShdXRCgkYVLVrl0uWVAfOe2FRlRchX+t1tytk6diDC5BW256Fh0hoWD36VkaFd/qvn0iTcSac3PdsBCZvSEwdYaXtgORC30W2cng/Lq6YMuoIzr8bm8ZVLExscF1FaMAMO4mmkYLVWhThjYJ4tQVXvjRxfa2XpIZJLgnTn7x/v6iDZO5O4dhFl7Z4Jh/3RXdqr7/paaXgPOrKMv/pEDkPk8jUMG3ozO2SVPr95bUuhRokF9autwIKbzrQizhcCkv5lNNCMWdIb8jnvDTpFoqDV8EUtzccu+uXbPNbVQn4UmSqJwlDtjJJji8O62C8chZ6mPPAp3l1WQ/ibjx8n51bfujvNmhjc8xm43ufyMTXHHVTts2koAepmomyVjPgSuJTIEeMm4Xf/hodJE8TouLhDTu+XrshSTSa6x+aLgK+rosZlN0Xbf/qT9jqVYnTf9ZqqYwM9TGsxXxrkqDmyMoZd5JFyX/ZAUQoGChRGsc5UkBPpIRmtHAPJdk35umU6JQDblQMXd6WVyj6ViTnEG9GY76n0ZIa2AMW05EpbwC0Su3W9eP5kV2GX8kF/RMUnxc7F28qITxQ5o4kboCSGG//xejKcV2Edss0zbuBmaGvSazMh6dlypELKJEzKWxvXNy6pc6m9/rtREo9ZszAQUtnME880U0uKdP/QNjhcqkSJobRaaD7nBUUKI+ELhKEprzjgSMAqwUIM5XS3NXdWjYARgSdoLgjzEAt2P9iwC1g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r8eGcTweoxaoizso/jawi6TBDH9VsDrrV405uLEjr/LX4WjStm3Gh08q8uSuDs8mfBB1vOBlqWE6weWaG0BXC/0ZXtuAeISFaGa9FLO9ODUMex45TSn8P3YnWAUjDUOVyz32K7dUIWB/UL5u026Q/ta4ha43py1rTzzgVpAxSsFFjGEBBxW0wnTASQsHnNYZB5z95PpVrhGxl2pMM3OByQYXOFKNawJ55706RqbcMvMTcQZcPyPjpR1BAIJXWevX9f4lRwVh175V1q78S+sc9imVWY1mZ8TfzEE1L9g61Lo/ALyw90y4sqjVaEwLenS5JEbJgya/Qe6BMcYdIV6M92Bc7JmhCJxDuGr/oZMap4shNu+IPVHItcTftjo6Lzu7cr65Fl0YHH+jF9183IahoBKQyWBH+GCRAT66hP+jI7WsiVcaBWH4g4FhuwTZeov+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:15.0932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a18a0f7-b228-4b80-4af8-08de9ae357a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824
X-purgate-ID: tlsNG-ef75cf/1776253043-13D4741E-B85B477E/0/0
X-purgate-type: clean
X-purgate-size: 1822
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8FA9F403E76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

handle_attach_overlay_nodes() unconditionally creates new rangesets
without checking whether they already exist from a prior attach. A
repeated attach for the same overlay leaks the original pair. Reject the
operation with -EEXIST if rangesets are already present.

Also, dt_overlay_domctl() early-returns -EOPNOTSUPP for any operation
other than ATTACH, making the if/else at the bottom unreachable. Remove
the dead branch.

Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/dt-overlay.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 6fa07dbf42a5..3853e6e347fe 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -861,6 +861,13 @@ static long handle_attach_overlay_nodes(struct domain *d,
         goto out;
     }
 
+    if ( entry->irq_ranges || entry->iomem_ranges )
+    {
+        printk(XENLOG_ERR "Overlay is already attached\n");
+        spin_unlock(&overlay_lock);
+        return -EEXIST;
+    }
+
     entry->irq_ranges = rangeset_new(d, "Overlays: Interrupts", 0);
     if (entry->irq_ranges == NULL)
     {
@@ -991,10 +998,7 @@ long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
         return -EFAULT;
     }
 
-    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_ATTACH )
-        ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
-    else
-        ret = -EOPNOTSUPP;
+    ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
 
     xfree(overlay_fdt);
 
-- 
2.43.0


