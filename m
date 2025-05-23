Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF703AC2A9D
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 21:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.996163.1378052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIYQS-00061M-RO; Fri, 23 May 2025 19:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 996163.1378052; Fri, 23 May 2025 19:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIYQS-0005zN-Of; Fri, 23 May 2025 19:51:28 +0000
Received: by outflank-mailman (input) for mailman id 996163;
 Fri, 23 May 2025 19:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jiit=YH=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uIYQQ-0005yv-FO
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 19:51:27 +0000
Received: from 19.mo550.mail-out.ovh.net (19.mo550.mail-out.ovh.net
 [178.32.97.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f1bb8eb-380f-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 21:51:25 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.25.252])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4b3wlJ6W08z1X3m
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 19:51:24 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-64jxq (unknown [10.111.174.252])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1F4C5C0172;
 Fri, 23 May 2025 19:51:23 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-64jxq with ESMTPSA
 id Hn3EMrrRMGjqVwgAy2U9Ww
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 23 May 2025 19:51:23 +0000
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
X-Inumbo-ID: 4f1bb8eb-380f-11f0-a2fb-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-99G003418991f1-cdd2-4265-b496-d9e85f61f423,
                    DECC013598DA6D3AE1F8C2A8A824853595AB319A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Fri, 23 May 2025 22:51:08 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aDDRrOviNNSvFig8@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <bf892a80-fe3c-4163-b857-9d073a093451@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf892a80-fe3c-4163-b857-9d073a093451@suse.com>
X-Ovh-Tracer-Id: 15112954452181103705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeljeegucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvgfevgedtfffhudegveeiheekteduveeffeegtdeljeelvdefuedtteduieevleenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=IU0l1u6qAv9taEL9PpuZcs9iUvtNe4BnrJAHTbXWExs=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748029884; v=1;
 b=BTcm2TGRE1fervoCyUPfX8bgXPIedzP1NnN43e43cabsVJHLVhITqbwFiJemaUGPDd11/ZOu
 BxeO4j+Lf2srB+OAFEznAD2buTj4y0itIvYwYPcgRAiJo46dWO9/ZMG0V7QGu5SwV3Hy5dlIVVb
 hL01aOBKLhNYlGJWKGQ6yLbAiYZUTpVGHtOBpiwcGa22TJynfOeQtjxKHSOQcpL/KRXZRGHHOqg
 Lr1Rhte0/xa7SxYlVUrGoepg+ubwQSaRC+GQfFC3/M5+B7QgX+J9iooVKXddf9z4sVxRA2WNeLd
 XrfGGYFLf2rDFTxok613F7Mt+Kaq3HGE4gIXVaJZnpCHA==

On Wed, May 21, 2025 at 05:19:57PM +0200, Jan Beulich wrote:
> > +/*
> > + * The same set of registers is exposed twice (with different permissions) and
> > + * they are allocated continuously with page alignment.
> > + */
> > +#define NR_TXT_CONFIG_SIZE \
> > +    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)
>
> What does the NR_ in the identifier try to express?

That's a leftover from the original name inside tboot.c, I'll rename it
to TXT_CONFIG_SPACE_SIZE.

> > +/*
> > + * Secure Launch defined OS/MLE TXT Heap table
> > + */
> > +struct txt_os_mle_data {
> > +    uint32_t version;
> > +    uint32_t reserved;
> > +    uint64_t slrt;
> > +    uint64_t txt_info;
> > +    uint32_t ap_wake_block;
> > +    uint32_t ap_wake_block_size;
> > +    uint8_t mle_scratch[64];
> > +} __packed;
>
> This being x86-specific, what's the __packed intended to achieve here?

This structure is passed to Xen by a bootloader, __packed makes sure the
structure has a compatible layout.

> > +/*
> > + * TXT specification defined BIOS data TXT Heap table
> > + */
> > +struct txt_bios_data {
> > +    uint32_t version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
> > +    uint32_t bios_sinit_size;
> > +    uint64_t reserved1;
> > +    uint64_t reserved2;
> > +    uint32_t num_logical_procs;
> > +    /* Versions >= 3 && < 5 */
> > +    uint32_t sinit_flags;
> > +    /* Versions >= 5 with updates in version 6 */
> > +    uint32_t mle_flags;
> > +    /* Versions >= 4 */
> > +    /* Ext Data Elements */
> > +} __packed;
>
> It does affect sizeof() here, which I'm unsure is going to matter.

It doesn't hurt anything and makes sure offsets match those in the
specification.

> > +static inline uint64_t txt_bios_data_size(void *heap)
>
> Here, below, and in general: Please try to have code be const-correct, i.e.
> use pointers-to-const wherever applicable.

I assume this doesn't apply to functions returning `void *`.  The
approach used in libc is to accept pointers-to-const but then cast the
constness away for the return value, but this header isn't a widely-used
code.

> > +{
> > +    return *((uint64_t *)heap) - sizeof(uint64_t);
>
> For readability it generally helps if excess parentheses like the ones here
> are omitted.

OK.

> > +static inline uint64_t txt_os_mle_data_size(void *heap)
> > +{
> > +    return *((uint64_t *)(txt_bios_data_start(heap) +
> > +                          txt_bios_data_size(heap))) -
> > +        sizeof(uint64_t);
>
> This line wants indenting a little further, such that the"sizeof" aligns
> with the start of the expression. (Same elsewhere below.)
>
> Jan

Will update.

Regards

