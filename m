Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMIhGuyBy2lmIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:12:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE4365DE4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268605.1557843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UCp-0002XG-Qw; Tue, 31 Mar 2026 08:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268605.1557843; Tue, 31 Mar 2026 08:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UCp-0002UD-Np; Tue, 31 Mar 2026 08:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1268605;
 Tue, 31 Mar 2026 08:12:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7UCo-0002U7-Id
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:12:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UCn-00E36D-QI
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:12:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb81d8-e002-0a2a0a5209dd-0a2a450c887a-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:12:09 +0200
Received: from [40.107.201.46]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb81d7-f93d-0a2a450c0019-286bc92ea92b-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:12:08 +0200
Received: from BY3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:254::34)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 08:12:03 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::2c) by BY3PR05CA0029.outlook.office365.com
 (2603:10b6:a03:254::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Tue,
 31 Mar 2026 08:12:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 08:12:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 03:12:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 03:12:02 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 31 Mar 2026 03:12:01 -0500
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
 b=fTMfd2lGWK4vV2uXljPeUkVAzqctnzbs2JRVmtcRXWHKTNTHXT1bzDa4zlDvZD1F6COmIxvymGRRWhVwHzKVKLHVj3677SOZa0OKu3oZ0O0e/xA637v4Ly2A8cSatedmwMGMJDNaT6pcDhoqOvW6GZrcfJi7P2HZ9Yz1MBEtBLA/kWHrxsDgOha8HIU4YS4R4uM/ILSnX9OVkY2q39G20TOoKWLAb119VvtvGtU5wq3JjJ00C8CeZFmnwb+WMqBueVQuNjDSBsvN0Up3e0h1/mOBCVFME1l8cEmXsglShGofxhWGIN8GoTlI7mSDT1wHWtNhSuNOkIM7OomxN7j7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGPAd8neUU9kKoIMeNf8cyqwhc/9bQmf4M/nXP+V9Yo=;
 b=h0LTBfw35mzHpql6DvamVBpUnMz71wxr7uC0W+UfWzwk4GEXzbSYwgaxVuxt023Gsbn9/6K3tFNt4nwlZRrUy97Vhj2Vj4OdEDq+vZR1+pTmWX5PUDsTs8wga9qTBNany8zVaWYMGo8WtRGI581QraY+CumOhWl8nr8Mr8PT2K5JaQdZah2lEFm7LdXTU9MVCfDy/EYw8rzVsWKSmvGnN8yrxmwLjciQOzfmrMVAHpyQbKROW17jCI32QnVSW6l4IswzfdjdnRjWYLICvmpKMqTqTR9dKbiOxkX0Qs2rMlsJIkShBwmmzY+dcCsGi+Oz+wOEpbDEqf2XdOW5BGd7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGPAd8neUU9kKoIMeNf8cyqwhc/9bQmf4M/nXP+V9Yo=;
 b=rs2R6Dva7a27b9NYQPYP7Kep32IU+2wEqcPla3SZZBjDMrFarmLewkE+BLGAvRv/DMoHrtO2SP3pQG55qfwjOCl9bd2ZGItpv8aZhNNHQI9h4ooED43zWmnub66HgZWRMR5BrS+BI+IXOCZHOZZHN1yylSV8MJMnuAQdlLHlqDI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c8e8fbd1-33f8-469f-96c4-22d384196cdb@amd.com>
Date: Tue, 31 Mar 2026 10:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
 <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
 <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
 <618e3227-10c7-46e4-9328-3d7d981fddfa@amd.com>
 <89782bb0-d910-49b8-9a7d-83c3cf38d442@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <89782bb0-d910-49b8-9a7d-83c3cf38d442@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|BY5PR12MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: f86753dd-5f11-416c-a1e7-08de8efd311e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Yk0SsIcdbj+aKB+UEQbz/Ma+oAiV81M2kt0iA5kLtufnLyjXezioyQRxZjAXi0+FBDOJJBzZ10cTWI0+bFS/6Qqru8wlytCsBCfaO8XIoxdS1+X+X+LpoJK7tmXNVZPdJii/Z0uNVAEMM0S03Kf5N5kVnCEPSe6tT60vjaWwjebVeERVgzLk3qB+dbzaY378OBkpmfPobpp8l2DxWRyuWyHFfEXDv55JjmTT7tzJL1jqIYtSglGxDzTQXTPiIvEBHGRwenXJHn0uAq1o/EdUYPn3pAIU5qEO9itSHd7m+RU1ymuz4JdX/dGTQ4T9XsQDBkLWA35zgGqpV4F2hjrCwyMTehxWqyUh7gEBHbEH3R1PSoNWVJIFM1kTxStdeVKkFfHTuY5u+wTXHbkVWkRUp9dK5VARXSfw1hwRag3a6u5s1VZtq0la89IWz7WbpWF//yYpKUtvKx1BXiWX/E+Y9p+OPRo4jc0P3Qmd2S7+js9orhWRWW2pZH2vfE9FW24BIlI4Uo6bk0ORSszzmzd2uP+SvQUo8HWdE0RrXEa9fWpAsSevOBUIa00tzTJd5C4nDvhI6sbTC807rEO9zKOI0wCfNTZ/8f5LvbHAqRn9AVdRjviIbeHQD0iSl4WUCrXMXg7KeBPpfXUcUuid2H787tJyTYp6BrG/ebeVzSbW3l1BFpfaei6Oi1aOcgZzz0dbOQ1AyAR8qk9YHkpntllK4/fLlYmWRTFdDN+F54h2QoxUv6gWcvXCMBoXZ5wfF9Op9wM0emCigmZrqX01v3Xq6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S+fV85UrTqPrq4xqWJjxFqhlG+9m3uE5iieBLhYp6EhhDlXYYWoWk/hc7Jq9TB5iWHcFaDz/8W1nseZKg3Kp4sD8bG5TDVuFnciFy6JbdsRLJZxIt42DDrtALbg0+gDrwuSVv91uhVBHmZerNhMbbPqrAzHFQrFjWHI82BPI9N8HrjG2T/rYkZ4Dm9gcIXVb1hKF0qMgv5TcFFar9Yzwp6RTOi/jj2uzaoZYRB4wogwkQ/Mc2fdZem9h1zRFMPCFgk3oKvILCJ2ERiecBk94QfeSYcsNDaTRNinqJbZ2fteiWOi0NV20COWxB+PZGrnm/wIG5C+23tcthIeyy4HvJaKFQmGkkpt1bFbVUglhNoN8ALM3c2/sNAuTfF2z/6WJQogljMgqhHOAOKEPZSa2ONrR4YHKUiP7BAVecIa/+rgqKDip7bB1xhObP5qGL6b3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 08:12:03.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f86753dd-5f11-416c-a1e7-08de8efd311e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
X-purgate-ID: tlsNG-d25034/1774944729-F5CB2734-44C5FA0D/0/0
X-purgate-type: clean
X-purgate-size: 4638
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: AFEE4365DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27/03/2026 13:23, Oleksandr Tyshchenko wrote:
> 
> 
> On 3/27/26 09:30, Orzel, Michal wrote:
> 
> Hello Michal
> 
>>
>>
>> On 26/03/2026 20:03, Oleksandr Tyshchenko wrote:
>>>
>>>
>>> On 3/26/26 18:50, Orzel, Michal wrote:
>>>
>>> Hello Michal
>>>
>>>>
>>>>
>>>> On 26/03/2026 14:15, Oleksandr Tyshchenko wrote:
>>>>> Xen fails to construct the hardware domain's device tree with
>>>>> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
>>>>> (e.g., numerous reserved memory regions).
>>>>>
>>>>> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
>>>>> required for the generated extra /memory node. make_memory_node()
>>>> Where does this extra /memory node come from? If this is for normal reserved
>>>> memory regions, they should be present in the host dtb and therefore accounted
>>>> by fdt_totalsize (the host dtb should have reserved regions described in /memory
>>>> and /reserved-memory. Are you trying to account for static shm regions?
>>>
>>>
>>> I might have misunderstood something, but here is my analysis:
>>>
>>> The extra /memory node is generated by Xen itself in handle_node() ->
>>> make_memory_node() (please refer to the if ( reserved_mem->nr_banks > 0
>>> ) check).
>>>
>>> Even though the normal reserved memory regions are present in the host
>>> DTB (and thus accounted for in fdt_totalsize), Xen generates a new
>>> /memory node specifically for the hardware domain to describe these
>>> regions as reserved but present in the memory map. And since this node
>>> is generated at runtime (it is not a direct copy from the host DTB),
>>> its size must be covered by DOM0_FDT_EXTRA_SIZE.
>> Yes, but the original DTB should also have these reserved regions described in
>> /memory nodes, thus taking up some space that is already accounted in
>> fdt_totalsize. Are you trying to say that in host DTB, these reserved ranges fit
>> nicely into e.g. a single /memory node range (i.e. a single reg pair covering
>> most of the RAM)?
> 
> yes
> 
> 
>   I can see that it might be possible but the commit msg needs
>> to be clear about it. As of now, it reads as if the problem occured always when
>> there are multiple reserved memory regions. That's not true if a host DTB
>> generates one /memory per one /reserved.
> 
> Yes, you are correct that the total size depends on how the host DTB is 
> structured compared to how Xen regenerates it at runtime. So, the issue 
> can arise if host DTB represents RAM using a single, large reg entry or 
> a few entries.
> 
> ***
> 
> I will update the commit message to clarify that, something like below:
> 
> Xen fails to construct the hardware domain's device tree with
> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
> (e.g., numerous reserved memory regions) and the host DTB represents
> RAM compactly (e.g., a single reg pair or just a few).
> 
> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
> required for the generated extra /memory node. While the host DTB
> might represent RAM compactly, make_memory_node() aggregates
> all reserved regions into a single reg property.
> With NR_MEM_BANKS (256) and 64-bit address/size cells, this property
> can grow up to 4KB (256 * 16), easily exceeding the space originally
> occupied by the host DTB's nodes plus the current padding, thereby
> overflowing the allocated buffer.
This reads better.

> 
> 
>>
>> Another issue is with the static shm nodes. User specifies the regions in the
>> domain configuration and Xen creates *additional* nodes under /reserved and
>> /memory that afaict we don't account for.
> 
> Yes, you are right.
> 
> Since these SHM sub-nodes and properties are generated purely from the 
> Xen domain configuration and are not present in the host DTB, they have 
> zero space allocated for them in fdt_totalsize.
> 
> So we need to redefine the macro. I propose the following formula that 
> separates the range data (16 bytes per bank in /memory) from the node 
> overhead (160 bytes per SHM region):
What is included in these 160 bytes? Did you manually check all fdt functions
inside make_shm_resv_memory_node?

> 
> #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
>                              (NR_MEM_BANKS * 16) +                    \
>                              (NR_SHMEM_BANKS * 160))
I think you only accounted for shm nodes under /reserved-memory. As any other
reserved memory node, they are also added to /memory reg property (see
DT_MEM_NODE_REG_RANGE_SIZE).

~Michal


