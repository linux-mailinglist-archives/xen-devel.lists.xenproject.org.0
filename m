Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Cw+BuU2cmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:40:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD26807C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211205.1522732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivr4-0003D5-Fb; Thu, 22 Jan 2026 14:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211205.1522732; Thu, 22 Jan 2026 14:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivr4-0003Bb-Cs; Thu, 22 Jan 2026 14:40:14 +0000
Received: by outflank-mailman (input) for mailman id 1211205;
 Thu, 22 Jan 2026 14:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQsG=73=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vivr2-0003BV-Pq
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:40:12 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f65397b-f7a0-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 15:40:08 +0100 (CET)
Received: from DM6PR02CA0132.namprd02.prod.outlook.com (2603:10b6:5:1b4::34)
 by DS5PPFA33D606F8.namprd12.prod.outlook.com (2603:10b6:f:fc00::65b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:40:03 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::cc) by DM6PR02CA0132.outlook.office365.com
 (2603:10b6:5:1b4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 14:39:54 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:40:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 22 Jan
 2026 08:40:01 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Jan
 2026 08:40:01 -0600
Received: from [172.23.120.160] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 06:40:00 -0800
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
X-Inumbo-ID: 3f65397b-f7a0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVHewvbGwC3AJzgFxZVSbCsEIKnnh5T7RUXUb8dfNwlENONkdHmy82hbJdF+00CRwvp6b02YXcUCELgqmN1GmDyPWVAxvNnqyOk9mjh7Yzjt0gde45MCWhDWN2Y7aMnfMlN4ONcRVOe6KN//xNlFYe8S1/w4FLnEkSTWBEbair/OJze+K/dhl+0r0NpUCwovaBxeZtbR3TfLfz8r3G5Xry9RMHqrohs2Xe5hneif+OgjPfQnVFU8EBLXICXXTZVjeOb5UpLkUwrFMqjoaiQuXzmzoNCdhkFCNp4fy3t96zapicKa6/WUfbsvasHTKXC3QSbCOierC0960HrcIfCmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rnVIdtsp6adCpj2/AzCDEMpWp/XE1GW63wMHnfkltg=;
 b=K4heggcivcOBfbeSimYwaI+vx25AaTMusLj1d3N2+eftPOVD3UdTlUf/xUZOevMo1OGsIC5I9eW9VAKSQerghGBIj6R2OqCqbhLmAzPbjoBjWj19eJ/lJ1tcP+Ro/YRerk1kpFHzKXYte8uZyKmy8huM78NAK0MM3132LnctY3PrWzAI4HZATRNoa9ynMWJp4M72/zBhhJN+sDhSvx+RdY4H12dx1W5FDX6OJwxBkFVdwIexsI7HCABlPWn1sEDpjY4UpVVPQc9Tw7JzlzG5qd7/IM4n+aI20W/Ntq1MED2j+KdALZZQeCvX+nnMI2+qwqx1phqNSxQtlkU2NkJnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rnVIdtsp6adCpj2/AzCDEMpWp/XE1GW63wMHnfkltg=;
 b=uVWFGT3fCFtTBSNc0wKMIrkjbhHRIEbTDe+W5P2Wiopz814QjGVCYMPTLTIhqKhYSn0KKmT+Y1XvN5eEuBepvbNeQqrtK5ixyD1TzIHVYPuZdnTkQCkHJLFKa0qKhzivrymeLwXzM+8NxWq7I58kVGKXLjwmL3Yk3NN4uL/T/yY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a72553d1-3d79-4314-aa41-11a09dc60089@amd.com>
Date: Thu, 22 Jan 2026 09:40:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "James
 Dingwall" <james@dingwall.me.uk>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com> <aXC1sFjIRUEB7qOW@Mac.lan>
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com> <aXERjdPS3KlcD3C-@Mac.lan>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aXERjdPS3KlcD3C-@Mac.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|DS5PPFA33D606F8:EE_
X-MS-Office365-Filtering-Correlation-Id: f71e561f-7ab9-48d6-1896-08de59c42023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anpqSGtNVFlIdlJyeTR3L0VpTE43OXNXRk8yd0JCL0pTZTZ3aEtrZmg5enFD?=
 =?utf-8?B?Q2lyVzJmTnlQbWpWZ04vUGpxUHhyZmhJWHBoTmNWRm5OZVlNdkZvU1I1OFJB?=
 =?utf-8?B?cHpiQlZBVDVxNHpsQlV0YlpuVnpJclBjbTRWejdCYTZWenAwaXp2SmtDcGlV?=
 =?utf-8?B?OTBEYm82ZmhFWitkK3B1MFh4QjZzOHh5cTRoWkJPVHcrR3FYZkhjS2hENDNG?=
 =?utf-8?B?SFJ1cS9NMTU2aXhEbGxWN2lZY2c0QkUrVkNxd3R2R3ExZW5HVnBUaTRrKzdt?=
 =?utf-8?B?VWd6ZjdBVy9qNTVQcHR3bDZydTdiT2RGTUtRUVFwbXJBOTBVSTZtU3E1UUdR?=
 =?utf-8?B?UHgvYk9IeGFWQkdsblpXNTNEY3Z0OU0vc3RvcVZCeXJkV1N6MEt5ZllQeElV?=
 =?utf-8?B?U1EvWnJnZHRqVVM2SXQyUzZyczM4NGR4WDFleitYNFBiSUdPV3ZKbGMzVXQ5?=
 =?utf-8?B?OWZBalNuZ1N4cGhwTUNwamxKc1UwYlhHTzRHZWtqME9JQkFYRzBvMWxOTnpG?=
 =?utf-8?B?Z3pYSkNlS0dTajBPR3E2b3R5dWtENm9pTlI4QzBrRnBwSmFFck0vdDFvRlMz?=
 =?utf-8?B?MWNEeFVVbzlBcjYvbWd1TFBjYVB5WkdmYUtReWFvaEppRk1MZFlmSm1vQ045?=
 =?utf-8?B?azhTbjFrVzhDTkk5NGVhVFdjbXVxbldRNVB4QU1JUVFXQUhGRWtxM2RNWlp6?=
 =?utf-8?B?amlIZDlSRTRuR29KamZtV0tnK0k3NVpIMVg0R2RFblNIRDl3bW1UKzFzRzA5?=
 =?utf-8?B?dXB3NjV2ZlhuVG5CVjRpWWhNY3lHRUVxZzBzMGRvWEtYZmFyTXNobG9YNDgv?=
 =?utf-8?B?MndOaS9ZK2J0emFXd3IwemlXRkw5OXdtTkhmS1drRVA3N0g4SGVNVE1vUlpp?=
 =?utf-8?B?YWlmclFCczd0c1ZjRzdONkdzRXgvM0MrU3RnZFBib2xmUzV6bzl1ODFiSHo4?=
 =?utf-8?B?Nms5SHVENFlkZCs2czNoRVNHYkVSOHB5Qk81Sm9LanVHWnJEQVdpUzRaMTFS?=
 =?utf-8?B?THRCYlpRbDRrZDBxTHpuL1R6S3FiUTAyelRhQlpDMkhVV2JEN29vL1ROT2JH?=
 =?utf-8?B?ZW5xY0pzUWp4bStkUko3eTV1SjJKdFgrNjF0UG1wZDArNUU3ZHFSYWduU1Iw?=
 =?utf-8?B?VVMyTGN5MzVZQ0dDSk9ZdWFRcUhMMmlzZ2VnOUJJYmxydEhDZ1ZucFVjRVFN?=
 =?utf-8?B?R3dTdThOZ3dwby9xS1UxK0hMbVl4aUtrZG1Rd1I5cjEvMnVwMXFBR1l4TWVz?=
 =?utf-8?B?anBlZnd1U0oyRXZoRW9nNGRsWFpVQ21ETE1odEZBVjFPbE8xL2lEQkxwa2dQ?=
 =?utf-8?B?STNyTzArT1dHVjdndzlnb0MyWkFrNUswSnprZEducEtNK3pHSEFCYzh3U29I?=
 =?utf-8?B?dFpuM1kzc0VBZkpqeDhxUnVaZVFUNmVIOXlrRlhhemlMbW9XVk5DVXgvNGFS?=
 =?utf-8?B?SjZOOWtVZytJWFlRTFg4Z1dqdEx6ZGk4QVdmYUMyWlFiUnRvS2FTNTdzMTRK?=
 =?utf-8?B?ZFg3N21CNXBGYnkvZkhFNFJKazNHcVlKTDR3TmVoMmQ1RUpnMTdXZWVoUURP?=
 =?utf-8?B?Z25xMG9rVEhuRUNsWEU3eHJiNER2d1RycTdDZ3lkaGE1cUIrZ0lPd3BlOVBR?=
 =?utf-8?B?QUU2K28zRWkzR2pUR1FNSnRxYzlFb1R2cmVmNCtXc09mbVUxUThOcW9jbWNk?=
 =?utf-8?B?cHM4eTVWR2orR0tIcE9scUdvM2dqZjlJNUEya1FVUDdubHYwMXFBelJmR0Mx?=
 =?utf-8?B?NktiTllLaWJiRGhhYXFwMEZIN3BxWFFUOXZFRVF6V0JWYUdQVzc3VGZZd08y?=
 =?utf-8?B?eGlLLzNqRE9OSzU4Vkt0em1iWVlxT3F1K2txdjUweTNxSEhZN3B0RzFnMFR1?=
 =?utf-8?B?UGZ2bUJyS2VZZHZjTlRmUjFiU1lKWnd0Q2NTd0NoZUZaZVU0N3NBaFB4ejBX?=
 =?utf-8?B?TVhrZXVVNzI0bzhTd2VsRzJVRDVJaFd1MktKMExCV1lPM3VOWEV5N1RPeTgr?=
 =?utf-8?B?b2JyV2tmSnN5c201dzVSLzJQaHhQQmRYVzFYVFZFWE0zRkFQWkZQK0NXQngr?=
 =?utf-8?B?WGx4U0UrQmZmRnZoeEJXKzlCN1VNOWhjWVFQM3hycXpVTTdGYkdCT3o5S0F1?=
 =?utf-8?B?MS8zWk9Ddi9zSTAxN1BSVWdaQmk5YmxCbkUxUGwrYi8zK01VYW5laEJqY1cw?=
 =?utf-8?B?VTA4SW0rMW45TTJIUjdsZW1TUWl5UDI2ZTlyZHRLV2I0MkptUWxkbjU4a3Rl?=
 =?utf-8?B?QU5RTUFQaEs4TE5KNUhyUUp2Ty9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:40:02.0428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f71e561f-7ab9-48d6-1896-08de59c42023
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFA33D606F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,dingwall.me.uk:email]
X-Rspamd-Queue-Id: 41CD26807C
X-Rspamd-Action: no action

On 2026-01-21 12:49, Roger Pau Monné wrote:
> On Wed, Jan 21, 2026 at 12:21:33PM -0500, Jason Andryuk wrote:
>> On 2026-01-21 06:17, Roger Pau Monné wrote:
>>> On Tue, Jan 20, 2026 at 03:10:06PM -0500, Jason Andryuk wrote:
>>>> On 2026-01-20 09:06, Roger Pau Monne wrote:
>>>>> This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
>>>>> the current memory target for PV guests is still fetched from
>>>>> start_info->nr_pages, which matches exactly what the toolstack sets the
>>>>> initial memory target to.
>>>>>
>>>>> Using get_num_physpages() is possible on PV also, but needs adjusting to
>>>>> take into account the ISA hole and the PFN at 0 not considered usable
>>>>> memory depite being populated, and hence would need extra adjustments.
>>>>> Instead of carrying those extra adjustments switch back to the previous
>>>>> code.  That leaves Linux with a difference in how current memory target is
>>>>> obtained for HVM vs PV, but that's better than adding extra logic just for
>>>>> PV.
>>>>>
>>>>> Also, for HVM the target is not (and has never been) accurately calculated,
>>>>> as in that case part of what starts as guest memory is reused by hvmloader
>>>>> and possibly other firmware to store ACPI tables and similar firmware
>>>>> information, thus the memory is no longer being reported as RAM in the
>>>>> memory map.
>>>>>
>>>>> Reported-by: James Dingwall <james@dingwall.me.uk>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> Thanks.
>>>
>>> I've been considering what we discussed and as a separate follow up we
>>> might want to attempt to switch to using `XENMEM_current_reservation`
>>> for dom0?  It might make the accounting in PVH dom0 better, as that's
>>> what the toolstack uses to set the xenstore target when initializing
>>> dom0 values.
>>
>> Yes, I thought that could be a follow on.  I've attached what I have tested,
>> but it is based on a branch pre-dating xen_released_pages.
>> xenmem_current_reservation with PVH dom0 seemed good without the
>> xen_released_pages adjustment, but I don't know what that would be for a PVH
>> dom0.
>>
>> Regards,
>> Jason
> 
>>  From 8b628ad0ebe52c30e31298e868f2f5187f2f52da Mon Sep 17 00:00:00 2001
>> From: Jason Andryuk <jason.andryuk@amd.com>
>> Date: Fri, 7 Nov 2025 16:44:53 -0500
>> Subject: [PATCH] xen/balloon: Initialize dom0 with XENMEM_current_reservation
>>
>> The balloon driver bases its action off the memory/target and
>> memory/static-max xenstore keys.  These are set by the toolstack and
>> match the domain's hypervisor allocated pages - domain_tot_pages().
>>
>> However, PVH and HVM domains query get_num_physpages() for the initial
>> balloon driver current and target pages.  get_num_physpages() is different
>> from dom_totain_pages(), and has been observed way off in a PVH dom0.
>> Here a PVH dom0 is assigned 917503 pages (3.5GB), but
>> get_num_physpages() is 7312455:
>> xen:balloon: pages curr 7312455 target 7312455
>> xen:balloon: current_reservation 917503
>>
>> While Xen truncated the PVH dom0 memory map's RAM, Linux undoes that
>> operation and restores RAM regions in pvh_reserve_extra_memory().
>>
>> Use XENMEM_current_reveration to initialize the balloon driver current
>> and target pages.  This is the hypervisor value, and matches what the
>> toolstack writes.  This avoids any ballooning from the inital
>> allocation.  While domUs are affected, the implications of the change
>> are unclear - only make the change for dom0.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   drivers/xen/balloon.c          | 9 ++++++---
>>   drivers/xen/mem-reservation.c  | 8 ++++++++
>>   include/xen/interface/memory.h | 5 +++++
>>   include/xen/mem-reservation.h  | 2 ++
>>   4 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
>> index 528395133b4f..fa6cbe6ce2ca 100644
>> --- a/drivers/xen/balloon.c
>> +++ b/drivers/xen/balloon.c
>> @@ -713,10 +713,13 @@ static int __init balloon_init(void)
>>   
>>   #ifdef CONFIG_XEN_PV
>>   	balloon_stats.current_pages = xen_pv_domain()
>> -		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn)
>> -		: get_num_physpages();
>> +		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn) :
>> +		xen_initial_domain() ? xenmem_current_reservation() :
>> +				       get_num_physpages();
>>   #else
>> -	balloon_stats.current_pages = get_num_physpages();
>> +	balloon_stats.current_pages =
>> +		xen_initial_domain() ? xenmem_current_reservation() :
>> +				       get_num_physpages();
>>   #endif
>>   	balloon_stats.target_pages  = balloon_stats.current_pages;
>>   	balloon_stats.balloon_low   = 0;
>> diff --git a/drivers/xen/mem-reservation.c b/drivers/xen/mem-reservation.c
>> index 24648836e0d4..40c5c40d34fe 100644
>> --- a/drivers/xen/mem-reservation.c
>> +++ b/drivers/xen/mem-reservation.c
>> @@ -113,3 +113,11 @@ int xenmem_reservation_decrease(int count, xen_pfn_t *frames)
>>   	return HYPERVISOR_memory_op(XENMEM_decrease_reservation, &reservation);
>>   }
>>   EXPORT_SYMBOL_GPL(xenmem_reservation_decrease);
>> +
>> +long xenmem_current_reservation(void)
>> +{
>> +	struct xen_memory_domain domain = { .domid = DOMID_SELF };
>> +
>> +	return HYPERVISOR_memory_op(XENMEM_current_reservation, &domain);
>> +}
>> +EXPORT_SYMBOL_GPL(xenmem_current_reservation);
>> diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
>> index 1a371a825c55..72619a75fed2 100644
>> --- a/include/xen/interface/memory.h
>> +++ b/include/xen/interface/memory.h
>> @@ -104,6 +104,11 @@ DEFINE_GUEST_HANDLE_STRUCT(xen_memory_exchange);
>>    */
>>   #define XENMEM_maximum_ram_page     2
>>   
>> +struct xen_memory_domain {
>> +    /* [IN] Domain information is being queried for. */
>> +    domid_t domid;
>> +};
> 
> Other callers that would use xen_memory_domain just pass a pointer to
> a domid_t, I think you could simplify the patch to the diff below,
> which sits on top of the patch here:

Ah, yes, xen_memory_domain is just wrapping a domid.

> 
> I haven't tested it yet to see whether that's OK to do on PV, I would
> think PV and PVH would be the same here, since the setting of the
> xenstore target value is based in the return of
> XENMEM_current_reservation for both.

On a system with 32GB and dom0=pvh dom0_mem=7G:

[    0.295201] xen:balloon: current_pages: 1835007 get_num_physpages 
8220126 xen_released_pages 6385120
[    0.295201] ------------[ cut here ]------------
[    0.295201] Released pages underflow current target

8220126 - 6385120 = 1835006

And also for PV:

[    1.406923] xen:balloon: current_pages: 1835008 get_num_physpages 
8220127 xen_released_pages 6385120
[    1.406928] ------------[ cut here ]------------
[    1.406931] Released pages underflow current target


So we don't want to subtract xen_released_pages for dom0.  Is 
xen_released_pages expected to be non-zero for a domU?

IIRC, for a domU, xl writes the xenstore nodes as the ~build time memory 
value, which doesn't include video ram.  Later QEMU populates the 
videoram, which increases current reservation.  Then the two values 
don't match when the domU initializes the balloon values.

Regards,
Jason

