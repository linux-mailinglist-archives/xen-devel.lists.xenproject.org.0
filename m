Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA89FF4C9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jan 2025 20:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863711.1275081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tT40F-0008C0-6v; Wed, 01 Jan 2025 19:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863711.1275081; Wed, 01 Jan 2025 19:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tT40F-00089W-3N; Wed, 01 Jan 2025 19:03:35 +0000
Received: by outflank-mailman (input) for mailman id 863711;
 Wed, 01 Jan 2025 19:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuMM=TZ=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tT40C-00089Q-I6
 for xen-devel@lists.xenproject.org; Wed, 01 Jan 2025 19:03:33 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 169e2887-c873-11ef-99a4-01e77a169b0f;
 Wed, 01 Jan 2025 20:03:30 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id E1CF75030DC;
 Wed,  1 Jan 2025 20:03:27 +0100 (CET)
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
X-Inumbo-ID: 169e2887-c873-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735758208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dV5f7xGWQ9o/HfViHTfrfAk4k7xWqSdLVSvPueziWWU=;
	b=N0zsG1ZPthpG2uh4DbzQOpmvBwp9fwsKGPijLb+FocJMEIT7cY4b4ZQrDgca6cMgI7y2NB
	CjqjN8rAh96C2cxpMkdD7DD0RkpF2x727yx29rFz0FWLXXgq2X2iL0CRCCdXOfMp2cc854
	EVf8q9TeOhrlrGzmENZPSxXzotmvyr0/Uqa/wbXWXYH9W2hJjoFimmpGX0EdxzzDbxPwAC
	KtLNBZFT6d71KtONOQFghr/tIfG92LQLtPapSQejgINOKGFNDvJ0nzJYMBAui8I2stYK+t
	onGjTxm49rkQZYLsWs+OT9mcCQWvcLK4I3EB8oemYSbsuKFjlV7fZneAycAfBg==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [XEN PATCH 2/5] docs: set DATE to SOURCE_DATE_EPOCH if available
Date: Wed, 01 Jan 2025 20:03:24 +0100
Message-ID: <23136765.EfDdHjke4D@localhost>
In-Reply-To: <2637960.Lt9SDvczpP@localhost>
References:
 <cover.1735585600.git.maxi@daemonizer.de>
 <25f9fabf-1239-4465-92c9-484fc24fc4f7@citrix.com>
 <2637960.Lt9SDvczpP@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4443138.kQq0lBPeGt";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4443138.kQq0lBPeGt
Content-Type: multipart/mixed; boundary="nextPart8343371.EvYhyI6sBW";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Wed, 01 Jan 2025 20:03:24 +0100
Message-ID: <23136765.EfDdHjke4D@localhost>
In-Reply-To: <2637960.Lt9SDvczpP@localhost>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart8343371.EvYhyI6sBW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 30. Dezember 2024 23:28:42 CET Maximilian Engelhardt wrote:
> On Montag, 30. Dezember 2024 22:38:24 CET Andrew Cooper wrote:
> > On 30/12/2024 9:00 pm, Maximilian Engelhardt wrote:
> > > Use the solution described in [1] to replace the call to the 'date'
> > > command with a version that uses SOURCE_DATE_EPOCH if available. This
> > > is needed for reproducible builds.
> > > 
> > > The -d "@..." syntax was introduced in GNU date about 2005 (but only
> > > added to the docuemntation in 2011), so I assume a version supporting
> > > this syntax is available, if SOURCE_DATE_EPOCH is defined. If
> > > SOURCE_DATE_EPOCH is not defined, nothing changes with respect to the
> > > current behavior.
> > > 
> > > [1] https://reproducible-builds.org/docs/source-date-epoch/
> > > 
> > > Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
> > > ---
> > > 
> > >  docs/Makefile | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/docs/Makefile b/docs/Makefile
> > > index b30cc619f8..beba02a94f 100644
> > > --- a/docs/Makefile
> > > +++ b/docs/Makefile
> > > @@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
> > > 
> > >  -include $(XEN_ROOT)/config/Docs.mk
> > >  
> > >  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-
directory
> > >  xenversion)>
> > > 
> > > -DATE		:= $(shell date +%Y-%m-%d)
> > > +
> > > +DATE_FMT	:= +%Y-%m-%d
> > > +ifdef SOURCE_DATE_EPOCH
> > > +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
> > > 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
> > > 2>/dev/null || date -u "$(DATE_FMT)") +else
> > > +DATE		:= $(shell date "$(DATE_FMT)")
> > > +endif
> > > 
> > >  DOC_ARCHES      := arm x86_32 x86_64
> > >  MAN_SECTIONS    := 1 5 7 8
> > 
> > While this looks fine for docs, there's another (identical) use of date
> > in tools/firmware/hvmloader/Makefile, as well as some differing uses to
> > construct XEN_BUILD_{DATE,TIME}.  INSTALL talks about VGABIOS_REL_DATE
> > too.
> > 
> > Does something like this work for you?  It seems to DTRT for SMBIOS.  It
> > needs adapting a bit more for vgabios and Xen, but I think having one
> > common $(date) is going to be better than ad-hoc ones over the tree.
> > 
> > ~Andrew
> 
> Hi Andrew,
> 
> Thanks for your quick reply. Your patch looks fine to me. You can add my
> Tested-by.
> 
> We currently use "export XEN_BUILD_{DATE,TIME}=...", "export
> SMBIOS_REL_DATE=..." and "export VGABIOS_REL_DATE=..." for building xen in
> Debian, so we did not run into reproducibility problems with these. But
> having them combined to all use SOURCE_DATE_EPOCH if available sounds like
> a good idea and would also benefit other downstream users.
> 
> Maxi

Hi Andrew,

I extended your patch to also cover the other uses of date. Please check if 
this look reasonable as I'm not an expert in makefiles. It seems to DTRT in 
the cases I tested.

What I changed compared to your patch:

* Add LC_ALL=C to all date commands. This was also missing in my original 
patch, but I think it's a good thing to do and XEN_BUILD_{DATE,TIME} already 
do it.

* Change the quoting to allow calling the date command without any additional 
(formatting) arguments.

* Add an include of Config.mk to tools/firmware/vgabios/Makefile and moved the 
definition of XEN_BUILD_{DATE,TIME} further down in xen/Makefile to have the 
newly defined date wrapper available.

Does this look reasonable or are there parts that should be done differently?

Thanks,
Maxi
--nextPart8343371.EvYhyI6sBW
Content-Disposition: attachment; filename="SOURCE_DATE_EPOCH_full.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="unicode-2-0-utf-8";
 name="SOURCE_DATE_EPOCH_full.patch"

diff --git a/Config.mk b/Config.mk
index fa0414055b..9188fc9053 100644
--- a/Config.mk
+++ b/Config.mk
@@ -141,6 +141,14 @@ export XEN_HAS_BUILD_ID=y
 build_id_linker := --build-id=sha1
 endif
 
+# Wrap date(1) to use SOURCE_DATE_EPOCH if set the environment.
+# See https://reproducible-builds.org/docs/source-date-epoch/
+ifdef SOURCE_DATE_EPOCH
+date = $(shell LC_ALL=C date -u -d "@$(SOURCE_DATE_EPOCH)" $(1) 2>/dev/null || LC_ALL=C date -u -r "$(SOURCE_DATE_EPOCH)" $(1) 2>/dev/null || LC_ALL=C date -u $(1))
+else
+date = $(shell LC_ALL=C date $(1))
+endif
+
 define buildmakevars2shellvars
     export PREFIX="$(prefix)";                                            \
     export XEN_SCRIPT_DIR="$(XEN_SCRIPT_DIR)";                            \
diff --git a/docs/Makefile b/docs/Makefile
index b30cc619f8..ca9fd726d3 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -3,7 +3,7 @@ include $(XEN_ROOT)/Config.mk
 -include $(XEN_ROOT)/config/Docs.mk
 
 VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
-DATE		:= $(shell date +%Y-%m-%d)
+DATE		:= $(call date,"+%Y-%m-%d")
 
 DOC_ARCHES      := arm x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index c7bc400657..cc5dc00498 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -23,7 +23,7 @@ include $(XEN_ROOT)/tools/firmware/Rules.mk
 ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n; fi)
 
 # SMBIOS spec requires format mm/dd/yyyy
-SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
+SMBIOS_REL_DATE ?= $(call date,"+%m/%d/%Y")
 
 CFLAGS += $(CFLAGS_xeninclude) -fno-pic -mregparm=3
 
diff --git a/tools/firmware/vgabios/Makefile b/tools/firmware/vgabios/Makefile
index 3284812fde..db5a2624be 100644
--- a/tools/firmware/vgabios/Makefile
+++ b/tools/firmware/vgabios/Makefile
@@ -1,3 +1,6 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/Config.mk
+
 CC      = gcc
 
 GCC = gcc
@@ -5,7 +8,7 @@ BCC = bcc
 AS86 = as86
 
 RELEASE = `pwd | sed "s-.*/--"`
-VGABIOS_REL_DATE ?= `date '+%d %b %Y'`
+VGABIOS_REL_DATE ?= $(call date,"+%d %b %Y")
 RELVERS = `pwd | sed "s-.*/--" | sed "s/vgabios//" | sed "s/-//"`
 
 VGABIOS_DATE = "-DVGABIOS_DATE=\"$(VGABIOS_REL_DATE)\""
diff --git a/xen/Makefile b/xen/Makefile
index 2e1a925c84..a2d0795cde 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -14,15 +14,11 @@ export XEN_WHOAMI	?= $(USER)
 ifeq ($(origin XEN_DOMAIN), undefined)
 export XEN_DOMAIN	:= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
 endif
-ifeq ($(origin XEN_BUILD_DATE), undefined)
-export XEN_BUILD_DATE	:= $(shell LC_ALL=C date)
-endif
-ifeq ($(origin XEN_BUILD_TIME), undefined)
-export XEN_BUILD_TIME	:= $(shell LC_ALL=C date +%T)
-endif
 ifeq ($(origin XEN_BUILD_HOST), undefined)
 export XEN_BUILD_HOST	:= $(shell hostname)
 endif
+# XEN_BUILD_DATE and XEN_BUILD_TIME are set further down, as they depend on
+# Config.mk for SOURCE_DATE_EPOCH handling.
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python`.
@@ -250,6 +246,13 @@ SRCARCH := $(shell echo $(ARCH) | \
         -e 's/riscv.*/riscv/g' -e 's/ppc.*/ppc/g')
 export ARCH SRCARCH
 
+ifeq ($(origin XEN_BUILD_DATE), undefined)
+export XEN_BUILD_DATE	:= $(call date)
+endif
+ifeq ($(origin XEN_BUILD_TIME), undefined)
+export XEN_BUILD_TIME	:= $(call date,"+%T")
+endif
+
 export CONFIG_SHELL := $(SHELL)
 export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
 export YACC = $(if $(BISON),$(BISON),bison)

--nextPart8343371.EvYhyI6sBW--

--nextPart4443138.kQq0lBPeGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmd1kXwACgkQgepkfSQr
0hULZBAAvHqM+nMbdEAx417gDxIL1+CqjwOtIN6gF/UMpSycSGNhGVpNwCXJSRUk
1W61ct1PO5nyTIPaFCxFd45YnHzoWmEHcvWw+guSWGY5e+c9lZfr1qpXY/740rUh
aiRlYa+5Dia52fKotws4sJW65vje363tp7ZCHSQKU87V5pjiVo2Zb8mXog0q7IkZ
ClGwlpaWtyBPdlKnUayGmZ0Bm0NdZ5PYNtJtDCBxpJ+80XziVm6CCLxZb2pXljnD
SYa6IKTeSucZZYvXbdX/RnsWwQpLx6m44fXWjEkGJT6RRy8WdQtwfSehq/pWnqX4
F8ebMqYLl41Tb6W1Rd7nLxGBFkIP/vN7T14ILO4pUzrftLr4CDu3UDkXDekIIvKa
SbKQwxW+2S6Qy/gaF2A5Rca3d6GlcBei5tZEYYR4pbat+tlSSqlktC/afw2ApQgP
6sEPhs7neK7AXSRWQnEnco+WJxa43Vh6BRJoZiJJOqS6rdE74UGVkefS0Vc+UexK
4OOaSfAdHkmLhSuH7oakjmiQ4WUspQgjml9GHZ96u8IqEex5Ycz0NaQbORvlbeLC
cKhkkVGXbcPgGOaYk6j2VSVMHjcEdk33aOF9a1mivRs7rPXXPd+Tmp5pMHroboME
MCKm2RzSLb84BzwP6Sl6G1FNuNFcTTts4wXQ/19t/dP88HXcgw8=
=IFG8
-----END PGP SIGNATURE-----

--nextPart4443138.kQq0lBPeGt--




