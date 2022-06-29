Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ECD55FDA6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357795.586605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VAW-0006H3-Mk; Wed, 29 Jun 2022 10:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357795.586605; Wed, 29 Jun 2022 10:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VAW-0006Eb-Jx; Wed, 29 Jun 2022 10:43:36 +0000
Received: by outflank-mailman (input) for mailman id 357795;
 Wed, 29 Jun 2022 10:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iMtf=XE=citrix.com=prvs=172cd6ca3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o6VAV-0006EV-96
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:43:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 516c6f0b-f798-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 12:43:33 +0200 (CEST)
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
X-Inumbo-ID: 516c6f0b-f798-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656499413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RLWqZnvkENPRN1tooOkPezJsvJ8KPMIm6oJBRyshOmI=;
  b=FR90wqeRhjVM6j8jrPfToU6SEf5f3ChFyTd+O2MMAhk7OzfZ0rAoP+SF
   tq/FNFwwhLlxB3rJmc+Hq/4re+U1yDhap5ZXt2zezXWvN2AnVa05EevKc
   Chf4jDH7MIsfp7WA1Vb+IYRaqOfU+iGdY+HlevofB7weQTnoV9K7Q36xN
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74008342
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fe4wN665fXRuE//MMqHhngxRtHPHchMFZxGqfqrLsTDasY5as4F+v
 mMZUW/Sbq6PZGH3LYwiO4W/9klTupTSy4AyQFZsrC4xHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjUlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSNSCIuEfyQxt1ESgR6LjNDJrZL/uTYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VFMWI/N0iaC/FJElEJMZc8mtuYv1e8UW1mhE/Eq5MzxWeGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQnX+huTFNB4RpSvQnyjyf97HP7gDCGT1RJtJeU+DKpPPaVBRzi
 ALXxIOxWmA32FGGYSnDr+nJ9FteLQBQdDZfPnFcEGPp9vG5+OkOYgTzosGP+UJfpvn8AnnOz
 j+Dt0DSbJ1D3JdQh81XEb0q6g9AR6QlrSZvv207pkr/smtEiHeNPuREE2Tz4/daN5q+RVKcp
 nUCkMX2xLlQUM/RyHXUHr5dQe3BCxO53Nv02A8H834Jp1yQF4OLJ9gMsFmS2m8zWir7RdMZS
 BCK4l4AjHOiFHCrcbV2c+qMNije9oC5TY6NfqmNNrJmO8EtHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp78Ux73yM1PkVKLegvq+eRwmHxumT+DFM6TItbO+eP2WUN5gIwtaDOmBt3VJovdyOkJ2
 76z7/e39ig=
IronPort-HdrOrdr: A9a23:V6dkr6AZeM8K4YrlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74008342"
Date: Wed, 29 Jun 2022 11:43:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 0/2] xen: Report and use hardware APIC virtualization
 capabilities
Message-ID: <Yrwste7T5DSeazjh@perard.uk.xensource.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <e16b3b4b-45f3-a520-0360-c1d59602469b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e16b3b4b-45f3-a520-0360-c1d59602469b@suse.com>

On Thu, Jun 23, 2022 at 09:23:27AM +0200, Jan Beulich wrote:
> On 13.04.2022 13:21, Jane Malalane wrote:
> > Jane Malalane (2):
> >   xen+tools: Report Interrupt Controller Virtualization capabilities on
> >     x86
> >   x86/xen: Allow per-domain usage of hardware virtualized APIC
> > 
> >  docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
> >  docs/man/xl.conf.5.pod.in             | 12 +++++++++++
> >  tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
> >  tools/golang/xenlight/types.gen.go    |  4 ++++
> >  tools/include/libxl.h                 | 14 +++++++++++++
> >  tools/libs/light/libxl.c              |  3 +++
> >  tools/libs/light/libxl_arch.h         |  9 ++++++--
> >  tools/libs/light/libxl_arm.c          | 14 ++++++++++---
> >  tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
> >  tools/libs/light/libxl_types.idl      |  4 ++++
> >  tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
> >  tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
> >  tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
> >  tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
> >  tools/xl/xl.c                         |  8 +++++++
> >  tools/xl/xl.h                         |  2 ++
> >  tools/xl/xl_info.c                    |  6 ++++--
> >  tools/xl/xl_parse.c                   | 19 +++++++++++++++++
> >  xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
> >  xen/arch/x86/hvm/hvm.c                |  3 +++
> >  xen/arch/x86/hvm/vmx/vmcs.c           | 11 ++++++++++
> >  xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
> >  xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
> >  xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
> >  xen/arch/x86/sysctl.c                 |  4 ++++
> >  xen/arch/x86/traps.c                  |  5 +++--
> >  xen/include/public/arch-x86/xen.h     |  5 +++++
> >  xen/include/public/sysctl.h           | 11 +++++++++-
> >  28 files changed, 281 insertions(+), 34 deletions(-)
> > 
> 
> Just FYI: It's been over two months that v10 has been pending. There
> are still missing acks. You may want to ping the respective maintainers
> for this to make progress.

Hi Jan,

Are you looking for a ack for the "docs/man" changes? If so, I guess
I'll have to make it more explicit next time that a review for "tools"
also mean review of the changes in their respective man pages.

Or are you looking for a ack for the "golang" changes? Those changes are
automatically generated by a tool already in our repository.

Or is it an "ocaml" ack for the first patch? Unfortunately, the
maintainers haven't been CCed, I guess that could be an issue.

Cheers,

-- 
Anthony PERARD

