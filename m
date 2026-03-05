Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACTQBmx5qWl77wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 13:39:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B36211CE7
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 13:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246547.1545678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy7y8-0002eE-C2; Thu, 05 Mar 2026 12:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246547.1545678; Thu, 05 Mar 2026 12:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy7y8-0002c5-9G; Thu, 05 Mar 2026 12:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1246547;
 Thu, 05 Mar 2026 12:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy7y6-0002bN-QS
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 12:38:18 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e0851d5-1890-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 13:38:16 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6574.namprd03.prod.outlook.com (2603:10b6:510:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 12:38:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 12:38:11 +0000
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
X-Inumbo-ID: 2e0851d5-1890-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8ob6+f2u5XpFae7c/Cxv8/zwV2ejGccWY+IlERYNGyiMnrVN6wW10pc1wQrFRLA27W3Ot73LbnNh3Hi+yC5p2X67sQnXKw4W6MERiLPeOCR7Ulgh1TWUvJuwa0fuPoVMXObyMgYENPkEIxa8XQ4jhtmqtLPM61U1NqTXA9V1D/C21jkKJbVDVKlgnNN0C6bBwlQZk8L7IMUDnygEEWyrQF05gfmzkyT8vi1iLk34mRiNyny8GnS8K7Ac0FZh+x6OmcGN3bj28J0aGBajju/x/1V6oo3Bqh+6J50lFfsFmOSXZIv0PHyeAGN+7Xq8KJeK9cZAXXobHmxneZ9OlOr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOFugAuHG0luGWTzvb5EmgIacu3CrP0wwFuP+xzGE2g=;
 b=cHajjt4sjGC1LleYljOZOyTzbNN/GV4P7GoIyO3DHajO9pUXwhc4TQJHewo2CZ18zfaOx6WO0JggF2xRoiV1AI8Xg0zAXnczjiTi4EzrpK1y3CKfgostma/ds5zgjufAtolyaHm5yPD4tH13rw9m3aN1rGmiolzn5fIf1NO0WyH0VOKxKGYH7P3SbfTWJ7iCw7YiG/CJ2k4oKTpnaeGkXjQP8zhOGmv3IKhGIjn7N7m7X8vB+4yWq3wAibLUNgxkMKhB+X38cu6YKN+XtbLv9PnV6GNdApd57awRbzIGcTiU/aqOISYwK9XTb3+yuz8koDGc22wnoeLG2ixJDgBvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOFugAuHG0luGWTzvb5EmgIacu3CrP0wwFuP+xzGE2g=;
 b=0rquEotU4sucWHjl9Ahox8LbLBIgPeU75mkuwqSxgzk1V3SgahznKYPUIxR2aC9PxHuypp+kYTQjfTENncxztS5YNmWC9spqBGyVZXnQQnVFily0UzPX+sq2PBR8JjUiwthJNS1l3b3EPWB3iuV0IpOMX80g22c2l94V5Xy3lpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 13:38:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Message-ID: <aal5L6uuFNW2A5NR@macbook.local>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
X-ClientProxiedBy: MR1P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 9651cf4c-e254-438b-9165-08de7ab40f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	a634TpC0mRkF7vIq3XAqkK77Ws8xZCmmsXOx7aAMx2tO3BoFiaGNTZ/YDSWcRwsZ7sbb4E9KtKjpH4/pYhHi5Mtj3Nk+EV2ozcBUKMy05Gc/rnd4Ue5IRb5/3AQQNuy6QBjv+yFADuPlEzmcyHw+Hl763AgLEhexpd9YRhxiwPOyx0QFUBqAVHLxkQjZ7WEb1Jn0Wijl1szsLtnqP4zOFu4Zgh2QpyAx8mZ6OHVO1aLofu9qIzYZw2wXsLEBwufiIWCM5nTT70/m03FKViCU5SeJfomRXnrjWfMF5wd8FYM7iBntQOKKWOUv/K3+qH1egRlg3A0Ti3NGgEbLSI6lgay4QSkO4Knw+KaNp6LvXQLJoBnKJ3HSMXZFfMdcWsAZevtXUaifIS9BW//9B7zw2AOlZoSviQUB5FsheBtX4uwfUYX5a30CxN3sVH4wUj8QpzTemrxSS8Pxsueq0bgn6lS29oGgUfRjpOSKKCA3rv8XdCA/b2M9cRN7HmzBq5setr7pEC9Zw8ZufstB1Fc9O07cFR6ETwKEgkgbOnbhTtsvCd/h1f8ThHCqBVMzlkZD+GVDNc6cn/lmisM9984q0Z+T0sYuNq3otlEbIfHEEodBlykQJr26dKO5iVPGfHVyEvWJv6IdMN69NvOB0Ga1mGPZC49AQtM3xpMTBiAzDC2kaHJCiCNV/AaLaQzr0HcA094uaeERBFRHLGOoYU3ohea/ydW5lCQXkWDtewfHOFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVNvTXd2UHQwWVRaU3FXYldtcWtXUmh6aFAyMlE2aDRWZnFSR2tjbm1sMWNn?=
 =?utf-8?B?alg2R0NzbFhLYnJuRjlxdzJFcmRYcmFCemdrR3dCN01NVTZHM3F4THQyNm9V?=
 =?utf-8?B?allVemhUSGRzMW9IeDJ5WmZ3NWFQS25BdmtsUUVkckhJbDJaSS9RTEh6L2NL?=
 =?utf-8?B?RzhlSkZPbXErZjVZeGY5K0Q2NFBJeVBnWGNUelNoMzBSZUNyNmJNZTZxaVYx?=
 =?utf-8?B?NkU0RmlPUjMvYXR1b3lTamtCeE9LRjd5cGV0b1RsM3h5K3NmbHByNVhJRnNt?=
 =?utf-8?B?b2xqd0U5SDBFU0locWZNNVZGbkVMREV4NlpXZFUxODdFeFNhTk9HSXBQTXFZ?=
 =?utf-8?B?K2RKcURDQmNEUHhKSDBWTXE4UHNXUjEzdy81eVJhUVViS0ozaWlqdWlIYWlh?=
 =?utf-8?B?Z2ttem5kazJqTEdTUVFyZTIvKzBpd2N2eXZRWUEzZ2xzZEFVd2ZRbjMxd3ZI?=
 =?utf-8?B?RTNLYmxPQjdXZzMxUGZBYXpMT0FGdUxZOWxTR2s3K2k1TE5YR1loMHJyVDA0?=
 =?utf-8?B?UE9rL01JNjNGRjcxbUh2Snk0ZTM3bVhpeEhOZE1WcElSMk14MDE0Vm1DRE12?=
 =?utf-8?B?aHE4NCt1T2U2K2puQURhTHoyM0dxZlFJRjY2MHl6WGZ5Y05mbnJXeW0wUEoz?=
 =?utf-8?B?NzJ6bWRvazJLRkpCOURJNDY4Wll1QVIxOXhnb3lSa1Bha1JxMVNZT3BFMzJi?=
 =?utf-8?B?SWx6OU9HRFNwSEFTVExpWGJ1OFF1bnBFY1NadTJtUU1od05VdEJXbU0rTnBw?=
 =?utf-8?B?K0ZvR1dFNkppRFBFd3NJU0Y2TGpuZDJDbjJRUHArcC94Q005SkI4WUpWdjQ4?=
 =?utf-8?B?M2tSVndwRzlTbGYvQ1ZxaDljZlF3WTgrUDFESi9rbi9iQkVIN3lmN3VQU3pG?=
 =?utf-8?B?QmFLL2JxaGJpOFY0K25pMk1ZM3M0d20rVk9mWFM2TlFvUFgzcGc2UklnSm80?=
 =?utf-8?B?MjhWVFFaVzJyRDNCL0VLZWVxY3NLM3FrTjlwNUFiQVZleEZ4MW54NUtWNGFJ?=
 =?utf-8?B?U1hmaHc2dWhzUWpEeDE0U0JSc1RBajFTTjRTUjljcnYzR05KY3FpOUNGTFJj?=
 =?utf-8?B?YzI1dmp3eHhCT0FTYjRrYjFvR3g1MUpPdFB4YXFYY1c4MFdObUQ4SFZzRnRo?=
 =?utf-8?B?Mys4Ym1yUmg5dHJxUXppMVM0czlJRVdISGJHMWxYaUJheUVCOE41ditVTGdJ?=
 =?utf-8?B?M2NFRE9MdU56cmNubkU2QXVEN2JXaFVXbm8xbytEK2EyUDhSZWtjeVQvbXph?=
 =?utf-8?B?U2lGL3B6WkhEK3lwMU5hdUVGZUxmMys4Z25HcGFrcmx4UDJsQzIwTW5UV2Zx?=
 =?utf-8?B?U2Z2Z05xQVQ0R3Y0ZHIyTGFJNmhMbXZZQ2pkS0hGbUVmUzg0bkZEZ0JQcDQ2?=
 =?utf-8?B?RnNMVFFpOE10bERSOGJBbzNFOStKdk9hcEZCU20wQjQ0SXd1dzk3ZURiK3hM?=
 =?utf-8?B?TDdoN1hMMVRTMktueFpSLytqTkszNUJldm9mYndSaUtnTmpDV3NsUGo3bmV4?=
 =?utf-8?B?LzNmaE5WK29LM2pWaXpKMUthZUFYNnlYajZrL0JEdGtGNTY4cERmNHFYQ3lt?=
 =?utf-8?B?bVo5U2lkK3ArdWt3em9PcUhoV01GR3NPa1pqZTQyUFlQd3BNWFBtamUyRkI5?=
 =?utf-8?B?NTRRSnFEYUF4aHd0UzhZSGg1bG1RQnlSUHdnODlpK2M4a1RkTlMrWWhKMnF3?=
 =?utf-8?B?Rk4zbnhmN3ZyaG1FSlNkR2JuL04xT3V6MTZYR2VtZXA1dXl0bTZWMkNJa3VH?=
 =?utf-8?B?VGZEM2FjN29lbFV6R3F1cTRscW53VzArZk9CR2MyMi9oY2JyUjNGVDdzZ3VZ?=
 =?utf-8?B?eGRVRHZTNlk4a0l1SEZRUWFBUHpZcFNweWU4dHA5U3VLSlRTM2FIN0hCSkp5?=
 =?utf-8?B?UnArOGo1Z1BZYkY1L1NTRHc1S0ZqN1U0ZzZYcHNTTVVTS0tFSE1JR0FHbmxR?=
 =?utf-8?B?YXVabjFvaFJkcDF4a2d3MnFHNUNEcUR5Tm1ZcTBxYWhIRDVBZWVIN1kramxs?=
 =?utf-8?B?ZDYrVk5JU0liWE5xa1pOZ2xBZ0xJeFhQeFJ1NUFZUlFsbXphNjhBUGxwdUV2?=
 =?utf-8?B?ZnZ0T0dwUVdSUkp3K0VDdzQ4Z0Vhd1kwcDJHTXBXdHBzUGh3SjNUcjVFc0dZ?=
 =?utf-8?B?YmJ0WlVlWUhyYVkyNkNITU93Z0F4dHJ3SmdORFFwM0pDQ1RyZG9SUkNVQnVi?=
 =?utf-8?B?U3VTWG1OeHZ0bDV2VU9XTGhUS0ROMEc5andCdVVtSW1oRlp3UnZobjcwQS9x?=
 =?utf-8?B?Qm1YLzA3ZWE1dGFudmJObVExQlY0S1NnME5xSndETDRRQThzR1VTb2l0TExS?=
 =?utf-8?B?U0RqQ1dmd0wvNmpvVmlPOWttWnFnalA0ekFiaWtmUHZNanFZYzBuUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9651cf4c-e254-438b-9165-08de7ab40f95
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:38:10.9313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFafqZjd5Biz66yYg1r1SqRQcNdALqGXuDjLCE2X4Y8EMWUCpMNu9tBwzYgqlRWaMXYIEazxa83Dmi3G+esjhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6574
X-Rspamd-Queue-Id: 74B36211CE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
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

On Thu, Feb 26, 2026 at 02:29:19PM +0000, Bernhard Kaindl wrote:
> Add a DOMCTL handler for claiming memory with NUMA awareness. It
> rejects claims when LLC coloring (does not support claims) is enabled
> and translates the public constant to the internal NUMA_NO_NODE.
> 
> The request is forwarded to domain_set_outstanding_pages() for the
> actual claim processing. The handler uses the same XSM hook as the
> legacy XENMEM_claim_pages hypercall.
> 
> While the underlying infrastructure currently supports only a single
> claim, the public hypercall interface is designed to be extensible for
> multiple claims in the future without breaking the API.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>  xen/common/domain.c         | 29 ++++++++++++++++++++++++++++
>  xen/common/domctl.c         |  9 +++++++++
>  xen/include/public/domctl.h | 38 +++++++++++++++++++++++++++++++++++++
>  xen/include/xen/domain.h    |  2 ++
>  4 files changed, 78 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e7861259a2b3..ac1b091f5574 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -268,6 +268,35 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>      return rc;
>  }
>  
> +/* Claim memory for a domain or reset the claim */
> +int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo)
> +{
> +    memory_claim_t claim;
> +
> +    /* alloc_color_heap_page() does not handle claims, so reject LLC coloring */
> +    if ( llc_coloring_enabled )
> +        return -EOPNOTSUPP;
> +    /*
> +     * We only support single claims at the moment, and if the domain is
> +     * dying (d->is_dying is set), its claims have already been released
> +     */
> +    if ( uinfo->pad || uinfo->nr_claims != 1 || d->is_dying )

Iff we can move forward with this single node claim implementation,
the return code for uinfo->nr_claims != 1 needs to be -EOPNOTSUPP, to
differentiate the hypervisor doesn't support the operation vs there's
an error in the input parameters.  That check needs to moved into
the previous if condition.

If the domain is dying we could also return -ESRCH, so that we can
differentiate the different error paths from the return code of the
hypercall.

