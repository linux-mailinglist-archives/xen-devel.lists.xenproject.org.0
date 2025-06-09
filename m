Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB2AD1A27
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 10:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010167.1388313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYLg-0004lT-Um; Mon, 09 Jun 2025 08:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010167.1388313; Mon, 09 Jun 2025 08:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYLg-0004j5-S5; Mon, 09 Jun 2025 08:59:20 +0000
Received: by outflank-mailman (input) for mailman id 1010167;
 Mon, 09 Jun 2025 08:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+Qs=YY=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uOYLf-0004iv-C0
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 08:59:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:200a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 050a61f7-4510-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 10:59:17 +0200 (CEST)
Received: from PH8P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::17)
 by SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Mon, 9 Jun
 2025 08:59:12 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:510:2db:cafe::11) by PH8P223CA0012.outlook.office365.com
 (2603:10b6:510:2db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 08:59:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 08:59:12 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 03:59:09 -0500
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
X-Inumbo-ID: 050a61f7-4510-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLIY4K6tmvvkPfXnEA4Qvfah2KNxnqfUksN9JV9eXyLqxbmQwvfjWHr4n5JAZFbKEZwA5/e0wJNqJ/3TzyscoZ151mzUF2dJjg0HiplGQan8GggsuPBxJRuc7Yk7BiqaMuSw8bS/+CrwSg6BrnsIqmePEpvCv6GpADO5qDxODYv1f2JjEOhaOwmg+DCszoM3iE+PbzyWbKQGZ487zBCM2cwQjAIUds4+1xfWCLyYuKi/KmMMBTC1BjusoyAlsy8mMDFzVHsi4e+FdIlMJ600YJiibQfzyTGaH0T6hR0XhGWok6kbZhloZLYthBNO0+zJNADcXs0E4dkRZ0Cn7LuzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwg2NlTBP35hrmM41Wfoti+1rVU/0ScUPqHf0lNvWgY=;
 b=Ru5zOd8fPY7PricdW9z5BmFdHnLI8EksNSB6Pa3WXVvgwS60wtfLA9pnYK/ZgJPS8FLVUT8UYXgd21EWN0cd7/5eZvo0wdyDTECpb+0mWtypz9zDJIo/LTPt84F969Wc7Wy7X6NdfNCZL11znP9lvAyUbf0bs3FG0wKh7QpNe/9MNSCBY8ES2CHBWpZlw7p8qbJOQLRf1J5/qYq7g78YOL7HXhyRIEc9405wrDifF8YkpXhGL5ggcPBQJWdCs68t8KEj51plsEpEfzvueauGYmey1rVXmgd5ZMgkBCKlFoCRhnCLPd8iLfUbMYb15GEQq0Ful6X8lDTJc3VMzjjwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwg2NlTBP35hrmM41Wfoti+1rVU/0ScUPqHf0lNvWgY=;
 b=16XLdnRqwPXpEgokoD4QtsTMQmBcgZk6Pzz178pDp6age+tLP0kM942jV2k7fLLgR8o/PB9kzYbBAVEsGc1NBd9lhnd8iAUpg0J/E642DZbOawElOr3ca2chzBZNZQeRiRxvJVqEk7xTXc2CasXEtiakeVAURj0EDJtpoIPrhO8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Jun 2025 10:59:06 +0200
Message-ID: <DAHVNGP3WZWX.1IZ7RJEVRFDI9@amd.com>
CC: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 08/15] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-9-agarciav@amd.com>
 <633ffa7f-cf26-4ec3-a153-28404c39d882@amd.com>
 <DAFD99VSFIEP.1VCU7C02XMFPO@amd.com>
 <alpine.DEB.2.22.394.2506061203360.2495561@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506061203360.2495561@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SJ2PR12MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0b8268-462f-452d-9468-08dda733e772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm85VGZ6QVhDazdjVHFmU3hSWGV6cDB6a3pGYUlDMFFXUVZvZEl5NTFBaFRz?=
 =?utf-8?B?MjVKZ3VEaWk5MFhRdEFJZzY2Y2Uyd2xqVEhLTDF0Z0NnQUtISWxNcElPR0pT?=
 =?utf-8?B?MnZuY0RHQUpoQWpxWEMzeVVMZTlWU0pGK1VoOHFWU1VwZ0ZLRHQvQjVianVK?=
 =?utf-8?B?NG9NenR6R2JCZWF4M1dCUjd4aVhsSWR1U09YVUZtSlgvUE4xYlZvV1hJL3dP?=
 =?utf-8?B?WjdVT3NwWExIUC9kMUZYZ1IrT1FaV0lOSGJLMnZ6YVdGMzUxRm9BNWgyUUVK?=
 =?utf-8?B?Rjc5TlVuMStoOUFnZ25lUlFobDVvQmVXRUlWQXRmSVFzaFRJTVRMRlhmQVdZ?=
 =?utf-8?B?NmMrRXVKb3hGeEFDc05pdWJ3aFNCclNhcmQ2bUZkSHF2cVVSZWUzNkdXNUpQ?=
 =?utf-8?B?VkI4YWJTNzRRRmxnRWJ3THZid0tvaDhpVWU1eTJyWUdVMjVGOWRuaWowMFhn?=
 =?utf-8?B?eFlMbzFETHVUSG9YTTVMLzBjbjZhRWVkVjdiZCt1Z2ltejZhL3UyNTRDeEw3?=
 =?utf-8?B?VEJwTUNXTnREak83NUlPd2RnZWl2WDh5MHh2QVVFRWY1YW5KaGJ5Z0d2VERv?=
 =?utf-8?B?WXMzNTJPZ3dWbm9YSzA5RTZMWGNwQnJSWjNmVFVvRi83c245bStlelRTUHo1?=
 =?utf-8?B?VlhsYU84cGNxVk1oMFlYdEVyQyt1MnJ4T2tOenFXL1ExU3R4cGRMTHkyRXla?=
 =?utf-8?B?VHhhUEZveWNuT0NwSnJXOFJYVDRMbUw0Z0NQbXVaWm5VZDVxMXdTazQrMk96?=
 =?utf-8?B?c0JKK091SWpwM1JwbitacUYrb3lvVDVlVlZkMk1PNmJYdjA2UVhTR0FNdERM?=
 =?utf-8?B?N2QwUU4vV0p1bGZhbVg1enRCa1FDb25abFI3OVVYRlJiRWlkM0J0SXExQk9w?=
 =?utf-8?B?aEpyK3YvYUU2LzBiRUo3ZDkrZ0NveFZUWnZ5ZDhScUtuZFlxSlNzTlJhTUZo?=
 =?utf-8?B?TjZRWmh1TUVVZklUaDBnemZUaWZpcjdKbHFYQ2VnYVBJMXZTRjU3ZUFmTURX?=
 =?utf-8?B?SDhaVUZqdzBUeVppU1g0cmJ5SmhDVDFNZFBITzlxeGwramV3STlLM1Zrb0pY?=
 =?utf-8?B?NTJ3OFZLbkFSeWlnRENWeU03YkVIQ2FpZ1hkbU5FeFNJOXlkT0hDakR5aUdJ?=
 =?utf-8?B?RHE5cnU5cmxmNkovU1pXcmNDVXdrUUluNlRLTHRlQ0pvb3p1b1hvN2pQbWVv?=
 =?utf-8?B?TGlxcElNL29Zb0MyU0tZT09taDFTSUJJWldSdmxPTGtpU0pjeUhzOXhVbEI2?=
 =?utf-8?B?OENSWUpKQ0F3Q2dwUnJpbys5VVo0dFVMd09JUmVwaWgyRU5nbWFFUDBIKyt3?=
 =?utf-8?B?S0RTUzdzaVhZZ0Zab1NnMnRJQmFJdXUxRGpqVDlYdmczWHZ3Um5jVHF5VGJ6?=
 =?utf-8?B?VEo3VGkrOFdpd0JkNU45UjlzN2JlQWVlekJ6Yjl6SjVyQ0x0NGR3YnNkWVJI?=
 =?utf-8?B?UFFvQW5US2FXSERLb3hTNTVVdFNlTm1CSTdrd24wOUMxMGRXbUU5dFNRbDJp?=
 =?utf-8?B?Y1pTL2pYaC9tMUhYMlc2SGh5V1ZsWTU4WlZEOHZVRFZMVTlzK1o0SFdqMlBV?=
 =?utf-8?B?MFg0YTcwblpuTTVZdk9DVEJpbVN1Wm5TRTZyem04ckpOMDhENFAxTU8wUWln?=
 =?utf-8?B?c3VYV0pkL3cxTjl6NFNzOGlwRjRmNFpVNGtXaTU4WlZQSS9JdE5YRTJwMlVN?=
 =?utf-8?B?Rkp4Vlh3YWE5cEtaUzVleW44bjV4M1V2ZEdINlVnVUZjVnZHQ0huTS9XWW5q?=
 =?utf-8?B?QTV3eEc5VUg4eGZteTVXUFBIYk10M0g2OWExSWtZV0dhaExKOEY0QWh2dGpl?=
 =?utf-8?B?MEhOcGJzSVlxOXM2RzdKT3RMK3doRS95dFdWNEd2RlQ1YnFSanlMS2xER0dv?=
 =?utf-8?B?RFV4SXVaZ0dUVFl0eWY4Z2RZbzgwMkZzYnFMMGd0S09BVWhSZnFZYTNkak94?=
 =?utf-8?B?c09YWXB3a05yOXhHM1M2Q1hMakN1VUtQcnlQUloyd3R5N1l4a1c5UllieUtE?=
 =?utf-8?B?V0RYdmo3S1NnVGsvZGY1a0kzQWVaZmJDSXZiL1FxZFExTzAra09nOU81eFYy?=
 =?utf-8?Q?IEEoFm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:59:12.3433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0b8268-462f-452d-9468-08dda733e772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181

On Fri Jun 6, 2025 at 9:59 PM CEST, Stefano Stabellini wrote:
> On Fri, 6 Jun 2025, Alejandro Vallejo wrote:
>> On Fri Jun 6, 2025 at 10:59 AM CEST, Michal Orzel wrote:
>> >
>> >
>> > On 05/06/2025 21:48, Alejandro Vallejo wrote:
>> >> Part of an unpicking process to extract bootfdt contents independent =
of bootinfo
>> >> to a separate file for x86 to take.
>> >>=20
>> >> Move functions required for early FDT parsing from device_tree.h and =
arm's
>> >> setup.h onto bootfdt.h
>> >>=20
>> >> Declaration motion only. Not a functional change.
>> >>=20
>> >> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> >> ---
>> >> v2:
>> >>   * Remove the u32 identifiers in the device_tree_get_u32() implement=
ation
>> > I don't understand the reasoning behind changing u32->uint32_t only fo=
r one
>> > function in this patch while leaving others unmodified. Also what abou=
t u64?
>> > Either don't change any or change all.
>>=20
>> Sure. Let's call the original u32->uint32_t change a misplaced mutation =
and
>> move on. The point is the motion, not these cleanups on top.
>
> Yes I agree. I know from past experience that Jan doesn't mind changes
> during code movements, but for me it is important that changes and code
> movement are separate. That is because I have almost automatic ways to
> check that code movement is correct if there are no changes. It saves me
> a lot of time during review. Then I can look at the individual changes
> separately.

That's interesting. Could you please share the runes? That's one side of
review I still struggle with.

Cheers,
Alejandro

