Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9F49244E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 12:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258444.445084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mK9-0003NW-2o; Tue, 18 Jan 2022 11:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258444.445084; Tue, 18 Jan 2022 11:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mK8-0003Kt-Vi; Tue, 18 Jan 2022 11:06:48 +0000
Received: by outflank-mailman (input) for mailman id 258444;
 Tue, 18 Jan 2022 11:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9mK6-0003Km-N7
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 11:06:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b760fa70-784e-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 12:06:44 +0100 (CET)
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
X-Inumbo-ID: b760fa70-784e-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642504003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W9o9aB525ouKi+ttuwuEZSJfGMXE46ZE5pNNJZbB/rk=;
  b=hcFA7tJ+PaLrBbwhSrld/78wCe8hFtqJyMk2xiGSFGvKEXcS9ThELGo0
   sE2SrzOQsK/GCvaRocPzJ1aT2o4VziT7NJv8bYo7DHvpfgg0JFsX5z2xV
   Lvs877dtYN5TnWHGrSWyTX5xXe5Xsuv62KdaKTfBuGB2FVs+StexHd7rs
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ChdYE/vdGSAz2qcyWQuw83sP9mfLWSz5EIR5TZnfeXePX8l/rjgiwijEW+5wtmDdML3C8FVEkQ
 m8aUjNVzCAfirI/NYszpFnsDakBkQs5eIGO+EoQpGAAz2SETJ+hAz2V3OtziNHehG+TTLfwTsn
 qmnhXo9K9cvT3OSgmyopfhbRRSfKwzU+cj+ANud3gEVIhyWurDP7LA5AjrlvIPXXj6gA0EFRhe
 RmkWHbT4gHJEAV6AsZOkTjp/9NAxlqSGVs9UIRr0r7lC0uPJ0psptkELxmH4DBZ9nyG7hRgQC2
 R1HdP4Dtjt1eQww4PGtjtvnE
X-SBRS: 5.2
X-MesageID: 62615171
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Skpvpao4MyXqAd8O7/WCD5dNs+peBmJZYxIvgKrLsJaIsI4StFCzt
 garIBmEOvzfazegfdgibNi/90ID6pbcxt4wSgI/rH9jFCkWo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZyvWQsjJaDiosoUbTRnOnhmIep86JaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZBHMGc2M02ojxtnC1xJL6lltdiU33jEfh5Zg1+fhoBp/D2GpOB2+Oe0a4eEEjCQfu1rmUKfq
 nPD7n7OKBgQP9yCyhKI6nupwOTImEvTR4Y6BLC+sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH3UgekuneCslgZUsBJDuwhwAiXz+zf5APxLmkbTBZRZdo+rsg0SDc2k
 FiTkLvBBzZirbmUQnK17aqPoHW5Pi19BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpt/oHTD9x
 RiaoS54gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8Ct5e56pbZelx2L15MhtE6/AVkXGh
 mgtzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr74FsJvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmBxycnT2
 r/BKK5A6Er274w9k1JaoM9HgNcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 YoFa5fWmksDC7ejCsUyzWL1BQpVRZTcLcqnw/G7i8bZelY2cI3fI6K5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNjzhI9CKcpfVeR3pYRLkK8vJ
 9FYKproPxi6Ymmdk9jrRcOj/NUKmdXCrV/mAhdJlxBkLsEwHFKYq4a0FuYtnQFXZheKWQIFi
 +XI/mvmrVArHWyO1e7aN6CiyU2fp38YlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVsT69h8Hr9nwLgQ/dzqo7MGnA1oEG+SNwagC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcfVN3YP6C2PcYnijpwc40eEiqtjVq+LenUFlJO0XegiJqM7YoYpgux
 v0suZBK5lXn2AYqKNuPkgtd63+Ici4bS6wiu5wXXN3rhw4sxg0QaJDQEHarspSGatEKOUg2O
 D6EwqHFgu0ElEbFdnMyE1nL3PZc2stS6EwbkgdaKgTbgMfBi982wAZVoGY+QQlixxla1/5+Z
 zpwPEpvKKTSpzpliaCvhYx3992t0PFBxnHM9g==
IronPort-HdrOrdr: A9a23:z46oZqNLsjutOMBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62615171"
Date: Tue, 18 Jan 2022 11:06:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Message-ID: <YeafMh0du+5K8YDD@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
 <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com>

On Tue, Dec 21, 2021 at 02:53:49PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > Rather than preparing the efi source file, we will make the symbolic
> > link as needed from the build location.
> > 
> > The `ln` command is run every time to allow to update the link in case
> > the source tree change location.
> 
> Btw, since symlinks aren't being liked, would there be a way to make
> things work using vpath?

No, that's not possible. With "vpath = /build/xen/common/efi", make
would look at path "/build/xen/common/efi/arch/x86/efi/runtime.c" to
build "arch/x86/efi/runtime.o".

> > This patch also introduce "efi_common.mk" which allow to reuse the
> > common make instructions without having to duplicate them into each
> > arch.
> > 
> > And now that we have a list of common source file, we can start to
> > remove the links to the source files on clean.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > 
> > Notes:
> >     v8:
> >     - use symbolic link instead of making a copy of the source
> >     - introduce efi_common.mk
> >     - remove links to source file on clean
> >     - use -iquote for "efi.h" headers in common/efi
> > 
> >  xen/Makefile                 |  5 -----
> >  xen/arch/arm/efi/Makefile    |  4 ++--
> >  xen/arch/x86/Makefile        |  1 +
> >  xen/arch/x86/efi/Makefile    |  5 +----
> >  xen/common/efi/efi_common.mk | 12 ++++++++++++
> 
> Could I talk you into avoiding _ when - is suitable, which is the case not
> only for (non-exported) make variables, but also file names?

I'll try. I'll change this one.

> > --- a/xen/arch/arm/efi/Makefile
> > +++ b/xen/arch/arm/efi/Makefile
> > @@ -1,4 +1,4 @@
> > -CFLAGS-y += -fshort-wchar
> > +include $(srctree)/common/efi/efi_common.mk
> >  
> > -obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
> > +obj-y += $(EFIOBJ-y)
> >  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> > diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> > index e8151bf4b111..eabd8d3919a4 100644
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -79,6 +79,7 @@ endif
> >  
> >  # Allows "clean" to descend into boot/
> >  subdir- += boot
> > +subdir- += efi
> 
> This renders the comment stale - please generalize it.
> 
> Also, any reason a similar adjustment isn't needed for Arm?

Yes, there's already "obj- += efi/" on the arm side. On x86, efi/ is
only in ALL_OBJS which make.clean doesn't use.

> > --- /dev/null
> > +++ b/xen/common/efi/efi_common.mk
> > @@ -0,0 +1,12 @@
> > +EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
> > +EFIOBJ-$(CONFIG_COMPAT) += compat.o
> > +
> > +CFLAGS-y += -fshort-wchar
> > +CFLAGS-y += -iquote $(srctree)/common/efi
> > +
> > +$(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
> > +	$(Q)ln -nfs $< $@
> 
> Like was the case before, I think it would be better if the links were
> relative ones, at least when srctree == objtree (but ideally always).

I can give it a try.

> > +clean-files += $(patsubst %.o,%.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
> 
> Nit: Please be consistent (at least within a single line) about blanks
> following commas.

You mean to never put spaces after a comma because they are sometime
significant? That's the only way I know how to be consistent.

Thanks,

-- 
Anthony PERARD

