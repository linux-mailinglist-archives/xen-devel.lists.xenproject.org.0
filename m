Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA84292AE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206199.361712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwlQ-0004rs-Se; Mon, 11 Oct 2021 14:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206199.361712; Mon, 11 Oct 2021 14:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwlQ-0004pl-PZ; Mon, 11 Oct 2021 14:58:52 +0000
Received: by outflank-mailman (input) for mailman id 206199;
 Mon, 11 Oct 2021 14:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZwlO-0004ox-Tz
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:58:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bafec8bc-2aa3-11ec-80e1-12813bfff9fa;
 Mon, 11 Oct 2021 14:58:45 +0000 (UTC)
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
X-Inumbo-ID: bafec8bc-2aa3-11ec-80e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633964325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQollfNzTTSHdcKy/jw699VDAbqrV85VhXA402BExX0=;
  b=b5XMA1cML8cDVAxVBZuzk451KryDQmOhqvYhV4kMAJzPNzIsORQci4Dy
   Qnwh1bX4mz1jKb7q2H/OTk28RSLOEcnU6sVew50PuhkrOPy0DBYiJDrP1
   Jh51++bBG83PzN+9mmMvAjvWIFidWPADWhzDfpxNHZaM+cgDx3zDtoxPC
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BJF62UZ8z41FPvb2N6f7A4uE33cHvcWhBmKJumoZUPek5AeWO65thEP1U7gWJp4mtAOc3iSZRI
 9/H0nOgRbvP8+7xU8wbxx/doYFEA4vcsc9TYDy4aomCNtqtZvMSoJSi8MKUNBQH4Mi3P7ZfLay
 SNTcceYFgkdd5hOQNszx5AKgIPNb2/xNtTHGLO8UHKp35NtMSUOl+wTdfe8JlB16qawUCG3hVX
 N65AeYOnKfnWVbKBnqHUC8XjoEkOFQn/g4wM8II1/JtWwbeSfWt+5DZh07x/qsNDH5vJsz8WWT
 oRfG1bxD4xXN5+oU73JS2HIU
X-SBRS: 5.1
X-MesageID: 54464306
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:paXQo6Dm8qXqoRVW/6Tkw5YqxClBgxIJ4kV8jS/XYbTApDhw0DxRn
 TROXjqEMv6NZGHzfopwbN/lpEoOsMODz4VgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550Es7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rx+igYkuk
 Pdxu4WCZl50N5+RurVETEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFgGtu2psWQ54yY
 eI8dhlTfgjwICdNZHMIOrcGnKShpnfGJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiH+bvDYMVtxICeo45QqRjK3O7G6xBHUATzNHQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBUsoTjFdElMn39f6kq5q0xv9E/QySbHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVqvluPDwpJ+is8PdT/P9X5tjA3+N4ZdN7BJmRtq
 kTojCR3AAomNpqKiDCWCNsEGLWk9p5p2xWN3AYxQfHNG9mrkkNPnLy8AhkidC+F0e5eIFcFh
 XM/XysLufe/21PwPMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhN3wfBnZ
 s7CLZj3ZZr/NUiB5GHsLwv6+eV6rh3SOEuJHcyrp/hZ+ev2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9Qik7Mu2wBswj8StT0O5FFQ/A5kXPqL2HtM83H6bbt5F5nAC65fIrH
 fQDZeuaBfFDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJtsu
 aCk2yPaXYEHG1ZoAvHJZa/91Fi2p3Ucxr5/BhOaPtlJdUzw24F2MCit3OQvKsQBJEyblDuX3
 gqbGzkCouzJr9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKj7P
 Ldb1fDxNvEDjW1miYskHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHVNNdgooauOPiaMdljXItKlnJUz74Gl8/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L3nJO6mCBDn0cSKF25JgVDbjihhcv1lwfM4fXDTX74c3XZthBWqXwz
 uR4WEYWa2xg+3f/
IronPort-HdrOrdr: A9a23:uxhUQapppvRN3JUWWOwTFzEaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54464306"
Date: Mon, 11 Oct 2021 15:58:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 20/51] build: avoid re-executing the main Makefile
 by introducing build.mk
Message-ID: <YWRRFxlvmDMu8nRZ@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-21-anthony.perard@citrix.com>
 <87036d63-b5d4-55bf-0bb3-9b981a147f15@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87036d63-b5d4-55bf-0bb3-9b981a147f15@suse.com>

On Mon, Oct 11, 2021 at 12:56:54PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > Currently, the xen/Makefile is re-parsed several times: once to start
> > the build process, and several more time with Rules.mk including it.
> > This makes it difficult to reason with a Makefile used for several
> > purpose, and it actually slow down the build process.
> 
> I'm struggling some with what you want to express here. What does
> "to reason" refer to?

I guess "to reason with something" isn't an expression. I mean that the
main Makefile is difficult to work with as it setup the build process
for the rest of the build. And it is difficult to understand what is
happening when it recursed into itself, and thus possibly re-executing
part of the build process setup.

> > So this patch introduce "build.mk" which Rules.mk will use when
> > present instead of the "Makefile" of a directory. (Linux's Kbuild
> > named that file "Kbuild".)
> > 
> > We have a few targets to move to "build.mk" identified by them been
> > build via "make -f Rules.mk" without changing directory.
> > 
> > As for the main targets like "build", we can have them depends on
> > there underscore-prefix targets like "_build" without having to use
> > "Rules.mk" while still retaining the check for unsupported
> > architecture. (Those main rules are changed to be single-colon as
> > there should only be a single recipe for them.)
> > 
> > With nearly everything needed to move to "build.mk" moved, there is a
> > single dependency left from "Rules.mk": $(TARGET), which is moved to
> > the main Makefile.
> 
> I'm having trouble identifying what this describes. Searching for
> $(TARGET) in the patch doesn't yield any obvious match. Thinking
> about it, do you perhaps mean the setting of that variable? Is
> moving that guaranteed to not leave the variable undefined? Or in
> other words is there no scenario at all where xen/Makefile might
> get bypassed? (Aiui building an individual .o, .i, or .s would
> continue to be fine, but it feels like something along these lines
> might get broken.)

I mean that "xen/Rules.mk" will never "include" "xen/Makefile" after
this patch, but the variable "TARGET" is only set in "xen/Rules.mk". But
"xen/Makefile" still needs "TARGET" to be set so I moved the assignment
of the variable from "xen/Rules.mk" into "xen/Makefile".

> > @@ -279,11 +281,13 @@ export CFLAGS_UBSAN
> >  
> >  endif # need-config
> >  
> > -.PHONY: build install uninstall clean distclean MAP
> > -build install uninstall debug clean distclean MAP::
> > +main-targets := build install uninstall clean distclean MAP
> > +.PHONY: $(main-targets)
> >  ifneq ($(XEN_TARGET_ARCH),x86_32)
> > -	$(MAKE) -f Rules.mk _$@
> > +$(main-targets): %: _%
> > +	@:
> 
> Isn't the conventional way to express "no commands" via
> 
> $(main-targets): %: _% ;
> 
> ?

I guess, I'll change it.

> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -9,8 +9,6 @@ include $(XEN_ROOT)/Config.mk
> >  include $(BASEDIR)/scripts/Kbuild.include
> >  
> >  
> > -TARGET := $(BASEDIR)/xen
> > -
> >  # Note that link order matters!
> 
> Could I talk you into removing yet another blank line at this occasion?

Will do.

> > @@ -36,7 +34,9 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
> >                                              rodata.cst$(a)) \
> >                           $(foreach r,rel rel.ro,data.$(r).local)
> >  
> > -include Makefile
> > +# The filename build.mk has precedence over Makefile
> > +mk-dir := .
> 
> What's the goal of this variable? All I can spot for now it that ...

It's just me thinking ahead where a folling patch will just have to
write "$mk-dir := $(src)", instead of editing the following line.

> > +include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
> 
> ... this is harder to read than
> 
> include $(if $(wildcard ./build.mk),./build.mk,./Makefile)
> 
> which could be further simplified to
> 
> include $(if $(wildcard build.mk),build.mk,Makefile)
> 
> and then maybe altered to
> 
> include $(firstword $(wildcard build.mk) Makefile)

I can try with this last one, there is less repeating of "build.mk" so
that sound like a good thing to do.

> > --- /dev/null
> > +++ b/xen/build.mk
> > @@ -0,0 +1,58 @@
> > +quiet_cmd_banner = BANNER  $@
> > +define cmd_banner
> > +    if which figlet >/dev/null 2>&1 ; then \
> > +	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
> > +    else \
> > +	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
> > +    fi; \
> > +    mv -f $@.tmp $@
> > +endef
> > +
> > +.banner: tools/xen.flf FORCE
> > +	$(call if_changed,banner)
> > +targets += .banner
> 
> To make the end of the rule more easily recognizable, may I ask that
> you either insert a blank line after the rule or that you move the +=
> up immediately ahead of the construct?

Will do.

Thanks,

-- 
Anthony PERARD

