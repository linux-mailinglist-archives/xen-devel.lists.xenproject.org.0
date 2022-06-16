Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813954E201
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 15:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350619.577064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1pbt-0007Hm-7Z; Thu, 16 Jun 2022 13:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350619.577064; Thu, 16 Jun 2022 13:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1pbt-0007F1-4t; Thu, 16 Jun 2022 13:32:33 +0000
Received: by outflank-mailman (input) for mailman id 350619;
 Thu, 16 Jun 2022 13:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWHJ=WX=citrix.com=prvs=15945cc1a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o1pbr-0007Ev-Ed
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 13:32:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c40e3721-ed78-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 15:32:30 +0200 (CEST)
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
X-Inumbo-ID: c40e3721-ed78-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655386350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SC4qIvbuwA7oS8jkKI4cMaKo4B/88ao12Qc7MfCExZA=;
  b=U8FFvxkg2RLXpFBlen++E36OWHWSyZjamUzEI4sbhIMPrdWArb8RNFdt
   V4ZXxTiqpxX5kfwM9ctYyQvZisRcXpPAu1uSbAHMfE7ZOtq1BsPz8yvxU
   L6mjCMhTJm5XEqVFJ0JuDD6BprS1PRideG8IuETU3V66sqo6cBKwDGTDG
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73754237
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rzyrgKLIrRnDWjqUFE+RCpUlxSXFcZb7ZxGr2PjKsXjdYENS1GQDn
 2obCzqAbP2MN2v2c4h3YIW/o00CusCGn95iSQZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3Nc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVWkMSvSygxBJHrn7waSEBfFAZ4P4QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQq2BO
 pZDMmUHgBLoJB9SZmcLAbUEhqSBgXv1YgNnshWFqv9ii4TU5FMoi+W8WDbPQfSGTNtYtlyVr
 WXH+yL+GB5yHN6VxCeB83msrvTShi69U4UXfJW66/prjVu71mEVThoMWjOTrP20jEf4RtxeL
 lAP9zQnha8o/UevQ5/2WBjQiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZiFFQMwrsokxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4db5p5oopgnSVdslG6mw5vXuEDTtz
 jTMsCg/jbwOidIj2qOguFTWhDTqoYLGJjPZ/S2OADjjtFkgItf4Ocr4sjA38MqsMq65VXzZo
 3org/Kiy+dWCorUkyuqRuckSeTBC+m+DNHMvbJ+N8B/qmn3oiH5I9w4DCJWfxkwbJtdEdP9S
 AqK4F4KuscOVJe/RfUvC79dHfjG2kQJ+T7NcvnPJuRDbZFqHONs1HE/PBXAt4wBfaVFrE3eB
 Xt4WZz1ZZriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlYbQDXPrhkvfrb+205F
 uqz0OPTk31ivBDWOHGLoeb/03hRRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscRmCRpIwMzr2g1
 ijkAidwkQOj7VWaeVTiQi0yM9vHAMcgxU/XyARxZD5ELVB4Ot3xhEreHrNqFYQaGBtLl6IkF
 6JYJZveXZyiiF3volwgUHU0l6Q6HDzDuO5EF3PNjOQXF3K4ezH0xw==
IronPort-HdrOrdr: A9a23:8Rawra85c3rmc2V73y9uk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.92,305,1650945600"; 
   d="scan'208";a="73754237"
Date: Thu, 16 Jun 2022 14:32:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, David Scott
	<dave@recoil.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [XEN PATCH v2 00/29] Toolstack build system improvement, toward
 non-recursive makefiles
Message-ID: <Yqsw5mmC8KHVbtrb@perard.uk.xensource.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>

Hi,

There's quite a few patch in this series that are reviewed and could be
committed. The one reviewed don't depends on the other ones.

The list I've gathered that I think are reviewed properly are:

11: tools/xenstore: Cleanup makefile
14: libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
15: libs: Remove need for *installlocal targets
16: libs,tools/include: Clean "clean" targets
17: libs: Rename $(SRCS-y) to $(OBJS-y)
18: libs/guest: rename ELF_OBJS to LIBELF_OBJS
19: libs/guest: rework CFLAGS
20: libs/store: use of -iquote instead of -I
21: libs/stat: Fix and rework python-bindings build
22: libs/stat: Fix and rework perl-binding build
24: stubdom: introduce xenlibs.mk
25: tools/libs: create Makefile.common to be used by stubdom build system
26: tools/xenstore: introduce Makefile.common to be used by stubdom
27: stubdom: build xenstore*-stubdom using new Makefile.common
28: stubdom: xenlibs linkfarm, ignore non-regular files
29: tools/ocaml: fix build dependency target

(I didn't a run with them on our gitlab ci, and no build issue.)

Thanks,

-- 
Anthony PERARD

