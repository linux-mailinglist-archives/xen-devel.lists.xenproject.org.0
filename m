Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47EAA86017
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 16:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947436.1345061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3F5x-0001vR-HC; Fri, 11 Apr 2025 14:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947436.1345061; Fri, 11 Apr 2025 14:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3F5x-0001sk-EN; Fri, 11 Apr 2025 14:11:01 +0000
Received: by outflank-mailman (input) for mailman id 947436;
 Fri, 11 Apr 2025 14:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67/P=W5=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u3F5w-0001se-G9
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 14:11:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2415::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a7c48b-16de-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 16:10:58 +0200 (CEST)
Received: from MW3PR06CA0017.namprd06.prod.outlook.com (2603:10b6:303:2a::22)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 11 Apr
 2025 14:10:54 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::5c) by MW3PR06CA0017.outlook.office365.com
 (2603:10b6:303:2a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 14:10:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 14:10:54 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 09:10:51 -0500
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
X-Inumbo-ID: c9a7c48b-16de-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6bvp1wTn6hD3WkHOUodv7vBosBWpjbilGhc94W8uhHqAcmkp7wIBTKkzDXKMddBSxyY6GJtnsv4RrX1dHNIgvYOg8ivsYhtk+75zmRIBf2xE8TvtcqsWgoo9UZoY5/RnLOS1WSL5Mki0V6cy18vy3EJU0eQ51O107/MhB/wHth0HRRCUjNieDHw9Ldl2QboNjYHi45tSk9Te+mrP53Nwk7ZsL+yGezYr7rv0KqID76wi2mHR54OOINNZ9LkraqdwSqn1cpuhBFwsECq/in16W6lV/YRL4+3+bwEjplM7rWf7j9uF8nvDptopnWWyy+bYKPUVNm/E7WXDTQHbZ4HDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3gZr5LjNZQH+4KVqZsVsu+tUyCscGyBA+5h/coiKb0=;
 b=FXfLC3CwbZxzBMRoSqvajxBc5RRuykmoyoECm3o4n+pweWC1WcBOCY9ctpAb4ZfCfml9PS4WfaTBfTMRrsEkNYkoiS1pK1OsrW0eQwrrAMIvUPfQmpTIcpTCDk6Yb06/l13Hn/YEBtC2lcO7biPuiVAKdXsYY6kkEwkEdNoe5WVOjo4Zptk/WqmnzwjifGrb/2c+V1Hl9Zemh1+ien0UzOVz0ft2GG5wHdGmDbnPnb3USjH2ShSmGWlFtxhECOW+xvCfjTxbp3XFTpmkMwqH35+DnJgLjoS3Y/Y0AAew4piMmc90WQrWFxhcMeFaGjqMNVonmL6xkphBjYBDn6SaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3gZr5LjNZQH+4KVqZsVsu+tUyCscGyBA+5h/coiKb0=;
 b=WddhZLgvUCmD4v9oa+eRqFzxFoYWBJh9JGsjmyFABCNj0GVePVhUGiz95V2LyKOYQDpsXtry48zSk5MZj3Lta7/NTB+aSu5CoG/J7WOkxJtgQn4KujDYHPyiXVsxdn/6SKktnjVLtG43rC+7NTQsX+82SCqs3U/2UDlK8G8sQ44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Apr 2025 15:10:50 +0100
Message-ID: <D93VC02KYBLI.3I5OGXLY9HCZ8@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<marmarek@invisiblethingslab.com>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
	<jgross@suse.com>
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
 <20250410195012.363658-1-jason.andryuk@amd.com>
 <D93TJIKWB1PN.3GQOSQV3KVT9F@amd.com>
 <bdb04e97-07cd-4d31-8853-6aa5094aea0c@suse.com>
In-Reply-To: <bdb04e97-07cd-4d31-8853-6aa5094aea0c@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f88668-a42e-43d3-db23-08dd7902ac3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnhNNlhPMGtTaC8wK2lML0hpdjhCVTB1SnZ1c2xlMkdnZDBkUEcwSFlZY1FW?=
 =?utf-8?B?cE9kUnE2Nm04Ui9qQ3RWNWtLQkQrQlpBTHRkVVFQVXJFRTVIbm1WSWJ6U1Na?=
 =?utf-8?B?aGRqbWpSTDQweWN1cTVwUjhPRjdBQmNQME0xb2drcm9wcmVsMDdsdHJQRDYv?=
 =?utf-8?B?dDFyR1pIRXU5ZWNLU2FEQnZTNld2cENHLzRjb1ArQkIyb1VGQzRmc08rcGpy?=
 =?utf-8?B?WmVVcUplWlRKTjM2ck5aS3ZzcytLeWovc2l2VmN3dldVQjBjUHdZMWU1MzdX?=
 =?utf-8?B?ZkpqZ1p6dENPVnE1QmNsS2x2WHkwRnkrNTkrd1F1dEYxdVhZcXlDWVRSV0pQ?=
 =?utf-8?B?N0RaUWZjbzB5SXY2akpYMnpXQk16OU1SVVdCTjQ5WGdYRUQyeEo5Z2lRc0t5?=
 =?utf-8?B?Tm1rZVZlQUdjenM4MWxad2ZwSEczZXdENWhlbFVFMThScXpzM3I2QytEVE5E?=
 =?utf-8?B?ZUljdnVxNS9hRVJFait3MXN5LzhjZktZWHdtYm1FS0lEWmU1aWxHUm02OUsy?=
 =?utf-8?B?Zk95YWoxNC8zSEEvdTBoWXdYdVpPa1IvaUZpa25vdm55NkxtTEpDNFFHS0JC?=
 =?utf-8?B?MGNJR3pxMlVDSGNyaEJpR0pDL3N2TWltT203U2xWUnFRZDIvK1c2NGtRZlhZ?=
 =?utf-8?B?bHQzWHVSOUZydG5iZXQrWWJoWjJqWU4rSmVEd3l0RUZJcVpGUW1TQk5RbFlF?=
 =?utf-8?B?VDNUckVVcU5HdGtqMHplWFRRZG5IZjBqRkVpVEtLMG1YaFd2UFEvNHJpbWpV?=
 =?utf-8?B?TzJBNDRySnp2OEZSTzlLN0VEYUxRQ3ZUK0pDSzBnSDluc2JKY0pEODBlcnU2?=
 =?utf-8?B?VVdhVkxxNE1ZTmJMK2dyRHNlYWY1bU0rbTI1N0JWTGR2Q2VZbmFiYXk0ak1m?=
 =?utf-8?B?RjhPVTYzSVdMOW5adGhuMzlsaWpzdnZ6V1U5T2Znang2eGtvRnVoL21YSzYv?=
 =?utf-8?B?T0dFYnhYNDVDa01FbURRVTVZZ0swWlBMd3dEVFlqVjJjMU5sVVRJbC9DR2N5?=
 =?utf-8?B?bnRVUmNPY3Q0WWl4S0RyTTdmY3NvZjNLZmdqOWxNWXU5KzFtTDJYQ2ZtTU9K?=
 =?utf-8?B?Slg5cVBOTDVPVll0NzUwSzZCaHpkT3NYaFQ2TVg4Qyt6WGg2a0lPMDQzSVNM?=
 =?utf-8?B?cVhxU0FVMEQwVThRdWMzTkUwb2JTT3lIYjVRcDQxbEFNSFBQenhnQ2kzWlJT?=
 =?utf-8?B?b0JGVHJZd1VoR3N4ZFd1TTlWR0xhOTMvWVhzcytIZUZJYWFzOUtCbmlXRDRD?=
 =?utf-8?B?ZlBuUEN3M2xNdy9zZ2lzYnlrYXNYTkdkVVAvWHdtN0tPa1c2UkFrcDVIUE1E?=
 =?utf-8?B?OTVBMVR5Um9UTmJMRk1HOWV4VUxyYThUVUVrV0VqQ0FLREIzelRkYVF3MFlm?=
 =?utf-8?B?N1BLZjJEaHY1NmZtV2xsV3NmT09iaVVzRXRvSlB4TmtZRjNoZ1JOMlJRcTA5?=
 =?utf-8?B?cHZrSnhlYWY2UXZ2OFFiMitraGJyUCs0MkMwS2lRblc0UmZwaHlRMmN3YW5t?=
 =?utf-8?B?cTVHV3liVlI5MUZJcktSb1FwdXY0T21kL0RlTWg3UW83enhab1ZMZXRqODBZ?=
 =?utf-8?B?MTdEeTMwMHpEd0h4ZXM4WGZsd0pUY1dFcUw0cHIrYzhmbTRpZW42YTBmbzBh?=
 =?utf-8?B?eDI0WTBzQ1hVREZrNUdDZDZDQTJGSVB2NlVQUFZEN0dFYWdhdVZXM0F5bVBB?=
 =?utf-8?B?eDdkSHUrZURHSkR3cmpDdXV3OWxJWGZTeUc0bFlvNEg4ZDkvaW9Qb1p6TmdO?=
 =?utf-8?B?R01mcERGL0JaaDVvTnRsQm1QcVRWOE5SSnV5dTlyOUVuQkV2QWczK2p3UGNV?=
 =?utf-8?B?VkNRREU5ekk3MlVJTm1xcmI0aEkyOGlQc3ZaY2hYWkRkOW9ZUnUxTzE0VWRG?=
 =?utf-8?B?TW1HQVY1UEJRb3N2REtkQ0dxWmFSeEJ1WTBpeGhQb2YwdTRRdUh3cHhadVdD?=
 =?utf-8?B?d2ZVNDViNWE2bkw5SU9Ka3dKNU13Ri9GUHJlallaclA5VjRSdkp4UmtYalNL?=
 =?utf-8?B?U2RQNWVtM3RCQ2lmTFFka0YrZkNTbkd3MzJGb09ubHZoS2tCa2RUWXJqdTYz?=
 =?utf-8?Q?7wUIbf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:10:54.1506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f88668-a42e-43d3-db23-08dd7902ac3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341

On Fri Apr 11, 2025 at 2:08 PM BST, Jan Beulich wrote:
> On 11.04.2025 14:46, Alejandro Vallejo wrote:
>> On Thu Apr 10, 2025 at 8:50 PM BST, Jason Andryuk wrote:
>>> A Xen PVH dom0 on an AMD processor triple faults early in boot on
>>> 6.6.86.  CPU detection appears to fail, as the faulting instruction is
>>> vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
>>>
>>> Detection fails because __xen_hypercall_setfunc() returns the full
>>> kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
>>> e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
>>> xen_hypercall_amd(%rip), which when running from identity mapping, is
>>> only 0x015b93f0.
>>>
>>> Replace the rip-relative address with just loading the actual address t=
o
>>> restore the proper comparision.
>>>
>>> This only seems to affect PVH dom0 boot.  This is probably because the
>>> XENMEM_memory_map hypercall is issued early on from the identity
>>> mappings.  With a domU, the memory map is provided via hvm_start_info
>>> and the hypercall is skipped.  The domU is probably running from the
>>> kernel high mapping when it issues hypercalls.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> I think this sort of address mismatch would be addresed by
>>> e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
>>>
>>> That could be backported instead, but it depends on a fair number of
>>> patches.
>>>
>>> Not sure on how getting a patch just into 6.6 would work.  This patch
>>> could go into upstream Linux though it's not strictly necessary when th=
e
>>> rip-relative address is a high address.
>>> ---
>>>  arch/x86/xen/xen-head.S | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>>> index 059f343da76d..71a0eda2da60 100644
>>> --- a/arch/x86/xen/xen-head.S
>>> +++ b/arch/x86/xen/xen-head.S
>>> @@ -117,7 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>>>  	pop %ebx
>>>  	pop %eax
>>>  #else
>>> -	lea xen_hypercall_amd(%rip), %rcx
>>> +	mov $xen_hypercall_amd, %rcx
>>=20
>> (Now that this is known to be the fix upstream) This probably wants to
>> be plain lea without RIP-relative addressing, like the x86_32 branch
>> above?
>
> Why would you want to use LEA there? It's functionally identical, but the
> MOV can be encoded without ModR/M byte.
>
> Jan

It's not the using of a particular encoding that I meant, but not using
the same on both 32 and 64 bit paths. Surely whatever argument in favour
of either would hold for both 32 and 64 bits.

Cheers,
Alejandro

