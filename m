Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIZLJ0Ac52lR4AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:42:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11534437118
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288306.1568586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF4o0-0004Wi-G6; Tue, 21 Apr 2026 06:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288306.1568586; Tue, 21 Apr 2026 06:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF4o0-0004Td-Ch; Tue, 21 Apr 2026 06:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1288306;
 Tue, 21 Apr 2026 06:41:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wF4ny-0004TX-Gm
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 06:41:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF4nx-002Pki-NL
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:41:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e71c04-bab6-0a2a0a5309dd-0a2a4505dc5a-44
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:41:53 +0200
Received: from [52.101.193.32]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e71c2f-aaa8-0a2a45050019-3465c120b588-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:41:52 +0200
Received: from BY1P220CA0043.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::11)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 06:41:49 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::7d) by BY1P220CA0043.outlook.office365.com
 (2603:10b6:a03:59e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 06:41:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 06:41:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 01:41:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 01:41:47 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 01:41:46 -0500
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
 b=xURz+Wp7TBUI4HY/F7dKhuoK1f7sZb0U9lu2WhgnIMJDNjz1PKAew6VyozdtlSUh9FMSnvaqRHNzObFW52xHFfjpdEzBE05cQORTKEdtrjFL7pLyom5OyqPbPBnE9pwcGiXjCLfLD32XHN0WHH0uOL16LbD6/QBmguxL4ziSVfvQ0TZ4qLhA594sX/vy6RVQDMEsTLDuue3HoyFrGySWM4geP/AfnI/UrnN3PKsX+98KojKIBCncjEx1EnBDmvVsU2zqkf+gxp7N+YRFP7GwVuC2J6+lPLnr/WP09M8q2VRLQ+iGCeRkYb+jMGJPGI1GIKxa0suDCLk76uKyI43qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXtxGL3mNOR7yTJYPCO6B4KfUixMlSqaYU8wmwhUh4M=;
 b=MVC5R5TON03ptjCNspIvXNOJSeW6qDYyLzTNObt0aiYbJDQjJySMs7B3cVXBlMVHs7qzCgjP0OvbNlXWu7enevtD5SUpf6O8HUpJxHKFwDKQ/txykD/c/8tUkhM7E4fc4pKRvqFf3FfSkHFd3/f0bAw1PTdKuM+fpCeHZI+eIbDD++NMRx5ufwpTv/QoNgUcj+VT++tcr/IEeKZe6OXY7xsR0XBfc0rTF3mhbvtI6JfFea/4Tvukv2imdaMUSapjyZtSRWe3iCd0wMqWo54AcUYFKWTZhp9uRK3i664rtnQzp9DFXe+BcouiJtstkSJyG975PbTvEybolIIBSpdRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXtxGL3mNOR7yTJYPCO6B4KfUixMlSqaYU8wmwhUh4M=;
 b=hwI12HjHulSY+gz159ZBhODP6GFiy50W8f9mpn5LSEj+d6JOrpJnTHqMzyJF/Y9KpVn+4gUKBGISKBsOKLYLch9jWk5RccGM9Hg/1rfblSClIOIoIMpYyagkRG5QZbz5HY/558uxH5q1H9rcsWb7Je9lawPQQInw+K4DwM8RKIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <137bd391-926d-4047-a760-638f2e58b99f@amd.com>
Date: Tue, 21 Apr 2026 08:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Improve hwdom memory allocation for DMA
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>
References: <20260417091155.39653-1-michal.orzel@amd.com>
 <412A9DF8-6F5C-402D-AEBD-88E6DE139E07@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <412A9DF8-6F5C-402D-AEBD-88E6DE139E07@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c7a0d4-9313-4443-fe7d-08de9f71107b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8IiOGSJHTkObOzKsWS6H/9WmEYJM1CVdGcFuKIRpM0KrrBpPF+9OCRDZaXDoHx9JL6QuzW6PpkZ00uuOqfZ/8Nw2OC2oN9dKw7nl5RRXUZjPpZItFo2RntKdM3Z2OgSqKCJ4lcgxWdN1KwuLesLIM4Dpmv3utS+7pbk9phpVXkqLlm0MCi4Z2wrPpPZpXJSm66d+OF7spjU4OGF2jFBwtYneEuihgGTmpwITIvZmNY1zOxrTGe2ZCAoHw9GFmXwzi0i1uKnyV7QOFvIhoP84hSf65NQfSuaekrb/Wsy4o4jQiJVRQvoAW6IXEESx1LWsydzsyHoyZbTu0hHrN12aheOhlNrIJowQQzOQQkOJREOP2rVWn2fWI6GRa1NjabANN0TObCg0RvTjAMtgzT7K2Sggl+/9X/h5ALuVoBlgBoaTcW+q25NcTg7e9CfV6zoMhCBb3fiHqElt+J6WhL1kCaGYh2Rh3zn1nXctnSduyyTB25Ea5lHH8lwijoPeH/7D4obSCZ0zup30w0ypeUZCr8l4A2YXkz1V+NzXDhs/M15wopbbQnNUJrw8PXz9X274/cvSz0vAf05knFNcmJxsOMImUKIys4ffhv/TYJmcN/B+JtcE+jcBJW6mPaJJEYpE1WPIAdwvamjM5n4ywzzWg83tzS6Dffj7XWtjknlNRHloDhwd4bK0O7gm3kPMfEN42LTMKyrK0lsZC3ByZcOUIIxlLzt29cxpA8H2oK0TeH8wkKbpSYPo2JGE6Sh5Tw73i5dTrPCYG0N3Dc1WuPSHHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SmcPBV49rqBpTcfAUdCQthCHIVBp4PkoDg35AcLgpQpL2mbZJP2UprVEpVUozlozl1VMgn+cv9YCY36SX1K+s+ZzxTthh+PblF+sCPAhK9BdUAHGkQ/hufivDGSfrzM2S96LiOlW/GigUiqpnn5d9Xyq6flZ0mS8Upk0sQMrt43IjEwdIDXaIYIrLSVnhA/ZzMJ6cnIuXco4W0PfkFU3H1fLKRJqsctQQyR5nfjP2CZS03cEAtQhBpYF10gHYrDopWg8gbjKvt9YbFOaph1SE+ohsJuMgU63l6wFVHyOiru+sn9iXvhgM7lyjs5XDPTuusKtahYG4qKIEgDTXY9gco7AsYdNCbG2tAkpU2MjRpvYF8eR0L3dBCY/CPst/6yBdUHi5fU7Oy4V6VHjCsrHdLiuoQOqiRTSpsWEdjPe1RE9kqxC7hRi1PdbQ5XDxt2B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 06:41:48.8761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c7a0d4-9313-4443-fe7d-08de9f71107b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562
X-purgate-ID: tlsNG-c201ff/1776753713-E09AD443-3D178CB2/0/0
X-purgate-type: clean
X-purgate-size: 1763
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email]
X-Rspamd-Queue-Id: 11534437118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/04/2026 16:54, Luca Fancellu wrote:
> Hi Michal,
> 
>> On 17 Apr 2026, at 10:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> When LLC coloring is enabled, the hardware domain gets memory from
>> host free regions rather than the fixed guest RAM banks.  The previous
>> code sorted these regions by descending size, which usually causes
>> high-address memory to be allocated first.
>>
>> All allocated memory could reside above 4 GB leaving DMA non-functional
>> for devices with limited addressing capabilities.
>>
>> Improve the handling as follows:
>> - Sort free regions by ascending address instead of descending size,
>>  so low-memory banks are allocated first,
>> - Skip banks smaller than 128 MB (or the total remaining allocation,
>>  whichever is less) until the first bank is placed, ensuring
>>  place_modules() has enough contiguous space,
>> - Extract the hardware domain allocation path into its own function
>>  (allocate_hwdom_memory) for clarity.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> xen/common/device-tree/domain-build.c | 152 ++++++++++++++++----------
>> 1 file changed, 96 insertions(+), 56 deletions(-)
> 
> It looks ok to me, the only thing is that if we have many smaller banks < 128 Mb before reaching
> one that is at least 128 Mb, we won’t allocate them and loose them forever.
> 
> It feels only a corner case so for me it’s ok
Yes, that's something documented in the commit msg, so if we ever face upon the
issue due to that we could revisit the implementation. For now, we haven't
observed any issues.

> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com <mailto:luca.fancellu@arm.com>>
Thanks.

~Michal

> 
> Cheers,
> Luca
> 
> 


