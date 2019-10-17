Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726FDB2E1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 18:56:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL91Y-0003QB-2e; Thu, 17 Oct 2019 16:53:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RBGG=YK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iL91X-0003Q5-1J
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 16:53:15 +0000
X-Inumbo-ID: 9bb85e19-f0fe-11e9-93d4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bb85e19-f0fe-11e9-93d4-12813bfff9fa;
 Thu, 17 Oct 2019 16:53:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2984C20872;
 Thu, 17 Oct 2019 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571331193;
 bh=Ea5SMM6cjMOJRY/czrTUjEOaPMAHpbNgc/Ux5urGkas=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qDpnvU3gMTh9AvhQZ7n+QKkEcL5W9w3hp8WsdnxG6K2Q+kHjoWeixKYZS9YCQaUzY
 pXtsLlhnPUA9mm8XNR2Xis+z15B453l3XDgxYahrma2DA7tE19rO/jA9YKQKKH1fCz
 TJRxPwWHn8VkodobYJO6eflrWt7YVF0CeApKB7Zk=
Date: Thu, 17 Oct 2019 09:53:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rich Persaud <persaur@gmail.com>
In-Reply-To: <A121740C-3C3C-4851-9475-F5929A5A8A99@gmail.com>
Message-ID: <alpine.DEB.2.21.1910170943580.30080@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910170926030.30080@sstabellini-ThinkPad-T480s>
 <A121740C-3C3C-4851-9475-F5929A5A8A99@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1083207293-1571331193=:30080"
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1083207293-1571331193=:30080
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 17 Oct 2019, Rich Persaud wrote:
> On Oct 17, 2019, at 12:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > ﻿On Thu, 17 Oct 2019, Lars Kurth wrote:
> >> ﻿On 16/10/2019, 17:35, "Rich Persaud" <persaur@gmail.com> wrote:
> >> 
> >>>> On Oct 15, 2019, at 08:27, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
> >>> ...
> >>> 
> >>> My point really was is that due to storing the files in git, we essentially do NOT today do this.
> >>> So we would need to take extra action: e.g. manually or through tooling
> >>> 
> >>>>>  4.2: We could require individual authors to be credited: in that
> >>>>>          case we probably ought to lead by example and list the authors
> >>>>>          in a credit/license section and extract the information from
> >>>>>          git logs when we generate it (at some point in the future)
> >>>>> 5: You give an indication whether you made changes ... in practice
> >>>>> this means you have to state significant changes made to the works
> >>>> 
> >>>> This is also helpful for provenance of changes, which is relevant in safety-oriented documentation.  It can be used to clearly delineate CC-licensed content (which may be reused by many companies) from "All Rights Reserved" commercial content that may be added for a specific commercial audience or purpose.
> >>> 
> >>> I agree
> >>> 
> >>> I think the outcome of this analysis is really that the only significant difference between BSD and CC-BY in this context is the  "All Rights Reserved" portion
> >> 
> >>    Also - BSD is a "software" license while CC-BY is a "content" license, so they are not strictly comparable, even if they use similar terminology.
> >> 
> >> True, but as we have noticed the boundary between content and in-code docs content is fuzzy.
> >> 
> >>>> There is a difference between "software" which "runs on machines" and "documentation" which "runs on humans".  Combined software (e.g. BSD code from two origins) is executed identically, despite origin.  Humans make value judgements based on the author/origin of content, hence the focus on attribution.  Yes, there is a provenance graph in git (software/data), but that's not typically visible to human readers, except as a generated report, i.e. documentation.
> >>> 
> >>> Yes true. But also true for CC-BY-4 sources stored in git unless extra action is taken 
> >>> 
> >>> But my point is: 
> >>> * If we take extra action as e.g. proposed in 4.2 we can apply this uniformly to BSD as well as CC-BY pages
> >>> * We can add a section on re-use as proposed in 4.2 which recommends best practices around 5.  
> >>> * We can highlight sections that are BSD vs CC-BY in such a section, such that someone who has issue can remove these easily
> >>> 
> >>> In addition to these points: maybe it is too impractical to create ABI documentation based on CC-BY-4 (given that a lot of what we need is already in BSD sources). 
> >>> We could just copy some of the content in the BSD sources to new CC-BY-4 sources, but in practice it would just be hiding the potential legal issues behind it. 
> >>> Someone could contest the creation and argue that portions of the now CC-BY-4 sources are in fact BSD: in practice this is extremely unlikely, but it is possible.
> >>> 
> >>>>> As such, BSD-2/3-Clause in our context works similarly to CC-BY-4
> >>>>> from a downstream's perspective. In fact CC-BY-4 is somewhat stricter
> >>>> 
> >>>> If we don't want the incentives and provenance properties of CC-BY, there is the option of CC0, which is the equivalent of public domain.  This would delegate the task of separating commercial vs CC content to each reader, without any license-required attribution or separation.
> >>>> 
> >>>> Some background on licenses designed for documentation, which has different legal requirements than software:
> >>>> 
> >>>> https://www.dreamsongs.com/IHE/IHE-50.html
> >>>> https://creativecommons.org/faq/#what-are-creative-commons-licenses (not for s/w)
> >>> 
> >>> I will have a look. But the core issue - which is why I have proposed what I have - is the question on how practically ABI documentation published under CC-BY-4, when much of this information has already been published in the past as code under BSD.
> >> 
> >>    Is there a reference sample of:
> >> 
> >>    - previously published, BSD-licensed, ABI specification-as-source-code
> >> 
> >> All of http://xenbits.xen.org/docs/unstable/hypercall
> >> And some can be content rich as seen in http://xenbits.xen.org/docs/unstable/hypercall/arm/include,public,xen.h.html#Func_HYPERVISOR_mmu_update
> >> 
> >>    - the corresponding FuSA ABI documentation for that source file
> >> 
> >> We do NOT have ANY FuSA documentation at this stage. And there are NO examples of such docs in the public domain
> >> I am waiting for a sanitised smallish system software example to be made available, which should help us identify the practical implications 
> >> However, ABI documentation would be part of it
> >> 
> >>    If there is almost a 1:1 correspondence between ABI "docs" and "code", could the necessary FuSA annotations become part of the source code file, e.g. comments or tags?  Or is there a requirement for the ABI documentation to have a specific layout in a printable report?
> >> 
> >> I don’t think there will be a 1:1 mapping. The documentation would typically be
> >> - Interface docs (e.g. ABI docs) - there will likely be a clean mapping 
> >> - Requirements: specifying what the system is supposed to do - no clean mapping to source
> >> - Designs, Architecture docs, ... - no clean mapping to source
> >> - Test Specs - should have clean mapping to test code, but not to tested code
> >> 
> >> We do still need some sort of tagging for tracability
> >> 
> >> In any case: I think we are at the stage where we need to hear from Andy and others
> > 
> > Just to make my thinking clear: I don't care very much about the
> > specific license, and if we have options, it looks like one of Creative
> > Commons would probably be my favorite.
> > 
> > My only requirement is that we can copy/paste comments between headers
> > files and docs in both directions. As long as we can do that, the
> > license is fine by me.  Given that the headers files are BSD, it looks
> > like the best way to achieve compatibility is using BSD for the docs
> > too.
> > 
> > However, if you tell me that we can copy/paste sentences between BSD
> > headers, Creative Commons docs, and back, then I am also fine with that.
> 
> As both doc and code maintainers can attest, duplication of text between code and docs will inevitably lead to divergence.  A document, e.g. a book, can include the printed and unmodified text of source code under the rights granted by a source code license.  With line numbers for that printed source code, the document can cite references to the source code.
> 
> Unless there is a specific formal requirement in FuSA documentation for intermingling documentation and source code on the same digital or printed "page" layout, they can be separated within the document and subjected to different licenses.  
> 
> If there is a specific legal FuSA requirement for text layout of code and docs, it would be good to see the legal text which defines the text layout requirement.

My request comes from experience working on code, comments, commit
messages, and docs. It is common to move sentences across between all of
them. Note that I said "move" not "copy". It might start as a comment,
then being moved to the docs. Or, it could start as a design doc, and we
might want to move the more technical details closer to the code as
comments. I don't think we should put ourselves in a position where this
is impossible to do because of licensing issues, if we have a choice.

If we have to weight the advantage of using CC for docs, losing the
chance of moving sentences back and forth, against using BSD for docs
with the ability of moving sentences back and forth, then CC needs to
have very significance advantages to make it worth it, or being required
for other reasons.
--8323329-1083207293-1571331193=:30080
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1083207293-1571331193=:30080--

