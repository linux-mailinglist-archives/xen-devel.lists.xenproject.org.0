Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sItaAMpAsWmtswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:15:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E38261EBF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250964.1548293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Gb9-0007qd-Ez; Wed, 11 Mar 2026 10:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250964.1548293; Wed, 11 Mar 2026 10:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Gb9-0007oU-C0; Wed, 11 Mar 2026 10:15:27 +0000
Received: by outflank-mailman (input) for mailman id 1250964;
 Wed, 11 Mar 2026 10:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uiKz=BL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w0Gb8-0007oO-JM
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 10:15:26 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3801633d-1d33-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 11:15:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS1PR03MB7967.namprd03.prod.outlook.com (2603:10b6:8:21a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 10:15:16 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:15:21 +0000
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
X-Inumbo-ID: 3801633d-1d33-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpmjAZFGQ8nh6BrKPd9Wx3zZgllAPTLXvxylTCl77PHD9diK/RnKH6eDIlhEtPMmWoD20Y2MvjBbfljIZKArmSTEYHrJpr95fVs8yFEepY4HPhtTUPNUCxPcnGYRwPWBoRVym7P/3N9BamfGB5/CY7t7lAFY5tXQOtoM/v/kkEuioID5Rf2uEPDol97ljc0ym7JjOgb7ORBChycWYmjVFOIfIZ8MU0cawoC/C22Xidh/Xg5P53CYGyS4xGQg/KM4dp1YX9dM8y4Isz+SBKLZiO6YJ73RZYzMGls4vZmJhspDEYi8OxQEkEndXwbRbge/rtL6EkBQq7y/brtwHUy8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLeHjcuf0axcx/3i4OcLup/yoCifknUICWtiIky+Nqk=;
 b=tAh2F7Cqpa+W7CZNOPZJ/HMDEaqCk9u5IcBX+ogogIdh3EsG1qVmP03xaHM7/rWpPmE/d55Jo1RWdJWkkhV36b4JexAxlPWeOlrEThXaCgf/5blPljm3WtCA/c5GVRl4a4DAiLHQEpGuhpSXrCpyRCor/Yd2EFAq/ypAD9I3ST8l3lXfblVJFHfhN5xlVkU9SKTjT9W1RvJclEpZDSgqkkVBRE/5T9HKIX93KtX+QVDjF0EPt+dG+U9cGLpCGz6yr1ubgmKAm5nZW7dI/MDN2Dtf1ITOtkKR11uAHfR/p6y8Xm7Q87MoSJ4jzuinAf9ai/m9fXpQLWrOJy+ucKi5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLeHjcuf0axcx/3i4OcLup/yoCifknUICWtiIky+Nqk=;
 b=Y98Swxy1Ci1d7hoVS43QpjVZjgN4HNmR4lKtHZ9j1HkVtiT6RiB0lc0zebOJt4Ya5huAKhDM3sLfynk1AJStrnGFRXoYfIHkaGcePjnj9OUcxfbC3FWWHf7WQXag1eC4f03OfUUN1xcrA3YbtLpl0sV0w7G/YiZsM6jypDZdwZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 Mar 2026 11:15:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/7] x86/msi: Define extended destination ID masks and
 IO-APIC RTE fields
Message-ID: <abFAtgmM_rEhn4zQ@macbook.local>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309123055.880050-2-julian.vetter@vates.tech>
X-ClientProxiedBy: MR1P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS1PR03MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3919a747-3908-462a-4603-08de7f571a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JZ/EJy3AJRSdieos00qLtMviMbWALaet+/uaaRAtAx741tQF8dJRPw4ZDx214Oj9smcOhUShArvdjneJNLiUxSLwUE64Q6q5klX4HrJ79arKGTXJU7uQFaJQh8GNNbktJH3MoMTm86LeA9SN2FM1nfsrUo3zxlzlQWsWq1mut0Biz+njwPZjpE+EHLKy4IG49Q/pbonJg69s2P2bYkqwXX/6ynBCBtBV/7k9pMCAXxRx5y897rpSZ873IVA0QYAcAMsO3um4JdKYoskcSeIpsYdk6OGM8pLO1bR6iC336H6Zgf8PsVJNpLfK4qMn2einRiuMcjf4ok3nml/oEF9zRgpVEZH1KGoryFocakFg8q973sR7wH/L9THeyxmIKJleaz8h2IZ2js8rvzlGUkDu8QCHvkJlyNVoOIve43HMVPASJWIPAzrMwkBhCLeyE6lfjlS8GxPuTTXzkT+jaPqY68dAeKVS4KmZui2fdKLT9HGyrxt8uLjcbkaQlkU3gb2kLWvkcCkLxeroBiWDquSBGLadjy79S2qsAsTJMLuo4WsTeghpWVenfWV5Z0RzA62JU9dDYgpqSEtVmR5pk9NlGUEB99dpOfRS0uDMEthz4cS8AGtFZ6Dt7gk7PIzYp+nmIbxFkS1l1+uW+fepyuzupadblpkLBxKNbvZPiNoclzTSGgzGWjvHkbMA68XBfAoTuhLDJTS7IZ3fQQlHKy5PpE69F6S32P1M2EzV3TDvi3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MERlemtJQVFUZFoyeFdpaG95OFozdm5hY0VqOVR1b2k4SEFhUTFQWEd1M3Bq?=
 =?utf-8?B?OEpsQkJIaUJFc1paMXppQ05nTm9FNUhvQjdxQ3g0eHRrc1dqMjF0V2ZCTkd3?=
 =?utf-8?B?amZrcVFXTlBmbThZaVJDOFJ0UmdpM3orU0hSbE94MkdtYXpWSjhSYmY4R2hn?=
 =?utf-8?B?YmdLUm5hUVB6cko3aW5xWlpzTGRhQ2hLazdkSWhrMnl5c0paUWI3TEg5NnAw?=
 =?utf-8?B?bkMwMjJ2bnBwZm1mNWg0UTdLU2hRR0ZaQmpaeUxJM29Jb0VyRytEWkd0dEdw?=
 =?utf-8?B?R0tsamF5OTJSelRGMUFSa2dBaUN3dEhnNGUxOHdFa3RMZWk1ZUR3cWUyNTB1?=
 =?utf-8?B?aUZLdE1jR1hxWkF6dHJYbnNPdnlFTGlkNkJyNXQ1WnpJdDJrZ0xiWmRxSUc4?=
 =?utf-8?B?T0YyZFV6WHJlaE9nRXRPUDRDK3p1QXpsaWJWK3hEUmJjK2ROTDAxWEpLTGFj?=
 =?utf-8?B?QVJHU2Z4TWhuZW43dUZYcXlEeGg0M05sTkdUcHBQd1hSNmM2QVd6cUQzcFAw?=
 =?utf-8?B?bFFrWmZtTHhYUmwvTFE4MVRtaENCcEc1WGxYcEwzN09XM3hVSnNoSTVoNHVh?=
 =?utf-8?B?N3E1bU1UeUlLY1JYcEN3dThnOThnRVVrbklZYy9DZWMzQ2ROUmw5dDV3UUFy?=
 =?utf-8?B?K3dUWHJHYjlvbGtXNEwxdURCNHNyOTNXeEppN0pzazRkOUNzb0JGZlhiYVVS?=
 =?utf-8?B?UXgxeTBOa0lMcEdOUTJpQVZOLyt5VmIzb3g0VER0NnF5Y1JKWjFQUFhTZmJX?=
 =?utf-8?B?eWdDa2tsNURyNnllaHk4alhqbTdlM2o4eTB5UGF3VGJnWjByUUFlT00zSk5E?=
 =?utf-8?B?dEI1ZWlmRWtkM1NCRGJhcmVqclNrV1dMMi9wcW9uaDJrZ1M4clhEMVd1ZXJu?=
 =?utf-8?B?d1FhejVVemNDVDR5R1pncEp4M1h3aTlUT09HLzBLZlVWcFJiSGpVbmxTOFJw?=
 =?utf-8?B?U3dOa3I5YU4zQU1oZExQdjkvT2pzM0lERnJNM2ZZbkg1R3JUWUNuOG4vQlVq?=
 =?utf-8?B?d2VrMmo1RHM2aExNTGpEb040cmxRcDB4R0pvUmp2TE0yeCtPdXc1a2Z2SzA0?=
 =?utf-8?B?QnZ0STJ2L3ZDV0NpcGZCdXduVk5mbnA5Yk51UkJuc3d1TFQ1ekZCbWRTbXJM?=
 =?utf-8?B?cHJsWVVsME9ZRlpzU1h0RWttbTV2ak5GeEEyVmViT29HelNKN09jOUdBbzFj?=
 =?utf-8?B?UE1odlAweExnWW9wRlFxTmtoSElQdmJneXNEOUxyVjlRZklqQklHYWt1czE3?=
 =?utf-8?B?V1lyT1N6OWdxb1RYT3pDWjZEZWg0Q0w5OVJ1cmZUVGkxV1krbjJCTXN5YnlD?=
 =?utf-8?B?RjNaRE96TDllZC9uUlVqNGFaRUo1cGJsRE00a3YvZDhiYmZpYU9DSzJVZTUv?=
 =?utf-8?B?MjdrallDN3JnclpUdUkxOGdEZHB6dWY2d3lJdnU5UFNldUdlbkcvL21RTnpy?=
 =?utf-8?B?OEZ5VmFvOG1zZUpHRlhqOU1vNWNkTGgzMzMyUjBjQ0ZKNXVJQ2s3V3phbzc3?=
 =?utf-8?B?VFNkdmJKLzJDbmV6TXBLKzhQL0R4eldEY3Qyc0FTT2NCUXRVbjlka1E1NGo5?=
 =?utf-8?B?Q0VRWDd3SmhzQVozem5XaFlrbHFJMmZ2eDhZUVIwU0x4ZytDOHhzbi9KbkhK?=
 =?utf-8?B?dTllV1FQTEt2ZkNaSVFLZTlhYnlTVndVbzRVQjNCS2NEU2dQc3RoVGpDSjZP?=
 =?utf-8?B?dHlRcXcrT0t3c3lUbmYwcWVFbjhRcmprdFRrL0JzOEtjemF0dFhoc1hybE9E?=
 =?utf-8?B?RVNpUXJwZUVScmpjM3R5am04U3ZVWldwUlBDbjZvNXlYTk5tVE9pOHV2RStD?=
 =?utf-8?B?NmdlcXl4aTg3bWV4NzRKZENCMHV3SkVYRTFFVnlCRExQelFGOHNHNDJtWjJu?=
 =?utf-8?B?UkFmSm5RSUR4dGFIdnU1eE5lU0dIZnFyRkkxWUVPazBzcTAvbmo5Mi9tZXdw?=
 =?utf-8?B?SkhUb29nVUxFdUhrbDBMV1ZwSUhJOU92VXRGN2grbHVNYVpjUUxWbkowcVUr?=
 =?utf-8?B?SW5ZdmdzaGdIQU5QNVdmNmZ6WktYemlyVlNZT0JmaWgyRnNyQUF2dTQ0NjRp?=
 =?utf-8?B?elhIQkpOdUpIR3EwRjNtNms4cmM4T250OGdLT0NSRkUrZlhVeElnTitZVGxK?=
 =?utf-8?B?SWtYOUVmSVhERGVaVmxsL3NOS3pVMDB5TndBcGU5QnE0NGZkdmlKNTFnQks0?=
 =?utf-8?B?d1ZFSEFzQlhZck9WdGdNQ2dLUDRNZnNXZTZUdkYrencwS2h0aVU2c2JIeVBR?=
 =?utf-8?B?T1h6eUR3M3B4Ly83Y1hxRmNhS2xrZDRiOHhYM1BMWnBrbzJkL1hhaTFiN1Ru?=
 =?utf-8?B?R05TV3piaWtCeWYzZmNyZ3Z0Y01KVjFTaTMvTXhJSldON3duVnRDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3919a747-3908-462a-4603-08de7f571a89
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 10:15:21.8450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y74oClRjEryLLRQIHfe4Mh/Eg+3C4xAfShQa3OQ1CymtQDLShIeZjKEhd+jIMxkz4ZWYGkjYAKwQMAK4n0kuLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7967
X-Rspamd-Queue-Id: 61E38261EBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:31:02PM +0000, Julian Vetter wrote:
> x2APIC guests with more than 128 vCPUs need destination IDs beyond the

I think this needs to be re-worded:

"HVM guests with APIC IDs greater than 254 would be unable to use
those IDs as the target of external interrupts due to the lack of
emulated IOMMU.  However there's an unofficial extension to the MSI
messages format that re-use some reserved bits to expand the
destination field from 8 to 15 bits."

Or similar.

> 8-bit range provided by the standard MSI address and IO-APIC RTE fields.
> The Intel spec allows bits 11:5 of the MSI address and bits 55:49 of the
> IO-APIC RTE to carry the high 7 bits of the destination ID when the
> platform advertises support, expanding the range to 15 bits total.

Hm, I'm really unsure the Intel spec allows for any of this.  This is
something that has been done on the side, re-using bits marked as
reserved in the spec.

Thanks, Roger.

