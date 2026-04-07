Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFQ7Kdfd1GnzyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:35:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4773ACEC1
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274860.1560852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3ln-0000LK-VH; Tue, 07 Apr 2026 10:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274860.1560852; Tue, 07 Apr 2026 10:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3ln-0000Ji-Qt; Tue, 07 Apr 2026 10:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1274860;
 Tue, 07 Apr 2026 10:34:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wA3lm-0000Df-8M
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:34:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3ll-003scJ-KD
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:34:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d4ddcc-2eae-0a2a0a5409dd-0a2a4507c6e0-4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:34:53 +0200
Received: from [40.107.208.19]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d4ddca-ba2d-0a2a45070019-286bd0134b52-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:34:52 +0200
Received: from BLAP220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::14)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 10:34:44 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::cd) by BLAP220CA0009.outlook.office365.com
 (2603:10b6:208:32c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 10:34:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 10:34:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Apr
 2026 05:34:43 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 7 Apr 2026 05:34:41 -0500
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
 b=KuebTZT8WYBrPrnpJZh3SOhjxXCNsG7rj7k0a9P5c66FXtsaJWZkNVf9fiZTicextd9Trak22fiKbwPdtIwLtUOcF1QZOJPxyLSELu2FwL0DompOXzRinD//Z4KOpUm+BvPDn+DBUwmqWz/AR7foaxzLdYrKnUlMsylAp9eVwYs+auNs4TUWjrPJ3vgiLl5PvvPiO61u4ve+8wVkA1BuFuuTQfBgONeTPSVnAoiAbc33EpIknt7Z1xbfq2hFmOB0DvQfgY76J1svcMgpsWht00qdEnY1ljKAmBzvtG0jd1FYa6qOw5XiXbQIbYQ0kF3gOLpiEnDb2J55OTditKh4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FsyXc/HkQPSBh7FT68V2jh2g5O0eVPGIt38pfYk7xc=;
 b=L4t2+z50RWLlDtdbKbejWAFz49mVbph23myo8hTpTDr/36XmAEOJNPbc3kV9pu0AST53AqCRAOa7Zl9Hvt7RjEJUNWccsYIwhrcKCcUWC0vx+md2KZagA8mXaDGqv5y2Ad/lzPI+RZDe7iAorLZo1/qf/IrTF1XjeLZeLHgFZrebhMgOdhB259vbcTdHtLvSabbJ1ObI4D3iXs37Y41mkQe62dgtO/ZCANGYEUI5yg5u/qP6JeHoeuUuY/2BT6LPRQiau8N1FmzC7At9vjvJDBMBTVgqCPRYwyiwO+8KLw8mdhxK6RTs3IVrmf2Ps5zWyFdasqyMtAFA2z1VMA8O3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FsyXc/HkQPSBh7FT68V2jh2g5O0eVPGIt38pfYk7xc=;
 b=uGVyJkkFpjyy5pDkZxTZhqarRrJMkGM7AEaRCFzhqTQKI43MuKGXa83Sx6eo94oMZTyWtWRX0tcdSGUGBeGHDqr3IwsJKWZAHvg5/a1uFuUFjL+qX9jJ+618DtpE5HpTVMXIhoCw9wsZ+68NPm4EvVq2PWiwOBCj5xuLgaGkER8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Rahul
 Singh" <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] iommu/arm: smmu: Fix variable shadowing
Date: Tue, 7 Apr 2026 12:34:32 +0200
Message-ID: <20260407103434.90838-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407103434.90838-1-michal.orzel@amd.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c59e368-66fa-4f3b-960b-08de94914840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qwDsbJwn3Nac1a6PpgDdC0Y0t14DfM9fDQ9OTIB7qJKT4VHLP4POJvOwQbHKokqTeda7bf4dK4/J9dAVI6HnjFsojK43z8XgH6ADTgrreJxPfW5KUVYTLO7E1bjeE3x5pMpLp4wtz5OEFxb9OPSp0KrDLwqas50gQXLUMvRLT+McJw8XnVxI/fmWFd5sE8gGMejEfGtAVfQqTI49qYuy/ApdGYKtYTcFVMJ3jCNyNq70q7iTEnSflb5PNX+pBXZMfFTlf7YTpecurbUSdLHhGGyZ9Dgt/Jx/CR2T7Q37FORUMuvrvxAxHCLmkMLTbC6OhYBd4frcVSjx6zXYD6s8uQEuxdsmsb0TMSg06bIyWH2ioaSWQ5kYihpBoJp4QG3+jh4zyXpaLVAdTdy3L9TytgNa2hlHNPx4fLd7s1efODDBiBOxB6Gst4IwmcbLLIiI2TJhPegy4stPBGdB8goG6qirbDfmDJ3P3gUSzcyS0X7AHDEfAX3UMqD1Tqs1xqKEAetGUV1Idd94/T1QpO6oCG2pGRvNWnrBhzVsaHUG+bUya5xos/Tka0vrh4hGDr1FMgREjcWY8HkRL9ymFqoyCD3TQWuuuRKpbnZD+p2ophTzTFTYm5DJjwxGECeEwnnuGxx//BaSYrYB/rMqmhfqZ4MeUKnzapQuz2oGji1sFM4wo6EXyumAaxmTBGEglI2vGFsZdgBDbf95y1IjDW5kk0P09boeDNIH3jy3vxcsMC9jXoM66wWyC5qpW9/uGQF28BYeQn6EXxoJaTrnofdurQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o5i2fVkrKIFq0qCSZOb7topoNTc25SVAThatCbo9/jAet/04sGxWWHAtT6rFUpbEpShmIrJOUXTcK2V8Ws1ppOaiUIR56cfwpGD0k6Oaq7cD7pGq7oKAomDqtHWE+YJS5zavZhmG4c+l2WC+fp2m1HjF7zS9ydhRKNOljVOFh7LuSYKRwdUJD58XtzATZpixu8Y1kGjz4mqoX9b0bbtGhylTG95XZ1sPfrEoiTsie2q0hT8TubYLrhkm0whWPXcG5EVSnqWwc2GdfbCts5mRIlV6xYGI5TkEwoss3LN+z/ABpeQybjWehhUX3Dc4oN6nTohepfUiFXhzEzSemxH5UT1Muc5oPx9FL9X/fY6JNWLmjiFuVsnfF+NM55ut3ia3nItcabPAw9q+9XnjNx9fkve03tGfh1sd7ZWBKfU7RUmDmN5cV6hCpri5GokTP1Nv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:34:43.6124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c59e368-66fa-4f3b-960b-08de94914840
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684
X-purgate-ID: tlsNG-ef75cf/1775558092-1294941E-461F5AE5/0/0
X-purgate-type: clean
X-purgate-size: 2052
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 5D4773ACEC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename 'pdev' to 'pci_dev' in the dev_print_pci() macro to avoid
shadowing local 'pdev' variables at call sites.

Remove the unused 'ret' declaration from arm_smmu_dt_add_device_generic()
where the function-scope 'ret' is sufficient.

Fix shadowing of 'domain' in arm_smmu_assign_dev() by removing the
inner-scope redeclaration, using the function-scope variable instead.

This fixes MISRA C R5.3.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/smmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb80..d63c9015510e 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -130,8 +130,8 @@ typedef enum irqreturn irqreturn_t;
         printk(lvl "smmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
     else                                                                \
     {                                                                   \
-        struct pci_dev *pdev = dev_to_pci((dev));                       \
-        printk(lvl "smmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+        struct pci_dev *pci_dev = dev_to_pci((dev));                    \
+        printk(lvl "smmu: %pp: " fmt, &pci_dev->sbdf, ## __VA_ARGS__);  \
     }                                                                   \
 })
 #endif
@@ -927,7 +927,6 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 	if ( dev_is_pci(dev) )
 	{
 		struct pci_dev *pdev = dev_to_pci(dev);
-		int ret;
 
 		/* Ignore calls for phantom functions */
 		if ( devfn != pdev->devfn )
@@ -2788,7 +2787,7 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 		/* dom_io is used as a sentinel for quarantined devices */
 		if ( d == dom_io )
 		{
-			struct iommu_domain *domain = dev_iommu_domain(dev);
+			domain = dev_iommu_domain(dev);
 			if ( !iommu_quarantine )
 				return 0;
 
-- 
2.43.0


