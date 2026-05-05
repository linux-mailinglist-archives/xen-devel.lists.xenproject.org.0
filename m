Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE6KIMT7+WmNFgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:16:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EF4CF395
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300720.1575224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGYu-0007af-JH; Tue, 05 May 2026 14:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300720.1575224; Tue, 05 May 2026 14:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGYu-0007Xq-Ft; Tue, 05 May 2026 14:15:48 +0000
Received: by outflank-mailman (input) for mailman id 1300720;
 Tue, 05 May 2026 14:15:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKGYt-0007Xk-FK
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:15:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKGYs-002U68-OX
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:15:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9fb82-5cb7-0a2a0a5109dd-0a2a4504cd3c-36
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:15:46 +0200
Received: from [40.93.194.3]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9fb8e-1dec-0a2a45040019-285dc20389a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:15:46 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7207.namprd03.prod.outlook.com (2603:10b6:806:2e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:15:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Tue, 5 May 2026
 14:15:35 +0000
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
 b=uwOsWRSa4Ko14Q7/4NMByV0GlQXKetg9zfwiKTImmb7GHNxkS4E1oWXGqKT/jRzuXG4BrVI7vbXmluPtvFi0NqnADgVDcZg6WgpAFKMCP2O9ZU4VoSmYQi13j00hwu6DC5rXZKtk+Cnmi/wWd7Q0bhApG16hYhvYB5/B07BtXwc+JTC1pDbbzIE4NtLsl0IS4uEAohEKQeo8EGM5gXKQVyCzkptnRMARjovtujBPBuv/rr7hRr7g4xT9dqVbaVCxTmNJPaB3Jm2wWOVpZ99DQytsjOPqMKzhA6tyRSq7VvIa9TKQt9u3bRI/y2a2viNlfLH+nhCuDyma66A+BAED9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vx7MD38twReAUfUoLhcvPlJ4BkO2wCvVzg1VXItAjz0=;
 b=GBqEL4+tP33x/H9pWlFEQZzTB1yfDFMjeuBlXrk/RHx36fn3ebN5FEgyD2BgZKj9iCYWBTin7yJgXg3A4FLE15dG80+jm4YQwYc7U4s7z9MR9sY3scUvmUQDZLx2yLp33UzEB4fjgSVFWnanwrF+PV5lhT9GQg00S78Dw7U8yjPt8mR3ubIbBbGFbMM1qem/CF2E7d4KufPks1dqhbBXFLrhuTnN4AZsBgzeKgfVXBeFcYAAvYkN6X3KsuFMLRFMfkoTI4UWhp4SlLHaqsbNDSmLUVbH0RjbQMbs0Yj4NBBxbQmd054DCnrFf+7XZL4oVHd14ThkaLNMPw0HtBjuog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx7MD38twReAUfUoLhcvPlJ4BkO2wCvVzg1VXItAjz0=;
 b=tMrB5Od1TQ6ph1zK/wNV/t990u14v3g7q08N47ArD0b/SySl/QbRBqIA5tSVimsYZxCmZ+WPdoLHlfxRcktLzNzBEUa7vK0nlMQxhNmGSQ0gGhCXhMG5CUw5KoJ5OQ1sR7NJfTbCmv389sekLSp7pavUoDqSbtdO1nt5ptx2Qus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 16:15:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alexey G <x1917x@gmail.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
Message-ID: <afn7hJB5qaEw4hDj@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <afBmWSFsyrwy_Ru1@macbook.local>
 <20260505150736.5419a55f@LinuxLaptop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505150736.5419a55f@LinuxLaptop>
X-ClientProxiedBy: BN9PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:408:fb::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 9214480b-20ce-4b32-58f6-08deaab0c682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TuwV9N6qpIqUbwhgYfDe4DJKDdAMojim0w8JLTi/EUUSF2ZsjkbSKQs79lGZjDBDA50keb5/8Ei3hAvmvVsL6/QFwwezmQnyHWgWErMNTqwzLDNs4mPq2QAibfMBrjjGJ80HtGVBT/hi5KoLdKXm47NTFr4e80PYtKX+GPLfuBWr4//PtjaG/6EuuwvwXmWitAmR+hmKbvmrf7C0pRzV5XLmfr5TsB0qlUR5/nGjtj1wM2QEXdHAeNj9e2dLIeI/bBBYbHCXZ2SBC9UqY26On2vRifOdd/HD8wJx1A1fr243Itcocdhu8OisquaBvAjZfAcG3V6KJQDeY817Vl+XPPkW2KNk9ghTmUgDm+6KKtZtHEWG7egcWLjP/iS/R+rfzgVzJDrTL5ZRDNRDpYdfNhtJcry940pQMqkfBxxtBZoGQF6eTCaOI6ob2PYpkSwLtESBm/CErh7wdLriuy2/ASbivAi06FNBNDAcrB3+MwDtlUQk2E4zKe5h+3FxGJimtXsNrNG0tencwUB9jsFn0PECN2aPN1Og5h9S2xWXoFGOQbA1QzakQfZCqSYX0U0VkKZd5TNVwG1SUKrAe35OtGP62LhdzE4dh3iustFxG6kFZWAa2ZmAyNKu/vllhW41OMNCdUlra97qcUxUWjGC8ssJl2mIeHMv/fV2Wkh5COjAkTdkQZDK1mEIRpXqjTlJFhCq9/pvreIfsSKA38uqmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU9Gd1JTNVFpSFJJbEpHcC9Fbzl4RnF5REdPc0FXK01XcUgwR1IwQ1ZvSVZS?=
 =?utf-8?B?VHlhcEVLZ3ZQNHNzSlRJYm1pbGk5TDY3U21GVFo4TmUzUTFmK0ZNaWF1MTB5?=
 =?utf-8?B?Z21ZWUlSejBDYnd3SnIxVWVxellRWW1Xd1Zrc25hV3BpVjMzWFgwMDhkbVI1?=
 =?utf-8?B?QzVQcFV1VWVHMFErODBVT0x1eWlhUVd5VHJ0Ym9aRU5nK3E3YllTWHFTT3R3?=
 =?utf-8?B?ZXVrWEJPVHBKaEp4MTlKNXNyT2lpeGw4Ykw3M2pidEhPY0lDUGJudGd6WmdX?=
 =?utf-8?B?Z1BkdVNCemFXd1RubGRlMHlUS3NwK1ZHRjZveTEzR25rSk1ieWt3S3hIMUpR?=
 =?utf-8?B?OWZKMldhN3pBVWNlN3BLOHRid3R0QXgydUdsMWNJMTNCL3kvZm4wcS9OcUc4?=
 =?utf-8?B?dFJFSEN3YnhHbllDMFE0S1E4TXM3Q2dSdnR1amR0OFBDejlqSGZuYnpERnk5?=
 =?utf-8?B?WXFINmU0S3VBQzcxTE8wNUhZOHZQVzIxSnFYK1BGa1lRSzVtdHhTVzhkQm5y?=
 =?utf-8?B?N3lNS1RqYVhycEJpK1FZUmg3c3BFQnAybzFVM1ZFYnBXSHFNa2grd0pMNGVH?=
 =?utf-8?B?bFdaNDhWdGtRbWtmSmZnLytuRXRRejhOWFQzZEhmVnhGaC9Jc2N0NHNOV3Zx?=
 =?utf-8?B?aFlZTlJaS3NUbmcyN0pqZG9GeStUUW9qVWZVWExYRUdEeTVlQlBDTnRRZzNE?=
 =?utf-8?B?ZEtVRzExZTN1YWkrNk1vbzhYOUJESGp0QmkyUjZiZGlhem0xWnpkU1N4TlFV?=
 =?utf-8?B?cnc1NmFDek5qVFVNcUY0WE5HS1JIemVrZnI4ek5PSCtDMHFvdEtaTFNjTHNu?=
 =?utf-8?B?Qm1PT3l3NDRNUDhBR2h3eGlybjB4OGlVc2FNQi8wb1Z5MWxXSjBDVXcwV0xM?=
 =?utf-8?B?UTRRY2FTNDJFaWxJb084bkhkQ3lxcUY3SEZ6c0tQcWxXd0dNQ3d0ZGtkTTlP?=
 =?utf-8?B?aVl4K1UwR3ZXNHdIWVdpOU90aCtsR0pTcEZSd3RHRTlHMnp4SUpQUjZkV0Z0?=
 =?utf-8?B?eHBrRFpFelNUMzFCUEFWd0hJR3lyT2RRUlZCMmhKQW1VYTFXZXp4cWY1ZG5V?=
 =?utf-8?B?TkhwWkNrWFJwaCtsYXE2cHhvNnBQMWZNTVkzQW5MdW1obmtUM3pxN2E0a0lX?=
 =?utf-8?B?WXZPY3pIWUtmQnpvWUlrTFNqNnhyNjExc2NhcG9WcGM4OHR0cDBLRWF1SFVt?=
 =?utf-8?B?RDVuUnU1WXFCcUg2NEEvTDhmVU9oc1FJTWoyTitubmd4aEgyYUwxaHNGRXVC?=
 =?utf-8?B?WEZVUW5vMWo4aWd1eHRwSG1ja0N2WUxVVSt0TnlWTklIODY5ZTNTQjl3eG92?=
 =?utf-8?B?d1lSOUJpbUNjM2dRMk42VzBoeVNvZTZyVnRGb0c2Zkp2K2dBQW92YkdQZi9w?=
 =?utf-8?B?UHBZMTZ2K3pzTzFvbVVzS0IyNDJjVUV1dTdRSk1iZ2FlQVRWeEhqdmlQSjhT?=
 =?utf-8?B?OE43NGdId1dsY1BpZUdFTTArOFpYa0E5bFUwTkRBMW9FNElpQUJNNWNPenFV?=
 =?utf-8?B?ank4S2RTM0dhRXFuQWwwTGpMTDdSSU90emVwZTRNNEFNTlF3Zk9SendTOEJW?=
 =?utf-8?B?L042OFhFWWVWRnZTSnArVnhJMTBUYXFham1JYmIzMVllcUcyMEpvYXdrN0Fj?=
 =?utf-8?B?Y0xOOVhZNytySUNpeHR0TTlHSGxQcFo5NHc0Q0gvd3FNT0JQckx4NkphU29P?=
 =?utf-8?B?NTREcGJKNVF3dVdUaXZiOHRGVngzdWRxbjNlM3BBcDF4a1U2RzZXODNzWVI0?=
 =?utf-8?B?VEhZVlRqYnowakVHN0UxMHYvalJpTjNnK0VxMXAvNE1CK0FwRWxzSC9uaUxo?=
 =?utf-8?B?NUcrMnV6VGFHci9EcDhYOTZ4VW9OSEMrNE0ram9MTnRvcDR5ZDhNQU9Lb002?=
 =?utf-8?B?WlpxMEVvRDNlZXY1MVQ5a0owbFpLUHpJVXdSNlR1OUNHcFlWQW55UGRhUDZ0?=
 =?utf-8?B?dGxsUnB2TnBGdlVoQTI1clFSMVdteFFpY2xLeXZHcDhRTXNBZXJmYm1zbjB4?=
 =?utf-8?B?Tkx5SXpYODRiWEEvN0Q4TDFoMVhtc2pPaUtZREFoR2V3eHVtSmF5eGlkcEYw?=
 =?utf-8?B?WVhlRGpKSStjVDY1NFM3Z09oOVA0YmxzYWFlMGs3MlVseVZnWnZzdzFzZDNF?=
 =?utf-8?B?MHltWUdSNWR1VzMva2JWQmJOaGN4ZzBjVlZ1TWVKcmFVOGZRUE1BWWIrMmlN?=
 =?utf-8?B?K0N2WFJYTlRLd2ZTVGxJTG9hUElva1c0allKV3paaFBFbitWYzQvbjhkcEpq?=
 =?utf-8?B?MU1jeTNlRUhyVTd2SUk2L1VZbkpVTHNsL1E2T3N6Y0xDQTVJQkRZK28vcXRy?=
 =?utf-8?B?eTdodHJ0OUtzUDVrM29HTFJNTElleDJVK2N0aThqNzFxRFRITDdudz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9214480b-20ce-4b32-58f6-08deaab0c682
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:15:35.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeH6W/uUyl6ySIBNvBsX+UhYMSaYuTt6zY/kH8Uyd+b9l1gFUAbD0GjdAxMsTP3m76dahu7T++alx49VO6lQ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7207
X-purgate-ID: tlsNG-ebf023/1777990546-3224E3FF-CA4798BC/0/0
X-purgate-type: clean
X-purgate-size: 4754
X-Rspamd-Queue-Id: CE5EF4CF395
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:x1917x@gmail.com,m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 03:07:36PM +0200, Alexey G wrote:
> On Tue, 28 Apr 2026 09:48:41 +0200
> Roger Pau Monné <roger.pau@citrix.com> wrote:
> 
> >On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
> >> This series introduces initial Q35 chipset support for HVM guests,
> >> based on the patchset at [1] by Alexey Gerasimenko.
> >> 
> >> Basic support means that this patchset allows to start an HVM guest
> >> that emulates a Q35 chipset via Qemu and implements access to PCIe
> >> extended configuration space for such devices emulated by Qemu.
> >> 
> >> Support for PCIe device passthrough is not implemented yet. This is
> >> planned but implies modifications in the hypervisor and the
> >> firmwares, mainly for the support of multiple PCI buses.
> >
> >Why do you need multi bus support to expose PCIe capabilities?  I'm
> >not seeing the relation between those two.  You could still expose a
> >single bus on the MCFG table.
> 
> The problem with the PCIe bus is that it's very "topological" by design
> - and it always wants a valid hierarchy.
> 
> Each PCIe device manifests itself (via its PCIe Capabilities entry)
> as either a chipset-integrated device or a regular PCIe endpoint
> device, which is the most common case. There are more types IIRC but
> these are what we deal with mostly - both for PT devices and
> QEMU-emulated ones.
> 
> But, being a PCIe endpoint means that the device must have some parent
> device. It can be located below a PCIe switch or, in the simplest and
> the most common case, below a PCIe Root Port device.
> 
> In both cases the 'parent' is a PCI-PCI bridge technically, with the
> PCIe endpoint device being located on its secondary bus.
> 
> As the Q35 patch series was done with mostly PCIe device passthrough in
> mind, this brings the main complication - in order to properly place a
> passed through device on the PCIe bus, we need an emulated/real/hybrid
> Root Port device.
> 
> A much lengthier description is in this patch message:
> https://lists.xenproject.org/archives/html/xen-devel/2018-03/msg01197.html
> 
> To summarize, we need this 'valid PCIe topology' nonsense just to make
> Windows kernel (pci.sys driver specifically) not to discard our PT
> device due to checking PCIe bus hierarchy above it.
> 
> This limitation was found/confirmed via debugging - luckily, pci.sys
> had symbols and the main bad function which was failing had a very
> speaking name - something like pcieCheckTopology or similar.
> 
> Emulating the "chipset-integrated device" in PT device's PCIe
> Capabilities was a simple hack which allowed to bypass the requirement
> to have a valid PCIe hierarchy with multiple buses. But the proper
> future direction is implementing emulation of Root Ports or PCIe
> switches I guess.

Oh, I see.  We discussed this with Jan, it wasn't clear whether it
would be a strict requirement or not.  We have our answer now, it is a
strict requirement for pass-through to Windows guests.

> >> The PCIe MMCONFIG area is configured by hvmloader and its base
> >> address and size are set in Xen using a new pair of hypercalls
> >> HVMOP_get|set_ecam_space.
> >
> >I guess I will see how that looks like in the series, but the setting
> >of the ECAM region would better be done by the toolstack.  Setting it
> >in hvmloader is possibly not the best placement, because it doesn't
> >run for PVH guests (and we will want ECAM support for PVH at some
> >point), and there's also a vague plan/intention to get rid of
> >hvmloader even for HVM guests eventually.
> 
> This is the situation where the difference between HVM and PVH might be
> very problematic I'm afraid. HVM guests assume full freedom over the
> IO/MMIO resources setup inside their sandboxed environment.
> 
> It's not just Windows reallocating PCI BARs to its liking, but also
> spans to the emulated chipset's resources. In worst case we could have
> MMCONFIG reinitialization implemented even in Intel's Q35 drivers
> installed inside an HVM guest. Fortunately, this is not what I remember
> was the case, but in theory Q35 driver could have done things like this.

Indeed.  In later patches my recommendation was to trap accesses to
the root complex registers that control the position and size of the
ECAM region, and forward those to the hypervisor, instead of hvmloader
using a side-band hypercall to set the position and size of the ECAM
region.

I've also discussed this with Jan, alternatively we could trap the
registers directly in Xen itself, but the Xen would need to know the
domain has an emulated q35, which we might need to do at some point,
but we are likely not there yet.

Thanks, Roger.

