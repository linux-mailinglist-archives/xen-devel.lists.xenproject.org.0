Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EB3A6868
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141533.261405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmzM-0005BE-Ic; Mon, 14 Jun 2021 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141533.261405; Mon, 14 Jun 2021 13:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmzM-00058J-El; Mon, 14 Jun 2021 13:50:52 +0000
Received: by outflank-mailman (input) for mailman id 141533;
 Mon, 14 Jun 2021 13:50:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lsmzL-000587-3P
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:50:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lsmzL-0005Sv-2d
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:50:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lsmzL-0006Ly-1m
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:50:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lsmzF-0006Uk-HL; Mon, 14 Jun 2021 14:50:45 +0100
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
	bh=lmsjuCqy01w2J3x7XLhXB8nl/HjAhLx07qnDGRbWeVk=; b=QNQlzLU70gy0ZGv82BSsayl6kQ
	K7liR1/Gfg8dzs+z8K2nuG5sI4E5CPqvH3h/NY3T/glnca+DuupnUHVRbdCR8Av+IPyhsWXiOYg6r
	441l0mcdJZu9kQ0RL0nPOMHvitBPbB8DqxDIDcAISg9cnsOvaiZVIXM6AUuKyxUEG43g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24775.24245.273501.946833@mariner.uk.xensource.com>
Date: Mon, 14 Jun 2021 14:50:45 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH] ts-xen-build: Turn on CONFIG_PV32 again
In-Reply-To: <f45a45c0-b847-d6f8-d613-f2111c390929@suse.com>
References: <20210611170230.20195-1-iwj@xenproject.org>
	<f45a45c0-b847-d6f8-d613-f2111c390929@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [OSSTEST PATCH] ts-xen-build: Turn on CONFIG_PV32 again"):
> On 11.06.2021 19:02, Ian Jackson wrote:
> > CC: George Dunlap <george.dunlap@citrix.com>
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Ian Jackson <iwj@xenproject.org>
> 
> FWIW:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.  FTR, I pushed this on Friday and it is now in production and
you can no doubt tell.

Ian.

