Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5EE9C098E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831914.1247293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t943I-0006s1-K0; Thu, 07 Nov 2024 15:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831914.1247293; Thu, 07 Nov 2024 15:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t943I-0006pk-HP; Thu, 07 Nov 2024 15:04:04 +0000
Received: by outflank-mailman (input) for mailman id 831914;
 Thu, 07 Nov 2024 15:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shok=SC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t943H-0006pa-7a
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:04:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2417::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83d1351e-9d19-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:03:59 +0100 (CET)
Received: from MW4PR03CA0292.namprd03.prod.outlook.com (2603:10b6:303:b5::27)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 15:03:54 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::c9) by MW4PR03CA0292.outlook.office365.com
 (2603:10b6:303:b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 15:03:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 15:03:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 09:03:51 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Nov 2024 09:03:50 -0600
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
X-Inumbo-ID: 83d1351e-9d19-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjI2IiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjgzZDEzNTFlLTlkMTktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkxODM5LjU5Njc1Mywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUcDJmZVfe7vmdYm2xU33cYFhdT1xYJePBiqEnNZD+dFOgypazvNzXUsfJuDZwrurmOIFPww3J7JlvrKi/GbRiaOTzmEb/ktStgkJH8MsAczBaCg1T5vrWkVndQlItsNl50dDeznJYOMxCQKEMOF3h+Dgn7IKecToYOgaltMkcWjnOvP6B6X9QBNG/W3Z7cgs9IzhKO14GfYJRU1KqBUxLGDPBxM4hj07YLyobM/kzQb2CeYvmrcJIrHgusnVFzrwHte/FikGAFTCr6lSHu2tIcDIylYeQ6FhP9XCUy6RTFoNbuaoHjArKH9XN2++JRzvbFN4rnHlfQkUHRgN8xXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBiv2GOIhg1R37a1jCV8SfIWyCn/z+gfjg0RbWL1A0g=;
 b=VXkX0txiPetjdgt2RvHWozcEKYyg1LCXRxk0ISbtOVdYCCvR4oyC5zRVMSJ9juJsWZB0rVxJUNHqNw+RwDNPNC/4pqNHQ70j6zS071j2DzUozwGqaPEzIZOLBCe/Fe4aeF+yJ/A4M9Gmgjr9z8e76vj5OF/vPOvtL0TMOkQjJZIm/7iTgcLW0XDL8v60y+x0AZ5t3wV3Zv2WpjIAQtqCFJDm+D2t1RZL8YWZKfK/lnYEUqMiDSHMY+5v1u9xvWBCYPvs24s4q/YPn7amdcsQeeroH2sbQQ7ZLz2qC/e2I/34eAPCk3KvI2LzD0oo2Q/Z9mLOo+1z1QF0RIGke7pDug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBiv2GOIhg1R37a1jCV8SfIWyCn/z+gfjg0RbWL1A0g=;
 b=d546+mU+nRkg4lERrG/iF+VKaIhPMKdEq4pc5KhZDuMNLCVjVa/A/CYQTGQ68n7PZJGtxEI+/250I33KRGp/TgqzD4naDJRPrmaDLyKdOrpgj8bN2ZoSqsdV2iGXExh9m8ViCuoJlIzL/EPSAQEp1ApxdkRLnVdIBppqW59I2Ro=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/3] Enable early bootup of AArch64 MPU systems
Date: Thu, 7 Nov 2024 15:03:27 +0000
Message-ID: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2ca8d4-e87a-41b8-8a4c-08dcff3d64fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OhAvOWvcPjNt2QR8jB/0Jdm4FNw+uqrqGrrnGdSvO9wPDYVaQJv81COcWT9h?=
 =?us-ascii?Q?eTG769/wo0PxVdqviMLStZDyXiXdY1aN79eB+QVaeePS1NjeLLI60R0CAlni?=
 =?us-ascii?Q?+CcptO3818atXbvGXnHjocygY5dRKqrby8h2ZlKYQ78GIeDo71dHvX10joun?=
 =?us-ascii?Q?RFZ+7t+0cUOJJ0UAsv5TwWR2NLngpsvm+Pn8o0Z6KNAt1tqmswr3MQSTbCNz?=
 =?us-ascii?Q?KZ0UoAS4upNjX1YoRc6ampFUDNndvMbac/uPJieH1661B7FWM64L3GmxmI5Y?=
 =?us-ascii?Q?Xs7qLdWRrWImrKWRDtzrK4kvTOFqjvjmctn7nj/MAxBBgCTMP+EGTD2T3yx0?=
 =?us-ascii?Q?ysAcJ4jSgSBqODk0fl+1+qBVQ09UaW0coxIYgW6sZ65RGHLmj2F1yH5levQ0?=
 =?us-ascii?Q?EBkKu5KyiYKO76RJi5i0ypTmMMzpeKXzT7bSV0ngl2fMu0Ue166q+ZQQgj/o?=
 =?us-ascii?Q?JJVSQFEJFmU6WOy2oe1Bzwk4FLz7yYWi4tTjH9jKpfmb5jhm49vZb22WiUHa?=
 =?us-ascii?Q?YOl3dV7V6URnctCvK9eb3C5ZB0JsOz3j31aZPVhbpgru1u21I3WuQ7sdfCc2?=
 =?us-ascii?Q?hd+gt5URFFIFOiw1V456bP72wO5jhn8nM1J8xiDrjRpUiKvWmBU/56/RBw5B?=
 =?us-ascii?Q?ZU6j8yMC8SsLMMCgXTv7fQRclxcqQMMZbbHZGbU0oaDJWBrBKBqPl3S+vlts?=
 =?us-ascii?Q?YkU1WtiNRpoQBKHgGR0ZLEyVvUR5oDznIm5hnLk+mvTJw+b4kkKcDq7N5Ljg?=
 =?us-ascii?Q?7YZiOzvUzu2eu2kYFisoRwgrvXVqFha9Yp8RpdxUehp2KhEXX2cUrlHBFlvg?=
 =?us-ascii?Q?wrtWcCVy11o2OtYaru+1ph/0QwBcioMU8yMd/Y9rjXFwPEHSZi0ZFSeVtfo3?=
 =?us-ascii?Q?s6PRYqZKPvYUL175QFipZmMh+zfR5A2ucW8ydNKlJcjtxxDwV8nZdrqfPbGU?=
 =?us-ascii?Q?H3JK0q6JAubtwNekif2ByvXPbW6F13EkHpYXgP3ElI0weANVekRAVoEMbJvE?=
 =?us-ascii?Q?YaYsCd5Rf7uEH0xilPyatIo7DjOAmFfJXzDhYu42zPuvRBRC8nLrxTMJ7Vu6?=
 =?us-ascii?Q?i1fyEbVx7fpu5s4f/gB+X4hUiFbkgIJ1Nmlc/dLD/mj1iTCkUsvoUZSvwPQf?=
 =?us-ascii?Q?bYy3Y4eyb3JOMMxt4WHXUgYpfrU8VCX8WKGmIeEp+rRzQiRNej0ZCpjnl19p?=
 =?us-ascii?Q?Bu5qTcx4Z8+vgrTpDFrEIPM83Jyuz5CdatI4QwlEmgxy/H1WIrzy2ouBKtp4?=
 =?us-ascii?Q?8e8m9GG0li/dRVlbONmCAUIbvTwn/SGNdJvMdkjt6GjyYBXrphQg10j0z/Xn?=
 =?us-ascii?Q?xnW3PY7njwzKmnHjORtuIAZicnx3s0ZYRg1Xk0l3KO4WSeeCei7My9laXgPY?=
 =?us-ascii?Q?rRwmmnDCKpBdqIBEWiqz+0cnz1WF78X+9D2OlNO1/MPEw4cCTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:03:53.0499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2ca8d4-e87a-41b8-8a4c-08dcff3d64fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301

We have enabled early booting of R82.

Changes from v2 :-
1. Added a new patch "xen/arm: Skip initializing the BSS section when it is empty".
2. Split "xen/arm: mpu: Create boot-time MPU protection regions" into 2 patches.

Changes from v3 :-
1. Removed some of the R-b as the patches have been modified. 

Changes from v4 :-
1. First 3 patches have been committed. Last 3 patches have been rebased.

Ayan Kumar Halder (3):
  xen/arm: mpu: Create boot-time MPU protection regions
  xen/arm: mpu: Enable MPU
  xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm

 xen/arch/Kconfig                     |   2 +
 xen/arch/arm/arch.mk                 |   4 +
 xen/arch/arm/arm64/mpu/Makefile      |   1 +
 xen/arch/arm/arm64/mpu/head.S        | 159 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h |  25 +++++
 xen/arch/arm/include/asm/mm.h        |   2 +-
 xen/arch/arm/smp.c                   |  11 ++
 xen/arch/arm/xen.lds.S               |   1 +
 8 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

-- 
2.25.1


