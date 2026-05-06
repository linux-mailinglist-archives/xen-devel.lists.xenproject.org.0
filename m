Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKUCB5Jy+2lgbQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:55:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735AF4DE6B2
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301984.1576092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfX4-0002mu-5X; Wed, 06 May 2026 16:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301984.1576092; Wed, 06 May 2026 16:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfX4-0002ks-2d; Wed, 06 May 2026 16:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1301984;
 Wed, 06 May 2026 16:55:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKfX1-0002kg-U0
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:55:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKfX1-00AOY3-AS
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 18:55:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb724a-5cb7-0a2a0a5109dd-0a2a450c9856-48
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:55:31 +0200
Received: from [40.107.200.48]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb727e-62f1-0a2a450c0019-286bc830edd0-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:55:31 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5691.namprd03.prod.outlook.com (2603:10b6:806:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 16:55:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:55:23 +0000
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
 b=j0E2/sAnNNo3uH3/Dp8jJ3i+NCPMqgSXIskZdzwj0Hn5FX1gixvHuy/Zr/5SwxfikeopgzlP7aIYNoh1XjcAbcYacFWJKoMQ1wvNFbT5ZnHtSno/XU77Kb6pV+1/xtbYZhvhnm/ZBxGacCxIs9sgPgjVHmltDydOraZXRrb1T5NY89O8R9b41pojaVe0HiW8kC+h7BK9XSSkVLs2vadlgzcDZ8gepoESs7tnT/gRteT0+bsn5NVDaueeQ+DxvQOrTxwJYY7JYzZLNO8b+2svyEEhLY0RyaK8ZiyI2+MisFmXEoBcu7BMtjyc0dc8+Wu2fJFhbhNrxTFHLVG8WHEN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ63qQv6SMNVbLoZ7q1mqC01ux/BRuiRCRYo4W1MrpU=;
 b=H7D7rZo5du41SsmudzLLBHRgQpaq1L+5EVjnOeZCyNaevx4c93lFWUtr7pN7nMw2p0D4BB0JNIjcDtAKuKU180qU2Z/GrvSo4lNqzqwIwetESisvakFMbNwvTNcrVs6uKDUvzym7NRAezlY1CuPkVx0U87WfMm6Mfl3jdmNjY6qV4LBW00rEmQJegr22BPPFvB4ANev6BPK/iTZ5WsqhKuyvyUYbZnk8Fw8deh4V5/XLwPPxPMiRn4/z3i7SDuWHAe+LL+uFmXJRXsiQnsKiKp7pPJ0UIcStwNRu95Ju0E2kycp2N8hqtJ666p4wRrUHvKja1uXYDGBtjcjY11p+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ63qQv6SMNVbLoZ7q1mqC01ux/BRuiRCRYo4W1MrpU=;
 b=HZ9rvOvDIyuc8EPSJZhUuTUX1UITiHOwuRaVMXWxHs4PPrt37gHlcg25YbDSS2pdO0aWgIFXgdEHiKbnlY8DuYOKlm0oqyhIFmVn+8qTNo1Ortc7EdIrdY02uEmMD4+UWrfZA1fSUpwTklKiQt+XQ+sIflN8eG57S2s9SMURR90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 18:55:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 0/2] iommu/amd-vi: remove zeroing of MMIO region
Message-ID: <aftydxyqHXaaZqBx@macbook.local>
References: <20260506135514.47310-1-roger.pau@citrix.com>
 <aftxLNbCYKnLrEXM@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aftxLNbCYKnLrEXM@mail-itl>
X-ClientProxiedBy: MR1P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ddfaace-ac37-4e38-df3c-08deab9043bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IX53AhV4VgHuhKpZkLtG6FZmkrSb6a7wxB8Rhsh7SG32jSv4LEtuwTm9R/tRdhl13OKEKARW9Dh75cdW9cy5T3eJ8flGPcIGj/jUPDBdsPN1VfpweUhv/x4lT60XTM1sydE5aYKCqQwcxDp7WigHkzHU03/AmVZapVU+knRoExjlSIshkh0sEAiArQvVQsmU1Hp932ef+6ukqUAw5AvP/Iw/uxsEKlQdTdtP3TARH9eyIzmCu+ONYIQRHezxzrAS+wGavH07SQ5QE3v/ecf6PWywGAmtiECHA9XotrjuMqeOMrDCmL5mZLq352w+osCa6Pmy5XYtBLzOX9AyaPguC9G1cJgUNjq3TTFfaEfFDDBWXO5bFTpAOEfNH4Wdd+Y55CXesWkQutNlLA2EogQJOM86MxbdBaTW778A2ESOPjkLa5oWLcQeC0Rf6jb78xRRJlftHtJu7b2Z+7DOkSs3UwUNMJaRkB8ygaOdrrCGKaCrZrz2OgCYZvqkRwPIvUMnIjdr+u5Zo6IcGPt6jHHw2TlpZzoa+OoLXrKfpgsSGqAFJMi0OBV3/lrC2AH9AdpQsTOf7jh5c1PSW7BiwyTqcZcHbie0nj7zvEiA4SrDhQC+qP3XF+CYbdre/KXNYXZ3j+OrXFSPP9xXgvl0mDnliT+b/vLoSzy/E/TPu6jX1S4SkwiyJN9D7/CHyrMbMlZj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVFBdFpvOXduQjF1emZNdWlvdEFrQXVNcjhoUzkxN1Y5eW1lSGtJN05GZjVk?=
 =?utf-8?B?dlNndlduVW5vbzBYMllHSUw5MzlxMXJRUFZMU1h5OXBzWUU3R3FOYXIzQkQ2?=
 =?utf-8?B?L2I4UER2OGJVTVdyaHMybFRvOFFMUG1OU2lOS3AvSW55Y2w3VWIva1VJRjFZ?=
 =?utf-8?B?ajhBaDlocWo1SUNlYTN6SHR1eWluVlAxd1B6enp4bE04RitDV2NQcStIaGNt?=
 =?utf-8?B?M3pjQVpiUVR1VU5HWE53Nkc0SXJrblJJOUxVMklQazk5YnNlcGlvSitmL0lH?=
 =?utf-8?B?RUZyejU0RUs4cGlRaDVCNXFmWnM1SHBHdENXNXFMWXRUaTIrK0Fhc3p2dlVV?=
 =?utf-8?B?c3VDVEE3Z003VVl5bXdETWNlQUoxYzM0VXU4NlRjUHdaSGprTmswSnZZeEVo?=
 =?utf-8?B?NGFUVmlHS1hXdHgzSzBnVDRQYno2N0VKUEhoTEtYT1dHQ2FZSmVXdmlyYnQ1?=
 =?utf-8?B?UVhFYlV6cXA3cFhIQ0NmZmtDSzd3eWRBQVIxV2hQS0R5eEZCdTkxNVYweHZk?=
 =?utf-8?B?VWN2b3ltVFRybk9mUnF2SGN2cU5xQjVzbWdWa3haWGVKUE1YVUN4MDV3ZE1q?=
 =?utf-8?B?aDdKQkRvaHZZTlVLTW0yTXJyNFYzWHVlZStaSGdMMkdFQ2JVdC9Nd2Nta2pO?=
 =?utf-8?B?UDViMWY3bkFMV1RObVBxMzlTUnQ4ZG9vNm0vNktIRlhra2k2d3QybFpYM05V?=
 =?utf-8?B?c29QSE4vK2c2MUkvaGE4aWpSbFVxUkc2cHhkZUxVWWNJN3pOUnhkQWJEd0Ro?=
 =?utf-8?B?bUx6NU1nNEVhR1czNHJSRTFXWndSenBqQ2lCb2xEbFVoeFZFMU12N1hFL2JJ?=
 =?utf-8?B?T0lpb2ZtN1Y0WG1kNkN5bFpVVmE3WllXRlQ5VWVweEVsL0lxTFFteGRhaGpy?=
 =?utf-8?B?QWNHWFllS1k0T0dDOGdDbENITWNpTEh4THYrOERYOUZrWm1RazhZM2lmY201?=
 =?utf-8?B?V3VTYlhuZ0F6UllsNzBEVzdUMUNEMUM2cllKYVZuWWU0OW0vMHRwWksxNkUr?=
 =?utf-8?B?cmVjNjVuWEx5dFlDY0JQemhibzVseEpYSHFkakM3L2hnL1NsK2plbHc4eHE0?=
 =?utf-8?B?SXFCcGJSTlBVRjlkYXN0QVBkWGJVWG15YWFsVTFSdEJRU05ZcWZyQk4zZXRF?=
 =?utf-8?B?UTFONjBVaUQ0NFMxc1kyVXFUbDRIOHpLUzFoQmhjS09BdXN4YjBZVm9MSGxT?=
 =?utf-8?B?dldwNlo0MENFNzNSbno2UGhrMGpwNmVXbXhMdHVyMGZTcTdIZngwSTZQUjFF?=
 =?utf-8?B?K3cwbUhLWGxvZmJ3cG0rZkNubUlyckVRcGpmcE52bzVwU2diek4rbkNSY2Jv?=
 =?utf-8?B?bkxmU3pvWjU4Y0pyUHFoS0RIZEpvSklSYTFNdGlLMGVVdUZiYlRzcVRDQ08r?=
 =?utf-8?B?Z01DSHpLUGhTb2ZTT1ZxZlduY0wrMFBBVC9ienNaYXY1eDNHSklodm5jSzJt?=
 =?utf-8?B?Q1BFQjR6NzZVcEV4ckU4Vkx5NDUzeXk1MTNRcWtOcGFYalEzUHRWVEdMZkc5?=
 =?utf-8?B?QWlWTWR0QWpIaHZpM1NFejZsOXhhWmdKd29zUG0yUkJOWUJqdHpyN3l0YlB6?=
 =?utf-8?B?M1BTT3hSYi8vUE5QbDdTTkFZUGlDSG55UlUzZjlrOHpzZGRLZlZSbDNzUFZ4?=
 =?utf-8?B?bDVyUlpNNlovZ3NDVHluUU9kRVZNYVVmN3BLV3IxMHFrZEYrUWlnVkJPY0Vp?=
 =?utf-8?B?dXkzVDBadVJIbmZDTmFxTUhHb0RUeExUMlJGdmlleCtaTWtWanhMZWVHd1NF?=
 =?utf-8?B?eUpsS0l3M21PUkh2TGVVM3UyZno0NFZTb0pnSnduSzBYdlBBVnVhV2RmWVBo?=
 =?utf-8?B?b2h0bXpyMzFEemVxT1Bha21EOXRxUUFjT3ZhR3JpdTFhUFpvdDM3czlCWCtw?=
 =?utf-8?B?RGd2SGt1SG1ZT1ZteExmZG5nSCtCemdlTGNSMktady90aTgzUkZUWDZsV1Vx?=
 =?utf-8?B?TGk1MUY1SjI3MElvYnRIUGZNQlRPT2NablBrcjBMSGJ1MDdBN2JwUmZYUzhu?=
 =?utf-8?B?aGljdi93UGk3N1d1SWNZMGRXQVpRUGt5NGw4QXNuQVc5QjRLNTdEN2JjM0xq?=
 =?utf-8?B?bVFIbStRRFhSNHZwU1Rtb05UdDcvdEc0V29lSkcwNTc3Sm9FV1R0a2VIbFY4?=
 =?utf-8?B?ZFovVUZGbDUwSUZSRlFOSXRIWmRNWXdGNkU1NWVLakF3TlluaFBqL3RhMTBn?=
 =?utf-8?B?amQvVDhiK1UvSUhBWGxJUWJNN2hZZTExLytqUWtUMUNKeCtRZHN2elIrMC84?=
 =?utf-8?B?UVpKQmFvRVh6R1lrVXorbERtVkZ3M3laZjFQdjU1OSs3bW5pcjRXbnBuRC95?=
 =?utf-8?B?ZVdwR0gzcElUMERsMXAxMnVvQ1ZUUWZ5SzJIZDVoeTFBZVgxam9rZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddfaace-ac37-4e38-df3c-08deab9043bf
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 16:55:23.6721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X65THfKAbh1ficGM+nEZM61rEbpcDpvrUJs104ZHK74Ww9um6RW47mvLf38V1ecTMTjq3igLnrWFRHydmDxjEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5691
X-purgate-ID: tlsNG-d25034/1778086531-E357FCF5-CA28E968/0/0
X-purgate-type: clean
X-purgate-size: 983
X-Rspamd-Queue-Id: 735AF4DE6B2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 06:49:47PM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, May 06, 2026 at 03:55:12PM +0200, Roger Pau Monne wrote:
> > Hello,
> > 
> > Unconditionally zeroing the whole IOMMU MMIO region is dangerous, at
> > least on an upcoming platform this does put the IOMMU in a broken state
> > that's not recoverable by the init procedure in Xen.
> > 
> > Get rid of the zeroing, and instead attempt to disable the IOMMU ahead
> > of enabling it.
> 
> Just to mention it here, while this looks like a step in the right
> direction, even better would be to not disable IOMMU at boot, but
> reconfigure it - to preserve uninterrupted protection when boot time DMA
> protection is enabled in firmware. But that's definitely more work...

Yes, we are aware of this.  But IMO booting with the IOMMU enabled
will be a new feature, this is strictly a fix that we can "safely"
backport to stable branches to deal with broken hardware.

Thanks, Roger.

