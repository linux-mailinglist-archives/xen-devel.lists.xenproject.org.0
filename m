Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36896710E5F
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539641.840741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2C0O-00057C-Bd; Thu, 25 May 2023 14:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539641.840741; Thu, 25 May 2023 14:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2C0O-00054D-89; Thu, 25 May 2023 14:31:52 +0000
Received: by outflank-mailman (input) for mailman id 539641;
 Thu, 25 May 2023 14:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ga2A=BO=citrix.com=prvs=5022cd99a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q2C0N-000547-2v
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:31:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e11b3980-fb08-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 16:31:49 +0200 (CEST)
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
X-Inumbo-ID: e11b3980-fb08-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685025109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nop7TuiEhp3ovvt2veeEr8PdxbmglTYz+bcTRfLn2ik=;
  b=T0Kd9xl8H7UgYLkiM8N/kfP8TYJ5T7XfHtXT1caGMx1HeKvm2naofgbr
   aW9aeIEXLycEJ2P5wwQEMbtpJduDXWLEmYxmT4Kk0P03pbyZvl4vExFDV
   wBTZQXGMVu2FpXh7DO136w/Z+aauKYThzDyJ6MTtZDCUxXTHVIkSb/kBp
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110423598
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0NWuAa3FW6LJG2XD0vbD5bd2kn2cJEfYwER7XKvMYLTBsI5bp2AOm
 zAbXm2PP/ncNzP2f90lOdu29BkD7ZTVyoVhTwM/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJlhU9
 qcqIwI2SC/fi/mJmaOwaLQ3iZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwNwhzD+
 zOWl4j/KjEQFNW28yegyHe9vbefv3vfYbkeP7Lto5aGh3XMnzdOWXX6T2CTqv6/jEm8V9tBK
 lc89S8nrKx0/0uuJvH3WBeysXOfvhoRXtNWO+I/4QCJjKHT5m6xD2wFVSJIacZgutU/Qzcrz
 XeWk9ivDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZt97HbS8lNHdBTD6y
 DfMpy87750QisgR3qn94lHDgBqrvJHCSgNz7QLSNkqn8wd4aYiNd4Gur1/B4p5oLoyUU12At
 3gsgNWF4aYFCpTlvCaAWvkXFbelofOMKiTBgEVHFoMksT+q/haLQ4dU5z1vIVZzBewNczTpf
 Uz7tBtY4dlYO37CRbRsf4u7BsAuzK7hPdfoTPbZapxJeJcZXBCD1DFjYwiXxW+FraQ3ufhhY
 9HBK5/qVCtET/09l1JaWtvxz5cM/zo9nlHYd6vd8EiryoXHdXW3FOwKZQ7mgv8C0IuIpwDc8
 tB6PsSMyglCXOCWXhQ74bL/PnhRcyFlWMmeR9h/M7faf1E4QD1J5+r5m+tJRmBzo0hCeg4kF
 FmZU1QQ9lfwjGavxe6iOiE6M+OHsXqSQBsG0c0Q0bSAgSBLjWWHtv13m34LkV4PqoReIQZcF
 aVtRil5Kq0nps770zocd4Lhi4dpaQ6mgwmDVwL8PmhjLsM7HVeTo4K8FucKyMXpJnPt3fbSX
 pX6jl+LKXb9b18K4DnqhAKHkArq4Cl1dBNaVErUONhDEHjRHHxRA3Wp1JcfephcQSgvMxPGj
 2569z9E/7iSy2L0mfGV7Z25Q3CBSLUgRRsEQTOHtt5b90DypwKe/GOJa87QFRi1aY8+0PzKi
 Tl9px0kDMA6oQ==
IronPort-HdrOrdr: A9a23:XaJjE61VeZY35VWvOrNtFwqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:VPzQIGxKXaYvzByImSx1BgUzI9omKU/W/kz2HBO0ElkwWba3FASfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AP5jnUwxP6Pnh31ZDvwavW98DzV2aqISkKEkkq4g?=
 =?us-ascii?q?jgcyVDnQgGW+5tQ+7aYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110423598"
Date: Thu, 25 May 2023 15:31:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 07/15] build: move XEN_HAS_BUILD_ID out of Config.mk
Message-ID: <87c6aa9f-57cb-497f-934a-ff9506607780@perard>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-8-anthony.perard@citrix.com>
 <9528ea84-9f10-d10a-b2cf-798434d48a59@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9528ea84-9f10-d10a-b2cf-798434d48a59@suse.com>

On Thu, May 25, 2023 at 01:56:53PM +0200, Jan Beulich wrote:
> On 23.05.2023 18:38, Anthony PERARD wrote:
> > Whether or not the linker can do build id is only used by the
> > hypervisor build, so move that there.
> > 
> > Rename $(build_id_linker) to $(XEN_LDFLAGS_BUILD_ID) as this is a
> > better name to be exported as to use the "XEN_*" namespace.
> > 
> > Also update XEN_TREEWIDE_CFLAGS so flags can be used for
> > arch/x86/boot/ CFLAGS_x86_32
> > 
> > Beside a reordering of the command line where CFLAGS is used, there
> > shouldn't be any other changes.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one nit:
> 
> > --- a/xen/scripts/Kbuild.include
> > +++ b/xen/scripts/Kbuild.include
> > @@ -91,6 +91,9 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
> >  
> >  clang-ifversion = $(shell [ $(CONFIG_CLANG_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
> >  
> > +ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
> > +					grep -q build-id && echo n || echo y)
> 
> I realize you only move this line, but I think we want indentation here
> to improve at this occasion:
> 
> ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
>                           grep -q build-id && echo n || echo y)
> 
> I'll be happy to adjust while committing. Which raises the question: Is
> there any dependency here on earlier patches in the series? It doesn't
> look so to me, but I may easily be overlooking something. (Of course
> first further arch maintainer acks would be needed.)

I don't see any dependency on earlier patch, so it looks fine to apply
earlier. Thanks.

> > --- a/xen/test/livepatch/Makefile
> > +++ b/xen/test/livepatch/Makefile
> > @@ -37,7 +37,7 @@ $(obj)/modinfo.o:
> >  
> >  #
> >  # This target is only accessible if CONFIG_LIVEPATCH is defined, which
> > -# depends on $(build_id_linker) being available. Hence we do not
> > +# depends on $(XEN_LDFLAGS_BUILD_ID) being available. Hence we do not
> >  # need any checks.
> 
> As an aside, I'm a little confused by "is only accessible" here. I don't
> see how CONFIG_LIVEPATCH controls reachability. At the very least the
> parent dir's Makefile doesn't use CONFIG_LIVEPATCH at all.

Yes. `make tests` works just fine without CONFIG_LIVEPATCH. Even when
that comment was introduce, it didn't seems like there were anything
preventing the target from been run.

The only thing is that `make tests` doesn't build the tests if xen-syms
was built without build_id, so the status of CONFIG_LIVEPATCH doesn't
seems to matter.

Thanks,

-- 
Anthony PERARD

