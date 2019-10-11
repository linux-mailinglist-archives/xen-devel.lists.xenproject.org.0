Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47AED46CB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyn8-0002cW-Nk; Fri, 11 Oct 2019 17:33:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIyn6-0002cR-Us
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 17:33:24 +0000
X-Inumbo-ID: 39bf52a8-ec4d-11e9-933e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39bf52a8-ec4d-11e9-933e-12813bfff9fa;
 Fri, 11 Oct 2019 17:33:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05DAD2084C;
 Fri, 11 Oct 2019 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570815203;
 bh=20h0+7elhhXssp+S0sFyoe7teef2pg6WUCc+Jk5QtPs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kv+81Y7dyKUsP7yOudnNi/ZvjqqNJ4Y82rrmKjZXTjE+2pEdmNVNWPKn5btEM32XM
 2r2+t9bx4kl8oAfm70UFYJfhrzgeBxlYBJhSmihetD0qGB/b4vllUWexc5AoGslKnf
 pcAUGjvGyZH4l+1jgbjpRbHvOsM6K3XhX1/zIVpw=
Date: Fri, 11 Oct 2019 10:33:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <85313DBD-6C0F-4154-99D5-211C849FA3E1@citrix.com>
Message-ID: <alpine.DEB.2.21.1910111028230.6326@sstabellini-ThinkPad-T480s>
References: <F3EDAC03-A573-4E60-8D0C-8D84949E796B@citrix.com>
 <f5e20757-88ba-dabf-b68a-b6edc3ca1619@citrix.com>
 <1B92007E-ACB4-46D6-ADF5-808962A1FCB7@citrix.com>
 <alpine.DEB.2.21.1910101802470.9081@sstabellini-ThinkPad-T480s>
 <85313DBD-6C0F-4154-99D5-211C849FA3E1@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1532567449-1570814974=:6326"
Content-ID: <alpine.DEB.2.21.1910111029480.6326@sstabellini-ThinkPad-T480s>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1532567449-1570814974=:6326
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1910111029481.6326@sstabellini-ThinkPad-T480s>

On Fri, 11 Oct 2019, Lars Kurth wrote:
> ﻿On 11/10/2019, 02:24, "Stefano Stabellini" <sstabellini@kernel.org> wrote:
> 
>     On Thu, 10 Oct 2019, Lars Kurth wrote:
>     > * Would we ever include API docs generated from GPLv2 code? E.g. for safety use-cases?
>     > @Stefano, @Artem: I guess this one is for you. 
>     > I suppose if we would have a similar issue for a safety manual
>     > I am also assuming we would want to use sphinx docs and rst to generate a future safety manual
>     
>     Hi Lars,
>     
>     Thanks for putting this email together.
>     
>     In terms of formats, I don't have a preference between rst and pandoc,
>     but if we are going to use rst going forward, I'd say to try to use rst
>     for everything, including converting all the old stuff. The fewer
>     different formats, the better.
> 
> I think the proposal that needs to follow on from this (which would at some
> point need to be voted on) would then be to go for rst. 
>     
>     As I mentioned during the FuSa call, I agree with you, Andrew, and
>     others that it would be best to have the docs under a CC license. I do
>     expect that we'll end up copy/pasting snippets of in-code comments into
>     the docs, so I think it is important that we are allowed to do that from
>     a license perspective. It is great that GPLv2 allows it (we need to be
>     sure about this).
> 
> The GPL does *not* allow this, but (c) law and fair use clauses do. So typically
> stuff such as
> * Referring to function names, signatures, etc. tend to be all fine
> * Copying large portions of in-line comments would not be fine, but
> If they are large, they would in most cases be re-written in a more suitable
> language. 
> 
> So, I think overall, we should be fine. It's a bit of a grey area though.
> 
> And as you point out below, most of the code in question is typically BSD 
>     
>     Yes, I expect that some docs might be automatically generated, but from
>     header files, not from source code. Especailly public/ header files,
>     which are typically BSD, not GPLv2. I cannot come up with examples of
>     docs we need to generated from GPLv2-only code at the moment, hopefully
>     there won't be any.
>     
> That makes things a lot easier.    
>          
>     >     I wasn't planning on reusing any of the markup, and wasn't expecting to
>     >     use much of the text either.  I'm still considering the option of
>     >     defining that xen/public/* isn't the canonical description of the ABI,
>     >     because C is the wrong tool for the job.
>     >     
>     >     Its fine to provide a C set of headers implementing an ABI, but there is
>     >     a very deliberate reason why the canonical migration v2 spec is in a
>     >     text document.
>     > 
>     > @Stefano: as you and I believe Brian will be spending time on improving the
>     > ABI docs, I think we need to build some agreement here on what/how
>     > to do it. I was assuming that generally the consensus was to have
>     > docs close to the code in source, but this does not seem to be the case.
>     > 
>     > But if we do have stuff separately, ideally we would have a tool that helps
>     > point people editing headers to also look at the relevant docs. Otherwise it will
>     > be hard to keep them in sync.
>     
>     In general, it is a good idea to keep the docs close to the code to make
>     it easier to keep them up to date. But there is no one-size-fits-all
>     here. For public ABI descriptions, I agree with Andrew that ideally they
>     should not be defined as C header files.
>     
>     But it is not an issue: any work that we do here won't be wasted. For
>     instance, we could start by adding more comments to the current header
>     files. Then, as a second step, take all the comments and turn them into
>     a proper ABI description document without any C function declarations.
>     It is easy to move English text around, as long as the license allows it
>     -- that is the only potential blocker I can see.
> 
> This is likely to be problematic. First of all, we are talking about BSD-3-Clause
> or BSD-2-Clause code (the latter is more dominant in headers I believe) in
> all known cases.
> 
> The main properties of the BSD are
> 1: Can be pretty much used anywhere for any purpose
> 2: Can be modified for any purpose 
> 3: But the original license header must be retained in derivates
> 
> Does *not* have requirements around attribution as CC-BY-4: however,
> as we store everything in git attribution is handled by us by default
> 
> CC-BY-4 also has properties 1-3
> In addition: it does require that 
> 4: Derived works are giving appropriate credit to authors 
>     We could clarify in a COPYING how we prefer to do this
>     4.1: We could say that "referring to the Xen Project community" 
>             is sufficient to comply with the attribution clause
>     4.2: We could require individual authors to be credited: in that
>             case we probably ought to lead by example and list the authors
>             in a credit/license section and extract the information from
>             git logs when we generate it (at some point in the future)
> 5: You give an indication whether you made changes ... in practice
> this means you have to state significant changes made to the works
> 
> As such, BSD-2/3-Clause in our context works similarly to CC-BY-4
> from a downstream's perspective. In fact CC-BY-4 is somewhat stricter
> 
> This seems to say to me that the most pragmatic way forward is to create 
> these new ABI documents under BSD-2/3-Clause and accept that the
> produced work is not fully CC-BY-4 (but in all practical terms behaves
> as if it were). The only downside I can see is a slightly less pure
> COPYING, README or credit/license section in the generated document
> but for practical use there is no actual difference.

FWIW I am OK with this. In fact, I think it is a good idea because it
does look like that it will make comments and text easier to move
around, which far overcome the small downside.
--8323329-1532567449-1570814974=:6326
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1532567449-1570814974=:6326--

