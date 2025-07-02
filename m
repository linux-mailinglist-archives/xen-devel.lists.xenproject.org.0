Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65BAF5E4C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 18:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031412.1405238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX07b-0007IW-DT; Wed, 02 Jul 2025 16:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031412.1405238; Wed, 02 Jul 2025 16:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX07b-0007Fi-Ab; Wed, 02 Jul 2025 16:15:43 +0000
Received: by outflank-mailman (input) for mailman id 1031412;
 Wed, 02 Jul 2025 16:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWS=ZP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWzwW-0005p6-Kw
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 16:04:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3252890c-575e-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 18:04:14 +0200 (CEST)
Received: from PH3PEPF000040AA.namprd05.prod.outlook.com (2603:10b6:518:1::4c)
 by PH7PR12MB9253.namprd12.prod.outlook.com (2603:10b6:510:30d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 2 Jul
 2025 16:04:10 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH3PEPF000040AA.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.14 via Frontend Transport; Wed,
 2 Jul 2025 16:04:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 16:04:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 11:04:07 -0500
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
X-Inumbo-ID: 3252890c-575e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2HSariJwU43fmbWbYg/9I8FWZnCZBXBQNVdj8XcKeBfZUf0vbA6r+jQz8ILHDXDQJM6e8oaGFe1zxcCKuh2MRdO1J8AHHP83uXESqmeubfjCrupNdWk3rD5fJYFHpfzmZqVj2/+jaeUeSgp4Vi0s0Ttqcm2JER9hK+OIGOS74bz4lslu1ujI+4V1QTxQzHnIyFBSRxGhUCplZOcVEHhtIUzUElh+zezFnyt1XAz7j4dxNjVMeQSjOXFcmYBWe8fVNnu8laaeJCEaMa81rHlA8bhZPU4LAlov5eHqGTRcHPiDz1KCNPs3IhxVsI28R5nyfGLDd9b2KGImg2WrLBcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLzswKUr5nNCLA6k/8dh7nvY+qbjiX+S8Sv7ixyR5B4=;
 b=rJfocxh+wo2vhDmYkYll36dhZjJmCW1YVerll5zhUa+GKRgr81OGZuXHrnMu3rQNbj43KzKP7RUA+uK9s9Jh2RNHX45C3e3TeL0ilQjzF+Cgm6+SbilyAhVHY72LwKguekR9NQZg8NsmZKJdEmAdeVjcRaKyQr95vJJi2nbJ4HvFDK3yX9l4UUi3mLNk5mRG2BnLiSf0Gx7GHSwrM+D/1uk5Ow84xG+iF/x0mYs5CTIOYhAZMmwvBFqz3OOjvOMLPHcILrI074LrsAODWThJ4ITwqDbYV60v6MguDjt7vd5avJTN1iiDZUMYnuuqduDoFMbF9qVwuQz6yZO9gP6o+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLzswKUr5nNCLA6k/8dh7nvY+qbjiX+S8Sv7ixyR5B4=;
 b=biw/3XyWhz1rAjQBKFdERnaRXUi9lKrk+n/R6x/LO4Qob+3kSt223T+hbTOagA6vFucwTWk8xizYnE0hGojSs9HXWDCktI0dBiuMe7OrZOBaOtym+0gr4bNZ/pk987eWr3c+gZdetqxeGUJeZiAXemEb6vvhigkP8ssxvyo50hM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 2 Jul 2025 18:04:06 +0200
Message-ID: <DB1P3E6TW6WS.CPYEJLOZTFO6@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 02/10] xen: Refactor kernel_info to have a header
 like boot_domain
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-3-agarciav@amd.com>
 <3128c4ae-7146-4480-b7b3-e17f253e3870@suse.com>
In-Reply-To: <3128c4ae-7146-4480-b7b3-e17f253e3870@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|PH7PR12MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: ff52a89a-d53d-44ff-fc17-08ddb98214be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUF2WHkrOGV2N3RSZHVZK0tUaTUzZnhQcWJvWTBqZUtESzJQaWxsRXVNTXJI?=
 =?utf-8?B?WG9RaFdrckMzQnhwc2FIZkJlRm5ieTRzV2RrdGwwaUZqN0RtZWRtM2FaQTEy?=
 =?utf-8?B?Y1pDc1FFK1lWR0lrK3hiZUxMVHBYWm5FNm1IU1R1VDZQRHJhR2hwbWJ6YkV5?=
 =?utf-8?B?RjlJeHpCamdkbkxPc1BLT0JsSWZHZ3gySDhYL1FPZ1JFV0dBdS9KTWFjZ1pK?=
 =?utf-8?B?Y2ZGdmZSbmxLZHBsL2xUQ3hIUVhIUzFWNXdNQXBGUW1BNXREYTBvRXVseERW?=
 =?utf-8?B?d240ZUFVWWJINW10SkZZUkFUYThTek1UblpBQU0zQUh4cGlFWm4xcUNsRjRx?=
 =?utf-8?B?QWNaVmg1WjRHR1lKdDc0WjROSUQ2RVhBSms4VlRsNHJFOTNEUjFSNGtqNHNo?=
 =?utf-8?B?RUpaWTFvdXNmcTJZWGEySkR3Q2hCbWltdXdWSEhDb3QwYWtXTlVCd2RSRXJo?=
 =?utf-8?B?L2cxL0RMRmNsRG9ZbHNhY0lYUlljcXEwRGEvZGZtREtsMmxLa2R5WlM3VXVz?=
 =?utf-8?B?TWZMbzhQcEpHWEpwOWZGWXVHcTlqclFNaUNxSFlvQ1RBV1FubzRET0VKYlJ5?=
 =?utf-8?B?Y0lZMzhscVhLZ3BoMmlWbTJob2IrbHNmLzNhbkgvMVV2dTNuYTM0ellRTUtP?=
 =?utf-8?B?MDBteGsrcTlzTTNSeWRRS1dtaXdxU2lZOTFmUXpqUC9ERmxtYjdtb0ZpcVlW?=
 =?utf-8?B?VExHWlNnbitMbDNxYTQyOTNXZ2xTWUpNc0dtZ0xCc2JwZENkN0p3ekFGbGl3?=
 =?utf-8?B?b3E1cDlGSzFXYWlwempKTjJuekdLekNuOWg3QkZlWmhOV21HbWNRWjZ6UExU?=
 =?utf-8?B?ZnNhQkk4ZHk1UisxSmhtclJ3cVJGM2dVQlI1T1poWmpxVmZ3WUJTbHpEV21G?=
 =?utf-8?B?S2hsOFMrUFhSUVFCVGdrMERKN0RjeURIQmFiQTNITzZ0YkN5ZG9SV0Rqc25o?=
 =?utf-8?B?aUgydjV0eE0wM0ovQUR1OWNpUVlVZVNWL2pJUDJndHN5Y2pzUXlwa2RjMHVB?=
 =?utf-8?B?ai9vaTRJMURla04zT0lvL21mY0UzR2JTdkVhQ1RzMlErM3pwZDVDZ004RlVT?=
 =?utf-8?B?aVFtOHFHRUZUaWlWK0tlbzZBOUpUdjJSM0xCRFB0N3phSFBUa3FMTmdhMHhO?=
 =?utf-8?B?UnZ3bW5JdFdXcS9wTnBQdEVuQzFUS285bnoyb2hXV2MxdTRDbFdhMUR4QkJE?=
 =?utf-8?B?dnZKcUdwamxTOWZZZXZpWWQ1OFZUR2NNcmhvS1JiaHI2dE9FVEZCQXAvWDBR?=
 =?utf-8?B?a3YwT25tQUxnMElFanEzOWEzZ21LNUx2VVU1UXBFYzhqY1JwbkhPLzU2RUZa?=
 =?utf-8?B?aVNzYWxFM01TM2o0aDNqa2V4MkNtSkJ3ZGw2QWliYXpWMlpGQ29vV2xibUJP?=
 =?utf-8?B?aUoxdGtqMzRTQ05VYXRPOXc3SGtoNFJXY3V2RHVpbFBvRi9SdktWMGdpSmNL?=
 =?utf-8?B?cndYdGlUSnZ3N3ptdXNRQ09MeDhZSjJQWEcrcGlJSlJaTHlKRmNyOUVDb1Mr?=
 =?utf-8?B?TVJZRWNaZUlBaGJxV1drV3U1YmZHMFZHdDE4OUxlUTFFNmRTeXBtSkR6ZXpY?=
 =?utf-8?B?SUdtMHhBdlFSc05rdFloNVUzdTRob3VzdUJmL2lnWS9PT3hOM0ZWbUJoc05V?=
 =?utf-8?B?d3lhOHVhZ1ErWC9RcytBdWhRVnlBOE8rNlBCdms5eGM0UTNiT0hpb2o5N2RT?=
 =?utf-8?B?bTFwb1BqUE1BNVUxWkpHRnpKK2hWQTN6NjVaazZqeVV6Q3Z3T2NwUzI1dThD?=
 =?utf-8?B?WlNtQkREZmZGWjk2ei80UWVtUGNoSXBld3FyRHdTbGNFamFsVm50UjRVNGUr?=
 =?utf-8?B?NXNmQWNXMjl6eGw3V2tXdldlTmlxbGlueGZ6NGJPV2VPdU54cFpxNW5CYTY2?=
 =?utf-8?B?R2lQajBCTkZUK3pYYXdQYVg5VkwwOWRIRk9jVWFyUWpwWG1ObzRreUorRGFs?=
 =?utf-8?B?dlYwYmxaTS9BakFBRFZVZXFSWXc2Lyt5dkZ0Zzlsd0xVTHgxUTcxM3B6SUpq?=
 =?utf-8?B?STdhN3NmRkEvUSszQkVHdU5NMnpvQ0puaC9SZ0x3M09KN3dNT00wanJuS29G?=
 =?utf-8?Q?zNFP8+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:04:10.0769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff52a89a-d53d-44ff-fc17-08ddb98214be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9253

On Wed Jul 2, 2025 at 2:56 PM CEST, Jan Beulich wrote:
> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -100,6 +100,16 @@ struct shared_meminfo {
>>      struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>>  };
>> =20
>> +
>
> Nit: No double blank lines please.
>
>> +struct boot_domain {
>> +    struct domain *d;
>> +
>> +    struct boot_module *kernel;
>> +    struct boot_module *initrd;
>> +
>> +    const char* cmdline;
>
> Nit: * and blank want to change places.
>
>> --- a/xen/include/xen/fdt-kernel.h
>> +++ b/xen/include/xen/fdt-kernel.h
>> @@ -16,7 +16,7 @@
>>  #endif
>> =20
>>  struct kernel_info {
>> -    struct domain *d;
>> +    struct boot_domain hdr;
>> =20
>>      void *fdt; /* flat device tree */
>>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>> @@ -34,8 +34,7 @@ struct kernel_info {
>>      paddr_t gnttab_size;
>> =20
>>      /* boot blob load addresses */
>> -    const struct boot_module *kernel, *initrd, *dtb;
>
> Where did this "const" go?

x86 mutates the boot module to set the released flag, the headroom, etc.

>
>> -    const char* cmdline;
>> +    const struct boot_module *dtb;
>
> This one only retains the intended effect here.

Because x86 doesn't see or use the containing struct.

>
>>      paddr_t dtb_paddr;
>>      paddr_t initrd_paddr;
>
> "hdr" is an odd name here. That struct has no need to live at the beginni=
ng,
> afaict. How about "gen" for "generic" or "bd" for "boot_domain"?
>
> Jan

Sure. I'm fine with `bd`. Will adjust.

Cheers,
Alejandro

