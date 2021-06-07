Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D601139DEB4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 16:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137997.255560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGCu-0006gi-Qg; Mon, 07 Jun 2021 14:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137997.255560; Mon, 07 Jun 2021 14:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGCu-0006dz-MD; Mon, 07 Jun 2021 14:26:24 +0000
Received: by outflank-mailman (input) for mailman id 137997;
 Mon, 07 Jun 2021 14:26:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqGCs-0006dr-Up
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:26:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqGCs-0001hE-T1
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:26:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lqGCs-0006Ev-Rx
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:26:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lqGCp-0000Tn-Hx; Mon, 07 Jun 2021 15:26:19 +0100
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
	bh=yLWoO6vSBtIOqTBuNjpT0IriygDNMYMvZ3be+AzBg0M=; b=hZhXmXt4NDcnpeV5gOHbPeqKCp
	J6qU/+ZpgnF4YXDZMDC0lUlCsgH4e9tNhbOLoRhRncUhhxdmf4cqjTjfCUyzirtPJ1gJEoL+YoZR2
	yUvKqnXs3IYeH06AA8AVDlm9z3tuJOF386CaY6tXnNySl7ZyA3YLUaPwkFfwE+b/e/jw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24766.11403.340597.148842@mariner.uk.xensource.com>
Date: Mon, 7 Jun 2021 15:26:19 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as tools/libs reviewer
In-Reply-To: <20210607112310.22180-1-jgross@suse.com>
References: <20210607112310.22180-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH] MAINTAINERS: add myself as tools/libs reviewer"):
> I have touched most of the Xen libraries in the past, and there is a
> clear lack of reviewer band width in the tools area.
> 
> Add myself as a tools/libs reviewer for that reason.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

