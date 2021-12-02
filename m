Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DF466656
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236716.410611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnsj-0008Ch-Dw; Thu, 02 Dec 2021 15:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236716.410611; Thu, 02 Dec 2021 15:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnsj-0008Au-Ah; Thu, 02 Dec 2021 15:20:21 +0000
Received: by outflank-mailman (input) for mailman id 236716;
 Thu, 02 Dec 2021 15:20:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msnsh-0007qX-TG
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:20:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msnsh-0003Ze-SN
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:20:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msnsh-0008Ib-RZ
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:20:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1msnsL-0001jd-4x; Thu, 02 Dec 2021 15:19:57 +0000
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
	bh=O6b2fLLa0NvKYldrbNUtChOHahKwWxiz8PzvcVfhC5Y=; b=p/hFAHHaORXgDZnu/hXDsoJNPR
	aGu2w2FakKjZhOfX6DfQsnzcCyDlQr03i02ImOfvZJUm9CRJkFpswufu7IosHv+GxLhdBb4bNbr4L
	ja0hDZkgYl8NJ2kAb+LuitThQrS8SAr+sQLtKVEQf376U0vasluXhk1ZxfApr0vkmyvE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25000.58384.67916.802992@mariner.uk.xensource.com>
Date: Thu, 2 Dec 2021 15:19:44 +0000
To: xen-announce@lists.xenproject.org
Cc: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Re: Xen 4.16 is released
In-Reply-To: <25000.56055.611856.335342@mariner.uk.xensource.com>
References: <25000.56055.611856.335342@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Correction:

I wrote:
> Xen 4.16, the product of 9 months' work by the Xen Project community,
> is now released.
> 
> You can find it here:
>   git clone -b RELEASE-4.16.0 https://xenbits.xen.org/git-http/xen.git
>   https://downloads.xenproject.org/release/xen/4.16.0/
> For more information see the release notes:
>   https://wiki.xenproject.org/wiki/Xen_Project_4.16_Release_Notes
> There is also the press release:

This should have instead linked to the blog post:
  https://xenproject.org/2021/12/02/xen-project-ships-version-4-16-with-focus-on-improved-performance-security-and-hardware-support/

> Xen 4.16 has a number of improvements, ranging from cleanups to
> significant new features in a number of areas:
>   https://wiki.xenproject.org/wiki/Xen_Project_4.16_Feature_List
> (reproduced below).
> 
> Thanks and congratulations are due to all the people and organisations
> who have contributed.  Well done, everyone!

Ian.
(Xen 4.16 Release Manager)

