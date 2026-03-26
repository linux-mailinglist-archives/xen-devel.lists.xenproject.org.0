Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kORqEfCXxGnn1AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 03:20:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9E32E537
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 03:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263231.1555296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5aKS-0003eZ-DE; Thu, 26 Mar 2026 02:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263231.1555296; Thu, 26 Mar 2026 02:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5aKS-0003cc-9h; Thu, 26 Mar 2026 02:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1263231;
 Thu, 26 Mar 2026 02:20:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w5aKR-0003cW-4i
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 02:20:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5aKQ-007k77-Gr
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 03:20:10 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c497c1-e002-0a2a0a5209dd-0a2a4501827e-10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 03:20:09 +0100
Received: from [52.101.57.26]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c497d8-6400-0a2a45010019-3465391ad97f-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 03:20:09 +0100
Received: from BL1PR13CA0228.namprd13.prod.outlook.com (2603:10b6:208:2bf::23)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 02:20:02 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:2bf:cafe::5) by BL1PR13CA0228.outlook.office365.com
 (2603:10b6:208:2bf::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Thu,
 26 Mar 2026 02:20:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 02:20:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Mar
 2026 21:20:01 -0500
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Wed, 25
 Mar 2026 21:19:59 -0500
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
 b=ufmtFeCi9W1Ri79UCx0oC3XM9eSNWN2AHDzgAgxLgzrTEAvBan9XPlpu8jFYfFGeSKOAJBO8nzDtWT5zII4TyNqyZvVIKKx1c7W0t7mJBWePv3VFQ6eiVQv/COP0SzLIrEY63b1Xg9IEM9nmGdPoFhv4Wz9t8H4ExJDybDCzgtN/rm9taJE2UDimGPhZm58uTLbyTKV44OQSkmrNQjUkq/e91X8z+EzROXT0QAPWxaBysuOaoB+nBgmoAFvzXHuyTskiIGQGeBkkT87+Su5xsC9nD5fLiaL49/AWR4p17CwIwfhD/aSsnReWe1jjgkdnSRt/wJV33ghKbhUM1XGznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2BN058tDvxtB7ESNjGhv07rMi1pu0JzTHdD26YFS84=;
 b=spXft4hfx3wvZBWQ9Td2JV5F095AwX+pTiS80RM48A/ya1lclSCaSLRHIjxcU2ULr7h9VeXijVcTyMlu6ZzMx83adVY9OvItSoiuKdEDdnlbMmiLyPOMs1tv1sGYSD2yJiyalVdHI2MMeyi9QAkX0BCjsIJIJIzgeJ/WVogE/gCrp4Nq6ofnBFG0Y4vvPjKIMXGWL1uiWqNSv05uipYsal2NrxyHBSum7oY3v6ag4RcT89RBm05QryTweGaXkbpgd1jm0jIpQ1mUvuaQhDXx2iriyUcdZHjfYRuSsUDBhkZbZQ+xw3GY2VRbLaPfbnluGUeS50Ak2UEHgf4ZacNmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2BN058tDvxtB7ESNjGhv07rMi1pu0JzTHdD26YFS84=;
 b=0hkX0rmOjj/OMnKf6LtfBEQxGdOt9PUby2ZfSW7uEsXl0eT5rwp4rc+7kMr6NNpOfAdm0RBaKdu7vk/Sv0hPWYPGzd+hFFwTE3MpzGoivRE8xSZz4ls+C73az7VHBhK6BRtqvJfXQHvCHW0KGVWY5iqjMTFKpkq0y0AgbJOA9ag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: update my email
Date: Wed, 25 Mar 2026 22:19:57 -0400
Message-ID: <20260326021958.782550-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2772ef-47dd-41d0-724e-08de8ade2f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dWyGo5GdC4M99S+9ptsdyGI4n8+gOhgT57gZDOykw4pKFgM2jMB9UxgOsepoOZDtUXXUkB5ddjsxqfZ7/7XKu54GE8VJhMlqeCW7lr5tuPp2a6SuE3d5PD9LdhwEK/p0hpjPM2vTfzQKbIi2AF3nv7zd3WzM6XBYkB09MhyoYQU3l0UHzzeaPLEReKrU9CCdPLFy9pjAsmcEkoqpZtNm3fkNK1Uejk0SgjADx7YTWEI0pblIpIsFeqOMDQ1JJIF9T35DygglgAFTZ1bgY16fJjDO3hmvfxVscMZrDr8tA/YGtH/Qrwh04gObgAGgID0+tUDK86lSDX2S+XCMBh2/A8qtLUIro/i6jRBIoVuAch6QocbaGbCGEDu8jhb0yvhb0QHiD9rajb9jYCWfN2d9TCH6nWUnpR2Cf0QluN/FjK68qp9QNCbtz/Hfz44ebGd2w/5ZP7uzxuVSptGkzGGP4O8vzF1VbHJOdF0AP13K/JRURk0qUQRBkTmtbn7N0WvvLrCfGXkdq7XUPPQX18Q3NQfGrbkiPYWSOQrcd2UR0naHEWSPU4VKhezSz6lCWLxMzC8s4+9xvjE85jHtq1ouxgB1riBmJIJ0IO7MGadqjoo2TCTMksMJR+4CETS+NMpJDU1DAHt6KLsTgJth4lhsSXpNNI5bn1U/hbd7vv2EO5OyOV77FZU4V7sZ6v+iAy1k85UeccWirD1rmjtvBag/tYtxlAwcxymqfrBKw5KfURrVlKu8z8Ij7Kax63War7hP4u56zEdHv0zjijxa8XMYYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	++iVMDGCoypQq82yFdeh3KKXt44R7IZRKDiAKZ4obQVlHcPYgnvCr7tMW/3VcDoHu4o+bcwH+2GgESO1lljc8qLHWtp9UAes1R9XAOBMw3sZtXfb+lcQiBee9goEdn4cugcjCtsPoIeNKt/rQ8HkeKxV0NPHYO4Km82ZEUeAb7HrvEJhiXUsbkwKULE421GquT8wFBTNauXFHtI4WOv77YDCcLFnazJb3SOjI0MDxlZ0Vwd2+PUwSoftAVvttcQ40y88Z5y2+SU1lTS2PA9pbBjFrpG1vBnA/zaXB1tQ7MdqWbyqjXDXihj7XTrspF0/TmQlCvCFTGkkVoYsZPMiUH+rsnRkux8o3JFfIF5ZqqKDTOl0kI+6H8+1ZDZRihiL86DXsVLLFzhCVueEGNXARo2a/bKKaYiNb/4/0hTHCDHtRylUew/EDFP+8XoIbr+Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 02:20:01.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2772ef-47dd-41d0-724e-08de8ade2f5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190
X-purgate-ID: tlsNG-d62444/1774491609-8F6EEDF3-A896B100/0/0
X-purgate-type: clean
X-purgate-size: 654
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,stew.dk:email,dornerworks.com:email]
X-Rspamd-Queue-Id: 97D9E32E537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's more convenient for me.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccc25a0e55dc..1ac61da59afd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -248,7 +248,7 @@ F:	xen/common/argo.c
 
 ARINC653 SCHEDULER
 M:	Nathan Studer <nathan.studer@dornerworks.com>
-M:	Stewart Hildebrand <stewart@stew.dk>
+M:	Stewart Hildebrand <stewart.hildebrand@amd.com>
 S:	Supported
 L:	xen-devel@dornerworks.com
 F:	xen/common/sched/arinc653.c

base-commit: 5ebd4dd14118e4eb24f1d409a7ca3773f77e7e41
-- 
2.53.0


