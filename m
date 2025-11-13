Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FDC575F8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161188.1489195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWML-0002Bu-Km; Thu, 13 Nov 2025 12:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161188.1489195; Thu, 13 Nov 2025 12:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWML-0002Ad-Ft; Thu, 13 Nov 2025 12:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1161188;
 Thu, 13 Nov 2025 12:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIX7=5V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJWMK-0002AP-PB
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:23:28 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d97b943-c08b-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:23:26 +0100 (CET)
Received: from MN0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:52c::7)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 12:23:22 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::c1) by MN0PR05CA0013.outlook.office365.com
 (2603:10b6:208:52c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Thu,
 13 Nov 2025 12:23:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 12:23:22 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 04:23:20 -0800
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
X-Inumbo-ID: 8d97b943-c08b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2cX45hUUsFORe5h3WyRbGdEikmQdtQjFfMnQQ/yC/mDOC8O6F1gFZNyKAnrXOJNQgUXThIHDhyeg7OqnOc+nPZJv8Mer2nHsfkofTVv2XUrHymKg+iLa3F03KjD6MTIgwG8JUH7hS39hOqqTXaclS4gc1Y+HunKyJuTcUsfs6fv+OZVehUON6UuIkNoSegU2J2juFBS8YuRZqjGDhQisrk9yNVQxMCN/vTjKHdflqTTViiRL1j5bf0RjoBEK6TQ8SoHsiS/aNQiqrGdcN6sCbVALgnf1VLPP+umrYDFiDuwLViaCeRf83pbY4FvfAdyDHHJ44wjgddU6K5c/q4jYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKd15oiT6H5dSlMAOW634YLWGGRVLgxhDzHb0E2eXB4=;
 b=xzZrkOaCxkUWJ8RX7DlgKMWZkQMZsPA24sgVIJo7rSVTN4P8KEpXEwGFJ7UpDzcYxKzLivg+R4sQ8NOnBzE0MkOdkdz2Qj5CrP2FWnBhYVJR04g+FM/cafq62aU5gVnaJ3oN/IcrjctjV6HkYxC0COG5TV4apZfUQVEG6GJU7elU3XZyjtpct9CRV2eX4BZaoOCdDVC/bQVEp5spFxORvpYs07davQz9Lv6jsHpeK371Uf5PT/0r2Gctmex4WEWcP29gMuNztG7G5QR+eeR0FbDvqZKwZQ9jSmmr4mGU18gBVE8eV4fRlI3J+b7P8bSKg2M7bcEPUmBGPp6IgobzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKd15oiT6H5dSlMAOW634YLWGGRVLgxhDzHb0E2eXB4=;
 b=jPI1LgpmfJwyuJVMmKcCotXbW67RwV/uw7DOmNfFeju/T8zlZ9Ue2paM+Lkrc0ZcMamdAnMkpRHqWAikBi8AsiaT4oZSmzgsDAqaktMBxspq6GOo6sir1DeRjKWr0dWlKxq5p7XF74Juob6NSksSutUr/HIOKU2cmCF+tyIQOvI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Nov 2025 13:23:18 +0100
Message-ID: <DE7KBC8848Z3.2GZU4DD87D20F@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
 <5c08e298-3ef4-451c-b0f8-24f207a9d512@suse.com>
In-Reply-To: <5c08e298-3ef4-451c-b0f8-24f207a9d512@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3f5865-30b0-4897-2726-08de22af6fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXBFeDIrUkl0UkZTb3JjcmV4R2diWTBYbnRKSlZOeER1U21yL2ZzRUxOK1VD?=
 =?utf-8?B?THJwcHRlcWVKOUFUN1JMYktMaWQxZnN4ZEpmeVZoc1U1c1BBVk51VHRTZFhF?=
 =?utf-8?B?aTJyQm9UNFhnNGhWdGFNcHZPWmI1SmxhSjdUOWNqVkM4UjBWMUJoYW0yNWZz?=
 =?utf-8?B?d3RtblhUMXNpdkVQOC9sYVU3L3g4K0I0L1BTMnVWNzFmMElQQmNjLzZHTCtO?=
 =?utf-8?B?OUdRc0gvMkt3NUFlbWpmU0U1OVJ0Q2Z0bS9LSEtIY2IzZGwzTllmQlVQOU5r?=
 =?utf-8?B?ZVduT3FQSnd4WE5mR2RCUSthcENWbElBYXFWNEZzcC9BZ1hFSGNKNUtZSVh2?=
 =?utf-8?B?UFRwQkFzK1ZxVmw1SGZWSGUyWEh4S1JLSlJOY1k2TmxNSUxZZFFFV2x3VW9r?=
 =?utf-8?B?Q1dXVnBTd0tBa2ZXRGh1Z3NTaDVsQ3RFUnZpU1FlOVU2OHBqc1d1eHR2NWNh?=
 =?utf-8?B?RXBEVzh0eGdvMG1sMGNqUTE4anpwV0JLbUdHTlI4MWVHaWI4bW5mS1Q1eGVu?=
 =?utf-8?B?SEhBWjZqMzFOTk5XeXY1MmdlTE1GTXFQSlEyZzdxbnJtV3Jxc3JQdWtERlIz?=
 =?utf-8?B?Y2JCQmJsMCtjMFA1OHRjZmZJbGc5QXZ6VWxCditoSDNoVjBFU0pqS1RwYmx0?=
 =?utf-8?B?MWh1RnFrTDVPcnhsdEJBbjlCNUJYQmxLaFQ0WDcwU0VCNE94MkdHd1BucElx?=
 =?utf-8?B?Z0IzVWwrWmp1TGh0VHdPdDc0SkhEWGpTY05kRFY5a3ZQUkxCZURSZ1duSmFq?=
 =?utf-8?B?ZVhicHFYTDNPUFVJMlZ6d216Q2YralhJTE55elpQZzRVOWlML0ZQWTB4TTJL?=
 =?utf-8?B?a1FycmtZd2NMS2U1Tkd1ZFBML0krS0VYWVBINGdtNFZicHU0a1Q4QmkyREE1?=
 =?utf-8?B?d3Zud3BXODNHN2N3cDFCSStYZ2N5UFBzTk5UQlFNUTBPTVZpSlk2MVZybjho?=
 =?utf-8?B?Y3B4K2NEQzdOS0Z5NzJjRTNaMzlXZzhBUkxzZy92eThVUlo4STlOdWlEb1hS?=
 =?utf-8?B?WDFyamxaaVlEZVFGV0VzQUpqeG1tTmlhRmpzVkhIamhuMVk0bEQ3ZzNFTEtP?=
 =?utf-8?B?MkNpeWR2Z0FOK1dEdDZyVm1UdS9DWXFHV1NOT3RtejVjQWVGemR5WDRaU01l?=
 =?utf-8?B?VFZ4ZFhBRHhPSEdSaVd6RENoU3ZDOUxSVEIyTmZiT0N0N1BsSnQ1VGNITFdJ?=
 =?utf-8?B?KzFXcVJSNnd4NWswMEZTSldnUk4vMTZ0RmlqTnJVZEhzekpUVnlsRGl5aXhx?=
 =?utf-8?B?ZnUvbkNIbTg1WnFHbk05ZGVGREJHVU55OXVmRTJ0OTNvQjRNbDFYRWJ3a3Z3?=
 =?utf-8?B?K1FiNUFVNGlSNmFJdXQyYVZMaGllRkF3RFNLQTF4SVhiQkViNVoyVkhJOWRl?=
 =?utf-8?B?Y2phNW4wMTlSdUMyZjQ0aXBwZnl3VGFLWko3dHNXMndGSGV5cUx5RXdaRTJ2?=
 =?utf-8?B?c2wzN2JUUENYZGRJbjBFTkQzNG9SNkViYnAzMFMva2c5STFyWGF1Q3h2aDNW?=
 =?utf-8?B?TmRwQ1BoZHdlZjh5aWJJU2hIeS9iQXYvdk5CaW1uT3ZaZ2lTdWR2b2U5ZFFw?=
 =?utf-8?B?TE8xOVp2RmdrZC9TNktPMCtET05sSitCVi9CQlNLbno1S1U1NFVaWUMvRWI0?=
 =?utf-8?B?MTVBZU9NOWtRUExUS0lNR2F4RDM3bE1hMWo1VHBiU0RPSndITGxMVURTaVRT?=
 =?utf-8?B?anA3c1FZc2NVaU9qYnNjdUpmbFBYcGFCc1VVdThWZXltT25qbDdjMGtKL0N2?=
 =?utf-8?B?bWY2QjQ5eVd1b3BlWThEdFczWTNmcXJsMngwd21LbXBRUlMrVlFOYTNZTjhP?=
 =?utf-8?B?R2tPV3RicFErZDQwT1dCZXl3RUZVYWF1R1p2Z3lGSmpFeTBmeTVRUSs1ejJC?=
 =?utf-8?B?aXlvcUVLb09aeHUyWGdxQjVKS2R5RXVzM2VXbW5EcFZwZHFHM2JlQ3BOKzIz?=
 =?utf-8?B?dkdWbU5pNkZ6bHZPRXRGY1JRRUdiMTV2WUN6alhZdm0vM1E4RHdnb1AzMHdu?=
 =?utf-8?B?cnVUTlJXWGxHUndNSnNrUTBFWS9MSUpMVjNVOWlFZE4wRS9zc256TWZDa1Ex?=
 =?utf-8?B?NGVGazNDMUdKUFZKMWZRMW14M3Q5VWJxbGI2SVhramVydGZCMFBhWXlyWjBF?=
 =?utf-8?Q?rJIc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:23:22.4465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3f5865-30b0-4897-2726-08de22af6fe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234

On Thu Nov 13, 2025 at 12:50 PM CET, Jan Beulich wrote:
> On 12.11.2025 16:22, Alejandro Vallejo wrote:
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
>
> I think using ASSERT_UNREACHABLE() there would be better, in particular b=
ring
> things in line with the {hvm,pv}_domain_initialise() call site. Preferabl=
y
> that way (happy to adjust while committing):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

Sounds good to me. Though arguablt the commit message might need to change =
too
to remove the last line about not being a functional change. While not
externally visible, it is a real change.

Cheers,
Alejandro

