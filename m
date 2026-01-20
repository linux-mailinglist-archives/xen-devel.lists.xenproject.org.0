Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61305D3C433
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208563.1520720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8RF-0006bh-5n; Tue, 20 Jan 2026 09:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208563.1520720; Tue, 20 Jan 2026 09:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8RF-0006Yp-2k; Tue, 20 Jan 2026 09:54:17 +0000
Received: by outflank-mailman (input) for mailman id 1208563;
 Tue, 20 Jan 2026 09:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8RE-0006Yj-5X
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:54:16 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9fa09fc-f5e5-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:54:14 +0100 (CET)
Received: from PH8PR02CA0039.namprd02.prod.outlook.com (2603:10b6:510:2da::26)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:54:10 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:2da:cafe::7b) by PH8PR02CA0039.outlook.office365.com
 (2603:10b6:510:2da::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 09:54:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Tue, 20 Jan 2026 09:54:09 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:54:04 -0600
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
X-Inumbo-ID: f9fa09fc-f5e5-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/wkJMHnP+Fkb0e0iqE4EcWJ/cTDCDF5FTaePn09G7bcX7zOMxGOSpeGi1PKkcfS0Wm+Pn3T8yXpfCRtPW9holcuKATnHqSGmqRWSUd9I0k9pfpkQkkomMKfCE9IRdNQ9HyV1MD0CUq/CiEHm6Z0hl/1Fv2S7Ll6OUQqRLL9jsop69IET4clp5g6K90dRFeCll3bYfeHVW1ytMkhWalTezpR320ILkWk99AN3Pg7RkPAB89VFBLiAI2z3CRdksm9JOv29NETrs0kCR9ghb/d9ZvGg9F2T91rHjG7py0+ZzdMBZL17wOziccyYcZN3VOU/NXm9LSJ5zUVnUnnGmFp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuIeWzyGiCnRAm9Kg6QG1cEl7K4jzzok7IMZLtDUxEs=;
 b=Wh7rF8J0LRGXxcGfKBRj9r5nhlXSnAwdlZEaRjo8IIcuGBkLnBBBOq1kSdKSGYOjIhNQDB/czShAVSMtwkbEgqpqsgb1WDCSxiYkRVD3r8yYa6IMpS5deEV6sSXu4kAGWAaHJcHg6SG8SKMSbAQ2w4FK1d8EL0Gk+HB5y5lCNA9s7lnWgpNgq3GavKsBvHdyvmLcmMoC92UXcpyS89KCl03ZCAedbt/shKmHtIHnm3ucIT9oUQ2LCgLIcBQhzkkX44ovLNXV0naAKrwCmMrD+nH6umP2EHoJWwCQjN6DZm75OPfdR4qblHp30P7lyZdpjlDMcGorFK20jCI+utcIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuIeWzyGiCnRAm9Kg6QG1cEl7K4jzzok7IMZLtDUxEs=;
 b=XGCd6L7KUQrNEuyY8ctW47KP39S2QXwsZzOnTVP6D16Tpd5dOSpU319Idv0HcQpIFQtZz8vluL8G0+/Xrxxw+af0FrY/Wy9511fbvQCVePEO2MMPGuqRxn43CgmceLYIP0YzXbkTd23gXpoG76kLGHDJHzy4frSP3uOWPdJ7b5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86/svm: Add support for Bus Lock Threshold
Date: Tue, 20 Jan 2026 10:53:48 +0100
Message-ID: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: ab145094-6bd8-47af-eb4c-08de5809dba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GNdxnLScYsYsDwYBaRVy8z/kzd/Ltp/xnwK8CcQyLJVk0pIy1sa6S8whskqk?=
 =?us-ascii?Q?0oWzfE7VYVtA7uXtbGRAJE3KTFIFI7+A2aMewe9T89/t39v0+1/iVngUGNOE?=
 =?us-ascii?Q?gINjGNwHBrAkMyx+55sWPS4to0OnpPF6QkTOji14BpP1B4gv8dFbJ3lvxtLo?=
 =?us-ascii?Q?3EDZSxXCigwhfGf7e7BewtpAkMONPcJ0njbdY30SCVZrml4NLA/N9Y6IPHeg?=
 =?us-ascii?Q?cVD4iEbREoFWBmPx7dLEODOt4tmzzicdAC6bteXNKeQYXBUDVNANiQK7U6M3?=
 =?us-ascii?Q?S1jbCNUHOBPY6O+zyX9FA1JytwYPrahVJTB5dHir50mWI1YOYxtQ82vMuST2?=
 =?us-ascii?Q?5tmQIqzwzxLCKT1V2fofa8Kl07T28bZADEhQ6x/OBNZbwOgR+KQo4Bf2NWsE?=
 =?us-ascii?Q?0RMEfho1DQb5XBo+8unmXpUoERRHzJwct6C5w/mKfK0x09lDITf4xd8amxa0?=
 =?us-ascii?Q?wc1LTAenlYH20+sJZE+IwYEUM/r8jzWrZEuLgJ7jAm15RxTsZCypHqX6fgiD?=
 =?us-ascii?Q?g9JMPtw11U9xcIiHkfhI+r8068QZMylcM052FNYrHU0Y6nPWc/+uuPHSkmww?=
 =?us-ascii?Q?zQeWRKyfy/6gJbGql2Xet83nsJhimcWJ3Wn2frj6eOSDQ9516wEXfG7xfjIx?=
 =?us-ascii?Q?ouxL89hBJZ8eeHbPxtszdxLksQUwU5Tg1a7OMIy6Uf7yt47gFJ/R0JckXdyK?=
 =?us-ascii?Q?gbVK8OQvbXy6riExln+4OBJ0fb17Xjr08bkPRArsL3+bNz6fA4bhdE6HTeJr?=
 =?us-ascii?Q?/w+0tP2ydf/7WRKdGnhJXRJ96Q9n+HOGfBLs+9RbCByMuvd5G0Z7+J5E4WxH?=
 =?us-ascii?Q?1FduS6baTh5v3CbhHFFlM74a0HolgKwpBgMaTjFF/ooSFDNHQ3O8mRv2kywo?=
 =?us-ascii?Q?5tHInOrQXMwaOuQ30bFQBvPBJ1u1DzldWc5pN3cGVBtWU5ASdaVU3OZANUDs?=
 =?us-ascii?Q?cgTpqZmTbyfJWuZ8JE9yqW22BmY9U2z/G2i5M8gxgfXWLwvWADubqCqg9S+P?=
 =?us-ascii?Q?HOtsbSKhhbPGGGKnwYXtXkttIxWnfELER2yAB0D9Dq3m9obFARHIr4S6eNXb?=
 =?us-ascii?Q?dz/4fW4tMxMrRruwbGo08NtswsIj5fO8fuZbFb6g/170ti26QKw0L63e1CFI?=
 =?us-ascii?Q?OCqaMUkt86DNpRwKX3mA3UQikWcEC3RjBjtqh/SuE2cd3Twnl4K2EKPyfS6M?=
 =?us-ascii?Q?gvo5Kwi1dn0FO7kUjWIonpv7C4LZfeTYwhIM0Xl4dbC4akPZ6hov6ATjG+rW?=
 =?us-ascii?Q?B65ChcPEuRMYU04Mxg2xtKwwSHyQCR4pWHJIZAXC00gf2CPJhuxZ3XVu6zpO?=
 =?us-ascii?Q?ILiqZAHU64dZy3Mzmh2VUObxoPshKMoP1UjRVo+qu9+tUZprzR1eIj//h95k?=
 =?us-ascii?Q?AfzhTTI0rgpXHiATAYPu5PbyC4OAzplR4ymkfDDCdvJGjLHuVluVoxOZn+sk?=
 =?us-ascii?Q?1bObL4x+i5y6aNhYkQGLJtmWGF++HxIqgbuU+Q7XWcthyrYWQl+UXOzac3mK?=
 =?us-ascii?Q?p7tmaBUfDolp58HAzDLtpvVT56NhGD5QBrnW6AaNJzxCR4MC7zlvtKLnK/NE?=
 =?us-ascii?Q?maCfsQIk+/aoWidlDaL736bxkl0ebVcnf/NOKFBHzxIRYiKyqrBhS+EhJLLc?=
 =?us-ascii?Q?xS/DSTfAGXftMtreWu1F8vg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:54:09.5293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab145094-6bd8-47af-eb4c-08de5809dba3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929

Bus Locks are very costly and a VM left unchecked spamming instructions that
lock the memory bus (e.g: unaligned atomic CAS) makes system perf take a
nosedive. This patch is similar to BLD of VMX, but for SVM. It configures all
VMRUNs so they automatically exit at the first encounter of a buslock event,
effectively rate-limiting them.

Cheers,
Alejandro

Alejandro Vallejo (2):
  x86/svm: Add infrastructure for Bus Lock Threshold
  x86/svm: Intercept Bus Locks for HVM guests

 xen/arch/x86/hvm/svm/svm.c            |  5 +++++
 xen/arch/x86/hvm/svm/vmcb.c           |  6 ++++++
 xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
 xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h |  2 +-
 5 files changed, 27 insertions(+), 3 deletions(-)


base-commit: 7b3e1b4e848d34c9a5b6634009959a7b9dd42104
-- 
2.43.0


