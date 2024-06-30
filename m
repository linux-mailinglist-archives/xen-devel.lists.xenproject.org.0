Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4491D19D
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751113.1158998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtl8-00081K-G6; Sun, 30 Jun 2024 12:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751113.1158998; Sun, 30 Jun 2024 12:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtl8-0007zH-Cr; Sun, 30 Jun 2024 12:34:22 +0000
Received: by outflank-mailman (input) for mailman id 751113;
 Sun, 30 Jun 2024 12:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtl6-0007C1-BU
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:20 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:2408::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f206f8-36dd-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:34:19 +0200 (CEST)
Received: from CH2PR12CA0009.namprd12.prod.outlook.com (2603:10b6:610:57::19)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:34:16 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::da) by CH2PR12CA0009.outlook.office365.com
 (2603:10b6:610:57::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:16 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:12 -0500
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
X-Inumbo-ID: 11f206f8-36dd-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeVzv2a9fkuyk4eCiOwC+o3inoS0eAZXnfyCudghe7bf03yut4ihpt7gBfAfYKNOhPLBIxqajbQu5c3EX5MLsuocOLCPOmY1qIagmVthc7HiBZaP/ELS5HNFV6bYFLnqThvIJYxFQT+8jCrzqEpinXXc3btLu7MrEt1rwRmhAPt2fJYY61f9ZgZYdhSf9ueoeNfgz0iEACQ6DhEoMhgBVNbTsqKyYto7O3xUNGL3Ze/YxxKYJQ/W6uAhfEMIFZqfBSBgMykM0tuNL0e1xBdy9N+MgnNc6VLYdDCwWZfn3h2tNKaP/x4jTFk46//jIU+k04mOjS576/eSjI2sc1TUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsDPYZMENW0quBHEP8n8tBZRRuMhFLhlhmL4mlxj/b0=;
 b=i0Ebfhq/c+NgRanvD6XTNGj3ZzrLu1hrCFeQXIIwM5vxNN/MS/UO4atJlZjtT4s+8qRJlxnkDVYsMsXR8EkSk6DupV0bLTkydtE4pNdyiP61J/T2V246USV7YLb/P2kTG/Mlrezo1nj/8/bi+5bxNTq2LelIeY4fiSwdJzodP+vtlXHNpfT2ZIxlDu5SSuXDuYQsum9x7hlL/mrc7K9p56qffVhrkbV1atWYcHawlyuMzQ6tsz0dkylod9wKyr4GzmoxHwBUH7akHgRiGZx/uIo28CTRAVa/vXL14nr1x/c9rFuC7BUT4K7ceuvVunvuaKMClQNGObo1IEVR0HjpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsDPYZMENW0quBHEP8n8tBZRRuMhFLhlhmL4mlxj/b0=;
 b=ZyAWxDb6A9OSVq43RvbozgKczWl+JQW3fIY335dwsl1inp2+hlo8A7JAUR9NE8GXzL3QYknVpoY1lhrX21NEzyoflMLVKYw8qzFfCfuT/YaRaoD/vaJfi2RW3FP8ueH2h9KFrhK1p40QHta6v40SzeyaUiM+HzbU3tOytH3Ru2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v11 4/8] x86/physdev: Return pirq that irq was already mapped to
Date: Sun, 30 Jun 2024 20:33:40 +0800
Message-ID: <20240630123344.20623-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630123344.20623-1-Jiqian.Chen@amd.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c217c3-f908-46d3-4e41-08dc9900f4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l5Op+CbciuEBTladK1oGuz9S+58AFY1DfsX9l4qxGMSidQGQwxF+NaetSjRM?=
 =?us-ascii?Q?qkl+jq3cCGk/DQ/BzLralbMlvad01idJv7v8wc5HRM1YII51kfEpbd4M/H1x?=
 =?us-ascii?Q?pno4xLs7yhBPi2je26z0yKq4z+9AYUNF9aAhoBykfIoaHShjkvQbOJcFl21X?=
 =?us-ascii?Q?t/cAKhfpblyHzNDeJW7LAzgmhUOoLX1JSHLuVYGB6RKn4LfdfDjWz6a1BeMH?=
 =?us-ascii?Q?pQfmbba7SQY5Cs95f9lPqI8/SiIFwBBSWye7o3iU0zkCwkwSrTxXnaLucOal?=
 =?us-ascii?Q?6Flf713AKYgTBEXr781+52kxVgfSMgLsQxoepN1f9X415W4ROc/vXPyW4i8R?=
 =?us-ascii?Q?MX45nRJW+pJCfnMBrSjkAj2h/iOLMQktA1RzKRQkzWpmvg2uERTZZbMHh4pH?=
 =?us-ascii?Q?CGkdMnqXpABdh5JqDyAWuwZDqWb8OB66ccTCgDQTeyqeohLe1/aMIYEvxtg6?=
 =?us-ascii?Q?DSzDa4Vn7BVriVtsEIA8FDqmLtlTUpxZdfa6yEJpcAc+FnS1YsI6OabAFMSO?=
 =?us-ascii?Q?TnKgVPdpjiB875rTdWuqdKbOwVCHrA3VpT9tAVRICGdRX/D/SaicspVtcrXB?=
 =?us-ascii?Q?x4UyNcBcntYsIxuktSblLzVaCBg83s49p6fhjs4oTsfYfb6OWms940q6woV1?=
 =?us-ascii?Q?zyfrCZqKv574taIe45UufMpfPhwky978hZA0LRIXDWRLdHeAKoxuShBzMMBq?=
 =?us-ascii?Q?hsu8qFh6+0xi1psDs+5W+jrQr7/HbLNyRSvwtZAaocN4W+rsxjUT+2AxWePY?=
 =?us-ascii?Q?y7EHBSN/FWAFyTtgL7Tk6qC3XCWB7hYulD2nKmaHvGc7W/GqEBfuuGvvojfN?=
 =?us-ascii?Q?2qWgbVDn6Z+D28UgSEu0jDwrHeWW8D5moABRIskpFN+xeL05/rlt+kJUv+3G?=
 =?us-ascii?Q?h5m6LGB5+lIPkc6SMhSjuAzivZGsR/Vp/Mr6gMIE8yp02Xg51SamSMLGqy+Y?=
 =?us-ascii?Q?N13ug/3zhr4T5Cyma58WhBBlEYaOGOCLTaovii3pPs+WHx2o9xbMS6V0Wsja?=
 =?us-ascii?Q?X8q/MJAbMeKWY7zd1wnGVRmgtXGV9mVYdCs9l2jQC7J0n+eqjGV8ROfJ2AqV?=
 =?us-ascii?Q?vwILRvFW6qqtHSgs7OImG9giJJ9H3wP7HXL1//hMni62wLEwou4H0lXH4h07?=
 =?us-ascii?Q?8NfsZ4cZ1LB0orjvNiw54bpSNi4hxaenAJcjWJcaV4j9UkO3DXfAP7wC2XsE?=
 =?us-ascii?Q?xFrFombpDRhqkxwUMZUfMf/EFeIw/MBqvH7CbZaCsj7pt4YN/oID/RRAlOV1?=
 =?us-ascii?Q?rcEky/KPBsOrK1GpJooE8+xr8M6cpjK1/Rgu0Xb7FkYZ8rvbUNOZ80ck+h+A?=
 =?us-ascii?Q?WkmLD4L8xRldpjKf62ZbG8UpnH0g1N5jWOcn/dP7lZtAbgdwPqJLFmxYT/Ka?=
 =?us-ascii?Q?LRNgFZUACGHm5zJJG4jx6yE6zpQxj1V/C4W8zppZVHyDFIcuz1dUeCE6Ke3l?=
 =?us-ascii?Q?qnwHnzKQjjGVK90oNHIu5Up59NgP8u30?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:16.4935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c217c3-f908-46d3-4e41-08dc9900f4ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073

allocate_pirq is to allocate a pirq for a irq, and it supports to
allocate a free pirq(pirq parameter is <0) or a specific pirq (pirq
parameter is > 0).

For current code, it has four usecases.

First, pirq>0 and current_pirq>0, (current_pirq means if irq already
has a mapped pirq), if pirq==current_pirq means the irq already has
mapped to the pirq expected by the caller, it successes, if
pirq!=current_pirq means the pirq expected by the caller has been
mapped into other irq, it fails.

Second, pirq>0 and current_pirq<0, it means pirq expected by the
caller has not been allocated to any irqs, so it can be allocated to
caller, it successes.

Third, pirq<0 and current_pirq<0, it means caller want to allocate a
free pirq for irq and irq has no mapped pirq, it successes.

Fourth, pirq<0 and current_pirq>0, it means caller want to allocate
a free pirq for irq but irq has a mapped pirq, then it returns the
negative pirq, so it fails.

The problem is in Fourth, since the irq has a mapped pirq(current_pirq),
and the caller doesn't want to allocate a specified pirq to the irq, so
the current_pirq should be returned directly in this case, indicating
that the allocation is successful. That can help caller to success when
caller just want to allocate a free pirq but doesn't know if the irq
already has a mapped pirq or not.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 9a611c79e024..5ccca1646eb1 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2897,6 +2897,8 @@ static int allocate_pirq(struct domain *d, int index, int pirq, int irq,
                     d->domain_id, index, pirq, current_pirq);
             if ( current_pirq < 0 )
                 return -EBUSY;
+            else
+                return current_pirq;
         }
         else if ( type == MAP_PIRQ_TYPE_MULTI_MSI )
         {
-- 
2.34.1


