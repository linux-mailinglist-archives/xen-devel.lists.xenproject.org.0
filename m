Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81891B2CEB0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 23:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087079.1445264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoU7N-000842-Ey; Tue, 19 Aug 2025 21:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087079.1445264; Tue, 19 Aug 2025 21:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoU7N-00081k-B2; Tue, 19 Aug 2025 21:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1087079;
 Tue, 19 Aug 2025 21:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc5E=27=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uoU7L-00081e-9V
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 21:43:43 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c21f64-7d45-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 23:43:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BD1460209;
 Tue, 19 Aug 2025 21:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD231C4CEF1;
 Tue, 19 Aug 2025 21:43:37 +0000 (UTC)
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
X-Inumbo-ID: 91c21f64-7d45-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755639818;
	bh=oOfay5dwD9ZFMFUsLZRmSG17fsGVmFo2sFzv0Tchehc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mmOsgT9yDzJ9sB6cAQqOpJcNgzk0PTGHArRfje7KfcJwX7PSH93gbExLG7Wvap3Zi
	 uMY0B6M7gDFXUGXrmxD2WhXb86RtDfQZpzcHr/fvUyAVNTQlxegAicyYjZcYDyh3UW
	 8C+lTYb1/mtYd74O9FDescL0Aedkygj6dsy0m7SB/aoVrbaoLed7Tha/N1uIkBlZQK
	 svkRn+jABbsIcuY4yOGIPhTOl1xBeL9NPUSnWVga7/nkLbnN70VLsTcf1I2sRcO5cS
	 FI2E9sJVW8cWZMGKjYogK9W/UZzmV0zb7/HWCvsTDp39Zr7pWywGacx7OQXIHKey3V
	 b2B94O5RsQ8dQ==
Date: Tue, 19 Aug 2025 14:43:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Subject: Re: [RFC] Next steps for MISRA C Rule 17.7 in XEN
In-Reply-To: <9a267d90-496c-496a-ab61-6b775204b594@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508191443200.923618@ubuntu-linux-20-04-desktop>
References: <6d622813-1617-4af3-876e-52a551518f68@epam.com> <9d71cc11-884d-4924-9de9-e3396801158a@suse.com> <c3bb91c6-ca74-4fab-8ca8-cd5ffed3f954@epam.com> <alpine.DEB.2.22.394.2508181642140.923618@ubuntu-linux-20-04-desktop>
 <9a267d90-496c-496a-ab61-6b775204b594@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Aug 2025, Jan Beulich wrote:
> On 19.08.2025 01:45, Stefano Stabellini wrote:
> > On Mon, 18 Aug 2025, Dmytro Prokopchuk1 wrote:
> >> On 8/4/25 11:02, Jan Beulich wrote:
> >>> On 02.08.2025 19:48, Dmytro Prokopchuk1 wrote:
> >>>> There are a lot of MISRA C R17.7 violations in the XEN.
> >>>> This rule states: "The value returned by a function having non-void
> >>>> return type shall be used".
> >>>>
> >>>> Actually, need to decide how to deal with these violations.
> >>>> Quick analyze shown that there are different cases in XEN code base.
> >>>
> >>> Long ago, when we discussed the rules in a mainly abstract way, there already
> >>> was quite a bit of discussion around this. Stefano - I wonder if you had
> >>> taken (and have kept) notes back at the time?
> >>>
> >>> Jan
> >>
> >> Hi Stefano.
> >>
> >> This is a kind reminder.
> > 
> > Yes, I am appending below the unmodified notes which I took when we
> > discussed R17.7. It looks like the decision was to accept the rule and
> > use a mix of deviations and void casts to reach compliance.
> > 
> > 
> > MISRA 17.7 Use expressions' results
> > -----------------------------------
> > 
> > ACCEPT 17.7
> > 
> > Returning void when appropriate
> > 
> > When function results are used on some of the times. Use a comment to
> > explain why the return value is ignored and a void cast so that the
> > warning doesn't trigger (there is also a gcc warning).
> > 
> > Some functions are returning a value just for convenience (e.g. memcpy).
> > They need to be deviated.
> > 
> > Add must_check to all functions by default somehow? So that developers
> > will get automatic feedback when they do develpment without having to
> > wait for ECLAIR
> 
> Isn't doing this "by default" equivalent to enabling the compiler warning?
> If doing this by default (one way or another), it'll need to be clear how
> to mark functions as "exceptions" (like memcpy() that you mention).

Indeed, that is the problem.

I think the idea was to employ a different strategy depending on
whether the function returns an error or simply provides optional
information.

For functions that return errors, we would use explicit (void) casts.
For functions that return optional information, we would apply global
deviations.

Of course, these are only general guidelines. If a function that returns
errors has thousands of violations, making it impractical to address
each one individually, we would likely opt for a global deviation in
that case as well.


