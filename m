Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63C306170
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 18:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76290.137607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4oBe-0004tH-PT; Wed, 27 Jan 2021 17:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76290.137607; Wed, 27 Jan 2021 17:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4oBe-0004su-Lj; Wed, 27 Jan 2021 17:00:58 +0000
Received: by outflank-mailman (input) for mailman id 76290;
 Wed, 27 Jan 2021 17:00:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4oBd-0004sm-BV
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:00:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4oBd-0002Zy-86
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:00:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4oBd-0003JA-7L
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:00:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4oBQ-0001qZ-T9; Wed, 27 Jan 2021 17:00:44 +0000
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
	bh=s1WBGJ5ygEVn6nEltRXkwyyCGQ0k0jRxQhcMvfDfS4M=; b=apf3ejqlpJK+tLeEZ8uw4yYtQr
	Pw7Gm3cQN0ZFrY6T3gSwJY+Rj2pXXncMr5Up7aipnNwjMOxNyFaM7SMApUAJX4it2hbtZUZTXek9b
	Hj0kDLM8Do2nChV8MC48POV/JNUr8DEe2t620oQurqxT1LATRaddMQDd/Ap3iEO0p3Rg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24593.39996.671411.896935@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 17:00:44 +0000
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Andrew Cooper <Andrew.Cooper3@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    "Manuel  Bouyer" <bouyer@antioche.eu.org>
Subject: Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more
 messages]
In-Reply-To: <0280E0D7-5094-4D89-A938-C9270260C927@citrix.com>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
	<20210114122912.GA2522@antioche.eu.org>
	<1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
	<20210114141615.GA9157@mail.soc.lip6.fr>
	<20210126174415.GA21858@mail.soc.lip6.fr>
	<24592.22685.67161.585056@mariner.uk.xensource.com>
	<2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
	<27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
	<24593.28738.216430.891500@mariner.uk.xensource.com>
	<d3796603-20a7-2c81-a446-0d0a75cd52d5@suse.com>
	<24593.37649.81543.442376@mariner.uk.xensource.com>
	<2bdd894f-e966-7943-c5ec-fe45ef7227e7@suse.com>
	<0280E0D7-5094-4D89-A938-C9270260C927@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more messages]"):
> > On Jan 27, 2021, at 4:32 PM, Jan Beulich <jbeulich@suse.com> wrote:
> > On 27.01.2021 17:21, Ian Jackson wrote:
> >> Are you OK with me checking in the current patch or should I ask the
> >> other committers for a second opinion ?
> > 
> > For the changes to tools/ it's really up to you. For the change
> > to xen/tools/symbols.c I could live with it (for being user
> > space code), but I still think adding casts in such a place is
> > not necessarily setting a good precedent. So for this one I'd
> > indeed appreciate getting another opinion.
> 
> My thoughts:
> 
> * On the whole, the risk of an incompatibility with system headers does seem higher than the risk of casting a value which is known not to be EOF
> 
> * Such a change doesn’t seem like the kind of thing we should ask Manuel to do, when a simpler change will do the trick
> 
> * At any rate it doesn’t seem like a good thing to experiment with in the week before the feature freeze.

Thanks, George.  Given the release timing, I intend to commit Manuel's
patch unless I hear a further contrary opinion before 1700 UTC
tomorrow.

NB that with my RM hat on I consider this a bugfix so it would not
need a freeze exception to be committed next week but obviously with
my RM hat on I would prefer no to delay it.

Ian.

