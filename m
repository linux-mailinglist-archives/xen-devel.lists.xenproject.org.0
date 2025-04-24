Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25FA9B962
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 22:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966884.1356942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u83TP-0004oq-2a; Thu, 24 Apr 2025 20:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966884.1356942; Thu, 24 Apr 2025 20:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u83TO-0004nI-Vs; Thu, 24 Apr 2025 20:47:06 +0000
Received: by outflank-mailman (input) for mailman id 966884;
 Thu, 24 Apr 2025 20:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u83TN-0004nC-K4
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 20:47:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2414::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42fb45d8-214d-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 22:46:57 +0200 (CEST)
Received: from BN9PR03CA0776.namprd03.prod.outlook.com (2603:10b6:408:13a::31)
 by BL3PR12MB6641.namprd12.prod.outlook.com (2603:10b6:208:38d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 20:46:53 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::6a) by BN9PR03CA0776.outlook.office365.com
 (2603:10b6:408:13a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Thu,
 24 Apr 2025 20:46:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 20:46:53 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 15:46:52 -0500
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
X-Inumbo-ID: 42fb45d8-214d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbHQEY8ACjTTe88iEHV/qzjaweHJ8xHwLjD2Mdji8D6yEqrEEYwvi4KOfZfdplVMBGqQNwsEBYyw+Zpzt9q91YZTKu4cveZTs2l7K57HopzoEXg294ezWywUDXCUQ0Kf3A1i1zIHNLc6rUblPdSF6P0Lu7ZJssI7tBJcx5O6xUCcyiNyOgSGDBRnffZkr1JdOktdupuUFM/O++NHdfEvGDj3gXsITmlvlzbVlV1wVNa/BBEeufOOktZdhJdPPDkCxrYkOkO/2oANDu7Tx+lI/tajA8aHvA7MGkikIOIAiNlbvvbsqHIjIGb3Kvc91hR3/aW4AKhZML57aW6eccPzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5wLGLa9O57B6pKujrrtL97gvvoXkboTf35Uj4Yn0gk=;
 b=T04835crzdlxe3UzymhzdvhNm2PJ1qcb/646l6Qcx5lzRIVpF6OsFr6fYBtKiN240MYr/GBDDQpctB6zxuzaA3EpqAkK3fOTLJu817yrG+Q2ZqaFVwpEOYbE0BhAicEewTyOaCCC07vH9CGTrmgBQum4dlHl+vsc4PpEwOLTW0hcTf1D431N0I3TkVMoYiQkhteeursLQpbQ9gInm7b+mu6U6ZiRSsFpuDSV42DC8PtYHSEFSLxYJ8WYZ3unLqRCCRaTc9xqSqb7rPlbC8AesY0XKe7LJUYOs7XiaUd3Wci20alKo5drWN/UVLkgzETcv3/Pqj9u01J4bfofHbGfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ariadne.space smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5wLGLa9O57B6pKujrrtL97gvvoXkboTf35Uj4Yn0gk=;
 b=cLd00fjjg+ceqeWscW3Lwouspa9OqZgWDQw+p6MGZn3YHl2s/Q8vh2JA6KzscJwBMzIyDsnF2POpbRPR1cpaQvOnFnUV+/SukFKNSol7bqxDosJYqmsh+BDVoDVcIH7UvgGgbriNFs7hZq9i2dJrmlSamQ9lFi1uWGtey4PXXPo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Apr 2025 21:46:50 +0100
Message-ID: <D9F5WA7ONX45.NTFNWPJS5MWU@amd.com>
To: Ariadne Conill <ariadne@ariadne.space>
CC: <xen-devel@lists.xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH] x86/hyperv: Adjust hypercall page placement
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <D9EWZF0G7QUZ.2IDV470T7SYD0@amd.com>
 <002DF04C-A250-4EAD-9834-FC07EFC9D562@ariadne.space>
In-Reply-To: <002DF04C-A250-4EAD-9834-FC07EFC9D562@ariadne.space>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|BL3PR12MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6435bf-2622-4299-b8f3-08dd83712528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnVkWm5VZnp2SU05RFR1QUVXdTRVTGpDU21tMUY1SHhXcVFycTAvSGE5MDhW?=
 =?utf-8?B?S3ZySHpPWnZidVNyZXd0Qzk3K2g4MktaQWxpVThtVjVZMkE4SEg0UDFDeFhG?=
 =?utf-8?B?MGZkd1doWFovSXA1L1F6eVhYWWZTUGZtSjdFK2NUUFNkdkV3WFdGZnVXUXBC?=
 =?utf-8?B?ZTdHK0hkSHNQdjh5eGtsTkFEc2h4WWVnMFpmdGNqVklaTUdWQ0kzU2UvQkRE?=
 =?utf-8?B?eW13YlNwb1dXTkhzTXJSaHVSUUlrL3VabnN2bmxUOENiNHhsTG1HRm9IOHU0?=
 =?utf-8?B?WC9MejB6QUpnRS9NZDBkWFlyWDl5Q0dNYmhydVBhdmJpWDJWaU1MdU9LcENp?=
 =?utf-8?B?eXlEOTJHTmFHK0s1dUhrMmF2ZTM2ZHl2WXJDK1BFL21GYitrS0EzLzlpQkN1?=
 =?utf-8?B?TWpPYTZmUFZVTTAxTG9wZVpEMExWZUdRRHZHZG1uV3ZhNERPNnZyVUF3ZEx4?=
 =?utf-8?B?ZlBENXUyTFBGZlJHNklybGc2MFNMVzl2M29nY293YVYzOXkxM0UxbVh4dHdo?=
 =?utf-8?B?N3hrOW9LcWYvU0Z4aHY0OTZtWHRPSmFEZDgzVWxEYWJjN0k3d01ZTG9ITlBr?=
 =?utf-8?B?QU9mMGlMd3JjK1I2RllxUDhad2ZxK0c3K2wxM0lsT1N0WHl1eVVrQVNpZGZP?=
 =?utf-8?B?U3hSaUFqRkZmVGM4OHZ2bC9xZzhDQUduY0I0RlpJUytEaXdxUThMWlNoKzlK?=
 =?utf-8?B?MUk3SythWDF0OTNwYnZTYTNacTM2djNVS2drbG1peVVpa0ZYWTB3N0hrRnY2?=
 =?utf-8?B?THpkTkxVZmZUUXhQN0RIaUE4SkFLKzBPaCtCSlltZnkyZGNUNHVkbjRnbUox?=
 =?utf-8?B?VlJlTnlWdkFFem10eU93RC9wNGpMZXdGNVg0NHk5TElHdmhxMDN2RlBsdXRs?=
 =?utf-8?B?UlN5alVkVWhNMDN0RnJxQTM1QVF4QzkrVnBZdGhieFVxK0w4R1FxMFZNKzRu?=
 =?utf-8?B?eS9LMTJnL1BoYldZUHpHeXFpSmMzUmh6WFord2pybm1zbVMzWDQrL3RiMzcv?=
 =?utf-8?B?RnhlTmk5M3JYYUZwT2IwZ3BnYjQxbkVDSGsveHRNeWxVLzM0TzUyM09LYXF0?=
 =?utf-8?B?aUhoelk3eVl4Rms5TFEvRE1WVTV6VE0wRjZkdnd4TkhKbjBKZDFuQWhmOXdz?=
 =?utf-8?B?Z1Q5elFTZmgyWG5GcnZ0MWpiQkIyekdIS2RXbm4wYUU2Zm4zQ3VlcTRHZlZP?=
 =?utf-8?B?T0JqVStaSkJtamRYRnVoVG14c1NuNEYxUGwzU2xkTkx5QTB5Mkd1cUZSc091?=
 =?utf-8?B?Z3JjUDVRRW84K1Mva21SaXJKc0VWOFBQNERWV25malJ4RkZ1ZHVuNlFaazZ1?=
 =?utf-8?B?cHdJc3JSY05ieGdtWmFwSEdWQlVRRHcvdGRBMWVINVVucGk1Z0Q4dHJydkFx?=
 =?utf-8?B?ZHFzSFRrQ25tUGxwTHpmU2d1bDVJaTY5YW1wbGpqMmUwSGNhQVNScU51akNv?=
 =?utf-8?B?U1FYZGNpNjR1bFdlakhLRXJwZnhOU0JlcDRGM25wWE9BdFVrRTV6S0RIM1J3?=
 =?utf-8?B?YVZHY1RFbmtxeVJmR1c4UkZtU3hIN0l2TjEyeTRnaExZVFFsVTAzNEhnVjV3?=
 =?utf-8?B?MnBsM2xuWmdHVDhqRnN6L1BDTjRhYXlVN0w1TnJuaWtnb0taNGdQR0dHSDdQ?=
 =?utf-8?B?WW5oWlVSaGpBM3ErQmMzRGcxd2lnOGk1Y2pheTd4RVQxalowTlltYzRuNEFw?=
 =?utf-8?B?NU41SE5Rek53cm10VDdSK01KMXg2a21Gcy95clVvSjBxa1NKYzF2ak50NnBJ?=
 =?utf-8?B?WjFiU0F4aHNNUXNzRUY1eWRBTmdOWk9PQnpQQzBjcmMvUTZ6bFJncXE2M3BE?=
 =?utf-8?B?dmcrUjZKOEtMbWM0dFpDdzFHcHpreElsQ3BOeVdDemJ4eFA2UkJLVFk2VE1K?=
 =?utf-8?B?V2UyTmU2ZWErRVZNWnQ1TFl3SlhqeFE2cEY2TzVkL1kvSkEzZGZFNmlDU1dw?=
 =?utf-8?B?Z1NZNkdBN000VWxnTUVDSW1CN3ZUc3VkenhmSVlORlZMMll4d2pxL24wRHp0?=
 =?utf-8?B?SlNOSEhnMVVoYy8yTDE0M2lpTWlVTTYrQ3dMdHc4dExDdm42ZHorZ2VhaEVY?=
 =?utf-8?Q?9p+iUo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 20:46:53.4000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6435bf-2622-4299-b8f3-08dd83712528
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6641

On Thu Apr 24, 2025 at 7:22 PM BST, Ariadne Conill wrote:
> Hi,
>
>> On Apr 24, 2025, at 6:48=E2=80=AFAM, Alejandro Vallejo <agarciav@amd.com=
> wrote:
>>=20
>> =EF=BB=BFOn Thu Apr 24, 2025 at 1:45 PM BST, Alejandro Vallejo wrote:
>>> Xen nowadays crashes under some Hyper-V configurations when
>>> paddr_bits>36. At the 44bit boundary we reach an edge case in which the
>>> end of the guest physical address space is not representable using 32bi=
t
>>> MFNs. Furthermore, it's an act of faith that the tail of the physical
>>> address space has no reserved regions already.
>>>=20
>>> This commit uses the first unused MFN rather than the last, thus
>>> ensuring the hypercall page placement is more resilient against such
>>> corner cases.
>>>=20
>>> While at this, add an extra BUG_ON() to explicitly test for the
>>> hypercall page being correctly set, and mark hcall_page_ready as
>>> __ro_after_init.
>>>=20
>>> Fixes: 620fc734f854("x86/hyperv: setup hypercall page")
>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>=20
>> After a side discussion, this seems on the unsafe side of things due to
>> potential collision with MMIO. I'll resend (though not today) with the
>> page overlapping a RAM page instead. Possibly the last page of actual
>> RAM.
>
> We have been working on bringing Xen up on Azure over at Edera, and
> have encountered this problem.  Our solution to this problem was to
> change Xen to handle the hypercall trampoline page in the same way as
> Linux: dynamically allocating a page from the heap and then marking it
> as executable.
>
> This approach should avoid the issues with MMIO and page overlaps.

Yes, that's what I meant by overlapping RAM. Overlaying the hypercall
page on top of existing RAM rather than trying to find a suitable hole.

> Would it be more interesting to start with our patch instead?

If you have it ready to go, for sure. My ability to test any of this is
fairly limited. I suspect the VM is just not getting 48 bits worth of
guest-physical address space, and so making any hypercall turns into an
EPT violation.

I couldn't run the tests that would definitely prove it though

From the little I saw of the dmesg going forward, I suspect there's more
required (at least in time handling) to enable support in gen2
insteances.

Cheers,
Alejandro


