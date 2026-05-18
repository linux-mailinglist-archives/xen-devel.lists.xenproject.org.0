Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GqmEZPGCmqg8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:58:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C02568433
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311633.1581742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsrL-0006KX-BF; Mon, 18 May 2026 07:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311633.1581742; Mon, 18 May 2026 07:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsrL-0006J6-8X; Mon, 18 May 2026 07:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1311633;
 Mon, 18 May 2026 07:57:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wOsrJ-0006J0-Gn
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsrI-008tHw-JA
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:57:52 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a0ac67a-2eae-0a2a0a5409dd-0a2a450886a6-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:57:51 +0200
Received: from [52.101.229.125]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a0ac67b-63b5-0a2a45080019-3465e57d41a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:57:50 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB3189.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:57:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Mon, 18 May 2026
 07:57:44 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsG4fFyd+G+MLfhTJLCMYoiSXopInfMcH3RerX/yMHns5PokSnJjQyABPaAJ6v4NiIYdW8XxgHzA1sfKYffEp8nl7eopohfSqEbp9TeKAQDRRGXTZ7sto6y8EyXNhaM2ryalsxFINvyrYK5Cl5+yiOPZn2y93P9n/DO8AVAx+SH8SRRStcKncUZBTygFKCzswe0x2d8wNVZq8Ff5RjuoLVBgGZB7dkEaLyaib3sM2l6G5PSr8MYco2ZD9E9X3Qbz6i16UFtalwfJhyR7KJyACldOogQGNTVer33LtMmu3yI/rzEOoXNoTeZQTNJJd4bcTvI+IsTZmy3KQdsgernzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBD2kXHfYMc/Ho3qztxaqgHW+GG5GprB0vPVQ6gxcqA=;
 b=mrxzpBPqzBc4/PH9cq3svr4GbuDCENPdq9p0Ts05ls/c6ORuinXNSm97t79fxXk821i8BXeeQ/PwwdpbwllZwGSQJJnUw56XKD+qOrbFEmirpbXAr4YtOJFSMGskKK4sIbenwtK3/ttbF6/OISeOxtD8cwg2xmYRs1LLBODCM+WVAAvwz3JjzT6XB+X96nTTfX3Bvl8tqF1f7FJ/43FqHwemA6wBYqSXUmk3WKlwv0Rp9fPpmjY7Ept3Llmrsy9egQ9E0nf6g9vKOxPi+4uPF4u3+xQc3QppHZifX2/uqllTQJ8cpQa1FZIiSdN/kAJ6HHu4hiGryLISSTYnG+oRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBD2kXHfYMc/Ho3qztxaqgHW+GG5GprB0vPVQ6gxcqA=;
 b=L+VQQljWN/h4HmKkxZyY1dcuWByG4R1XWWzYHiwkZ85tUs+4SLzeaHu/IP6HIlYtc12tJxKvvWxvyg3moT1sV0mboKXneEqkcXnFGRWFAdEm6cyQKNym2X15e/Ns/3OGkuund6zQpLm2nPVSv5GhR4nlO8FO+GH7HTkbCexaWT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Mon, 18 May 2026 16:57:43 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	Juergen Gross <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v1 24/26] xen/arm, tools: add domctl for Realm
 finalization
Message-ID: <polfm7zluc3xud7hbfjs5tqradrfbsy7voqdlkxo2d3uyr7wxf@t42nyrawoiwu>
References: <20260515040812.983626-1-den@valinux.co.jp>
 <20260515040812.983626-25-den@valinux.co.jp>
 <843895bc-75a9-487e-87a3-2e11492faf3d@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <843895bc-75a9-487e-87a3-2e11492faf3d@suse.com>
X-ClientProxiedBy: TY4PR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB3189:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc48102-a2a2-438d-b11b-08deb4b324eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|22082099003|18002099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	tkOFtTYSaxGQDsJJeGGhMt+t22XvqBF/b8nmMY+b7LxwLIs57uuJ5+Stj3ZVhHmkeq29twTSMGu7tGqH10GetBYY0nux/VirDlStH+PG9pg6kQDzp3TG43q8L5FRm0/llWyrJi+hDl+J/5DlMhHWdttqlcA/bHzEbs3IvHIciHJhGmcUcBPHKZqvg8t5aeGj8E7ytLwBYs0C9QEXnyUR7iKP0M1axFAOXVNgf2eBhkYlIbidQRr2cWBeewSDqdyvuPV85yZDF+ALSV/3gNoB1zBp3j8wvCT6ObwgWyPwOlGWgfk5kXU33mBVmA4Fab5zV/7zPFDNgEdPB2HLDmqa7HTJH1qXGfwDoXZ1thd0GO4vn4a4EOwIxIC6BpkwUsNiRW42+pQtNeUYh+HbkxVHvF9NGHvBs8zr5Yijwe+1uAKDQoQl+6qsOA7kPUtA48PlVJ66koBdyuVw/nyW1o4dXXjW48p7/sNbHBlWVn+TqgL1p9sQQn+IiIVeKCYamFIqV4JNv2c2iODzekMvK8A6f31Kta8jcfeBp0nlqId1vH+fk+sI8Luk2TRC6cLhQO2/oxnzpThpKajuRloSrI5oPrP+289SWRDt276rM3UCr6XbnSXBM1AxMgYF9Npbzj9wLN0Hxh7Ra8cPWd+TBchAqlGPVvc9OVDVS6tW8jFoniN7ZYNn9GEGkuRF+6XT8MDI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RgzSIM9S4Po9pVN7KkqYN+3gBAyRB93MABYyQzfW6nF+x2CK6cEF0XvTHKeM?=
 =?us-ascii?Q?O39MUBHJNno1a7RrQCa5XljjoTjMPXpHObt+iOUk8Eb/b1xYeCc/040uxk6a?=
 =?us-ascii?Q?RwBQkkiNm1XaLu2TK6RUH7Fbr181HjvJMtDGEexFUtO1z/CkbzJP3BZPN3tq?=
 =?us-ascii?Q?tlFu64ber0Zq/7zSHYuYEg8rZXVCxGlAs2EhVOhlqhLlvZ61Hf9DQ/mDl9u1?=
 =?us-ascii?Q?VsAbPYtL8FqzThoGzDh3+liuqnRgnXFzEtAQY+wCC6JsdotN64kLlhF2pgf0?=
 =?us-ascii?Q?KRNfcHzvp6q0kts/zDL2gqNGIMUL7pQZFmZFGQott3XIASpEMvtLSi7A2vO6?=
 =?us-ascii?Q?bDVCkSgrPylD5lelB3oYTCovI0dFd/3+6R0XizelZQIrZt228GSdFDP0yhQv?=
 =?us-ascii?Q?s4IBfFjzkwu++nR219bk6N+OEZdz68g9cHqRnPUgIO5AUun2zOzGvYNDW0dK?=
 =?us-ascii?Q?vAXyslOTCU8oPjkLSdecY1RKZ2ri8MNkFEw82MxPS92MbEevXAh8q37LdlZI?=
 =?us-ascii?Q?arX45L4QLI2cUfyOc15Sowqcn0ww7hDznIuM+HRnQ1g3U+FQHCT9M/wFEqmj?=
 =?us-ascii?Q?LAmv+61cUxgU9abbI1kZeSPS57ByJDKdxmi//VL4EmZOUeNMpxEpnBPkPBMZ?=
 =?us-ascii?Q?j9W242GmeyPvMWy8LgtkRMXKMc8aJlAn+Td4fKdHP+K7wu4HCTD1ILu7/da+?=
 =?us-ascii?Q?Cw2TgeUjk55QThFe6y0iVDB2rB4UQ8z00NR9pdsW8tg0i0Ntc+bjHfo6L6pM?=
 =?us-ascii?Q?JB3bP+x418lyhBHfceGSts2Zjco3O3k/z5rr794NQI4zOKqE65FTohf8nKjo?=
 =?us-ascii?Q?bc66lPay8Fj5VM4xddb/7wJi1fwM5pzvL69dz6EQlFDnUMvHW8p3CfWPZ0TS?=
 =?us-ascii?Q?IXR4NtC9+5flnsqe2RZWgTZwyiWfTKSLvbGwP/JEDPOG/zCy91dxIOYm9yZH?=
 =?us-ascii?Q?jsmu7B3PG57r65p6zqj9W2xquNGisZlqK0X5WJ30pzzMvibck0X4l7ttXi/b?=
 =?us-ascii?Q?VZDeVGcS8+OdeMqx1Volucgfdwl/uyJhWBQYKkByYKpM73aJ9MJS9i5/tZwa?=
 =?us-ascii?Q?82YXH6zaNgTshE4FteT+oV8WzrtNuYJ2jPYBgdBXipIAjtucK5NrIWjwI+Wj?=
 =?us-ascii?Q?Yaz5loSM7sjOVJ0wANi1/ORcQ/NDeMdbJPUsI56hykrQaT3DFG7a5ttWj3fb?=
 =?us-ascii?Q?XCqZ3XMEZ6iymTf10B6OXwKjne0maXlRGDpvnxswaA8HgBHsVkHP8Hipi3u1?=
 =?us-ascii?Q?nutTq7Ni0J/T3bVa8C3zLL6LMwOFDqjqghuwk/ZWTeHvnTtmn1pXIPNpSGZ1?=
 =?us-ascii?Q?q0MNKZ8ZX5LgsVtCBzLtPuQxiyI783lJR055ZG1HL0zqnnc8GFWPuzn4eTXq?=
 =?us-ascii?Q?h04JmtM467YriI9qrM7zbpe/92LnGPuVSNNYrk4n3w/wuc4AwSDGTWf7oLgS?=
 =?us-ascii?Q?cRVnv7TdGRSbCOW3SdWQp8aTiFUUcJ+snR4BVk66fzeZ0ppThmEoe7CSFUTr?=
 =?us-ascii?Q?JTObzZVJT8LM1EuS+dAyIAq5Ozzc2JlsC9gex4JRLfahD607YMPnvmg0JCce?=
 =?us-ascii?Q?qyK/kCIHiTDJ65/3EchMI2tVi2w/5+nVMabDuTFH8j8MovX0AmEZ9brNKA6F?=
 =?us-ascii?Q?IelwfIiKiizLmm1Yc5PSCUd793iBJ9+d6N/HdVz8wig01fbcBIsY/V6M6Exp?=
 =?us-ascii?Q?bkbSEkrz+tftOrdhQNmyWhnHRAOG2JFzReyle+jRmkImfcA5NDN8gudPYcNB?=
 =?us-ascii?Q?mYzzkFGJOwMXCnTrk2SwWOx0zVyJ0cuMSSfBUqFM4VWkUyB7kXed?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc48102-a2a2-438d-b11b-08deb4b324eb
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:57:44.6383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gzwklAnnnspfzmpKQAmkNlCWoto3GVr4/WdRYTfNlHmuupHs9zhXO1nozhcflyaYvVJw69zQWUlww1ek4FrqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3189
X-purgate-ID: tlsNG-c1860d/1779091071-BF171DB1-C1B6D042/0/0
X-purgate-type: clean
X-purgate-size: 2026
X-Rspamd-Queue-Id: 54C02568433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 07:56:49AM +0200, Jan Beulich wrote:
> On 15.05.2026 06:08, Koichiro Den wrote:
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1201,6 +1201,16 @@ struct xen_domctl_vuart_op {
> >                                   */
> >  };
> >  
> > +/* XEN_DOMCTL_arm_cca_op */
> > +struct xen_domctl_arm_cca_op {
> > +#define XEN_DOMCTL_ARM_CCA_OP_INIT_REALM  0
> > +        uint32_t cmd;              /* IN - XEN_DOMCTL_ARM_CCA_OP_* */
> > +        uint32_t flags;            /* IN - reserved, must be zero */
> > +        uint64_aligned_t base_gfn;   /* IN - first guest RAM gfn to protect */
> > +        uint64_aligned_t nr_pages;   /* IN - number of 4K pages to protect */
> > +        uint64_aligned_t rmi_result; /* OUT - raw RMI result on -EIO */
> > +};
> > +
> >  /* XEN_DOMCTL_vmtrace_op: Perform VM tracing operations. */
> >  struct xen_domctl_vmtrace_op {
> >      uint32_t cmd;           /* IN */
> > @@ -1368,6 +1378,7 @@ struct xen_domctl {
> >  #define XEN_DOMCTL_gsi_permission                88
> >  #define XEN_DOMCTL_set_llc_colors                89
> >  #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
> > +#define XEN_DOMCTL_arm_cca_op                    91
> 
> If this is to be Arm only (as the name implies), ...
> 
> > @@ -1429,6 +1440,7 @@ struct xen_domctl {
> >          struct xen_domctl_monitor_op        monitor_op;
> >          struct xen_domctl_psr_alloc         psr_alloc;
> >          struct xen_domctl_vuart_op          vuart_op;
> > +        struct xen_domctl_arm_cca_op        arm_cca_op;
> 
> ... this wants to move ...
> 
> >          struct xen_domctl_vmtrace_op        vmtrace_op;
> >          struct xen_domctl_paging_mempool    paging_mempool;
> >  #if defined(__arm__) || defined(__aarch64__)
> 
> ... into this #if.

Hi Jan,

Thanks for catching this. I'll move the arm_cca_op union member into the #if
block in v2.

Best regards,
Koichiro

> 
> Jan

