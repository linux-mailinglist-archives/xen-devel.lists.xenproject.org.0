Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6E9F79B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 02:57:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2mDl-0001oj-Pr; Wed, 28 Aug 2019 00:53:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3SZS=WY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i2mDk-0001oe-8f
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 00:53:56 +0000
X-Inumbo-ID: 4f59b398-c92e-11e9-ae40-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f59b398-c92e-11e9-ae40-12813bfff9fa;
 Wed, 28 Aug 2019 00:53:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 149BA2064A;
 Wed, 28 Aug 2019 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566953634;
 bh=ppA6E33Ih4eIAjgEI1qs87zKdvRXMfwfWZIjATz41OI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WYzDyVqCBhrHJ366eNyPc+/X7YHBvi1bJ8jZnfH7DfncU6yQXA3f2BHhU4JPe0H3V
 Wz+BBcA7edcjLqx3yGArC2F7GLwghCifilrAuZqqJRRfocqcDi2P0j4pLldG/b/f2M
 i551/ajQM1QDmtag4qNbVvZuCfTZrXu5n5ygshko=
Date: Tue, 27 Aug 2019 17:53:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <D8EFC0B6-0FFC-4288-86EC-FD0A0BB8C3BF@citrix.com>
Message-ID: <alpine.DEB.2.21.1908271746050.25361@sstabellini-ThinkPad-T480s>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <38ac71b4-53c0-9402-2c6f-118f29818f85@citrix.com>
 <FCA290D6-2ECA-4B95-B327-7D263E0E4687@gmail.com>
 <818DA1AE-CE46-4806-B806-0943B79DF725@citrix.com>
 <F76AAD6E-198A-4455-A1DE-EED974DEACA3@citrix.com>
 <23909.26956.404750.684802@mariner.uk.xensource.com>
 <D8EFC0B6-0FFC-4288-86EC-FD0A0BB8C3BF@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1574113991-1566953634=:25361"
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: George Dunlap <George.Dunlap@citrix.com>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1574113991-1566953634=:25361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 27 Aug 2019, Lars Kurth wrote:
> ﻿On 27/08/2019, 10:33, "Ian Jackson" <ian.jackson@citrix.com> wrote:
> 
>     Lars Kurth writes ("Re: [Xen-devel] [RFC] Code of Conduct"):
>     > I did raise the issue of a cross-project support network, which has not yet been on the agenda. I will be hooked into this process.
>     > My gut feeling is that we are looking at 6-9 months before all of this is resolved. Maybe longer.
>     
>     I think this is too long.  We are overdue with this.
>     
>     > Ultimately, we have 3 options:
>     > 
>     >   1.  We wait for the LF and revisit then
>     >   2.  We go our own way re customization
>     >   3.  We draft our own customizations and bring it up in one of the LF meetings discussing this
>     > 
>     > My gut feeling is to go for c) and I am willing to have a try at customizing the Contributor Covenant along the lines of the previous exercise
>     
>     I am happy with 2 or 3, but we shouldn't block on LF approval.  Having
>     input is good.  If later we want to join some cross-community network
>     and want to update it for that, we can do that.  Updating a document
>     for something like that is quite easy.  IMO we need to get on with the
>     really hard work which is adopting a document at all.
> 
> That is also my personal preference.
>     
>     I look forward to your Contributor Covenant based draft.
>     
> I attached a redline version of both the original (based on the LF events CoC) and a redline version based on the covenant given the constraints we agreed. Aka
> [1] Xen CoC Contributor Covenant baseline (redline).pdf 
> [2] Xen CoC LF events baseline (redline).pdf
> 
> I minimized changes to [2]. 
> 
> I would be good to get a sense of whether anyone prefers one over the other or whether additional changes should made to [2], but also [1]. In the thread there had already been concrete suggestions to remove sections such as comments along the lines of compliance with local laws.
> 
> I will disclose my personal opinion a little later. 

Honestly they look both very reasonable and I would be happy with either
of them. I agree with you and Ian that it would be best not to wait for
months, but to try to get it adopted soon.

It is surprising how few changes you had to make to the Contributor
Covenant baseline. Also both end results look so similar that I can
hardly distinguish them in terms of content.

A couple of comments on the Contributor Covenant based one:
- not sure if we still need the examples of positive behavior under "Our
  Standards" by they don't hurt
- Under "Our Responsibilites" the text keeps repeating "Project
  maintainers" while actually we probably want to mention the CoC team
  also (for instance "and are expected, together with the CoC team, to
  take appropriate and fair corrective action in response to").

At this point I might be tempted to suggest to use the one based on the
Contributor Covenant just because the changes are fewer, but I am happy
to leave the decision to you and what you think is best.
--8323329-1574113991-1566953634=:25361
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1574113991-1566953634=:25361--

