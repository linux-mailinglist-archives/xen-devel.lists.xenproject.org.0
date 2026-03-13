Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOHzBUQvtGkEigAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 16:37:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDD286233
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 16:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253848.1549841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w14ZT-000629-Cg; Fri, 13 Mar 2026 15:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253848.1549841; Fri, 13 Mar 2026 15:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w14ZT-0005zV-9G; Fri, 13 Mar 2026 15:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1253848;
 Fri, 13 Mar 2026 15:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qi/i=BN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1w14ZS-0005zP-1S
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 15:37:02 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79071234-1ef2-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 16:36:59 +0100 (CET)
Received: from DS7PR05CA0078.namprd05.prod.outlook.com (2603:10b6:8:57::24) by
 CH1PR12MB9718.namprd12.prod.outlook.com (2603:10b6:610:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 15:36:52 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::bd) by DS7PR05CA0078.outlook.office365.com
 (2603:10b6:8:57::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 15:36:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 15:36:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 10:36:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 08:36:50 -0700
Received: from [172.31.96.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Mar 2026 10:36:49 -0500
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
X-Inumbo-ID: 79071234-1ef2-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDKVeuAfwihw/uOaeZtvDlB56BoFnf9jRI4HnSFbsjEJ24WCKaiSM0CenB6hQWxagCknqR/ywDN7rxY10gW505yUOyOZXmYCvUGedZlfGHmrGUbHinJRYbBuVS0mO753tgJxXDEwuSWUnwmdFIZO0VQVf5ffod2QoJHNTMRnAZvYXYaBXxRHjYxmPkPWy+1cvdinkcz2ql+5vVqZG56DwfNJzBzFCr7i8rqFx5EH4fOjIhdIYV5tWrC7fZwPTCS50nyE4uTFu3iNyhZ3KX1pxCuoVhyQO3dXoAUU623aQFD5R6Z5LpfiA9oaj+6dG556+Xbzp2HLNQ6qGnsjOf3qRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnCtm0yzjBseWVLNICpKiuO4CjGyHKEWrxJhQw43Ny8=;
 b=SfETW9KLZVqwM88S9MHc5mxFZrAt96KrGEWT7p2uvoBO+4wXzyZPkxbAivGObRkNXIIH86RuFcmR1HBw9dCUsTUky1D2qLA1695BACSHwK50kNNRKQX48d+Rc0NCMbtW+RsBO2ZE4koZH3yctg7ypwhVJ7yPgYjKStup/JM5EZY7g0I7JrIKthJe9uT6rQsCzk3uTssfnGcFQ9+a9NQ8t1rAGvnIWX9d2/Uuea84d+PHG4n1V7mTabV/b2A9BymcCGCO4QkR/Z/A+1sywPnXliiY99ADwMZtm9jwo0AKFn7Va9dpTPGdRcEgCRz+GAn4v3jFk7gXcLdjujx87/s/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnCtm0yzjBseWVLNICpKiuO4CjGyHKEWrxJhQw43Ny8=;
 b=yavLp5nCpL3xoYcIO2FScReEPua3wDvn+EstUmba8hM22KYHN5ZtX3+1plQOwc/l5R2qsccxsFjzlNNZoEcYkVEechbcko9LM8j9OOJjlLE0CvbPB/HTDoYg+lPnORRYhr/qgQBPntCfRi7v5QHwm/DRRjm+iUQEE9etSA0NDw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0552a259-16ee-4b87-834f-def9cadaca1b@amd.com>
Date: Fri, 13 Mar 2026 11:36:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvc/xen: Check console connection flag
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jiri Slaby
	<jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20260312173845.47235-1-jason.andryuk@amd.com>
 <8e5974b1-da6d-4718-9140-1f943cdd2404@kernel.org>
 <ff1cce61-abb4-463d-adce-0e5fc0a326df@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ff1cce61-abb4-463d-adce-0e5fc0a326df@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|CH1PR12MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fca0ed-e9b1-4812-9aa0-08de81165936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	79occZ3Y9ko3ZJ8eeFxzhz73g+Q/h0JrJ10HQCkC+FJIBve88L72RnZ3J2BXPxIDuqmhnefDDpbyepszyI7ubqj9B0LazhfcX7buwaYrFmvAy2Tx0F1RTdfcA4DTvrkUdabuDX4m74OJkgzKd8k39G6wZxSCNzJU5x5/ZUkZxXPLnqZlHv9Yi6Nhz18PW3SiOsuUpz1KhKp33hyiQKiPAYkqJNyUc/MdHkclM0OajfJkpc1FCG4PZi7FdiuCNdGLDO/TTDmzEtJPlmUfyjI/2X+WFybURmCVT1+Bl15aaQMbwhQ7ka3gnzWqjP5WkBqMNzOBpRUHSS2DFkV6lK9AwcZYnwq70r/OrE83cA1KZqK0PCAxaGfG/Ia1AZTHCICrIdIjyb0dGgbgvpf0h90o19IEsYYgINcQPq9tyD94IF7q/v9Zj3u6K0+V7gSUeWHRDNXFvU02YQXpr/UnT/QRf2dIpglmWghGKsnf37Nh8UlsnitrBPcncGG70b5bLCVQfiyxrBqwjx91f1fsm392FyShTWcKEChmw/jnny3sNoEteOvpn0kcH5wgYxw3/r8uZbSElwQTaCHhFJijxw/wYyIjpkGv1ztYfi+VcJDaNEGGXf9f3IJB+4ac618ZXoN2e/l1wHMTVxaVMdD7BHRs5PgK7X5jG20oYAvNJxnd0Qld+TyQWWcHXrdVDgIzD0K3RZFKSFU9oV0vjG7M/aaVhZhLk0SyVRE3ND1Whmjbg8ILvccJr+2tl4FZnvjp6SiZfRHf3YArBugF/MgjBldXmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cStaS04QRskcp2qCnjBqvqiQxCvNWJpfc650XJqlTRqrMpDTt0KBWlI2Fjq6YtdNqNkZqhQLilKP2Ge8AhYQ3qGlHuLOlm0WytxXMPlbT/a7PDC/sZLU48jukTtFfe8tzJSJOyTquxTwS9UBBlhxH3xVtrpcEgKt7g/Kj/HqEPZoit3UZiq53jphXcboSzMD7RZ8fpLnj4JMSbS4k0FHJQMnRKArSUCPbBO6hF/beX9uN/+lMu2tKFd+2/QMLWkPRxroy2ysm/2azLZDPWqINvBVN8b8mLbCRHS1pZzLXLANPQKDcrMWA2rtPi3o6UD5PrVJfoclutT3Mxb0ewcbRXSbye2vYsliT1BkhtgQ3L/wJHzEDxWCHHKH6fN5ZZwZ9ssb/Rorj54p8Xgo0QgPhhXI3Tezlzc024qyIcTMjj+AyB5Sw5U2hB2VyD0djCya
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:36:51.8471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fca0ed-e9b1-4812-9aa0-08de81165936
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9718
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jirislaby@kernel.org,m:gregkh@linuxfoundation.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 6CFDD286233
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 06:44, Andrew Cooper wrote:
> On 13/03/2026 8:33 am, Jiri Slaby wrote:
>> On 12. 03. 26, 18:38, Jason Andryuk wrote:
>>> --- a/include/xen/interface/io/console.h
>>> +++ b/include/xen/interface/io/console.h
>>> @@ -19,6 +19,19 @@ struct xencons_interface {
>>>        char out[2048];
>>>        XENCONS_RING_IDX in_cons, in_prod;
>>>        XENCONS_RING_IDX out_cons, out_prod;
>>> +/*
>>> + * Flag values signaling from backend to frontend whether the
>>> console is
>>> + * connected.  i.e. Whether it will be serviced and emptied.
>>> + *
>>> + * The flag starts as disconnected.
>>> + */
>>> +#define XENCONSOLE_DISCONNECTED 1
>>> +/*
>>> + * The flag is set to connected when the backend connects and the
>>> console
>>> + * will be serviced.
>>> + */
>>> +#define XENCONSOLE_CONNECTED    0
>>
>> This all should be an enum. And you can document it using kernel-doc
>> properly then.
>>
>>> +    uint8_t connection;
>>
>> And type check as well.
> 
> This is a non-Linux header file being re-sync'd with it's original source.
> 
> It describes an ABI between VMs, where things like enum are forbidden.

Yes, it is as Andrew wrote.  I included "Update the console.h header to 
bring in the new field." in the commit message to try in indicate that. 
"Sync console.h from the xen repo to bring in the new field." would 
better explain its origin.

I only brought in the needed part.  There is an emacs variable block 
that is not synced for other headers.  There is also an ifdef block for
XEN_WANT_FLEX_CONSOLE_RING that isn't used by linux, which I did not sync.

Thanks,
Jason

