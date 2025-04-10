Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368CA84C06
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 20:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946163.1344146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2wWb-0000gs-5N; Thu, 10 Apr 2025 18:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946163.1344146; Thu, 10 Apr 2025 18:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2wWb-0000dk-2Q; Thu, 10 Apr 2025 18:21:17 +0000
Received: by outflank-mailman (input) for mailman id 946163;
 Thu, 10 Apr 2025 18:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2wWZ-0000dP-C3
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 18:21:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8689dbcf-1638-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 20:20:49 +0200 (CEST)
Received: from BN8PR04CA0012.namprd04.prod.outlook.com (2603:10b6:408:70::25)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 18:20:44 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:70:cafe::c8) by BN8PR04CA0012.outlook.office365.com
 (2603:10b6:408:70::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.37 via Frontend Transport; Thu,
 10 Apr 2025 18:20:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 18:20:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 13:20:42 -0500
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
X-Inumbo-ID: 8689dbcf-1638-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rU6LUF+C2lsmVqkPq4qpsypf7U3wAy/su81TNN4G8n5LYcHvvo/nF2TeeHP+txequRGEA+fGyaePdlcg+YMFkiyV2Buok1PZqOBGlHBuMMW+VvGsl+qtj76hOFA7YcBuwBMRmR7zWItYUnp83gcykf8wj+LhUIHJ8jS4BjX2H82p3r7x712Q177q1T50TDMdTa2WOVYEiMBNooXdEN2AL1lNvfiitc3aib1pBzn9di105IB+2MuOEpSLLUexecaLzsd9kRKDQbS+ayvIC94R31f57UMUpEEeyGMYSe1e6XRiRyO10G04udPzW3/m7jKM6ds7kEtyOqfAUL/wAX7vAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X/9WO/LqGbkhwb578nUSjhvJMvuzwE21gFJuEcUmqQ=;
 b=nhGa6TtiZLR5VmWnDSiMfD0oFDwVt8uUmUmuMaEf9FNnynIEycIFWRUVtgtkrlSrXfJ58Sc2GTHUc6+71luaaaE6wyy7Kcu1J2xpG75LgenNz24nVxWiygSCsnjBulwlWDcd4CxPCHUGf5+/f9tQdmCUjKXeOnA3077BaL4JsZV8NhLd7uDLCpYo1tvJLWnTtDORfUDEkwxVz8uneGkPzhihQfyl9RWO0hFHiwMG8hy2ssDSJobcFbAdN7VVH1wj3eLs318eaOwfRiMziFbpLzJCRhfbs8WLqmKnXEl32rzC4AZP257CPdbkqI0GEh6dj6zbmR5EMsnWrogDwhKAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X/9WO/LqGbkhwb578nUSjhvJMvuzwE21gFJuEcUmqQ=;
 b=DTYH4mK/7/9ZdVsU4tQqQ+MiJnEUSslwKm1Ma7J36suLTuJ2BLTDU4sDpIGyNGk8geieia5LLJ5gDxoUhecrDiFn9yCD2YuY4Fn3nuyTFbki2iu4g+T0mH0C3lzVw/mQUEG9QWOsnrK4Z8ZQ15whOARl5YrAwOHAYEZUEV3QTFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 19:20:41 +0100
Message-ID: <D9360R5QOOU6.2Z9QQZYYJ5A6T@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <5da1f4ec-43ca-4279-88dd-b51d57b306e4@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f960b9e-d2ad-427d-5db2-08dd785c6897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUNxN0pYcVZhTTdieDVvMkorU0ZZRGpNU3QyRy9oa1crQXpyTnVZLzByUEJX?=
 =?utf-8?B?N1dxUnRjVytJVThhM1RINUF1T0xoVWh3RVZBUkVpSXM0RnA3aG92VW5lcE9X?=
 =?utf-8?B?eU5TZ0V5TmhYNEw1R2N0d1lFZllqYXhTeURWSlhMMjM1QmpKUHk3dU9XNFRu?=
 =?utf-8?B?MHgvd1kyVjNhbU43ZERFdDM0cEd1bWVITWRGd0sxYkJqckhwcSs4M1pWYVJF?=
 =?utf-8?B?L05uR2lxekYwTW5DK0RmYjRPSm95eTRBcU82YmVneGpnNVh2ZHV2Rzk5UEhS?=
 =?utf-8?B?Szgzemx2Q21pZEs2VUc4eGp3WDdkWlIwd0htMU1ZcEZiYzBRRk9jR0UxUm9l?=
 =?utf-8?B?VlhKUzVwYm1Cb3gyZ0tSOWJmWkZvNUJETjM3RmJVMVVBdmZ4S1RFVnJuM3dW?=
 =?utf-8?B?QUpJK3NDQm1lYThMNUZvV2xaUE5ITG5HU1hrMEkwZ09vM0dHaUxVYXpma3BO?=
 =?utf-8?B?QndGVXlVLy96M1FtWWlpWjVlSGxTWkRVeFd1a2VvbEVmQ3ZueGRUOVFCai9X?=
 =?utf-8?B?cThvMTczRkZYZ09SdUY0Y1hTM2s0b3BveFlsOGVDKy9CVzB6TTVhZENCNFlx?=
 =?utf-8?B?Z1YxbC9VRm5tSXVjUHFaMW1OL0FLRFh0dnRvZVVXOXROV3ZsNXY5Qk8vOUlP?=
 =?utf-8?B?eEpSTkcrLzlPUklCd0t6U2FqOG1xZkxwZnVmWUJVSFFJRHJRQitma3NXMFB2?=
 =?utf-8?B?Z3dPTVJYQ2R3UVZKbTl0U1FxVTI2aEV4WkRaaW1lVWlERi9kUmNuNS9rTjR5?=
 =?utf-8?B?eTZuZUIzS3V2aFhJelF3aDBnQStzMjdpaFJRVnA5RWxKVWFLQmM2YlBCNW1v?=
 =?utf-8?B?OEQ3Q3dDbEoxWUs5UnBVcjhHa3hVMHFuVU45Q3E2bTVROW5UaGhscWtNdjBM?=
 =?utf-8?B?ZmhhenFrdG9xaHNkYzRXaUV5c2FxR2x2MUpGVTFjWTVoaW5zUzFZWU4rbzB4?=
 =?utf-8?B?bHc0a284UXcwZXZlVERySGJhMGs1ZjFXc0dMdXVVb3JFOWJmUTk0QmNGaE5C?=
 =?utf-8?B?TmZERzZhWHhDSlZiNkNpdm1NbjZnZ0s5WTA4SDNrNkdHR3JGSGlTd0oxU3NY?=
 =?utf-8?B?d0paRHVjT29NL0tQOHg5MTVkZFdwa2YwYXVLSGhNdFBhUmwveXBhQWs5c05i?=
 =?utf-8?B?eVoxVTY5YzI4TWN4ZlNwM2RWWHF1YmVaalR6c0M1aXlnMmlLemtFTXpzeFJW?=
 =?utf-8?B?My9aWlBNZEZkZVhjYVdJcG5Jd05Wa2pvdUdkNHlNQjZ2dUs0RlQ5YVB3cy9W?=
 =?utf-8?B?cUc2SEp3WVZ3SERPSVdBMGc2SitKcTJxanpXMWkwbzI3MzlVY0lrb3ZGa3dn?=
 =?utf-8?B?N01uV0NncVVYMWthVkFaYmVwMFNmZFNKRGFHNFNiaEdHL2dIK0ZWUG1kTTFP?=
 =?utf-8?B?Z25uVEZkRDIvVDZiTUJYZ25CeWlsN0FVQVIrTjJ6bWZIdmxzdHV1cDNybEVB?=
 =?utf-8?B?NFEyeklqL3ZkbVpUNEk4Q29hTElYQ3loa1B0aDRjbGloeWI2TmJab3NYY2RN?=
 =?utf-8?B?QWR1NnhTUmdISG1xTW5EV3p4ZnQ0MXRIak1vNFU4V2EvR0FFakQvcFNlQUJL?=
 =?utf-8?B?YmRlY2thRTFyeGJKL3VpbEdNZm1qL2pOZWpOamVzcTVWL25OaGlhZ3k2a251?=
 =?utf-8?B?MUlVK21abFF1bnFMb0ZNS2xDdGNDSHdoM3NXREdGWWZBTXVXVlBDN3kvcktG?=
 =?utf-8?B?eVhpMFYyNmY5VnpnNlNaL1Q1TU1ZYzZNaXB1cU9kSS8zVHVhMlZzcDF1UEtD?=
 =?utf-8?B?UGIyVExzMWVhVHd4SmVqa245dUlzR0t6cEZ4cWRUNGJwTHZOMlR5S3k0SVM1?=
 =?utf-8?B?d0dJMGpKb2swSENQbXVBVXptdVlHcngwM2o3TzZ4cy9ITFFpVHBDank2R1hz?=
 =?utf-8?B?UmFqNVJUMTJoamJBcEphWWVCRW9QVDlsZm50UWRxMlppS1JMVW1WM1dpQTFs?=
 =?utf-8?B?NHFvQS9CMlBwSnl4b2xxODVJdWMyRDRpNWM0eU9JOWpVOEtPWk00Wkhjcm4w?=
 =?utf-8?Q?P0HTar7GjzLiQBKYdWHzpGFLhYe4QQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:20:44.3084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f960b9e-d2ad-427d-5db2-08dd785c6897
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290

On Thu Apr 10, 2025 at 10:17 AM BST, Andrew Cooper wrote:
> On 10/04/2025 1:09 am, Jason Andryuk wrote:
>> On 2025-04-09 13:01, Andrew Cooper wrote:
>>> On 09/04/2025 5:36 pm, Andrew Cooper wrote:
>>>> Various bits of cleanup, and support for arm64 Linux builds.
>>>>
>>>> Run using the new Linux 6.6.86 on (most) x86, and ARM64:
>>>> =C2=A0=C2=A0
>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/176066=
7411
>>>
>>> Lovely, Linux 6.6.86 is broken for x86 PVH.=C2=A0 It triple faults very
>>> early on.
>>>
>>> Sample log:
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9673797450
>>>
>>> I guess we'll have to stay on 6.6.56 for now.=C2=A0 (Only affects the f=
inal
>>> patch.)
>>
>> This is an AMD system:
>>
>> (XEN) [=C2=A0=C2=A0=C2=A0 2.577549] d0v0 Triple fault - invoking HVM shu=
tdown action 1
>> (XEN) [=C2=A0=C2=A0=C2=A0 2.577557] RIP:=C2=A0=C2=A0=C2=A0 0008:[<000000=
0001f851d4>]
>>
>> The instruction:
>> ffffffff81f851d4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0f 01 c1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 vmcall
>>
>> vmcall is the Intel instruction, and vmmcall is the AMD one, so CPU
>> detection is malfunctioning.
>>
>> (Early PVH is running identity mapped, so it's offset from
>> ffffffff80000000)
>>
>> There are no debug symbols in the vmlinux I extracted from the bzImage
>> from gitlab, but I can repro locally with on 6.6.86.=C2=A0 It's unclear =
to
>> me why it's failing.
>>
>> Trying:
>> diff --git i/arch/x86/xen/enlighten.c w/arch/x86/xen/enlighten.c
>> index 0219f1c90202..fb4ad7fe3e34 100644
>> --- i/arch/x86/xen/enlighten.c
>> +++ w/arch/x86/xen/enlighten.c
>> @@ -123,11 +123,10 @@ noinstr void *__xen_hypercall_setfunc(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!boot_cpu_has(X86_FEATURE=
_CPUID))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 xen_get_vendor();
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((boot_cpu_data.x86_vendor =3D=
=3D X86_VENDOR_AMD ||
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot=
_cpu_data.x86_vendor =3D=3D X86_VENDOR_HYGON))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 func =3D xen_hypercall_amd;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (boot_cpu_data.x86_vendor =3D=
=3D X86_VENDOR_INTEL )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 func =3D xen_hypercall_intel;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 func =3D xen_hypercall_amd;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static_call_update_early(xen_=
hypercall, func);
>>
>> But it still calls xen_hypercall_intel().=C2=A0 So maybe x86_vendor isn'=
t
>> getting set and ends up as 0 (X86_VENDOR_INTEL)?
>>
>> That's as far as I got here.
>>
>> Different but related, on mainline master, I also get a fail in
>> vmcall. There, I see in the disassembly that
>> __xen_hypercall_setfunc()'s calls to xen_get_vendor() is gone.=C2=A0
>> xen_get_vendor() seems to have been DCE-ed.=C2=A0 There is some new code
>> that hardcodes features - "x86/cpufeatures: Add {REQUIRED,DISABLED}
>> feature configs" - which may be responsible.
>
> 6.6.74 is broken too.=C2=A0 (That's the revision that the ARM tests want)=
.=C2=A0
> So it broke somewhere between .56 and .74 which narrows the bisect a litt=
le.
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/176132377=
4
>
> In Gitlab, both AMD and Intel are failing in roughly the same way.
>
> ~Andrew

I've bisected the tags and it was was introduced somewhere between the
v6.6.66 and the v6.6.67 tags.

The hypercall page was removed very shortly before v6.6.67 was tagged,
so I have a nagging suspicion...

Cheers,
Alejandro

