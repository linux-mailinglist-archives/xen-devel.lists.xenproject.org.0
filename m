Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44D588AD7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379793.613568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJC46-0008WK-7g; Wed, 03 Aug 2022 10:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379793.613568; Wed, 03 Aug 2022 10:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJC46-0008Sq-33; Wed, 03 Aug 2022 10:57:26 +0000
Received: by outflank-mailman (input) for mailman id 379793;
 Wed, 03 Aug 2022 10:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJC44-0008Sk-ET
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:57:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bfc13a1-131b-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 12:57:22 +0200 (CEST)
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
X-Inumbo-ID: 0bfc13a1-131b-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659524242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KaY79Xl4dkjDdgDqC7nQyB351blkVF47xGcX3lDU3yo=;
  b=BVDIAjxOvXDNr9Iop0L08+iHOHtcFv3EkCTmLFsF6zRd4e0Rg71NISL5
   dfWgRwXCKWtk3GNZiZ/PaYeZWODo0etgmuXsCih+iorujsJK8XXZAxbEl
   NLBrbKeeKGuPJ0OssCnPVTDtiCXoX6ShcDm3bJhG7ojR/KB4rxNDopZbi
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76521373
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OPzZvarlyj6OqqIFjbYF7TqsVu1eBmJgZRIvgKrLsJaIsI4StFCzt
 garIBnXaP/YNjajLd0iaN7koExTsJHRy4RkS1NpryxgFH8QoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GtD5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUg+blbLm1i/
 8caFwkfVi26vOmv0piCH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWLJ4bTHpoO9qqej
 mLj/zqnGC5KD+yklDy63FiilMKTnwquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOuMYoSBQw2
 1SOntevAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHbo94foR7jRO1hL5entuDMIjrp0
 Rqz+X1Wa6oosSIb60mq1QmZ3mPw/sWQE1RdChb/BTz8sF4gDGKxT8nxsAWAs64dRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyzyGsnTKuRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq4B6yKM4YUPMMtJWdrGR2CgmbJhwjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPSb9YepUbzOzghURtvzsTPP9r
 4kCbKNnCnx3DIXDX8Ug2ddNdg1bdyNqXM+eRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:SeBK+KGVViudCsjBpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="76521373"
Date: Wed, 3 Aug 2022 11:57:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/7] tools/ocaml/Makefile: do not run ocamldep during
 make clean
Message-ID: <YupUhpinFKt2Dl0s@perard.uk.xensource.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <835ba84cf1fb7619fa6672d194aaf279795a5246.1659116941.git.edvin.torok@citrix.com>
 <6b7a9b52-d378-f404-57a9-20b148f2e7a2@suse.com>
 <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <FEF021F3-739B-4585-82D6-D13CDCBBC24F@citrix.com>

On Wed, Aug 03, 2022 at 10:24:26AM +0000, Edwin Torok wrote:
> 
> -ifneq ($(MAKECMDGOALS),clean)
> +ifeq (,$(findstring clean,$(MAKECMDGOALS)))

I think it would be better with $(filter-out,):

    ifeq (,$(filter-out %clean,$(MAKECMDGOALS)))

>  .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
>  	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)

Also, don't hide this rule, instead, hide the "-include", there is no
need to have make waist time trying to find a rule to make
".ocamldep.make" and failing when not needed.

>  endif
> --
> 2.34.1

-- 
Anthony PERARD

