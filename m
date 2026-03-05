Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLzlCSZZqWkh5wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:21:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659720F9D9
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246415.1545606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5oz-0000vS-Kk; Thu, 05 Mar 2026 10:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246415.1545606; Thu, 05 Mar 2026 10:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5oz-0000tu-HC; Thu, 05 Mar 2026 10:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1246415;
 Thu, 05 Mar 2026 10:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy5ox-0000to-O8
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 10:20:43 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f657f35a-187c-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 11:20:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB4979.namprd03.prod.outlook.com (2603:10b6:408:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:20:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:20:38 +0000
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
X-Inumbo-ID: f657f35a-187c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUNes5knhiUinrJgSmL2Z6XhQ+i2C/e+mt0gphyLoii3wIwIoMAEZrLl8Uxkip2DqXCReb6kNkJ0fE7l78+1Xdm8w4cCVtCIQyMb9NZgjgOks/JEAt8Cxc1Tp0GwlaL58eZPQP6jbzMlmiDB1V+nxbEEBrXatwHLiO8GvU2lmvEzLpRftWKxM2h1pMFQa0LuQuJxNxnCf+3Nr9ZmitKoADoivgz5CTaXPOkxsakjGRAl2RFuMBtcHFrjh7GLiR67q9VaQ/pJJV4VW10a2NBAGSfHLJ5dZz8kvPrDTnXY4K7rc0ztzJh/fLrMm1UDQb9C3XEiqKNkR3Gc1A2AVAtuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RJYvuNY00CmLT6r8wK/D8hHjvTR3SciKVM+OrZZ6UI=;
 b=iWmeUhMCAB2yPyKdE8m4Gr7H0baYycxl1EB7SmmKhDJ9HUVA//ObPVVB9aNrNRj/iSlUs0UNzX34tb5PGBIMUtJ0wPo+xIeb2Mdy4IQtDeuTVarrWuWu5HtgyZ+x9eURBLaP9RyDOjwEw6UaKZIgWLtZz4bPaaKGA54+4/aB2CrMSO2jrh7Xvdg4tBnFR2bd6ltK+WITHSrDcnV7EelPzD7h3oNS9h5DoYSIBOhjzCforxFoF58d8tPRIWGl9EDumWkD6e2h9wVaBfVn/5CgJcXhxLT0Xw7mpvdQsvGMIuixRDShRtYAC7jBDPxBDRIlvksmLEt9cjNPAYvCjAaPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RJYvuNY00CmLT6r8wK/D8hHjvTR3SciKVM+OrZZ6UI=;
 b=boY9qpJ4tNJDdpzEG/Tr2cBrM46UafOw+Ko5TP9nmD9/ZdORPSNmWS8X+5Un4dR3C0AG3ZuO9MBCXkAm6qZionQV9sZbfDe/I47zd6cWennnnlgOvZW4jgQVs5vDxgZLIM9XmMmob5sqSdYZf3FdjjJI4w6x89P8/mmPAdPlaSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 11:20:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aalY8t_2F0Pt5i3j@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
 <2c3fdfb6-5788-4177-a264-56719e1ae804@suse.com>
 <aalLc4tN5ywM3c_W@macbook.local>
 <bb06fac8-43e7-4d9b-81b6-970066b8bb73@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb06fac8-43e7-4d9b-81b6-970066b8bb73@suse.com>
X-ClientProxiedBy: MR1P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 6196aa5e-6b2e-423a-e6c0-08de7aa0d8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	QmTejN0EZvpzt4x/LFFrQaahJV5D/ntGN8l7OuJP9ImNhoJRWgnbVGcEOK3Laj0RT5RCLEEIPw+u80vRFlndTESTE48OrSE8bVoUhDLjIZYZQrCeUPBddsf1n/p5qqNuOVPzMuxgzWi6r3n59nYgttasGk1Fm3wv5cv7qBW//h4YyT7h6DwCCsIXzr+YjIX+kQkW4TeS86ZwuZzNkViHLGeCmjhXKL41I9vbD+7SFlIJ9MvuCUQsXWpB2BowNxcqqOGN13gJPaSzy2gvbyC6p2uGo6E5D850r7kqVZfi/4LCtSGKUPARZ+6M4CVzV53Nvj78tL0zFsqzJbYJGaHM8aknw0hkRphxFOy8Iw9NwHvkZFtnv1mt5kM5YCt3gNZNq0Pk5ax1KbxUq1xZIhw7ZisibulPNBD6m9jqVGkvrpctOsdGS3KX5JRZs/oM1ZGZHFtHhJDxM1jV1XaJkeaTOEvC8wPhamN0RPtNy0cWg9hVK1SPwuxn8acRrZOB2cYtqFgbl0TtmCCq6+8iLz5B+JRqoyxx3XQzwItGB9GJa1kKxiNXzLWK3CX6j/N20j0g3ownH3juZIfG0XgEJJZN6ni5SesiJYkNa+zNbcI8eeEWI3mNVC2JxeMp55/eL9JCrnRld0Mw2anomKbJCxN8NjtHfnOyHwCF2E4FJtYQnBwb2Y6eK4PixiDxalvq00tgpR8or+2m9zdPxxrcuJXpJAhRBEz+lEjQXp8Ei7RJtZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVUaHRxaGpPVkZRNzA2QVgwcmNVODFBWkRDK21vYzZHdUlKbG12dTNkYTlR?=
 =?utf-8?B?eVhzVEtZbFFEeDVJK3lkZUZqT05XbmpKSGh3ckx3Tkkzd2N0ak9CRkFsTFdm?=
 =?utf-8?B?RWpkeU1YUnN0TlB3TDhFaHZCbkY5MWx2OEpQNmpxMDZQWEY2RncvdmpUZVor?=
 =?utf-8?B?Y3FhdjlZUmI3Z0VnNk1HN3pPQkY3YjJnSDlEYUhJME1lNFR3SHp1ZmRyRFNq?=
 =?utf-8?B?THVGOFIrM2Q0MjQrR3F4elZkVkYzM2ZKZCtYZVJJQnFURjZFUGlrTFNDTU9m?=
 =?utf-8?B?eDhydElXQXFwYk9wRkdZWE9PY0VLK2UwZ05CVG81VTZncEM5L2NNWTFabWlH?=
 =?utf-8?B?Uk11bkRvTWI1aUxya2VGb3NMeVRzTTRZTDc2aURnNkRiYTZUa0ozSW5XMVh5?=
 =?utf-8?B?YWppV296WEJzaU00Yko3TXFwcTZMSXlIcEZuWUxkSEhqbnYwUncwdlQ4VkRY?=
 =?utf-8?B?a3FzRm5URjNoRisxUHJHWEVPbGNzems1YW8yZUFHSWNweFQ1UHJiT2w0ZS9W?=
 =?utf-8?B?dDlRNWFuZUFHbEpOeVZBRy9UYzVnY2dNNDF5WGN4VmxNMi85Z2laa1l2cE5Q?=
 =?utf-8?B?ZnhyRk5wNlFTTHNVbkkwcCtoL0pLN1AyRTJHR0g5SFJPME53M21lYnFHZzBh?=
 =?utf-8?B?ZmpoMTVLand3NExVTWZqK1ZpZFI0Yk9SdFM3amZrVGpxWndmMTYzQWxJRDQw?=
 =?utf-8?B?clBJTjBzM1dDTXZaMjh2Wk9ScEM3WnQxL2N2MTFxSWhFdnVNd1NuZ0huMXN3?=
 =?utf-8?B?eitQYmYvVVovT3RlT1BETVpCZ3Jud0ZyTkNrNlBXNWJNTC8xdEFqenEyazMy?=
 =?utf-8?B?cEdVRWRtTG56VXdQa29QejZVb0RRRUNRWlZnRUdnTllIc2Y0eGhFQjNVeTVU?=
 =?utf-8?B?Q29YMzB5YWdnTGFoR3k2K0YwTjFKOWVLRlY2eHJlZjVyODd6dDJNUnA4YVI4?=
 =?utf-8?B?RVFnclNrT245VVpCYWR1eHJaVFBqZjdnL3lSQmYzNEgrMUtFUVhRTHM4NThN?=
 =?utf-8?B?NXJBcmFBOEUwQ0dIc0JQZzhUbWpXcWRFMFAyQXdFWm5sSm9UNmd5VGE3SWFJ?=
 =?utf-8?B?S0w0bzdnbmNscmJpSVpiRlFBb1hLTm5ISW1ibkRSSXRMQlNFcWpJclo2K0R5?=
 =?utf-8?B?Y0VlZytBV2UycGRaNFA1R3VqeXNVMFhKRS9UdTZKY3FPMi9XMVd6dXBOdTZL?=
 =?utf-8?B?Q1JlNkxqUzNCcE9xL3pIbTVyRFpzcEFCcEFaZG5LcmNjVEdWUnAxak9ES0pk?=
 =?utf-8?B?Mk5aMGc4MzdqM3Qwb2M4NTlicWhManpRbXlQQ3lXQVlaT0FRWTdSVzNSZFoz?=
 =?utf-8?B?blg4dUNPQ1hCckdRSmRScUM4UDhCTzRiRytMeFVXNmg2ZWkrYlZXbGdIbzk0?=
 =?utf-8?B?MElRRk9iTC85ekNzUld2NXR5MmxramcwcWNpV053QVhnY3JaRU9ITFZiTzVJ?=
 =?utf-8?B?bWI3Z0JIenZjc1dZSk1WQkIwRTc5ay93RFM2S0pybDJXMmhJc2RkSU0wbXBC?=
 =?utf-8?B?cXpEeWNnelhtanJzUlRjME1ZbDFsODhqSktrSWRzSFg3NnpKU2xGN2lIME9M?=
 =?utf-8?B?Q05uSllsdU1BMk9mSEMrR09ndTNsZndCUy81UUc0Z0FtdmZxYm5ZOUtWZjYy?=
 =?utf-8?B?QnF6U2w2UFltSEdoNTZUeXhUWXp2U1g3S3hkMnp0Zy8xRENiMWVmanRzVThn?=
 =?utf-8?B?cW8zL0VIMFYxbDltUngyQVhSNFhiYXI5ZGhIQ2lGOURJWlVZTVpVejFTQ1Q5?=
 =?utf-8?B?NmQ2RHU4Y1FRL1VFRmVUTW90dmcvdnh0YkZGalNUdlBDZlVqa2o5MUN6NlRZ?=
 =?utf-8?B?SFNmR2ZNb0c2bEZZalVaZnNKMFVzUTd2alJZZEVxV0ZvVHBrNHZXMmFBRk1x?=
 =?utf-8?B?cU5hMjI2TXROZlk5eE82c0doeVFVdkx6MG5QeTcrUnFlbU9DYmJFZ1g1ejM3?=
 =?utf-8?B?VDdlSk9kQTR4TU8rYkN4eXdvOUdTREZZM0Z4ZXpWWk91K0hKYTBtVGlwUTFt?=
 =?utf-8?B?Mm5CZDJyTzE2N0pvOUFDUUJSbHIzclliYXBGNG9FN3N0TW4xOVRVSHVuSDFD?=
 =?utf-8?B?RDJVN0NhUWlESUFvYnVWK3QreVFZSDc4bWdHL3RLMnAxRy9iWDZrK1BOM2R4?=
 =?utf-8?B?bXVOYis5RlNubkZnL255TFRwZUV1YktSTzF0ZnlyeHBrOWI5R3d2V1huNlN2?=
 =?utf-8?B?b3NBZmYyWnQ1YlkrWDhxb21yQy9STlk2UEJOaEVnMlJ0N0FEaEVEK3QxeDRE?=
 =?utf-8?B?TDU1YURLMDYzaFhHRHVqT3h6NkVZaVZYanlRTVppZFR4RnZMVUFmQXN6MEc1?=
 =?utf-8?B?MUFKWTMzaFg2WWZZYjdPTXJ6dlo5dUFpa0ZDYnFLOTk2MXlBNy9Tdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6196aa5e-6b2e-423a-e6c0-08de7aa0d8b3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:20:38.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFIwK7bSSCIAO2HjS/M4kzbhyDBzay9cnz+qyLz8CS6YlF/y4BmGojPJW5BGzuJtG4GpLFwDsm6IXYHrlky1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4979
X-Rspamd-Queue-Id: 8659720F9D9
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:45:29AM +0100, Jan Beulich wrote:
> On 05.03.2026 10:22, Roger Pau Monné wrote:
> > On Thu, Mar 05, 2026 at 10:00:13AM +0100, Jan Beulich wrote:
> >> On 04.03.2026 16:06, Roger Pau Monné wrote:
> >>> On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
> >>>> When Dom0 informs us about MMCFG usability, this may change whether
> >>>> extended capabilities are available (accessible) for devices. Zap what
> >>>> might be on record, and re-initialize things.
> >>>>
> >>>> No synchronization is added for the case where devices may already be in
> >>>> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> >>>> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> >>>>
> >>>> vpci_cleanup_capabilities() also shouldn't have used
> >>>> pci_find_ext_capability(), as already when the function was introduced
> >>>> extended config space may not have been (properly) accessible anymore,
> >>>> no matter whether it was during init. Extended capability cleanup hooks
> >>>> need to cope with being called when the respective capability doesn't
> >>>> exist (and hence the corresponding ->init() hook was never called).
> >>>>
> >>>> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> vpci_reinit_ext_capabilities()'es return value is checked only to log an
> >>>> error; it doesn't feel quite right to fail the hypercall because of this.
> >>>> Roger brought up the idea of de-assigning the device in such a case, but
> >>>> if a driver doesn't use extended capabilities the device would likely
> >>>> continue to work fine, for Dom0 this probably wouldn't be quite right
> >>>> anyway, and it's also unclear whether calling deassign_device() could be
> >>>> done from this context. Something like what pci_check_disable_device()
> >>>> does may be an option, if we really think we need to "break" the device.
> >>>
> >>> We may want to add a note there, stating that we have considered all
> >>> possible options, and hiding the capability and hoping the owner
> >>> domain would continue to work as expected seems the less bad of all of
> >>> them?
> >>
> >> While adding that note it occurred to me that in order to keep the device
> >> as functioning as possible, in the re-init case vpci_init_capabilities()
> >> might better not bail upon encountering a failure, but accumulate the
> >> error while continuing its loop in a best-effort manner. Thoughts? (One
> >> of the two return-s is already guarded by !is_hardware_domain(), so that
> >> could be left alone for the immediate purpose.)
> > 
> > Right, yes, that would be preferable.  We already print a message for
> > the failed to init capabilities, so there's no need to print another
> > one in the caller.
> 
> Hmm, that's another aspect I didn't consider. Yes, the log message in the
> caller is redundant with the present code structure. If we expect that to
> remain like that, I can drop logging anything from
> physdev_check_pci_extcfg(). Which then re-raises the question whether
> vpci_reinit_ext_capabilities() might better return void. At which point
> the comment I put in physdev_check_pci_extcfg() (upon your request) would
> want to move there.
> 
> But my earlier question went in a different direction, and you didn't
> comment on that at all.

Yes, I think we should accumulate errors.  One device failing doesn't
mean the rest will also fail.  We should continue the loop.

Thanks, Roger.

