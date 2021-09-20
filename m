Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33B4112E3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190669.340454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGbR-0006hc-F3; Mon, 20 Sep 2021 10:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190669.340454; Mon, 20 Sep 2021 10:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGbR-0006f0-BI; Mon, 20 Sep 2021 10:32:49 +0000
Received: by outflank-mailman (input) for mailman id 190669;
 Mon, 20 Sep 2021 10:32:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGbP-0006eb-V6
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:32:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGbP-0004gO-U7
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:32:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGbP-0006J9-T6
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:32:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGbM-0005TT-Jm; Mon, 20 Sep 2021 11:32:44 +0100
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
	bh=E4B127heE16WiQzfnSIV4THNFKniVsefWPf1gQnMdRw=; b=dS39rMhlqkKfO1MDDsH7JwgMlP
	jMqy5yDGgHsvvIJNF9leLR7xJO1IKMF+E7OFUx5oOjcGftibMph/H3eOpliR1NHJiDmX2BxqccbVL
	9guEg/IoS/ix6K+4VQUvTbQDQO5vXiXltxjLf+xtZym2hIWvMGlGOClYKPJFLsdKExtM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.25420.346051.604198@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:32:44 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/6] tools/console: use xenforeigmemory to map console ring
In-Reply-To: <20210917154625.89315-4-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
	<20210917154625.89315-4-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH 3/6] tools/console: use xenforeigmemory to map console ring"):
> This patch replaces the usage of xc_map_foreign_range with
> xenforeignmemory_map from the stable xenforeignmemory library. Note
> there are still other uses of libxc functions which prevents removing
> the dependency.
> 
> No functional change intended.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

