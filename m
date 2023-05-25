Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF9710AF1
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 13:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539530.840507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29BP-0007a9-Fj; Thu, 25 May 2023 11:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539530.840507; Thu, 25 May 2023 11:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29BP-0007Vc-Aj; Thu, 25 May 2023 11:31:03 +0000
Received: by outflank-mailman (input) for mailman id 539530;
 Thu, 25 May 2023 11:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ga2A=BO=citrix.com=prvs=5022cd99a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q29BN-0007SY-IR
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 11:31:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9deabf42-faef-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 13:30:59 +0200 (CEST)
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
X-Inumbo-ID: 9deabf42-faef-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685014258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Em+0vcfCTguW7tO+ocbqU9w1x1Bds9BQQ0dpjssYHL0=;
  b=cQBZ0xygIkN1P/w6oJpOqRrCFPmRgEkOxpodvlCXAylI5xbV8Uekbvu/
   bxUDgBD49XMnBWG2Pp/qerOt8KJ+kbR8XPdaalb4NWH/3wtwpFBCOdxOW
   6REffffcxPngjtBKZ2HeDXEjYi5t1e2bC7qCzonhK/MkIcLPrwNC1L5Pr
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110762556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bo9ob6O+16LxKxvvrR2Kl8FynXyQoLVcMsEvi/4bfWQNrUoi0DcPm
 2AaDDiHa6vZM2H3LowiYYrk/EgA68DUm9ZiHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uR0LWdT9
 sVBFCJXYA+Bibnp0La1dNA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHZoLxBvF+
 Aoq+UynGjonEMG6kAO6sVm3u9f0kBr1SN0dQejQGvlC3wTImz175ActfVmxrOS9i0W+c8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTUy2
 0WAhd/BGT1lu7rTQnWYnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznTNVPFrO2t4TJC2v+3
 DKE93cug7sttJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWL0e+yzMUJVJdPUUOQS9zZNijS5fK8fekJrMz8YNtUeYRWfwSa5ixobkP49zmzwBR9zPplY
 s3CLJ7E4ZMm5UNPlWDeegvg+eVzmnBWKZ37HvgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCb2WX8Ui2dJLRXgQM2MBDIz7w+QOMLbrzvxORDtwVJc8ANoJJ+RYokiivr6Wo
 CHtBBYJkAKXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:msU3XK27aGRWy6tQi7Ym2gqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgF1+rfKlXbcBEWndQtt5
 uIHZIfNDSKNykcsS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-Talos-CUID: =?us-ascii?q?9a23=3A7/0uPmkPvoP2wzn+UVgkT7YP/L3XOX/e4HHNIHb?=
 =?us-ascii?q?hNXQzRqKXRwTP6KdqrfM7zg=3D=3D?=
X-Talos-MUID: 9a23:i0PsXAZuPvhwseBT6SfHuRV/EZ5R3OeFE301qpg/tdnbOnkl
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110762556"
Date: Thu, 25 May 2023 12:30:53 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 03/15] build, x86: clean build log for boot/ targets
Message-ID: <fdd4b7a2-75a6-4552-a332-8407515ca7a0@perard>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-4-anthony.perard@citrix.com>
 <eaaae1c8-fdef-0746-b744-3a3e04933164@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eaaae1c8-fdef-0746-b744-3a3e04933164@suse.com>

On Wed, May 24, 2023 at 04:16:54PM +0200, Jan Beulich wrote:
> On 23.05.2023 18:37, Anthony PERARD wrote:
> > We are adding %.lnk to .PRECIOUS or make treat them as intermediate
> > targets and remove them.
> 
> What's wrong with them getting removed? Note also that's no different from
> today, so it's an orthogonal change in any event (unless I'm overlooking

Indeed, those targets are been removed today. That doesn't cause any
issue because make knows that they are just intermediate and it doesn't
have to rebuilt them if there are just missing.

But, the macro $(if_changed,) doesn't know about intermediates, and if
the target is missing, then it's going to be rebuilt. So with
$(if_changed,) the %.lnk targets are been rebuilt at every incremental
build which cause make to relink "xen" when there's otherwise nothing
to be done.
(I'm using a command like `XEN_BUILD_DATE=today XEN_BUILD_TIME=now make`
to avoid "compile.h" from been regenerated every time)

So, the change isn't orthogonal, but needs a better explanation in the
commit message.

> something). Plus if such behavior was intended, shouldn't $(targets) be
> made a prereq of .PRECIOUS in generic makefile logic?

I think I need to reevaluate what to do here. Maybe .PRECIOUS isn't the
right one to use. But yes, we probably want something generic to tell
make to never delete any $(targets) when they are intermediate.

Linux uses .SECONDARY or .NOTINTERMEDIATE, and .SECONDARY might be
better than .PRECIOUS. PRECIOUS also prevent make from delete a target
when make is interrupted or killed, which might not be desired.

> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  xen/arch/x86/boot/Makefile | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> > index 03d8ce3a9e..2693b938bd 100644
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -5,6 +5,8 @@ head-bin-objs := cmdline.o reloc.o
> >  nocov-y   += $(head-bin-objs)
> >  noubsan-y += $(head-bin-objs)
> >  targets   += $(head-bin-objs)
> > +targets   += $(head-bin-objs:.o=.bin)
> > +targets   += $(head-bin-objs:.o=.lnk)
> 
> Leaving aside the question of whether .lnk really should be part
> of $(targets), don't these two lines also ...
> 
> > @@ -26,10 +28,16 @@ $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> >  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
> >  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
> >  
> > -%.bin: %.lnk
> > -	$(OBJCOPY) -j .text -O binary $< $@
> > +%.bin: OBJCOPYFLAGS := -j .text -O binary
> > +%.bin: %.lnk FORCE
> > +	$(call if_changed,objcopy)
> >  
> > -%.lnk: %.o $(src)/build32.lds
> > -	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> > +quiet_cmd_ld_lnk_o = LD      $@
> > +cmd_ld_lnk_o = $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> > +
> > +%.lnk: %.o $(src)/build32.lds FORCE
> > +	$(call if_changed,ld_lnk_o)
> >  
> >  clean-files := *.lnk *.bin
> 
> ... eliminate the need for this?

Yes, but that doesn't seems to work here.

I think there's a "targets:=" missing in "Makefile.clean". So, new patch
to fix that, and then I can eliminate the "clean-files".

Cheers,

-- 
Anthony PERARD

