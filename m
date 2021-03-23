Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF93462E7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 16:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100726.192087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOj0h-0002mf-C9; Tue, 23 Mar 2021 15:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100726.192087; Tue, 23 Mar 2021 15:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOj0h-0002mG-93; Tue, 23 Mar 2021 15:31:59 +0000
Received: by outflank-mailman (input) for mailman id 100726;
 Tue, 23 Mar 2021 15:31:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOj0g-0002m9-Ix
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOj0g-0000ml-EI
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:31:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOj0g-0001Ch-Cu
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:31:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOj0V-0002PL-4l; Tue, 23 Mar 2021 15:31:47 +0000
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
	bh=N/Hw4OYulQ/iGnxJmriBGRe+zuIhhZcLph/BpwEYHuc=; b=44lwZ4lOQPszyvaXrirMK9iAsi
	MhYYXxsZcWyPDt7RDu6LgUfQRv7sBjHFkH72PjDqBtSkMzxR22o/WilmcfAtwhX/kaWMIjBgwyVPL
	gct06cP0KuRCcbR3jY3FDp8543xhEtcB9yKVegFkLlQ9wJf5dpro4VqONP7Vqd9hll/8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24666.2530.951003.624852@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 15:31:46 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <committers@xenproject.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    <xen-devel@lists.xenproject.org>,
    <community.manager@xenproject.org>
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
In-Reply-To: <YFoIrExXI96BSduD@Air-de-Roger>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
	<YFoIrExXI96BSduD@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

(dropping Frédéric Pierret of Qubes, who was CC'd becausd of the Ryzen
issue.)

Roger Pau Monné writes ("Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow"):
> So there's also the series from Andrew to allow Solaris to boot
> without resorting to use the 'msr_relaxed' option:
> 
> https://lore.kernel.org/xen-devel/20210316161844.1658-1-andrew.cooper3@citrix.com/
> 
> This has been R-A:
> 
> https://lore.kernel.org/xen-devel/24658.7471.309734.168120@mariner.uk.xensource.com/

Thanks for pointing this out.  You seem to be right.

> But AFAICT it's missing a repost with some minimal adjustments?
> 
> If we don't get this in we should document on the release notes that
> Solaris guests will likely require 'msr_relaxed=1' option added to the
> configuration file in order to work.

Right.  I still would like to see this fixed.  But I think I would
like to see it finished and committed ASAP.  Can we manage that by
the end of Thursday ?

Ian.

