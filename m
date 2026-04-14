Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEAwMhU03mm4pAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 14:33:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C083FA02F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 14:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281721.1564607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcwH-0001eA-5A; Tue, 14 Apr 2026 12:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281721.1564607; Tue, 14 Apr 2026 12:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcwH-0001b7-1n; Tue, 14 Apr 2026 12:32:21 +0000
Received: by outflank-mailman (input) for mailman id 1281721;
 Tue, 14 Apr 2026 12:32:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCcwG-0001b1-8V
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:32:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCcwF-006n5w-Cm
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 14:32:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69de33d0-2eae-0a2a0a5409dd-0a2a4502d9ec-18
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 14:32:18 +0200
Received: from [52.101.56.65]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69de33d0-42fa-0a2a45020019-346538412ef3-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 14:32:18 +0200
Received: from IA1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::11)
 by DS4PR12MB9771.namprd12.prod.outlook.com (2603:10b6:8:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 12:32:14 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::18) by IA1P220CA0022.outlook.office365.com
 (2603:10b6:208:464::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 12:32:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 12:32:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 14 Apr
 2026 07:32:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Apr
 2026 07:32:13 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Apr 2026 07:32:12 -0500
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
 b=moa+UiFDVn87tKqQELVrX0WfDG8Dq/8yDd8FCydnfu9bLqv91+cDaStld/lRoKkoBw4hfnTb4KNkx0+4D7xAJk5c+3JrG5GHXj7D5ZLWi5i0W6z5NiOj2C6clVhcTwVb7YOhDCpLJ6EPNTp71wBYYOr5q2fnVd07PliCsLPIRxf4F0VVX50VgiAM1fvSXxiO0foLG+4EBVvJXb7M3RDNozoN7PdHuFS1tFR80Vya7ilvLPoGp6h5bJu9bpwDpeyTN2tZ98DRnxpmFkKZC2V2nmjM6BQJETq49JjZxvizftJ007IHpzW8be3aDRJIMF5AUJsCPT8M1Iu+OURTbUej8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67heYYZyfuwfpEymd1WEfnbfit7+2H/jJm22KDeSEto=;
 b=A5HRlrXraoVv7r0JwDhbm0IUJaCEEaXLganpP3IgQIQqdO8s0ELagsZ2BtdRYzuR/Eks37583Vy3XUqjqENUFyQH8/sSpYYmKivP7wRA2MpwajKd0JSt/NC/wiFIAaDo2+UNXw0TVi8II4n0vaWzo8fPtpcQ8n+PFjVB4yqw/cw+swu+HOHR78B1CUC4AF489mejeu3qLfXaDX3XaV0FnkPt2V7udkCCHcWLVWA5bC6jIhQub2G9HU/IUiBqo1s7FwwXRNzURu1Ho1mknTYeIyg29IpTVuS+qzP3z4eP8GALdDxN8NofgoZqYZZuylxAsDb6huv4Fnncz6IwMPXTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67heYYZyfuwfpEymd1WEfnbfit7+2H/jJm22KDeSEto=;
 b=zTM8KP4H3e9VH/m+ldu/GbN6hnGOj882MaYhEAzOmiw6y08JRhoRUN9BMIcwrPhUDTUv248pSLcb1zculybEo/n15/JzU0wtzMGqiadnpQGbwcxYEP8ArjIXClW4K7+h5L6r3f0x6t2StnJxvXeG10eQ3UpLbzTFvRPtvlEC3lM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <04a5356f-17ba-4aa0-95c1-045d8efffdb3@amd.com>
Date: Tue, 14 Apr 2026 14:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Extend eclair-ARM64-allcode and mark as
 gating
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <20260414111656.72939-1-michal.orzel@amd.com>
 <68b7bb7e95e6ae92b976c98af1a7cab9@bugseng.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <68b7bb7e95e6ae92b976c98af1a7cab9@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|DS4PR12MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: f0613454-3692-4d40-f133-08de9a21db75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZnhYj+fo+v/uUsAezx6Pc037KnRc0uzIWRyQG173XIN9uBKXl8FMXOeISaHa+p9KOIrGNp4EEdZeutU4an3b1d/cjQBc5kSW+V9y8J6jkySxyrzlZzhssXA43Cq2+4nPk7PIrB4looPA79GpejqRseBE4CxGdr0nKGT52oSGjWIOdyK9U+mz5OobI2PV8LU9Q8QSiDet3Ik5G1SrSClndrT3Nt5///ZBZF0FsM9cf87Jo/QuSQahJEwzl2Qs4Cr2LxSvsC3LSpN9ZjDzVTU8XFFsoxST3TRh9ShgPsD2u+YAwFmgmypuvFcBaxZyDSj3b/q6aToNZ4f8+0gz6tVpI06SfhBHac9BbQhdSypE5KMrbtV4U9OQFyECKGD+Tey17HGPCKGq0zkEcvsuV3yTT2dd6Cxa7Z5lP7ohKiDiZmGGd7rv1EEuPfZpAQlJG/6dHBShNqLyFtDimeBMLeliQi8XNVak1p3tKqA5Kqi38q181zTeud5FTKTVFsyiAbCAj0Oo7FYZJqK/qQiIouO5awwyG9S0MpkWnqa+V11A2VZWgf4rz/jDQ8m2PgOFBSXvqJe5mk+MUpl76TyMd9xGlrGYTxUeuQ9Mi67Yno7XORbr+IkKIYccJP9DCY6EEdFiZpdJKe/zfJTY0VkeCiCgd98R+WjsmKSMF935Vw7ZuE1M1yWA3XYg21WVn5oZa6RRyQxeUC8zI64owrhNhrP1zpFOKBgIo1unm8OIPhVnNkE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0EPhpcqlV5Ohk3osjLvOlTf6o0WEWAFECRV8GNvlrRQzPiyD585IZLkPTI+eY1H5n4DLhOdpHyshCnSGZjFWCYeKPApmoV6Dmw3UZilIShmQbas9SccGnOOZ+uPgmx6f3rOdR16qlwZfnPFWBlsmzHVlNylQSxAdHS/V7PP1vyzqje+7N90MITJIOO+Goj6bq5W+KDh2t19oIrLusv9Lkfm/2+gxb3uRTdRuQYORzQ6/IrXUECpwWmkj5MZxe+GLnNdCAZPD5UmkaVP0BC4azz1ytQHq7VkC882HtzT4vdZuS/ddkO7wv2kGY8qpMdieSciFfS8k6mhFsYg11ccf5WBLktjwrT4aYurysGA/vYXLRdQk8fW8+m8pDAAQD3XUn1E4lrZufZzLWad7drGWIAm4C7YxbEH4C53jAPBnP45UcmnvpVPwu98Xr/+ffgKQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 12:32:13.9293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0613454-3692-4d40-f133-08de9a21db75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9771
X-purgate-ID: tlsNG-720697/1776169938-447CBCD1-74EEC9B1/0/0
X-purgate-type: clean
X-purgate-size: 629
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bugseng.com:email,gitlab.com:url,amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 31C083FA02F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 14/04/2026 14:04, Nicola Vetrini wrote:
> On 2026-04-14 13:16, Michal Orzel wrote:
>> Extend the job by enabling static memory, static shared memory and 
>> early
>> printk features. Given no more regressions for clean rules, mark as
>> gating.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2451527401
> 
> NIT: pipeline does not seem to be public. Other than that:
Ah yes, my fork is private, so only owners (i.e. committers) can see it.

> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Thanks.

~Michal


