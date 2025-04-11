Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FEA85D88
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947369.1345000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DmV-0008E5-JF; Fri, 11 Apr 2025 12:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947369.1345000; Fri, 11 Apr 2025 12:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DmV-0008BW-FR; Fri, 11 Apr 2025 12:46:51 +0000
Received: by outflank-mailman (input) for mailman id 947369;
 Fri, 11 Apr 2025 12:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67/P=W5=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u3DmT-0008BQ-L5
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:46:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0660ed70-16d3-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 14:46:46 +0200 (CEST)
Received: from BLAPR05CA0010.namprd05.prod.outlook.com (2603:10b6:208:36e::19)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 12:46:40 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::60) by BLAPR05CA0010.outlook.office365.com
 (2603:10b6:208:36e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Fri,
 11 Apr 2025 12:46:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 12:46:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 07:46:38 -0500
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
X-Inumbo-ID: 0660ed70-16d3-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfKSB8piQ7rhQFso15KqcTBTNaRr9xZPcV7SWoWH8kPukRlhmaWTPYwtazH5iMeicilAMfJmn5kXsQ9RMsVbs1PpHofGQ2Sd1qZpIRorUSlUmhotGV+hPvKhDN+wIjvCBZJM/lb4lEvC6BL0HyFB+jFIjs0nJ4yaOn+BS4GXFXngJbpUR1uW8P9u4eKVoP+JwE0OXZ+vK2bhw7sr4Mfe9SI5rwPp/Jl7swEi9Qj+ntl3pmYeJ64rWw+7zXWc/Y1W9WX4GPYknHGeiFhQlyP3WlfWaG15nOq8WFSs06n6JdUA+6J8fMeIxeefgcQvVC0HW1lXHMyUOWXp8xVj4r41tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNtvIg+H4tFX740mgdYuO8dNQ81YAJnWx5NOCcftHp8=;
 b=AHhXmeWk8uZVfFIkwfH/cehbBpplnbIxMYtrmu0aFM5+OtrMs3DbuyxhnM3KxLy29cRPd3M6lyi5BISgVhKbEdRcderOpE0zWZrTqsfE6bwXwGQS2j2yQonhQj7DdrFlWE3vjfsmuMoikM4ywMqMjjef+Y7oNeH8qQDqP7392eG20g/A9sNZWESGEgcegEsOzOGQkSEmiI6o6X1hNrPkL8NBpuOikpCQHCzuGIqp3h7Ubnl6hKAj2XkHU3rroGwWWR1ymVUZXOa7YBGXatfY/YYZy09eDwT4E7tGpAUw1jOY6hopfpiangh34Go2+0lvK2KOgNiv2S3MII5d0T8tBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNtvIg+H4tFX740mgdYuO8dNQ81YAJnWx5NOCcftHp8=;
 b=0OPYyv8EwEijHHV8FFjjM2dv5f5mwRDeLxBWR3uWW4UJbHjZdMAHON7MGlpl+OIFHJxnf3JM+80tHo7qZ/eHZ8l75PtwELtsd1nO4i7ZInJ5AEwuf93cO61Z158cvVisuaw9nEwdGkm2Yut4/YD5hHb+V8X+W8xNSM9+PtK8EaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Apr 2025 13:46:37 +0100
Message-ID: <D93TJIKWB1PN.3GQOSQV3KVT9F@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<marmarek@invisiblethingslab.com>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
From: Alejandro Vallejo <agarciav@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, <jgross@suse.com>
X-Mailer: aerc 0.20.1
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
 <20250410195012.363658-1-jason.andryuk@amd.com>
In-Reply-To: <20250410195012.363658-1-jason.andryuk@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: e15993f7-6365-491f-d29e-08dd78f6e78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFJ1eUQwOTVOVXRGdTB3YVAwU0FNT056L0cvU3pwand6aVRQdDVKSy82MEtj?=
 =?utf-8?B?UUYydCtjK2ZUWGlrUy9DaG1YUlFRZEN2bVd2TjhzUWl5NDRnUFB2ejgxeHZo?=
 =?utf-8?B?aHFKSDZ5VjJMY1JPeDIrODhTWFNNMlZ0MEd3L3dtRE42MVo2dVlEVWU0VSs0?=
 =?utf-8?B?MXN2dWRQR3RBbUh3dVFVYXhrL2IwbDN2QlppUXgvNVYwVjllQ0dCRzFVMFdr?=
 =?utf-8?B?MUZBUU1ZOWZnYk9aekhIdC9GNW5RNEwyTStQY1ZVU3RtTHI1SjJTTTZPbnlw?=
 =?utf-8?B?TzF0bkVMVm9RQURFZm9vWUhndUZwRVBGWlF0d2sxL1pSbFE4V0pSaFg1bkN4?=
 =?utf-8?B?WVdDY1J2NEhnZmx5K0Q2Y0ZGSUFITTU4YnUvRGVtMm93UWFHS2ROUWRPTlJp?=
 =?utf-8?B?L01JUnh5OUlNVWJGTDlrbUVkYStBY2hKbjM3MHBsb2VibjRERXZUQjdjMlJP?=
 =?utf-8?B?RE9QRFovdUg5VTJuaW8xS3c3d0l4MzVvaDRHU1B6c0NySHRQS0N5ME9WcGxR?=
 =?utf-8?B?cmpoUWpuQlRmaWJGdUhMQ2dKVnQrcC94bytSSStoZ2JOejZBUjVMekpLWjRX?=
 =?utf-8?B?RTBqVnVmSkJDc3JOKzV4WkxTdHhjNFZPWkpteHJvWFY3WVNLSEN0SlQyOGEx?=
 =?utf-8?B?YkVJRkhlMTgzU0Mwa0hiN2QzemVjaGV3L1VVd0dsQS9hY2JBYldXRHJCZjQ4?=
 =?utf-8?B?RlJ1NGZPdm4zQzRtMXBsd2tQeUpFTHErS0RPOENaREJUazErWUZPVzRud0ky?=
 =?utf-8?B?YmpRbDdOT3BqSXZJclQrRTNReGlQcTBTQjJ2NnRUT3dsTllOVUkvNVRsTkJk?=
 =?utf-8?B?ZVYyaEpvOEc1MkVzRDhzaVlRNS9ldlRHbzVib0NPNEN3YW5YZW9KWVhiWFVF?=
 =?utf-8?B?ZlphVGU2MXIrR2kybFUzNU5EdzdtSjB3dDJ2WUVNSlFZQnpVdldBRDViQUty?=
 =?utf-8?B?YVBXYVo5bzMySzk1dzBaMlcrS0hpNU1CTWNmeVkvYitTalZOUmNTRFRtZWJZ?=
 =?utf-8?B?WTZOZGc4bGZBTHh6NGhZNSthdnhybHc1emtSUUNUaWhMbzZwM25zd0oyU055?=
 =?utf-8?B?ZFdqT2UyM21icDQ0dUZ2T3kwNnBHUXRBWkdzL09KSGJXQnB2aFZkL3NXeUlt?=
 =?utf-8?B?L3ZVRi9NRTI5ZUo0Q2RyZWx6eURoOFBGVzNYczVNUVBFSWl6VHB5VUtxTnRD?=
 =?utf-8?B?c21sV0RFbWtFZitYTGNPbFJzK3VpcFFXaFFYbzZ6MmRPblFEMUtVMnFOMzVY?=
 =?utf-8?B?QjRtcnlHOFJjYS9lcGFEcURjK3dYVHY0RG81OTYxQnVoYXdQM0JnN295SHJh?=
 =?utf-8?B?WG1VVG1FNnVrQWVXK1AxQmF0UGZCcE43Y1dkcnFtczlkMUwwelA2aW9NTVBR?=
 =?utf-8?B?ZitkS1ZTcHVBQ1dKZSt4cjBEQzlXTUhyMkRaSGZmczh0QjJ3ajVjU1VvWTQr?=
 =?utf-8?B?bmxua2ladHJCUjcrMVlCQ2JDUzJkaVpYOE5DZENlaFNxQlNUbjJ2MHRoT284?=
 =?utf-8?B?cVJ4OEYxT2xhRHlmNVY3QXFUVElraTk4Smt1WmdpZHR6N3pnMEZGUjM5bmFM?=
 =?utf-8?B?eG5CM3RvSXVLUi9BeURNSmtSNkpJV2VtRytOVjgwUVlMaXYvV3p5a1E4MkJE?=
 =?utf-8?B?YmxHcFNLejBaQlg4SG5xVk1sQXFQMy9ySitDNXpwSDNjR3BXL0tEc0d1VkZ0?=
 =?utf-8?B?dEtJMHZQaXFuM0xQSGlReGhuSzNnQktXaUtyaFJZMkFzVzRkeDZDZ2JWR29I?=
 =?utf-8?B?VDJJS3AwaEFKTzFKVlEvaWgrUEZjOWNDSDRtdnNBTmhnaDk4am45RURyU3cy?=
 =?utf-8?B?ZXNOSGVEVFVneG13dnNaeVlRbjNheGhsVjJucE16UFA4OGUrVTN2WEdac1ZK?=
 =?utf-8?B?emtaYXJZZDN3eC9SR3ZNQ3pTWGJKdDVPRDBGcnlydG9RbHo4VHUxNi9wV3Fv?=
 =?utf-8?B?dHB0RncrSURyQ21ReGIzNTllYzByRFljUmR0dFdBeUdMbEV6VlhWUUNhbDMz?=
 =?utf-8?B?SlRCRW1YRzduTWFTRGVWNXlLMDVFWjIvWlk5N2xKc21wcm1BQjFYTEdjb0h6?=
 =?utf-8?Q?qzjxad?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:46:39.8154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e15993f7-6365-491f-d29e-08dd78f6e78b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011

On Thu Apr 10, 2025 at 8:50 PM BST, Jason Andryuk wrote:
> A Xen PVH dom0 on an AMD processor triple faults early in boot on
> 6.6.86.  CPU detection appears to fail, as the faulting instruction is
> vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
>
> Detection fails because __xen_hypercall_setfunc() returns the full
> kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
> e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
> xen_hypercall_amd(%rip), which when running from identity mapping, is
> only 0x015b93f0.
>
> Replace the rip-relative address with just loading the actual address to
> restore the proper comparision.
>
> This only seems to affect PVH dom0 boot.  This is probably because the
> XENMEM_memory_map hypercall is issued early on from the identity
> mappings.  With a domU, the memory map is provided via hvm_start_info
> and the hypercall is skipped.  The domU is probably running from the
> kernel high mapping when it issues hypercalls.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> I think this sort of address mismatch would be addresed by
> e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
>
> That could be backported instead, but it depends on a fair number of
> patches.
>
> Not sure on how getting a patch just into 6.6 would work.  This patch
> could go into upstream Linux though it's not strictly necessary when the
> rip-relative address is a high address.
> ---
>  arch/x86/xen/xen-head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> index 059f343da76d..71a0eda2da60 100644
> --- a/arch/x86/xen/xen-head.S
> +++ b/arch/x86/xen/xen-head.S
> @@ -117,7 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>  	pop %ebx
>  	pop %eax
>  #else
> -	lea xen_hypercall_amd(%rip), %rcx
> +	mov $xen_hypercall_amd, %rcx

(Now that this is known to be the fix upstream) This probably wants to
be plain lea without RIP-relative addressing, like the x86_32 branch
above?

>  	cmp %rax, %rcx
>  #ifdef CONFIG_FRAME_POINTER
>  	pop %rax	/* Dummy pop. */


