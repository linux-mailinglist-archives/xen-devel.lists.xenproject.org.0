Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC9A85D57
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947349.1344990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DhI-0006Q7-0i; Fri, 11 Apr 2025 12:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947349.1344990; Fri, 11 Apr 2025 12:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DhH-0006NE-TA; Fri, 11 Apr 2025 12:41:27 +0000
Received: by outflank-mailman (input) for mailman id 947349;
 Fri, 11 Apr 2025 12:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67/P=W5=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u3DhF-0006N3-Ni
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:41:25 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:2408::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4573d048-16d2-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 14:41:22 +0200 (CEST)
Received: from PH7P221CA0067.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::28)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 12:41:16 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::d9) by PH7P221CA0067.outlook.office365.com
 (2603:10b6:510:328::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Fri,
 11 Apr 2025 12:41:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 12:41:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 07:41:13 -0500
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
X-Inumbo-ID: 4573d048-16d2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjM6A9B/JmE0/B+6U74WyG3p0TuB8U08cdYogXwqbdECAvO2A6Fti9Yv5IFbb6zceH5uz3XqSompyunVx7be/cURyro8KJfYavlRJgHcZX2v679OkSZjcL9cQ7pSQdyYgpSMZ7X1/LjN+kmioWMk7ybFhCeoPMPb2+n8fpa/dQy2PkqC8uvFsOvvYexWDQbqU/GsR7fDo1+9dqzANH2t87LfEGytC4DqxrsE4d0KfEzX5A0zhYusnIaklrmZSVmZbvUg6JhihhiZojt2+wXAPrPYjne2yEQyGSnsrWXL4X62wSrqfbrx62NQ7+0EzNeMvpTxr8Sg66NzrFE4/UC8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfFK02hPLHahI9t18zOKWf4c17s6CTxQOpUaJ7+svzY=;
 b=ctp6iqdubbLNkqXFrF2MKACVL6WbfMzvaajWhmbp9fjbhJ5I/+3dlSi79v6656L+b/j/tW/WiVuTQD1LOV/Y8vPo2kXBnqtCbRx8hndnJZmZUfiIbY8WDq9fc3ECmQhv9URSrzgI0orHPWrkJc419zYnVmtnf3AImm4WD22BC3xjLvlwt0b1vGvkvmgtK4Wo0DOJNy7U94iba4vq3mJ3E5HnVn40opCkm91VahiCOHyGMasEchVtFo7KVrz0KRaPmznLk5SdwVHCGOsbf5mGcyt1yrLvZv+XNy92gYb75QXQ9vAqPGeJ/ha+vaf305smjPDFjbdLi6xIuYdyC9A+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfFK02hPLHahI9t18zOKWf4c17s6CTxQOpUaJ7+svzY=;
 b=M3cEqfXBIrWSdV4h4dngPQO5w309ERf10iQSVf/xOZInkh8FcTTXkIkINW/tBdrqqVIx7xsTOHtchOMvwZmXYxKRyjm2j50uvoMEo29B/aGRPHiEp1y/QifUOGoT7mDN+5mS2RFoQomZ/fPuB7uPQohOwjXBqme8QU/lFmylh1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Apr 2025 13:41:12 +0100
Message-ID: <D93TFD9KSK5P.12MLZEHNH230J@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
X-Mailer: aerc 0.20.1
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
 <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
 <5da1f4ec-43ca-4279-88dd-b51d57b306e4@citrix.com>
 <eeec5fd7-25ae-42e6-be47-d849e2e33f6b@amd.com>
 <b0da7fe5-9dc1-42d8-9acf-56141eaae053@amd.com>
In-Reply-To: <b0da7fe5-9dc1-42d8-9acf-56141eaae053@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd81e09-9a32-4ec2-0ab0-08dd78f62641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1dFR1JmRk5TeTNvYzI1TkNhMy93QkdrcTg5clIxdmlheitsM2ErZ0wyQndJ?=
 =?utf-8?B?cHVMODZoQ3pIMHRHWms4azhQcEl6QnVIMVVuTTlkeGwvNnp3OWZxT05NM3pQ?=
 =?utf-8?B?U1VDZk04bWEwR3owZ2Nhd0FUUDkxWHQ2L1BEbHduQy96cGkzRnZsUFBOQ2xY?=
 =?utf-8?B?aU1zNWlQQnZ2UWhSVmhIaDVTK0NmSEwzdEwyUkpRUGw5K0FJdFpQUXNxbHBC?=
 =?utf-8?B?Qk14MHhIQTVLQVh4M3N2M0VRSThaUmM0U3ZTSlVQMXVSZEpPc01MMmt4dXMw?=
 =?utf-8?B?bXdTM2V1SE1xajdnMktuMSttb0pEWEhRYWVtZVgrK0pOWjRNa08zTWdoTmFV?=
 =?utf-8?B?eURKbldZQ0ZzWTMyUGNsUTFSOWttYjVpSEVvRzc5WEdRVjJJZW9yRHorNnNX?=
 =?utf-8?B?OGpRZ1Z5eUsyQTg0cmFCTlpyVE5XSS8va0RnV0NhMEhVY0kvdExsWkpqa0RC?=
 =?utf-8?B?MWNUTXk4Vk5XMFdwVzNjZURSRVZHYjBNWlI0R3paZTNCOVFTWnB6bG1FYTU1?=
 =?utf-8?B?TmthdTU0Yys4RXdZamhrTUhRbHNIMjY5YVphZm1DNG9DNXVKWk9CZUlWMnFy?=
 =?utf-8?B?RUlIOU0wRmpnYnRWd2RPQU1oVENZbWxXdGZuT2wxN2NzbmFSaDd0RS9MOVZ2?=
 =?utf-8?B?RlJya2RwaUlqYlk2OUdFbkVzekEzTTVsUjMydDNkMmp6a2JZV2lKYmplUVNx?=
 =?utf-8?B?dVQ2cjU0elovWTFyL0dOWlFqd2FMSDVORnd3aXBjWkdldFVYekE3NHNZM0VK?=
 =?utf-8?B?Uml1bGYrWnVBSzQxeEZabWFXd2JheUJaOE9GMUlBVUpaNGNoSURPWlpnZmdS?=
 =?utf-8?B?eU8xZGh5bk85ZWtDRGlxY1UweXlXZlRaSjBkUEh5WGlTNm82dEtvT0hTajVs?=
 =?utf-8?B?TVBnN2piTFlHRDNKeHpxVGdKSTRvYll2OVBlNitwMjViL21MejZVTEFrSVBR?=
 =?utf-8?B?TFduUTRBNFdpYUl3TVRDWXE5WXhsVzhQaFpTdThFQTZMOE1TTlBhZm9CY0px?=
 =?utf-8?B?bDBGQ0MvOE1BRS9aRTJIVGVteEk4SEc4YjQwV2MyNHY0VCtJZXJsZVFSWWIy?=
 =?utf-8?B?elB5d1JmMlpFNENGdzdydHNMTXlSSTNiMTRseWlSL2dzWXNRcnZncXNSbHhh?=
 =?utf-8?B?TnJTd3M1bHZrdE5KdkY0aTFoTVVhZE9rQmJqN2F5RTJUM0E1S1NsMkVyWlVE?=
 =?utf-8?B?a1pQc05ldXZiMVBiOVdRTVBVbldQSnRhOHhTbTIvdkVJQjdoamJoYjJ1QXM4?=
 =?utf-8?B?cFZDcktYTTVvenZ6Um1Kc21QWmdQQ2dpb0h5N2FNZnR2NzZjdFNSaG9Xd3gx?=
 =?utf-8?B?QTNZWjB4K1Vxc1hhQVpDaUhtaTlIRXdXTm9mZVJ5cFpZdHpGYk10OVBhQW1K?=
 =?utf-8?B?a3VqRmF6aUh0VmlUNVYwNGhOMm5jeXhPY3J2QjByN0l4VnZFRlMvUVZ4Ulc1?=
 =?utf-8?B?SUdxVXVuZlgzUHkrY2FlL0V3ZXJsYlJ6YzZrcEorV0VhcGd4ZnNSbi9vREpO?=
 =?utf-8?B?eDI3RjdzaVEyVXByT3N0VGw3V1pzZnB6M3BFOVRCa2ZnRVpIck4vTTY3YTBy?=
 =?utf-8?B?RytMNyt3MklTcVZacHlOMFNTcU1CU05vck4vd3pKa1RGeHBOZzlrdHk5VmNt?=
 =?utf-8?B?VkozZ1pLSDNsdTd6a25rY29xQk9pS1VqMHY0K25UVUdETzlYeHpkWU9RZDdL?=
 =?utf-8?B?U2RPTXMvc0JCcjZ0U0VCT2NlVEY4SS8yOHo5eEJBcStYWUZRVHFIc2N1eUVl?=
 =?utf-8?B?L1pVM01EZUwvSnV2cFdzakFwUzRlNjl6UVhtY0NGMktLRnFaZUdtNXAvQTFS?=
 =?utf-8?B?Y2F4anhXbDQ1OUtDQmR4RmYwb0piWHNodS9PZlVabU5BTngxN1ZCajR3amY0?=
 =?utf-8?B?ajdad2VGNmFuQ3M2VTN6V3NoZnB1NmlYL1lSV0tqRTFGaGEvK2QybzljajhV?=
 =?utf-8?B?UGdPZmdkOFIzVWUyTlZ0VFpDOXRSWVM1VjlzZUFEdnpHRzNNbkdwRnBFYW00?=
 =?utf-8?B?enZqenBsSFVrQXhiOTBJbXdUK0M0U3B4bWlEWVR5Um5Uekh2cTRIT0FaTmR6?=
 =?utf-8?B?L3ZVdFY4OCtJYWV2Zm1xSWtCTzE2TWZwekp5dz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:41:15.4000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd81e09-9a32-4ec2-0ab0-08dd78f62641
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906

On Thu Apr 10, 2025 at 10:50 PM BST, Jason Andryuk wrote:
> On 2025-04-10 17:16, Jason Andryuk wrote:
>> On 2025-04-10 05:17, Andrew Cooper wrote:
>>> On 10/04/2025 1:09 am, Jason Andryuk wrote:
>>>> On 2025-04-09 13:01, Andrew Cooper wrote:
>>>>> On 09/04/2025 5:36 pm, Andrew Cooper wrote:
>>>
>>> 6.6.74 is broken too.=C2=A0 (That's the revision that the ARM tests wan=
t).
>>> So it broke somewhere between .56 and .74 which narrows the bisect a=20
>>> little.
>>>
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/=20
>>> pipelines/1761323774
>>>
>>> In Gitlab, both AMD and Intel are failing in roughly the same way.
>>=20
>> Something else goes wrong in QEMU even with my patch for the hypercall,=
=20
>> and Linux eventually crashes.=C2=A0 Lots of unhandled memory read/write =
in=20
>> 0x1bfffe000 - 0x1bfffeff8, which is marked unusable for dom0.=C2=A0 I tr=
immed=20
>> lots of the consecutive "unhandled memory" from the attached log (313KB-=
=20
>>  >22KB)
>
> Seems like Rogers patches need backporting too:
>
> x86/xen: fix memblock_reserve() usage on PVH
> x86/xen: move xen_reserve_extra_memory()
>
> Regards,
> Jason

I just tested this with your RFC change + those 2 backports on top of
stable/v6.6.y and Linux does boot afterwards.

Well found.

Cheers,
Alejandro

