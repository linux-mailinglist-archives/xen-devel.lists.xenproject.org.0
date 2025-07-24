Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403AB10033
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055180.1423636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqj-00058M-3T; Thu, 24 Jul 2025 05:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055180.1423636; Thu, 24 Jul 2025 05:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqi-00055t-W3; Thu, 24 Jul 2025 05:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1055180;
 Thu, 24 Jul 2025 05:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqh-00055h-Ix
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:35 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2418::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c611ffe-6852-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 07:50:33 +0200 (CEST)
Received: from SJ0PR03CA0136.namprd03.prod.outlook.com (2603:10b6:a03:33c::21)
 by DS2PR12MB9686.namprd12.prod.outlook.com (2603:10b6:8:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 05:50:27 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::60) by SJ0PR03CA0136.outlook.office365.com
 (2603:10b6:a03:33c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 05:50:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:26 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:23 -0500
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
X-Inumbo-ID: 1c611ffe-6852-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9hMT/l2/9HG78aZcB3k/s74mHbxDBJp82vqHmAS72E4vtVcdrk3vFci/vPuCfeL3LoPDz35pA+PCHZyXnO/FiT7vBuuhBHxkg8ofnEVWt0GR8AsRyFzR0YCxKSnvb55jwHljpaOOYt01P68WymiRkqurKjMf56JGdFX5mj5T9xDM9vJWGPeWjFh6Cs0d/B+jSDIixLnRF57k7p62Nku4VSfh6ZyTCMk/hG0e2hT6R8UYYDrTnk7ZnH4kLX0Y4U6VDOb7IAASSQSu0mv4nmv3TODVyHFyP5Tw2Jqj0dgGBzeVhQePQ08gM8dFdBoju1rw/ubZd105XbZleVM9iG2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9C+vmwoeN6O9X+KzUKmP19ymQ8rhcDXnFZ3YbKmkgI=;
 b=S7wkZV3y36T2r3BVCThzJmnNdqovpGgZpXYr5vYv1C9dxi/fo1XmNAA+cB6RSFiX3kLuFjIKFPcd2kNbcVmMskVhPpqe8hN0UlfsgHsp8tfSu0pdO5L93bnavRsLc8Zi4XNt7ZNPu/AnLnSdnMUsj9IXe69dpEEH2oHwFHAoFIZCFHz4ZMAf2rNyt2vJO7XVY3l/pKzd5nL8VOg+jZ4X5ZAhsOHGI09djNxRamO7fimJdOXuhl3KCtm3zX47tI7AA0l8HcRhc3F5ou/qGp/Z+oq9il+EIWWf7rSf8MG1dJRd7xP3dqnc+MWMS0gOAOA3mPUlTf4OrEz1FifmBL8ujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9C+vmwoeN6O9X+KzUKmP19ymQ8rhcDXnFZ3YbKmkgI=;
 b=Gt7nC0JQkVLh+uyEjE9qZkZyFXgASo2oqpoTpklvU7nkW65ZUy9dWkHzPyS8tAWzI4f40h+T8YYeH4oiRR6c8haCdiTO0MWOb206Mp7g0GzvQFj3nxJy3vfaJ3oSJyNicp0LtNxvWt7ItACgosl7nRhSZD6SdC2W33QI7zKlrAU=
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
Subject: [PATCH v8 0/8] Support hiding capability when its initialization fails
Date: Thu, 24 Jul 2025 13:49:58 +0800
Message-ID: <20250724055006.29843-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS2PR12MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e574e1c-d6ed-4eed-ddf6-08ddca75fd44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGNxVkFHSmwzbTZiMjlCZ2ltT1JEeEh3bTdrcEJldEdhSVhTcHRraGdPWGV3?=
 =?utf-8?B?eFdrd24vOWJSTDZkczNTUUI4VGc3SFRiRWlLZ3hweTQ1RS8yb0N4cUtlTUpp?=
 =?utf-8?B?UHE3QXE1Uk05Y2lrNTVmM2JYWnNrQmlsOXNhTVhCS09LS1VVQTcyTkkwdGU3?=
 =?utf-8?B?MS81bnUwdmt2dnVmQmZtdVBBYmJXYnY1MVRCK2tuZnVnbWhXREJFYTRSaUJ0?=
 =?utf-8?B?RUVINUFUYTU4NUtMTDBJUGUxT2w2WXVrYVlHRER3a21PTTJaSVZTQi9XeUNv?=
 =?utf-8?B?bmJEMDVRVXR6QnU5dnlBaG04SmhmNmdhdENZZG5UZVNLaGVieGdEY003cWtY?=
 =?utf-8?B?cFVWZ0tRZUdhVHd1ekpEdDUrUEFxQnEyNWNIUk9icUNHVFBsRHZYQUZiak1z?=
 =?utf-8?B?MVBZVWxNaEV2KzFzeGJVZE9LTE5LcVozOEF6bk9SaEYzNEVLWDFwNUZEYjJz?=
 =?utf-8?B?N0FlR3FUSFR6bXNKMzk3Yy9GVDhtUWxRS3BmclFsQTVjbFF4TnVuQVJtRVMz?=
 =?utf-8?B?M0hPMUFnbXFkOVo3OE5RQkxtZDV0OEx1L05ERVk1SERXd2dvUWxxb0NqcTZV?=
 =?utf-8?B?dm9oUjBDem9TL3FrbkxtK2h3b0FaaVpLQkhVL3RjSDl0MnhEMUhMYjRKZ0tj?=
 =?utf-8?B?dlNkT2s0SDlNRDViZHdTck1PYThZMDNzYVlSK3VjQmxlUlZrSEdwT24xTzE0?=
 =?utf-8?B?dlNYYTNuU3h3c25DUktSTU9zc0tjOC81NE9icWFMZkxtMW0wdUtvMDQ3KzRI?=
 =?utf-8?B?SVRkTG02WHFpTVV6QVlucEVNNkhyZlUwV245M3pZTDNDTWxtZjAzam4ybnFz?=
 =?utf-8?B?Y09YQ1NQWjgwQ05SR0JoMDQ2ek42b1dhblFSS3BoR1A0VTE0Q3RTVWVleTV4?=
 =?utf-8?B?aTZkVW5adDk0L2VHeXNDbDlVMTZiYzdERUpoMzNNRVQ4ZWhpZzU4T3kxdjN4?=
 =?utf-8?B?RDUwVkFJTUpObXJrMHZjdHlNY0U4TXRQdDFJOXJ3UG9kQkJjaEM3ZVNndXpY?=
 =?utf-8?B?NGFZVnBuMWNhMVZENXVQQUlia3g5SGllSmoxMkQ0aG5tTmNhQm9lUzhvODVQ?=
 =?utf-8?B?eDlqKzlpWWt6eCtlUUFnaUFRQlhFOTJ4eW45aU1jRUhJWkZoTXNaSnlHTi9X?=
 =?utf-8?B?aHA5SFVmSlpZbmd0WDhBSmZNMkQyYmJTU3FZd0p1MFZIOHh2ZzBUT0JFNi9w?=
 =?utf-8?B?MjBNR2NNWGMwdERpV0V3d2ptaTJXaENUR1VUcUlSeGV2UTZVTVg2RTNORE4y?=
 =?utf-8?B?NERjVkR2ZTJaOWIrMi9HOHB2RFNKaTVjcks0ZVJTQzVZK0dpSzBjVnpLQW1N?=
 =?utf-8?B?WHpsM2oyaTl2ajNJdytoVDBTR3lCQ3lYb1BJbk1LU01JelpmZ3Z5em9MS0ZY?=
 =?utf-8?B?Nk1NSWhLMzhwcWlYVWswSWp2d2RIajFwdGtQdnRvcElKc2pOMXo3K1B5clRY?=
 =?utf-8?B?Wk9yeUQrQXEzNnhybzgrZzhYaW40UVc5cExITXNsMXdaamVlR0hubjd2N2V4?=
 =?utf-8?B?RVc3bUVPM214NGRWdHVJbnVjcnVPOFNtK29QZVcxRmlDVnF3dUFGMHIwTVBr?=
 =?utf-8?B?SjFBRE9HWEd2TmdiYTl4TCtFeHRLRlkrcWpGYTd4V1dnNEhodG9yeHNUNTFP?=
 =?utf-8?B?TUZlcExKbEdBalRkZDhzR0lyZ3NDbUwvYVRvMUFJaURmdWJDZHh6em10K1VC?=
 =?utf-8?B?VURRN2hTcm9iazdZUHRFZ05FU2pGUi9ZbFBNRTRPemk2TjlIYkpLM1dUOTRp?=
 =?utf-8?B?UzB5YlA5TXFhUGZtd0F6QStJalIvc1ovTG00RUg2aWZKL1RSc0NndGpPOFl0?=
 =?utf-8?B?cUNUNERuMXgrM3BES09RWUJlbkM2c291bndVajVGZmJwdXBKYUFyaEdEcHpR?=
 =?utf-8?B?QnRaWVlJdnNXTHR1eWMrV0ZLRmNDSGc5WHBvTlN3T3FoS1FZMTBhK2ZIMStP?=
 =?utf-8?B?UU9wL1JvcHdCZjJnTFBqbW80TCtjbVBlN2dJYTNJZzlGa3FLRy9ZR2hvSFN6?=
 =?utf-8?B?VUtKZ1VMdFp3Zlo1cXJyUUJUV0xlTFE0d3B0YnB6WWovRENMRitHNFlDOWN1?=
 =?utf-8?Q?+txPkx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:26.4211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e574e1c-d6ed-4eed-ddf6-08ddca75fd44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9686

Hi,

This series is to
emulate extended capability list for dom0, including patch #1.
hide legacy and extended capability when its initialization fails, including patch #2, #3, #4.
remove all related registers and other resources when initializing capability fails, including patch #5, #6, #7, #8.

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
Jiqian Chen (8):
  vpci/header: Emulate extended capability list for dom0
  vpci: Refactor REGISTER_VPCI_INIT
  vpci: Hide legacy capability when it fails to initialize
  vpci: Hide extended capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Free Rebar resources when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Free MSIX resources when init_msix() fails

 tools/tests/vpci/main.c    |   4 +-
 xen/arch/arm/xen.lds.S     |   3 +-
 xen/arch/ppc/xen.lds.S     |   3 +-
 xen/arch/riscv/xen.lds.S   |   3 +-
 xen/arch/x86/xen.lds.S     |   2 +-
 xen/drivers/vpci/header.c  |  47 +++++--
 xen/drivers/vpci/msi.c     |  46 ++++++-
 xen/drivers/vpci/msix.c    |  55 +++++++-
 xen/drivers/vpci/rebar.c   |  41 ++++--
 xen/drivers/vpci/vpci.c    | 275 +++++++++++++++++++++++++++++++++----
 xen/include/xen/pci_regs.h |   5 +-
 xen/include/xen/vpci.h     |  33 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 13 files changed, 448 insertions(+), 71 deletions(-)

-- 
2.34.1


