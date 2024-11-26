Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D24A9D9633
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 12:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843613.1259228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtgl-0003mO-Uo; Tue, 26 Nov 2024 11:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843613.1259228; Tue, 26 Nov 2024 11:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtgl-0003k4-RY; Tue, 26 Nov 2024 11:25:03 +0000
Received: by outflank-mailman (input) for mailman id 843613;
 Tue, 26 Nov 2024 11:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4efj=SV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tFtgj-0003jl-Nd
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 11:25:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e5afe76-abe9-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 12:24:53 +0100 (CET)
Received: from SA9PR13CA0095.namprd13.prod.outlook.com (2603:10b6:806:24::10)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:24:49 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:24:cafe::f6) by SA9PR13CA0095.outlook.office365.com
 (2603:10b6:806:24::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Tue,
 26 Nov 2024 11:24:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 11:24:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 05:24:48 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Nov 2024 05:24:47 -0600
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
X-Inumbo-ID: 0e5afe76-abe9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjJiIiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjBlNWFmZTc2LWFiZTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjIwMjkzLjk5NzMyMiwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMkXctdOHi/803iF3qSNRiMqyC/2DJUuxsLHEsswm9bzghiJNa0d3EKXrP4yEGIxQ+GRpMTmBS8jJ7ottbBb0hS37VCvRMoqN/hsD7zeVhtd8GhOFaN1+u7QvgbgUY6ByCtjPnJbGHVUtBr2bqCUYkkyJA60sj7YlWYzkP5G59D4KFop2BvHS2qOcoUmh2csjBs/2tXEI21BWec4XnJ5bT0BVpRPTwfRYzMTVF0GmRDLRm1/Qlrwu4QDKh0OSSvTpQTiBcy7wtDMcXa9ey+JHuIVaeZNEXtP2YxaMQ5Sv+4SW99H6qyDfoP2pgu5o5ndexbHvtafNp+QjZqpLSVz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5lqJSGgo5KI//ZxXAOKdOP/SSGW4aoYTyRpz20sD+0=;
 b=vuxMeUFNr0tnESPT0evBFQy709zLHmv3mfenAUHJCZemF9JsCKK+DYQYdCKC3/BOuTZKANrOkltcMQtVvJty6yvoVPiCc5xb/RO5imsaD1EI1V6Fsm2lmOm4+G8Uy+sLwY01QP1bNt5drdXLooboUysTqyyc35TSLugK1hLJgCxsMOcCkK6AFWom4ePnyqy5X6mOXSgUsUHXcz3yWao1wz+WDze86XkhsGWlO8k+4BYRvjJg4q6uh253mvkpikqlFlFyys6JBuVM7fCQnPQAJI1HzTF15OW3AvDQqAkcUW2Mu1wl8d4RX2QtvcYqyjqKoOMo448KNs9HNmXN00ZGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5lqJSGgo5KI//ZxXAOKdOP/SSGW4aoYTyRpz20sD+0=;
 b=oSJb0bvLqDeYGC529rwgq4KKB8PMuuHAR5oayAuqUYJb5G0ZNzfEyRwjouZ/899FW78xpHNH09aAidIt1C89PXq3gzQvhxRwOpoguFqSmB5GNz650QXw9Jwlo7Dj6RdPPE3SjNpAOOSU8lvEr/ifS8PO0XLt4Yoy1B09zIO6Ggk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <16367a7e-86c2-4e2f-8798-e789139a6c63@amd.com>
Date: Tue, 26 Nov 2024 12:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: Validate __copy_to_guest in
 VCPUOP_register_runstate_memory_area
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20241126102653.25487-1-michal.orzel@amd.com>
 <db4de7c6-c955-43fd-ab25-947809f357a2@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <db4de7c6-c955-43fd-ab25-947809f357a2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a86b03-6041-4211-1fcc-08dd0e0cf069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTJESDRYb2wwVVh4OGtHWjdKb1JtaGVnQ29IcHRlTGk2VXh4U1ZZVVlwQzA5?=
 =?utf-8?B?Z0U4WThGOVZDZ3VQbVBmT05tWUxyMW1UMlNObXJxNGNYZzdNaVl5S3c4ZTRs?=
 =?utf-8?B?NkJ5VG8vaEVUc1BEOWkreVh2dk5wb3FFNUw1bkFYb3ZpN2JmRDd3NzZQMnVr?=
 =?utf-8?B?TC8vVVdUT01BelBxYWZvalVWN1FWUWp1TkNLbGJlSjdQVjJBeExVcVZNaDhn?=
 =?utf-8?B?K29NZHpGKzdnVW9YK3RBY1dORUVjWXpKRHp0cXlzc25KNitPN2lpQ2tmMEla?=
 =?utf-8?B?MC9LUTgrT3N4WXBvR1pocFRjVnpFVWFBUXlzV1lwbWpRUFVmdUt3R0tKd1gz?=
 =?utf-8?B?NWJlcUNvVGg5WGt5bmdsdG5jV3pYZ2hKSGRsejN2VHRUKytINUVzd3FNekpY?=
 =?utf-8?B?czZodE1Tc3FFd2ZLR3oxYlJKRFFPMTZmSmdoWFcxQ1F1aG1VSzhtT3Q4YURy?=
 =?utf-8?B?UzZ5NG5qYnVqcks2SWdvQXJ2cFZ2RGpEZi9WQjJJaWtMQ3lMeHd2NjdLenpj?=
 =?utf-8?B?aTRBYVQxV3c4ZWl6VjFzY2RFUHlCbFh2R0NsUEtDbnVFaVR5NlQvbjkwRDJv?=
 =?utf-8?B?eGdTNXVmRTI3K2l0dzBVdXZ3YkpKYlVJdGh2SDllbkJPRHlOaDRYSEVYWXZS?=
 =?utf-8?B?MXZjOUdBcWZOZmlRK3NzSkx0WHBlTnhLMXF0Z2FmbDlOdXpEcWFkTVVnRnQ0?=
 =?utf-8?B?YWcvQXBMOEl4aGZuN0V2eUswUU1mWWJ2dVBFL2FHaThGSlVDNEM3Qi9IbDUx?=
 =?utf-8?B?Q0lvME5RcmN2YWZza1lqNUFGclpWRkxGVVFvU1BtT2x3Z3hiVDRZeHB4QVd6?=
 =?utf-8?B?c2pjaS9peTlHNktTRlhHTW1Tb0ZtQWZRN1BrV3FXLzZqRjhiaElDZHd0VTFH?=
 =?utf-8?B?cHZaaVRWZlhTaFI3bGFkTUlNMVcvVFBWN1VDMndZQTZuS2JSZkNkSEVuTGh0?=
 =?utf-8?B?MXVjb2RZZ0FBK3BFSWtsYjdMTVBpc2lONkRnQ1VvSU1PY3JUTFVqWWozRXNu?=
 =?utf-8?B?dnJ4OWRQVzIwWmpVYjhEL2ZpMkw1YzR5T1BBdXIyMkhCdkErbTB1ZytGZ2Zs?=
 =?utf-8?B?Ym5qaTl4RW5mc3h5U2x2ZVlDaFJlaGFXRlNzbUE5TkR0SDIzYUNZbFFVZU5R?=
 =?utf-8?B?N0RoR3o1WEY3RWNwajRhTis2Y1NZdmc2bGlzeUszRVZMWXkrallwcGxNTXUz?=
 =?utf-8?B?dTNNWmtZK3BqNVFRcXhyekVnSU5Cdlk4Ri9HN1pYL2ZxQ0pqaytVaHUvMG1F?=
 =?utf-8?B?Y1p1aDFyYW9PamgvTEVDMGgySWxVWkVqcDJsajVlVVBHUUFPb2Zyc2I3Z2Q2?=
 =?utf-8?B?QjRGU1MyckJYOHRKdFZERndBelNyei96TkdWNVB4Y25WWDVNdFA0UzAwK3Vu?=
 =?utf-8?B?TXNRRVphRHNaMGlYZmxEQmRPZXBWR2lNUzVUdy9sd21aVjJydnF3V0RTMHJX?=
 =?utf-8?B?N1dyVnZQWkR3L29KeEJJM3BpY1QxUHc4b0FMSmVHSkx1MDZUaXVsYWpKTkx4?=
 =?utf-8?B?V2Y2S0svcUhQQmZ6ODdqdjBWSWdYN1Y0RER2R0V5dXJYamRkaHZram9NUFRv?=
 =?utf-8?B?TEJzbXFqc0UyVGpoc0Z3M2w4bWpVS2h2Q2NobEh1R1dVeUQzQmFDbEdGVDhG?=
 =?utf-8?B?TjNVZzNNVGRxU3lJOERpdUhqblFMU2FCMTlDVmRXVFVyTkxCYTRRcWMrL2Vs?=
 =?utf-8?B?dmtnekJYTGtvQ0t3SFFjTFpOYmZnRXFXbEFpNTM0N1YyMG9TSGRDUDJJKzRQ?=
 =?utf-8?B?NS8wajlMeHBaSkk1dHRTc3RUY0xYKzluVXlKYUhWeDdQeXF4dmJHMkMzOWdj?=
 =?utf-8?B?dG1aak5vb25ZL1pvS1RuODcvU25wenZUcmNDekpZTDRUL2c4dmRCV3ZnaWtp?=
 =?utf-8?B?dmhFdVJ5a2NuUjVpT2NjRDF0OWZ5MnFNaHNEamMvSFZiTktWMHFieFFmRk0r?=
 =?utf-8?Q?W/dEwpvSuEffxF9VcNvTgS+ldPFJxb0R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:24:49.1827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a86b03-6041-4211-1fcc-08dd0e0cf069
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169



On 26/11/2024 11:40, Jan Beulich wrote:
> 
> 
> On 26.11.2024 11:26, Michal Orzel wrote:
>> For guests with paging mode external, guest_handle_okay() always returns
>> success, even if the guest handle is invalid (e.g. address not in P2M).
>> In VCPUOP_register_runstate_memory_area, we would then blindly set
>> runstate_guest() for a given vCPU to invalid handle. Moreover, we don't
>> check the return value from __copy_to_guest() and return success to the
>> guest, even in case of a failure during copy.
> 
> I'm afraid this is all deliberate, providing best effort behavior. For a
> paging mode external guest, the handle may become valid subsequently. If
> any __copy_to_guest() fail here, subsequent update_runstate_area() may
> succeed (and success of the actual copying isn't checked there either).
Hmm, I've never looked at that this way. I always thought that mapping must be in place
before setting up handle. Is this concept really something used (e.g. in Linux) or just a
way for us to provide excuse for not hardening the code because of a fear of regressions, etc.?

> 
>> Fix it, by checking the
>> return value from __copy_to_guest() and set runstate_guest() only on
>> success.
> 
> _If_ such a change was wanted (despite its potential for regressions,
> as guests may leverage present behavior to establish handles before
> putting in place mappings), x86'es compat_vcpu_op() would need updating,
> too. Plus what about VCPUOP_register_vcpu_time_memory_area, behaving
> similarly?
It's up to us. If the concept you mentioned is valid and people are aware of it, then
let's keep as is. I for one was amazed that Xen returned success but structure was not
copied.

~Michal


