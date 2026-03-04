Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIY/JAVUqGlutQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:47:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C62032DF
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245688.1545032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoR9-0001gw-L8; Wed, 04 Mar 2026 15:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245688.1545032; Wed, 04 Mar 2026 15:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoR9-0001fD-IK; Wed, 04 Mar 2026 15:46:59 +0000
Received: by outflank-mailman (input) for mailman id 1245688;
 Wed, 04 Mar 2026 15:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxoR8-0001f5-1D
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:46:58 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4244d4-17e1-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:46:52 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7341.namprd03.prod.outlook.com (2603:10b6:610:1a6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:46:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:46:48 +0000
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
X-Inumbo-ID: 5d4244d4-17e1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYQJ2QaT+r01EeoYFzmxo1kOSfA54ndTS+ZXsxg2WTVezoamAz4v3dp8CPLH9jPWQQkbuApTjm3nehioQyIVz7ocB31VeTLtqovxIb/nMIaTkHl+W6Ire9GML5qCJQVljzvHTZzBYTVxXjaacVSpfa5ip9xvPGaWhqGIyfyqLqBqhHYpzUIsd30Q29LKR3f+GPJ8WjrK4clFkvtz1ef7FfwxreTO7/AkHYnTuGOyKIrL+KYd2qsQ5zSqYAfADe/uE86/nJixgKwqi+0NFVqKvh//dnGwMRtvFL2eAy+TzeZqg2/s5r8rOp1I0EYX49W97U0kAbOVgsTDVX20hEN42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cow4Ee/eldGQKE8TcB2/TyGw1p+U5zfANcUH1l9/wyE=;
 b=QR5+Xxvp3cpAOMZ9gvJM+PMI0a1Kviq2cTVsZKksjmE4N5tzPnxby9AyZiYYKRRlPOKZOAJo6RlPli4YGW0v0xTIrXdbQIASuIoB1hCV+GMQrpJD3LyA19DHl6zQ5XWxOsJQBuahVmsBk8qjo/SqYJqw7C8eVegSlJHHn0mWLr2jnyL6Wud6SVidJ3AASUoxpORX2w0U/iiGgPqmn2BWWm9Pklx0y6hEI+ZLjWyc0pGLIqqyY5h8LPqAcvzzDn7wmW9FvG9DrTUgjOMrBIFbpwn8rWgUpasGRfuSPW3CQdJq31UMN8NkA9YXMvWddqlb3Hk9KTdseFGOV3N4f794ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cow4Ee/eldGQKE8TcB2/TyGw1p+U5zfANcUH1l9/wyE=;
 b=HSeMfhfFdtuuw6Ex2zaNGe2AWhTSjnb4iEgpoORg4d9d6GPc50COJz8Vxdh3DeBXqC5aLfaGKYOHKk6hTTCRY71cqv2LcM5VSjkLP9/AXkDaymECdFRQmCFTWohSuZeO8kAgHDQa1D+yyhuVVSXJviVD94GsVlHSsIvHtsedbBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 16:46:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	Steven Noonan <steven@edera.dev>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vpci: zero guest-visible BAR addresses to ensure
 domU asssigns its own
Message-ID: <aahT5DCUDFV833oM@macbook.local>
References: <20260224231216.6203-1-ariadne@ariadne.space>
 <2aef1aab-f1f4-4063-8c61-d26ae335d06f@suse.com>
 <b4a839bd-78f0-4fb5-a7db-dfc2f4ab037f@amd.com>
 <c7b3174e-83af-48ca-854d-417fbc3be90e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7b3174e-83af-48ca-854d-417fbc3be90e@suse.com>
X-ClientProxiedBy: MR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: b885b062-304b-4547-fe05-08de7a053efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	+EbYmSRsuSWaBMUmDyHGia1ChwqwMyJD7lTS51EBQRva0uMhEHaOMvUBued/GZCgM/N8FcHdc7xJaNoiK0VF85Sq6npJL8nrl6KyqiiQsXMFswX5vCTNt3nG2dBQzTY+pxuSSF79OLEpmp9e9qDXkBdvyZfUtx0zdEibElDTGr9UY4sCJkQUpdS/dhtLaVuaihq71YyBSgrSfTGr3D9k5nNPQZgIwLmWdg04v3bnYPgXgAOYV253tEXn7AbPBD6+RFbaPGMGsls0y0qEzomURyJs3mNyX8JwoE26+AuMO+hNI1TZ1nFxjM27H1f546GIMmrlOf97wf2XyvjET8DJb2hCPJFyM3vwmahwnO49DcWbu4IP75VsTAxo+irdXxSPmQmwKQIMRDH49LFhcauAR7Lf5kFZMFI6fLDc4Uo10vhLkpz1gyntIPEDuoE6DhVFecHw42J1eNurPEx8iKLQqEpxYdv6YCW+va4aTOmWg/j8p5630sNhi8EqGUzHWCh7aY8/CwYy7VXfTCOsXNpKJ4pcBpces7dUXFaj3uvpXREiQQUL0/9CuM6kbyekyypemyAzc2TI9YqbU9fC/venTlCkomrunWXlgloKaOHMMo7pGOiEQ88/bEEEZzEx0C03/gcUnDcUREBev25LBTOqfuA1UPSwQYqDhW3VYC79jh/LmsGk0vK1VENnIF/9DQmlonYQjETMseNIqwz89L1yd5QSzmLHlpegmiQglyRIdk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clRXMjBMVWYybTl3OFl4bHZsb3N5RTVnWGlCbDFNYmtCdGViTFdQVE1YTWo0?=
 =?utf-8?B?OUd1aWRBTXJyV1lqT2lvczJhZWdDTjlBTlNkNm4vZTdYb1N3clVDK1VsQ1hX?=
 =?utf-8?B?T3BIeEVXNFpDYnNEUENwblZNUXAyVDBMSXNUYTB2Zll0Z2dJYmFZeTVXUzNY?=
 =?utf-8?B?WVo2SEpKL2tuK2cxVVA4QUJQbDBkdnhmQXZFOEVYVS9INEtPd0hyZWxUUnhO?=
 =?utf-8?B?N1dhZDdjUmN6aFk1YmJyM2tDNkJ3ZlY0TnNVTE9ISFpjNGNFanRtRE10MmlX?=
 =?utf-8?B?LytvZnc3K1V4ZmlrV21LRW1wMGlVT1VlSkcremgzRmZ1bHNNWTRSRTdwSzcx?=
 =?utf-8?B?Z1U4ZytVTm9iOGd4QU5RbkZhWkV0dXpQQjlaQVl3OFVrT3kvTEhxTFNPVTIx?=
 =?utf-8?B?ZWZEYkZrd0dhdmwzY2lqaGc5R0Z0YkRXTEdickZYZEV2eWN4TElwK0JCLzIw?=
 =?utf-8?B?Zi95enEyWDgxc1RSbXFKYlNZL0xZL2h1akJBcVBwU1NSdDZqWXlpTXpycHAv?=
 =?utf-8?B?c1QyRkFxSCt4UDE1Mm8vTC9GMTk5QVpaL21KY3I0OC9iWkZDR2MzZG5pc3g5?=
 =?utf-8?B?QXVnbGdKLzhCQVpuYTh0WjJ0ZkszU3FvVTZvb2YyLzVwUjYvd0VDdTUxNmVG?=
 =?utf-8?B?c05ZY0pkcVptdVNwWmFYY0tkN01oZmk0d0hlVkdVaFdpOXp3UjhySmtrQW00?=
 =?utf-8?B?bTlqRWVWN3QyaEIrVENYMXRQUEx4aEN1T3RxSzdRbzhheGlLUFBRcTdDL3Jx?=
 =?utf-8?B?QytEWlJrSnlIMWtYTjJqSjU5U0sxd0JUWjV4bitnR0RLcWY2QXo1aGJaVlBu?=
 =?utf-8?B?YXRZN0FJcU5YRHNmSFZaelREa2JtenBLL2h5Z2NGS2xXcUJVRldwVjRmdXhG?=
 =?utf-8?B?QUdqNnREYnlESGtvRGFGQ0RJYVdOZC9QQ0tud241Y3M0UEZpa2JoSWVKdk5B?=
 =?utf-8?B?UlB4Q0lhRlpXZFk1NnpEeDRQT3ptL1NNdVFFQnduNkhIb3Roak9HOG55ejlh?=
 =?utf-8?B?TDJCMysxV3N2VzlQNkc4Mzl0dmtVaG9jTWZBazArM1RnMnlSLy9XSnBua3FL?=
 =?utf-8?B?S04xV0VOeGl0cTdWQllVcFM1RDVNZnBmRmFUZlRCWFJocEVtbG1kNG1SaHpa?=
 =?utf-8?B?dGNuVU0zaDZNR252SDNNaU9SRnNSdy9qYTVFZk1ValBsek5EMXViTFpTNk9m?=
 =?utf-8?B?bm90S25TSTRjS0ZnSDRabUxLbU5HR2UweTV2UEErdlhMMlRtUm9ldEZURHp3?=
 =?utf-8?B?bG5mQW1HNVAvdklIaFVnODFLSE0rMDFFN1BiUU5hVCt3S2hwdGFiSlVTbjJw?=
 =?utf-8?B?OWttblg1ZURZRHQ3SCtVaWtPdUNSZ0ZFZ3VudzRqdVpmb0RXUG5sNy9OYml0?=
 =?utf-8?B?Q2xlbVBPNWx3Q0t5SEhnVytNK01NT1dLUVBOVEw2Y3l5bkZKVi81ankwVHdP?=
 =?utf-8?B?YWhNQlRVRVRCZmJJWi9lcXFMNnhlVEx1NGd6cGd3QU1hTTVXL1M1QWlxZEpE?=
 =?utf-8?B?OXkyclM1STVWdUV1bG84U3RSeGNuSGpoL3VNUzlFOEpiR0pWUWo0YXhPdGE2?=
 =?utf-8?B?Yzd0M3lGczBOVWZ5Tk1LUWVPOHRIQnk0cEZzTi9Nay9jdVpxalpRU2JHK3JJ?=
 =?utf-8?B?QTNZTEE0T0FOWmFTblQ2MDBXS3IxODRUNC9oRy9TdGpoRXNpUFN4dVUrRUlp?=
 =?utf-8?B?MmErSXBndmRldXZFU3A2TEhrRlNnZkJGQ0JqQ2FsV0hsbjl1NjVqbkRkZnBY?=
 =?utf-8?B?bVRCUXlSMlRjNkEvYVc2NXJHMThqMThLK0l3YTgwcVJ3S0N5VHJqWjBzMmJN?=
 =?utf-8?B?L29YL0FWckE0Z1hlcis1dEZuMTBFR0pyVUZkY01NbWUreDZMSTNUOEgvKzd4?=
 =?utf-8?B?NnN6N2t5QUtteHc5bGFKdzVKaDA4bHNQZVhXc00xQ2M1ZFhYem5mR21wdzMw?=
 =?utf-8?B?cGRIYnNmRmIxaThtcEVJVllKNnNVNjVaQ1RjTWhVNlpFcVBjNWJLMTFXMzlJ?=
 =?utf-8?B?ZWNUZ3huNFlZNDF6am1BTVRHSDF0OFRZa1poTnNEK2FEZ2YvaHErd01LM1ZD?=
 =?utf-8?B?NHFvYUkyS0NXYUlHVUZTYkNtV0FhSjJIK0l6dG8vQ1dicFRQUWlad3R5SGcr?=
 =?utf-8?B?ZnFmUEZYYXRCTVprd1VPV3RXZGk3eks0YUF2WllLWGxQVDF3eXVSUitQKzRl?=
 =?utf-8?B?b3lnUm12VjN5NDFOWnNkOTI4WXU5eWxXSnNvWk5LZEh4MEJjYUtVdTh2b01R?=
 =?utf-8?B?MitRMzdLdjQ5WGxObmdCOXYweFc1SXRuMHZkNU1haldmc1JkVzJoZGhHRkdi?=
 =?utf-8?B?U3IwdjdLSjBBRDU1THZNOGEyREt3cEdvbng0MzRnTTVZVzNXdjBVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b885b062-304b-4547-fe05-08de7a053efe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:46:48.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hSRGCRhMH2guKCJbtJi/Tda08vliCKXCr3GYmz3lrVreQ25rVtQ5XmO5Vz8yu3vgUxLk8DcglAahI0eQeprhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7341
X-Rspamd-Queue-Id: EC3C62032DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stewart.hildebrand@amd.com,m:ariadne@ariadne.space,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,edera.dev:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:47:52AM +0100, Jan Beulich wrote:
> On 26.02.2026 03:50, Stewart Hildebrand wrote:
> > On 2/25/26 10:37, Jan Beulich wrote:
> >> On 25.02.2026 00:12, Ariadne Conill wrote:
> >>> From: Steven Noonan <steven@edera.dev>
> >>>
> >>> If we just use the host's BAR addresses, the domU might not attempt to
> >>> reconfigure the BAR ranges and may never try to map them with the IOMMU.
> >>> Zeroing them ensures the guest kernel knows the BARs are not configured
> >>> and needs to make its own choices about where to map the BARs.
> >>
> >> Yet for this, don't we first need to expose a full topology to the guest,
> >> i.e. at least a host bridge, and maybe further bridges?
> > While we eventually do want to expose (a) virtual bridge(s) to vPCI domUs (this
> > work is currently in development), I don't think it's pre-requisite for the code
> > change herein: clearly, leaking host BAR addresses to domUs isn't right, and
> > there's no need to wait to address that.
> > 
> > With that said, the commit title/description don't align well with the code
> > change. Assuming we want to move the code change forward, for v2 of the patch I
> > suggest dropping the 2nd half of the title, and reworking the commit description
> > to focus on describing the code change at hand and less on what the domU might
> > do.
> 
> That would indeed work for me.

+1.  The "try to map them with the IOMMU" wording is not accurate
IMO, and wants replacing.

It would also be nice to mention that zeroing unconditionally is fine,
because for domUs the memory decoding bit is also unconditionally
cleared, so there will be no attempt to map the BARs into the guest
p2m by vpci_init_header().

Thanks, Roger.

