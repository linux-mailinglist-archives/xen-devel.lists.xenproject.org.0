Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DrXHwWnCmpy4wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 07:43:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C27566618
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 07:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311458.1581580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOqkM-0004W7-1Y; Mon, 18 May 2026 05:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311458.1581580; Mon, 18 May 2026 05:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOqkL-0004Ug-Uj; Mon, 18 May 2026 05:42:33 +0000
Received: by outflank-mailman (input) for mailman id 1311458;
 Mon, 18 May 2026 05:42:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wOqkK-0004UY-43
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 05:42:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOqkI-00EXhy-R9
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:42:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0aa6bf-5cb7-0a2a0a5109dd-0a2a4505b9f0-18
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:42:30 +0200
Received: from [40.93.195.7]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0aa6c4-aaa8-0a2a45050019-285dc3079b5f-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:42:30 +0200
Received: from BN9PR03CA0077.namprd03.prod.outlook.com (2603:10b6:408:fc::22)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:42:23 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::ab) by BN9PR03CA0077.outlook.office365.com
 (2603:10b6:408:fc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Mon, 18
 May 2026 05:42:23 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 05:42:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 18 May
 2026 00:42:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 May
 2026 00:42:23 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 00:42:21 -0500
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
 b=SQNEAlT9ronIAHSwuC5bzcksG5to1H+Oz+VHH72HLuFGUy6Ba/IXh6aFMtLOsi8do4sIGtntXwrMqxLN1qtuLeO/ZX81KvnUtYW1QQmieN97uT5vH9/Zx00UaStlw9fL+G0FuhVjiahogd74k0ItOxjBeJwwLE6Wtj6Yp7omEMlOBRHD3ajkJcavud2ZUk8e+bI/W2xMbmQ18oV+Rd6+IZiNgDjecOwCn8Ab8TSbr2k83OuDYx9bFgEmHp9tGMceJ2JrdRoo3YEVfR43hSL79AhP9ilYxiylByReh3pFEINag3x/TpAE1IDeGv/TJEiC/I1Q1u31PW9fuQlICdkMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8KRYEoASOjstQf7k4/jjLmY7pzeWH549moAVDbBBdU=;
 b=fvMGLSqV8SIXuTORXw8JB+o01/g8+LtFSYfO9HN6S1SMpKGtuQHVF2hjitOxM6+jzngErJHuy191g/7J16bkltmBudfVx/PMt+McCHYecxUKIedcIO36R+oKweo6v+m3gPy9gzGHNQHOIoSX8OustZuy6Inywu9iJn7UY+Lo9M1GUwd20FT7vmNr0DC6gFCa5W8dab3YdKl+eFc6VDZIKjcEvcO3mYMOxowHsVC4LheqfT7z1vABJXAxZfNRUd21vxWsH3XZ8wQ/bC1bB5ZGD6JjtAnEWGjRDszDCSozHRKMj/o24NWIuidqD+wExe0ZHZC1BPXmH6jAabdD8hkSkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8KRYEoASOjstQf7k4/jjLmY7pzeWH549moAVDbBBdU=;
 b=mnZzKwzizaDFZNfe5cQO1vsH5f2VYHdwap5Q7FEuC8rbX8tCXAILk3KR817WvQcqam8mth6aoNalaWvrOSrgvq3Totedi14bADHk4b1NtIcUnEw5rXBLQhXBepHF7Vzo1r1jk+tLqR8yMU4xSjr1SyT6AWAV/ZXp0TYp8Sgr1Vk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7f5c613a-33f6-481f-b3f3-d627833a461e@amd.com>
Date: Mon, 18 May 2026 07:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/common: llc-coloring: clear color count on parse
 failure
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1778925998.git.mykola_kvach@epam.com>
 <cbb02d6c5af6606ada3e477e8d45d730ffe72723.1778925998.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <cbb02d6c5af6606ada3e477e8d45d730ffe72723.1778925998.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH3PR12MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: 359ac5b5-1c48-409e-687e-08deb4a03c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|4143699003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iQKH2g+UDbn2WYKPhEkDg8a+JNV8xm1dzfRYdcXefss7RC8bHGTeWQc4ADsGE/mNvgCUQCo6CD3ib9Lyzd8GZxQ2U3cEfy4B7LXARMdxMbm7+bccyH6cBF8BnC6GAQdpRFdMQCgqGanbT8ZB0qjpFdF6Ca9Q+QxF104GfkDODWuSmY5I20UjuHtlNu1fmvSY4e/YS/Ay182Mt1ulzMXVHVbEPb9MFZqxoHqY+FazqdHmJ0nfshJKu9L8UIVii4rX7k7b9XJ+jjRDocdB6tqzyOE5aZwmPNrFFcxqSVb4VuoXdV/P2SkRDH3TA63bAquWNqUnJw2cpsglOHE6Ko9StnE53yOxhFTl7X3gRqU4Rs26wlWcBzdTvudqV/JYLv5sEdaO3cW3WHFod7oYSpiazSgCkeZDIipjzLMAkwVlGgLDkJQUFPGDgkdubhrDnKWc+yDeAi2U9CNRfjxbit7a10JdvKpLVFp5aG4NgWR6fnJY65zrcYnyqGkxoQhPkC9QIRbtyKGzhW7GmSr325znCkjK2jPY5X3UQuW7/ij1Nk2mEC98zs8YK8h4LWMskggxE5OR9KBVqn8QyniqshFhTpN3iuCi7/EDbnVBc4aaPq9Oa6dCRRnlydKJwOrX1s3NGDCiS9kWe+JJfv3DP7QE1C4tZtJZloD+mYagAjbJo178cpLfjY7HHbiCaNwlEc2siPsR5v5KuAvbbfO2KNd0jFd0wL3uALI4zApCs083eAk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(4143699003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5fdViT7kNeKzesb0QTdBdYa2YWeEDaCivev3Z80JcjnrAnBxeyOCaLxDsR5oj2f/UwxqWlDRzSE880VZcj5mOjVR5S15J7XrrO4ApzvqYhYZ8N9dQYjobbKu0RxxMrnZUe7f+vDpRjMxuDTYhXcKgnpjRf/kSEvgNMM8ygSxT/2b102ckR/e4MPl+Y6WosZvMncJdFP63wNIT1nKB0m7ybVi/Kavp6CDKZe+tZhOps9NEXA6qqsBL89dCqSqsHY5MAqQZz0kZWgwDSeTIngsChY1LcJieJ9aXU2bWtY8Xk0deYsglOTpMzqzumpKZ5TVUgM/pnbZJt1IjCqa6q2FRBRM0oVncMEgCKzwLVZMAZObADl4zZFq6K58NipFokVgM28uJzUvAN/Tf/FqagBkeUNPdDNIz+ZNPv4/YdCJ0mQKzieKFJO6OQGfv60W6o0S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:42:23.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 359ac5b5-1c48-409e-687e-08deb4a03c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099
X-purgate-ID: tlsNG-c201ff/1779082950-D8B78443-3C2496B7/0/0
X-purgate-type: clean
X-purgate-size: 756
X-Rspamd-Queue-Id: D7C27566618
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Action: no action



On 16-May-26 17:03, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> parse_color_config() updates the caller-provided color count while
> parsing. If parsing later fails, leave the count at zero so callers
> do not consume a partially parsed configuration.
I would also add for clarity:
  The bug is reachable in practice: cmdline_parse() ignores the -EINVAL
  from a custom_param callback, so boot continues with the partial
  xen_num_colors / dom0_num_colors that llc_coloring_init() and
  dom0_set_llc_colors() then consume.

> 
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


