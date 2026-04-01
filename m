Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KBVHaQyzWn0agYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8437C926
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270544.1559186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1Z-0003Vm-FT; Wed, 01 Apr 2026 14:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270544.1559186; Wed, 01 Apr 2026 14:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1Z-0003UC-CY; Wed, 01 Apr 2026 14:58:29 +0000
Received: by outflank-mailman (input) for mailman id 1270544;
 Wed, 01 Apr 2026 14:58:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7x1X-0003S3-TX
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:58:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7x1W-005trN-UM
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:58:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd328d-2eae-0a2a0a5409dd-0a2a4503e650-12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:26 +0200
Received: from [52.101.61.37]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd3290-02b3-0a2a45030019-34653d25e2a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:26 +0200
Received: from SN6PR2101CA0029.namprd21.prod.outlook.com
 (2603:10b6:805:106::39) by CY8PR12MB7609.namprd12.prod.outlook.com
 (2603:10b6:930:99::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 14:58:21 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::2a) by SN6PR2101CA0029.outlook.office365.com
 (2603:10b6:805:106::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.7 via Frontend Transport; Wed, 1
 Apr 2026 14:58:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 14:58:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 09:58:20 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 1 Apr 2026 09:58:19 -0500
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
 b=kvH1+WYR4u44VIbj1ZDoNTAy7gC4Y7g3qdnyoPzP58Cyg5GsyMaPtMRxNdvKc5kp1L8100IgQVYYSpKNSq+eL6Gz8MQ9XrdXIl4uqJhPNldcu2T53UdVHrbjIgIqS/YnS0GMC2SILKhEx0G7ykUYbbC5NrCQT1as4fVhAVuhmfzKVkL2bIqgXd2DO7gYP6BHzofeGMZx84mYClwYn3Bkfx6GKy1G2bq+po2QL9XitplYt4oOOYycACKLx/9qWvxtpJFTtam8JAtVS+OmBoGEUVsiAdEtLmkng4Rklr45moemkP5PQmmMtapVVen57WTlqjOAe/CGliasa8P22CQ5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6x352bgL+ioYyETa7UTjzMbqZIqRNZIhkl+Rlwv5oM=;
 b=YNVra7WginesFmqJC4p0EmPpQTOXCeIy3OBPHoINjpphZ54/SZDJN9Q5Mye6Fmdbqd72b57T9QEguD+xiTrVLBqhOfvyVVsRp6DJlEevhOZenI0epBfR00xA1XQvyBgpygEcrCX4TK2PyybQhOx5jlE54CfO9VuUOri838dy7/Mu45rbqgRA4sTK2B6tfm7a43XHlxkCwT7dcnel6FvuQ+J1tLVhYzpGzAyUDKqw84O6DAJtYdcTkuv8kedCTZb//cgihq47JZo1TXIvmIllu82UIS8Ohfn5IDyAa0JbffRTEYqqw1voOMRU9ssmxtt7hrOnlU0aeszbgKT0Ofc8/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6x352bgL+ioYyETa7UTjzMbqZIqRNZIhkl+Rlwv5oM=;
 b=mO5baLAN7oMRODFGGa+dGZD2abOQY5TtnXOkzr6TnuvHe1DI2BguXxWLGHw0l2Rh91S1g/BzazBzKTdSZ7Q2SiTMwuf6POdH4lshPothY/x94nykezssFS6opIB0CkzvUSIYsFj7wy6m70cIILlLLvfTBmLDz/Xe1kzBx8l1dL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH 0/3] Misc MISRA fixes from Arm allcode report
Date: Wed, 1 Apr 2026 16:58:13 +0200
Message-ID: <20260401145816.169557-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf7f565-f81e-4286-a423-08de8fff1dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0TXx+FWuSchZzeRoKexlGLt2a1dg8wKrMHArQ4M7sXfKFb3bBEx4XzDOHpISY4IzFxopNCQKIjKKdCbDKJLlPJxbcHNZJOMsigH2gDm2qxOaZSOzmyoi9rueoO0i43BnydyXXf4IdRPlwHerPh/T79pWeQxTIu/9xvCaDc5tWwIdLGiKBN2/mZNfovrP43bjkRjYuCnBuzPAS51Z2ptGku8jA+pYJGKzglSQ/SsbHhKMuPMU4rWS5HDOt0kJ2D/ya62TdDGuhGVJe/oEgW69+uFG1vRLgt5V3fodz/yVncsV/hglxloVQkY4MFyQig7EZ/8xdvyrMaX1JKhJBQt8Ub9N5l282scW6ETGRIqSX6J+v60qptuPVAkpJnkPSmTyzPVJv58KXmgJw1NzP/0EtyoVTXRwBJW3MQZtRUOW26SCBWLWDHmkBEQFQ6T+HMqlIK0O/RbSzQu6oi/MKBn1QU8MUrDYc8Gq3h5uVtGorIXuSUsW7xOtJkd40UTPapR2KWwsOooZkmrSMsGI9QYcFT97Utpwr27O72LVmsQuGxeS5279HCPvmNdpbia9knWGjsdm4NyGwN44eagda9P/WaxQi+MUlyTD2OEy6sCYxg6JDI/T4qWM4arnlbouHc+bXHDiGpVCNfc88YZx3H3ZihvRlUWam+T+N0eppm17HZSYwgp8FBWc7nT8AIzKF8CgHryNzEPHVBmIYsUyTGIoI9Vn5ldpkXO1MaoZMm+u+u4Ssg39JJV8MNFLd5OLaaLF34dmCMSsbMsVNJBkjvY4GQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xprQlIcsZYhhxDF8oPQGQTC0FEmg9mGofl4Uokt/o9FFnBSkL5A/6Mz8Xzd9cEuRF+V8HL3uZW6HbeOv9Od0Pn2HAkbyHy8DAfb0KaUckVpWNPiTwSonBf5zinAJWI8qI+Ye27vcfnkIp8nRZ//5lR7PlXzLvDG+utZHss2r5cTJjy64LmIQeemQoWeJmOtJ3lJS/bEw0xLU4cpDl/47xotGjC/sBRXfzXADlAd2M0S/NVUgQBIIQgREwoPUfqTZPUQao+0bmY844rYeBAW4R+H4DKygQEcsIR0YV86T7AYQjBDH2J6bKGnvR5Uj4soa2NyQJwbook+g1sfVQnNL2ka4JcWagfFXjW34a+uueNUHMbIeyjfQhZZmHQjnZuqR10vfjT3OIxSSp3GZKcv2sjjGOHk2zv2OJS1MV9q5X40Oh8TG38NibmYBMtxh4MvL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:58:21.2243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf7f565-f81e-4286-a423-08de8fff1dcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609
X-purgate-ID: tlsNG-33051d/1775055506-C9F3DC9A-797C54C2/0/0
X-purgate-type: clean
X-purgate-size: 828
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid,gitlab.com:url]
X-Rspamd-Queue-Id: C1B8437C926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The number of violations for clean rules drops from 22 down to 5:
https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2423381226

Michal Orzel (3):
  xen/arm: acpi: Rename local acpi_size to avoid shadowing typedef
  xen/arm: pci: Narrow scope of file-local symbols
  xen/arm: vpci: Move content of xen/arch/arm/vpci.h to arch header

 xen/arch/arm/acpi/domain_build.c   | 14 +++++-----
 xen/arch/arm/domain.c              |  2 +-
 xen/arch/arm/include/asm/vpci.h    | 18 +++++++++++++
 xen/arch/arm/pci/pci-host-common.c |  4 +--
 xen/arch/arm/pci/pci-host-rcar4.c  |  5 ++--
 xen/arch/arm/pci/pci-host-zynqmp.c |  2 +-
 xen/arch/arm/vpci.h                | 42 ------------------------------
 7 files changed, 32 insertions(+), 55 deletions(-)
 delete mode 100644 xen/arch/arm/vpci.h

-- 
2.43.0


