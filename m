Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC769A38B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 02:44:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496847.767774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSpnl-0002iu-66; Fri, 17 Feb 2023 01:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496847.767774; Fri, 17 Feb 2023 01:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSpnl-0002g2-2Y; Fri, 17 Feb 2023 01:44:41 +0000
Received: by outflank-mailman (input) for mailman id 496847;
 Fri, 17 Feb 2023 01:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSpnj-0002fw-Gi
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 01:44:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d60f24-ae64-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 02:44:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFC356121C;
 Fri, 17 Feb 2023 01:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2172C433EF;
 Fri, 17 Feb 2023 01:44:32 +0000 (UTC)
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
X-Inumbo-ID: a1d60f24-ae64-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676598274;
	bh=jNbP4ze/LrQTflJf7iMEzaIWcLa/1ZQtcOw4CSYj9QA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nshHbjX3+ONWZGuksRQBb2dCcvjcs5BSupNL1P8A363T4qvs9znyVNuz2Ut/k0N4K
	 UcBoAvP/xhos1YPhz1TlhnWIInDVQjFe4HcNuwbwcR6Tw3XYYIPwhqvttgQlekI9Tg
	 /1Gz4veh+HakLEgbi+NGwUjstBa9Bal5sHr8j4+OFa0g5U7sMVEqtJO+d38uPEpIUR
	 4W+/t01spb9oAofu4duFVJt7AT2gXXbX6YITL8jKy4cH1pAbVAEOb0iF9wHL6lOUET
	 KGIzHKkngzgVvcC3y+WUpEo5jVOCA5T9d+zCRCZTtIYmWxRphtBYqQe2Kf/4S6Wa8s
	 syQXoOaZQbpiQ==
Date: Thu, 16 Feb 2023 17:44:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
In-Reply-To: <340CAA3C-DC15-4826-9022-0348BB3CE6C9@arm.com>
Message-ID: <alpine.DEB.2.22.394.2302161732490.2127160@ubuntu-linux-20-04-desktop>
References: <20230214085635.3170962-1-luca.fancellu@arm.com> <20230214085635.3170962-3-luca.fancellu@arm.com> <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com> <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop> <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
 <alpine.DEB.2.22.394.2302151438040.2127160@ubuntu-linux-20-04-desktop> <14a4bccd-f316-fca9-a04d-5bd639307e9b@suse.com> <340CAA3C-DC15-4826-9022-0348BB3CE6C9@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1773774438-1676597724=:2127160"
Content-ID: <alpine.DEB.2.22.394.2302161735280.2127160@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1773774438-1676597724=:2127160
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2302161735281.2127160@ubuntu-linux-20-04-desktop>

On Thu, 16 Feb 2023, Luca Fancellu wrote:
> > On 16 Feb 2023, at 08:19, Jan Beulich <jbeulich@suse.com> wrote:
> > On 16.02.2023 00:49, Stefano Stabellini wrote:
> >> On Wed, 15 Feb 2023, Julien Grall wrote:
> >>> On 14/02/2023 22:25, Stefano Stabellini wrote:
> >>>>> Patch 1's example has a "comment" field, which no entry makes use of.
> >>>>> Without that, how does it become clear _why_ a particular file is to
> >>>>> be excluded? The patch description here also doesn't provide any
> >>>>> justification ...
> >>>> 
> >>>> It would be good to have a couple of pre-canned justifications as the
> >>>> reason for excluding one file could be different from the reason for
> >>>> excluding another file. Some of the reasons:
> >>> 
> >>> I think the reasons should be ambiguous. This is ...
> >>> 
> >>>> - imported from Linux
> >>> 
> >>> ... the case here but...
> >>> 
> >>> This reason is pretty clear to me but...
> >>> 
> >>>> - too many false positives
> >>> 
> >>> ... not here. What is too many?
> >>> 
> >>>> That said, we don't necessarily need to know the exact reason for
> >>>> excluding one file to be able to start scanning xen with cppcheck
> >>>> automatically. If someone wants to remove a file from the exclude list
> >>>> in the future they just need to show that cppcheck does a good job at
> >>>> scanning the file and we can handle the number of violations.
> >>> 
> >>> I disagree. A good reasoning from the start will be helpful to decide when we
> >>> can remove a file from the list. Furthermore, we need to set good example for
> >>> any new file we want to exclude.
> >>> 
> >>> Furthermore, if we exclude some files, then it will be difficult for the
> >>> reviewers to know when they can be removed from the list. What if this is fine
> >>> with CPPCheck but not EClair (or any other)?
> >> 
> >> Yes, the reason would help. In previous incarnations of this work, there
> >> was a request for detailed information on external files, such as:
> >> - where this file is coming from
> >> - if coming from Linux, which version of Linux
> >> - maintenance status
> >> - coding style
> >> 
> >> But this is not what you are asking. You are only asking for a reason
> >> and "imported from Linux" would be good enough. Please correct me if I
> >> am wrong.
> > 
> > I guess you mean s/would/could/. Personally I find "imported from Linux"
> > as an entirely unacceptable justification: Why would the origin of a file
> > matter on whether it has violations? Dealing with the violations may be
> > more cumbersome (because preferably the adjustments would go to the
> > original files first). Yet not dealing with them - especially if there
> > are many - reduces the benefit of the work we do quite a bit, because it
> > may leave much more work for downstreams to do to actually be able to do
> > any certification. That may go to the extent of questioning why we would
> > bother dealing with a few dozen violations if hundreds remain but are
> > hidden.

Yes, we need to figure out a way to deal with these files. However, at
the moment they are getting in the way of easier low hanging fruits.

One "easy" low hanging fruit is to use cppcheck to scan new patches for
new MISRA violations. That would give immediate benefits to the
community. It is not easy to "diff" results with cppcheck and in any
case it would help a lot if we had a cleaner baseline because it would
make it far easier to read the results and make sense of them.

The goal of this exclusion list is to give us that: a cleaner baseline
so that we can make progress faster on low hanging fruits. This list is
not meant to be fixed and stay unchanged for a long time. In fact, it
could even live under automation/ as part of the gitlab-ci test that
triggers cppcheck, if we prefer.


> Hi Jan,
> 
> my personal opinion is that we can’t handle them for files that needs to be kept
> in sync from an external source, because we can’t justify findings or tag false
> positives, if we are lucky we might fix the non compliances but even in that case
> there might be times when the fix goes through and cases where the fix is objected
> by the maintainers just because their project is not following the MISRA standard.
> 
> On our side, what we can do is track these files and from time to time check that
> they are still eligible to backport, because when they are not anymore we could
> just port them to Xen coding style and start doing direct changes.
> 
> 
> @Stefano/@Bertrand/@Julien thanks for your effort on the list, yesterday morning
> I’ve also had a look on the Michal’s file list and I’ve tracked down the origin, here
> my findings, maybe we could merge your list with mine?

Yes to merge the two lists, but I think we should keep only items that we
actually need for the sake of having a cleaner baseline. So I would only
add things we need today to reduce the noise on cppcheck results
(excluding 20.7 and also excluding unusedStructMember which I think we
should probably stop scanning with cppcheck altogether).
--8323329-1773774438-1676597724=:2127160--

