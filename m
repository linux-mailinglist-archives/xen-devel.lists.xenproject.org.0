Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A89FEB4E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 23:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863625.1275000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSOFn-00068S-LC; Mon, 30 Dec 2024 22:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863625.1275000; Mon, 30 Dec 2024 22:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSOFn-000666-H5; Mon, 30 Dec 2024 22:28:51 +0000
Received: by outflank-mailman (input) for mailman id 863625;
 Mon, 30 Dec 2024 22:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSOFm-000660-00
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 22:28:50 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70074a8e-c6fd-11ef-a0db-8be0dac302b0;
 Mon, 30 Dec 2024 23:28:48 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id BB47C5030C1;
 Mon, 30 Dec 2024 23:28:45 +0100 (CET)
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
X-Inumbo-ID: 70074a8e-c6fd-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735597727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ita93vdWUbvoarX6Q3Ge6UGZ9iYdaMP4K/oLl5RKmw=;
	b=jSupqSZyQnHrIPGAS/o6lQ9KS9pHIYJuWLuPM7lKzVDecwmIE5Mp4BQb0sYROkJcn6HEVn
	YR4HJKvfEysI9e0/pNqgu5rBgGbG2atv+fNND8W1Ei5AAY5Ndk/rS/ijsXkUioRwP4yDC3
	xPcieNSJaWNfn43E6V+pu2ZrPjaPeHh4obuYuUYRMUXYHJVxdVCHA4SEDE1dhZQ4xq20D4
	RBNWx6fWW8VgG0sGjPMko/exdowLTjACLXscwqsh6M5lBSnGbdpfPo36jhNQR1zS84j9ai
	Bmya8af4wjLVunpNrWeDR3VuO+4AB0X110Ozd90JNkC+K27mGKsEzhJmpoEEzw==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [XEN PATCH 2/5] docs: set DATE to SOURCE_DATE_EPOCH if available
Date: Mon, 30 Dec 2024 23:28:42 +0100
Message-ID: <2637960.Lt9SDvczpP@localhost>
In-Reply-To: <25f9fabf-1239-4465-92c9-484fc24fc4f7@citrix.com>
References:
 <cover.1735585600.git.maxi@daemonizer.de>
 <1ad1283052a580cbe7dbd7581b64f3cfd87cbf88.1735585600.git.maxi@daemonizer.de>
 <25f9fabf-1239-4465-92c9-484fc24fc4f7@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4398195.ejJDZkT8p0";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4398195.ejJDZkT8p0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Mon, 30 Dec 2024 23:28:42 +0100
Message-ID: <2637960.Lt9SDvczpP@localhost>
In-Reply-To: <25f9fabf-1239-4465-92c9-484fc24fc4f7@citrix.com>
MIME-Version: 1.0

On Montag, 30. Dezember 2024 22:38:24 CET Andrew Cooper wrote:
> On 30/12/2024 9:00 pm, Maximilian Engelhardt wrote:
> > Use the solution described in [1] to replace the call to the 'date'
> > command with a version that uses SOURCE_DATE_EPOCH if available. This
> > is needed for reproducible builds.
> > 
> > The -d "@..." syntax was introduced in GNU date about 2005 (but only
> > added to the docuemntation in 2011), so I assume a version supporting
> > this syntax is available, if SOURCE_DATE_EPOCH is defined. If
> > SOURCE_DATE_EPOCH is not defined, nothing changes with respect to the
> > current behavior.
> > 
> > [1] https://reproducible-builds.org/docs/source-date-epoch/
> > 
> > Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
> > ---
> > 
> >  docs/Makefile | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/Makefile b/docs/Makefile
> > index b30cc619f8..beba02a94f 100644
> > --- a/docs/Makefile
> > +++ b/docs/Makefile
> > @@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
> > 
> >  -include $(XEN_ROOT)/config/Docs.mk
> >  
> >  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory
> >  xenversion)> 
> > -DATE		:= $(shell date +%Y-%m-%d)
> > +
> > +DATE_FMT	:= +%Y-%m-%d
> > +ifdef SOURCE_DATE_EPOCH
> > +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
> > 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
> > 2>/dev/null || date -u "$(DATE_FMT)") +else
> > +DATE		:= $(shell date "$(DATE_FMT)")
> > +endif
> > 
> >  DOC_ARCHES      := arm x86_32 x86_64
> >  MAN_SECTIONS    := 1 5 7 8
> 
> While this looks fine for docs, there's another (identical) use of date
> in tools/firmware/hvmloader/Makefile, as well as some differing uses to
> construct XEN_BUILD_{DATE,TIME}.  INSTALL talks about VGABIOS_REL_DATE too.
> 
> Does something like this work for you?  It seems to DTRT for SMBIOS.  It
> needs adapting a bit more for vgabios and Xen, but I think having one
> common $(date) is going to be better than ad-hoc ones over the tree.
> 
> ~Andrew

Hi Andrew,

Thanks for your quick reply. Your patch looks fine to me. You can add my 
Tested-by.

We currently use "export XEN_BUILD_{DATE,TIME}=...", "export 
SMBIOS_REL_DATE=..." and "export VGABIOS_REL_DATE=..." for building xen in 
Debian, so we did not run into reproducibility problems with these. But having 
them combined to all use SOURCE_DATE_EPOCH if available sounds like a good 
idea and would also benefit other downstream users.

Maxi
--nextPart4398195.ejJDZkT8p0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmdzHpoACgkQgepkfSQr
0hVIMQ/+KKq0VeyjhWQZJA1tY4t8aYU+DJavX6G9jTzJfYHUx3ZTx7sLoI4Ji9kb
YlAADW6VFvn4CDCJBaX/CbXHSlv4aX9xOBlwx1VlG05fmZ62WnsPy9xAcxBIXyEe
3DcSPVt5GOBmL+cwkXpdQqfE2Ffeftudq4gAfiwn5NiTZA/Mqf4n0Uij1eJgd316
MQAFvPPHqgDYFJQiBf2HbKwlvdhLuDUl0hGM7NUflyu9hzhChQRKTZZ/k32OcFMm
Q7y8Gvldv29RPPEKLxp4N/49ekBXkQ1BULM4I4dIh4cfF3rPPDWNaL1uLPhcDPZb
KCmLKfPJhcwT/R/HN3rTIUAJIRzhZzuxIh7QJsl/vpnjB8LsD3DQ0WqPfPPXNJxr
fjjP5nlQr6KsMjIhOcuphujYLGHkWLZtDlw5Fth1fkhfI5tVndJ40gVt8b4Hl3Cw
cFS0CKZMvijPPhlrWQFTQkOny7eUM8dQgaxXq5S9nMajdI4Dh6s3FbAEl5eVBBt2
yiXCuJK6Ez1loXH49lb97oW+YAOmVQdgt2+1NfnE5o02RyuQfeLGF59H6Q6eQW8x
IsnMxMurA4EroZ9+58eleJyaddGEVjpnGxlJTbLMveK9HBl/HipGaGFEg0AmtvsS
YzJc+aOjmDP0LzNmL+JvVtZxcFOMzoiaOKFt/GPScJKzQsvwDZI=
=xmWe
-----END PGP SIGNATURE-----

--nextPart4398195.ejJDZkT8p0--




