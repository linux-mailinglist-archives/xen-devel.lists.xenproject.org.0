Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146753F3DF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 04:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342760.567830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyOmv-00066M-Hx; Tue, 07 Jun 2022 02:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342760.567830; Tue, 07 Jun 2022 02:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyOmv-000639-E5; Tue, 07 Jun 2022 02:17:45 +0000
Received: by outflank-mailman (input) for mailman id 342760;
 Tue, 07 Jun 2022 02:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nyOmt-00061K-Ub
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 02:17:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02586f3a-e608-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 04:17:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3753FB81826;
 Tue,  7 Jun 2022 02:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F31C385A9;
 Tue,  7 Jun 2022 02:17:39 +0000 (UTC)
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
X-Inumbo-ID: 02586f3a-e608-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654568259;
	bh=G/OCd3vUJTb9gQkavsuraROzp2lGVfO55Ao2rS3VQyI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nt/BJoBK32hpV9/IJ00L7dUSCo7085TNhohCvxlbhKm6+KIShSjGTJqukogik0n0b
	 zqd/x/sZBHRn78JPmXY7tm4LQJ5adY9BCnR4C6+IlZ0MjxAuVsNKWGxotM4gD82kn9
	 uD6WWT0csXljZp0pvMHyf3fj0qrG0umqfMy6fstSGW6WVcU2Z14Qb0FtscV0HtMPjd
	 0nxo5r5aDgp2tDh0LtJyy+Md/noSR3HFJMJlmPOEoYt5d9Hg3R+LBH18CF9qD+iqdP
	 MXoNcRV6wJO/N5vEmkcLrqwWm5iqMgqU3S5a54cK/g3oGI1KGLOFw3Owumqob7I3+h
	 FJR/0Xj/iQLqg==
Date: Mon, 6 Jun 2022 19:17:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org, 
    roberto.bagnara@bugseng.com
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
In-Reply-To: <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com> <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop> <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Jun 2022, Jan Beulich wrote:
> On 01.06.2022 22:27, Stefano Stabellini wrote:
> > Reducing CC and adding fusa-sig
> > 
> > Actually Jun 9 at 8AM California / 4PM UK doesn't work for some of you,
> > so it is either:
> > 1) Jun 9 at 7AM California / 3PM UK
> > 2) Jun 14 at 8AM California / 4PM UK
> > 
> > My preference is the first option because it is sooner but let me know
> > if it doesn't work and we'll try the second option.
> 
> I don't think I was aware that another call is needed. Was that said
> somewhere earlier where I did miss it? In any event, either option
> looks to be okay here.

I sent out the meeting invite for Jun 9 at 7AM California / 3PM UK.

Just a reminder to fill in the remaining "yellow" rules of the
spreadsheet in advance of the meeting.


There are couple of interesting questions on the remaining rules, which
I tried to shed some light on.



# Rule 9.1 "The value of an object with automatic storage duration shall not be read before it has been set"

The question is whether -Wuninitalised already covers this case or not.
I think it does.

Eclair is reporting a few issues where variables are "possibly
uninitialized". We should ask Roberto about them, I don't think they are
actual errors? More like extra warnings?


# Rule 9.3 "Arrays shall not be partially initialized"

Andrew was pointing out that "we use implicit 0's all over the place".

That is true but as far as I can tell that is permitted. There is a
couple of exceptions to the rules:

- { 0 } is allowed

- sparse initialization using designated initializers is allowed
  e.g. char ar[3] = { [2] = 'c' }

So I think we are fine there.


# Rule 9.4 "An element of an object shall not be initialized more than once"

Andrew was noting that "There's one pattern using range syntax to set a
default where this rule would be violated, but the code is far cleaner
to read."

Range initializers is a GCC extension not part of the C standard. It is
not considered by the MISRA rule. The MISRA rule seems focused on
preveting accidental double-initializations (by copy/pasting errors for
instance) which is fair.

So I think we should be OK here and we need to clarify our usage of
range initializers. What we do or don't do with range initializer should
be a separate discussion I think.

