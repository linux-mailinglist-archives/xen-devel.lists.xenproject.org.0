Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5235295D5B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 13:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10376.27618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVYmj-0007M4-BF; Thu, 22 Oct 2020 11:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10376.27618; Thu, 22 Oct 2020 11:29:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVYmj-0007Lf-84; Thu, 22 Oct 2020 11:29:33 +0000
Received: by outflank-mailman (input) for mailman id 10376;
 Thu, 22 Oct 2020 11:29:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oPFL=D5=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1kVYmh-0007LZ-5i
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 11:29:31 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f59e6666-c92f-416a-8430-348aeda8a86b;
 Thu, 22 Oct 2020 11:29:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kVYmc-0006e8-NA; Thu, 22 Oct 2020 11:29:26 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kVYmc-0003GN-C4; Thu, 22 Oct 2020 11:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oPFL=D5=xen.org=hx242@srs-us1.protection.inumbo.net>)
	id 1kVYmh-0007LZ-5i
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 11:29:31 +0000
X-Inumbo-ID: f59e6666-c92f-416a-8430-348aeda8a86b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f59e6666-c92f-416a-8430-348aeda8a86b;
	Thu, 22 Oct 2020 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=+OgsHnWq3gEzM2l/AVtQUMDkm3YQtvZbw3/J0aQlw64=; b=xiIiqkJhxJyenua1JSB9pnVilc
	FIOymOndecfC6YWuaKITxklNslyPH3h7kWCSbWGbanhK/I/ppCz32vFzSA0yJfqE4NaKv8ilo92fH
	m+lafh+nqGntZsuVDvCxsbwJP2V1+IMUuEVsGHK2MOlLDZdAyYyrf516k3BqQlHDsXQ8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <hx242@xen.org>)
	id 1kVYmc-0006e8-NA; Thu, 22 Oct 2020 11:29:26 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=u1bbd043a57dd5a.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <hx242@xen.org>)
	id 1kVYmc-0003GN-C4; Thu, 22 Oct 2020 11:29:26 +0000
Message-ID: <9b6bc64b9f9fb2a7adad03c7da999a1babe243b9.camel@xen.org>
Subject: Re: XSM and the idle domain
From: Hongyan Xia <hx242@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Date: Thu, 22 Oct 2020 12:29:22 +0100
In-Reply-To: <CAKf6xpt7zgM3HghQru28kovd0m7z84bAR8Uqt6KKxbSrvQv8ZA@mail.gmail.com>
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
	 <CAKf6xpt7zgM3HghQru28kovd0m7z84bAR8Uqt6KKxbSrvQv8ZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

(also replying to others in this thread.)

On Wed, 2020-10-21 at 12:21 -0400, Jason Andryuk wrote:
> On Wed, Oct 21, 2020 at 10:35 AM Hongyan Xia <hx242@xen.org> wrote:
> > 
> > Hi,
> 
> ...
> > 
> > The first question came up during ongoing work in LiveUpdate. After
> > an
> > LU, the next Xen needs to restore all domains. To do that, some
> > hypercalls need to be issued from the idle domain context and
> > apparently XSM does not like it. We need to introduce hacks in the
> > dummy module to leave the idle domain alone.
> 
> Is this modifying xsm_default_action() to add an is_idle_domain()
> check which always succeeds?

Yes. We had to do exactly that to avoid LU actions being denied by XSM.

> > Our work is not compiled
> > with CONFIG_XSM at all, but with CONFIG_XSM, are we able to enforce
> > security policies against the idle domain?
> 
> It's not clear to me if you want to use CONFIG_XSM, or just don't
> want
> to break it.

We don't (and won't) enable XSM in our build, but still we need a hack
to work around it, so I am just curious about what happens when people
use both LU and XSM at the same time.

> > Of course, without any LU
> > work this does not make any difference because the idle domain does
> > not
> > do any useful work to be restricted anyway.
> 
> I think this last sentence is the main point.  It's always been
> labeled xen_t, but since it doesn't go through any of the hook
> points,
> it hasn't needed any restrictions.  Actually, reviewing the Flask
> policy there is:
> # Domain destruction can result in some access checks for actions
> performed by
> # the hypervisor.  These should always be allowed.
> allow xen_t resource_type : resource { remove_irq remove_ioport
> remove_iomem };
> 
> > Also, should idle domain be restricted? IMO the idle domain is Xen
> > itself which mostly bootstraps the system and performs limited work
> > when switched to, and is not something a user (either dom0 or domU)
> > directly interacts with. I doubt XSM was designed to include the
> > idle
> > domain (although there is an ID allocated for it in the code), so I
> > would say just exclude idle in all security policy checks.
> 
> I think it makes sense to label xen_t, even if it doesn't do
> anything.
> As you say, it is a distinct entity from dom0 and domU.  Yes, it can
> circumvent the policy, but it's not actively hurting anything.  And
> it
> can be good to catch when it does start doing something, as you
> found.
> 
> Might it make sense to create a LU domain instead of using the idle
> domain for Live Update?  Another approach could be to run the
> idle_domain as "dom0" during Live Update, and then transition to the
> regular idle_domain when it completes?  You are re-creating dom0, but
> you could flip is_privileged on during live update and then remove it
> once complete.

Actually I think your suggestion and what Daniel suggested make sense.
We could just have a domLU that does all the restore work which has its
own security policies. That sounds like a clean solution to me.
However, one top priority of LU is to minimise the down time so that
domains won't feel a thing and every millisecond counts. I don't know
how much overhead this adds (maybe negligible if we just let domLU sit
in idle domain's page tables so switching and passing the LU save
stream to it is painless), but is something we need to keep in mind.

But this still sidesteps the question of whether the idle domain should
be subject to security policies. From another reply it sounds like the
idle domain should not be exempt from XSM. Although, to me restrictions
on idle domain are more like a debugging feature than a security
policy, since it prevents, e.g., accidentally issuing hypercalls from
it, but if the idle domain really wants to do something then there is
nothing to stop it. This is different from enforcing policies on a real
domain which guarantees things won't happen and the domain simply has
no mechanism to circumvent it (hopefully).

My experience with XSM is only the idle domain hack for LU so what I
said about it here may not make sense.

Hongyan


