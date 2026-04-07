Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEL1JNbd1GnzyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:35:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BED3ACEB9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274859.1560843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3ll-00006Z-JM; Tue, 07 Apr 2026 10:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274859.1560843; Tue, 07 Apr 2026 10:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3ll-0008VP-G1; Tue, 07 Apr 2026 10:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1274859;
 Tue, 07 Apr 2026 10:34:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wA3lk-0008Ua-9L
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:34:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3lj-003scJ-LH
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:34:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d4ddba-2eae-0a2a0a5409dd-0a2a4508d7e0-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:34:51 +0200
Received: from [40.107.208.23]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d4ddc9-fab6-0a2a45080019-286bd0177e63-4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:34:50 +0200
Received: from BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::10)
 by DM4PR12MB6398.namprd12.prod.outlook.com (2603:10b6:8:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:34:45 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::7a) by BLAP220CA0005.outlook.office365.com
 (2603:10b6:208:32c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 10:34:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 10:34:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 7 Apr
 2026 05:34:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Apr
 2026 05:34:44 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 7 Apr 2026 05:34:43 -0500
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
 b=mTHUU4hgpNv43oTMmGQpoEem9sORjHUatH9ZtawaPM0dL+c8ieetnRBQ8a+WrLZYGF8AK9yYNgFhvaPKShSnNv3apwj/PdQsV5oEr3IIXkAnqPvzSSM5o9j8DroXFqzFyrq87/3Izaei/y2edjt57qtuqL3FKMM721g3fQX/bSe/GJZyAWvj5p+4Ye9/FDON/RPe5CylUjRKeag1+3ZQVcJslj8M5aQejs1Xvez9T2TXhqbA5Y0/d502CYs21O40KBO0eejclB7f6Sz/Ei/QVM2Xmz2nn9ePLoXUdR8dxrfbIp9VHJ/9Ei9Sjmf9v5QIS2pBJ81V2q/uJ1L8sdQH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSwn/eZd22mkj92Lxkd7s8YIYQ6Q3aCLzhHR4QqHess=;
 b=An4o+z4kI/l7sv+mBi8Xxt5xDEFMx6bmsbvMb8nIiJbLg9lzT+hzN0bIkm5tfronTJq3X2c/HV1k4lU5E311B+rk3yHag+z4SGays5s4IthmE2Zn65/NboujllGn8gscoF+/YbYAIYRHFd/3OLp8N8zCqcycEafLMQHcwXSDB7tT83ATRy2UJlI4kfkTT7zMHQE/kdGTFGxXJpoB1wOxlwVdTZdb6KTS5AYc4y8Ua0w+0O8Qy9xDr5uZzIVc5CbQhItRr8Tq52GeLZInr9f5PjzzGogKuUjLBsJFEIq5iP89kfIHG779WXKm4yoMv7k4VAOYjmY/Cr3tJsxoiCxiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSwn/eZd22mkj92Lxkd7s8YIYQ6Q3aCLzhHR4QqHess=;
 b=1mjmYP0OKB7qftzqiclgK2TT3Iyz89Fn0pPhoWaOtdovTxLDlqgL5EdJLSmoKNLZl6lLq7LCMFDLaRm8noozGJIMFohkqW4w6+HS4BF63het53TpUg2Rg6DlH0N1aqYWmXYw602s3nbKy/RpCrfcWiMtqkVMhn5iR70hYqjTahE=
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
Subject: [PATCH 2/2] iommu/arm: ipmmu-vmsa: Fix variable shadowing
Date: Tue, 7 Apr 2026 12:34:33 +0200
Message-ID: <20260407103434.90838-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407103434.90838-1-michal.orzel@amd.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DM4PR12MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d4ad18-a010-4583-496f-08de9491492c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0SWErfz8ZB7oFhnH7++AZKjW6MMPL0SZiFPvvN2tynAuxZ5N9N6owEB6NplcF7eGCGOsYPOGTYBVnEPZhdfFGUsXu1Hi6by7dKfe8n8Qu95BEAXrdfJrRsaXMgTXan0Hk/PZXrKe6AT1tnTG7f+gMD9b2f/XxqCs9Ceoz8zHkgdw/uY6nkpG5eVpS0OS1d1/MIqMympkLVO7Kat6xEq/QltAfryzkqzCvVyypenOUPk+1+PGjF4f7iEj/pUanOH2uycQ/28DwbXxBYQ67ilWaXwWvKXvnJycadqeKPeWq9DI0WOZPXLYlA24sBvwuWRDahPz9Qf+bt7F38qkXQelxKZffySH00ob+aPmQ+dlw29q/14NV87eT0nRQ1J6RApdEfUQKR+JmjQ0jZShNXKIkprrlU5HVYj5ohWBJjvKXJcQ5/y5yGPV9Q8Nhb/zI+/xB043h34ySwf+aXY9znGGfn71bUOi27VX4v6AMBJj7RNWXPSGK8f5rajgbvkrSkM02aHkmy9VHjnaktYj3Afm73gHfC5BXeB/8CPhtJLqtG3fjM43vQpBnvq3uXT3K3Tou0pMGyQJo35eO0fDwbw0Jwga9Hr8GA8VPGZmGSeVI6k5ZtUqH3HOqD1DmyXwIOV9D+cryF1rJzaaus5ZCIVqFH+1VNfjFjZZ5Geydr+pNmMJA4ycXIZpGL40nZDttVI7+eXPUj1NKHhqLJTy8bafeeHUpLxTBcRwzuY2w/CDO4d43huWr7IlZeQo1v0OkJ1qWERc88JUtKz7/2F2Dvhl7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5x2pRPTXNjPQ3Rz4vGotTWguqoK+S8+grTjwH1kUZuGS3q2ItoUGzJk0RcTkjOJhNGwIaJzMXzG1AF5AWBcxbXi9t6c6XkW+ud9MDHJm9J+iOGzXXXOsdrgRULVAuM6j0OUk9vcPc5CClDYRW73JX0mfu/fhYFNPNYuf+eaBUbl/fA3xVQLSZJGSo1LeSijCdDqBNaBt7MLxFAtZqGXFr7+fCSlxdv2J+HChhpi2yC8LwkVNwPH91UnBDYSQ+3CwCLImFqoBk5CHnYmeHlq6pitzGAhDEzJTGkcVFWuZQVaTyKZy7qdYeRFSB5vget3QpKEyurKB4bROGZQjxm43FgTZr17b5Fm8x+ZRzmve0163Ut8iQUgDa9D/OvMSk3TvEZpkK1Wd3C6z7fRazzxyFX+03/sDYouxtJWklDIwqID836ZrlcJJBIJ0eM5IMlD+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:34:45.1513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d4ad18-a010-4583-496f-08de9491492c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6398
X-purgate-ID: tlsNG-c1860d/1775558091-76B4C497-64DD0121/0/0
X-purgate-type: clean
X-purgate-size: 1679
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 30BED3ACEB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename 'pdev' to 'pci_dev' in the dev_print_pci() macro to avoid
shadowing local 'pdev' variables at call sites.

Remove the unused 'ret' declaration from ipmmu_assign_device() where
the function-scope 'ret' is sufficient.

This fixes MISRA C R5.3.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ea9fa9ddf3ce..fa9ab9cb1330 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -65,8 +65,8 @@
         printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
     else                                                                \
     {                                                                   \
-        struct pci_dev *pdev = dev_to_pci((dev));                       \
-        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+        struct pci_dev *pci_dev = dev_to_pci((dev));                       \
+        printk(lvl "ipmmu: %pp: " fmt, &pci_dev->sbdf, ## __VA_ARGS__);     \
     }                                                                   \
 })
 #endif
@@ -1171,8 +1171,6 @@ static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
         /* dom_io is used as a sentinel for quarantined devices */
         if ( d == dom_io )
         {
-            int ret;
-
             /*
              * Try to de-assign: do not return error if it was already
              * de-assigned.
-- 
2.43.0


