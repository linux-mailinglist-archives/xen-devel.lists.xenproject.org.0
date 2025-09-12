Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAC5B547A9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 11:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121692.1465831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux09H-0001Hs-59; Fri, 12 Sep 2025 09:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121692.1465831; Fri, 12 Sep 2025 09:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux09H-0001FO-1J; Fri, 12 Sep 2025 09:32:55 +0000
Received: by outflank-mailman (input) for mailman id 1121692;
 Fri, 12 Sep 2025 09:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4xbX=3X=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ux09G-0001FI-5Q
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 09:32:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2009::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73ee666f-8fbb-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 11:32:52 +0200 (CEST)
Received: from DS7PR03CA0020.namprd03.prod.outlook.com (2603:10b6:5:3b8::25)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 09:32:49 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:5:3b8:cafe::b8) by DS7PR03CA0020.outlook.office365.com
 (2603:10b6:5:3b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 09:32:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 09:32:48 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Sep
 2025 02:32:47 -0700
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
X-Inumbo-ID: 73ee666f-8fbb-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERzt3ygZZ+3B+prWgvsEEeI1SCNuR+J8AlBxMbw7pPXKd5EYZZsYXcrLHxOhtf6KGkbcTy6lNqIPTvJrx5BImkZRWA4tHsuvtmuNXYtG5XRg8ne49UsVY009JZH9R0SFVNBuFifW0sjISdAb5TyoXnf9nvoksNW+gRvGv2GpC0/8giZSKXCF/n0u9YVMAVplNECGYrk/Igt5lQbNojXFq1cBCuRGKXhWwbVEP8wu1KfcNmCPNmYCyz7AE7Ayq5pFJkhjciJMjPr/9gbFLXzprLPa+bO6RJLhMslzgcikqfTwhze60U0sc+lbMmDeXXe98/qVcbfWUTMdwxab3fIP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCyprfv3sjr3a6DlPE2wBcwa510YmRrToiggLr1oa5E=;
 b=cjZWiQ3xKEL8Y+8V83DD75UY/1UYw+e0CVo9otlJdgVrR121vdgF8fyxuHqaUAICRWk6y09oJ6k8EcNbRf10OLerI0BgEtU5BDdJKG6gb1Gf1oXFtuYbcGvqA70NnGtaAmMB+yXp7Q1k5p7QXebKi9QvmUzSxxzVzkqZsFE1Kj8gDbg1AJhTYT0VN3DLVJeFLvQTiY6RmR0e1sPmnQNXiaEFEHD/vVSskze5tmRgDi79olvXJ6fWt04X9VFtemx39xGcj3kn89/6phRw8FD5n3rLfLNiULJip9/pSn/EBII+gZ6l7+yArwq59hUQ+ir+ibHbRk29Fkpro0EJEjmYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCyprfv3sjr3a6DlPE2wBcwa510YmRrToiggLr1oa5E=;
 b=4RYQWMm/Wzr1yv+AXhVFezJVjyd+woOaAW8WxdaeCbjR+rlx9qwoTqT92tIr2unROg8vIRq7z8jiDHebqJCtsmLdWaseo4yhAA9ME7WUIDQFaunml7k7yMRSE+vQWzG1wHOREiPxAcrlIHfM7+l2FyabghSxcXh7DC3rPW2+yns=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Sep 2025 11:32:45 +0200
Message-ID: <DCQPUZE9QUU9.1R2NRUOT3952H@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250911162336.23887-1-alejandro.garciavallejo@amd.com>
 <20250911162336.23887-2-alejandro.garciavallejo@amd.com>
 <4b958afe-dfcd-4ac0-bc09-468e2b9b2710@suse.com>
In-Reply-To: <4b958afe-dfcd-4ac0-bc09-468e2b9b2710@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 3958e738-bd22-42d5-fc23-08ddf1df5631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDdFa0pza1pRbmNwbFd6ekZiOTNSVFBwN21Fa2o5bHc5cThpNWdjMjVSTzhy?=
 =?utf-8?B?aFhkQnNBVmpqVUkvQi9KWmNXOUJjbUxSZW5tcmJjc0YxSHVHbHpINkRwc21h?=
 =?utf-8?B?dXZmaVdsUFlsanROSnA1cXhXd1ZWdVdheGRyVHVaeUw1SC90TzM5MjM3aFpG?=
 =?utf-8?B?OHFKU28xa0g1TWxIazFoMjJhaWxHRlZZVzhId2hpMlN0cHR2SkJlSjk5NEJE?=
 =?utf-8?B?ejhqNnhmWnpyUjRCMzBkcktndDFRWDRUbVlHVkI2akd0dzV6ekEzSENva3lm?=
 =?utf-8?B?SEZqK1JtRWc0cWNHUklnL0plTjhPSGhleERCcUl1c3JJalNUR0xQb3A2Y0My?=
 =?utf-8?B?N1hla3k1NjhZbC93d08xT0s0cXdrYWJkYmM3UjJUMERsOW8rekpSM09VdTNP?=
 =?utf-8?B?dEQ2WmlkTkwxcmZJeC9EYkV0Qm9LQmtmUXpybnhNTk1jVk1CZUVQWFpGWm02?=
 =?utf-8?B?ZnhDcGVzdUJzK1NBZXpVK05TcmYvTlJXZ3JnTk1KNlRKUW94eVBOSzFnKzUr?=
 =?utf-8?B?K2FScm5tQzNPTWp6SDBlZlVITG1jQnRwVG1pWGZvaWFnMEJ5N2dMTEw2aXla?=
 =?utf-8?B?NHIxWE5QeE5IQlNzTWxTS1FmdlhJUFVWRUI4RjdoQmpOZGF0Q2p0Skt1dmVr?=
 =?utf-8?B?RXhTVk4reUlpSWR5QjZ3NG9nazQ0cEtaQ2g5cWRCcnFSMDcycUQyY1FyaFcx?=
 =?utf-8?B?ZC9LQzVVTVBwcEMvYTE3ZGVjWmE3Q2VncWFEcGRYclJhcTA2SzcvNWFha3FW?=
 =?utf-8?B?Q3NmeUZtcmcwdWRxdjhkUTlYTXZOUDlUNVZsb0VtanpiN0Y1U1NDQWlKcWVl?=
 =?utf-8?B?a2ExK2JMSkxpUk9zZXBLV0taQVlrenRSY3ZXYk40UStTL3ZHNDZaSG1kTldW?=
 =?utf-8?B?QkhBL0J6L2FBeWw1UHJweG45Q3RxamJTTGNSNXNvb2N1bWVlQmhCK3hWRXNt?=
 =?utf-8?B?UGd0UlFsTTNEaGRFbkVFaHoxNkkwNndLb2NEcWx4RVFpVC9nbnByck1aenNl?=
 =?utf-8?B?U1kzZUxYQjlxb0kxZEp3Q1VaOG9OcVc2YVhZU1FkS1NDbUFTUjZQdnp0ZVdH?=
 =?utf-8?B?djl2RzQzZXNqczNqQStXWUR5RkZoTGEyVkQzWXVqV3JoL2NnZXZzWHkwRE1D?=
 =?utf-8?B?MkxZZE4zMy8ybW9WZy9UZ2pHdHgrejZCVkl4MnZINnlqL2JrY1pIcW1VTzZp?=
 =?utf-8?B?WXBFOFBIaVdaSXZGWC9jZXVsaFdYbGNxLzVibXE1NzZ3d3AyYnFLM0lzeFVB?=
 =?utf-8?B?WFVSaExmOURpRWNtTlFNU3dlNUgvMlU1c3Axc1ZVOFY4Nk1Od0ZHU2xkY3dH?=
 =?utf-8?B?b2JHNHNBa2VhUUx3SlJ6TGE5OUJoRG94YWRROTJrc0tsZnZ3SXJ6Qm9sZkFq?=
 =?utf-8?B?dkkxb2krMnBzQnpXQXFZM3UrRytESERNN0s4VHlpL1pGOXdZaER4azl2RWdE?=
 =?utf-8?B?R1N6THdRS04rNHZFSzUvWHo1SmJvRVo4cHpyS2F3WC85WWJQNm9ibStmc3hL?=
 =?utf-8?B?R0R2ZlgwSElpdFBVRHZ5dmtlQTRNZ2I1c0RSejR6Tjh0aWt3ZDVhZjRGWGtq?=
 =?utf-8?B?aUtpYWFTR3B1cmxQWFQ1VW1Ud2FjUjRmNU9iUlZFSHlEczl6cVFZZDEwRW42?=
 =?utf-8?B?eUZaajZ0d1hoaU80eS9TdW9FN1Z5TFZGRDlhc1BiVzBBK0xFWjhzZnRFMGtM?=
 =?utf-8?B?VTFuMnFsUExrV2NkcWc5SmpJWUFqVC92WUpVNHpHaXQyaENKK2EyampadzBT?=
 =?utf-8?B?QlphVjI2SUpYTzQ5TUZsazR0U0l6d09wVnpuU1RjeGNDSVluRVNrNUZhbEtw?=
 =?utf-8?B?VkF6VlZhcGlrdndTV0ZWK2pRb0NCdDhGcE9JaUdPN2x2VG1wWXpvQ3hleksr?=
 =?utf-8?B?dmVldGF6V1dMTTJXVUJTNTBxZC9VT0xVL0VEWG1UaUFVOTRtYXJvdFgrYnlq?=
 =?utf-8?B?SEY4QjI3NkZhVjZYWGF2VnJoLzN1SFNKcytwUHdZTVBEcHRpMFozRjhZanJj?=
 =?utf-8?B?SWp2VVpQaGs0RGpzd1RzQlJRbmlzOFEyS29iamo1ejRMeWhRbHB3c3lvdnlk?=
 =?utf-8?Q?w/tGRG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 09:32:48.1731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3958e738-bd22-42d5-fc23-08ddf1df5631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

On Fri Sep 12, 2025 at 8:40 AM CEST, Jan Beulich wrote:
> On 11.09.2025 18:23, Alejandro Vallejo wrote:
>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
>> by the device model. The GPE handler checks this and compares it against
>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>> related bit in the bitmap and adjusting the table's checksum.
>>=20
>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until i=
t
>> reaches 128, even if that overflows the MADT into some other (hopefully
>> mapped) memory. The reading isn't as problematic as the writing though.
>>=20
>> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
>> then the bit where the "online" flag would be is flipped, thus
>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>> that happened outside its range. It's all terrible.
>>=20
>> Note that this corruption happens regardless of the device-model being
>> present or not, because even if the bitmap holds 0s, the overflowed
>> memory might not at the bits corresponding to the "online" flag.
>>=20
>> This patch adjusts the DSDT so entries >=3DNCPUS are skipped.
>>=20
>> Fixes: 087543338924("hvmloader: limit CPUs exposed to guests")
>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> In principle:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Cheers,

>
> However, ...
>
>> --- a/tools/libacpi/mk_dsdt.c
>> +++ b/tools/libacpi/mk_dsdt.c
>> @@ -231,6 +231,20 @@ int main(int argc, char **argv)
>>      stmt("Store", "ToBuffer(PRS), Local0");
>>      for ( cpu =3D 0; cpu < max_cpus; cpu++ )
>>      {
>> +        if ( cpu )
>> +        {
>> +            /*
>> +             * Check if we're still within the MADT bounds
>> +             *
>> +             * LLess() takes one byte, but LLessEqual() takes two. Incr=
ease
>> +             * `cpu` by 1, so we can avoid it. It does add up once you =
do it
>> +             * 127 times!
>> +             */
>> +            push_block("If", "LLess(\\_SB.NCPU, %d)", 1 + cpu);
>> +            stmt("Return", "One");
>
> ... if you already care about size bloat in the conditional, why are the =
two
> bytes per instance that this extra return requires not relevant? They too
> add up, and they can be avoided by wrapping the If around the rest of the
> code. I didn't count it, but I expect the If encoding to grow by at most =
one
> byte, perhaps none at all.

I don't mind either way. Removing the "return" statement and the pop_block(=
)
would save 254 bytes in tota at most. I don't think the conditional would g=
row
because the there wouldn't be that much contained within, but regardless th=
e
early return is in the spirit of not going through 127 conditionals on ever=
y
GPE handle when you typically only have a handful of CPUs. The sooner we dr=
op
out of AML, the better.

In due time I want to shrink this to be an AML loop in dsdt.asl so it can
be taken out of mk_dsdt.c. That will both shrink the DSDT (a ton) and accel=
erate
GPE handling, but I don't have time to do it at the moment.

Do you have a preference in table size vs execution-time?

Cheers,
Alejandro

