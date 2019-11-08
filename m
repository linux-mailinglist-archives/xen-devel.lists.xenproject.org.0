Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B57F5445
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:57:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9Pp-0000ql-U4; Fri, 08 Nov 2019 18:55:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iT9Po-0000qd-Vr
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:55:25 +0000
X-Inumbo-ID: 521c84fc-0259-11ea-b678-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 521c84fc-0259-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 18:55:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D76021D7E;
 Fri,  8 Nov 2019 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573239323;
 bh=v8SOJH1R/2XICFakLo0R2Rc+s6+sxIjnt/RPzj5XNoo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=W/G3A6ITBfga176A9Hl9ms678pVJzNF3ydS+3EC8RIRSRpSaBbAa1EUTiqWEQKumo
 HQ2Or3aE6GzYeBmjPBQeV9AubYlxCKBMvQSszPAsTt7gXBRgM0bCKRZBNzvINVacdc
 ApQWafm6RiEDhLyiz17J/krc9K0/RRCstxru43BI=
Date: Fri, 8 Nov 2019 10:55:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <55138017-FA03-49E3-835E-812DB07A5282@citrix.com>
Message-ID: <alpine.DEB.2.21.1911081051120.2677@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910170943580.30080@sstabellini-ThinkPad-T480s>
 <AE96ACE4-E5D6-4B33-B009-AA8B9A7F9AD8@gmail.com>
 <96F5CF4C-B1F6-4523-9130-89E001DC5FD4@citrix.com>
 <43bea02c7b45f360049791ae4c63e062fc40e514.camel@epam.com>
 <55138017-FA03-49E3-835E-812DB07A5282@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1226971039-1573239323=:2677"
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "lars.kurth.xen@gmail.com" <lars.kurth.xen@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "persaur@gmail.com" <persaur@gmail.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1226971039-1573239323=:2677
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 7 Nov 2019, Lars Kurth wrote:
> Hi all,
> 
> I have received informal advice
> 
> ﻿On 21/10/2019, 06:54, "Artem Mygaiev" <Artem_Mygaiev@epam.com> wrote:
> 
>     >  Before we ask Xen FuSA contributors to invest in documentation to
>     > be presented as legally-valid evidence for certification, we should
>     > ask a certified lawyer for their formal opinion on the validity of:
>     >     
>     >       (a) applying a source code license (BSD) to documentation
>     > 
>     > There are also BSD documentation license variants which may be worth
>     > looking at
> 
> There is no LEGAL issue with using a source code license for documentation
> Typically, community issues arise when the license is has a patent clause
> which would act as a possible barrier to contributing to the docs (which should be low)
> 
>     >       (b) moving text bidirectionally between source code (BSD) and
>     > documentation (any license)
>     >       (c) moving text bidirectionally between source code (BSD) and
>     > documentation (CC0)
>     >     
>     > I will raise this at the next SIG meeting
> 
> Fundamentally, you can’t move copyrightable content from any CC-BY-4/CC0 to BSD and vice versa without going through the process of changing a license
> 
> On the community call we discussed Andy's sphinx-docs. Andy made a strong case to keep the docset as CC-BY-4
> It rests on the assumption that user docs will always be different from what's in code and thus there is no need to move anything which is copyrightable between code and the docs
> Should that turn out to be wrong, there is still always the possibility of a mixed CC-BY-4 / BSD-2-Clause docset in future
> So we are not painting ourselves into a corner
> 
> Regarding safety related docs, we discussed
> * CC-BY-4 => this is likely to be problematic as many docs are coupled closely with source
> * Dual CC-BY-4 / BSD-2-Clause licensing does not solve this problem
> * BSD-2-Clause docs would enable docs that 
> 
> Thus, the most sensible approach for safety related docs would be to use a BSD-2-Clause license uniformly in that case

I agree with you.

But at that point for simplicity, wouldn't it be better to use BSD-2 for
all docs?

It is difficult to be able to distinguish between "normal docs" and
"safety docs" in all cases. For instance, a description of the Xen
command line options would be required for safety, but might already
exist as docs under CC-BY-4.

What's the advantage with having some docs CC-BY-4, when we need to have
some other docs BSD-2?

(As you know, I don't care about the specific license, I am only trying
to make our life easier.)
--8323329-1226971039-1573239323=:2677
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1226971039-1573239323=:2677--

