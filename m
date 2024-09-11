Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF8974AF0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796221.1205715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHNo-00039I-Tu; Wed, 11 Sep 2024 07:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796221.1205715; Wed, 11 Sep 2024 07:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHNo-00037Z-RG; Wed, 11 Sep 2024 07:03:20 +0000
Received: by outflank-mailman (input) for mailman id 796221;
 Wed, 11 Sep 2024 07:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZHC4=QJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1soHNn-00037N-Hm
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 07:03:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2414::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c0a6a1-700b-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 09:03:13 +0200 (CEST)
Received: from BYAPR08CA0013.namprd08.prod.outlook.com (2603:10b6:a03:100::26)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 07:03:10 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::d0) by BYAPR08CA0013.outlook.office365.com
 (2603:10b6:a03:100::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 07:03:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 07:03:08 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 01:59:41 -0500
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
X-Inumbo-ID: e8c0a6a1-700b-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw9yWwzgvGPQiRfm+cqTuM/q6MM7hWSoKn1X2QxeNEPsk8sjs2Zf2/YrHwTm6As/3xcNRPiA/zQNDBc/aGJWuR7mXKd0/AtQEmbSX8fobrqbd2OlgYnKZH62keZcA6SAdNHvc1S0gkgbYQuKsrO5eaf6/ueHxy3baJzshwfXgFAF5kcRMzKj8My0H3S3IPUhtCXvVCUSlp4VW2Vh5JayJSwa7vFKS+8co9vaw2dWQT8Mn6wb0IWYtjh0mTH9c7mREd69LvmedYIS8wxz3j+L+rhHIdkRrarER/hU2CmVv1DoY1mY7Ae9VCwR+GY/sYh3+A/Ak+6V8wBOUofaS9ULOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LyMWisE45rtTq2wmQ4fKSroUZtRm/mTJsj+/at84VU=;
 b=WcQVJtGN1cjUHOEK5TTBIcgfzMeO7ZgtgUP6GsJL9Mzrgs25CjSEJTTMs5+FsRrBLGBUeOxOjuqp+msFmfFnbjimpx1lwCDt8Dfhm/t/9bQfRzn1ICHPbHHUYClE2dAs1bllA5R2rTx546SNkdWZkhy/RwQ7tHwsWzMwfgoCIOTuE8qOUIOCV/Spui9+nJdSXktcmsVjhNBZCsurHI6Di/Vpn1MSG6w8PTFsiDI8utR6qPyvivWhJoIs2Db1P5ZXzx64C3VB2pEAZVZyl8WSC7EV/oT5x3yGn/AmTxdkVc021BIdpx3SI+jeQwObqO8uwPqhmCLtUii6n2WOuenzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LyMWisE45rtTq2wmQ4fKSroUZtRm/mTJsj+/at84VU=;
 b=SCz3gKjLZBYPtZBOz7fKT/qYogVSabJayt0Gd6Ke7WGcRgkWY4C6YOCsMKr2wIDKHW0ST5IvR6h0m+MLADLph5xH+XHj2ZFsYVYcXjzY2O/REe85vKW4nwKiMFpbhNj/e8lGakzLjf6pKAA6qkOzJ6kIpfI9MPg7YAXReW+++L8=
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
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v15 1/4] x86/hvm: allow {,un}map_pirq hypercalls unconditionally
Date: Wed, 11 Sep 2024 14:58:29 +0800
Message-ID: <20240911065832.1591273-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d1b09d-dadb-4b6b-af3e-08dcd22fcb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QcAW4S4ZcC95ov5WLP6BB0J1GqGVy+0n3gc9czFUQDMP36KkLSqcOJLFRwow?=
 =?us-ascii?Q?8Z/biPXGtXFkChOx9S2Ql/uI5uKQs15CMT5Hv1pLne03Bvzk65e7OFQzE6E8?=
 =?us-ascii?Q?LBCsKMbEj0FxGm66X4KCQBtUK7dMQslq2IxSVtCoPKXwVFXmyZQMEqrAa1t6?=
 =?us-ascii?Q?slqsU3W7cF09KgCvZJ8MSUqLcBnw/xq2NkMValZtdDkWtzrtySIBEWtfnXk2?=
 =?us-ascii?Q?pd/ZvOszA6yVrirtopd7SgMqb//mYHW2q51ZZDPmrpVLqYG6mONdlKXXxCfX?=
 =?us-ascii?Q?tQj4duG6mNnZwjsHmbIdORNXoPZ0BWHEnX7AOBZoMVLyVL7eX+6atGZTsgnb?=
 =?us-ascii?Q?2MzyivXZ8uz8C+dxrFLy8CiPf8MejVvxBlILH1jqyGkh4tB1aVMAbsnOkJsd?=
 =?us-ascii?Q?0tAcEptRvCjhySzKAcMZrBlE6a+g6tuUt1/FruE5XX/Ux4jMad6L6Mq4vpcW?=
 =?us-ascii?Q?qAVlkCaN9DmyBSOea8/v52+aAtWx8Qut98uJtGyEpF9hZqXVG0SnqJfFWvZs?=
 =?us-ascii?Q?yzYBuKROouVIokHeCMvUmigi8a+HSNHnWLNUEPPWAQD12Dz6MDkgP6OxOW/A?=
 =?us-ascii?Q?ivWLzEDSggcrbv4XEWVfEplcx8d6QmJwnlmvRp8o4OkZZYZcRiNbAIDLuCrW?=
 =?us-ascii?Q?ZM5RjmP8esbwWa32LVRgzFFq3jvleGkDssS5rNYEhmUH23LkFVqa4oLHEmkr?=
 =?us-ascii?Q?UoFKC064OdI4Ikm3SUiT/F7zbqEa6yjgbAwKmyK4aOVUPy9VVVKbzQgi3H49?=
 =?us-ascii?Q?VtUz0kldlQn6e4YssPluoMqiK3bhf0Eh8C66vn6rT33flUsfO31XA4BXFj7+?=
 =?us-ascii?Q?/IvsxGP2fpNM11vARBolRdZ6bAI4y+Ze0QnhMrXm1TF236maaMqO+bwvG+ZT?=
 =?us-ascii?Q?j1EoYCMwWX2C2lkiEkWtuUz5CeMY+WiOlic7gjzGBYaz9o4X0y/60QHMvqzQ?=
 =?us-ascii?Q?4YXhlmIH/fFLegSgXRSreeJ1AO+dysajOMR592b2eTVTqBykVJNv5f4M9n3K?=
 =?us-ascii?Q?nb8NDsQjJ22ImNQBXyYdaK+06l+lcFU+zy/KYhLw+wX7CCF9/RCkewo5q08U?=
 =?us-ascii?Q?1d2zT9SKpTM0lh9kVkTT/iJYOYbbrv953xuDRnlmnd1MStVMhjOk1Y3WmScc?=
 =?us-ascii?Q?E8nG0GCUhsZ/JjIHYMMwF3UX4O9buQnMNxXWDwtnkT91vBKpXuZsue2VXbiT?=
 =?us-ascii?Q?mAfcQ3jp15hd8Ar3n4f/gloRI1TzeqUrsoLmfV1Us9D8ykfIqUK7RYxcJtcY?=
 =?us-ascii?Q?jNEcWkyV+2KIkhPxEnkX2Z2r0vVFrlDMKHhpKh9o7+nchPwxl+5KHEGYL2ME?=
 =?us-ascii?Q?4d4ARqATiSFVRMj91Hbn+EJk1hp4K0QBOUyadivz9G/Jc7SPsqNFAug+HU29?=
 =?us-ascii?Q?uBiCzc3NyfvUDolHIzRiFF8DX+InSY1XezWWljrw6jeNJ+H3oPDkZ18j1x+T?=
 =?us-ascii?Q?W96E9k7xT0zAmQuIJ0UtUdIOF5ccR1Fb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:03:08.7663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d1b09d-dadb-4b6b-af3e-08dcd22fcb33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350

The current hypercall interfaces to manage and assign interrupts to
domains is mostly based in using pIRQs as handlers.  Such pIRQ values
are abstract domain-specific references to interrupts.

Classic HVM domains can have access to {,un}map_pirq hypercalls if the
domain is allowed to route physical interrupts over event channels.
That's however a different interface, limited to only mapping
interrupts to itself. PVH domains on the other hand never had access
to the interface, as PVH domains are not allowed to route interrupts
over event channels.

In order to allow setting up PCI passthrough from a PVH domain it
needs access to the {,un}map_pirq hypercalls so interrupts can be
assigned a pIRQ handler that can then be used by further hypercalls to
bind the interrupt to a domain.

Note that the {,un}map_pirq hypercalls end up calling helpers that are
already used against a PVH domain in order to setup interrupts for the
hardware domain when running in PVH mode.  physdev_map_pirq() will
call allocate_and_map_{gsi,msi}_pirq() which is already used by the
vIO-APIC or the vPCI code respectively.  So the exposed code paths are
not new when targeting a PVH domain, but rather previous callers are
not hypercall but emulation based.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
v14->v15 changes:
Change to use the commit message wrote by Roger.

v13->v14 changes:
Modified the commit message.

v12->v13 changes:
Removed the PHYSDEVOP_(un)map_pirq restriction check for pvh domU and added a corresponding description in the commit message.

v11->v12 changes:
Avoid using return, set error code instead when (un)map is not allowed.

v10->v11 changes:
Delete the judgment of "d==currd", so that we can prevent physdev_(un)map_pirq from being executed when domU has no pirq, instead of just preventing self-mapping.
And modify the description of the commit message accordingly.

v9->v10 changes:
Indent the comments above PHYSDEVOP_map_pirq according to the code style.

v8->v9 changes:
Add a comment above PHYSDEVOP_map_pirq to describe why need this hypercall.
Change "!is_pv_domain(d)" to "is_hvm_domain(d)", and "map.domid == DOMID_SELF" to "d == current->domian".

v7->v8 changes:
Add the domid check(domid == DOMID_SELF) to prevent self map when guest doesn't use pirq.
That check was missed in the previous version.

v6->v7 changes:
Nothing.

v5->v6 changes:
Nothing.

v4->v5 changes:
Move the check of self map_pirq to physdev.c, and change to check if the caller has PIRQ flag, and just break for PHYSDEVOP_(un)map_pirq in hvm_physdev_op.

v3->v4 changes:
add check to prevent PVH self map.

v2->v3 changes:
Du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need to support self mapping.
---
 xen/arch/x86/hvm/hypercall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index f023f7879e24..81883c8d4f60 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


