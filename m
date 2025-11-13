Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20FC55835
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 04:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160535.1488633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpZ-0003gd-DQ; Thu, 13 Nov 2025 03:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160535.1488633; Thu, 13 Nov 2025 03:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpZ-0003eB-9z; Thu, 13 Nov 2025 03:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1160535;
 Thu, 13 Nov 2025 03:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJNpX-0003dm-Rl
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 03:17:04 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38122847-c03f-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 04:17:01 +0100 (CET)
Received: from BN0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:408:142::19)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 03:16:55 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:142:cafe::4d) by BN0PR08CA0003.outlook.office365.com
 (2603:10b6:408:142::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 03:16:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 03:16:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 19:16:52 -0800
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
X-Inumbo-ID: 38122847-c03f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PW/a2CCYAJ6lRpfA96nU4BF3Dr4bl7k2Tk1Sta7Tons1CgP4+Avl6RwqzpimLnEFn73DiZM8xnbAzx33khEczjpns/47wx9nx9S24OHRK3zJNT+7qgetQGpFfvfdsATdbK9Rkv0vlA9xYcjsXbJ+4/cKLyn1P8d2fEiCx7RF+AIxeOjRSZ9fR8BcdqMwFvYLh8znaRQHo0VKVd1GQVxhlmwDUbeqeoUKUr7l2wn75esYsWKVrXvI7JjeagRBzNvfwUM5/xhvmdnxANrwYZeJG2rTCplm3/jQw7srlpmtOru7wRyuv7Xe9J8D8tZ43Ve4dlP76YoJZ/fRJwfOxiNfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FDNO415xiZvDXNB3TUXesp76OqUeka2h1D93hRa5wk=;
 b=JOH9Lg82TGQvZXfY6h+QI5jrTA3EAzBqZQyQZ/sQkYx4znUTs6diLlS2UnLDS0mXs/6n1VSbkCO1a604nct2+Uo4JvERQQtTwfWoN71RRDW58pcAxyBpHTOh5kC3b0mTkXb8D+MWavLLaO8qEUWiuvbYvkbsCB46+VPTF89i5VXjhsl2rWjYk+D/Sz4pHbFiuyKLOedNL4gFP3YaMpvO8YC7QbL5AVDu01+h+Zk+WVeioD7R4QwoQIlz+NOm7jwed8z/trTwxPliFMARC53fnerybM+4dC0VYqHqJijS9kIQO3bdhlpaRJV3QPy4pQkm6CZAs++8ArZO6DpTkiuSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FDNO415xiZvDXNB3TUXesp76OqUeka2h1D93hRa5wk=;
 b=odcQxtj3eTzreXUlQcz+7PaLPrZOUZTxamiv95JgeUQbRWtXWfqUB5oUmRFuRVW1lSjaK5t108y/wj+G6nQrOEiWOigMj64fjOE3D6xMSY2r2EHAX49PVjtreDmfdoTBcGIqyGG1QTln2mWFLpqOlx83uy91MBgqIly98jNH30Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, "Tamas K Lengyel" <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 0/7] consolidate vm event subsystem
Date: Thu, 13 Nov 2025 11:16:23 +0800
Message-ID: <20251113031630.1465599-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DS7PR12MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c397f4-8748-4d9b-d82b-08de2263194d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ezi81jvR6egzGwTND28dg+xQTG7/4dCQRJFJ8N5aEhSRvoSXXf8avk71wYy?=
 =?us-ascii?Q?TB1h3XqUYSvLfsJIv7lWzTEcV6frqysTIk4ccTM7Nqa0JrDksO3ywsIzlCp1?=
 =?us-ascii?Q?dC9Z41pO0i201AYS5dYNqakGBX5IPeYR4EG7DAPGzUWar/ULiUFhE4/6jMuQ?=
 =?us-ascii?Q?cYoYZiyc2K18lYqjRGgnm/loWOmZHo7xaHtxRnVqJBVnsb659gA9y9Lq5GA0?=
 =?us-ascii?Q?1QgTofLwKF/0CeQCmupD9WHCPqtRR34dEMG19Lc22/H03k+81KB5JelOgSHP?=
 =?us-ascii?Q?I/GJQhBR5eajdQOkMy1rXNFDx+VGbsUvjw4QLm1QpCkpJJ3JU6ZT27sZSRII?=
 =?us-ascii?Q?+iYTG/HNfYK7AtPZeJ+L7bYYDKp4N4OqDYPkJR+V9GrLF3SJxfZ+yYDqAwna?=
 =?us-ascii?Q?0yrR9JVsde2ZCsW1QkjgrYwOIs2N7sf/v+qCneTRnAqZkDslVXBjHZVrw2Qn?=
 =?us-ascii?Q?bYpKj1fE0UqNiPRt9a1zTVwSYKFkWD6HvQgLyAYE6gI60i8DtZLJKBheO5Am?=
 =?us-ascii?Q?UJ6qKVfCVlKPL6Ny3GthIjMuBJgVVsudJMor3r/eoFZe31uqtCrxq6DQbPB1?=
 =?us-ascii?Q?NhbTmyLS25tGWQ1w/Hyu7LGLBBlzXOqbhs3vfb9SMHcA9J0dVSa1VDASkL3P?=
 =?us-ascii?Q?WaFPCVZwoxZD6+AnsxwmlRdJ73fV+26LPLAaumM1Mttej0nh652DfmeyNDHd?=
 =?us-ascii?Q?hphRylNWqIrGMXpy27flO/xzRG3vUFZIEkqG2SkX9umxxmyOeRS4b8lp604w?=
 =?us-ascii?Q?yAU5bO8BnDm9elLyFZa/VffA4ocP3j189OucEBBgphmciB2cDq/TS9mPBbam?=
 =?us-ascii?Q?BRdXfgk053yG3P3VpNnjWd83qpTWs30ssfVmYfFl824c0mFWtq5j+N+bQ9uG?=
 =?us-ascii?Q?7XND4WRJY7WYXHoN/211+khQ3GuUqP/1B1jWlil/FOBTds6jNfZGD9LZbV3V?=
 =?us-ascii?Q?KuIXYEIgEA1FgW1W0h25HMdXuqWMxD9GHMZZ5yj758qllZYOgVrwiSFReyEl?=
 =?us-ascii?Q?iEwBGv3U048cvLDHpXYwykVIhKfK/9GettXTskzHOs/m4KWaPp4939NmXtoa?=
 =?us-ascii?Q?GyHibwybi6n2LxZPHDWsv4tBWAsNYRtInkssZo6q037wQGmaGIFstPfR/UDh?=
 =?us-ascii?Q?sToD7S3gJMYft9IoHlx9Rk1rRFQQFF+JGo0eZ5Lff5lt+uG0i6D0C6uu/+zZ?=
 =?us-ascii?Q?UxKl14YPmT8b57z8Q5EWPSRKB5fAFHfd5ykpVSW2Pj/aijuztXPgYyjY8OoC?=
 =?us-ascii?Q?psUzutbtP3i4mJ6sSMx+09bYIT40Kv21nEYV94t+yeCnJOnaHM7gvjU5Tf9E?=
 =?us-ascii?Q?gsoL1Jz6o+K7XLVjU8xDYuUHKOImKvVO+BpvFULfYO6IdofGB8exdop/rvEM?=
 =?us-ascii?Q?zUStqKq3rGicuhBIyYnw5pcSZ7j4A+ldD+U6kaM/99c+0kFI1qa5iD1clsBt?=
 =?us-ascii?Q?eQOxXzeSM7P6ogNkLBXNcfi8+OQ2oETEb/xzwJl90iGAKGr7VWCOj0czJF4e?=
 =?us-ascii?Q?bW49G9e8M8IHBgU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:16:55.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c397f4-8748-4d9b-d82b-08de2263194d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189

This patch serie originates from "Disable domctl-op via CONFIG_MGMT_HYPERCALLS"
[1], and focuses on consolidating vm event subsystem (i.e. VM_EVENT), and its
derived features, like memory paging, etc.

[1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg200843.html

Penny Zheng (7):
  xen/svm: limit the scope of "rc"
  xen/vm_event: introduce vm_event_is_enabled()
  xen/monitor: wrap monitor_op under CONFIG_VM_EVENT
  xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
  xen/x86: move declaration from mem_access.h to altp2m.h
  xen/mem_access: wrap memory access when VM_EVENT=n
  xen/vm_event: consolidate CONFIG_VM_EVENT

 xen/arch/x86/Makefile                 |   2 +-
 xen/arch/x86/hvm/Kconfig              |   1 -
 xen/arch/x86/hvm/Makefile             |   4 +-
 xen/arch/x86/hvm/emulate.c            |  67 +++++++-------
 xen/arch/x86/hvm/hvm.c                | 123 ++++++++++++++++----------
 xen/arch/x86/hvm/svm/intr.c           |   2 +-
 xen/arch/x86/hvm/svm/svm.c            |  82 +++++++++++------
 xen/arch/x86/hvm/vmx/intr.c           |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c            |  73 +++++++++------
 xen/arch/x86/include/asm/altp2m.h     |  10 +++
 xen/arch/x86/include/asm/hvm/hvm.h    |  18 ++--
 xen/arch/x86/include/asm/mem_access.h |  20 ++---
 xen/arch/x86/include/asm/monitor.h    |   9 ++
 xen/arch/x86/include/asm/vm_event.h   |   8 ++
 xen/arch/x86/mm/mem_access.c          |  36 --------
 xen/arch/x86/mm/mem_sharing.c         |   3 +
 xen/arch/x86/mm/p2m.c                 |  38 ++++++++
 xen/common/Kconfig                    |   7 +-
 xen/include/xen/vm_event.h            |   7 ++
 19 files changed, 319 insertions(+), 193 deletions(-)

-- 
2.34.1


