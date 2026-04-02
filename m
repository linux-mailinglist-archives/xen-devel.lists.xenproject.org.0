Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGBhGfBkzmmXnQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:45:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC78389353
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271839.1559851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8HQM-00069j-9F; Thu, 02 Apr 2026 12:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271839.1559851; Thu, 02 Apr 2026 12:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8HQM-000681-6F; Thu, 02 Apr 2026 12:45:26 +0000
Received: by outflank-mailman (input) for mailman id 1271839;
 Thu, 02 Apr 2026 12:45:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w8HQK-00067q-MJ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:45:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8HQJ-00FeHE-Tn
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:45:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ce64da-5cb7-0a2a0a5109dd-0a2a4502d56c-12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:45:23 +0200
Received: from [52.101.46.64]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ce64e1-42fa-0a2a45020019-34652e406e5b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:45:23 +0200
Received: from IA1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::10)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 12:45:14 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::41) by IA1P220CA0016.outlook.office365.com
 (2603:10b6:208:464::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 12:45:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 12:45:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 07:45:14 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Apr 2026 07:45:13 -0500
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
 b=vcAzMIHoWgegDxpUn/641PLBde6tHNURntOJq3CiLXNqcWwvCajepoTcNC+cyVnT+LLJlagfBooIwHA113haij53ld86+k5qgYrGso5oEn/ZQqp/pjVPfgBUA7NeFcd/U5fUSc1nn//s5BDVyxc83xhOIH1Q0l3Ls48EThadAp7ug0YrsQYzFSsn3yWEXaqlpf2CbtTBSES8K+ymlpm9nntkrG6BVBIByEi+UQ4YKyHq8MsLErIUVajB6OsFnoHIozpYjNMXOHkQaig4+yn7mKVeTM4X3ee6aqHXhNoIeAuOkm1hfjADpnGrprcERLJ96yXmd97MELuB040gnIfTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDmhePtrtBr7bsPa52Us9Qvv5pPPG/pN9Cg8adr9NEg=;
 b=pVJhIAyBszpK2s5DvdFUrCafmgYHBSt5c81/Y5teKTQFjl6UfDcvrWwPtogAsqu6HsbPWgCRC76OqMEZW5XFMxUVFYyfG+lOY0UFzYjerOzkd4TeJGweidgA+OUZJqI93TckrIOOGIQ7LgYOfBNnnsaaZ7d4WsPRT7DvWyrpqwhnn+tA/rsSKEUzepyuQxMDz1LlYOaPruboqsJI+E9YsUyRc8b4p1PkqRn1r9663/0oYbyPoe9zYvPBkQdZ7mUgz4R3Pj7x/8Mr9D6FVGmci6vQsHY4BEGjKCiUGq03mA8bSNnhpWma51xNsTIGs4YvMCHBr/nShohxqWjTXeUEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDmhePtrtBr7bsPa52Us9Qvv5pPPG/pN9Cg8adr9NEg=;
 b=xVf2gPz7e8GUPkWjnPhNjoG04aHRhtPjOi0LFMKjGDw8lCVHiwXPVD+6VzGQX7oo/u3OrY+VQanBEaYFjF0EkbCOa8XLIMuZKT5x/W+VacY1kEvURvgAYrHuDQQlj9NVyO6Gk74HOMv/2IYAL9BYVyG5EBCbP1pXYSwg2uC3d9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <865ae6a0-15e0-4a27-9537-0c5e6cb0a1cb@amd.com>
Date: Thu, 2 Apr 2026 14:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20260402110330.3580124-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260402110330.3580124-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0ce731-8a0a-49b6-f0bf-08de90b5afbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5KoNdoBUJxpPIlmSgkJ7t7bYZEdtlWceF0nUJygc3BrhUY8iA7K7ghgND1QkQrBN8QSAif0VjyGXqP37Jap1WD/Uf0OQNHxoXBprtDaku8PHni2ZIDZAKtsV8ZNhw7knJCw5Wwk29h7fHHgoyyviEV9FmNfCujbPr0Ea+JbWrxGal/qxG1ZMIWdeTLHDFquf7C+yE5s+p7+FaDxcvon8woHO9YVUOA6/vKHBttgvbLgzQAaq+vFNmU5WPNGcESHpoS1pUCD9RMOxAewFJt/3QCEsL9lrj2BJk/NwkKFvmI1ZT+m/qdk0vMQKcTGjqFCD95AAPuGVTLdjkPx7SlmFTKfpD2L7+14IBql3FfshTgx6+aPnrZwGsQWdBQq55lU8jnSUny9AUghgBqanZ7QacET9PLGPAFns3A0pbCf4CAFS3PTOIngac3OyJr5+5AXAyDaoT0tdSQ/bM4de8FCElj+WsuXS5OkuLLCiwk1tktDLZDQMxocFvSJVsA+IMBdszfBlyTbkYp2l7XYHmVml36eHXtrVT8D986i7GnlklxS/sF+2Xdxo7ispRD9MCtWB4FPP8VqhIcA4ZjNT/3lspHn+lh9uyzOX23nJ/7Vd3oCZaDK8O0y/iBHhwvTKCKOz7zrzqNg5QJFqT8wSRrxQj27EEd5ocr3eqUIiycVICGE/GBmPF7vf+4SpxbwrKOw4EiQ1WwvB7h8RradgV61ubRns5+fe0ja+2+WoewHMBk7CE4woGrWzkHBG+o1kTjthHXARRTFhR32x5tOsOF8D7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vc6/8abjOR/WhcjOXKkQXh5zx3spC3HtKeM4U6sy4Cg1KtxNMNgVfqqdRymqo2880atk5/Y6NVxN63oqAhinJaQQq9Nmr4sgN1URs/Z2rkImDOSu0heJ3jcsPnUw7XQV8nWcjgJfcgff951tL+NO/YX4HxoKviCAl4d0vGrCHVNQ07cOIJQVElbE9q+pPjg+TQ28a8bkAOLvekBxG9LFxOwsbJux6c5lyCYPumi3kKSb9bYoUw4ZkZ47a/q+4N43tcwtkT6XmzNNaOV4aRcFhhWFePttwq/zlUPh58Tli457LeZDomHDOU+U6xhqfiyIAJWEqoOK88A0OkSzsNvJNJ1yBsSFjXKECrrGxEzVk8+/7iEeSrYkp2lrQYCbl+3apMv67BVZUm0MiLZWD5PnxPP1AncKJaVaN7oTIDK6s9dXMh8b4vPXNvluyLEOUngb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:45:14.4598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0ce731-8a0a-49b6-f0bf-08de90b5afbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
X-purgate-ID: tlsNG-720697/1775133923-4CDF6CD1-32F2E584/0/0
X-purgate-type: clean
X-purgate-size: 1416
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: CEC78389353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 02/04/2026 13:03, Oleksandr Tyshchenko wrote:
> When building Xen with CONFIG_STATIC_SHM=n, booting a hardware
> domain with exactly NR_MEM_BANKS (256) reserved-memory regions
> causes a panic:
> 
> (XEN) Xen BUG at common/device-tree/domain-build.c:497
> (XEN) Xen call trace:
> (XEN)    [<00000a0000289aa8>] make_memory_node+0x178/0x234 (PC)
> 
> This occurs due to an off-by-one error in the bounds checking of
> the reg array in make_memory_node(). The check:
>     BUG_ON(nr_cells >= ARRAY_SIZE(reg));
> incorrectly triggers when the array is exactly full (i.e., when
> nr_cells == ARRAY_SIZE(reg)), preventing the 256th and final valid
> memory region from being written.
> 
> When CONFIG_STATIC_SHM=y, this bug remains hidden because
AFAICT it remains hidden as long as you don't add NR_SHMEM_BANKS banks.
In that case you will also hit this problem.

> DT_MEM_NODE_REG_RANGE_SIZE adds extra space for SHM banks.
> This extra capacity prevents the array from ever reaching its
> maximum limit while processing the 256th memory region.
> 
> Fix this by changing the condition to strictly greater than (>).
> Apply the exact same fix to shm_mem_node_fill_reg_range() to
> prevent the same error.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
This should have a Fixes tag.
With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


