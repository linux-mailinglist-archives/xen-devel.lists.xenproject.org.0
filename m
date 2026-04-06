Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LIwEL8F1Gk9pwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F93A6867
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274353.1560489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pMt-0008A9-Ko; Mon, 06 Apr 2026 19:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274353.1560489; Mon, 06 Apr 2026 19:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pMt-00087e-Hw; Mon, 06 Apr 2026 19:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1274353;
 Mon, 06 Apr 2026 19:12:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w9pMs-00087Y-Ka
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 19:12:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9pMr-009KXP-HV
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 21:12:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d40552-e002-0a2a0a5209dd-0a2a450987de-24
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:12 +0200
Received: from [40.93.196.28]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d4058b-bf79-0a2a45090019-285dc41c0ad0-4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:12 +0200
Received: from BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 19:12:08 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::c2) by BYAPR05CA0053.outlook.office365.com
 (2603:10b6:a03:74::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.27 via Frontend Transport; Mon,
 6 Apr 2026 19:12:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 19:12:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Apr
 2026 14:12:06 -0500
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 6 Apr
 2026 14:12:05 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSznalHPByixjzsq9Ww5S04nuq3NClccU0YogrdS0DrX+Yb48X+rKUSXOFKojiMklzwOq30hQH2tMzH3OF1ElO+fDxRPVRy5aPm+evcH9HoBUztj3RqaeO8HAC/vfyBVqFu1ru2X6KKdQufOuUOQSryfVeCujaa1SuJU08cEfURy6K/rqjdOd7zVlLQSdY4bGze5hoI5MoiCgdQ5BEiKMr5L4HRjnYDDVnIsSORWH6+v1SMIEYBZcB33yaJKTRbtfMRINyNOARVgJD2AOxayMXQ4hqtbWJ2emZx8lDbBmpm3eYc5FtC9fu8FZk52gIgKrHXvo+F7YNurC4Ais5xGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEBWTYo8FkagdqdlvFbt8pFDDrHaPNw6e1LsgXNGcnU=;
 b=hyr6xJtUVcpy5GykmHELYJQ1K6+mJvX/cugZdd65A/SOnST+pknqMYeYDA3s0WrOS2bAbbxgl/s1KJtlTcjMxMpwBDQdeEvKyozkIVQxPfec0FMEsoRKCufOpAislrAWrWSmEGXNVy7JQ23BZdaD11cdUVvjcpZoD3VnZo5pPmf04EkRD/5FqydBoY6Qb5glAV/HgOcKtDMMGWSbZRT/hCbkCvdHHI52SYxehyXbfRdb6cRkdZMTa0k+BClguA3/Uc/2SlSozPhXqESrr+ZXC7MYQ+e1NF2LOK36oJIpHGCVNfJiEKQdGKSCEeSJoeL3Sy6GZL5WL9AYujltL4xz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEBWTYo8FkagdqdlvFbt8pFDDrHaPNw6e1LsgXNGcnU=;
 b=Lwcm3gXVC3XaxSccinJcLzzPDy4jBw3do2yN++uuv9wiutwQJyPRPl9oD0nDVWL/vsBpHffgEBgfSx2e4YmxjaagymVbeQdve3FvyFZe7W5kLSHaDPEqFDTHa/X246clZnmQbTf5Nmwiu0GWorzs3eJWsQSQCq4i5BYqkYbWrXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Mykyta
 Poturai" <Mykyta_Poturai@epam.com>
Subject: [PATCH v4 0/4] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Mon, 6 Apr 2026 15:11:54 -0400
Message-ID: <20260406191203.97662-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: b2188676-22be-4a58-57c3-08de94106582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	V3WrIhzENCDAGrOM8jWQQMsfxnvo1sqVPey7SgQ2F0JMMCqV9NDL2eSlxLIRym071g/oDxczjIulA0CwVZg8DkpxwkJ6xurKxr+pvdjClDRdzk9qM0tmo+jwgnXcHI4ERfMVZDBQx5J2eCWWMN4HjXZtQkSXucvOacE9QvC1O0CS4/LkvVaaCK4kHJNngXK0gflUICFjXtT9gBUFHlbCaZF3DRSZrfNZujqtWsJ74sYidlvvxe37s9n1hyCywVWetbT/ReDwsjxwQ63YdFTAb3AlZlEdQfHrbt4239d76bKPVqHxAvD4Jvvf9zZVyY+43XZdiQub6GsZ+zGtB8QXVUw1+mUPBzeZ3n2vS2yd3pnvUtuckEoRB7VrwMk7W4hzml0Nl4LKGis3tfE4LoVVef/tl5CwremK368gGU0frvSGgX65IVMxeDmVksYnu4AxmYOy8K9TsE6q2k6OL9MpcoPAov/pH2y4W1IA5fJWgI3TrysamUosj/a4AowJq2yFPdHg6cJHzNQ8k3UK+nFGPM5xrhN6+P6IwIBPt8OS/HMlw2UrSsNdhabAIIMqqGrj7VREwwMP8Nsv7ZRyiaRC7viBT1ImBcYaXGqQLzioh80HF2a8ghbrAqT7WdXCwLsS3/K4r0meUmvAYHm9/CAcgn1xd0LUJuiOsIPGrvMZmqXjlmUDiFaGtVq9F2rtycetLwH5WKcY58o0SpsjAFxgEsy1Awm2ut4Q8ckWs25aVWk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bbo62p8cci/eNJ7YIDoo3F6a4eHHyALmEb5vRP+qR2H3MdA8s41RN5DNve2bOwBoEzRzLxYJX9c+T8hOi0gtyMdUnlN/af66ljQTwX9hTCOhvhrlugXCOtRya3/iMSgI68lk7sPAtj/rIfIXV7UCMXwFdf7JvN1dBHfelp83lgIS8LVwyRDAw9dD2ArOiHpQCY9rXIB/bgPuHV21f7xvv8+xX8aQFNQcIUw3nSpR2nLT4F/VVRengUsRSQE44JqtgYmR3O83D/2SvKG/r1g4bObQ/hraxbtp4RTECHTiEzIn6Xjd2dO4nnqlfwTanbdoL92ZMKKUtxRbBlgGtdtg0bEuGDYIkvaqJZPy5iWESU2Em3zjiwLcC7N2ndKaN8tuHxzviIsrLCqRJHxl8qF3gpAD/Cdn86GZKSC7T3CZBW9a5+Cn6PfY4PPjQVpN3GHW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 19:12:07.5531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2188676-22be-4a58-57c3-08de94106582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636
X-purgate-ID: tlsNG-bad1c0/1775502732-5D3F4152-F3D4ED97/0/0
X-purgate-type: clean
X-purgate-size: 1523
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid,gitlab.com:url]
X-Rspamd-Queue-Id: DF4F93A6867
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These 2 patches
  ("vpci: Use pervcpu ranges for BAR mapping")
  ("vpci: allow queueing of mapping operations")
are also pre-requisites for SR-IOV.

Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2432615038

v3->v4:
* switch back to dynamically allocated queue elements

v2->v3:
* add ("vpci: Use pervcpu ranges for BAR mapping")
* rework with fixed array of map/unmap slots

v1->v2:
* new approach with queued p2m operations

RFC->v1:
* rework BAR mapping machinery to support unmap-then-map operation

v3: https://lore.kernel.org/xen-devel/20260324030513.700217-1-stewart.hildebrand@amd.com/T/#t
v2: https://lore.kernel.org/xen-devel/20250723163744.13095-1-stewart.hildebrand@amd.com/T/#t
v1: https://lore.kernel.org/xen-devel/20250531125405.268984-1-stewart.hildebrand@amd.com/T/#t
RFC: https://lore.kernel.org/xen-devel/20250312195019.382926-1-stewart.hildebrand@amd.com/T/#t

Mykyta Poturai (1):
  vpci: Use pervcpu ranges for BAR mapping

Stewart Hildebrand (3):
  vpci: allow queueing of mapping operations
  vpci: allow BAR map/unmap without affecting memory decoding bit
  vpci: allow 32-bit BAR writes with memory decoding enabled

 xen/common/domain.c       |   2 +
 xen/drivers/vpci/header.c | 333 ++++++++++++++++++++++++--------------
 xen/drivers/vpci/vpci.c   |  10 +-
 xen/include/xen/vpci.h    |  22 ++-
 4 files changed, 239 insertions(+), 128 deletions(-)


base-commit: 33ceaa28275ca4e298616689ef96f19efaa87c35
-- 
2.53.0


