Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61861AD1C5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 23:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPBqA-0000fy-N0; Thu, 16 Apr 2020 21:14:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DlbZ=6A=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jPBq9-0000ft-4h
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 21:14:29 +0000
X-Inumbo-ID: 418bdeca-8027-11ea-83d8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 418bdeca-8027-11ea-83d8-bc764e2007e4;
 Thu, 16 Apr 2020 21:14:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C094221F4;
 Thu, 16 Apr 2020 21:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587071667;
 bh=55ywWyXgqRR8JtB9q8XT/HTHFJsxaFbLSUz46VW/a6w=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=k5zUD1LenWWSk5G1VKmWbn2m7ZeKFj4CvOfpg/4L+sWgJpFZncOCDlOrlGOoXz5ZK
 +wdl6GTTwdh0BqtVk2nbMVSAjptK6DDDFyfo1YRMv+PTq+gjLaxfrOmU658EXdwhOO
 qq9pKBQxX8HnZXfYjLgoHjUJ31u1AjNQ7xVe6Lqk=
Date: Thu, 16 Apr 2020 14:14:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
In-Reply-To: <454b13b1-2901-d864-6fc8-bc4f338a14d6@suse.com>
Message-ID: <alpine.DEB.2.21.2004161252180.8316@sstabellini-ThinkPad-T480s>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
 <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
 <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
 <49c732e6-d30d-0892-0bd7-65c082da0429@xen.org>
 <10D98CF7-E38E-44C3-AF24-C93088F6682D@citrix.com>
 <454b13b1-2901-d864-6fc8-bc4f338a14d6@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-957468000-1587067177=:8316"
Content-ID: <alpine.DEB.2.21.2004161259490.8316@sstabellini-ThinkPad-T480s>
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-957468000-1587067177=:8316
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2004161259491.8316@sstabellini-ThinkPad-T480s>

On Wed, 15 Apr 2020, Jan Beulich wrote:
> On 15.04.2020 11:56, George Dunlap wrote:
> > 
> > 
> >> On Apr 15, 2020, at 10:49 AM, Julien Grall <julien@xen.org> wrote:
> >>
> >>
> >>
> >> On 15/04/2020 10:43, George Dunlap wrote:
> >>>> On Apr 15, 2020, at 7:23 AM, Jan Beulich <JBeulich@suse.com> wrote:
> >>>>
> >>>> On 14.04.2020 18:54, Stefano Stabellini wrote:
> >>>>> On Tue, 14 Apr 2020, Jan Beulich wrote:
> >>>>>> On 10.04.2020 18:49, Stefano Stabellini wrote:
> >>>>>
> >>> [snip]
> >>>>>>> +    Backport: all
> >>>>>>> +
> >>>>>>> +It marks a commit for being a candidate for backports to all relevant
> >>>>>>> +trees.
> >>>>>>
> >>>>>> I'm unconvinced of the utility of this form - what "all" resolves to
> >>>>>> changes over time. There's almost always a first version where a
> >>>>>> particular issue was introduced. If we want this to be generally
> >>>>>> useful, imo we shouldn't limit the scope of the tag to the upstream
> >>>>>> maintained stable trees.
> >>>>>
> >>>>> The reason why I suggested also to have a "wildcard" version of this
> >>>>> tag, is that the person adding the tag (could be the contributor trying
> >>>>> to be helpful) might not know exactly to which stable trees the patch
> >>>>> should be backported to.
> >>>>>
> >>>>> Writing this sentence, I realize that I really meant "any" rather than
> >>>>> "all". Would you prefer if I used "any"? Or we could even suggest to leave
> >>>>> it black like this:
> >>>>>
> >>>>>  Backport:
> >>>>>
> >>>>> But it looks a bit weird.
> >>>>
> >>>> Indeed. Instead of "all" or "any", how about "yes", "unspecified", or
> >>>> "unknown"? Nevertheless, I still think people asking for a backport
> >>>> should be nudged towards determining the applicable range; them not
> >>>> doing so effectively pushes the burden to the general maintainers or
> >>>> the stable tree ones, both of which scales less well. Omitting the
> >>>> tag if they don't want to invest the time would to me then seem to
> >>>> be the cleanest alternative. Albeit I'm sure views here will vary.
> >>> FWIW asking people adding the tag to do the work of figuring out which versions to backport to makes sense to me.
> >>
> >> If you ask the contributor to do the work then you need to give guidance on the "older" version you can specify in Backport.
> >>
> >> For instance, let say the bug was introduced in Xen 4.2. Are we allowing the user to specify Backport: 4.2+ or should it be 4.11+?
> >>
> >> I would favor the former as this helps for downstream user which haven't yet moved to the supported stable tree.
> > 
> > I agree that specifying the oldest revision possible would be helpful.
> > 
> > However, I don’t think finding the absolute oldest revision should be *required* — imagine a bug that was introduced between 3.2 and 3.3.  It’s also perfectly fine if you go all the way back to 4.2 and stop because you get bored, not because you found out that 4.1 didn’t need it.

I dropped the definition of "Backport: all", and adopted George's
suggested wording:

  The backport requester is expected to specify which currently supported
  releases need the backport; but encouraged to specify a release as far
  back as possible which applies.


> In which case I'd like there to be a (canonical?) way of expressing
> this, like in XSAs we say "at least back to" in such a case.

I couldn't think of anything better than:

  Backport: 4.9+ # maybe older

We probably don't need to codify something like that in this document.


As an alternative we could perhaps reuse the "Backport: all" idea in a
different light for this new purpose.

I expect that in these cases where we don't know the oldest affected
tree, all the currently maintained stable trees will have to get the
backport. So maybe we could use one of the following:

  Backport: all
  Backport: oldest
  Backport: oldest-unknown

To express that the fix needs to be backported to *all* the currently
maintained stable trees, but there might be also other older
unmaintained trees that could be affected; we don't know for sure how
far back it should go.
--8323329-957468000-1587067177=:8316--

