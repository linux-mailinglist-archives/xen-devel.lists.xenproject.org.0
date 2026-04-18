Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hFXJDtMt42lXDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 09:08:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC474203C4
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 09:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284826.1566376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDzlP-00034l-Bz; Sat, 18 Apr 2026 07:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284826.1566376; Sat, 18 Apr 2026 07:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDzlP-000322-8f; Sat, 18 Apr 2026 07:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1284826;
 Sat, 18 Apr 2026 07:06:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wDzlO-00031u-6M
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 07:06:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDzlN-004g26-4i
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 09:06:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69e32d14-e002-0a2a0a5209dd-0a2a4506d17c-20
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 09:06:44 +0200
Received: from [52.101.85.4]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69e32d82-7371-0a2a45060019-34655504bd11-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 09:06:44 +0200
Received: from DM6PR11CA0047.namprd11.prod.outlook.com (2603:10b6:5:14c::24)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Sat, 18 Apr
 2026 07:06:38 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:14c:cafe::dc) by DM6PR11CA0047.outlook.office365.com
 (2603:10b6:5:14c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.55 via Frontend Transport; Sat,
 18 Apr 2026 07:06:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Sat, 18 Apr 2026 07:06:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 18 Apr
 2026 02:06:38 -0500
Received: from [10.252.194.40] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 18 Apr 2026 02:06:28 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruHmtH+EIshMz/slhPM5tmpo+T1wcugUjPwyvsXhD8FFhcqZHBR2c8HVGxy61Fqse+Ur0mnCsVI5QuK5HPyBFsSa0+Ng8gv4UbLmYrruh++YNomInwnaHQJY53C+/pklhhxPvmAV/oABp76sxT69yaSSVxZDzEWRjV4qN0zf/dz/lsdBLDwxEZBtfPjpP3xbviOMSwXfpCsQKaotQPElYSTSJXg2kTyTkOWFruQB/xBxCVAyM1PJh2YCljwqEkKYAW8t8sjacVwoWkyKepuqkzkXIl2KVyJZTzy9zw5paHcXAJ0t9tldJZlPI+kSnT0QF+nHN4WMESByhnVk6oJSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BClIecVJmvCejMpgiswZKy4WjjMP+uudCrG7lM21Kco=;
 b=QjGUvzpXJD6TmnI2ijw85PvkPJ37vZOsCEw6VOMDlzEZXwrEptSyXDXv7xtjcVf1/q9ufZQWn3lQ5iwd49f6aGQF7TOUk1PQ0J51WeSwXy+OwGU8Y0XTiKS6ASXjwmImN69BKcn6Nz+aIa6JwnGTrgMQsy+544wygH935hZuDuSU2DhRPHQPhr5XBc/LBYmyDVQ7wnffKrRZ/7WceJ18JwJG7jBYkCb8WRdLa0lPHUauJDk57SU7/ami6SM3PeEc1a/RtqTcFdPXF1An8uWdHImepaQePTYzvTzuR2Uo+mUYHQFI1M+9VlcEjqKUVMh2ha7LmncAkvgUiYor3fCVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BClIecVJmvCejMpgiswZKy4WjjMP+uudCrG7lM21Kco=;
 b=NaNWOCmYbunqQojNrgvrdBKuL1aI7Yroc7BB8+NHKe96QBYTO/DmVNllGywRaAK4azrt1068YsYOYERxcKv69TGnxiqtRLHy4XW5he/kV3IV97tInGm7N1+goI8g9kdji/6yJW8tEu4uVLRFuuZCmMJlSJmtGx0TfrRUISZ+zsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a3a2b36e-9362-49d5-8b71-9f6fc667c366@amd.com>
Date: Sat, 18 Apr 2026 08:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Luca Fancellu <Luca.Fancellu@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
 <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b826b96-e9d0-441a-22ae-08de9d190919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	s0B4PWpPHoDYGokk98xapvwfPY040iSv3TCGPTn0CdukIm8/iP7TC3cSFeb4jIkgxOTyi1h9QtanB+yxHM+1biSPzMVxsJM0SQPms/8DpoWS1mJWCRtxDGk62hHP7KcUu2UCO2thX++kCCoRqF9O1+OGe/gG/AngVBe4/1lMG6pBFPjMt+FLAP3N7U7BCeg+JpGYEVlgr1W5ONjr/zNlG+extbFp9Ly8YkEtS5iX3HKb81iTMyQTGS+fera95p8g8HHQ8wrVRuDMUryPBl5zXbqb+JJS871+WteNdNYk6kpZAikzSyNPSrAUQ/BTDS7qCBgk3Q8D3UJcCxgtizGpYqT7z0DKucxUwIiaAvaRbLs7xiv0b+pouY3k3IzMKbhEjegk2NBWMlOTbJTJCjtOYb17B1tsoR0QFV5ozVTDQgdFlu0S1mze4agUc8265oHrNFOuzD6KRvtKmai6TD/4Lvwegulc/wXo44Ru8EIk8utkypp9lGx0fyDYTQ5VoD4Fyiz3riv7OjmQ18GqaZp6vcodlueq3FbRAwk3ns3t/MjD58baeV+48z46cwHmTxMmP91WFKjIxB5cuHYWwH9Jnsw20ld7Cfl785hkGJJN6WrzGO+uBwHeiWdYiVBmxI4xVE58kLAxhiwf80Qu9rdmEyX9LtlvLlCmbWygZbTwAmG2x66RfGyL2u/jawy2UGFK/7urcZzOlJjnSBjmDnNqVAol6oonlTMPtKaieFQRT/JmkF2ABf5RikWyT/B5UGOJEyBkSIQAf5ODB+ziw9QpfCWrI2KbTuz5Xp36j5XVLGs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oFs7CYHSCcAJSZghCkOGs16KWeK3oiXxZEjLwjMkXxtwESgusFDnznyTn0CI68zeP5BjzIyrp2wg7CNtsMJgjYbfs8arD3OWoawbA/+SJl9TwqwwHM0STNGoXoxbYeuRrISzCge20oV5D/0zCHNG+/WH73xIEqiDt9P+5ytZksHcwvvYlbjjWmcrG+Kx0swHonZIirg+6/WUhhlkr3hkyudnpTYpDutgcrdkk+/B4jG6BYw1WzOLLV66T+QA63LHj6vgzamGsdqZ12pyg/PQipsjKIqFsgO/wm5Wijf0iAjGzDOpc0f4UxtGnjuNSDIHh2QqzNo/hT7mQ83w0lXhgmg1NCJXwNxQJkcT8LQGwvywXdPdO7x6e+mJAa+ZzoSHto2FD9U4pIcCi2kjCxTiIukmrwIUx20vzJ6ZB4genjZtKIV2J5wUhKobocKm4tF/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 07:06:38.5029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b826b96-e9d0-441a-22ae-08de9d190919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
X-purgate-ID: tlsNG-16d1c6/1776496004-CF57ED75-522C5CFB/0/0
X-purgate-type: clean
X-purgate-size: 6048
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7DC474203C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 08/04/2026 15:24, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 18 Mar 2026, at 14:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> One key requirement of Xen functional safety is to reduce the number
>> of lines of code to be safety certified. Besides, a safety certified
>> Xen requires a static hardware configuration to be defined. This static
>> hardware configuration is described as per the test hardware/emulator
>> hardware configuration against which Xen is verified.
>>
>> Introduce GICV3_NR_LRS with the two aims in mind:
>> 1. User should set the number of GICV3 list registers as per the test
>> hardware so that the unwanted code can be removed using GCC's dead
>> code elimination or preprocessor's config.
>> 2. By doing #1, one can ensure that there is no untested code due to
>> unsupported hardware platform and thus there is no safety impact due
>> to untested code.
>>
>> However if the user does not set GICV3_NR_LRS, then it is set to 0.
>> Thus Xen will fallback to the default scenario (i.e. read the hardware
>> register to determine the number of LRS).
>>
>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
>> This ensures that if the hardware does not support more than 4 LRs
>> (for example), the code accessing LR 4-15 is never reached. The
>> compiler can eliminate the unsupported cases as the switch case uses a
>> constant conditional.
>>
>> 2. RAZ/WI for the unsupported LRs.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changelog:
>>
>> v1 - 1. s/lrs/LRS
>> 2. Implement RAZ/WI instead of panic
>>
>> Few comments which were not addressed
>> 1. Do "gicv3_info.nr_lrs to LRS" in gicv3_hyp_init() and keep the code
>> unchanged in gicv3_save_lrs()/gicv3_restore_lrs() -- This prevents the
>> compiler from doing dead code elimination as the switch condition cannot
>> be evaluated at compile time.
>> I am not sure how to get around this issue.
>>
>> xen/arch/arm/Kconfig  |  9 +++++++++
>> xen/arch/arm/gic-v3.c | 14 ++++++++++++--
>> 2 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 2f2b501fda..6540013f97 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>
>> endmenu
>>
>> +config GICV3_NR_LRS
>> + int "Number of GICv3 Link Registers supported" if EXPERT
>> + depends on GICV3
>> + range 0 16
> 16 is the maximum supported since ICH_VTR_EL2.ListRegs is 4 bits [1],
> however how are we handling the case when GICV3_NR_LRS is greater
> than the supported number of LR registers?
>
> Shall we check that in gicv3_hyp_init()?

My intention is that when user sets GICV3_NR_LRS , it overwrites the 
value obtained from reading the hardware. IOW, I was thinking of 
something like

gicv3_info.nr_lrs = GICV3_NR_LRS

But you have a valid point that what will happen if the user sets 
GICV3_NR_LRS to value greater than that supported by the hardware. I 
think we should print a warning in that case. This was suggested by 
Julien in v1, but I missed that.

>
>> + default 0
>> + help
>> +  Controls the number of Link registers to be accessed.
>> +  Keep it set to 0 to use a value obtained from a hardware register.
>> +
>> menu "ARM errata workaround via the alternative framework"
>> depends on HAS_ALTERNATIVE
>>
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index bc07f97c16..eaae95eb4d 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>> #define GICD                   (gicv3.map_dbase)
>> #define GICD_RDIST_BASE        (this_cpu(rbase))
>> #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
>> +#define LRS                    (CONFIG_GICV3_NR_LRS ?: \
>> +                                gicv3_info.nr_lrs)
>>
>> /*
>>   * Saves all 16(Max) LR registers. Though number of LRs implemented
>> @@ -59,7 +61,7 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>> static inline void gicv3_save_lrs(struct vcpu *v)
>> {
>>      /* Fall through for all the cases */
>> -    switch ( gicv3_info.nr_lrs )
>> +    switch ( LRS )
>>      {
>>      case 16:
>>          v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
>> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>> static inline void gicv3_restore_lrs(const struct vcpu *v)
>> {
>>      /* Fall through for all the cases */
>> -    switch ( gicv3_info.nr_lrs )
>> +    switch ( LRS )
>>      {
>>      case 16:
>>          WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>> @@ -178,6 +180,10 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
>>
>> static uint64_t gicv3_ich_read_lr(int lr)
>> {
>> +    /* RAZ for unsupported LR */
>> +    if ( lr >= LRS )
>> +        return 0;
>> +
>>      switch ( lr )
>>      {
>>      case 0: return READ_SYSREG_LR(0);
>> @@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
>>
>> static void gicv3_ich_write_lr(int lr, uint64_t val)
>> {
>> +    /* WI for unsupported LR */
>> +    if ( lr >= LRS )
>> +        return;
>> +
>>      switch ( lr )
>>      {
>>      case 0:
> Now, since we are using CONFIG_GICV3_NR_LRS or gicv3_info.nr_lrs in gicv3_save_lrs/gicv3_restore_lrs,
> there are other part of the codebase using nr_lrs (gic_get_nr_lrs() is one of them), but all the callers of that
> function will use the HW nr_lrs and not the CONFIG_GICV3_NR_LRS, so I think some work needs to be done
> to align them or there will be mismatches at runtime with possible loss of information.

I will fix that.

- Ayan

>
>
> [1] https://developer.arm.com/documentation/111179/2025-09_ASL1/AArch64-Registers/ICH-VTR-EL2--Interrupt-Controller-VGIC-Type-Register
>
> Cheers,
> Luca
>
>

