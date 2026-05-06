Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK7uCCbo+mlIUAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:05:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4D4D6F87
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:05:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301193.1575501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWIh-0000GG-9P; Wed, 06 May 2026 07:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301193.1575501; Wed, 06 May 2026 07:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWIh-0000EV-5L; Wed, 06 May 2026 07:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1301193;
 Wed, 06 May 2026 07:04:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKWIe-0000EB-Pj
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:04:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKWIc-0063sG-Kc
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:04:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fae7df-bab6-0a2a0a5309dd-0a2a4503e474-20
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:04:03 +0200
Received: from [52.101.193.33]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fae7e1-672d-0a2a45030019-3465c12148ea-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:04:03 +0200
Received: from PH0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:510:5::10)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 07:01:48 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::e0) by PH0PR07CA0005.outlook.office365.com
 (2603:10b6:510:5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Wed,
 6 May 2026 07:01:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 07:01:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 02:01:47 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 02:01:47 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 6 May 2026 02:01:45 -0500
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
 b=EYPNclZvw+imlcMxyqF8vyIsriVsIoqP3xRR9dYuNDh3yZ+6WTKzkuVqc2WEh+aGKf9LvcuJDCzZRnFyQrwFM1Iz4Vdu0hU4X8q5ViJU7qPNdU48hDG5jXkpf7OrrknYES1r0K8Xtc/v8z3NaD4CknE328WHkmFhRjLAZjaOatOgvCOWjXD2t8BlfZ+Q+JIul+z34NHLZjjPPm/5si99r0kYZVgTu7mpSwqF44DB2Li6KUCCCkZzhL8U5dH7ecFD/UsCKtJre8h/u2dDp8mIB/2KJnlUq/vsNjhg0niqpbWlbdJfiMplXvldYqsAqbVJ/BJgfVsNntWRSxsj10oD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg+lytjX2eC7vk4fU66yjnfexhWiq5rgVoT1c2N5wDg=;
 b=Uc0PjT9VMEBzNojtgSRiLM//64RnZodrJm/oaE6PmYDbefM/7qsbkpMNwjGsfCoNo9NiWi763OHds78a0g8gFfA5bkeyC6+Jjcw31gg0Ssmjxq7YVbbEYidfTq9gGyiEJa7QraQ3m0dp0E3gg0NUS/frzmVhWG1Es/5x0AxWgRN7gNAiEGL04jD73Y9TsHxLZOA3RFuQW0BlcJ2/NQdySxH/v5lfO6NT9ms6kzNXnSw+b9R7f8h9riPDRM2xzpncBxayd2CZlJPXvr3he1c7r7Su6XAzoPHbeUf4z247npXGITJiAJ6njOZzzIo0Rwu8VUR7YZOIgCFxg/BgJmKeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fg+lytjX2eC7vk4fU66yjnfexhWiq5rgVoT1c2N5wDg=;
 b=zojqloKswAjeR2nh53EBWtLKs2w5lrn6JJuduH+DcPB36l7A1Bpyqc2XfUYrpoKe9q2BSIOjpTZ7s8Xtq9PnHz2+nB2/xQnX299APs0PEdlQmK7md9uV2ch8ZviMXXLtQ2crtaGlF1t+g/kWodQ9vmAa+1S37WsE7dOQW+Zc/ZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c0e75870-2673-46b2-8ac2-2820fca8eb28@amd.com>
Date: Wed, 6 May 2026 09:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>,
	<xen-devel@lists.xenproject.org>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <661c18d9-eceb-4a4e-ac2e-37a6931e06b2@suse.com>
 <d7b30467-50ed-482c-9046-6a51d43bb514@amd.com>
 <8c5424c1-113a-4f5e-96bf-2613f28b8bac@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8c5424c1-113a-4f5e-96bf-2613f28b8bac@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e8820b-f4e9-491a-fbf6-08deab3d576a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AVFPWnsbekT875JBqNZkCZPNu25949j0nkYXSQX2hUUoabvLlGVVgJARGVWyxEfIfLlVCbYtpIVsz0Enu1k4FKx4fmncX1PyIYXhl0Ne4BNw8b+AK2WzLicQn8dQ5hBnU6hUowv9juyPL/41yqOo3M3tqtwnwYxtj/ADRwk7t+jPcVPbmpVJnpMNkl/MNqaEwesQogAquq5xoiCatdqMBs/I38VkhYwaUOj9oLVSj7vQHWsqEpQFK3FboDgoAflR8xtxMzL0Hwf0G2soGgVfeIMWFPkkMPp509VNHcFJfPzFSK6nPrgmVzUAzkMc5WRPbZOYlONFDSMroff5x5sqqY6Z9ourft3LsBL2fElGUaG05qljyr0W5YWlOxImwNfhkaZshRpvWJlJqKS1P6DUnnDbMCkCm/XeUGZ/OBC898PJQOagDPIzsjkeacNK/6ZYZYhD35h8FTgjkkuPd9f2hSFe2/IPW5SVK+Ima+1GCD62z9ftCb0wRBROB36+6KnzcSdusrTe9Sv2n/BbNwnyEYeGwAhI+Ua6QCrIdNEZbRhXXkp+8kepg1NSSW9OjPh4Uzqjw+GxNG9Con8OAuKWhXAXgtUBG3Z3Ix3qgC5U0R3h1LYT78Go97MywUs+OEVTcVxbpFM+w8mcFfSSZoXmiyUKvlvXYpKubtnY4iy357oXRlanlWV49NGiU305yQo3QXdFCRZRE02Kqh4waWMnq+x2QvXxy4Sr8qfmhfrlkUY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o0qT/yoEs3ABHz4tj8yem7OkVtr8v745S1GYmPIL4vWYhLCCWEdsaCFmAhPHOS73Q9ehJ67j0yq2A5DVMaaFoG7h5BNTAUFdjm/p5sleASq54MsplHhFXJkTODNMXZuX5kqgUJzCB69ogoRzIbf6oWLvtQqXcJhOQGQeGd6CulJMaphDubZmH9p+rAI34Ryc4CZLVqcWCZSk6ltOM1PcO4Yzt1c0eUNoTOzSgp/1l+XptDzZG27TwusDCmdQ0CA8vkbvgIz+1AVJzgYYl2BDX7LhRlsWHfKjzc7/PkQ1Mrco1lDZmpQvq+HKjxOxF7Mpv+8cyiwreVkcpFCJ1wFwQETPr84rETbt4MbMQP60Fl35XAzhh1OTRQrj4kdFmNhDc/1fX1hWchrNHD/exfXlicgdcer2C0vE9o8jN9wQUl9/8z9q62pkxkaGqL5JtMJN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:01:48.0559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e8820b-f4e9-491a-fbf6-08deab3d576a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740
X-purgate-ID: tlsNG-33051d/1778051043-2A567938-9167F4E0/0/0
X-purgate-type: clean
X-purgate-size: 2662
X-Rspamd-Queue-Id: AFE4D4D6F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[amd.com:server fail];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[amd.com:server fail];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SEM_FAIL(0.00)[192.237.175.120:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWELVE(0.00)[14];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]



On 05-May-26 18:11, Jan Beulich wrote:
> On 05.05.2026 16:52, Orzel, Michal wrote:
>>
>>
>> On 05-May-26 15:05, Jan Beulich wrote:
>>> On 30.04.2026 14:51, Michal Orzel wrote:
>>>> --- a/xen/include/xen/pdx.h
>>>> +++ b/xen/include/xen/pdx.h
>>>> @@ -132,8 +132,9 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn);
>>>>   */
>>>>  bool __mfn_valid(unsigned long mfn);
>>>>  
>>>> -#define page_to_pdx(pg)  ((pg) - frame_table)
>>>> -#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
>>>> +#define page_to_pdx(pg) \
>>>> +    ((unsigned long)((pg) - frame_table) + frametable_base_pdx)
>>>> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))
>>>
>>> If you alter these, ...
>>>
>>>>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>>>>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>>>
>>> ... how come these can remain unaltered? Maybe you have some special
>>> arrangements in Arm code, but surely in generic code transformations done
>>> should be uniform. After all
>>>
>>>     ASSERT(page_to_pdx(pg) == mfn_to_pdx(page_to_mfn(pg)));
>>>
>>> (and alike) ought to be universally true for valid inputs.
>> The invariant holds. There are two transformations on different
>> boundaries:
>>
>>   - PFN <-> PDX: the compression scheme — lives in mfn_to_pdx /
>>     pdx_to_mfn.
>>   - PDX <-> frame-table index: +/- frametable_base_pdx — lives in
>>     page_to_pdx / pdx_to_page (and Arm's page_to_mfn / mfn_to_page).
>>
>> On x86 the second is the identity (frametable_base_pdx == 0), so it's
>> invisible. On Arm it isn't, so it has to appear in the macros that
>> cross that boundary. Pushing it into mfn_to_pdx as well would mix the
>> two boundaries and double-apply on Arm (page_to_mfn already adds it).
> 
> That's yet more odd. These transformations should equally apply to
> MFN <-> page (i.e. frame table index) and MFN <-> PDX translations.
> PDX really is meant to be the frame table index, and at the same
> time (scaled by PAGE_SHIFT) the direct map index. Both (generally
> huge) tables equally benefit from whatever compression is in use,
> and hence also ought to equally benefit from that
> frametable_base_pdx-only sub-form of offset compression. The
> anomaly of shrinking only one of the two pretty clearly shouldn't
> be extended past Arm, and ideally would be addressed there at some
> point.
Fair enough. I'll drop this patch and update the second with a local change (as
in v1 but this time with a comment explaining why) not to extend this behavior
past Arm and we can try to make things generic next release.

~Michal


