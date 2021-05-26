Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319B3915B5
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 13:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132447.247044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llrL9-00071a-Lf; Wed, 26 May 2021 11:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132447.247044; Wed, 26 May 2021 11:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llrL9-0006zg-IL; Wed, 26 May 2021 11:04:43 +0000
Received: by outflank-mailman (input) for mailman id 132447;
 Wed, 26 May 2021 11:04:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1llrL8-0006za-60
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 11:04:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1llrL8-0007A8-4K
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 11:04:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1llrL8-0003nq-3I
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 11:04:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1llrL4-0007Wl-Os; Wed, 26 May 2021 12:04:38 +0100
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
	bh=gq2I9hbRkeKKDL7TqQ0Q2XZpi3HNA0AmgyGee+LQdB4=; b=1GpJn2aRuLTF1kP+QY5W68MzWJ
	BbgpmItZYeyE6mO14bCc5+eq+7o61iRDj2XFqiZN9L01phgc7Yp2VP9wES536qH3o6IWGP9zWhUdV
	rprML24N5ZVn7YU9SOwl0YYKHVZyu6ijRpZ1/g9NOEhwSuYFs/Ls0Ny5C8az2LSuyrLU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24750.11078.528225.772285@mariner.uk.xensource.com>
Date: Wed, 26 May 2021 12:04:38 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    "community.manager\@xenproject.org" <community.manager@xenproject.org>
Subject: Re: IRC networks
In-Reply-To: <10B84448-21E3-41F2-AAD2-B9F6E9EB5DE8@citrix.com>
References: <24741.12566.639691.461134@mariner.uk.xensource.com>
	<10B84448-21E3-41F2-AAD2-B9F6E9EB5DE8@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("Re: IRC networks"):
> Thanks, Ian.  I tend to agree with the recommendation.  I think unless someone wants to argue that we go to libera (or stick with freenode), we should go with that option.  
> 
> Normally for a decision like this we’d wait 2 weeks for counter-arguments before making it official.  Does anyone want to argue that we should move up the timetable for some reason?
> 
> I’ve registered #xendevel on oftc; I’d encourage early adopters to give it a try.

Recent behaviour by the new de facto operators of Freenode has been
quite egregious.  In particular, it is now against the rules to set
your topic to direct your users to libera.chat, the replacement set up
by the resigning Freenode staff.  The server operators have been
taking opver channels where the project are trying to migrate.  (I
think that probably applies to OFTC too.)

Also, the new de facto operators of Freeonode are using user count to
justify their behaviour.

I am not prepared to be counted as a user of these terrible people,
and used by them to justify their awful actions.  I will be
disconnecting from Freenode as soon as I have sent a message to this
effect to all the Xen-related channels.

I appreciately that making this decision unilaterally for myself in
this wa might be seen as jumping the gun on the commkunity decision
process.

But I am not prepared to wait any longer.  Sorry.

Ian.

