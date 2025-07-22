Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB02B0D9CA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052593.1421324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCFQ-0004N3-AZ; Tue, 22 Jul 2025 12:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052593.1421324; Tue, 22 Jul 2025 12:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCFQ-0004L2-7f; Tue, 22 Jul 2025 12:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1052593;
 Tue, 22 Jul 2025 12:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueCFO-0004Kw-NT
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:37:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2415::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b793b1-66f8-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:37:16 +0200 (CEST)
Received: from MN2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:208:23c::6)
 by LV3PR12MB9095.namprd12.prod.outlook.com (2603:10b6:408:1a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:37:12 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::5) by MN2PR18CA0001.outlook.office365.com
 (2603:10b6:208:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:37:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:37:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:37:10 -0500
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
X-Inumbo-ID: 98b793b1-66f8-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diHoktTLe5momw1y3ciRU7/rpNWUgm4jecwzsik6Oyjbp8JkvicXsVtExEd2g2gBCTq76sfpcY/jgPQYVvtToMjAeImCzJXBpikMDPdMyANb3s5RxWFVGhA2B7hKoWJHaipxnZJPThJ3vR2VilgdpdhqT6eHwP0Id4HCz/aozxJnb8RhvG0RdTHakN0r0DbmPxYfpbhWvlFQCSCs4HIHlqmopB1y778ffyAL/uPBTBzDNLnOzTRHxIQGuG5A4LM9qSMbTIr41MxlfKVn5JwK0nk4T3UNYDNEn8An80QAedx/U7k8klroRlqYJ4D54e791ocZj01+GEJExUwwr2EaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGphgP6EftAW0QnFRnRRBUPbyvdDi+ylBw9k5Tc8njo=;
 b=diBYYZyEtsm6uf//CcuKLRvSjiwliWgRY0LJzWi2hIFcAv3V4xNQ5LRUEQIFLZpkhphY+BxFp5DqBSYDF4JC35AMAnTSNeKnqbAd8fjFqThr4djb6QVUnJ8j83QAtfhGhBRZsvVk4yjJaiUDJ8fMMNNs7vnefWQTsL5b2SbDgOBYckdNqu+98vUaoESeKeoeQbna9raUuAHCr/R4n3P8f4ZUPodBPSS2/fzycO5QdXTmqU0LisSP/o3FuavFVfkJYfP2MZGgofnjKAGzH2YdhmAAnKT1TlZGkQBHi2jilGvxOZJkDiui9o6MiSddA/Ui0vzSLn2QpYRi+PmW0r+o/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGphgP6EftAW0QnFRnRRBUPbyvdDi+ylBw9k5Tc8njo=;
 b=sCFBvlyTZCU3XE6UDSBaoIlsFIFutalyB9etwSJTPRlXUcoFFnKagg+5ivSzDVW2KgvkiIcb1qqT9ymi2BoyrQaDgyDGt0NBzp2M9gu9l0fWXN/7draPJa30A5sDqlfkHVQJ3+ixIniMDrL0KgQqFcGOhctOgj957URDRAzaLuI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Jul 2025 14:37:08 +0200
Message-ID: <DBIL7TSOVEXY.2SBQ063EVQ7GK@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 09/10] dom0less: Reinitialise all variables on each loop
 iteration
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
 <e18e45f6-cffd-4bd9-9091-d2e5e979ffb1@suse.com>
In-Reply-To: <e18e45f6-cffd-4bd9-9091-d2e5e979ffb1@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|LV3PR12MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 452a615d-1691-4961-062c-08ddc91c7b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGc2bGwzUThsSWZaTlllL3BwQjdnRWJ0YUFkOE1wTWhTUTRzRlQzcVVBVldp?=
 =?utf-8?B?NEpzWWJUaEJ1R2JZQklSaXR1U3duUGs4dXQ2Sjl6UEx5ZG04UUFZMmZBdUFo?=
 =?utf-8?B?RVlveDkzL1ZmYmJMYVZCdi92bkkycklmR3JVVVp5SEhNYVZuVUtZUVFGZThs?=
 =?utf-8?B?dTd3VHN1d21JYVk1NTlUZlZxQnNiQVdwdWNYakh2aHJ6YjJ6ZDIwd1hVTm1p?=
 =?utf-8?B?dENqRU9GQmw5aDU2OWQ2ci91RVdiMVQ0ZkdOYVpSQnU1MnZISmRuQ3JpMlkw?=
 =?utf-8?B?Y3M5V0hxclFtWHByNUpacjhHNWFLRC9LVTl5dVZabFNGZC9PZ291cHF2MW00?=
 =?utf-8?B?UnJCbTh4d0h0QU8rOHJaZmIwRjRPRHhaSFFEN0VTTmcxQVp5a29leXExOUhM?=
 =?utf-8?B?ZHdLNk9mT1ZHZ25BbTJueWI4L2pHbUd1Ym9hYXRyQzJmRjhXc1dobjIzeHBS?=
 =?utf-8?B?NTZrdFIyanVuTjA1K1l0SkZKNG5JMjJnYkZuVERZeENLNGFjVEdsd3BvQ3Nv?=
 =?utf-8?B?eE02Vy95VU9IeC9SZ1FXWXZHb1FtYW5rUE41UWV6K2hCdDRLZzl5M3F3ZzV5?=
 =?utf-8?B?aEVOUmplRE1mR1RSVmFsT2swTk5udjM5T05FcWZZRFlDQ2VheWpFWHRnT0lk?=
 =?utf-8?B?eXEvRHNmWWcxWHdTbCtGU2hVU3E5VzFnN1oxT1ZWVHd3dnRJcmQwdkdVOEc3?=
 =?utf-8?B?dDVmYmdKeHlNMmJQVjRmZ2U0WUpycmlhdXdQbDlBY01zdnJJYytVRStlYlpX?=
 =?utf-8?B?clZhalZrd3Z2UlhOeVRtVWsvZUFVem9xNk4wTlROUVlxVWJtYnA3UU40WFZx?=
 =?utf-8?B?aTBna01TOVZCM2RtQ1hzSTc4b28zQUFpZmhYd0NIeEN0RjJEalRkM0pyRUYy?=
 =?utf-8?B?cDlPYU5RMUVQc0h0dTBwcVFsNkw5TjkxaUxSb2FYRTJuaUN0NHVpRzVEU0lx?=
 =?utf-8?B?cGpuT3VvSy92Uk03UUsrbG54WUhHRUtBRnVad3RMRHkzTHZsUXJSaFhpTG5C?=
 =?utf-8?B?SWtPZTJCMWtiSTZ0UzNYZXlNZ0U0VTdqK0hwQXJWYllnQnJJOEd6YXVvZUVj?=
 =?utf-8?B?ZEZCZFZILzR4WHp0UE9PM29zWUpmeU8zTnF5V2ZmZFFlVmRSZXZjVFpFN0Q2?=
 =?utf-8?B?QlFuODdPRWZlY0FuRFpIVmlEMWFTaHB1SndlemxzdjJZa25Rb0J6MmdDWmd4?=
 =?utf-8?B?YWtZWm5JZEg0MHR2bEpMUVdKUVlDbjE0RW5FN09lN0F6c3c5TzF0SlJRUElF?=
 =?utf-8?B?cU9FeTREWlNJc1RyUU1STHF1a0hNNkpBY0ZRWG9zUmkvWUVqbkl0cGdDNGFv?=
 =?utf-8?B?eThzWE9ZZDZLTStOaGl5ZG5tUjdDdkdmSjc3TDAvMkI2ODFoeHhGdVFxcVpl?=
 =?utf-8?B?MzJSb211RkthOENCSFF6QVlxUnpOY09tTktJMGtCYmdkRVBVbmZOMm5uSity?=
 =?utf-8?B?dFpYZG9sb0NjbUllbWZjNjlvRjZiaW9rUWhRYTBlSjhSTDZtNEREWlEvYTlY?=
 =?utf-8?B?c3B3WU91eWdlU1VkZ05RN0ZmN3ZvL1U1TExkcmJUYWdsOHhaRGhKbEVMbXlJ?=
 =?utf-8?B?YkppRys3L2Z3V2dUOEZ4dm43UitZNXdtSWlRQ3lHRVMwdU9wRHVCVGs0a2du?=
 =?utf-8?B?QXpPR0UyYXM3cnZKM2ZWMVBaZHdNckcybGNGK2J3blJIZkhYOC9rVVYxeTVz?=
 =?utf-8?B?L0h2UHRVdGlVbFVzU2VuTkFrUVR5VTN0T0F4V3g2b2JVdXdHQ25xeHJGUTdR?=
 =?utf-8?B?SVJiWXhoR0JlbjlWaktCK29LUk5SbS94ZnVRcWlxQkhXRmVVN3RrQXYrS2tF?=
 =?utf-8?B?LzdBaXBwU1ZqVU5vKzhXV3VHeUlYSG5BS2xEdXVoa0tvUzcwMHpaRU40VXpC?=
 =?utf-8?B?WUM3ZUZGSWlHa0tydWdidEhkTS9HQVFuVGM1ODF5ODJKVWtUNkZCV2ZXL3FW?=
 =?utf-8?B?dHlRY3FNTlRYMjFteXdyRnUyWXZLSXV3QXp5RkVlZlYveVc1a0pHQnRHM2s4?=
 =?utf-8?B?YTlRVnhHWnVSZHRoblpYTjFmeldGMERZM0pJNUcxWThuZklRNTlVNjNKODZi?=
 =?utf-8?Q?cVB1kI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:37:11.8582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452a615d-1691-4961-062c-08ddc91c7b29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9095

On Tue Jul 22, 2025 at 2:18 PM CEST, Jan Beulich wrote:
> On 22.07.2025 13:59, Alejandro Vallejo wrote:
>> Reduce the scope of every variable so they are reinitialised. "iommu",
>> for instance, isn't being cleared, so the wrong flags may make it to
>> domains that should not have them.
>
> Yet "for instance" isn't quite right, is it? "iommu" is the only one wher=
e
> the (re)init was misplaced. The other two ...

We do strive for minimal scope where possible. But you're right "for instan=
ce"
might be misleading in suggesting there's more bugs than one.

I'm happy to have "for instance" removed, leaving the rest as-is, if that w=
orks
for you.

>
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -826,14 +826,14 @@ static int __init construct_domU(struct kernel_inf=
o *kinfo,
>>  void __init create_domUs(void)
>>  {
>>      struct dt_device_node *node;
>> -    const char *dom0less_iommu;
>> -    bool iommu =3D false;
>> -    const struct dt_device_node *cpupool_node,
>> -                                *chosen =3D dt_find_node_by_path("/chos=
en");
>> +    const struct dt_device_node *chosen =3D dt_find_node_by_path("/chos=
en");
>> =20
>>      BUG_ON(chosen =3D=3D NULL);
>>      dt_for_each_child_node(chosen, node)
>>      {
>> +        const char *dom0less_iommu;
>> +        bool iommu =3D false;
>> +        const struct dt_device_node *cpupool_node;
>
> ... had no initializer, and also don't gain any. So they must both be
> set inside the loop. (Irrespective, the scope reduction is a good thing
> imo.)
>
> Jan

Cheers,
Alejandro

