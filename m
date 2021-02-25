Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD25F325512
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 19:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89926.169920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKxb-0000zt-Bw; Thu, 25 Feb 2021 18:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89926.169920; Thu, 25 Feb 2021 18:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKxb-0000zY-8y; Thu, 25 Feb 2021 18:01:59 +0000
Received: by outflank-mailman (input) for mailman id 89926;
 Thu, 25 Feb 2021 18:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKxa-0000zT-8v
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 18:01:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKxa-0006JY-8A
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 18:01:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKxa-0004Z2-6J
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 18:01:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFKxX-0002Ch-1A; Thu, 25 Feb 2021 18:01:55 +0000
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
	bh=akTlfYgJjovnCIPnUT9CvbsHD1PV0+yP04ewlvjQrfA=; b=mWDaXuNU6EiVQJ0tkdsuiFMDFN
	IWdRMFV5GMGxejx1mhXwIZKXO0XmmkLGHHoNkF6k3lBgg0LqJDt4Qw5/KfkG2TUtAG3l+zX8rpgFj
	Kk+wUWdclt68srSmQ+PvJjg1tc7h1+XPrhi8+Qh9Uaha6pH6H9IU6P/ALJ7MTDigwX5s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.58898.784038.302778@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 18:01:54 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15 0/5] xenstore: Address coverity issues in the
 LiveUpdate code
In-Reply-To: <ef866801-27f1-245c-74c6-0b1e08c627af@xen.org>
References: <20210225174131.10115-1-julien@xen.org>
	<24631.58442.167560.663929@mariner.uk.xensource.com>
	<ef866801-27f1-245c-74c6-0b1e08c627af@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15 0/5] xenstore: Address coverity issues in the LiveUpdate code"):
> On 25/02/2021 17:54, Ian Jackson wrote:
> > Julien Grall writes ("[PATCH for-4.15 0/5] xenstore: Address coverity issues in the LiveUpdate code"):
> >>    tools/xenstored: Silence coverity when using xs_state_* structures
> > 
> > For this I can't see a reason to give a release ack ?  See also Andy's
> > comments.
> 
> I don't have a reason for this one as it is so far just silencing 
> Coverity. Sorry I should have mention that this one is not really 4.15 
> material.

No problem, thanks for the fixes!

Ian.

