Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81823ABB151
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 20:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989333.1373504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGirk-0006Rf-Sn; Sun, 18 May 2025 18:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989333.1373504; Sun, 18 May 2025 18:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGirk-0006Oh-Q7; Sun, 18 May 2025 18:36:04 +0000
Received: by outflank-mailman (input) for mailman id 989333;
 Sun, 18 May 2025 18:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=247E=YC=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uGiri-0006OZ-SX
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 18:36:03 +0000
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net
 [46.105.43.105]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1cf5dc8-3416-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 20:36:00 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.17.39])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4b0qJb4fyPz1lH4
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 18:35:59 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-srqkw (unknown [10.110.101.117])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 22F3D1FE24;
 Sun, 18 May 2025 18:35:57 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-srqkw with ESMTPSA
 id 7Bl6LY0oKmif/gQAmIYX7A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 18 May 2025 18:35:57 +0000
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
X-Inumbo-ID: f1cf5dc8-3416-11f0-9eb8-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-109S0030239ee15-be38-48a1-8cc5-2fa894bc7de3,
                    6FCDE7FC3973969C7D59E240015AF9737BA2D6B5) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 18 May 2025 21:35:49 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aCoohV1Ue0NBKmSL@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
X-Ovh-Tracer-Id: 2922554685630624924
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudelvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepveevhfdvfedtffeiveeigffhffetvdeltdeftddukefgvdeuvdelkeffteeifeetnecuffhomhgrihhnpehinhhtvghlrdgtohhmnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=hsdlVVehTPs587A8VqR0oCQI/MsgTIjwmYBXjl5EAfU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747593359; v=1;
 b=PBE6ZI+aNDcvAsU/K2jwmm7gBozROZxDjXbCjCYY13/2Cz6/LuiQynzBbkkzV5akAGgR0GXn
 ciYw3nPOOjXu5DAu4sX1dhzLR8RKrUcGlUSaUptYiSu0eU6OtxmgLOjhbLHhV3x6b3el32EGBAb
 netdrZ8IgA5jF4Cyf+yz0OH/7JniKmYGGghMEEEBnXckeXTumhVfk3AqhhnuEjColKJnX+L2ARL
 4+17KRtd/PYa9QS0IHx35ey6LP8/83KVeEiqce6I+N32TxeBb4R/D+vd2DsiEfpnpAYvhapY1G6
 mb/a+Vyc4pJZe4qOvKMo2tYdmJMKVlhWh2/rRKRDekhJA==

On Wed, May 14, 2025 at 03:55:51PM +0100, Andrew Cooper wrote:
> Please have at least a one-liner introduction to what TXT is.  Is there
> a stable URL for the TXT spec?  (I can't spot an obvious one, googling
> around)

In addition to a short definition I'll add:
 * https://www.intel.com/content/www/us/en/support/articles/000025873/processors.html
 * unversioned link to Software Development Guide
 * link to that unofficial archive (marked as such) mentioned by Krystian

> > +#ifndef ASM__X86__INTEL_TXT_H
> > +#define ASM__X86__INTEL_TXT_H
>
> I realise this is what the documentation currently says, but we're just
> in the process of finalising some changes.  Please make this
> X86_INTEL_TXT_H.

Will fix.

> Commit message needs to note that you're swapping NR_TXT_CONFIG_PAGES
> for NR_TXT_CONFIG_SIZE, hence the change in logic in
> tboot_protect_mem_regions().

Will clarify that.

> > +#ifndef __ASSEMBLY__
> > +
> > +/* Need to differentiate between pre- and post paging enabled. */
> > +#ifdef __EARLY_SLAUNCH__
> > +#include <xen/macros.h>
> > +#define _txt(x) _p(x)
> > +#else
> > +#include <xen/types.h>
> > +#include <asm/page.h>   // __va()
> > +#define _txt(x) __va(x)
> > +#endif
>
> I have to admit that I'm rather suspicious of this, but I'm going to
> have to wait to see later patches before making a suggestion.  (I highly
> suspect we'll want a fixmap entry).

Leaving it as is for now.

> > +/*
> > + * Always use private space as some of registers are either read-only or not
> > + * present in public space.
> > + */
> > +static inline uint64_t read_txt_reg(int reg_no)
>
> unsigned int reg

OK, for both read and write functions.

> I'd be tempted to name it simply txt_read().  I don't think the extra
> "_reg" is a helpful suffix, and it makes the APIs consistent with
> txt_reset().  But I expect others may have opinions here.

Will be renamed to txt_read() and txt_write(), seems sensible to me.

> > +static inline void write_txt_reg(int reg_no, uint64_t val)
> > +{
> > +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> > +    *reg = val;
> > +    /* This serves as TXT register barrier */
> > +    (void)read_txt_reg(TXTCR_ESTS);
>
> What is this barrier for?
>
> It's not for anything in the CPU side of things, because UC accesses are
> strictly ordered.
>
> I presume it's for LPC bus ordering then, but making every write be a
> write/read pair seems very expensive.

The barrier will be moved to txt_reset() as suggested by Krystian in his
reply.

> > +static inline void txt_reset(uint32_t error)
> > +{
> > +    write_txt_reg(TXTCR_ERRORCODE, error);
> > +    write_txt_reg(TXTCR_CMD_NO_SECRETS, 1);
> > +    write_txt_reg(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
> > +    write_txt_reg(TXTCR_CMD_RESET, 1);
> > +    while (1);
>
> for ( ;; )
>     cpu_relax();
>
> please.
>
> Will the write to CMD_RESET try to initiate a platform reset, or will we
> just hang here forever?

Will mark the function as `noreturn` and use `unreachable()` instead.

The write sends a platform into a warm reboot which retains the error
code for later examination.

> > +/*
> > + * Functions to extract data from the Intel TXT Heap Memory. The layout
> > + * of the heap is as follows:
>
> This is quite horrible, but I presume this is as specified by TXT?
>
> To confirm, it's a tightly packed data structure where each of the 4
> blobs is variable size?  Are there any alignment requirements on the
> table sizes?  I suspect not, given the __packed attributes.

Will improve the comment to state this explicitly, including that no
particular alignment is assumed and why (as in Krystian's reply).

> > diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
> > index d5db60d335..8a573d8c79 100644
> > --- a/xen/arch/x86/tboot.c
> > +++ b/xen/arch/x86/tboot.c
> > @@ -15,6 +15,7 @@
> >  #include <asm/tboot.h>
> >  #include <asm/setup.h>
> >  #include <asm/trampoline.h>
> > +#include <asm/intel-txt.h>
> >
> >  #include <crypto/vmac.h>
>
> I'll send a prep patch to fix tboot.c, but we're trying to keep includes
> sorted (for sanity of backports).
>
> ~Andrew

I've seen commits sorting includes and trying to do the same, but files
which don't have includes sorted yet often don't have any good place for
a new entry and I refrain from sorting them at the same time as I add a
new line.

Regards

