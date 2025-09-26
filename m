Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58168BA373D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 13:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131471.1470551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v26NQ-000475-Le; Fri, 26 Sep 2025 11:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131471.1470551; Fri, 26 Sep 2025 11:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v26NQ-00044D-IX; Fri, 26 Sep 2025 11:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1131471;
 Fri, 26 Sep 2025 11:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJil=4F=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v26NQ-000445-0B
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 11:12:36 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b14d4b17-9ac9-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 13:12:32 +0200 (CEST)
Received: from PH8P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::15)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 11:12:25 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::31) by PH8P222CA0013.outlook.office365.com
 (2603:10b6:510:2d7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Fri,
 26 Sep 2025 11:12:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 11:12:25 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 04:12:22 -0700
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
X-Inumbo-ID: b14d4b17-9ac9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDJuvQ77FM2JpoDi+HD1AbBKRm/jV9eulBpJ4DxmFwITyGLM0wIeIojZN90BbFyytid6Goh4SzWiuxyaTv7iI7Tg3YcBsCp7w/oh2PvycigZM27Gw6LNrRGN5cgfuMQ69TKrHqczehVlXARyhl1382WDFT4Aj9vMBVC9xAb+lpwYWVBc6uUjnjcIiQn4Ol5cze+E1Aeq4LNzSJ03ymofR33HBBRKfpVNsWa7qFqR5sTMntYHvQAqY4GgraZZdhNysnCtP9daHAx6nzzezQxxF29Sj4J6RIMcxTyHpCdMIzM7BUD1bfdyaCRHK10CFut4yCOGzRxVQxsuLD208fTcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzajiwx0A3guhkdtw7jkMSY57vLA5gqRDVsAbJEPL/4=;
 b=lMpLd6vOfnE2HwwzWNacn62CU5pVDEkvd6t/c6+KQY4gvMOjN6vp9TebfGq2M34mOHsAQdI4PY0HgD2FvU3fxh7OX+lPMB+aX9VkcLDD3f+iuPCHDaXZswFJEdpR8MnvD11kTV8/p2LLRlAzPknZSdG7le+KPmlApH+E7iAfLn9kGs0mctZVYaLA/6x1DUeAemFeouHc1P7WAF0hDZCenQDDp/2eSM/SktOlKKDfraTwQ4Ao50y0oNFqW1nQMIi6PE7SvTdY+kgh3aeHU2KkbJjZxA46sPzCqvtqBonW4577ycmShvDIZu5c66DkadJTcYsv/RcoJG35la8ghKh5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzajiwx0A3guhkdtw7jkMSY57vLA5gqRDVsAbJEPL/4=;
 b=X9mlUAt5500gN5qIz9SqyuAB8QPs6FrMFrWSfEvBcMr2GS/0212aaUm4La375OYEOylYFP8Jad/Xt0Py4UWapH0PZGHd3t9gs5nA6IGq9qCUKxxWRfv9SuQhRuhGX7Lkqf0K16ldoUkaTQJgj0FlAWW7p9I47CIhGm42Dc8chBQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Sep 2025 13:12:20 +0200
Message-ID: <DD2OQUPHOOV8.2IYRM1EKH35Y6@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx
 regs
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
X-Mailer: aerc 0.20.1
References: <20250925195558.519568-1-grygorii_strashko@epam.com>
 <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
 <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
 <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
In-Reply-To: <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9808eb-27dc-4a12-1635-08ddfced92ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGJzNHZOY2NoYnF3ZnF1V01kVTE3K3Bzd3lkanovd1VWTHNUWEoyWGw4UEtM?=
 =?utf-8?B?cUhmN3JNRitiWlNoOERJUGhTWndaN3pFNnhrdkhGT0ozMDBsMHNiZTZ5dFpS?=
 =?utf-8?B?TXRjckJGSmJSdnFDcWtDdXc5alkvM3pEbmxDaFVXb0lxS2tWVFQzQkpYMDRO?=
 =?utf-8?B?aXh6aXc0WGI2RWlXcHJYVHFzRTdzMlBNTXZIYzNFZFBsVEtNVWp6blQrazdO?=
 =?utf-8?B?dHBHenpqU1JGdHVJK0grRlhxbmV3TjY0bWljQW1GckN0dE9HV0NwRnFwUEI4?=
 =?utf-8?B?Z3pwaEtaakQ0V1grVzBSLzdUQXZKUDczWGVRK2ZVY1I0VVJXSk9UMWhUU0FB?=
 =?utf-8?B?YWFUTjFNMDhXSGVpZmdKbVI4N3kyd0FnVU4xb2NTNit2UlNWZ3dORThFWG90?=
 =?utf-8?B?YTdqTFZ6YkFTajFGdnRWTy8wOFM2NSs4MlhnQzBaNkRXaVk4dDNVaXFWUUg3?=
 =?utf-8?B?WGphVDVSRVoyQWlvSVNlY0x2M0FDYUFTamZHL3hib1dLYk5FWWRweHkzcEpV?=
 =?utf-8?B?dnFFSHE4RHYxVUdJeGR4bmRzTkhWMVNwemZ3L2tZSGdQU2JnRFJMWWl6YUla?=
 =?utf-8?B?NG1XYUowdFZXdmViTHNxa3FtK1NhS1NuTE5zUkdBTFhLbktJcFVMVk1jQVZz?=
 =?utf-8?B?dWQrY3laUEJXcVF6Z0MzYTltMXk0cGZxL1Y3aCtjQThNbVo0WHdyVjBScEpa?=
 =?utf-8?B?dnRaWW04RWt1a2ZRZ3diOFh4RzllY3BqT0NYbi9ja0ZtaWk5c0sxQ2hnOGFD?=
 =?utf-8?B?Y2NMTWhJTDVjNzNYcUlLNVJrZ0h2Z2dENHJrc0UyT1Z1dHl0QlJDYlhvdEZV?=
 =?utf-8?B?dk9USDFreFAyK1d6cWxUS0JNVWR4anRkUWl2aFdIUGdqTXd0bUlaRlJMZUZn?=
 =?utf-8?B?OVUvbkRubktBaXBHVkgycjhNK1p2MTB2cVBLcGwzQ1dobVp2eGluaXFnYW4x?=
 =?utf-8?B?MWJNQndreWN5azgycWtDQThrOWJiUFFMbmhSRWtpaUNKK0RoSlJjaEhJQzZK?=
 =?utf-8?B?dTR6dkYwRWc5THRQaElRdUFSM3llTHNBckt5cXRnNlFWSUcvR2J3WGdOWU45?=
 =?utf-8?B?YUw0a2hVQ2VZdWlsbDJYbnlyeWw0S0wyRGtTQmFXNDBoaVF6dnJ6VjI2bUVo?=
 =?utf-8?B?dUNORXFNY2lZT1BkOHcyZW9yVVg3N0syNGE2Q1BtWDlRQ1orWWd3OUNzUUdP?=
 =?utf-8?B?QUI0UjlreStpQjNITU02bmZtYzU1RUd3V2l0aE9QYmRmTWQ1eWFCenF0MThm?=
 =?utf-8?B?RVJMeWZEQkUzeHl3RDl1cDliZDlKdFlDVDVrRW9mcEc2WHZId21MajJ6VmhV?=
 =?utf-8?B?bFljcXgrcHpSN0haTjU0TTM0bkZML0I5WlB6NmxHTGlRcHMyRmd0Z1YyM3pv?=
 =?utf-8?B?NHMrRDg4ek9FNHRqZ3JRMThwcms1VmZUMmRDWCtYTXdBbVg2QzBRQ1BuOHhH?=
 =?utf-8?B?dnNzM3BqSHFESlNmQWRIN1dxZ1RjbUQzZ0d0T2NqNmRVRDBwNnMxeE1LYVY0?=
 =?utf-8?B?RGFWWCtYUllvbTlFN2d3dVRhUWYrVTRmOGRUZFc1cUJhaDBXNk9URm8wNHJy?=
 =?utf-8?B?VVFyVTNnNDM2c0NKVG5uYU11VFo3M2hFRzUrZDhoajltNzRnRWpiVVE1dkY2?=
 =?utf-8?B?RStXaUI0U2xUeXRuUlJ5NGhzU1AvVkFucTVhb1FnNnJlQUY4bGNzQndLemVl?=
 =?utf-8?B?NHA2V0lWWS9mcjNPUm9PcEJFTG9CZ2JYckdSZHBVVWtZWXdHTEprbkltbmFa?=
 =?utf-8?B?cnl5cmNRSHpBcXljUUd0K01kUWJPdzFNN21UbjNZTXJNNUpsZXN3REtaUlRP?=
 =?utf-8?B?NDY3QXluVDFBWGVDTjRsS0RubzFnNVBpNmxhZ216UC9JN0lWeEZuN1d3TnFu?=
 =?utf-8?B?UWEyQnhWWmlnZTBGYVlmOWtKdjhzZ3dZTlVYSGJPTkJpaGp4bTlRQk5YYVpq?=
 =?utf-8?B?MnUwRFFtNDN2V2tNejdBVHRydWNPRXJOWkFwb29yd3U4U0V4ODNHMHNDbXJk?=
 =?utf-8?B?Vk5laFZWOE1NV1FHYVRSeHdkM1EvMFhLcEZuNmRsdjVDVTllT1dTeFFDR3Nj?=
 =?utf-8?Q?QJKOgS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 11:12:25.4023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9808eb-27dc-4a12-1635-08ddfced92ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177

On Fri Sep 26, 2025 at 12:52 PM CEST, Jan Beulich wrote:
> On 26.09.2025 12:38, Grygorii Strashko wrote:
>> On 26.09.25 11:17, Jan Beulich wrote:
>>> On 25.09.2025 21:55, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> The LAPIC LVTx registers have two RO bits:
>>>> - all: Delivery Status (DS) bit 12
>>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>>    This bit is reserved for other LVTx regs with RAZ/WI access type (M=
MIO), while
>>>>    WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bit=
s
>>>>    (MBZ access type).
>>>
>>> Question is what the behavior is for writing the r/o (but not reserved)=
 bits.
>>> I wasn't able to find any statement in the SDM.
>>=20
>> Me too. Usually RO/WI on most HW.
>> For example, LAPIC MMIO "Write" will be ignored (WRMSR will trigger exce=
ption).
>
> My remark was specifically about WRMSR, and what you say here contradicts=
 ...

Not quite what you're asking, but writing to the X2APIC_ID register does tr=
igger
#GP(0), so one would hope writing to RO bits triggers an exception too rath=
er
than being WI when mixed with RW bits in a register.

Now again, it might not in order to avoid #GP(0) on a race.

Definitely worth running a silly test with wrmsr_safe() to make sure. I cou=
ld
see real hardware going either way.

Cheers,
Alejandro

