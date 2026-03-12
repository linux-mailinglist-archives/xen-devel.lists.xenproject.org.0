Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFqYIhx7sml/MwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:36:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F069726F012
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251816.1548678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bWm-0002NL-Kx; Thu, 12 Mar 2026 08:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251816.1548678; Thu, 12 Mar 2026 08:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0bWm-0002Kh-Hv; Thu, 12 Mar 2026 08:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1251816;
 Thu, 12 Mar 2026 08:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNLd=BM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w0bWl-0002Kb-KR
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 08:36:19 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8954db79-1dee-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 09:36:17 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB4924.namprd03.prod.outlook.com (2603:10b6:5:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 08:36:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 08:36:13 +0000
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
X-Inumbo-ID: 8954db79-1dee-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u87acAxyUs7S3MxLsjGLjocEjlUE1JZtoiMQQKMr+csZ0oU9o3oj/jP6m6C8ZiM26lbF03tDJMzHyJHnpVayi1xyO5a3YWo7fEeaubEnOwrGNNlYK/snZZd1o8T50r+d+14w0BzTHqZDuYfQErnSf+EXNqklJsVh1Sc7evjHLiCJyCPqAPUqz1+fZmd3SyGH9QwLpkQ4PdLV3K2w8X36pjS530RYVt9f8fra+X7ycUs4zCF/2bTrPjowWAN1mKtoUqTlX7yszibOUQ4FNHB+rIm+uaX8jFSBijmdhqdfDQqUNT7u3pmHNEg2yZBDPINe70ugmSgk5IjVZsyu7om6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EAaLruJ0j1AiI5md8lI1uSD7PkKz4SyXqT8+Jd3YB8=;
 b=AxPHg7kT6LlvnUdjZko90ywKF7hIYPo0A8Ms+Sqk7sOXIYLG5KKyPleyGU6p56H/xLQJOxPs4Y7/9EZX03PKRpyMjUJYLUVkciM1lK9xrn4DAMej0T4HhK/pTdv8jQ/ytNxUGdIPzF+z7Gd6im1/Qyd0/e74A6NNbrb0XT6Fl5uCnurxeYBfrr5v+mfcBjjDt3QrbXOafNPJzF5Se4DUOdV5+RvzrfZnHB2cCr/02W8YIM+SQbNj+4e/pOnJPx5LaqztMH369SBid9RcRNFyKC2OPju4FAFHX+p8X0KogBAhd//ehYLHR4e2E6kIdE8C32ll8awjq4I5f3MzBtz3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EAaLruJ0j1AiI5md8lI1uSD7PkKz4SyXqT8+Jd3YB8=;
 b=pUBtlurG9yQ6h7AHGd1Y76y+Zt5RMTzfK+BiNXiOsDv4snTB0q9OTgD9yIU0VJ/2u5vOgEGFt2pt5sp3av/srvq68pRB1OmuYMdh7Km5gFGX4fpAorARSzy6obqY0mk8yUM+/uj8IeQKgOgoDaNtpYLt9FIwm33ScAIK6iHT2pM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 12 Mar 2026 09:36:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tests/pdx: fix overflow from conversion from page index
 to address on 32bit
Message-ID: <abJ6-vXv-4vVSkGx@macbook.local>
References: <20260312080206.52648-1-roger.pau@citrix.com>
 <bb3e166a-9842-48d9-8170-ab5e4e53c57d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb3e166a-9842-48d9-8170-ab5e4e53c57d@suse.com>
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f909835-1b20-4d6b-c6c0-08de80126b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NNOx2jbYAchbyF+1HPi8p3Na49L8HY8RfJkAtcYiTvJVMP+3y7vCNDmAcPMb/McFea4oWTkgdqxpSwgO+56vNkye1MHNcB4jIpcbNckgE0fNpEDsW8uPDKMv9BWpPZGjml40G9ko4qkEcNJnAhf6H4NtrzSuNiAxwYfZPswUN6FK4+JLnm0WIcVfVgM+ack12u/uUApGpO4nCNtDHchQCebvbCtErDAccGCiPpIx7rtSR04giKR4UrcUeBp795DH45MrCtvhnmPtIdtdwUTAKUDg02B6M7whSn6/rFw9//7wAT7oR3AIj35GEsgOCSwanr3tQu6MBY98K+/CsIWgIYJP65jIeiXyGnkNFINQS+8n9x24paunP3bC7firXE3Ie9/sRcoLi6nK4ESAv3g58PpLn6rrFaSueim1ww3iWTJ4Z/Z6C12DJTZRJOTVDxsRWdASoFzAHpyamYbjXUkiEHRv6A7MioY7jI2Px2fo+BkIsurfVB2SeofPr6MGg2yK7aPuBADlly/QbdBMgW3wgvjs9j/WxttBMLRTweA47eYp6CvjyduskBiBV7swzEA721wmky5lLbvjOCUQxi91hwMBGeUmGNcNMLHhsjfRyVlCZ15abmkvYD/ncnkT9Z6hZ9BB4AADMb5BellKzAYj9lOtKdenm4eeAZ6aFgiGGytgsHHHJcIYudQi4j/q04eYPDiB6kU/cdn91k3svk8BSQ4MDE0OLYybEczC87lkOaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFZsS3ZiTnMrNG80dTN6Mm1YMS9ILzNWc3ZtY0EzcTVYdXlmT3VRL0NlQUpm?=
 =?utf-8?B?RzNRaVpsWFJmUDdZNTNIVnZrYnVFQSsxQzdZbFhkTk8xZ3l4bW1VYXdnR2Fz?=
 =?utf-8?B?cGIxdGFjYStEZTJkNEVOU2QvbisyWDhTeWVxUnRRajVnaXV6YUJ0RythSnFB?=
 =?utf-8?B?Rmp6b3FrZ1Y1U1VwT3BDOVQ0dWZUMGcwcG51K1prdDhmQ0NhejdLYm5xcWdU?=
 =?utf-8?B?WXVycERFOTRwZlliVVg1Sk9oQWVaTi96em9wYXdhRWpZVjdpTFkvNXlzNDhE?=
 =?utf-8?B?Nk10cmlMT2dEeWNmbWVCMC9HOG1DZ2tMSTMreTA0TTRZSWQwaGttVk5TUmNq?=
 =?utf-8?B?TWh5SXFGb1ZrRWdZaU1IWkNLdFkzRnk4ZVdaVGxITUNtY1BOUng3ZkcrMHVm?=
 =?utf-8?B?T1NmR0N2NngxdXo0QVBEeHdUTWVCMFh0QTFrYWRCVDhBUzZ3Q3ZvR3pwSjdM?=
 =?utf-8?B?M2dqOUlSN2ZZdlVteUdCSWNpZlpHSjJyWEdPY0tVVVFRejJaSkNRaTh4YnRr?=
 =?utf-8?B?Y3ZsY2JaeTlKSEQvRHh2SU44Q01PS3lMOUJjYlZaNGs2UmljMXBPYStpYWJy?=
 =?utf-8?B?bTdJVWVSTU1pczBjczlxVTlFQkdWYUNWQUp2SHdTSGo3UDc3QjVUcHdGODF2?=
 =?utf-8?B?WG9TdDZUU2R0MjgwdmxyS3FtUFpEZkpyakE0dk12VzlDeGcvbWtlQjFuZWU1?=
 =?utf-8?B?YkJrYlV2Q1ZvSGF6WldKbUdreVBUOXp4UmgzdlZiSmM5aWZvcW5sK3dmL2xh?=
 =?utf-8?B?UWFueW05L25ZdE5DdWNWNy9Vc0JpWnlvamhrclJiZUJCTkd3TEU0MFhpTWJz?=
 =?utf-8?B?YytMTDBDbG9WeHVIWDZQOGZBSHU5N1hXcnRrRXBBcE5lcWdSbkppWGdBRzNt?=
 =?utf-8?B?VFRJeEtuWVhwUkIzWVVaeTc4WWthMU1UUFhmNFhic0gyT21ZYVM1ZG5jZFZP?=
 =?utf-8?B?dEwzTitCT0ppTG5sQ0Q1Mm1BV2huL2V2cHNnMTFaWXBLbFNTWkdYcGJYTEEr?=
 =?utf-8?B?Tm5xWk1SckpDWmYySUk0ZmJzb2c2QThUNW5qVEh4VzdsUmpPY2I4ZnhKd25I?=
 =?utf-8?B?djRNeVA0Z1JyVU5FVDEzNGk1L1JOWE44anBwOUFYeGpGZWs4cnV1bU9ZVzc5?=
 =?utf-8?B?SUllbmRwVTg5ZHZ3eEsvYlg4bUJickNIOURGY05LdDdkb3pKa24zcHhXTGlv?=
 =?utf-8?B?dW5CMFVwSnJpNmx0NG85aFhFRG80NDNjb0Vic1owREU5U1YyRi96SWtNWGNu?=
 =?utf-8?B?VzI2QWVxMHJFRUZ6L1FEdVVXanpZU3BKbHZUSjJpbTd2Q1Z2dko3ZXBZV096?=
 =?utf-8?B?dk5LdjB1NUZsN1BHU2lVVDYvK2JFYURlWmdIcWs0YlY5c1NmUVVBYlVnOXdp?=
 =?utf-8?B?ejI5K2RFczhvWFdQVm9kSm1EUENUMTAvd0U1dHcrUlMyWTNRWnhqdGpvV2xw?=
 =?utf-8?B?RG1icDdLOFFWUm14NlVOZTNMeklKM2s5S0lLdWg5UUVKVTFSalhmakVtQzE1?=
 =?utf-8?B?NjFkNGZISmhqYzN0WGYyOXhtUTZkMGszcVVKZVRNRnRzakRCVEt4c3hvcG9G?=
 =?utf-8?B?eWdMWTY0YjhSeWR3bWZHbVBhUEdYK0ZTckRJNjJ5TFpUL1VRTmtENStiOUgw?=
 =?utf-8?B?YUZHdWlMTEV5OGdNdDhkK3FOK1M1d09pRFdpdjRoMDdHc0k2SVBHeDNFcHVC?=
 =?utf-8?B?U25OR29lb05tV1JZRUk4RGw5T0FHbW9DbWRvanNZMU5EYzFLbStvSjQvNW9x?=
 =?utf-8?B?OHVSUjlDZGRHY0F2UlpDT2c1TEpFRkhRRnNkY0s1TkJ0bDRIVkRrYUhFY0dV?=
 =?utf-8?B?QjdWOE92MXN3NkxHL1pEZDVyVWovaFVhcWo2bGE0NmpCRkwxZWtZdG10NTd5?=
 =?utf-8?B?WVFsVzBBN2tSc0FxekdNd3JvVXNKY0RFdlFvcytyOUpDYlFmb0J0Tmd6bGVS?=
 =?utf-8?B?Y0NpMVVXYk4zeC9uRVE3Z00rbkVwVlBIcHJ6emFhZjVzL0hZVUhFNSs0OUZ0?=
 =?utf-8?B?VFlwRDg3Wk4rYWozNXBldmk0TU12SFFRKzh4K2UwMGhjOWQ0djZtMG05SGFL?=
 =?utf-8?B?aW4zOThDQml5MGJsRWFqVnA5dUxQL1NRQUlBaHhqRWtEMVJQRnlmRTdjRWhI?=
 =?utf-8?B?VkNvcytJMTRrMUFabm1nVmNLVTl5UWIrTzNkbzRyTENxNXRmK1Qzb3RjUm1s?=
 =?utf-8?B?VXQ4Ull5eFkvQnEvT3p2VTI4V3pvYmh1c3BHbDZHVGpxTXRvMndUMm1EVk9r?=
 =?utf-8?B?eUFBNUd1U2JGd3VSN3hqcm1EN3FHK255SmRBUFVhNHBOb053cW9zUW1lY2Z0?=
 =?utf-8?B?RmV4cjFVSEhCU3c2SytyQ2kydkt6aUtaS0xiaHhtQlZhaGIvK0JUdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f909835-1b20-4d6b-c6c0-08de80126b25
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:36:13.0891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMjktjKnSigqwsbwvYZUkEhpJ7TpMCpDpDd00VfTChoakHU3+Uu6tHL1KGcTt9r24QFrQSCU+488YUqwwVsNhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4924
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F069726F012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:25:12AM +0100, Jan Beulich wrote:
> On 12.03.2026 09:02, Roger Pau Monne wrote:
> > When building the PDX test harness as a 32bit executable the page shifts
> > done on unsigned long types can overflow.  Instead use pfn_to_paddr(),
> > which casts the values to paddr_t previous to doing the shift.
> > 
> > Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
> > Reported-by: Edwin Török <edwin.torok@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/tools/tests/pdx/test-pdx.c
> > +++ b/tools/tests/pdx/test-pdx.c
> > @@ -208,8 +208,8 @@ int main(int argc, char **argv)
> >              if ( !tests[i].ranges[j].start && !tests[i].ranges[j].end )
> >                  break;
> >  
> > -            pfn_pdx_add_region(tests[i].ranges[j].start << PAGE_SHIFT,
> > -                               size << PAGE_SHIFT);
> > +            pfn_pdx_add_region(pfn_to_paddr(tests[i].ranges[j].start),
> > +                               pfn_to_paddr(size));
> >          }
> >  
> >          if ( pfn_pdx_compression_setup(0) != tests[i].compress )
> > @@ -233,8 +233,8 @@ int main(int argc, char **argv)
> >              if ( !start && !end )
> >                  break;
> >  
> > -            if ( !pdx_is_region_compressible(start << PAGE_SHIFT, 1) ||
> > -                 !pdx_is_region_compressible((end - 1) << PAGE_SHIFT, 1) )
> > +            if ( !pdx_is_region_compressible(pfn_to_paddr(start), 1) ||
> > +                 !pdx_is_region_compressible(pfn_to_paddr(end - 1), 1) )
> >              {
> >                  printf(
> >      "PFN compression invalid, pages %#lx and %#lx should be compressible\n",
> 
> Largely unrelated remark, from going through all of the PAGE_SHIFT uses: Isn't
> the __LP64__ conditional excluding quite a few too many array elements in
> main()'s tests[]?

Hm, I think so.  Will send a separate fix for that however.

Thanks, Roger.

