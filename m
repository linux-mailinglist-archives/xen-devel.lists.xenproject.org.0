Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK3HBLZI+Gn+sAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 09:20:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473804B941C
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 09:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299539.1574082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJnag-0008Pn-9d; Mon, 04 May 2026 07:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299539.1574082; Mon, 04 May 2026 07:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJnag-0008OM-6l; Mon, 04 May 2026 07:19:42 +0000
Received: by outflank-mailman (input) for mailman id 1299539;
 Mon, 04 May 2026 07:19:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wJnae-0008OG-Vi
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:19:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJnad-007kx3-Ri
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 09:19:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f84889-2eae-0a2a0a5409dd-0a2a450790f0-10
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 09:19:39 +0200
Received: from [52.101.61.32]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f84889-229c-0a2a45070019-34653d20df22-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 09:19:39 +0200
Received: from DS7P220CA0073.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::7) by
 DS4PR12MB9771.namprd12.prod.outlook.com (2603:10b6:8:29b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Mon, 4 May 2026 07:19:34 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:8:259:cafe::9d) by DS7P220CA0073.outlook.office365.com
 (2603:10b6:8:259::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 07:19:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 07:19:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 4 May
 2026 02:19:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 May
 2026 02:19:33 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 4 May 2026 02:19:32 -0500
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
 b=ZlHZ6pXKNf8pvMuzGgm3PlytlH3Dkk9MGJWqbRasl5o3x28kdlTHaASy6WMsKstSfixjTPB/1bpf8+RCYh9cCpDEJZlhaaQO59OpYld5RuXisbdm+DtGNy4wyJXx9TdidJXoTduC0RTax+uhy0yueCqgVpXuOEfKgZ43OHfHQYrRmr3NaPWDavKXp/K/PmRmlmmgxSXbwebCZYnKO7LG7qpuC/NqJihJ4Jel1tDYqFMp9Ft9N4mUAAYfB51ljuQ80Wn+RmLUNeXN5Vz5gxVkeV7pJA6F3YT18iExiLlx6ndeFPhUk77Z9mHjTsCV4Y5uoXwULzsBc9dRO7HBhLhlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjANja2UfiFdrkJpuQH5eqDAx8TC73u35uA3TFNcvv4=;
 b=o27ghDcHd7VJLdTntG+zvyjD16ik7sugFnnt6hhAtL8NSL1ktueKcKWpZqwCl8TD7Z4LgwywZ8mryO2kFAby83yb18Ykv45g1rM2aiOWSl9fH2x6NmVFaowNEIKl+QbArDZWA0kq4J4gOMmC/7gLHItE0AhaORVKLQAfhLoQZ/82EoFyQ5/3rCZNs3bgpT9Cy2wtd5+PWZ2eCdN41jYrBXQlcKaLLxE0ME4whurjTMeA19DYswednuCkRfqPRSsY26sQzjzI9DQ0LUpozxwCqpDmbcX4Iud2+EMQzD2qTO0BU07qBdx0rqQg9ynJpxJpCQJmjbaDyxrk2XqbLKYEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjANja2UfiFdrkJpuQH5eqDAx8TC73u35uA3TFNcvv4=;
 b=jusnRcPLMh/DgXyDutjBp+GvRdxZYMIVVZnk5WGVTPgt7LDCob0PH54FaPSZhEnE17B+d7rnchawXTWMH4/K7Y0baBaR6UDMpTzaaC9uhEvNod1rMLwFW1oqaybkMJVf+vkjRWeDGYjQhP8JI8uA3PRuPgIweRfGGVZn8qsS+e4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <50371416-8acf-4204-ae83-469602037e60@amd.com>
Date: Mon, 4 May 2026 09:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU
 shutdown
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
 <59548223-99d7-4a11-ac81-39eee6474562@amd.com>
 <CAGeoDV_mjLPUD2m+hmKm3aEaG=Vc8hjW=YqbRmzBXPMB+OXdLA@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV_mjLPUD2m+hmKm3aEaG=Vc8hjW=YqbRmzBXPMB+OXdLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS4PR12MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 59aa99fa-7128-43a9-4aea-08dea9ad7e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ju88cTFoZ5Ieik26TG9XGXRr6eF3PWg4qOw6GKvOy6q6OC43Z16u07W3xkL3byKA5h9eD1nW/SVFeZPmmUxc3Xq0T0oU+omtwURfq2GhvA+ms4OLr3cYQeKJQpbpofuvTSWUwgWOED1smDRwRsEzSJdnC5e/vM3FWTv4Jwwkt0145vT5pBWD1FNEr0tLJ5TCyuhyHdfbKcEL85Oz89y6Sef24karmzfdhu77e0BztYgFf4rU/euCdKcOwz/KGlOnpGaC2UQx+7wNbxblVNazTM7vSWOquasvrm1hkkHiN9O5sp9/DfqsblsG/559efpp505bXqSBUGM/Ibn6txgG4qnXoit3/dLmquiwZC1R6l8Z7mnIJHOjukqfiMt/VWXnrA6dsUf/AbQ+9WzglQXGtHnd2oOuu0Sp/J3JFZRIAWc3hifZe1X6Nm3evPGgtaCxOX4uiD2Ifm6EVNm1kCTeb10V4Y9hlc0wR0VGOenOTEwdGWPjkuWRh4DWNSmyA8zagQynCby0wvoo7WzMtSnsjXkkM/9UTaHcbn4JZGgt+q2+130moJPIU/DbSHyN06X2kJgCxIpIEuOJzjYs73PHGFnL3g9QDMIjQr6i31UdWliIH4s2u5wE/YCW6RgyKyI9VcBFI6BRq6YbVYJXRdu7EnLX8tg06nhj5ig1MsDDczrshrMxZIH7uFIdNwo2CsPVYHPMvw35iZZfLyhQBeNhMLEhv8ZkBjCRMNMRFYUydYk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kRyGOyf2rERRCssi91P9KbU0RTlPanteEf9TN3gn/ko6zabSWtuneieBkR24uLPGkNwokqlnQkGasC4DVA8hqQqcgRCLop02DoA3i79A4V4ucd2ICslhEbVOlywGDlY4AErJdJuFKv9wFhJ5MHKiZ9p+W72uk2XrA3gPgajran8aFjKeDoFQgHbc/3jtnM9UAF9myxUDZQljve3yOQ0EPw+6SkZS5xZIunlGzvdB3GhYa4rY57lZrRmjhlekzunYwGwqTdgF7haBdEvLynLl7zbz4mrXMO0vCdgw8iPtA3C7DE5M+sWNAKnNNyTlXWvEDg8TuSSy0YxnC4LALhnBHIn5yHNbt39gTK6/nQCWIn/f+GttkEJKMj1SO++2YYvPjwShsmRP29z4jSKBfrM/H18Wi+y4tXxFZFqQjIaqc/FYeaRbtf9gRMeEXYAfpdTf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:19:34.1671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59aa99fa-7128-43a9-4aea-08dea9ad7e0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9771
X-purgate-ID: tlsNG-ef75cf/1777879179-14856C48-F4DB32A1/0/0
X-purgate-type: clean
X-purgate-size: 6351
X-Rspamd-Queue-Id: 473804B941C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]



On 01-May-26 09:22, Mykola Kvach wrote:
> Hi Michal,
> 
> On Wed, Apr 29, 2026 at 11:20 AM Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 28-Apr-26 13:57, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
>>>
>>> Per IHI0048B.b section 2.3.1, clearing the architected bypass-disable
>>> bits selects bypass rather than deasserted interrupt outputs when the
>>> CPU interface stops driving them. Tables 2-2 and 2-3 show that a zeroed
>>> GICC_CTLR can fall back to the legacy IRQ/FIQ inputs instead of fully
>>> disabling the interface.
>>>
>>> Fix this by reading GICC_CTLR, then setting the bypass-disable bits and
>>> clearing the group-enable bits that are architecturally defined for the
>>> current GICC_CTLR view before writing the value back. When Security
>>> Extensions are implemented Xen accesses the Non-secure copy of
>>> GICC_CTLR, where IRQBypDisGrp1 and FIQBypDisGrp1 are at bits [6:5] and
>>> bits [8:7] are reserved.
>>>
>>> Without Security Extensions there is no separate Secure/Non-secure CPU
>>> interface view, so disabling both group-enable bits affects the shared
>>> interface state. This is still appropriate for the CPU shutdown path,
>>> which is expected to stop normal interrupt delivery through the interface
>>> and rely only on the architecturally separate wakeup event signaling.
>>>
>>> Section 2.3.2 also states that wakeup event signals remain available
>>> even when both GIC interrupt signaling and interrupt bypass are
>>> disabled, so disabling bypass does not break the power-management use
>>> case, i.e. suspend modes.
>>>
>>> Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> ---
>>> Changes in v2:
>>> - derive the shutdown masks from the active GICC_CTLR layout
>>> - use the Non-secure GICC_CTLR layout when GICD_TYPER.SecurityExtn is set
>>> - stop writing reserved bits [8:7] on Security Extensions systems
>>> ---
>>>  xen/arch/arm/gic-v2.c          | 16 +++++++++++++++-
>>>  xen/arch/arm/include/asm/gic.h | 25 +++++++++++++++++++++++--
>>>  2 files changed, 38 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
>>> index 014f955967..241c1ff5c5 100644
>>> --- a/xen/arch/arm/gic-v2.c
>>> +++ b/xen/arch/arm/gic-v2.c
>>> @@ -408,7 +408,21 @@ static void gicv2_cpu_init(void)
>>>
>>>  static void gicv2_cpu_disable(void)
>>>  {
>>> -    writel_gicc(0x0, GICC_CTLR);
>>> +    uint32_t ctlr = readl_gicc(GICC_CTLR);
>>> +
>>> +    if ( readl_gicd(GICD_TYPER) & GICD_TYPE_SEC )
>>> +    {
>>> +        ctlr |= GICC_NS_CTLR_BYPASS_DISABLE_GRP1_MASK;
>>> +        ctlr &= ~GICC_CTL_ENABLE;
>>> +    }
>>> +    else
>>> +    {
>>> +        ctlr |= GICC_CTLR_BYPASS_DISABLE_GRP0_MASK |
>>> +                GICC_CTLR_BYPASS_DISABLE_GRP1_MASK;
>>> +        ctlr &= ~(GICC_CTL_ENABLE | GICC_CTL_ENABLE_GRP1);
>>> +    }
>> I don't understand why you want to set both G0 and G1,
>> Bits 5-6 in the NS view control Group 1, while the same bits in the
>> Secure/single-security-state view control Group 0. So in the latter case you
>> don't need to set G1. Without security extensions all interrupts are G0 and with
>> security extensions (NS access) all interrupts are G1. The spec guarantees the
>> functional mapping.
> 
> I agree that this is not about Xen using both interrupt groups during
> normal operation.
> 
> There are two separate points here.
> 
> For the group-enable bits, Xen currently only enables bit 0 in
> gicv2_cpu_init(). So, in today's code, EnableGrp1 is expected to be clear
> already. However, the old shutdown path wrote 0 to GICC_CTLR, which also
> cleared every group-enable bit visible in the current view. Since this
> patch changes the shutdown path from a plain zero write to a
> read/modify/write, I wanted to preserve that part of the old shutdown
> semantics and avoid leaving any normal interrupt delivery enabled in the
> common GICC_CTLR view.
> 
> For the bypass-disable bits, the reason for setting both groups in the
> single-security-state/common view is the GICv2 bypass logic, not normal
> interrupt delivery. Once the group-enable bits are clear, the CPU
> interface is no longer driving the physical IRQ/FIQ outputs through
> normal GIC delivery. At that point, the bypass-disable bits decide
> whether those outputs are deasserted or driven by the legacy inputs.
> 
> For example, with EnableGrp1 == 0, EnableGrp0 == 0 and FIQEn == 0,
> Table 2-2 requires IRQBypDisGrp1 to be set for the IRQ output to be
> deasserted. Similarly, Table 2-3 requires both FIQBypDisGrp0 and
> FIQBypDisGrp1 to be set for the FIQ output to be deasserted. This is why
> the common-view case disables the bypass paths for both groups.
> 
> This is also not meant to make FIQ a supported delivery mode for Xen. It
> is the opposite: when the CPU interface is disabled, the final state
> should not allow the physical FIQ output to be driven by the legacy
> bypass input. Arm32 has some fallback plumbing for FIQ exceptions, but Xen
> does not configure FIQ as its normal GICv2 interrupt delivery mode.
> 
> So the intent is:
> 
> * with Security Extensions, touch only the Non-secure view bits visible
>   to Xen;
> * without Security Extensions, preserve the old "no normal delivery"
>   shutdown behaviour, while changing the bypass-disable bits so that
>   the physical outputs are deasserted rather than falling back to
>   legacy bypass.
> 
> If you prefer, I can also make v3 more conservative and only clear the
> group-enable bit that Xen currently sets in gicv2_cpu_init(), i.e.
> EnableGrp0 in the common view / EnableGrp1 in the Non-secure view. The
> bypass-disable bits would still be set for all bypass paths visible in
> the current GICC_CTLR view, because that part is about the physical
> IRQ/FIQ outputs after normal delivery has been disabled, not about which
> interrupt group Xen normally uses.
The bypass argument is valid according to the tables. However, clearing G1 is
unnecessary, so it should be dropped. I can do that on commit if you agree. With
that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


