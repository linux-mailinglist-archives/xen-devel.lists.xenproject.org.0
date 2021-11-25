Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C268745D8D7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230962.399300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCcO-0003IW-Gb; Thu, 25 Nov 2021 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230962.399300; Thu, 25 Nov 2021 11:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCcO-0003Fn-C5; Thu, 25 Nov 2021 11:08:44 +0000
Received: by outflank-mailman (input) for mailman id 230962;
 Thu, 25 Nov 2021 11:08:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqCcN-0003Fe-Aw
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:08:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqCcN-0000Yg-9U
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:08:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqCcN-00034B-8Y
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:08:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mqCcF-0006eD-1E; Thu, 25 Nov 2021 11:08:35 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Baj77EEBwhbmE6q880L55FHjgxo6yvwmkt3alhqlRuI=; b=YwyWZV0y5TctoQN7jnalhPVCzx
	E63V/FGXJmZ5k1G895rxt53+9fBsld/TyrSauOKpxmy/maERunJSPGR+qilksw7Ow+ptVLZaGfjmM
	0FO8qKiKRzCY/au9mhwJV8bfIeVpfGgp7CELqHj5ryNyJAjPuZe+lmnmUjXoGDIsdkwU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24991.28338.658525.266425@mariner.uk.xensource.com>
Date: Thu, 25 Nov 2021 11:08:34 +0000
To: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
In-Reply-To: <24991.27991.43570.905419@mariner.uk.xensource.com>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
	<00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
	<24991.27991.43570.905419@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents""):
> Jan Beulich writes ("Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents""):
> > While not strictly needed with Roger having given his already,
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > to signal my (basic) agreement with the course of action taken.
> > Nevertheless I fear this is going to become yet one more case where
> > future action is promised, but things then die out.
> > 
> > Ian - I guess all this now needs is your R-a.
> 
> Thanks everyone.  Yes.
> 
> For the record,
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> I will commit it myself now.

Reviewing the thread, there was some discussion over the commit
message.  It wasn't clear to me whether there was still a change
intended.

I decided not to wait for 4.16, so I have committed it there as-is.
The commit message is less important there as it won't end up in most
archeaology.

When the discussion about the commit message has converged, please
would someone commit the patch to staging too.

Thanks,
Ian.

