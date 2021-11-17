Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069A454A80
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 17:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226911.392290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNRW-0002wf-0y; Wed, 17 Nov 2021 16:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226911.392290; Wed, 17 Nov 2021 16:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnNRV-0002tc-Sl; Wed, 17 Nov 2021 16:05:49 +0000
Received: by outflank-mailman (input) for mailman id 226911;
 Wed, 17 Nov 2021 16:05:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnNRU-0002s4-KE
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:05:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnNRU-00043y-JI
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:05:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnNRU-00060x-IK
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 16:05:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnNRP-00068Z-J4; Wed, 17 Nov 2021 16:05:43 +0000
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
	bh=DyWJ/ZxWimWk+fE7tKqO67S6U+zqVIh9eAkzPmzNbL0=; b=W92Oz1G8jI63qa+MLYyQUPk3cH
	d84lPeEIPMtMs/c0clPSVp8CSIePgXOEPf4TDggvoHvT7tGKPWUWjUiv7k6NiKcizEnX2LKAMxqP3
	rRnjJUV93Zwl25pzkfrlDixjY8M5sFWs6cw/Js2QZc/i31oXtmhbholmojEI8p51+vy4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24981.10327.56927.848136@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 16:05:43 +0000
To: Andrew Cooper <amc96@srcf.net>,
    Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode [and 1 more messages]
In-Reply-To: <20211117153350.19823-1-roger.pau@citrix.com>,
	<1927a35e-9902-bee8-f7f2-ab8463043d8e@srcf.net>
References: <20211117153350.19823-1-roger.pau@citrix.com>
	<1927a35e-9902-bee8-f7f2-ab8463043d8e@srcf.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.16] efi: fix alignment of function parameters in compat mode"):
> This will compile, but the caller won't get any data back unless you 
> copy the opposite way here...

Well spotted.  I feel quite the fool!

Ian.

