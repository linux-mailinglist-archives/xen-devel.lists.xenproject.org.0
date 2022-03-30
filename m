Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764564EC7F7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 17:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296429.504553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZa2s-0006MY-Ml; Wed, 30 Mar 2022 15:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296429.504553; Wed, 30 Mar 2022 15:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZa2s-0006KD-Jq; Wed, 30 Mar 2022 15:15:38 +0000
Received: by outflank-mailman (input) for mailman id 296429;
 Wed, 30 Mar 2022 15:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZa2q-0006K7-Pn
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 15:15:36 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f607a6a-b03c-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 17:15:35 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id g24so28111897lja.7
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 08:15:35 -0700 (PDT)
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
X-Inumbo-ID: 3f607a6a-b03c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3F6GEGILwO5vlteoGBdPQRjiYnNCHhMBKfgw/Q2ahxU=;
        b=dIQ5Nq2pnr9qFk7vCi1fPxO5vSezHy0qyZsFAjOWwqepeqst61hYSoSVC7AMANE6br
         WAT3uyS3hsZsxhC2rhdEvX3lWzRJRB1fVnA4mkJsS72knliJo8FDSj+QcfyTWA8A/T1i
         kHK0KqCuh2DKQPW6JUBxCNOvbGKTeg/YY9wlZ15lJskbeUj0wXHR8GWXxhzTG5XWGdKh
         EcDcS9mNbu5uk9iBtYQhpPA6xf+xDuTH7vbwbF8xpJYu7ucnALRx9M6hrL5oOzFioIh8
         uD3fzTpsz6hOq5IIjiEyvKJ7ptqQPdcG/XptZy8Hj8qDKgmEJTtikCsQXVTqiEjOx9vX
         lgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3F6GEGILwO5vlteoGBdPQRjiYnNCHhMBKfgw/Q2ahxU=;
        b=EI1pqLSrvwa9d9DU+Rci8mM3D2QHrCM7RVbvBlPt+HhjaLMve+ZZ19G85fFS6DbL0u
         7pvD5cVk2ul7hMo5fZBbVAhI/qGcJJk10IGWNDNo/w14T64rY9/i8lc4NKx9EZAtcN+e
         t0vrvMU8XGc8TyYgjhVGOsVEkkKQ5uArWc+NDa/QAQiHP864ieKjL1Tmt51eVooP2GuL
         bkOFapeFo5lpln6jp5qJUv1+UTTeUs56ZaGFEhL+5tbqVWsbbrQXu60c3MkQYTTdxIb4
         oLlQyTW08b0cxRiJiExmN2tJpzFpuQz/baH1vWxBY1BluSvZeX7LDO7XTih7O/O0wi0c
         6PNA==
X-Gm-Message-State: AOAM531enfLpODUl98iNnqEIfqkas1ZDYJN+NKqhdAqXvfqhsJDDJS4a
	KxwdRaaomV0mCxVJWbJlm8BzFc88b+rwKbhTxV8=
X-Google-Smtp-Source: ABdhPJwgaLL1vb1Ral14mkF2Lg6Sao92VgtvDzv7edcfH0WlYOJ3HC5gLeab4kM/pce5IVwhgz9VmuqdlBtok2aEplM=
X-Received: by 2002:a2e:a372:0:b0:249:7108:6778 with SMTP id
 i18-20020a2ea372000000b0024971086778mr7163325ljn.403.1648653334756; Wed, 30
 Mar 2022 08:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com> <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
 <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com> <CAKf6xpt46jFgexwLA=wdUVH-HJWLOEisL6-2cmSLyJsO3QE2eQ@mail.gmail.com>
 <bdd9547f-d3d7-2315-898f-786ce31f9bbc@apertussolutions.com>
In-Reply-To: <bdd9547f-d3d7-2315-898f-786ce31f9bbc@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 30 Mar 2022 11:15:23 -0400
Message-ID: <CAKf6xpt60zHwwzgQ8EFuXkgfeiwYoBdsCMdY0d_fKZFXa5HyXA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jan Beulich <jbeulich@suse.com>, Scott Davis <scott.davis@starlab.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 10:04 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 3/30/22 08:30, Jason Andryuk wrote:
> > On Wed, Mar 30, 2022 at 2:30 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 29.03.2022 20:57, Daniel P. Smith wrote:
> >>> On 3/29/22 02:43, Jan Beulich wrote:
> >>>> Similarly I don't see how things would work transparently with a
> >>>> Flask policy in place. Regardless of you mentioning the restriction,
> >>>> I think this wants resolving before the patch can go in.
> >>>
> >>> To enable the equivalent in flask would require no hypervisor code
> >>> changes. Instead that would be handled by adding the necessary rules to
> >>> the appropriate flask policy file(s).
> >>
> >> Of course this can be dealt with by adjusting policy file(s), but until
> >> people do so they'd end up with a perceived regression and/or unexplained
> >> difference in behavior from running in dummy (or SILO, once also taken
> >> care of) mode.
> >
> > This need to change the Flask policy is the crux of my dislike for
> > making Xen-internal operations go through XSM checks.  It is wrong,
> > IMO, to require the separate policy to grant xen_t permissions for
> > proper operation.  I prefer restructuring the code so Xen itself
> > doesn't have to go through XSM checks since that way Xen itself always
> > runs properly regardless of the policy.
> >
> > This is more based on unmap_domain_pirq having an XSM check for an
> > internal operation.  dom0less, hyperlaunch, & Live Update may all be
> > niche use cases where requiring a policy change is reasonable.
>
> I will continue to agree with the base logic that today any least
> privilege separation imposed is merely artificial in the face of any
> attack that gains execution control over hypervisor space. What I will
> disagree with is using that as a justification to create tight couplings
> between the internals of the hypervisor that have a potential of causing
> more work in the future when people are looking to use for instance's
> Arms upcoming capability pointers as a real separation enforcement
> mechanisms to de-privilege portions of the hypervisor.
>
> While on principle it is justified to object to having policy statements
> that present a facade, is it not better to look longer term than object
> to some thing on principle based in the now?

Your claims seem to be speculative about something that doesn't exist,
so I can't evaluate them.

Do you envision that this future Xen would have multiple xen_*_t types
requiring explicit Flask policy rules?

Regards,
Jason

