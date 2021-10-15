Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC342F768
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210880.367900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbPVs-0004hU-RI; Fri, 15 Oct 2021 15:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210880.367900; Fri, 15 Oct 2021 15:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbPVs-0004f7-OH; Fri, 15 Oct 2021 15:52:52 +0000
Received: by outflank-mailman (input) for mailman id 210880;
 Fri, 15 Oct 2021 15:52:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHjW=PD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mbPVr-0004ei-60
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:52:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2aedc8c-2dcf-11ec-8242-12813bfff9fa;
 Fri, 15 Oct 2021 15:52:50 +0000 (UTC)
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
X-Inumbo-ID: f2aedc8c-2dcf-11ec-8242-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634313169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EeW4nmmfQRhj015lGTsy7R+7su82zonfsO75WL+R+xw=;
  b=VB1x2vl1qApSnMHd0dnwcDC0/CTgMMsIlxU62oa+FyrMCeBPh7MBmT/y
   1RHjBF+Jy84hsYuidnuPOSfycRvGyzVfOWlK6nluCudFS1iFFCsj0lpQT
   WwyuIj5GoU35/OlhtJQ7MODHRoP6rJcRg/GfU7nWLCWX7vfoasOCOPtCO
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9wSG6DeTtrRWE93BilFM3/f7OUrZ44CGFHP6/KBbPTN5ZQ2Lu/L3hRBbHZinZDfJR0OFdhs5Ug
 Sk/yAUpWwKQjj+TIRmEkb4sEmi+7oCAlSLQnZCJt70D0tedFMMPsdZW75gZbih5JbB4j2YTFxD
 UOyGeXx+rYYW6tqbvAtV03HkLWZBKaLBniQCQ23gT27icQ1T1pTUx33CL/ogqR6+QEby7GJi0p
 CWG+Ur27gAweBgFjL4MXoNiptvkEBq4zAEL5ZvQXGPIohjlFsCqP20uodhfdgqQIH0tdTExDoK
 DTOr+EiJ7U9sTxIo+ia4hEXp
X-SBRS: 5.1
X-MesageID: 55288032
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:U0gbtqkkPpKq2FG4fYjPXTzo5gxIIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYXW6BO/zYMTP0foxwbNi09hsGsZPWz9FgSQds/CE9QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tc12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N9iiZaJUQ5wBPCWqO4WaiJCFRB7A7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKuEN
 5pBMmAHgBLoaDFCFU41V5kFmMDzvVXnaTNkil6Mqv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJaPNEw0RmEk5CJuTaTDVE/VDhwbeI54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZOndaFVptD83L5dhp1EqWH4kL/Lud14WtQVnNL
 ya2QD/Sbln5pfUA0Lmn5hj5ijaoq4mhouUdt1iPADzNAu+UYueYi22UBbrzsakowGWxFADpU
 J04dy62t71m4Xalzn3lfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJWWyO
 hSO4FMLuve/2UdGi4csPupd7OxxlcDd+SnNDKiIPrKinLAgHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIcw1UdyFgW82vwyGVH8baSjdb9KgaI6e56dscl0ZNxcy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:igywQqAlaYp7HAjlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.85,376,1624334400"; 
   d="scan'208";a="55288032"
Date: Fri, 15 Oct 2021 16:52:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 41/51] build,x86: remove the need for build32.mk
Message-ID: <YWmjvqyIyCP6IXmh@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-42-anthony.perard@citrix.com>
 <c99f2bc5-b1dc-7647-4199-a6a731730967@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c99f2bc5-b1dc-7647-4199-a6a731730967@suse.com>

On Thu, Oct 14, 2021 at 10:32:05AM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,23 +1,51 @@
> >  obj-bin-y += head.o
> > +head-objs := cmdline.S reloc.S
> >  
> > -DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
> > +nocov-y += $(head-objs:.S=.o)
> > +noubsan-y += $(head-objs:.S=.o)
> > +targets += $(head-objs:.S=.o)
> 
> This working right depends on targets initially getting set with := ,
> because of ...

They are because Rules.mk initialise those variables that way.

> > -CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h \
> > -	       $(BASEDIR)/include/xen/kconfig.h \
> > -	       $(BASEDIR)/include/generated/autoconf.h
> > +head-objs := $(addprefix $(obj)/, $(head-objs))
> 
> ... this subsequent adjustment to the variable. Might it be more future
> proof for start with
> 
> head-srcs := cmdline.S reloc.S
> 
> and then derive head-objs only here?

I'll give it a try.

> > -RELOC_DEPS = $(DEFS_H_DEPS) \
> > -	     $(BASEDIR)/include/generated/autoconf.h \
> > -	     $(BASEDIR)/include/xen/kconfig.h \
> > -	     $(BASEDIR)/include/xen/multiboot.h \
> > -	     $(BASEDIR)/include/xen/multiboot2.h \
> > -	     $(BASEDIR)/include/xen/const.h \
> > -	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
> > +$(obj)/head.o: $(head-objs)
> >  
> > -$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
> > +LDFLAGS_DIRECT_OpenBSD = _obsd
> > +LDFLAGS_DIRECT_FreeBSD = _fbsd
> 
> This is somewhat ugly - it means needing to change things in two places
> when config/x86_32.mk would change (e.g. to add another build OS). How
> about ...
> 
> > +$(head-objs:.S=.lnk): LDFLAGS_DIRECT := -melf_i386$(LDFLAGS_DIRECT_$(XEN_OS))
> 
> ... instead:
> 
> $(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))
> 
> ? Or if deemed still too broad
> 
> $(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst elf_x86_64,elf_i386,$(LDFLAGS_DIRECT))
> 
> ?

Sounds good, I'll do that.

> > -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
> > -	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
> > +CFLAGS_x86_32 := -m32 -march=i686
> > +CFLAGS_x86_32 += -fno-strict-aliasing
> > +CFLAGS_x86_32 += -std=gnu99
> > +CFLAGS_x86_32 += -Wall -Wstrict-prototypes
> > +$(call cc-option-add,CFLAGS_x86_32,CC,-Wdeclaration-after-statement)
> > +$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-but-set-variable)
> > +$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-local-typedefs)
> > +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> > +CFLAGS_x86_32 += -I$(srctree)/include
> 
> I'm afraid I'm not convinced that having to keep this in sync with the
> original is in fair balance with the removal of build32.mk.

Why would this needs to be kept in sync with the original? I would
actually like to get rid of Config.mk, I don't see the point in sharing
CFLAGS between a kernel and userspace binaries. Also, I hope one day
that we can have the hypervisor in its own repo, and thus they won't be
any Config.mk to keep in sync with.

The goal of this patch is less about removing build32.mk, and more about
using the rest of the build system infrastructure to build those few
32bits objects, and been able to use the automatic dependencies
generation and other things without having to duplicate them.

It probably make the build a bit faster as there is two less invocation
of $(MAKE) (which parse Config.mk).

As for a possible change: instead of having those x86_32 flags in
arch/x86/boot/, I could have them in arch/x86/arch.mk. Linux does
something like that were it prepare REALMODE_CFLAGS.

I know it's a bit annoying to have another list x86_32 cflags, but I
don't see how we can extract them from Config.mk (in a Makefile where we
want to use both x86_32 and x86_64 flags).

Thanks,

-- 
Anthony PERARD

