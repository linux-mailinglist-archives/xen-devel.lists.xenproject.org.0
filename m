Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEIcOFtX82k/zwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:21:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF54A35CD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298143.1573672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQrZ-0001Nd-IM; Thu, 30 Apr 2026 12:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298143.1573672; Thu, 30 Apr 2026 12:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQrZ-0001Kz-Eu; Thu, 30 Apr 2026 12:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1298143;
 Thu, 30 Apr 2026 12:51:28 +0000
Received: from [195.190.135.10] (helo=mx.expurgate.net)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wIQrX-0001Kt-Un
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 12:51:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIQrW-00CVNp-AJ
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 14:51:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f35048-bab6-0a2a0a5309dd-0a2a4506ec80-48
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:51:25 +0200
Received: from [40.107.200.13]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f3504c-7371-0a2a45060019-286bc80db0ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:51:25 +0200
Received: from CY5PR22CA0045.namprd22.prod.outlook.com (2603:10b6:930:1d::22)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:51:21 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::5e) by CY5PR22CA0045.outlook.office365.com
 (2603:10b6:930:1d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 12:51:20 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 12:51:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 07:51:19 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Thu, 30 Apr 2026 07:51:17 -0500
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
 b=oz6eXslnAFdUm6OgZnuJSkfFdt7SB0INlN1PjZsm3LldkBPT1glZHT7/oxKrPzXscWv2qqCbxFh9MNjfAc1xX0QoM3aIEU8606QLERS4UoYQcVTa+rs2EXe/n+9B4Lvenj7qVKlmXpOm/EllX1P1OhMt3XfG64AbbyA8GCCtwjElgI6I2nYkSLxzktruoS2whe32lkhIW9EP4aQAbIN2NpGpilwOjaa7qW8jN+v1FbdPYxBRX+JlvXh4ls61h0vhoXYuzWAN/UmyIwmiVdLUV0uDFp3W5QZG4H0yM6wm3OHV5eHa9NZr84qzP8KHdi5wpkrCAQSVJbzbBjB7uYiMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNEstBQPNeoHkrfG8LasS4CJg+BB5EGSRZhhRuwPntg=;
 b=FCMCqRLeo1E6KPpkM9LDKo6Es2ACyBmrkPzEIZSECSOCt1SweP03eH3MVXyuoWrHBfjS8R0/7MSF16ohGysXvCegIsSKDxowlWJNhrybesy+F1+MeXv9ouz5CUxKqZpGR8CM7MoCUdVHswSRPVpoUc+zLHgf76t1qDqxZSYRDLzXLnJsnsUhXvi+vm6MHiI6NT35e1v33wBHznlT9/X+oancOs1n0PK0nw7M4322BtuKqS9UrKbLa13FAgXlpfESiFgVYmBRqW0ns/+u4eoFaYL3A687oWIDO3ycX+BDK82ZqhCIt2GDjueykpy13hg+Z/K4jXTy3Ni43hL6aP2hTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNEstBQPNeoHkrfG8LasS4CJg+BB5EGSRZhhRuwPntg=;
 b=Yun8epL2EYc+PDAmsKb5LyY5SJW6S50/y1SeVWKU07MBoNIokfaPY/uCPkQuz8GdgJIb8DvINnQGsRtHzvvt69pQPambERNsIgl9iJD5Gu93jlOl/7KkJtBGtRnTymW0GW4kIQ8V5qlTRJCfVWb4e+zg6c/tcfuRhDg2bJReLRw=
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
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 0/2] xen/arm: Improve frametable allocation
Date: Thu, 30 Apr 2026 14:51:01 +0200
Message-ID: <20260430125103.401811-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|MN2PR12MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb50426-da8b-4e96-38a0-08dea6b72d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dwfnOdnChf771PXpbMcahIfPZ8xDhA68Pdan1YDF5Mc66umpSsjMbMlnqv68sQoHSN2oqqcX14I4JdrMmGLTF7EKKhrnSwiQXhNdsN4ZU9rLvhx+Bw1y5lorUzoFqER3scNXIOdFZulu2N15UR72/540DLHJHHvrLvjXWOjl4qS9iX+kE5QO77z3QApmSd8aHc9d1DJqBkXdOmtKlsXjtlf2CM2e0FEGD+uEtWrOwG9sD1gSSzYj6y899v7ScyyJtWQV/67XmIIgAVuZYmkifg1wadW8NgbokRPXrugp9GZ+Lnk6e+YbZ6N4Aj4Fonsoin85oWggjKdJ8mvPvBNttWz9C5bn9u57BiZOw5sZWJp5WwP8Ks3n8A/BdOuOi4Fus39QjqqqnpwAEtRW5s1jt+Wdb4m+8cDMN45Byg3Dy9Ur78RRtx28NjokLak59nKLjeaiPWBffkpdw7FqUtq/+mtV0TRjE1zJnsXWL9XxQRdVe5WdNFnh93E235BOqckCqL2wCsq60vnegxcfzpvG0WEV89XOZvtkhsI+b7Iq9r8tJ5SpOo3WeK9xF9WFz8O9svod0kcSHU3DWATZeYJxK+1Hx+TC6tNPZf57JbvZ3js3SoiV7kJ6ZovXa17Knxg3uFcNncGcGk9jkhnl1QPCqMwN6tA+PqqvPNH2SKqQgRCyZwsRx8EYR1CUG6qxFUb1aZUJGrUoxL7Abu7aCLqZFIw2ga1ruNcTyK0ypmwpjIJmCymmGjqIw69z8Mx+aizhAWZIeR55yQLwOp/AlCz4tA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FyUO8UB13w8YPy+p3oOpxKFWy9Jk3n8oyCyr6JnhD+a6baDVdxT6HpLWRqccBcZH0HdOUVfoT7IVoM0rWJPc5oL1XdBt2aWgweu2kr21RRWFYdoaCqaNxvK/ZeL2Wm1i70R2N8yctVca351mF0S0PCQJC+uZ/Poeh+Yi/R7K3jwUFl+ZKldJjutgMT7Oi+ZBS3XykjnHOJFcUxNFeWzNkG11XRW0CXKB5pU37YZvj0YuS6Ng4l7hLtvSJH5a+mIfFlSNjlMAkM7IoN8+9WpkrXey8b66EFURBISh0nlR0NUt7jx7OodhPDOqHg6oh+bpAv41vJoBesL+emcneIXDlfiD+5eAeDUfmWX0w3L2Dpt6PQ5wua7EOakQ84RSgjhARV0r2DGuiiyisotA2dFC0bo4E6DV10LEyPEEEN3dRcgMQYiptirycPxZFONVt7n6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:51:20.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb50426-da8b-4e96-38a0-08dea6b72d34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
X-purgate-ID: tlsNG-16d1c6/1777553485-CED72D75-03AA63CA/0/0
X-purgate-type: clean
X-purgate-size: 868
X-Rspamd-Queue-Id: 7EBF54A35CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Michal Orzel (2):
  xen/pdx: account for frametable_base_pdx in generic
    pdx_to_page/page_to_pdx
  xen/arm: skip holes in physical address space when setting up
    frametable

 xen/arch/arm/arm32/mmu/mm.c    |  3 +-
 xen/arch/arm/include/asm/mm.h  |  9 +---
 xen/arch/arm/include/asm/pdx.h | 21 ++++++++
 xen/arch/arm/mm.c              |  3 +-
 xen/arch/arm/mmu/mm.c          | 89 +++++++++++++++++++++++++---------
 xen/arch/arm/mpu/mm.c          | 23 ++++-----
 xen/arch/ppc/include/asm/mm.h  |  5 --
 xen/arch/ppc/include/asm/pdx.h | 12 +++++
 xen/arch/ppc/mm-radix.c        |  1 +
 xen/arch/x86/include/asm/pdx.h |  6 +++
 xen/include/xen/pdx.h          | 17 +++++--
 11 files changed, 135 insertions(+), 54 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/pdx.h
 create mode 100644 xen/arch/ppc/include/asm/pdx.h

-- 
2.43.0


