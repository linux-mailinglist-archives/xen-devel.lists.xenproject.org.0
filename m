Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04DBAB0E3A
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979887.1366447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgU-0006fC-Uh; Fri, 09 May 2025 09:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979887.1366447; Fri, 09 May 2025 09:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgU-0006a2-N2; Fri, 09 May 2025 09:06:22 +0000
Received: by outflank-mailman (input) for mailman id 979887;
 Fri, 09 May 2025 09:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgS-0005aH-Lz
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:20 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f403:240a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5e34582-2cb4-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 11:06:06 +0200 (CEST)
Received: from BYAPR02CA0015.namprd02.prod.outlook.com (2603:10b6:a02:ee::28)
 by DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 09:06:00 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::cc) by BYAPR02CA0015.outlook.office365.com
 (2603:10b6:a02:ee::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Fri,
 9 May 2025 09:05:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:05:59 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:05:55 -0500
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
X-Inumbo-ID: d5e34582-2cb4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQZ0WGYD0WxXwDNaRj840xpbhaIkI1gREaxBetFfQk55HTFIlX2xZyRfB2iwd/zmLRhwXLfD+OLLHyAKKCZHosSyEtu6D7rewiAq8hEMLIyM0T0Q5xR0Zg7oR+f8ZdnV0AYCu8AkrZKxCm6qfe9O00Xk8FEx2ZmFhs5VL3ulh7doabPeCnEzZ/kKbhTmdMvVVA7MwoNkqkW4H0NLKyBPp75GKC0BL+cPQrFKSUnx/N0pgAE0ry3qw3STGsEKC3sx0QNb2qYe9IY8gWKikUu4A70WwhH+0qLqoHiro12//DNziIOZZ3zOrnt53/IOCOmbVsZhphIZXQZQUpOldhqIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKEZfc0Hl5KutLU/QCUMGLc/60ikEPSZNHL0u43mgsU=;
 b=sL6xfL8If+Ov/jERbEpSiH8a++LNqKVOLFnYCHDNZfrx0dPtvAxVXYocNZdLKMGHvrOeoxnNLKfvaSrXO9/S9BbMJE6b3tmGTqS5rTdmNC0eWgNOYhvIHbZL5fQM7fnBWOf1o7ZV3dcERihQEQx9f9/v6GEjt6/4ZfzUHVoozVAL2Zft21O0ZLL5VUpC0cetzz59qSg04zqaB8ntucaoxt0Qrhx7j6ZhW8dRW7GM0mF9ROD62MjzHYK3bnoIC4nsNsWG82Y2o5+UAjBMpxbm5LwMLtdQOOpU28ZD+KCLyADrRpkpqLx15jFtjEQUrns30aP+bvIYC17qNGat67edBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKEZfc0Hl5KutLU/QCUMGLc/60ikEPSZNHL0u43mgsU=;
 b=vbt2tC3oEEs6ySEkTR1KTHRDjsbzXJf6fF5H4saVoYFmLYsgayyJd53AvmiiZi1sx0QCU/upwmKm820Hkkqo5EexvRMpqVILoEJgA6113vNTKCTqZGqjBKT2GQQTdcUWef3nnrRzyv0q28cTAvn0VihHaiQJ7e504WcAeBEwivs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 00/10] Support hiding capability when its initialization fails
Date: Fri, 9 May 2025 17:05:32 +0800
Message-ID: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DS7PR12MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f593ca-0d79-4a60-fac4-08dd8ed8b709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHVWdGJERTQ1VG5lRlhQVGV4dDFjRUVhTlBMOVBMV0JwM1N2Mk0rUnRWNzkv?=
 =?utf-8?B?M2pXOU9Rb2JIZFRFN0xiOVRmcnR3MzhzQjYvaHhSNzB5YXlobWdNbkRIVnRF?=
 =?utf-8?B?RVpFeSttMlBNR1B5cVFjREhvdHNZNjNRZEpGQ0JRQUtMYUtFSGNyQTNjVlFq?=
 =?utf-8?B?dFNpM0tPYVdiVThZNUlZTnorQWdOaisxTWZ6TVh0VzRnUUJFZmV6cXJWdm9K?=
 =?utf-8?B?OXMzTkE0bVAyaHVpM3NMRlo4Y2NEaEZzZFUwT1dCV1dJb25KQ1hXTk10TlVm?=
 =?utf-8?B?eFcxeUxWTzNvaWc1c0hMZ1ZYM1FINUJLVjhBNnovNUdHTWJGQWN5SUY2T0ZJ?=
 =?utf-8?B?SDArQnhncWc0ZTIwaHBCTWZ3bUxoSWpZTkx0TUFCWEFvbzNMZk5IdUNxSkFP?=
 =?utf-8?B?bnZjU1NxN0s0eTRPQTd2UXFFc2FXNWhZbmJjZE1RY0FVcjEwdmlmL1dVTTJT?=
 =?utf-8?B?OEFZQXA1OURjWFIyWGdhSGx2SStleWFZcFUrV3puNDVtUllaTzdSV0FNdFg4?=
 =?utf-8?B?MERWbVU2SFR0d2tNNUlibjR0dHNzK0d1dndOUWFYNHBpUFg3Q2FxNWNMcVVZ?=
 =?utf-8?B?djFQT1pVL3pOS0tZTUNaek0zaHdtWXZOR0M0Q2tIUnBRbWNaQ2twVkNINEVv?=
 =?utf-8?B?VHlZODNqL1JtQXlJR1M5cW9vVVJHaFlVV0NJeFpKbDJieTVNMmJRWjZSY3hk?=
 =?utf-8?B?dEZGYmcxZkdoM3gxK0RlZGpkTTlhMUE1dGkrT0pBbUIxbjNXOVcxVTU1ZzFD?=
 =?utf-8?B?eFRhSmJwc0lpb0NwUStCZGVCUG5ITlhaTXg0bTlJS1h4UzRkSEFuS3BYRU8r?=
 =?utf-8?B?Y2tqYzVQekFhZkNreFVqZlh5Z3JGS0tHaEhPMzF3clVjbEFDeDdSVFlrMEF4?=
 =?utf-8?B?d1RWVUw0WnpydTdzUzJURkxpRGNlNEhmekFuQmsreXo2NzE4OGs3V25hcDFX?=
 =?utf-8?B?MFV0WmNJWHNweVdhMHFid3EvR2pTczNyd1VrdXkvbmdST09lcjhrR1ZncjU3?=
 =?utf-8?B?RWpjdUErUjFqdVlwUW9OSVBPeXEya0pwK2thS1IvTjEyWjNqdW9LQlJYQ2tG?=
 =?utf-8?B?cDFNKzhBNE1IYmdQNzEySXEzTEVmL1JvUzhkcTQ0WWtkNVA0OGQrbS8wNkNE?=
 =?utf-8?B?VjFNcWg5dTEreUZhZ0pIR3RDWTFXNndFNEs0bzk4UnRKZjI5cm52T3I3SEVU?=
 =?utf-8?B?SDlSTklWQUFFNkJwMmdSV3FvK1lZTHB5WVVpZ1ArZ1FLVmRWdDU3OHZEbjdL?=
 =?utf-8?B?RWc4WFlpYmJhRXR4MjFEZm4vY3BPUHh2NUx0QW5yZm93Q3JsRkVvKy9PTXRz?=
 =?utf-8?B?b2UvWXVoR21vZVU3ZERPWW9ET0V2bFU2MXd5Z2ZYNXM0MERqNkVrYytVZU04?=
 =?utf-8?B?NkVYZnpJalhjZDdCcXd1QUxORHNOR2p4cUI5dXJZWTIvWkFCWERmZGlPak5E?=
 =?utf-8?B?Q0d1SUtCemNiMloyYnVjcjVOcHNoVjRCRGpRZ2FGa1pNdkJWYjNxVFN5QUc2?=
 =?utf-8?B?eGxEc2Z3YVVDL1RXNXlTYU9pVmFaUFoyY0pUMlhjZmJwWk5HekFUdmZuTXlH?=
 =?utf-8?B?b3paL3JuOTM0SnVXaGZVTDdXMWdYazA5QmFpUXg4WnJaSDJodlBBUWxBcW41?=
 =?utf-8?B?WmhNQW1FdWZlTW03bUJYaGxTNE1CRGRpMXpJVnd2UUQxKzJ1UlgvcFo0KzQ3?=
 =?utf-8?B?d3JRTUw3QnJvSGlaS21VaVIyUHR6R2l6Q3VzSnRudHpiVjZ5cWhjeGd3MGdt?=
 =?utf-8?B?Zk9kUGh0SlcwR0hFY1o2VGRHYjJBWW1YYlgwZ0lJSXFCdmVXYXdTN09pL3JS?=
 =?utf-8?B?Q0I2RE5TaThKV3hlT2JlS1ZqZ3Nocm1KRFQzaG9ZSWlxV08wYnhjMjZqaDds?=
 =?utf-8?B?ZFYzSm1ubi83b1F0cklaOVJnYzRIMzFBSUhDZXlCWDB3dTY0ZmttQ3I4YlFl?=
 =?utf-8?B?bEJaWkJkSnFXZWlqMk1DcE5QdHlpdWsrNWgrRmVZWE1URm50bURWNkEwc2tP?=
 =?utf-8?B?UG1JOTU3L2YwNEZnd3U0YVFQZlFEU21LcjMzSkxlOGhwaitITmRSK1p6OHBG?=
 =?utf-8?Q?kVxfrf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:05:59.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f593ca-0d79-4a60-fac4-08dd8ed8b709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9475

Hi,

This series is to
emulate legacy and extended capability list for dom0, including patch #1, #2, #3.
hide legacy and extended capability when its initialization fails, including patch #4, #5, #6.
remove all related registers and other resources when initializing capability fails, including patch #7, #8, #9, #10.

Best regards,
Jiqian Chen.
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
Jiqian Chen (10):
  vpci/header: Move emulating cap list logic into new function
  vpci/header: Emulate legacy capability list for dom0
  vpci/header: Emulate extended capability list for dom0
  vpci: Refactor REGISTER_VPCI_INIT
  vpci: Hide legacy capability when it fails to initialize
  vpci: Hide extended capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Remove registers when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Add function to clean MSIX resources

 tools/tests/vpci/main.c    |   4 +-
 xen/drivers/vpci/header.c  | 187 +++++++++++++--------
 xen/drivers/vpci/msi.c     |  22 ++-
 xen/drivers/vpci/msix.c    |  29 +++-
 xen/drivers/vpci/rebar.c   |  35 ++--
 xen/drivers/vpci/vpci.c    | 325 ++++++++++++++++++++++++++++++++-----
 xen/include/xen/pci_regs.h |   5 +-
 xen/include/xen/vpci.h     |  38 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 9 files changed, 505 insertions(+), 142 deletions(-)

-- 
2.34.1


