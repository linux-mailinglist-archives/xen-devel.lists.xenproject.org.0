Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AED305D9F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 14:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76100.137192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4lG4-0000Bj-1b; Wed, 27 Jan 2021 13:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76100.137192; Wed, 27 Jan 2021 13:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4lG3-0000BK-UU; Wed, 27 Jan 2021 13:53:19 +0000
Received: by outflank-mailman (input) for mailman id 76100;
 Wed, 27 Jan 2021 13:53:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4lG2-0000BF-UX
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 13:53:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4lG2-0007Ae-Pf
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 13:53:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4lG2-0001Yv-OH
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 13:53:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4lFq-0001Mu-Fs; Wed, 27 Jan 2021 13:53:06 +0000
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
	bh=a/IogMdq/ibn48EDkq8vE62npdUOddgEoc3zJJLBWkw=; b=xDr3CI1mAn4HJ47X7PMqJ4WvKp
	mcqkFEY/sdx7oV74OebQmj3O9XajIgzIZadPKfb4Y9UEFGzFgaDmhLJJJd7ER5JElPpcJsC+GMXJp
	LppsrrUJ0z3yTAOC04rwG6VEBNolSLztOFw+90NvCokGmDCweyG35kshQBVeHNAK+z0M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.28738.216430.891500@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 13:53:06 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more messages]
In-Reply-To: <2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>,
	<27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
	<20210114122912.GA2522@antioche.eu.org>
	<1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
	<20210114141615.GA9157@mail.soc.lip6.fr>
	<20210126174415.GA21858@mail.soc.lip6.fr>
	<24592.22685.67161.585056@mariner.uk.xensource.com>
	<2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
	<27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] Fix error: array subscript has type 'char'"):
> I did read that part of the spec before replying.

I find this quite astonishing.  You claimed that FreeBSD's libc was
buggy *after having read the spec to which you agree it conforms*.

>   Irrespective of the wording there it seems entirely unreasonable
> to me for the spec to imply all use sites of the is...() functions
> to have to use casts. Even more so that we all know (I suppose) that
> casts can be dangerous as both potentially introducing bugs (perhaps
> not at the point of their addition, but later when code elsewhere
> gets changed) and keeping analysis tools from actually spotting
> ones.

Nevertheless, this is the design of the C standard.  A common approach
to this problem is something like this (from libxl_internal.h):

  /*
   * int CTYPE(ISFOO, char c);
   * int CTYPE(toupper, char c);
   * int CTYPE(tolower, char c);
   *
   * This is necessary because passing a simple char to a ctype.h
   * is forbidden.  ctype.h macros take ints derived from _unsigned_ chars.
   *
   * If you have a char which might be EOF then you should already have
   * it in an int representing an unsigned char, and you can use the
   * <ctype.h> macros directly.  This generally happens only with values
   * from fgetc et al.
   *
   * For any value known to be a character (eg, anything that came from
   * a char[]), use CTYPE.
   */
  #define CTYPE(isfoo,c) (isfoo((unsigned char)(c)))

Jan Beulich writes ("Re: [PATCH] Fix error: array subscript has type 'char'"):
> On 27.01.2021 09:31, Jan Beulich wrote:
> > But yes, I'm not the maintainer of this code, so if you're
> > happy with such risks, so be it.
> 
> And actually I was only partly right here - there's one hunk
> here affecting code I'm the maintainer just as much as you
> are. At least there I'd like to ask that ...
> 
> > For the record, to me the less risky approach here would seem
> > to have been to make use of compilers allowing to choose
> > whether plain char is signed or unsigned, and force it to
> > unsigned for at least the affected components.
> 
> ... this be considered as an alternative, before I maybe
> withdraw my de-facto nak.

Whether char is signed or unsigned is generally specified in the
platform API/ABI.  Deviating from this for userland code is not
possible or reasonable since it would involve processing the system
headers with a deviant langauge definition!

Deviating from it for hypervisor code would be possible but I think it
would be unwise.

Ian.

