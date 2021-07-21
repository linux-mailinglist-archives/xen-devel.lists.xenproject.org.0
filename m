Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2833D0BA1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 11:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159254.292950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68zK-0000Rx-9M; Wed, 21 Jul 2021 09:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159254.292950; Wed, 21 Jul 2021 09:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68zK-0000Om-59; Wed, 21 Jul 2021 09:58:02 +0000
Received: by outflank-mailman (input) for mailman id 159254;
 Wed, 21 Jul 2021 09:58:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m68zI-0000Og-4v
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:58:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m68zI-00088N-13
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:58:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m68zI-0007IJ-08
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:58:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m68zB-0000uj-R0; Wed, 21 Jul 2021 10:57:53 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=YZaXrz0Ot4cfTtbc8IeqYb3sXz7bemkQKscEAedT8e8=; b=Axyvy4eX50GziJsBIEb2fCsVdx
	ZRo+H0E46uveA2mVOEsfrutjz7X6v30CeZnaqHvoVxe7Ig25iaTSqax0upmpK4mCMhDTnpgiZnKFx
	m9KdJta29xomflAOXlpwJ+HoZaBvIXegmqz81W+1dvVB9xNei+q4kP63OLxT2ORJsiP4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24823.61345.641428.907592@mariner.uk.xensource.com>
Date: Wed, 21 Jul 2021 10:57:53 +0100
To: Scott Davis  <scottwd@gmail.com>,
    Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Scott Davis <scott.davis@starlab.io>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
In-Reply-To: <c4d5cb39-420b-a9e3-0b9c-bee7e5d41a78@xen.org>
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
	<c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
	<56f86674-7a6c-3f3a-40e9-dcb35cddbb88@citrix.com>
	<c4d5cb39-420b-a9e3-0b9c-bee7e5d41a78@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg"):
> Everyone has a different perspective. I don't see the problem of asking 
> the question... Maybe I should have add "OOI" to make clear with wasn't 
> a complain.

Yes, I think asking questions is fine, but we need to be conscious of
our status as maintainers and therefore gatekeepers.  When someone in
a gatekeeper position asks a question, the possibility of it being a
blocker is always present.  Indeed, I think it is even usual.

Adding "OOI" helps but it can help to be even more explicit.

Particularly, if someone proposes to add a feature, and a maintainer
asks "why can't you do X instead", there is a strong sense that the
maintainer thinks the feature is not (or may not be) necessary and
wants a stronger justification.  That can be quite discouraging.

If that disccouragement is not what's intended, then it can help for
the maintaier to be more explicit.  For example:

  "I don't oppose this feature.  But I am curious:..."

As for the original patch, I am in support of it and have reviewed it.
I have have only one question:

> +    stubdom_state->pv_cmdline = guest_config->b_info.stubdomain_cmdline;

It's been a while since I looked at this code.  I think that this is
the effective line, which takes the end result of the plumbing in the
rest of the patch and delivers it to this field of stubdom_state,
which is otherwise always null ?

Ian.

