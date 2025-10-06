Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA6BBE344
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 15:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138214.1473974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5lVS-0005Zd-DE; Mon, 06 Oct 2025 13:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138214.1473974; Mon, 06 Oct 2025 13:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5lVS-0005XF-AA; Mon, 06 Oct 2025 13:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1138214;
 Mon, 06 Oct 2025 13:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5lVQ-0005X9-3C
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 13:44:00 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81d94ea2-a2ba-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 15:43:58 +0200 (CEST)
Received: from MW4PR04CA0110.namprd04.prod.outlook.com (2603:10b6:303:83::25)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:43:45 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::cd) by MW4PR04CA0110.outlook.office365.com
 (2603:10b6:303:83::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 13:43:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Mon, 6 Oct 2025 13:43:44 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 06:43:42 -0700
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
X-Inumbo-ID: 81d94ea2-a2ba-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOqyPIujB+To52aByxasRmFG7OmGFLeasaFmDdRYDq2MRzj0jzPIH4gsBYvv7uCCPCEZLJitV+kPGrVyPY5ewtPx8vRRfBMFOHHhvVEqAlkXe623CRqXtAelvyD5EZflMc498h5OvWPguZx6soZ2m2vkeZuG6T2JM4RP6uAs0TXhty34hFoaPo7OnlVY9VIoaJoc5BnJMgIr/iJ6sYM6atq+S1Ym8P2tqZ5+lo8kX7iqW0kDXpXkGkvhI+PCBcxKM9z8QeCwM/ozwdFQ/tPXAFEiq+ZkI7iNl0rHmMhNKJR5vdH0aLxEaOFPYfUNm2SV3nGOxD+PcsrChvSmFsW49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm3AHVNzPhBzgSsS/8lHiFefr28bb43KQhcCezuVZhU=;
 b=guvY9CBX8Qbbc9KWvWH40YI3CUifWyRTAiRkuK0o6em28wVPzCkWwlsVqSIP+bJWupyhY0+snmn2eWKRhAghtLD4gnbfWxMunT0seT0Xg8dgrxF2q514G7gnazUKdY7X+yzQmljjXSRFdan1u3DZQ0YEq1ok57AyOJGvX68PCsFPLKfaGuDVqAvKV/FfcStmSuP0/wfukzmG40sEZY5vsPVuyrfakfA9sWLiKbVdpU7cd3B8aPv7yVz0m3xmYL4dFza9SPQtSBQ4CJoRJgrUBMJXTV3cjOQplRuYDFu7znM3OE7tZl6wchaIbPUOcIuUIqtNevquDLMwicCR79YD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sm3AHVNzPhBzgSsS/8lHiFefr28bb43KQhcCezuVZhU=;
 b=3zoB0D4JZwj199Z2HIjnu1zgmW9JUw1+JpbZdOK3pFP2XRdn0ygOSQPBMY5z2q4PDFL8DtbbiDDGcSpAxRpmzb4mFzWR/i5o4saKtimJFaXZ7bZpA1lGbQWlFvS5ubu/mSHPsy7FiFJwc34NBVsL2zVX+Ot/ft1e0OidpfusXbQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 6 Oct 2025 15:43:41 +0200
Message-ID: <DDBA86O3QEZA.UN09CPMA1L1D@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86: Add missing forward declaration and include to
 hvm/svm/vmcb.h
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251006104608.12149-1-alejandro.garciavallejo@amd.com>
 <588656ba-dabf-42f2-941f-6cc017961271@citrix.com>
 <DDB7DOIV02H0.3P4Y4VQVY1HWZ@amd.com>
 <cc4c4e18-e242-46a6-a176-4d65c7b0527a@citrix.com>
In-Reply-To: <cc4c4e18-e242-46a6-a176-4d65c7b0527a@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|MN0PR12MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcc40e5-9142-4e7d-7a89-08de04de5e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1FMS2Zia0E3WEZIcGEwRWNEeTB3OTEzWm5DcjRNREZnenN4Ri9JS2U0ZkRW?=
 =?utf-8?B?eUNHSEVEeWMydEs4MFNnbW5VNUdPb1FqTzFqNVdxM0QxR1FFVDIwYTVKSzBq?=
 =?utf-8?B?eTNqUXJvRDFPVDQwdGRFcUdiWGdWN2NqeG8rbXNQZEc0dzI5NGZQdm45Z2FZ?=
 =?utf-8?B?czVZcURGSTNjeWkxK1IyVjh0am9Ta2REMnRyTFJCZW9hR0VnZkZrNmEwOWQ2?=
 =?utf-8?B?WTFuT0JhRjlSZVljSVNBTEd5ZFk2cXN2dGszMGxTd2QyTW1lci8wb3ozYStL?=
 =?utf-8?B?WjFKOG1YNnl3RXF6aitPYkhSdWdvVTNyTTRmYUxIRXR3TU05NkdwTjdRZ3o0?=
 =?utf-8?B?eU5sVTJwRmVFeUxnQ0RXaHVOK2RUdWZTVHphVWxkR2VpSnpCVFdCVUI0UEpC?=
 =?utf-8?B?TjQyS21pWXBDb1dtc0Q0TTIxQzIra0lxWVQxWDlQOENabjB4OC9BcXZjVXBL?=
 =?utf-8?B?RTZrRks0TURTWnZtRy85VHJrQ0RHU3FjcTZ1OWFMOXVuRlkzODY0S0hKSkN5?=
 =?utf-8?B?WWl4amlqVndGYW5rTlhwc2RjYkNSQ1RMa20zZUcwOVg5ODkvbGJLUmdkZmRj?=
 =?utf-8?B?WXY4VUNlQVJkOXlKaWxtUkFDenRVWGNjWW0zcHovUExRQWVMa3BVRlVkc1p4?=
 =?utf-8?B?YXBMR0F1RHh1OS9wNVUxRy9HTHM5OUFHKzltTmtNUndIRk9SekN0UXlCK1Ja?=
 =?utf-8?B?K014NmI0cElXa2JSU01IbnpYaEEyWUNrMEM1cFJaOEcxN3lJV0FIajNDTUl5?=
 =?utf-8?B?WDNRWjBPL2drQkw3VEtyT0VzaWZuZlROK2NkZm53cDg1Mks2Q3VUM1FhbDRt?=
 =?utf-8?B?d0N4NW85am1Dbm1mQzhJelFqWHp2ZDJTNk5hak01ZUFEdE10Szh3czI1TkV3?=
 =?utf-8?B?QzdlSjBnN3l4Mmp3UnpzdGhGL2h1UlJHYXF0c0RxRjJNT0l2RHUyWC90azFk?=
 =?utf-8?B?K2ZWRzJwTVNnMi9DODFZNE1yRHRwMzZmQkZZbFVlanlSU24vc2JhODBVcnZJ?=
 =?utf-8?B?eHVIeGZzK3pzUkdyaW9reE82QnNJVkdEMFJjbk1qcVEweXk2Y2JJN3p6UTE0?=
 =?utf-8?B?bzhuWGhlekI2Z1I4T1VsSXVYeis3T3ZjcXNsaTFDUlpHUmZOTFRDUDJ3bTBC?=
 =?utf-8?B?Vnd6YkN6R1RDUjNBZXNiSyt3UjFqWUJBRlpqNk9ITTlKSElscitPT2RNQTNx?=
 =?utf-8?B?dDAyWWd1WDFzdUlPeFFvdE9WMWxZQ00zTERkK09pN1ZNc3grdzBTblBYZTBp?=
 =?utf-8?B?dXA2a1BzNGw4aDh5M3pzMTgwVWp1eFNqdFJTR1Y4L05LRkR1T1Y1TFZ3eTNw?=
 =?utf-8?B?OUNZM1YvVEVhSmY4UDF2bzJoUXBUZldMWVFKMmJTTURHNk45cGNzSi9wWkps?=
 =?utf-8?B?Q09ZRFltVEQvTG82NWxtaFZmbXd0aU0zeGl4UXVkaUNaSEJZQU1vT29pYk91?=
 =?utf-8?B?UU5UNk5ScFN5NkVtUWVSKyt3N2VxdFdzbXRNTnc1cHNlWTNadHNveEJ6VGVK?=
 =?utf-8?B?elNaWjJjbE83R2tNN3JndUVobHp3NUZvd1lNT1VJaUQ4eU5mYXZKRE85Q1Vm?=
 =?utf-8?B?enJ5cncxNGY1b0d4MU1HdlFTN1Z0Ykw5NEs3ckEwY2tzRXh2K2FPbWVzRGFS?=
 =?utf-8?B?aDZTQXJ0WkFjNzMzb0htYzJYK3JQdUNqb1l2U1MrbDI1Y29zZFJNZWJjMkh4?=
 =?utf-8?B?Y3ZPWjl3MTVkNWF6SG1RVHdEOEhraGpoNG1KZm5BYWVoN3M3TXdpeTgzeTlW?=
 =?utf-8?B?b2tYczk3cjVZYlpUTkdFQmF4OVhPWDNyNU9EV0F0ejV5ME1SR1FoTWtlMHRS?=
 =?utf-8?B?MVNSQ20vL2hYbEYvRXJyVGRWbk9uQlphTlNMVjRWdHlFNnlJZjF2ZStvYTU0?=
 =?utf-8?B?U2dPMjl4SkFVR3hZSURIR1doaG1ZSWMwUUpTSlQ1aC9yRFNTTXRtSmY4VG9E?=
 =?utf-8?B?WXdtYmh4RXBuTW5hY3dDczRDYzFLcXNsVmlQOFVHM2VpNTRDUGJBT1FnUlpt?=
 =?utf-8?B?MmFFSVkvcEJFTXFDd2xsWUtNQ090REtmY1pFeUI4SlpZYmN5TlVkQjFrdDhs?=
 =?utf-8?B?SVc0aE9OcFJVRkw4U1RmNmVTQzJoelU5aGo4cTAzc2JLN2dXNUhpZ3p1S2FU?=
 =?utf-8?Q?5jx8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:43:44.3499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcc40e5-9142-4e7d-7a89-08de04de5e51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835

On Mon Oct 6, 2025 at 3:09 PM CEST, Andrew Cooper wrote:
> On 06/10/2025 12:29 pm, Alejandro Vallejo wrote:
>> On Mon Oct 6, 2025 at 1:04 PM CEST, Andrew Cooper wrote:
>>> On 06/10/2025 11:46 am, Alejandro Vallejo wrote:
>>>> ---
>>>> This dependency already exists today. I'm just making it explicit.
>>>>
>>>> "segment_register" is weird. It naturally belongs in vmcb.h, but the
>>>> emulator makes use of it and must be compilable outside of Xen.
>>>>
>>>> I don't like having vmcb.h depending on the emulator header, but I see
>>>> no way of breaking that dependency without breaking the emulator unit
>>>> tests.
>>> Pulling it into a new header is fine.=C2=A0 The emulator can include an=
ything
>>> (free-enough standing) in arch/x86/include/asm/
>> I thought it didn't, if so I'm at a loss at to why segment_register is w=
here
>> it is.
>
> Well - it's needed by the emulator as well as SVM.

I meant that it's an SVM-specific description of segments, which is then
conveniently reused on the emulator. It's a bit shocking for an SVM struct =
to
be described by the emulator.

I'd have expected the dependency to go the other way around, if it were pos=
sible
to have it that way.

>
>>
>> Be that as it may, your series conflicts with this patch and it makes no=
 sense
>> to keep both around (when none of them are going in for until 4.22).
>>
>> Will you be including a fix for the segment register in your series also=
? If so,
>> I'll just drop this one.
>
> I've folded the extra include into my first patch.

Ta.

Cheers,
Alejandro

