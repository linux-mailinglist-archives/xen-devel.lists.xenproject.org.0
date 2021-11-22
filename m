Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4C458D28
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228820.396006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7IZ-0005Yh-MP; Mon, 22 Nov 2021 11:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228820.396006; Mon, 22 Nov 2021 11:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7IZ-0005WJ-JR; Mon, 22 Nov 2021 11:15:47 +0000
Received: by outflank-mailman (input) for mailman id 228820;
 Mon, 22 Nov 2021 11:15:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mp7IX-0005WA-Ta
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:15:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mp7IX-0006D4-Rx
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:15:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mp7IX-00009q-Qp
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:15:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mp7IS-0008Tz-Ul; Mon, 22 Nov 2021 11:15:40 +0000
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
	bh=+Z1bjgAsuvNYJdm3q8aYLomc6qndLnUq1UluotOZZuQ=; b=HpRANv/M454tbw9LqMyQlE4al8
	v2SSYG2MV+Lzs2l00g0kb+wTF48P70us+jRm8iKVZHo9mas45CA2KT9qQ4H6RciiwNNingKzAX+3a
	KpWHzm2cSCfjaQdMuRHhmrieP8IqkvtN0F7EMRgCUJi0sqV/Pg3vgi18KwE4XySBte1U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24987.31708.445602.503526@mariner.uk.xensource.com>
Date: Mon, 22 Nov 2021 11:15:40 +0000
To: committers@xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org
Subject: Commit Moratorium (was Re: Xen 4.16 development update - tree status)
In-Reply-To: <45473e8c-4466-d847-3442-73aeb8250875@suse.com>
References: <24983.49015.777430.780265@mariner.uk.xensource.com>
	<45473e8c-4466-d847-3442-73aeb8250875@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

tl;dr:

  Commit moratorium is now in force until further notice
  (which will be given tomorrow afternoon).

Jan Beulich writes ("Re: Xen 4.16 development update - tree status"):
> On 19.11.2021 16:15, Ian Jackson wrote:
> > Tree status
> > ===========
> > 
> > We are now in deep code freeze, during which we will try to discover
> > and eliminate serious bugs and regressions.
> > 
> > All patches other than documentation patches need a Release-Ack.
> > Fixes for serious bugs, and test improvements, will get such an ack.
> > 
> > I have decided to branch on Monday at the same time as cutting RC4.
> 
> May I suggest to consider doing both branching and RC4 after the XSA
> batch has got committed on Tuesday? Or perhaps you did consider and
> found good reasons not to?

No.  I didn't consider that option.  Obviously I should have done.
And I think, in fact, it would be better.  I'll do some more private
testing of what will become RC4.

In the meantime, please would no-one commit to staging.

Ian.

