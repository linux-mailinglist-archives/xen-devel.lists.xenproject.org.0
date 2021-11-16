Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5A45346C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226325.391061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzcl-000327-HD; Tue, 16 Nov 2021 14:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226325.391061; Tue, 16 Nov 2021 14:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzcl-0002zx-E8; Tue, 16 Nov 2021 14:39:51 +0000
Received: by outflank-mailman (input) for mailman id 226325;
 Tue, 16 Nov 2021 14:39:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mmzcj-0002zp-Qe
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:39:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mmzcj-0005Pc-PB
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:39:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mmzcj-0001cK-OO
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:39:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mmzcg-0000CS-16; Tue, 16 Nov 2021 14:39:46 +0000
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
	bh=OdFqEbkANqZJCuJqraWD9pv2GTOVC/uTxej4Y43GWrg=; b=ocMpN5IWxj2Gq6MqqXffHUKQzn
	QtbbyLYQEOwy6N3uoFCtlRJlN6EWOREM27PsAOMVrcXsX1p2awholyk8kEiyg9W6dWYkkfbT98K+V
	MbnnqOXqTgB2a4J5WLzHtcJOcSvlR3pz2jamyWHCpwHuE/EG33PtEkIAcTWNOYcjLC34=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24979.49841.401004.188343@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 14:39:45 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH v2] public/gnttab: relax v2 recommendation
In-Reply-To: <8e6e23c7-4416-405f-8bd1-bc5b23ea587e@suse.com>
References: <8e6e23c7-4416-405f-8bd1-bc5b23ea587e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v2] public/gnttab: relax v2 recommendation"):
> With there being a way to disable v2 support, telling new guests to use
> v2 exclusively is not a good suggestion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

This is a just a comment change and AIUI the recommendation ought to
be the same for all relevant versions.

We should consider backporting too.

Ian.

