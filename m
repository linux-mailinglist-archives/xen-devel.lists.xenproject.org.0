Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B304CC217
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283489.482516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnsF-0001ut-7u; Thu, 03 Mar 2022 16:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283489.482516; Thu, 03 Mar 2022 16:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnsF-0001sl-4N; Thu, 03 Mar 2022 16:00:15 +0000
Received: by outflank-mailman (input) for mailman id 283489;
 Thu, 03 Mar 2022 16:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylIu=TO=citrix.com=prvs=0548df38f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nPnsE-0001pi-4R
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:00:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0059077b-9b0b-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 17:00:10 +0100 (CET)
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
X-Inumbo-ID: 0059077b-9b0b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646323210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nrm8Mp+phKDtK0cF4inF5uREjViFJTG5FlJb3pZo8/E=;
  b=aic/ryvUQ8WkoU2qkhVAXjmDbZ3bg+xVvJUgf+na0OMaKSW0wtL0Z5YW
   0X7HE/5icahlTpRfeYU/zybGrwsjWFVvaoskOq6ARS75VMdendnzh+5DI
   gis/9GQAwcEmWQr/drU5x6M/b2GGVFQbCyaOphS7sJYghzF4CrW7TRUgT
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65327460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yCc+kaLvrPjYtzSeFE+R0JUlxSXFcZb7ZxGr2PjKsXjdYENShDYOz
 2NLWjvQaf7fajH0eo0iaYSxoxgOv5WBmIRhQANlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dYz2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PNLn4SRTxkFB/Tzvb4wXDtfNR9HbLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6uFP
 ZVFN2IHgBLoXSJfFUUvJaAHgNyLoUvZSy9UsAiRuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4cEhoNTnOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0fdx6C8w89i20k5XxuSuWJG8icAcQd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb5
 hDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0gfhs3bpdfJmKwC
 KM2he+3zMUJVJdNRfUqC79d9uxwlfSwfTgbfqq8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWnDqDLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtZCfQhXdiFgXfgbaaV/L4a+H+avI0l5Y9e5/F/rU9ANc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:Yeh4t6wP3sdKfCEc7DBkKrPxmuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTnyAtj6fZq8z+8/3WB1B9uftWbdyQ+Vxe1ZjLcKhgeQYhEWldQtn5
 uIEZIOb+EYZGIS5amV3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLSIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmFM7rq4m1ucJ+OEzRPBkufJlaQkETTzYJriJbofy/QzdZtvfrWrC3u
 O85yvIdP4DkU85NlvF3CcFnTOQnQrGokWStWOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljpwaZ/HFfOhyL4o9fBUBZrmk69rT4+nekaiGE3a/psVFZ9l/1qwKpuKuZ2IMs60vFWLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpR+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOFl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hywlgF/NLwgF5vsumaSR4IeMO4YDGRfzOWwTrw==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65327460"
Date: Thu, 3 Mar 2022 16:00:05 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 16/29] libs,tools/include: Clean "clean" targets
Message-ID: <YiDmBTEihSFCyty4@perard.uk.xensource.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-17-anthony.perard@citrix.com>
 <d5770e63-7d63-427d-1ca6-02982b5fa00e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5770e63-7d63-427d-1ca6-02982b5fa00e@suse.com>

On Thu, Mar 03, 2022 at 09:21:48AM +0100, Juergen Gross wrote:
> On 25.02.22 16:13, Anthony PERARD wrote:
> > diff --git a/tools/include/Makefile b/tools/include/Makefile
> > index d965987f55..3a03a0b0fa 100644
> > --- a/tools/include/Makefile
> > +++ b/tools/include/Makefile
> > @@ -82,6 +82,7 @@ uninstall:
> >   clean:
> >   	rm -rf xen xen-xsm acpi
> >   	$(MAKE) -C xen-foreign clean
> > +	rm -f _*.h
> 
> Use $(RM) instead? OTOH this could be done in a patch of its own
> switching all rm -f instances to $(RM).

This isn't really something that I think matter. Per GNU make's manual,
"rm" need to exist. Without it part of the build system could be broken.
Also setting $(RM) to something other than "rm -f" isn't going to work
well either. So whether we use $(RM) or `rm -f` shouldn't matter.

All of that to say that I'm not necessarily change one for the other. It
mostly depends on context.

Also, I might change those "clean:" rules later to collect files to
clean in a variable $(&CLEAN_FILES), when that will be possible.

> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks,

-- 
Anthony PERARD

