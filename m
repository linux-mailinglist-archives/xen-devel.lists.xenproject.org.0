Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E267CB695F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184438.1506887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTk0G-0002it-AM; Thu, 11 Dec 2025 16:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184438.1506887; Thu, 11 Dec 2025 16:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTk0G-0002g8-6u; Thu, 11 Dec 2025 16:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1184438;
 Thu, 11 Dec 2025 16:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdCA=6R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vTk0F-0002g1-2g
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:58:55 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aabe4aa8-d6b2-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 17:58:53 +0100 (CET)
Received: from BYAPR06CA0058.namprd06.prod.outlook.com (2603:10b6:a03:14b::35)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 16:58:41 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:14b:cafe::ce) by BYAPR06CA0058.outlook.office365.com
 (2603:10b6:a03:14b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Thu,
 11 Dec 2025 16:58:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 16:58:38 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 10:58:36 -0600
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
X-Inumbo-ID: aabe4aa8-d6b2-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnVTBTHV4tLYUa0hbc5OqZDb8giq4bG4OXwq7r30ManRqwN8LDEI+7TPvVghCf5fKYDZ0uTE62oZtSh1sTg8UsXqw9FUW7Tz1SSR8ocFanqW0kKLghmXSbO2bokUKl5d0teMrOO7vBtlEg5vAEekjKVIyE9a74WK5EZ83mj9uq2bY6Pq8+37nm+UYXZWQfSoPIiKuhAnbpWk6YSjqvmfo500y0OrlPDGkVSecB6z3EFZrDNaNEOAxrzk7kVlDDW7zH8+2EwsNAAirZTlBymIZnIN0iTYL4XJpX6ZFVOxJsGy+zveX+c9pdnPJKGRHg991o/oi+rYUQqrth9hzrEJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inpOtOOOx85Hkfv3AGqVmFHAJKG7KeiIe+lWCogNBos=;
 b=bKb3pK0ycDefy+IIUGBwhhvh1KuEOPaalXUQ2WpQzLTNvHRJlpxczG7Cvm1UdAIAB773gFegCkqyu0DPLTym25yaVYxUzBjrZjUn9g+439RXDJFxOPvgZXefnj9zTyPp4O/gDWxtREBJwpn2AEfF3PLEyRtc05B0MzWHvdfGsdjmOiLMOnHTv2zPR9Ds1fnTjaOyNo4WnIjoA8Z/f+FAJiO59ySIGWaqUs1g5Pxv4whzfrhnG7WSc1YYFylQDsnVRT1QiL0gW318GxwJ27DF5FaKeUa4U1codDeWdaN506ez+mWsDYbwvqw7YmW7ibxz04Jqavnwzk15itU7VCF/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inpOtOOOx85Hkfv3AGqVmFHAJKG7KeiIe+lWCogNBos=;
 b=FkVTr4GG+BZKQbIC9LYtrSoCEfyp8c9MqL7PeDmA4mD12tKbs0p3pOphRJpP9NGmp8XTucu6w4v63tW9uN5w3pOE+6iBCiTFYOBLOqP70jntKay3Pd1ra91INWWGLAU7XoBgA11zkWw8LdElsZE2pgmxjBKnudADBj1m6wCo/XQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Dec 2025 17:58:34 +0100
Message-ID: <DEVJPCRTRA9Z.2JNMRFAN47BU8@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 09/11] x86: Migrate spec_ctrl vendor checks to
 x86_vendor_is()
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
 <73146271-c849-4d16-8eb8-80e7d59f42f2@suse.com>
 <DEVBH18RU4WL.2GFVGYVC8SWAC@amd.com>
 <15659af8-4604-455a-b7de-91c4df213ab5@citrix.com>
In-Reply-To: <15659af8-4604-455a-b7de-91c4df213ab5@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: cae362a6-6ffa-436b-fcc2-08de38d687d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eitORUp6KzFLT3hwdG5nQkw4TXgxbjhiUm4rRGVLTU5rYXYrbTR4dXZxZ3dt?=
 =?utf-8?B?eFozNnc4RXlKZk96YWN3eUl0TEVFbU1DcDJ3ckM0UDhwelg1ZzFDMloxZjJW?=
 =?utf-8?B?WHY5Zm85TmxPMHhxbUgrMTN2U0lKL3BGRktveHVSR3IrNlVXcGpRMFdDSHNN?=
 =?utf-8?B?MXFmT3MrTytFRjUzbGYva3MrM29adkJWMzVDWGxpT2l1OStTYlR5RVpoZ21u?=
 =?utf-8?B?c3d0WlNVWXlTVWNka1VGNlVTNEZHN3E3WmV0UGJHaUFtNVJEcHJHZEhNVEdH?=
 =?utf-8?B?NllCbVBoZzVkYVAyU1BpVXZSUTN1Vm96bXVTanNLVXlTWlFFUWtLaWtlcm1I?=
 =?utf-8?B?TWRxR1pkMFppVlpZaGY2SzJ4ZHd3UGdwUzA5NUhSOUJXR2dsYlkvcVVJMFlI?=
 =?utf-8?B?OXVISUdWWkNqaXBXRmFocHpLZTNtNkVDcDBFcFhMdEZFRlRwT295R3hPcUxQ?=
 =?utf-8?B?SnRMeDJZRkh4T3h4OFlWcEtyY3NZMGpzWEp3WEhjaGY4Yno4TklFeWh5a1lU?=
 =?utf-8?B?YzBNMmxZK2MwVnVtcUh2TkFwTmFObFZXVU9aRnY4RlpodkxFdHBPQW50K3pO?=
 =?utf-8?B?THlkazdkTHQyYWErZkNpeEl2dkU1TWI1UXVieDE5cFNSVGtNQWhPbk1RWkty?=
 =?utf-8?B?UjdSeHM5SldqN293SkFEbHlUV1huSDdoUVpvSG1kQ0Z2bmRCN0JUMTNTbHU0?=
 =?utf-8?B?TllVY2lFOUdMcVpCNUY4V09tWmlmNHJ5a3Vlc1IrNmF6NC9FNkJ3Y2c5eEhw?=
 =?utf-8?B?eFdPRWdOazMveE95T21nWHUxSTd4Tk1KWUtOWE9CdVl3ZmVhOGxTd3BySDk5?=
 =?utf-8?B?NmdEemZaRWRLUndRQ1RhQThrQmVsMVYrZFVuWjJLWG9NTkIvd2p0ZEpzR2Zv?=
 =?utf-8?B?cVJuM0pnVXlvUE1yWkRCYjkzaVZYK1E5azhteHo5ZW9JTUZscUoxckp6U282?=
 =?utf-8?B?a2VmeFRmL2dwSU9meENObFE3Q1Fpd0VVVUU0M05oRFc5bGcvWkwxSDh5Zlg5?=
 =?utf-8?B?ZksvcDlFR2JzbnFUdGFIVktHK1hkQ25oQmVQWnNpb3g3cUNpUmVyVDBoVFN2?=
 =?utf-8?B?QXBzMlhwY1ZoWDM4Q3l0SDl2OXEwSGJSckdWYzhtUWNZVjZPbExaVlFCeVR5?=
 =?utf-8?B?RE03SktCYjV2VSs0ZThxc0V6bWFCcm1EZHdXSCtEMnR2YU05QkYrNHRtQ3F3?=
 =?utf-8?B?ZjAwOTYzSmg5UExJeDRGK2R4aTBUcFZCQi9kb254cStKMFJqazR2aE5CY2tq?=
 =?utf-8?B?WnVNY3NJanNsRnhMK0VVc2pQL2F2WkNBV2RsMVRhN3NyQi9jWTRYeXQwRitj?=
 =?utf-8?B?elh6dVRzZTlXWHJvdGpIYVkraktoak5kdU9BbHJJUlU0OFVOekJkMk56ZWJ2?=
 =?utf-8?B?MDJvOFZVQTlTTHVaUEZrc1NHaUNMYVpMRjlSeUhMcXI1YW1ib0VZbVNCUG0z?=
 =?utf-8?B?SGJ3bVQrdDQyZkdpbGUzYyswNTRtYkdrcmNkcG1wd2hEMCtDYy9lV29wWDl0?=
 =?utf-8?B?L2hYUXNIZU5QN0tQeFVyNDJZanVPUjB6TytsbXF3ekxHQnZuL0djNk13QzV5?=
 =?utf-8?B?YTg4M3BVUFRsOStla1h2RFVobmZWVk02MDVpeDVhTVh5TkNwUlJUbHRlSkZV?=
 =?utf-8?B?Slg0RmplL2xOVnBNMzlUVEp2UzhCQUhQODNlMEduUGcrc1QwNmxXdkE4U0Fq?=
 =?utf-8?B?UUhxME9wS1Nzenk5NmlITXpRNXU2WXFyZ3VBbUZEdG9oTHFMZkUzSS9PVzNR?=
 =?utf-8?B?ZVhJYTVuSWZaZDBpbFl2RHhCN1ZNa1VTTENTWlliM0QxTktXZUZ4OVR0ZjQy?=
 =?utf-8?B?UkRZZjV1K1hvWkJzYXcvZzlsMU4yYmpBZkxRZmhnWDcrZ2g3M2hZQWVwKzBF?=
 =?utf-8?B?Smk3L3BONTNzaVN1RDh1enVrZzdKcitxdWdQSTBFRGp2dm1Ba3F6NTk1dFFV?=
 =?utf-8?B?c1ZFQU5SNmFvdHFqREdVSGZDay9TT1p6TGVScStmWXd2QVA5MUFGODFVdVND?=
 =?utf-8?B?Zzg4cVI3NUhFUUdLYzNMWm5rYm56RnE0NUwzZFF6Q1U4UDh1OUE2Sk9EQmNq?=
 =?utf-8?B?YVQwallKMWNuUFh6VjhPTzVoY28rR1dMS01IaVhkVkZseS9hdkJ3c2RGVXM4?=
 =?utf-8?Q?/ZXA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:58:38.4766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae362a6-6ffa-436b-fcc2-08de38d687d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121

On Thu Dec 11, 2025 at 4:38 PM CET, Andrew Cooper wrote:
> On 11/12/2025 10:31 am, Alejandro Vallejo wrote:
>> Seeing how both you and Andrew seem onboard with dropping cross-vendor s=
upport
>
> I found another cross-vendor dropping which you'll want to look into.
>
> struct svm_vcpu contains three guest_sysenter_* MSRs.
>
> In AMD CPUs, these MSRs only have 32 bits of storage, with the upper
> halfs write-discard.=C2=A0 They are switched via VMLOAD/VMSAVE.
>
> However, in the cross-vendor case, the upper halves are needed for 64bit
> kernels setting up SYSENTER support.=C2=A0 Therefore, they're uncondition=
ally
> intercepted so we can avoid losing the upper half.
>
> By dropping cross-vendor support, we can get rid of these fields, allow
> the guest unconditional access, and simply the MSR intercept logic a litt=
le.
>
> ~Andrew

Sounds straightforward, I'll add it to the pile.

Cheers,
Alejandro

