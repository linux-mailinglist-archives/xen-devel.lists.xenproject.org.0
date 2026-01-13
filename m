Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CCD18AEA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201587.1517177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP1-0004dW-Ri; Tue, 13 Jan 2026 12:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201587.1517177; Tue, 13 Jan 2026 12:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdP1-0004c0-P7; Tue, 13 Jan 2026 12:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1201587;
 Tue, 13 Jan 2026 12:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfdP1-0004bu-12
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:21:39 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67fa6e01-f07a-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 13:21:37 +0100 (CET)
Received: from BL1PR13CA0398.namprd13.prod.outlook.com (2603:10b6:208:2c2::13)
 by SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:21:32 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::f5) by BL1PR13CA0398.outlook.office365.com
 (2603:10b6:208:2c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 12:21:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 12:21:32 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 06:21:29 -0600
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
X-Inumbo-ID: 67fa6e01-f07a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCZSdt+g+kk8uxu/+8pUhFO39A+9o+G0nyKFbsT7hxMKr8+4PPh1jYtyWB1QXQe272IHw2Zc3seK7GhWn7OT0NO9TS7fC9eGcko44SW0iRJqO58SqtHIyqiSV42Vn1XdphHSLcmQIVsVWak8fTIYyHZyJ/6tAOs9MLrFYDQCHOKKtJ/Toqk7QFgUZAGdnH6e7TU26Cd8co/xFsJJSLy9eVwQHJOP1d3FosKLM7ax8n/wV62+zitTKtn6RP6Oyuq7P8rmRsNuxVpTRjI9FURIiSOZ0H2e++dTNrjN8fldfoXymBZr3qjBW1Rd6fhL1jhZ2ydn12qYNI3CSYgwSERecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m1iPvZUmvo84mbHL/Cn+u0RykzSub1/cEsen6YwdAU=;
 b=vfeQcB7l6Azna4EVGFtAiSbgaygh4OMLElwrJXGDCiLkr0rOELKYeBx9SVWsvlt7GJ2kkvSEncFU7UBVKQln5Ymd8ezYgtGlor2d1ls8lUe402VKExvsxU/wRS6K8soPpxK7WALGVqHqfnm4K6fz9ymiBaFqJaNzBiCRy5gKWOXl7G+MtRtLq0PNqq2fjo4dlX0Fcym6TGPcvFbCnd2hwhnGcDjcv7bryvVkZdAtJug/nXQ2XWjqUZ9NLsmyiqvFkx+BNGgkg98kEqTEgZWBFTxhTJ2q0kmWq7Gw14smqXHIWZLft2vGD8J9YsGjko7B7ldvwvHq6aCEcXpUv0f5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m1iPvZUmvo84mbHL/Cn+u0RykzSub1/cEsen6YwdAU=;
 b=jisB1GYUHNT/SivInIsEt1L1zT/G3xcytHlbClIy5hfB79XmotP8Kfa0MIJ68IMfsJPlEmeRtTmvWybEYAk0RQ3kDbHIX+vKQLJRrHHYfR+NjuPF9MU+QMQET7x2q0I2tX1RPWyuS0msII8UXAexZ3jVVCb8HTyt9Qd2isvXpvE=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/4] Add Kconfig option to remove microcode loading support
Date: Tue, 13 Jan 2026 13:21:00 +0100
Message-ID: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c5f678-d020-4cd4-a60d-08de529e494a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kaVKAmd3DzcSu0dJlGmeHl2O/mNtzZ3Q+HMPJzLOJYZTtJv0dU3/NPHBGTn9?=
 =?us-ascii?Q?gtRndF0yqZXfS61vMunQuEzV6BdnTfuLunhifl/kASokJ90kUCIEWTKNV9gQ?=
 =?us-ascii?Q?llA+U2mhhF44QWK6GBK2PrtUvzPJxFj9AYnad0k8OzklKpyIc1v9N+r8Lkk+?=
 =?us-ascii?Q?KphzTjsh2VzvSxmqS6ZURmgIseDsIYW+QzWBcqNQiQvMSbb6fAadG2leGSRu?=
 =?us-ascii?Q?oSsNQh8xP6rhRHA7atxNT3FjGart72XTRgSu5Hez7SbZFDlYfhToIpWY/uuY?=
 =?us-ascii?Q?0W2w8arVLZ2MYO2Uv67NRyKEKqAE8K+yYJNkay5kvrh8PPpdj3Lkkfe3pO+Z?=
 =?us-ascii?Q?1xtr2GYtilaj6F8BA7norzvXPrs+qQZWgSZyRcsvbK76tTg/0gx1O7rKtF2e?=
 =?us-ascii?Q?oyb1akk4whgtyryvM2LuF2zP8/9w9dvU5t3DvMxqeibCYpAACmoBrJ0OO+Xr?=
 =?us-ascii?Q?6kozCppmAeHuqePXC2M/eG4DxnBHYMA3E3ELigKa2JqNvEZY2xcw3MDr0S/B?=
 =?us-ascii?Q?YxtAQY0Nno9+TOaHaYrxJ50OuWHqaYW2Y7uGfGUDoIBvy0J5bPihcAdAbbbJ?=
 =?us-ascii?Q?ZPIOKBOT5V+24nf1wkj0TuCCRFpqn9/E0rFaoWUdXsfVuUiB6VoF0AvkPUQn?=
 =?us-ascii?Q?xTqOT1+cV7D4E9mtmN8c67VkctmrPH5Z66WGXz+BCKXPZf5JA7aZXZB5K67f?=
 =?us-ascii?Q?E2jF2mdAfExsp1a31Pjx+55mWCYEk/Szg3ZCBSgOPhCus0rZmoU2rHcNXaFg?=
 =?us-ascii?Q?x45IpZBOabiz8dm8idCULoSn+XWp4bR8A4u6K5t8R9cL56XX81FatmXMe9FT?=
 =?us-ascii?Q?EyPP71ulyGQsIEBlgyJgf/7p9d+c5bROMlZdVO1CbasJs+vp7WY3IpujAUSv?=
 =?us-ascii?Q?aU7UzED9qYjBLHMWQyu9KDVUEUhSE8VNshPbBoDn54XJHYF5xyIrY4vRZdCw?=
 =?us-ascii?Q?e0/0QCpC7BQUiatMA173Jx8ZIHASv9rGJAlD+aL10qsHFkdQCo7b/utpPlzl?=
 =?us-ascii?Q?toGPDgJHNObS8qb6Bju2FdFqA2zrmIaZvAiunrv11FjZTMOZqdVDwZCCebmw?=
 =?us-ascii?Q?kgBxWHVOu3rWiC2wmLCuzy5qXvr/G8iYKEL1jXLnBSUm38jefyAL8ec2ZYvC?=
 =?us-ascii?Q?CRI0BVHRCfmyTNh1yhFAmxETvhi3TQxQeb30l2pWlD/6EaeCKBvrIG8bs7Hx?=
 =?us-ascii?Q?vMZ0+3qm0BDFB+5xRd1gX3OR+wMb/IwHobWxl1rK8rAJfiPw7cvVTIK/sD5E?=
 =?us-ascii?Q?vtzfvwqE34sloxQxiHGsFvME/PuImpBYUrD21hlDp9lo1wxoHRWKlIOdhqhj?=
 =?us-ascii?Q?cXXY65p3nv/+bW+cSATAuViWE1jMx7XaNSd/V8H9KtBD48KCFqhvmx/GE2Fi?=
 =?us-ascii?Q?lP23gQKtHgVjwY6UoQ8GUv978EAXdwvPYGHMhFWEzMhCTVUcQCB79m0+wWUH?=
 =?us-ascii?Q?Cl3S3SCvatSGeQfRv/fUlekuom8Ijnp2R/6XkuzAO5z+9v0eBxCt2BCB3eWs?=
 =?us-ascii?Q?sNIjPuuolOYTpPVhLAugF7whOsNrTzskgj0L7iJ30pab1ArG7hrpUYE3J9Jl?=
 =?us-ascii?Q?sm4Mj8Nrk1h+PiBOKAk5eVpFI7PbpKfM56G5dJle?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:21:32.0700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c5f678-d020-4cd4-a60d-08de529e494a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065

Hi,

One more day, one more revision. Same as v2 with feedback addressed.

v1: https://lore.kernel.org/xen-devel/20251112162219.226075-1-alejandro.garciavallejo@amd.com/
v2: https://lore.kernel.org/xen-devel/20260112150259.74535-1-alejandro.garciavallejo@amd.com/
pipeline (green):
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2260019646

Cheers,
Alejandro

Alejandro Vallejo (4):
  x86/ucode: Fix typo s/mitigiated/mitigated/
  x86/ucode: Rename UCODE_SCAN_DEFAULT to MICROCODE_SCAN_DEFAULT
  earlycpio: lib-ify earlycpio.c
  x86/ucode: Add Kconfig option to remove microcode loading

 automation/gitlab-ci/build.yaml        |  2 +-
 docs/admin-guide/microcode-loading.rst |  2 ++
 docs/misc/efi.pandoc                   |  2 ++
 docs/misc/xen-command-line.pandoc      |  4 ++--
 docs/misra/exclude-list.json           |  8 ++++----
 xen/arch/x86/Kconfig                   | 16 +++++++++++++++-
 xen/arch/x86/cpu/microcode/amd.c       | 22 ++++++++++++----------
 xen/arch/x86/cpu/microcode/core.c      | 17 +++++++++++++----
 xen/arch/x86/cpu/microcode/intel.c     | 11 +++++++----
 xen/arch/x86/cpu/microcode/private.h   |  2 ++
 xen/arch/x86/efi/efi-boot.h            |  3 ++-
 xen/arch/x86/platform_hypercall.c      | 22 +++++++++++++++-------
 xen/common/Makefile                    |  2 +-
 xen/lib/Makefile                       |  1 +
 xen/{common => lib}/earlycpio.c        |  0
 15 files changed, 79 insertions(+), 35 deletions(-)
 rename xen/{common => lib}/earlycpio.c (100%)


base-commit: a2a34d76643e49ccc949296c9a45888034e50b55
-- 
2.43.0


