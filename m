Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F2AFA645
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 17:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034818.1407191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYRkM-0005z7-3F; Sun, 06 Jul 2025 15:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034818.1407191; Sun, 06 Jul 2025 15:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYRkL-0005xi-SO; Sun, 06 Jul 2025 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1034818;
 Sun, 06 Jul 2025 15:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYRkJ-0005xc-Dn
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 15:57:40 +0000
Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net
 [46.105.36.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efd7683c-5a81-11f0-a315-13f23c93f187;
 Sun, 06 Jul 2025 17:57:37 +0200 (CEST)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.254.71])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4bZsTD4tp2z6S6Y
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 15:57:36 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-s8dws (unknown [10.110.164.77])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4C497C04E1;
 Sun,  6 Jul 2025 15:57:35 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.111])
 by ghost-submission-5b5ff79f4f-s8dws with ESMTPSA
 id rP8ICO+camgNzAQAffsLqA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 15:57:35 +0000
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
X-Inumbo-ID: efd7683c-5a81-11f0-a315-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-111S00535af332c-133e-4c4c-9d60-3f6ee5391c0b,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 18:57:28 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aGqc6HfryKoVoLDL@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com>
X-Ovh-Tracer-Id: 11308538667948225625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=z+qPuvyq0ZS4tvEp9JBau7GuVhIvYhNWmyhlfDEwEqY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751817456; v=1;
 b=FWjxlFDC/nKITCbaVJfZ8aFyLQQHAC3QWnYIOHZPPkM9DcWS8Bj4MLLEsa4Z+OxjhDDneH/X
 UdsQHkLatcpqWWN4rreJhpIE90Kw+k08fFvumiNOfyOXhMp9uh8PGPIxi6HunBYeqRBwrACwkGH
 DFdr5cOeaMyH6ySoJHGBzu3AcQ11Qll2dN0jcn3jcnUbtnfYFesw6H/2yseqs9uOwUc4+aQyayb
 cC4vcbkTxOwI410JPw2/DM8toip4Veu1vpLoOcz3khbDDc5ucznmc/cBjmqNt+Q6rMvWMwQVo38
 QOadDKwjT8/R531deNHXHUIK5CFgycHCWVdukF49cDELg==

On Wed, Jul 02, 2025 at 04:29:18PM +0200, Jan Beulich wrote:
> Btw, a brief rev log would be nice here. I saw you have something in the
> cover letter, but having to look in two places isn't very helpful.

I don't really know how to effectively maintain 23 logs at the same time
given that changing one patch has cascading effects on the rest.  I'd
suggest using `git diff-range` instead, commands for which I can include
in cover letters for convenience.

> > +#include <asm/page.h>   // __va()
>
> Nit: No C++ style comments, please.

Sure.

> > +#define _txt(x) __va(x)
> > +#endif
>
> Without any uses the correctness of the above is hard to judge.

The _txt() macro is used right below:

> > +/*
> > + * Always use private space as some of registers are either read-only or not
> > + * present in public space.
> > + */
> > +static inline uint64_t txt_read(unsigned int reg_no)
> > +{
> > +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> > +    return *reg;
> > +}
> > +
> > +static inline void txt_write(unsigned int reg_no, uint64_t val)
> > +{
> > +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> > +    *reg = val;
> > +}

> > +     * This serves as TXT register barrier after writing to
> > +     * TXTCR_CMD_UNLOCK_MEM_CONFIG. Must be done to ensure that any future
> > +     * chipset operations see the write.
> > +     */
> > +    (void)txt_read(TXTCR_ESTS);
>
> I don't think the cast is needed.

It's not needed, but I think that explicitly discarding unused return
value is a generally good practice even when there is a comment.

> > +    txt_write(TXTCR_CMD_RESET, 1);
> > +    unreachable();
>
> What guarantees the write to take immediate effect? That is, shouldn't there
> be e.g. an infinite loop here, just in case?

I'll return infinite loop from v2.  Tried adding `halt()` as Ross
suggests, but including <asm/system.h> doesn't work in the early code
(something about compat headers and missing expansion of things like
__DeFiNe__).

> > +static inline uint64_t txt_bios_data_size(const void *heap)
> > +{
> > +    return *(const uint64_t *)heap - sizeof(uint64_t);
>
> Like you already do here, ...
>
> > +}
> > +
> > +static inline void *txt_bios_data_start(const void *heap)
> > +{
> > +    return (void *)heap + sizeof(uint64_t);
>
> ... please don't cast away const-ness. I'm pretty sure I said before that
> Misra objects to us doing so.

Mind that you had left some comments on v2 after I sent v3.  v4 will
have this section rewritten using loops and constants, which resolves
issues with constness and readability.

> > @@ -409,7 +393,7 @@ int __init tboot_protect_mem_regions(void)
> >
> >      /* TXT Private Space */
> >      rc = e820_change_range_type(&e820, TXT_PRIV_CONFIG_REGS_BASE,
> > -                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_PAGES * PAGE_SIZE,
> > +                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_SIZE,
>
> Was this perhaps meant to be TXT_CONFIG_SPACE_SIZE?
>
> Jan

Right, thanks, building without tboot didn't catch this.

Regards

