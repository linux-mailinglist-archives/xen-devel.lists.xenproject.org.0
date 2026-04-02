Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMLcD1shzmnElAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 09:57:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A302138582C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 09:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271211.1559456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8CvI-0007GI-5z; Thu, 02 Apr 2026 07:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271211.1559456; Thu, 02 Apr 2026 07:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8CvI-0007DF-2X; Thu, 02 Apr 2026 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1271211;
 Thu, 02 Apr 2026 07:57:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w8CvG-0007D9-Jm
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 07:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8CvF-00E31A-WE
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:57:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ce2147-e002-0a2a0a5209dd-0a2a4504c31c-18
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 09:57:01 +0200
Received: from [40.93.195.63]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ce214b-bb33-0a2a45040019-285dc33f491f-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 09:57:01 +0200
Received: from CH5P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::11)
 by CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 07:56:56 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::5f) by CH5P223CA0010.outlook.office365.com
 (2603:10b6:610:1f3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 07:56:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 07:56:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 02:56:55 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 2 Apr 2026 02:56:54 -0500
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
 b=lbkW3URMXAJXcFq6QnW15PpK2YwbPGg/wGv6FKqq2DeuwUhvjtPkO2JwsMvna0CllQ/8CSK2im2ncPOHBPDa6nrf1/adVViRl4yee1OjGr6lpjwrvwgcBSl6WgJ/B4/hb/oNRqNTen53ej9WsGR46p9Uok0rdUerY+TjQCpE400Q8UVGoqo3+L+ywHy3ZV6cN6l2+QSqhsp7IW92oQSRVKOsoIweLjpi+b8qyw9+YpfryHg5CEYhNaBhb/SuWcS+/QmSFr9dL1Q0uGGwbwYmmmluso8dOwAcf4eXyXVds8id7/TcUDCAhEF1bBSVy8Ce/uZiAZ5XDGpoD7peP5u7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN+Hj3NXD8BbcBpU/hqwCcd8XXUb5DDshpgmWT1oq/I=;
 b=Zey3PFosMWCxID+zcIo2izhdAjs/nIOV+tR5I/LJjTsqTo+4sA47y7S7nT+WRmspRWHxnDTeocJMwj75/nIUhB7zzDbKZi+rn1vs1Ba2wrUyjF+aHFRx1aJJMM059IKSvW5bxs20eUgprHiYaLH+V/g3kCn+ShshbkPca7OIU7A7f8VnvQZTE8i0nPc4osCQg6G+mcg0dyHRklE4wI2wreGYek5Msmq/MjYBpQgWM3vJ0UhMM1lessWG+3NvXRr5/zgIM7fXFdcMFFstA67SGaI42uRn9s6OhsdGj6tzaSSLGmybLo+xW/9CcnDHh6mdINCy/VgRcIBgTjWyqKj2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN+Hj3NXD8BbcBpU/hqwCcd8XXUb5DDshpgmWT1oq/I=;
 b=EAvyY1sZFEPGNfpcF1NUZCa0nzjH2jMe6GmsLkaVqd0hPPzyqgHqnwW7yxkwg2PyLrVM3W5XOzNHmh+M1sQCQ8sJH/AiKMpP3VzNOLBcj8vAuk321xfBXAWr+zYsn0Rrr/7mSFOms9i4OaPRfJRaYqv7BzWxVKIMRWt7I3AR9N8=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: mpu: Fix ioremap_attr region size and return value
Date: Thu, 2 Apr 2026 09:56:45 +0200
Message-ID: <20260402075645.52583-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CH3PR12MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a4d0f9-acb1-4137-9f08-08de908d694e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+elA5Ll5Kz+jfZhU/4XwElU7f/a66YcPTwJHCVpBPjtRwVdffpn7AOhwhVxX8O7VG+gtca7TnRg1finSwQaMDLIz1cjQ3Orpwk6gbGfIujCl/OEzTErjtqsiUKGW5OMv35zgbzy+p6lRRpu2vIkiwpqli/wXxaIzzhFA90GkHLBl2Myaam8nnu1sKack8eNdZ1dok3aKICNVQDE8irqG0vhYKav9P9PCiWAoo5waQUkcLstdN+bk0Aw2Yv4JXfXJigj8ZZCwuCg9TaKxduQKAfVSBDpVUqxp4PbA+ffXdqcci1vgce/GSjX183fsML8tjVPjhrKVQmEP5E0tqbYACMTdNgemaAi0M7mHENjd6m2BS6vkXdhL6FTr4KgnHefwj4wV0MonCF9u0uk3VaFuszPgqhxtagQxU8au6mfRMQtHOgyP4QM1mM/WjfaL7SJ1vz5TVvzBUXDaV0BRlROIPVBHB/hMhm+WHRzzw4xnrG+6Uot0u7ErJXBypQnx3596i/37k+PbKupIYYdDULSWZBZJyGJxun6xHq2SK4AUvwiGGnOuOZJOA4FSe/FYoxlF/XgqLr5xXFHOm8p9y4YiMtdwoCUeDG+ZwJZONV3EYYhsjFGjLr6sff0Bb6vHJk0TOWHebiMmC5A4QKOsx41makzB63kO8EYY6Hla+0vLfsk1K7wShrr6fn4ZiupSGcfjMzAlz3tS3PJBpWqr8qxsDtSRtY6IBYeS2WYiHDzE7XEzujseDWiAE2lH8UAv0LdejAnpVd0ktti8TKJbTW3rIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Iyr20FpUSgXtvjbbbrb6yY9pinKqgCdGsXmnW4CuwpH/rk3IjxhciWZCI2pJWqTlDnsOfD6xCXP3zh1ocay/lyIcwIwfj00tCOScYjb5LxL1OcqN6e2yFlrKmciMXZUDUsEJz4fbDFuHrp/OzPCQf9p5xgLgZHwiIyxwqq3aAFYkljsH+nKQtl/l2TJprLGITQrCKTeagpHu0fFXurkP/CDysPtwVuHfupf+lYVItSfrCJmKednZvs1FUh6kfJEBoTzFT2IdGKXzewak3MbtM47lHsVYch+hRyud/qknc5eafcTdHX8PofHkRtiqo9pS4P3NEW7DiVySDJ6ZK/TFUKBpZMwhL/DNrjIZkpkhoyOXIcm+SEiDEubtUx1ZQ/5M2eP6pcBZGssEmvzyevo8XYOmyB3G3yjRejPJplhfrttRgEgbjy7r7jAMFLuFYTWl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:56:56.4185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a4d0f9-acb1-4137-9f08-08de908d694e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909
X-purgate-ID: tlsNG-ebf023/1775116621-3253B51B-0596B155/0/0
X-purgate-type: clean
X-purgate-size: 1635
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A302138582C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ioremap_attr() computes end_pg as round_pgup(start_pg + len), but
start_pg has already had the sub-page offset stripped by round_pgdown().
When start is not page-aligned, the sub-page offset is lost and the
resulting MPU protection region can be one page too small, leaving the
tail of the requested range covered by something else.

Additionally, the function returns maddr_to_virt(start_pg) — the
page-aligned base dropping the sub-page offset that callers (e.g. ioremap
of an unaligned MMIO base) depend on to reach the correct register block.

Fix end_pg to use the original start so the sub-page tail is included
in the rounding, and return the original start address to preserve the
offset, matching the behaviour of other ioremap implementations.

Fixes: efeec4c70798 ("arm/mpu: Implement ioremap_attr for MPU")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/mpu/mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 6b3b0b06e95d..aff88bd3a9c1 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -596,13 +596,13 @@ void free_init_memory(void)
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
 {
     paddr_t start_pg = round_pgdown(start);
-    paddr_t end_pg = round_pgup(start_pg + len);
+    paddr_t end_pg = round_pgup(start + len);
 
     if ( xen_mpumap_update(start_pg, end_pg, flags) )
         return NULL;
 
     /* Mapped or already mapped */
-    return maddr_to_virt(start_pg);
+    return maddr_to_virt(start);
 }
 
 /*
-- 
2.43.0


