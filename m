Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D45BB41A3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 15:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135862.1472810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jn4-00016v-O5; Thu, 02 Oct 2025 13:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135862.1472810; Thu, 02 Oct 2025 13:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jn4-00014A-JN; Thu, 02 Oct 2025 13:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1135862;
 Thu, 02 Oct 2025 13:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4Jn2-0000cT-Q4
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 13:56:12 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87a4f1a3-9f97-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 15:56:03 +0200 (CEST)
Received: from PH8PR15CA0012.namprd15.prod.outlook.com (2603:10b6:510:2d2::18)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 13:55:58 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::3f) by PH8PR15CA0012.outlook.office365.com
 (2603:10b6:510:2d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 13:55:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 13:55:57 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 06:55:55 -0700
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
X-Inumbo-ID: 87a4f1a3-9f97-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXYcxkBU4qIz9gnVeOMy+c5/PweCigCFR2//Ohe/BTv5dCyI1h+U/P5QJYyrB+tnFR9cTzmfFOrEPYFpSP1/WxgM05bbmk1jFEc5nGcRX8oOq5PxEHBcE/KnLa6lGRjVkU6Sm5ueHn9MtSSwY2Sj0k9f755+DiDDo+fGWXSPpd4LJB2+RnRDAJFjbIsb5cIFVqhWRn1QcaYAYVklP2GTxLFzx9drPuKLejnnGyLNqF1BAaTBSBe9Gx2RmiWD9sp07wD8LCHzfNEGN19kPZXxzv33CfBdJvMSe8TCuOQhLQpD34YQI/K45rCI0rCk9V2+hk0MyHfaqRdYrtGd9Q3qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZZjg8CLPgWKggZ2fiDjSjV35SJ4VIqrgwJM1we3E4k=;
 b=rZCqKuqp6jUrp9pebHoJq8Gn+EizQD+WYDbiP27eT4U7UN5ICvFtFXPG3rj7oShOL8YP6+MCF1yW86SS4hAWYn4XcWrqG0WhBChGPfBg69rwBAvplFyR38zkCifefReHifllZB+LWl+LeleTjGH/qXinQrSvrQrCk2l+fN4l91P0+EC2Mscciag01/Fbyw0PPQcvMdPjNulS1b/6GgICq9PqsuDOLn2WA/bF/lWknKX2LZPg7GSKApRw/67WbuHAQXuwG66yRQQ8iS8QEkeYF8KE4vWLkk9z4EmowGV8geOdkg5aLiEVdJfYhBJHCbvQ4y3/zfMrpGRrerrxn+1+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZZjg8CLPgWKggZ2fiDjSjV35SJ4VIqrgwJM1we3E4k=;
 b=rFkllsg9V9PfEZt0BXjCrqa9M0cbkqeCPe0M6VJR+aLjQ4T/VDKispCqrzZGi1oOnqEE8tJY5j/EGjQsDbeCCNnB/NswifYP+2EZjwpOU5EtY5ABIPdqAcSYDFoV8Is0MrwIsNvg2DP9miZUllWe54Niepyp5E6ZKNQPZRTAxOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [XTF PATCH v2 0/2] Remove Xen as a hard requirement to run XTF
Date: Thu, 2 Oct 2025 15:55:32 +0200
Message-ID: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6a9bcd-a061-4edb-dc6f-08de01bb6984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Szi/rA3Qsn+B7wJAgMsQ8kxA2PHWbcHSCk8bzRVjl4SNPWwP27Vav/4QGqMH?=
 =?us-ascii?Q?l5HVYmwP8UUis7jLh2Pozt8oknoBaRPUBQeJSjlG3ca+CK1Q4G+v2U+z+KtQ?=
 =?us-ascii?Q?7n6VEISMlNtkT/dwmcxdnbDR624WuCRKUfduVefx3qEe89FD8qvPmr6/OPrJ?=
 =?us-ascii?Q?EIfEiTxacECjJDGdUmFR3F/Fldsc/MkWnO9vRLiZf7Wz8PcKrrCuo6daXdM3?=
 =?us-ascii?Q?3lPOe4Gcn5o2Ukp4uill/xJ4pjgb3F0KB4/UxT0kSgDOQdb8Q8m2scgRhgoM?=
 =?us-ascii?Q?0YjpbKpy0+NLkuo7eP2/qNY5vZMmEBSq6bZy24UPi1hwIsa9ioB2xzVZg6p/?=
 =?us-ascii?Q?i7PWJm8TM3NlABIEkOOV7o2R1qpEK46cgb0ICgIdWQ7IBHgWRzUOjwLAPTA3?=
 =?us-ascii?Q?4oJ14/hv+9xA9LYZARAvp7JAiqLLEKF91xW2i20UdSI1+mrcMGoIdVzxyDEV?=
 =?us-ascii?Q?usLK0O6lG0hgIJpdwvfULjfEopUGY1u4A1AWbjAbYimE1MOYO2VgY/9YZD83?=
 =?us-ascii?Q?BYmR2AUjlAZYfDB8hKWHLyaHtZFM5dInS4Tm92yqg2uKG+u2L7xQKMN6AVoQ?=
 =?us-ascii?Q?vedSJV43EJlyc0cCrfh6mTfEHvPA2mZI3AvJB0cQuw04skM+YXoFOu5sNH8u?=
 =?us-ascii?Q?QAroTLHuhPPIigMsAU3ecXwmYOpGUL5Miv7+pvFUW6OlnztpEacA49QCNxjh?=
 =?us-ascii?Q?peRLBK115pEE/ob40+JF/OCL7C1qUKqpEzoGDsht/BuPLwuQ497/yKVGfrXe?=
 =?us-ascii?Q?Rxhy/qZV7IO8Xu2an4EsF7Cj1Wz961oM6sbDEen/5Y5D6opT5STUC7oSxnjU?=
 =?us-ascii?Q?QklvfYTHDeJ0zQlZGUi13vI9n7BJqg41Fews06A4mjTl34mQhsXo7vEcdIue?=
 =?us-ascii?Q?WNsGlzy6F0vF2WKOf2LMUvo6e3U0BPhESEePLQ+kibBukkOMZpktBoyqh80n?=
 =?us-ascii?Q?jWetwTh4vyqvjASICzbCrT5cuUnx7+XPnQpszQu2oXYmpF49LShxreMoxKwL?=
 =?us-ascii?Q?eGTmZNqPJrs3lRB8oU7rtSqERGwF9thoQyneBM8jRTuJr4UNwz0P4AbqLtgZ?=
 =?us-ascii?Q?y8yv9GVBC0Lm09IwDzAw6UfPwfh0lhmVh0S/9J6pxndITJp7ywIJ2wtYxya5?=
 =?us-ascii?Q?jwAOKDpYp8MXKasQjcnsUO0e5rjsdQUiREh3cGY36vFcp2bJQTRDL34n2oC6?=
 =?us-ascii?Q?VdK9deKik0znwzuyKB74dPNdNCZHEtQYxocBOOZYHTkm8uuO8MrTUePJX9Kt?=
 =?us-ascii?Q?hAKwc5AvM3UOcAGv9WGgqH66PtIeELaq3dsWU2fzvWm//tulM/oab/xjC/44?=
 =?us-ascii?Q?LYABkBWyNxsTjEKBcNN0qi6fP9xUjUVDfhuHH9gY7wFfZGy85dJ6vEcVKd9g?=
 =?us-ascii?Q?HNWmog9y4urMIxS5PddLsargxYyBEO4QD66ubtOQVQ+tJeS5sUHHFm6m8iet?=
 =?us-ascii?Q?0ju/AUViDTjtqPlHygJz3lryNshS1+kAHvfPtWX44UpCYRaY2Zur1jyjAI+S?=
 =?us-ascii?Q?hWBNM0PmTMExQY+ESdv7ioiB/V28FGiYKsFx8vXt0WxqegsYAM5WaTKlofPb?=
 =?us-ascii?Q?+Ju9HQqly5Cjvs42HvU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:55:57.3363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6a9bcd-a061-4edb-dc6f-08de01bb6984
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388

Hi,

I've included logic to exit QEMU using the ISA debug exit device. See patch 2.

Cheers,
Alejandro

Alejandro Vallejo (2):
  x86: Remove Xen as a hard requirement to run XTF.
  x86: Allow exiting QEMU in TCG/QEMU

 arch/x86/hvm/traps.c    | 16 ++++++++++++-
 arch/x86/pv/traps.c     |  5 ++++
 arch/x86/setup.c        | 53 +++++++++++++++++++++++++++++------------
 common/lib.c            |  2 +-
 common/report.c         |  8 ++++---
 include/xtf/framework.h |  3 +++
 6 files changed, 67 insertions(+), 20 deletions(-)


base-commit: 11b552a416d1164c63be4da670f16cf8a5a9044d
-- 
2.43.0


