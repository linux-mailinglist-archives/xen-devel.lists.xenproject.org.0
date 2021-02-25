Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D8325233
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89808.169508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIPh-0005H8-Oh; Thu, 25 Feb 2021 15:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89808.169508; Thu, 25 Feb 2021 15:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIPh-0005Gj-LD; Thu, 25 Feb 2021 15:18:49 +0000
Received: by outflank-mailman (input) for mailman id 89808;
 Thu, 25 Feb 2021 15:18:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFIPg-0005Ge-5J
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:18:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFIPg-0002sg-19
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:18:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFIPf-0005mj-Ua
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:18:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFIPc-0001nZ-Oc; Thu, 25 Feb 2021 15:18:44 +0000
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
	bh=mHgn79VoU0X+EBcR9Q+xaanqK2e6WMyZ3WvtA8NNHrw=; b=qu7Lh0zyxFCjiUL5lZ8PhyPZqv
	pms7kQmcpvMqeBVrhoDM3JFNv+eTFE/e8Iaxv9ffxlja806YfqiRuqA1fzcciTZ/LeoN2mFlT5vLJ
	DwhGxcN5XZP5MHhxJ0MEwJ7VoUMnKQ/1fmRRidK5BxAN4V2mINtOG64khsrRLo6a5uPs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.49108.545436.134210@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 15:18:44 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    "Doug  Goldstein" <cardoe@cardoe.com>
Subject: Re: [PATCH for-4.15] automation: Fix containerize to understand the Alpine container
In-Reply-To: <20210225143701.8487-1-andrew.cooper3@citrix.com>
References: <20210225143701.8487-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] automation: Fix containerize to understand the Alpine container"):
> This was missing from the work to add the alpine container.
> 
> Fixes: a9afe7768bd ("automation: add alpine linux 3.12 x86 build container")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

