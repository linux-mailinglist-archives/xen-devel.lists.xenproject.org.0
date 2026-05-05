Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLHHEsPY+WmbEgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 13:47:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB484CCEB3
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 13:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300598.1575131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEEz-0008LR-56; Tue, 05 May 2026 11:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300598.1575131; Tue, 05 May 2026 11:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEEz-0008Ja-0w; Tue, 05 May 2026 11:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1300598;
 Tue, 05 May 2026 11:47:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKEEw-0008JS-QK
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:47:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKEEw-005qYl-6f
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:47:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9d8b2-2eae-0a2a0a5409dd-0a2a450c8522-10
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:47:01 +0200
Received: from [52.101.48.11]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9d8b3-62f1-0a2a450c0019-3465300b96d9-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:47:01 +0200
Received: from MN2PR15CA0060.namprd15.prod.outlook.com (2603:10b6:208:237::29)
 by IA0PR12MB8351.namprd12.prod.outlook.com (2603:10b6:208:40e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:46:54 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::2) by MN2PR15CA0060.outlook.office365.com
 (2603:10b6:208:237::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:46:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:46:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 06:46:54 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 06:46:52 -0500
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
 b=nRPrrMZ9mGLwhvRkl4s9QwxlzZQ4xwaqpMREsu2NUsr8pe9vg7bA3tRvgyhXXepZZOgAV2TdI07gbty7XXR5pWlmGLP0bdN/j3ItcrIMdGADWvKoM7uw2x8ILwXv0AKsHoXcF7k3N0qeaPLG8AehtdY00hWkUbebZWrtvesktleQyrdspwhwscIbKaRdHG0vuQqQHg1TVpg2HQjTe5qdjDdwWvvYDiYfbhpS7dYAgRPlMnEPpQot5TOVkCQ0Lls6DxTR1KJVCnkI87xIo1/VmM2ZihZKY2NF85L/5RQNAYD2bRzzus9Q8FxFcDPCvuwlSm4j95gbP1OaSkIKiWVY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO/hqEQGDYCvI78Tkm89eNsspf+JFbvgz/tUt2AzHtA=;
 b=fsP9WwRMrBKtDAPVGSM/90M5+xnqmqhS+UqoEuDcYYMB3qVkFGU1RHBOpsT5RfdSvPDJGPEnLi4KnnY8axQOH/mqTbkS3WEoOjTLukXosbLUPsfKZ4bWZqjsaKzgLTUzL5YI06PV8zeZqJF3vOWsWISSwLxTpCCwk07lJx8TMn/BRqwuP0Wc4rN4fyg+t1ExR6zAqETFR0xae5/9Cj2sXpO5DjVD4+70xvpTEMPqwoGA3khL88VA+M1BubtN1BG6utxQrocwk3/vY3v+nQW9z8SC+KiyyVRGEprKBxfVGfIInqXVvgdGjdH04TOR5STd3bIAGDZQ3mQ6JYG4fdmf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO/hqEQGDYCvI78Tkm89eNsspf+JFbvgz/tUt2AzHtA=;
 b=HkM4LgYhy3hDCdXBh20PDnSQRJ8av27AhonKipOSkqp9Olc9MY6uVRlnB8yynnoX1hz6j6ugu39oJC4SxWkUsuv4HzSxdbcsMW5tVuO8buI+40EA4EJCgrt+u7FAmwJI1pXmVgDPB1pY9qUw/Vh/kMXwHFycd+zi2QeAW6A3x5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e8218607-26d8-4517-8634-df3c365e5bb2@amd.com>
Date: Tue, 5 May 2026 13:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
 <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
 <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
 <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|IA0PR12MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0759fbfa-dd39-44f9-da28-08deaa9c011f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zXqEhFeSDE0pSlhxg+v4merHA6HiWVWmwwRlUawvNujPsrqLl3bkqMoOSde8MyQqBcCaPx8MLriVYRQ9RNUJfKZxsHHVcECsMenJtay6TdOcbsM4MpFo1uU6BNgaAYf+J3Q+RmugaS0DWD+wTgWYUYdbAB0zAOMNZ/5Zoiw3mqYri44MtgAmw1tRFC7XSN3jPNZRslRgDPf7m6t2LlPFu6pdSwE6gCj7NOAE5VbtPb6LzmPVw1UhDBTaDRZcTMnTe44gTfv0A/EoUOeTsmWIUAxqUaFyjsPyf5k+vUzsDEKaz7N5h1F2nkK48pSe6IO0yyAfLdxnm/DqMFapQ5bwf4pYXO0GjeEja301QqGf0ZjCt3kbfxUAJJq5ONGST44X6vDz0eBTz7aygd3/um7uUFQySrkr7Ls0vZ77TR4G7QTFvDJT5N0trUfWsxGULjj7HeP67U8nq2TZGhvR5t7RdmXcfsjHvEEXx4ZvZ+KnrK/obBHL3mcf+gtXTMe+fhnl1PcpLE6MROLwoANlSNbRL5fu96YmSbI8WUg4JxaiuIzI86OKdg3FLINyNmcWqNi/kWTUFHIRCrXBB9QYF8fVrUD3NH7M97UdE2Pl2NaI+h++FItntRI/jZbZnBQlQ1eTmyU4FhgzG0tkRBLbVmsC7t6rUVCbWFoh+YHFfxhjQ7YElk+3CsZxqt2XLvZLp9MDUy6rIGDs01jeOtcVv1pe7+QERT3SUApiezRH8pP3YwA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NEADBj4SswHw2YTu9cF1Rr6N9dOQttO7UALkr0vvLNuPv5R0MCrtOk8nmoXgY166U6CTSdo4bnyyDD7pFi8oAedrYyTNAn13ejyuN80nqx2t7ZmMxgdbIBkgxHTPzzOMu6qBzN8/+e9v7B1HFishBgEDYUYghIlkKzzHCXZaCx1jVVAgV4EsFic3PJeR9A088IbSGgbXcm0qw6rLj+H4E+pZeX7ghJttGbFpvbicWCW/Mbc4sPZ4lOPUt+afwNc2ac5BimYf5dvj/ZbPegIOITMHdqNZQqtkp0G9HsPASLowXA9zDWS6sU34YQgtgX120FY2cIhqBKqkEBtoaHhKFO10vLFivTckeGUJg6W0ntsFRgnjl9BUXL77HaDqU5DSi2bUeMHbI2LxnHPD9+GR34W6cZD96MqG1GDt7k4wWawJdhoEH/QtyN2zEh/+l8iL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:46:54.3320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0759fbfa-dd39-44f9-da28-08deaa9c011f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8351
X-purgate-ID: tlsNG-d25034/1777981621-F5A00CF5-AAFF3C35/0/0
X-purgate-type: clean
X-purgate-size: 3693
X-Rspamd-Queue-Id: AEB484CCEB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]



On 05-May-26 12:49, Jan Beulich wrote:
> On 05.05.2026 12:46, Orzel, Michal wrote:
>> On 05-May-26 12:40, Jan Beulich wrote:
>>> On 05.05.2026 09:35, Orzel, Michal wrote:
>>>> On 05-May-26 09:13, Roger Pau Monné wrote:
>>>>> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
>>>>>> On 04-May-26 17:28, Roger Pau Monné wrote:
>>>>>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
>>>>>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
>>>>>>>> the frame table starts at PDX 0, which is only true on x86. ARM
>>>>>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
>>>>>>>> defines it).
>>>>>>>>
>>>>>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
>>>>>>>> to 0 when the arch does not define it. This makes the generic macros
>>>>>>>> correct for all architectures, even though they are only used on x86
>>>>>>>> today.
>>>>>>>
>>>>>>> Hm, I assume this offset was added because the original mask PDX
>>>>>>> compression won't (usually) compress the gap between 0 and the start
>>>>>>> of RAM.  However the newish offset PDX compression should be able to
>>>>>>> compress from 0 to start of RAM, and hence you don't need to apply
>>>>>>> an extra PDX offset there?
>>>>>>>
>>>>>>> If that's indeed the case it might be better to integrate
>>>>>>> frametable_base_pdx into the mask compression algorithm itself, so
>>>>>>> that on some arches it's a mask plus a decrease.
>>>>>> The offset is needed regardless of whether compression is used. With
>>>>>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
>>>>>> 0x80000000, the first valid PDX is 0x80000.
>>>>>
>>>>> OK, so you are doing some (kind of) address space compression (removing
>>>>> the leading empty range to the first RAM region) even when PDX is
>>>>> disabled.
>>>>>
>>>>>> Without frametable_base_pdx
>>>>>> the frame table would have to be indexed from 0, wasting
>>>>>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
>>>>>
>>>>> But you don't really "waste" memory, just address space?  Oh, maybe
>>>>> not on ARM as it doesn't use pdx_group_valid?  And so you
>>>>> unconditionally populate the frametable from PDX 0 to max PDX.
>>>> With pdx_group_valid (which this series adds) we wouldn't waste
>>>> physical memory for the leading gap. But we'd still waste virtual address
>>>> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
>>>> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
>>>> the virtual offset before the first usable entry would be ~70GB — more than the
>>>> entire 32GB FRAMETABLE_SIZE on ARM64.
>>>
>>> Yet still - this is exactly one of the situations offset compression means
>>> to cover. I'm entirely with Roger as to it being undesirable to build a
>>> special case variant of "offset compression" into "no compression".
>> In this case, if you don't want to generalize the macros, how should we proceed
>> on Arm if we still need the offset to cover the PDX_NONE variant that we also
>> use? In v1 I just created a local override but Julien wanted to generalize the
>> macros instead. The discussion about switching the default on Arm from mask to
>> offset that is not even selectable on Arm needs to wait for the new release cycle.
> 
> I'm not convinced of that. If you need offset by default, why not enable it by
> default (right now, and potentially even as a backport if there's any bug that
> is being fixed)?
As said before, we also need offset when using just PDX grouping and no compression.

~Michal


