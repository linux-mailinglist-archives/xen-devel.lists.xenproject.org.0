Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73A9BBDB7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 20:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830111.1245032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t82PN-0004FC-V5; Mon, 04 Nov 2024 19:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830111.1245032; Mon, 04 Nov 2024 19:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t82PN-0004D0-S2; Mon, 04 Nov 2024 19:06:37 +0000
Received: by outflank-mailman (input) for mailman id 830111;
 Mon, 04 Nov 2024 19:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwMG=R7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t82PM-0004Cu-KL
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 19:06:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2406::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a9e993-9adf-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 20:06:27 +0100 (CET)
Received: from SN1PR12CA0052.namprd12.prod.outlook.com (2603:10b6:802:20::23)
 by MN6PR12MB8471.namprd12.prod.outlook.com (2603:10b6:208:473::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 19:06:18 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::5b) by SN1PR12CA0052.outlook.office365.com
 (2603:10b6:802:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.25 via Frontend
 Transport; Mon, 4 Nov 2024 19:06:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 19:06:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 13:06:16 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 4 Nov 2024 13:06:15 -0600
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
X-Inumbo-ID: e3a9e993-9adf-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNjo6NjA5IiwiaGVsbyI6Ik5BTTAyLVNOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImUzYTllOTkzLTlhZGYtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzQ3MTg3LjI0ODk3Mywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpp3CKHXTz/pdaS/6ObygeiErcrYci5KJBRhnmT/s4fVM35l+S+6RCu03kP3rX9mHxMjloko6JRMuIWZoq+2whsuTlI8NW+I3g0iIvRbqFDSpNlxxi8akfaPXxMrfMxyVC4e0YkO85xq93s0zxMDYdU+MP4aHy4LeKvS7yB6TCBAEHHs9r8ZKKsUuIOgxu88KZgL+HUQCNd39odV8X7IVNUTeoy6x4bR/JhLcIdXKUjwToOMhVoOmcSo3V0eIxfM31OWb4PPjD1a72jBsf1grvA8wKSzFhRWGfnXfOB1xjRcdHZ1C4jT8VgbqrTHq6RYhgQPhdK0stbaB1Zu5EyPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsaeceIIctxjNjYJrC6gnvRwndeQc6hOIJ+p92ZUoyI=;
 b=X+sT8LnfUp7kRvniMKvGyhmR4OJOp6NHsc14EOJiJPgWLsJDmriKgI4p9aV/kA7YkfzSvRp3g0BDPFgH/6h6XaH2B0xJ2D0d93z9aesbpT1JcDW2Ity2UtpthHzriXjj8CFm7q0QPwEGjHNwwLdbRmh5aC7hoQcWT0+gdVTAmguMpChRj48279yrcPosNTKhi7hgJzVMQLMMp9I8BdB3cmq9tSJf2OB8gwKVHwcS/gwXZht+ZfbdfMwnfMU4mG47MTpdT2qdbKNFIV0RaWw85lQX8nV64CcArrmNGQ4Iso6VDhy0q8I8y1NxPY3PJSq+ZxnBMnxGG9SFatkjNSp2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsaeceIIctxjNjYJrC6gnvRwndeQc6hOIJ+p92ZUoyI=;
 b=TLaeOBNN8vaqIRkaJPnkMOE8QoECdxdYEZumDPQC6ykLDhZs5GO5jjZUj1hW8OGJit+TA64w6vc+mZTuucyDBc4U2okcnnpxMoxvN3ppaoRWG6TW9nNNgwVawTct7JB8ywKqdNLmy1SlxKoqi6RbGy7DaEqCcS3ccMnIMxEaMgE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH] docs: fusa: Add requirements for mapping domain address to machine address
Date: Mon, 4 Nov 2024 19:06:08 +0000
Message-ID: <20241104190608.3036159-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|MN6PR12MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8070a9b5-ac05-43c0-6233-08dcfd03c2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cLCcomHAxbu5yVyxeYSm/46w8ZMlfbXGcmYMYA4XEtzBs5MLbvVQQgTp1kvg?=
 =?us-ascii?Q?y7cl/5+cgrLzto/n0cauXJC+ybkPK1qmy0XmFT+95IT06GuDnKvkPTJadMlw?=
 =?us-ascii?Q?4GwR0GxrNwy/KTZa7QWmfHxqILHwL29ZA29G4DBMCa4PYAecGW6MhOhAs9iP?=
 =?us-ascii?Q?nvrie9Ll8Tp//IZUohq/NEH9vP7IPotSOV36sUyjhGeGLHou04DYduxGwa4s?=
 =?us-ascii?Q?vvfeqkAW5GXT6NppmWHacQEP2ZMIjGWczqE8SuNu9PbYWTLwfzZhJSouVvDT?=
 =?us-ascii?Q?tayos6zvDtDUtEM/h33R2W6b82IGA+/krRtuUukf/cBkVPzXhkHTQaj+13y0?=
 =?us-ascii?Q?C1dWDWjEilcDE4hvzdNPpHnuHedxQka5+JdzS0xtImkth8eMNUygimkXYZLt?=
 =?us-ascii?Q?MlS5eU3kC8WO9nCpUSXgBQcjtQUN5ietSdRTq5WJ54k6qSX2LGaXveO18inZ?=
 =?us-ascii?Q?WwKOGUcY8Hh9lsgZCbNXXPlNVuy4lVE0df5R7r6nVg2D1oYasHBcnd+FBrU8?=
 =?us-ascii?Q?vzxixy6U587596R0ybEsD2Ko7O/tNSYp7kDuz9kfSyFHjQvYJW9r3ZSO8MOg?=
 =?us-ascii?Q?bF6oy1X0Be7hF5VWP4t5kXPm4lv8Ppw1QtyBuf6/yAeJo3NG1JGVgtl6NqmZ?=
 =?us-ascii?Q?JfZ0uHDk/rj5ce/kr3fiel/tIyoAc6Szk4nmIk9kbqNHwx1quxmvMpID+i2f?=
 =?us-ascii?Q?TkM4WXfAb5TuaXlkqSZJrCGqkNDxxRQTCAFhPS4LCrKZNjsrFY8sFf8zS8b2?=
 =?us-ascii?Q?Rc63mXV09xOdxs17BlgY1i8ALL1J2lH6+C3SBbw2m7Hp7KRXKPEMV7O/Jd/B?=
 =?us-ascii?Q?8mloEf/AnDqRPNMPbBYd/Z9+Iil1xsbt40tr/2KSnclxg8FFhv1ZLpINaHVk?=
 =?us-ascii?Q?sg02rbw5wKg31L9pGxwrPO4G1z2b/+u1T1g4oYvmDjhWsuQdPPmjc3SYHTH7?=
 =?us-ascii?Q?LjrKbTvLFjxblqXtE0EFmUW+tphI/M+ak9DsEW2cysi/GoVvmyF0MqRRkyL0?=
 =?us-ascii?Q?4GGi1DqDu7GL8VDP4Eoasu2jls7DgnYktOuE7WNmuP+Fr0t/UMVc+YMeTyvV?=
 =?us-ascii?Q?yikDyC512V8VdUSwj2svW3c0kBM0zMU5oOXkIOIHa1Wui5o/2B0aGt/W+ZuQ?=
 =?us-ascii?Q?VieJnDFuRmx8Uf/kBo3yb81pcVy1UVmvkGMlDtQRTe5TGtJT48ZCJRWdhZn4?=
 =?us-ascii?Q?6H4GY1aXB5gY2PTP23wTk6zbpD63BkcrnA+hCrLeEWNCANEq8wREMKZc90Wa?=
 =?us-ascii?Q?htLAZ87nbgPFK417c0pI4EqyRMUgbPvYpGqHzt/UqJdNP5MGhqqV68VOAqpR?=
 =?us-ascii?Q?jentLWlrXuhtM1qXPL+RZ82d3lUdRqOvtYpEJa6KJidS5Xcw6shF5bqKkgOQ?=
 =?us-ascii?Q?vEmSRfXwaomAdBqe3OaHiKTu/NrXrPcXzbptohExknpiX+vrcw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:06:17.0487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8070a9b5-ac05-43c0-6233-08dcfd03c2a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8471

The following are the requirements written mapping :-
domain virtual address to machine address
intermediate physical address to machine address

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../design-reqs/arm64/domain_buffer_copy.rst  | 172 ++++++++++++++++++
 docs/fusa/reqs/market-reqs/reqs.rst           |  30 +++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  40 +++-
 3 files changed, 240 insertions(+), 2 deletions(-)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst b/docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst
new file mode 100644
index 0000000000..67a70a35c4
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/domain_buffer_copy.rst
@@ -0,0 +1,172 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Translate domain address to machine address
+-------------------------------------------
+
+`XenSwdgn~arm64_translate_domain_addr_to_machine_addr~1`
+
+Description:
+Xen shall translate a domain address to machine address using Address
+Translation Stage 1+2 Non-Secure Kernel Read/Write registers.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~translate_domain_va_to_ma~1`
+
+Get machine address
+-------------------
+
+`XenSwdgn~arm64_get_machine_addr~1`
+
+Description:
+Xen shall be able to get the machine address for a domain by reading
+the physical address register.
+
+Rationale:
+
+Comments:
+It should return the fault information if the translation has failed.
+
+Covers:
+ - `XenProd~translate_domain_va_to_ma~1`
+ - `XenProd~access_check_fetch_page~1`
+
+Translate domain address to intermediate physical address
+---------------------------------------------------------
+
+`XenSwdgn~arm64_translate_domain_addr_to_ipa~1`
+
+Description:
+Xen shall translate a domain address to intermediate physical address using
+Address Translation Stage 1 Non-Secure Kernel Read/Write registers.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Set domain address as intermediate physical address
+---------------------------------------------------
+
+`XenSwdgn~arm64_set_ipa_eq_gva~1`
+
+Description:
+Xen shall set domain virtual address as intermediate physical address when EL1
+MMU is disabled.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Walk the domain's stage 1 page tables to translate 4KB domain address to IPA
+----------------------------------------------------------------------------
+
+`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr0~1`
+
+Description:
+Xen shall walk the stage 1 page tables to translate domain address to
+intermediate physical address for 4KB page granularity using TTBR0
+for intermediate physical address size = 48 bits.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Walk the domain's stage 1 page tables to translate 16KB domain address to IPA
+-----------------------------------------------------------------------------
+
+`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbbr0~1`
+
+Description:
+Xen shall walk the stage 1 page tables to translate domain address to
+intermediate physical address for 16KB page granularity using TTBR0 for
+intermediate physical address size = 48 bits.
+
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Walk the domain's stage 1 page tables to translate 64KB domain address to IPA
+-----------------------------------------------------------------------------
+
+`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr0~1`
+
+Description:
+Xen shall walk the stage 1 page tables to translate domain address to
+intermediate physical address for 64KB page granularity using TTBR0 for
+intermediate physical address size = 48 bits.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Walk the domain's stage 1 page tables to translate 4KB domain address to IPA
+----------------------------------------------------------------------------
+
+`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr1~1`
+
+Description:
+Xen shall walk the stage 1 page tables to translate domain address to
+intermediate physical address for 4KB page granularity using TTBR1 for
+intermediate physical address size = 48 bits.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Walk the domain's stage 1 page tables to translate 16KB domain address to IPA
+-----------------------------------------------------------------------------
+
+`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbbr1~1`
+
+Description:
+Xen shall walk the stage 1 page tables to translate domain address to
+intermediate physical address for 16KB page granularity using TTBR1 for
+intermediate physical address size = 48 bits.
+
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
+Walk the domain's stage 1 page tables to translate 64KB domain address to IPA
+-----------------------------------------------------------------------------
+
+`XenSwdgn~arm64_walk_stage1_page_table_4KB_gva_ipa_ttbr1~1`
+
+Description:
+Xen shall walk the stage 1 page tables to translate domain address to
+intermediate physical address for 64KB page granularity using TTBR1 for
+intermediate physical address size = 48 bits.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~access_check_fetch_page~1`
+
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index ca020f9a33..9b6852d746 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -60,5 +60,35 @@ Rationale:
 
 Comments:
 
+Needs:
+ - XenProd
+
+Copy buffer to domain
+---------------------
+
+`XenMkt~copy_buffer_to_domain~1`
+
+Description:
+Xen shall support copying a buffer to a domain.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Copy buffer from domain
+-----------------------
+
+`XenMkt~copy_buffer_from_domain~1`
+
+Description:
+Xen shall support copying a buffer from a domain.
+
+Rationale:
+
+Comments:
+
 Needs:
  - XenProd
\ No newline at end of file
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
index 0453dbb862..e2ab5ea43e 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -53,10 +53,46 @@ Rationale:
 
 Comments:
 
+Covers:
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+Translate domain virtual address to machine address
+---------------------------------------------------
+
+`XenProd~translate_domain_va_to_ma~1`
+
+Description:
+Xen shall support translating domain's virtual address to machine address.
+
 Rationale:
 
+Comments:
+
 Covers:
- - `XenMkt~static_vm_definition~1`
+ - `XenMkt~copy_buffer_from_domain~1`
+ - `XenMkt~copy_buffer_to_domain~1`
 
 Needs:
- - XenSwdgn
\ No newline at end of file
+ - XenSwdgn
+
+Access check and fetch page from domain
+---------------------------------------
+
+`XenProd~access_check_fetch_page~1`
+
+Description:
+Xen shall support access check and fetching page from a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~copy_buffer_from_domain~1`
+ - `XenMkt~copy_buffer_to_domain~1`
+
+Needs:
+ - XenSwdgn
-- 
2.25.1


