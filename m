Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCxqIEDYg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8804ED4ED
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221252.1529522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR4-0001yo-3q; Wed, 04 Feb 2026 23:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221252.1529522; Wed, 04 Feb 2026 23:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR4-0001wQ-0P; Wed, 04 Feb 2026 23:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1221252;
 Wed, 04 Feb 2026 23:37:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gU/K=AI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnmR2-0001wI-S5
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:37:24 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 738610a5-0222-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 00:37:22 +0100 (CET)
Received: from PH8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:2cf::15)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Wed, 4 Feb
 2026 23:37:18 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::d3) by PH8PR07CA0034.outlook.office365.com
 (2603:10b6:510:2cf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 23:37:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 23:37:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 15:37:16 -0800
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 17:37:15 -0600
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
X-Inumbo-ID: 738610a5-0222-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOWXyyGaMVmZ+SGeqsqzJgedQg644vcPFTtJhiy3oC73xLnMoFbg7U2Y0EsWHFCHpJP0y7oBtx5JEIoCWIcQMo1NtYi49ebIyrvZIn3YtV5+DCicB657d8jE5T4G5hobiJobGFfO3pqMySXXLhZMVq9D1NKTxFDBnKx1XCgo88A5rXEGAywK3I9GGx25QdplrBzqzQi+zcY0QvAo+fFlO9d/HW1XA+endkm5VEvOUsUkTFytlGne19Lr44ABmqc8eXR9cscYTPrvZqVsoLWqkn7MchbIWTOc1WrSt/01kfrijnpeEW21fv/xaXyhjXx9zTXVQtyocSaiiJBz8ut5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MFwuvb8+rgtwgN4iWI9ztcKuHcy7B3bPq6D5eSNPBM=;
 b=kMy7d44dpvTcIETOfTL9QTzMpOdMzBG0b1hw/JUYLKqmwopMmybcb4B/xJJcUKC+a0d3DdSPUQ+UuG9H/J+XeGgUeGmyV3ykByiSONYeUaxSr4/vfDF7fJwiUMXrqL4RLSX9SKmCjuk6TZ/t9SVkcp01KZScjXmlNayHr2xJfHDGx+R60fXU6cMIlUFxzrTT07CuaK73uQWfTD/cO2marp/yw33J5lY5Dv3AXwQl+dTCNx3oWoC/3vNjdABlwCdvf0h3KZlzqWqt7hnO9v56VqrDMUu7s3TqL8iFWKqA1YJQ66W7xBN2j3+wzkrmaDAKA8MCx/v5yts94ySpGGCoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MFwuvb8+rgtwgN4iWI9ztcKuHcy7B3bPq6D5eSNPBM=;
 b=vtWsPxowl+bEnV+jV+fLdpgwVhrJx0ppgIyD2WSzP3Yq1jcafvi8pFoichXadX1FNrZ280On/sMovqUdjjcr5eoBR5Cb9IVQntcfQGRUPVcWtmkaWgNjmjqI94i6/C5TaBndNJoQpRTYw3kjHRYJLay4Q8i7gUqXelVicX0Ewao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow non-hwdom binding
Date: Wed, 4 Feb 2026 15:37:09 -0800
Message-ID: <20260204233712.3396752-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1a508a-bca5-4518-0af0-08de644654f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m6QZibMyGtulUGtjPx/hDDDVkTMQc1f+xz+z0NzpU50IystHdwbWOOy3sHWr?=
 =?us-ascii?Q?NZ/Y2VD/V1PLFX3NU2WpFSk1Vt5T3ZbrMq2nIb55ZwWXh3t9zSGMg8uaHjnd?=
 =?us-ascii?Q?hhZ7otTXKLzVVxgR8vBZJ2Y7dPJIt70b6K/0Iz5yStBWU38BoCL0vUmDTKsq?=
 =?us-ascii?Q?5pXwsiROJ3IBiQckEVdy/eTGPgNNfz/61IG8+FB2EyTPSe7hX4P9iTYA3Fzv?=
 =?us-ascii?Q?bUzMzx+yG/EHz/ymWzfmbj9WvDcPBpRXQwybkYBFv/PuX5A1fuuU5l9B5GMf?=
 =?us-ascii?Q?NuAgNZ+Dluej5wkT8k+052i5b/KIw+P2VnIiSOqieRADLCay/iZ9qhf1RBYG?=
 =?us-ascii?Q?tPF2/6T3x7CaEM2L+OWPCedxfGeb+ytLLH0IzOu+65Tv7pCVOAVY6Xkk9VKu?=
 =?us-ascii?Q?lFW4Zlft/1lxs+BSsNIK2UtI3nCCjmhSCvwMDRjuNafj2fvGmKoT+ctyY3D1?=
 =?us-ascii?Q?FeUSRandoAW7Hw5+FrpHrGmVhrROqDfLFrj7KRx2saf0IoUI4bVPTaUJncpj?=
 =?us-ascii?Q?GynO2LlmfGCKZ6ur/LfOlaC5mYUSDH4YcFnWYL6FMhGkx3rOEq82rj70hLdZ?=
 =?us-ascii?Q?t1OVnC596ZoD8ung4w4ZjVcNfWnzlt4UQnPHF2UAhJBqDHXQY6vheEOXiVzN?=
 =?us-ascii?Q?RflDE+z3CM0cVH2AF4zGdmWzMcXRafIkCgLGXMxx/5BlSsLJZbtw/xZlH/0d?=
 =?us-ascii?Q?jj+uj4aFmK69s1U8FTpcDE8a7kmwtSLmvnR88c7PbDHDS9jRZ/iHc5Ibkcum?=
 =?us-ascii?Q?q6KHHvaHw+90wSUH7onTeyEGBYSA78IESwCxsEwuL0T638N+Al+z6vIk3dQs?=
 =?us-ascii?Q?jJo4/9rAfrbHCKB6hkP94MME4+EyTK0R9n+/ouP4ch6CgdOa88Q4bnpz3cJl?=
 =?us-ascii?Q?ltkt+gPs3LgiQQA3QUEoPw11NXddI61xNmH6U/A7LSHjrimhJUwZA3/Ub2CA?=
 =?us-ascii?Q?+yFv/ZaK8ALvVO6LMGo7uOps/Bm4zqjSyVdIDbsAluiJxZwT8AlkQ6f0rSLF?=
 =?us-ascii?Q?D0gxHZ1iL+Bs0DX25Re0zylHbc2vTK+i2oEosqBRnDl+rXCOODJZGbx/xyaR?=
 =?us-ascii?Q?xw4waiUKf6yv83dPKmFEyBuDhEJCkJZmExqmA3ViUGRRfqb7iaYjCXVNu2xv?=
 =?us-ascii?Q?Ur+YWkbE5iJgd16slaIvTkOLpb4JC349bqXsKmDs9hdnQe0KNKZPsbDzwy0u?=
 =?us-ascii?Q?YIaNZg1yz05x2eOTxpe8QfF5FPIe8B33IaUp1FIwTNinPl/wOQYugSEiojqm?=
 =?us-ascii?Q?K8KztzM0D/kdTHCe9Py6LL5XC3Zw20BP+XFm1B5UpqfZ3TewMDfpFNG0f6aM?=
 =?us-ascii?Q?FAQvxq2fn+ze7SVWV6wPP6APAg5K/J+0jK8pjP3LGUI9Th5vU4M2X2XBt2I5?=
 =?us-ascii?Q?tYFa1E9Zo4F2dh4q2cZasR6XXyfTEXcsDQjrqyDyhw+/IR8LwrGKYoczSn3J?=
 =?us-ascii?Q?mhkvC174lL91GVnajbDKyegAu+dulrVKCzXoCt8XCS3CNBnOBdXx5Nd4DIEp?=
 =?us-ascii?Q?76wTcxZNOJ7L8iQcGtDPUDrPi4HK4Vrdk9jjDym8PetvTxVsxynODeVXMaT+?=
 =?us-ascii?Q?YW5ssXJq8K01/GgPuDuhy70tZ5Z03FyYO8SB8lD8rtPMlQ2vheP6ofHyqSU1?=
 =?us-ascii?Q?dH9QGN/UhNfL4nASOx/jf/oy/Z90nEzzODR3SuOXGlFnYlSELIHI8M3bq4NQ?=
 =?us-ascii?Q?xGUTTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AOLnCJM/lj8+fI4goO9tnLKUn1JsmE455ZnplaKwb2tLH9OXED45XCFLjR6lBoOXl2ywxfifcBaxFXqIHyxoIZem6BnQ5G0ohdXPxG0eJmTqlYVbBKDn4FTfawa3WzzValdrUZGFloQddBsOy6YTB9Y93bLZFRqid93dKMUDx/9FyT0Ubi5XKNVEYAgGN8a/5Z2pJdacQQdtcmZoWjjNTQ653+DtpGFA+98kjhTEfTdtNdf8t9SM1Dk4Vdp3K6lWfBABO/Sawlvc6CYE1TinGjmS38qYE7MEUgD/CkIJ6LmgNifDOSHGL40Ub88Y1kT0cGx6UEvOPoAwVuGUULgwxVSzNbGb+mvkXL03g4cKmmEwGk+0eOWpzXplE/82rSG0PYcjPK8ME4vtO9HvyieEj/fwxeU9m9RvDFiJZ2VYptUyuqTDWytusA5bskypGjDG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:37:16.8044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1a508a-bca5-4518-0af0-08de644654f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D8804ED4ED
X-Rspamd-Action: no action

Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
global to VIRQ_DOMAIN to allow other domains to bind to it.

Note that Linux silently falls back to polling when binding fails, which
masks the issue.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v10:
- update comment in xen/include/public/xen.h
---
 xen/common/event_channel.c | 1 +
 xen/drivers/char/console.c | 2 +-
 xen/include/public/xen.h   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a3d18bc464..f9becb4ca5 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -138,6 +138,7 @@ static enum virq_type get_virq_type(unsigned int virq)
         return VIRQ_VCPU;
 
     case VIRQ_ARGO:
+    case VIRQ_CONSOLE:
         return VIRQ_DOMAIN;
 
     case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 35f541ca8e..fbc89ca2a4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -613,7 +613,7 @@ static void __serial_rx(char c)
          * Always notify the hardware domain: prevents receive path from
          * getting stuck.
          */
-        send_global_virq(VIRQ_CONSOLE);
+        send_guest_domain_virq(d, VIRQ_CONSOLE);
     }
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     else
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e63..b8146bd00a 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -176,7 +176,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 /* ` enum virq { */
 #define VIRQ_TIMER      0  /* V. Timebase update, and/or requested timeout.  */
 #define VIRQ_DEBUG      1  /* V. Request guest to dump debug info.           */
-#define VIRQ_CONSOLE    2  /* G. Bytes received on emergency console.        */
+#define VIRQ_CONSOLE    2  /* D. Bytes received on Xen console.              */
 #define VIRQ_DOM_EXC    3  /* G. Exceptional event for some domain.          */
 #define VIRQ_TBUF       4  /* G. Trace buffer has records available.         */
 #define VIRQ_DEBUGGER   6  /* G. A domain has paused for debugging.          */
-- 
2.25.1


