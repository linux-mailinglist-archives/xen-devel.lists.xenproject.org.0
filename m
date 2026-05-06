Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPw6NKgH+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:19:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFC4D8812
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301373.1575654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYOs-0001zd-OA; Wed, 06 May 2026 09:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301373.1575654; Wed, 06 May 2026 09:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYOs-0001xY-LJ; Wed, 06 May 2026 09:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1301373;
 Wed, 06 May 2026 09:18:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKYOr-0001xS-6R
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:18:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYOq-0092IZ-JA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:18:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb0764-e002-0a2a0a5209dd-0a2a4501cef8-24
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:18:36 +0200
Received: from [52.101.193.29]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb076a-c1f2-0a2a45010019-3465c11d3001-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:18:36 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6973.namprd03.prod.outlook.com (2603:10b6:8:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 09:18:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:18:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E938ZEDWFutBd+v32GoaVl9LVIeXWeELFU8f+sBpihMvmAkPKlF1HoquFYX/YI3ooYhTY4DIEqwWha0BLDWfXboMbbFkMHydwYQqLoxorZxKfWQKPwKtTL4c8YfBz6Kgq0H9erloFTcYn/1oHSWAzkRG8YaFX2bmzmBPqgNth7cHDgp4glwvzdQo+Gw0BY43LiLU9U81EZNISV44m7mvlsARynCtNPIcBLOUj0v21jLd8PSIq8m/b6YcKSXhlvmwKEC9voKnqweEtovHEqB02d8AmjQcK6+RefVyFrFEmyEqMnzENIeFNDZwNqi4O6yFYIstgIxzhU1/SspFRVfvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjddc3C6Zs52T1Ii450LLJa4UjD2WfvP/0xGaw6mFjU=;
 b=x7FlQUgZCJlDzh8zGjKX4kiG5P+tY5po+2v+eP5kZeMaPtfHfMP8S+r6pBoufrzFu/emhyhedLDetJL/bW0ZfyA2at8XMc93zbeY62qaODR0pkJTL32pdqylHwBZKUYOA8Azdxhc3DNI4ZbsMs70Z9IrIge4EMggEQmhH98IL+EHWvdPTJmgApmC4teUUW8fYaY268pQetkZYfn4SS7eo8F4Tr29+l9ThdfPh8F1d6gYQrKyxgnKto78yWKMzFwbnQhP2GTCL6WNQVrB25Bqd6xNIPUUHeogD6Z6t7hvl6Bj/Q1p7wrW3c4V9/tPiF2ZKnCj5Ifq2/iuXjTSLN0Z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjddc3C6Zs52T1Ii450LLJa4UjD2WfvP/0xGaw6mFjU=;
 b=D5PgpbnFI3ngVO9Yd9PUnDHKIn3KF5ZRJnO2NAA3K1Fv2NZtku+wAodim5ZqFZgEnbkrbNOq4tCObkIDWgGYubwj78oBqWOy2i+AhoGnysTtQLeS7EyBnRB/XCNMcDFAkLF36oEYzf0LhpQq7PtQCjj9Qp1HwjoqrWfllypOYmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 11:18:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problem with PCI-passthrough to PV guest
Message-ID: <afsHZMH1oVpds-wg@macbook.local>
References: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
 <afo7NyXOEsDsVB6i@macbook.local>
 <4ca0f24d-2526-4e49-a4e0-f8497aa8f4b0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ca0f24d-2526-4e49-a4e0-f8497aa8f4b0@suse.com>
X-ClientProxiedBy: MA3P292CA0057.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e807831-93ba-4645-9ce4-08deab50711e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RQOg2BTLvOqsddLX5gvgIKmVJaSrCYg3k0QLZ7SP0m+JCA7+7X5VcMQewhQM2CsvaZuhYrBNfj/czSAouyQD7/Tnn1w/aHlPeLsLLhkoXW89Wi9Fyj7ixsQ/wmUl4gVux/3DdzQeDjZXw5igqMvHkawDs03wEQyNSxsTrJCIoNZEXLhXO6eDQLU0L3qPsBOoVervLoKXqioQmBC5MhTJGdiucspokAfDr0c7f1YRwB6V1nCN2TIqJwqdgh49tf+riHMwBZAihuagIxGxDEXZdLugpcZKhLqH80E2sIW+PxePCf4zsJoyYT/N2wsXotWZqw8LaxTPDDem+OSdUTupcRAJdF5q+k/RaUlNDhpWGpKejQ7P+bIqSHHdBxxGU5c8KSLw8C2k5exojH2YPpTSe0B08l4+9qI1q/O28NsTn0gu60h8nTMT6vT5lZMfRDAZALbYbXrDEKaylip39gbdotzVZiYnOHBU/YTh/+4yg/MtQfwWtzvu/d7PCJL0lkCsKcb7TsYMhAQFCypLj42iXbUrMeGfFfehvO3Pl21mJXaYFy+xgI2lA43XfnavAilzxeH3k7scLoDr8JGpUd0AmJa9eawt8uUZC0XMRXa+QS0sZ/VEJOrYuedVMrN5Yib0hfLloSOx8m/GOEDNaztSSiG2ocoSIo1MariIS0xu/DPQk0a1nU7O1gzMATcbQTqS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHhuR2VlMGU4Um9GbkM2Rnk5VmZRazE1emgxZUJXZngxZUM1eFdCakJYK0lv?=
 =?utf-8?B?OHplZk0xM24zU0EyTVR6a05MT1FIZmpHeVdhN2J4Z2UrYnVNeHZnZGhxMmhB?=
 =?utf-8?B?dlN4WWIwNmpYZmduSWgrcHQ3Sm9vNXBUT3krNWI2dTA0T1V4YktCc3VkL0NB?=
 =?utf-8?B?ZlY5UnFWL3VHTXBCcldpdnF0WSsvdUplTGJTa1pKZng1ZEpXZVlZblRZOWZC?=
 =?utf-8?B?N1JJeVM3UmU3L3BmTWhFSUV6a0tacXpRU2RyZm5OY0NtM2x2Qm90MVJ1SnZy?=
 =?utf-8?B?b3czQ2FJRjV6NWw2VGhvdzl6MUJmVE1rZjNsWnRDa3pVRXdPYnBqYVFHbU92?=
 =?utf-8?B?Z1B5Y05BNER5K1JhNllURVpjYUVrRmY3Y2QxU2Y2K21rUXZmVlNPRmhVNko2?=
 =?utf-8?B?VzNxanM0ZGllZDNqY1h6Z01laVV6ZXVKdlV1NXlpelE0dXNlUWordndJVDho?=
 =?utf-8?B?UkFpL0ZWS2tkMlhKaWRxRFVqL1c4R2g5YXZKZkRqcVdTQVNEZXBiMDA3MGc2?=
 =?utf-8?B?cCtwamQwVmZCSVhBYzJId0M3eDZEUGptZlhVU1crMzNEY2tpejZ1aXErYWxn?=
 =?utf-8?B?V1lNdTJHVkZGQm1pbUVIRFJOa0JoL3huNW5NM2grRVdYOE5OVmNHcFdOU2pW?=
 =?utf-8?B?N3lxczIrRFN5Wk1OV0hNR0UwcWVOM1VONVJkL0l6UEw4RUtOQS9GWnk1bTFJ?=
 =?utf-8?B?VGR3TERmYS8yamFBR1N2aDNiTEZHU3ZCeVdUMGcrM3RJMXgyUUZEV3NOOXNN?=
 =?utf-8?B?NEFmdzhnTmdEczdJa1hQYzMzM2dYQjlvNTViSnVGZ1VqWEpjWkpUWng0a0Uy?=
 =?utf-8?B?YzNIbFF1OTVEbllJb1F2SzlkRTV1UVdtcTVGV0VlUWw3UWNWdXlUcEs3R3dk?=
 =?utf-8?B?dzhhUEIzN3RPR3dkZWNHSWVuUHVBSG9kVm9ybmhPRmliVzBablJSNlIwRDdY?=
 =?utf-8?B?amFwUzJsVWI0SGg1WjZqbHVwb3daVkZuV1NNNjc2K2lUK0hxNnJmQWxKWWFw?=
 =?utf-8?B?KzVYTkFzQllPeWxINHlvb1FUWmkrMWprcHNHblAyd3c0QXpiZmREcWlzWE9L?=
 =?utf-8?B?Z0JEcmNYTlJlS2EzcVV2a1lRK3RBbXdOMVlXWGZ1VkgwY3JwRlpMa0xZNEt6?=
 =?utf-8?B?b0J6eVUrcTZzWkdJWC9oejFzTmZsMkx2RzlxeUhkS0d5L045cmorSk9JU3Q5?=
 =?utf-8?B?SG52bThSZFl4RjA1QlFpdlZEQ2N2c2VTdHhJcGtDVmtPenJISFJ2dThIcFNm?=
 =?utf-8?B?OGMzdW5WV2dIYWNRMWRYQnFGTEtwNktyYWRiNmMwSXp6NVpwZzJ0ZXhxcGYw?=
 =?utf-8?B?dWhZSytIZlpacDBXOGJOQXNrZ2VnU0hQUnFxN3lpdXNMWFRJZmcyazkzNDEr?=
 =?utf-8?B?S2wzV0NwTXh0dUlkdW1GMFA3dmNjRTRneWxGRzJOa2lNZ3YzUDhPT1FLY1JL?=
 =?utf-8?B?SVgzUHFhMUJuUUxPa3VTRDNtL0RmYUxpVnJXUWgrVWpXdmo4QVVhOU1MVG5Q?=
 =?utf-8?B?UjRHZFFkanNwcGZOODI3U3IyTG9QajdCaWhKQ3RsZVlWbHJSazlqU0FVNkl1?=
 =?utf-8?B?a1RCU3ZmMklVaEFzKzdkRi95YUhMUDd3allGOWh5V2l3c29jKzJRYjM3VSs2?=
 =?utf-8?B?M2lScHQ5c3FHZUJydit6YkNBUFpCdVI2QUJ5Qm4ra0hFdzRqc214VVgwc1M4?=
 =?utf-8?B?eXByV0JINFYvZWNzZkFFT3pIaXM3NWplZG5HcUJBN1lZd0lpRlR5dm9oaXN4?=
 =?utf-8?B?NnZBS3Zmd3ZvSnhoTXRISWFweGhqdm9YM1NDSFl0YnJoMzhXWUZ0a0luSFlU?=
 =?utf-8?B?aWQ5UmdpU1RXdjlpMmxLVjhiSlI3a3hTeXlCcGpUQ2hyYmZpbm9oMm5OUlBt?=
 =?utf-8?B?QmVHWEVXMUhsQndhbGxKZkkrUTdyZENrZWxpem1EWjVRZUNSSkdJVmdndG9C?=
 =?utf-8?B?dzA4SHBtNnhOblVUcWJtaG9FdWpLZFhMVUJrcFFJaURyMG1nc0c5NzU3alNC?=
 =?utf-8?B?dDhkbnNRSjA2a1VJU3llK2g4aHcwcU5zQW53ZWFGV0UvdUpab0FKeStBbkN5?=
 =?utf-8?B?RWwwTHU5Z3hUMDhKbk1TcTllUXlFWi9zRTdhUU5KRm1oYmFyYi9Ga3NkR0dh?=
 =?utf-8?B?TjRObVRzMFc0bklwYmEzU3ZkemF6aDhZckhRd3lPWmw3WUxWbitkMHF3cElp?=
 =?utf-8?B?Z0IwNVlRYVorN0RZcmFZQU5FSzRmRDNVdHVjdEJLQ3Z4Y2VCQk11bG9RVnE5?=
 =?utf-8?B?alBKR1o3NXY5Si9aMEJmaVRQQm0vRXUxUVlEWmwxSXBwOGNYWWVpQnlZL3lu?=
 =?utf-8?B?dC9BcEVoaXMzcysrSjNwQ0V6dUo2RG1BdUtMajZsQzNkSUF0dmNBUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e807831-93ba-4645-9ce4-08deab50711e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:18:31.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8MncJc2urXLgo65gPXJrW43LoGig7YA46zunOqXyKBR02XdF2F9cmU+ETxSIyQzwOB6uCwQaUs/qB+lDxMb7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6973
X-purgate-ID: tlsNG-d62444/1778059116-AD947FF4-F7DDA113/0/0
X-purgate-type: clean
X-purgate-size: 987
X-Rspamd-Queue-Id: 39DFC4D8812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 10:45:49AM +0200, Jürgen Groß wrote:
> On 05.05.26 20:47, Roger Pau Monné wrote:
> > On Tue, May 05, 2026 at 05:53:31PM +0200, Jürgen Groß wrote:
> > > SUSE QA is seeing a problem with PCI-passthrough of a SR-IOV to a PV guest
> > > running a 6.4 based kernel, but I can reproduce the problem with upstream
> > > kernel, too.
> 
> Uh, seems my tested kernel was only "nearly upstream" (it was an early
> 7.0 kernel). It was missing commit 0949c646d646, which makes the difference.
> 
> So for now this issue will only show up for cases where a PV-guest is
> setup for PCI passthrough and it gets memory hotplugged before the PCI
> device is added to it.

Hm, yes, this is yet more fallout from the unpopulated-alloc changes.
For PV guests that have the e820 host available we could try to create
the hotplug regions over what are host RAM region in the memory map,
as then we know we won't be overlapping with MMIO areas.

Thanks, Roger.

