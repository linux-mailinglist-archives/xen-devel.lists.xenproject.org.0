Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4235CC53A4A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 18:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160399.1488553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEXW-0004tV-9G; Wed, 12 Nov 2025 17:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160399.1488553; Wed, 12 Nov 2025 17:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEXW-0004s4-5l; Wed, 12 Nov 2025 17:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1160399;
 Wed, 12 Nov 2025 17:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJEXV-0004ry-2W
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 17:21:49 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 100b17b6-bfec-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 18:21:46 +0100 (CET)
Received: from SJ0PR13CA0072.namprd13.prod.outlook.com (2603:10b6:a03:2c4::17)
 by MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 17:21:40 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::88) by SJ0PR13CA0072.outlook.office365.com
 (2603:10b6:a03:2c4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Wed,
 12 Nov 2025 17:21:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 17:21:40 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 09:21:38 -0800
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
X-Inumbo-ID: 100b17b6-bfec-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAuG92hq6frk7OxhbTPubusFHD4FOSGj5C4Lys8TLNBiSnprlJQAxKc/dyn80pchbhEirX4hTA+kYytwvFMNKQDCEzWXRFlT0m5Gb1FjZs4mRJVpPviGocBSR3ZiyWYeLsI1+j/Hy94LWzYS/jBH39sr3cPRtbUwOiCkZnQfJlwssSqQhaGzWtY9vDvzXcmYxN1CaY9o72BH9+gz3sxnUScQ93V/6jFDp+283+FJHvmjNrkJURwO2AzSLrl4MK2+BGGI0YLAkZn7TBzNERbIgepTbUw6FdPjetTUTVOaYTovLbl2Sm6aUF/HrYDanB95v2T+E88kMltSoKNgXezZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO3LhbHyUb4uHq0X7a53YLERszG34i+96s5FCgZT1W0=;
 b=j8KAQzC2thti2YDsQ0wQQL/7JZ46kddqQQ0xXSLpoQDDWY9FQnOOS3otlLgzPCGjnpyBRkQWtaDgxXOg3pkOMRHqFVAjUg654JrmhTAu5n12fdJ0LCOj3g76sAnab5vrkgygCIzZScYbLbdXY80LGNBk55P8Avxl4anurSUhITfXqHrIIm3aglRoTTJqZ9wv9JSt3hq8s4nEZ8wk4q+E7IDWv5CXEtUBg8M3AAuZoSJSZDUQ4eYxIj1usT739M+q9JeXRA4ih9OXL8zXf/qs828Yv9FQQOrZ6v3avQonzEGWiyfKUC2f5XwDuknuT95eLQz/9yjXwxUCj9XYh127rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO3LhbHyUb4uHq0X7a53YLERszG34i+96s5FCgZT1W0=;
 b=iaf6up6Ooa8HPDJo5rTnNrfpM5w2KDj1p6UllTy5aKnzjtl++viZ476+k/12BO8yLjtDjCto6iRC3lqyZYI+k3NbFtUJJXqTDyYlCaUl3CyVkHbz/FGOo7v7mPn+KWSJ5eMeRdRoXGJ0SLhD7WlkLoHs38qifuWL9k16Qk7oyFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Nov 2025 18:21:36 +0100
Message-ID: <DE6W16PDQHA8.DM0FQ1YLFQ7R@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
 <a7991534-b200-4b00-9a45-2d4c167d7ec3@epam.com>
In-Reply-To: <a7991534-b200-4b00-9a45-2d4c167d7ec3@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: b387312c-84b9-436c-93dd-08de220ff181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVRWbXhIYzRxU09aRi9hRUY5blZ5M29rQytRSDlHWjhCc1pxYVlCSmlnWllS?=
 =?utf-8?B?bVdzekxpNzYzQ245eFFTayt2YnJxMFhvK0s3VllublgrNU5qVlNMM1BheVF0?=
 =?utf-8?B?TkN6NXhFankrb3M1MmdlRXhtZjhENFRmMkxqakwwanIzOFIwZU1oc2QzOC91?=
 =?utf-8?B?Rm1vVzdCc28rSnBWclRqcS9nQkNwVWtvaUJCOEplS1JONkg3M2RZT0NRNUZC?=
 =?utf-8?B?eGFpdkVuRjYyUmRGcjBsMU02RlZIakpPYzdGQUNGNkpMcE4zSHppWmlGajBH?=
 =?utf-8?B?c2ljLzhQTGNrK2lJT0s0eFVhWklqTndwR2tPQlRVS2Q1WDRuUXBCa2phUjJC?=
 =?utf-8?B?OC94LzQ5b1dES1g1MGJvTEtHaXVWaFFXOVB5RFRMN3g2REk3YTZKREJicWRx?=
 =?utf-8?B?Y0lvcGliUEF0SzhxTlFtTmFpajRVbUVvOVBpUm84bzhMOFo1NVpBVzVJODlB?=
 =?utf-8?B?VmdwT2NSbTd0ZkVyNnFKZ0l2cUo1d3EwWGtBQWdMQ1FuMGhXTHRyaXNIanBu?=
 =?utf-8?B?Y0VSUWc5ZUFhR3lDT2Y5S3piOWp0aHlwZHpmWkhOUHRpR2ZSTmlPZC9ONGc0?=
 =?utf-8?B?bHRDalk3ZzhEcEFwZUo2Q25BWkVOczFUb3F3VkV4TXRBR2FCRlJEYUcraVZs?=
 =?utf-8?B?ZXZzNTlOb1paSy9ubzhMSUhYTTI2Y3RUUys0Zzh0M1Q2MlpSbVlLb3l6aWRr?=
 =?utf-8?B?S1JzRW1ib0VjQ1RmcTFjM1RLNFFieFZxTm9YRUdLd3FnakhCZGJhL21Tb3dw?=
 =?utf-8?B?YXBsU1paZDg3ZHFQNW5pc0g2YmFWSzdVSE10RHhLVlp0ajZIN2JTNVJNNGdu?=
 =?utf-8?B?d1lFSEUyd1VFcjZ6SjhvazZJNWVVa3V5c3Z0WDg1SzZhUWhBY2M3ZzVXZ3dq?=
 =?utf-8?B?OWgzdmx6MUpVRndCQlBCOXRFSWwrZmQraElpKzVyd1NCbGRJRE91MlZTTGg3?=
 =?utf-8?B?T0dBa2VITG0rRlprcEprYmJYa0NsVEVjZU9iTmZBZldZNnNweDJnZkY4V0tI?=
 =?utf-8?B?TUptck1QS2VENjZQZWxOUGNZeGo2cTVabWtaa043RDhwM2gza1F4MFlNY3Vs?=
 =?utf-8?B?Wm1IMGxjVDRGSmI4ZW5nNTNDZm9Dc2F5YTJFdGZRMjJQUk9mbkw0bE5hYTR5?=
 =?utf-8?B?amxqcUVSQTVHaUJNRDkvQ2dlYzduakNtV3lyWDNRY1hFL0dHNDlYWU5oZ1VU?=
 =?utf-8?B?alN4VkdsVklnTXhVYldoTmFRMDlpL04rM0hwamUvcGZhK2pXSHNWc2ZITzVi?=
 =?utf-8?B?WHFwN29HQ0cvR0pCQzd5cmdvSExXOWhrTEVLVWxpUEI3MnF1a1c0U203ZjRv?=
 =?utf-8?B?SUoxMzhId3RRbU9PQy9pMC9WOFREdmY4NVMzQnBmbFVhcXR4SHNNbkVCcHdY?=
 =?utf-8?B?UkxRSjBWdkVvaTNGMEloR0dBS1JZMHdSbW9mRisxZ3EvWVZPZzRCeDE4dllB?=
 =?utf-8?B?enhSTzF4bFR3RWVnZmdtSVovVmZzdW9QVUxYMVd4elVYL1NVeWNvKzJzcUEw?=
 =?utf-8?B?QjR6R3ZRWGhIeThMNWh4RmVLVnV6UnQxNENXdy9Fcy9DdTNDclpCRmFaNEk5?=
 =?utf-8?B?ZHJyUXpUcjJ4ejUzWEVsVUc3MVFtSGhCK2pmKzJyM2NUOGZQRW9rZE1jd0V1?=
 =?utf-8?B?Z2I3VjFxVDNOc1JrYkV0OWYzZ1ExaHRrWUVQQjA0TTU2dHJYZEUvcG53cDR1?=
 =?utf-8?B?SjZOa0dqeHh0QndxVUhGek53YmdIM01QVEhnN0g4WnBpY2VMMjBCYmk3VURN?=
 =?utf-8?B?L2gvUzduVVpJMkxFY0pjRGZKMjhXK3p0dGZ1Y3pHamJYc1lKVyszZW5WY3A4?=
 =?utf-8?B?ZkZMTEFUWjJCSTZ3VDlEbHF6dkRCdzdmNndEaWY4NWdUcFFWcmdzTkZIc1dz?=
 =?utf-8?B?Vm4xbkxpa2w2NUU5eU12SlJvS1JabmE5TzdiUVlkcU14cmM5WUMyL3krencr?=
 =?utf-8?B?TjhkU3NUQnR0clhVQXg2ZjYzWWQzQXRQQ1FrZnQ5SjN6c00zZVA3bmoySlU5?=
 =?utf-8?Q?FbTmhomRuiIMUPvXwFfX2rVQ1fsldE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:21:40.3501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b387312c-84b9-436c-93dd-08de220ff181
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883

On Wed Nov 12, 2025 at 4:56 PM CET, Grygorii Strashko wrote:
>
>
> On 12.11.25 17:22, Alejandro Vallejo wrote:
>> They are unnecessary. The only two cases with link-time failures are
>> fallback else branches that can just as well be adjusted with explicit
>> IS_ENABLED(CONFIG_PV). HVM has no equivalent stubs and there's no reason
>> to keep the asymmetry.
>>=20
>> No functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> I'd rather remove the "rc =3D -EOPNOTSUPP" branch altogether, or replace
>> it with ASSERT_UNREACHABLE(), but I kept it here to preserve prior behav=
iour.
>>=20
>> Thoughts?
>>=20
>> ---
>>   xen/arch/x86/domain.c                | 10 ++++++----
>>   xen/arch/x86/include/asm/pv/domain.h | 25 -------------------------
>>   2 files changed, 6 insertions(+), 29 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index 19fd86ce88..0977d9323d 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -571,15 +571,17 @@ int arch_vcpu_create(struct vcpu *v)
>>  =20
>>       if ( is_hvm_domain(d) )
>>           rc =3D hvm_vcpu_initialise(v);
>> -    else if ( !is_idle_domain(d) )
>> -        rc =3D pv_vcpu_initialise(v);
>> -    else
>> +    else if ( is_idle_domain(d) )
>>       {
>
> The is_idle_domain() wants to go first here, i think.
> [1] https://patchwork.kernel.org/comment/26646246/

I'm not sure I follow. I inverted the condition in order for the PV case to
become the fallback "else" and be thus eliminable through DCE.

>
>>           /* Idle domain */
>>           v->arch.cr3 =3D __pa(idle_pg_table);
>>           rc =3D 0;
>>           v->arch.msrs =3D ZERO_BLOCK_PTR; /* Catch stray misuses */
>>       }
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        rc =3D pv_vcpu_initialise(v);
>> +    else
>> +        rc =3D -EOPNOTSUPP;
>>  =20
>>       if ( rc )
>>           goto fail;
>
> Actually, if you are here and have time and inspiration :)

I may find at least one of those two :)

> - if ( is_idle_domain(d) ) staff can be consolidated at the
>    beginning of arch_vcpu_create() which will make it much more readable =
and simple.

Good point

Though it's subtle because the idle domain has wacky matching semantics
and there's many exit paths. Let me see if I can make a clearer version
with that sort of consolidation that is not a functional change.

> - mapcache_vcpu_init() is PV only (->pv_vcpu_initialise()?)

This I shouldn't do. It's PV-only only temporarily. The directmap removal s=
eries
(in-flight for a while now, but ought to make it upstream sooner or later) =
makes
it also usable for HVM when the directmap is sparsely populated. I'd rather=
 not
generate more churn than I have to for that series.

Cheers,
Alejandro

