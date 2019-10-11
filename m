Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53FD46AB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:34:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyiE-0001sQ-1t; Fri, 11 Oct 2019 17:28:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIyiC-0001sL-11
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 17:28:20 +0000
X-Inumbo-ID: 8445d65e-ec4c-11e9-beca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8445d65e-ec4c-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 17:28:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D4692064A;
 Fri, 11 Oct 2019 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570814899;
 bh=242MhkZW/KlMQOQ6t8iNMdsTZiZdr+TstnON3v5WQtY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pDK3mVkJIf6NoaTaz5LziLr2ttxJrLBAEXvZNqhp5QutFUQsUAGcZP7OY/CnVRRM6
 /g3av2Z+ZivRNlu6fwESKVxqBSIl2WOtRRPGCWJxVwQGJ0gweOs4UUzX9iHK/tbLSq
 8iqz7vN0MCg5vszfqRy29ePDGTnzZHCBEToXIfrU=
Date: Fri, 11 Oct 2019 10:28:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <19EF7B19-538A-45CD-BF1D-6F9DBB9853C8@citrix.com>
Message-ID: <alpine.DEB.2.21.1910111025240.6326@sstabellini-ThinkPad-T480s>
References: <F3EDAC03-A573-4E60-8D0C-8D84949E796B@citrix.com>
 <f5e20757-88ba-dabf-b68a-b6edc3ca1619@citrix.com>
 <1B92007E-ACB4-46D6-ADF5-808962A1FCB7@citrix.com>
 <8d8887c0-4ed0-700b-ea6e-1e5ac58b4f6b@suse.com>
 <19EF7B19-538A-45CD-BF1D-6F9DBB9853C8@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2064015847-1570814898=:6326"
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Committers <committers@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2064015847-1570814898=:6326
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 11 Oct 2019, Lars Kurth wrote:
> ﻿On 11/10/2019, 09:32, "Jan Beulich" <jbeulich@suse.com> wrote:
> 
>     On 10.10.2019 20:30, Lars Kurth wrote:
>     > On 10/10/2019, 18:05, "Andrew Cooper" <Andrew.Cooper3@citrix.com> wrote:
>     >     On 10/10/2019 13:34, Lars Kurth wrote:
>     >     > Existing formats and licenses
>     >     > * Hypercall ABI Documentation generated from Xen public headers
>     >     > Format: kerndoc
>     >     > License: typically BSD-3-Clause (documentation is generated from public headers)
>     >     
>     >     Its homegrown markup&perl, superimposed on what used to be doxygen in
>     >     the past.
>     > 
>     > Oh, I forgot
>     >     
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
>     
>     Well, for migration v2 having the spec in a text file seems sensible
>     to me. For the public ABI, however, I think it's more helpful to have
>     the doc next to the actual definitions. Considering the possible use
>     of languages other than C I can certainly see why separating both
>     would be even more clean, but I think here we want to weigh practical
>     purposes against cleanliness.
> 
> I think that is an area where we need to build some consensus. The problem
> falls under what is considered "traceability" in safety speak: in other words, 
> for the ABI documentation use-case it must be easy to be able to
> keep documentation and code in sync. And ideally, we would be able to
> check this automatically somehow, or have a bot provide hints such as 
> "You changed XYZ and should have a look and check whether ABC needs
> changing also".
> 
> I have thought about the problem of "traceability" for some time, which
> goes far beyond what we need for this use-case. Typical things that need
> to be maintained for a "traceable (safety) documentation set" are
> 
> ## Keeping key docs and code in sync 
> The use-cases here are things such as
> - keep man pages and xl sources in sync
> - keep ABI docs and headers in sync
> - keep documents such as the migration b2 spec in sync with
>   actual source
>  
> This is a problem we already have today and where we do this often
> fairly poorly manually (as can be seen on how out-of-date
> man pages often are)
> 
> Possible solutions for this are
> - store docs alongside headers (maybe using the same base
> file name) => that would work for ABI docs
> 
> - have some tagging or meta-information scheme which links
> specific source files to docs files => that would work for most
> other docs (albeit not always perfectly - e.g. when functionality
> is spread over many files and just portions of them)
> 
> For example: tools/xl/xl_cmdtable.c  
> is linked to files in docs/man/xl*
> 
> This means creating a bot/tool which warns that when you change
> foo.c to also look at foo.rst and/or ../../docs/.../bar.rst should be
> relatively straightforward. It would require some initial effort
> to create initial mappings, but these would never really change,
> unless we refactor code significantly.
>      
> ## Keeping dependent documents (or portions of documents) in sync
> This is something we have not really faced, because we do not
> have a lot of docs.  
> 
> In a large documentation set having the right chapter/tree
> structure enables this. In waterfall software engineering
> models, where you start off with high-level documents/
> requirements/specs/etc. documents which become
> increasingly detailed this is done through a chapter/tree
> structure, with the capability to make separate documents
> (or sections thereof) on other documents (or sections
> thereof). When you change something, a tool such as DOORS 
> forces you review and sign off child documents.
> 
> This is conceptually similar to what we would need for
> "linking" sources to docs as outlined above, only that
> the "linking" is between docs. It would also be easy enough
> to check and highlight, what else may have to be looked at.  
> 
> ## Proving that your tests verify design claims and that *all claims* are tested
> This is typically the hardest problem to solve. It requires
> for test cases (be it a document or actual code) to
> link to claims (in a design, architecture, spec, ...)
> and to prove that all of them are tested.
> 
> If there is linkage capability, then it is straightforward
> to verify automatically that all your branches have
> test-case leaves in your documentation tree. But at least
> in a safety context you would also have to augment this
> with code coverage information. 
> 
> But for the purpose of this discussion, this use-case
> does not add any extra linkage capability other than
> being able to tell whether a piece of doc/code
> is a test case.
> 
> ## In summary
> I feel that having some basic linkage mechanism    
> between key documents and key documents of
> code is generally valuable for the community as a
> whole, if we can tie to some checking into it.
> 
> For rst docs we already have linkage via the
> ".. toctree::" directives, which may be entirely
> sufficient. But we don't have linkage from source
> to docs. 
> 
> Building some checking around this should not
> be too hard, in particular in light of the CIv2
> checking we agreed (but is somewhat stalled).
> 
> Enabling the same checks to be run locally (before)
> sending a patch, should also not be too hard.
> 
> I am just raising ideas at this stage. Any opinions
> are highly welcome.

As long as the linking between code and docs is done with a simple
unobtrusive tag, I think it is a good idea. Once we have a proper
checkpatch script in the tree, we could imagine adding a check to
it to see whether any docs need updating.
--8323329-2064015847-1570814898=:6326
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2064015847-1570814898=:6326--

