Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47DF45385E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 18:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226468.391410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn23l-0002Iy-Uj; Tue, 16 Nov 2021 17:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226468.391410; Tue, 16 Nov 2021 17:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn23l-0002GT-Qz; Tue, 16 Nov 2021 17:15:53 +0000
Received: by outflank-mailman (input) for mailman id 226468;
 Tue, 16 Nov 2021 17:15:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn23j-0002GJ-OH
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:15:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn23j-0000Rh-NK
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:15:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn23j-0008LV-MX
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:15:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn23W-0000pb-DC; Tue, 16 Nov 2021 17:15:38 +0000
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
	bh=mn1/p51PXSpKzK4Z9v+ZYENCjTuDSi0jCDQKqZ+TaJM=; b=gzTigV/HGscSY6PPc14bPzwron
	5nbczYdmNvKBpdqThGqqquhAx+ZeOyZJhixfCncJW+eHYTMPmgrGL2j1axtkNGkFt25P6b2S7ZY0f
	sP/fB2VhSjV0xUbCyXd5rCnBNMfCqflwi1+pN7HOmlbQfMg4ajKwF+5DG8NYbZxATfT8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24979.59184.176488.42009@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 17:15:28 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.16 3/4] test/tsx: set grant version for created domains
In-Reply-To: <20211115121741.3719-4-roger.pau@citrix.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
	<20211115121741.3719-4-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16 3/4] test/tsx: set grant version for created domains"):
> Set the grant table version for the created domains to use version 1,
> as such tests domains don't require the usage of the grant table at
> all. A TODO note is added to switch those dummy domains to not have a
> grant table at all when possible. Without setting the grant version
> the domains for the tests cannot be created.
> 
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

