Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944A44975A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223425.386131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk68r-0006BS-O2; Mon, 08 Nov 2021 15:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223425.386131; Mon, 08 Nov 2021 15:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk68r-00067z-Kk; Mon, 08 Nov 2021 15:01:01 +0000
Received: by outflank-mailman (input) for mailman id 223425;
 Mon, 08 Nov 2021 15:01:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk68r-00067t-0m
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:01:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk68q-0006SK-Tt
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:01:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk68q-0004FD-St
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:01:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mk68n-000196-E5; Mon, 08 Nov 2021 15:00:57 +0000
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
	bh=IH9cltthFSUTLIRqgS3W0iX6TDvQ6YObmDsKPkc7stw=; b=CUZy6VlLnk34i7s/CxaeAWxp4w
	q2+mw6rIlLDFydui5icbhnIMUwOBMLJedA4X/OvVb0OoHoIl7QV7x29/uXBIcye8moZUATycd33/7
	jf2Aibzx+QDw2RcfApPM8ssC/XRJ0TpQ1IF1HkiJvvt7uLvsPb3X+s8GWGwj4QMUoRVI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24969.15273.122188.406602@mariner.uk.xensource.com>
Date: Mon, 8 Nov 2021 15:00:57 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian  Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
In-Reply-To: <20211104104834.10977-1-roger.pau@citrix.com>
References: <20211104104834.10977-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> This needs to be applied on top of Andrew's:
> 
> xen: Report grant table v1/v2 capabilities to the toolstack
> https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/

OK.  Thanks.  Both patches:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I hope this won't turn out to be a mistake...

Ian.

