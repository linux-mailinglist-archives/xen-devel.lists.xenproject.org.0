Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660E42C276
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208544.364709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeyT-0005lI-Tz; Wed, 13 Oct 2021 14:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208544.364709; Wed, 13 Oct 2021 14:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeyT-0005j9-Qo; Wed, 13 Oct 2021 14:11:17 +0000
Received: by outflank-mailman (input) for mailman id 208544;
 Wed, 13 Oct 2021 14:11:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maeyS-0005iv-PG
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:11:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maeyS-0006SJ-OU
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:11:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maeyS-0005bY-Nd
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:11:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maeyM-0007uv-4r; Wed, 13 Oct 2021 15:11:10 +0100
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
	bh=Z+FYk51/rySBF1l/fElIWpeSrHVagHHAaVbNft1wPv8=; b=jJ1Z2f3oFN82dloq9csDjcScUW
	y24+IqCFIJ2IMMwzg9qwud3Z6PZwH9cD9dQjIc9mWHlkXJtDx/fqxeq1ZUt4YX6H+6B0lZ9mbLeOn
	p3op7mWNmWR2LvV1IZG8mv1tT1525hsJ0rnKIEaTyLisZLTDf0s8wn0cBnmyzilQTLvQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24934.59645.908389.768333@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 15:11:09 +0100
To: Juergen Gross <jgross@suse.com>,
    Anthony PERARD <anthony.perard@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: CODING_STYLE: Explicitly deprecate #ifdef [and 1 more messages]
In-Reply-To: <YWWjnAhkMGbct5Ii@perard>,
	<2d9bcfc7-e7a4-1612-92e5-f584c45894fd@suse.com>
References: <20211012145226.6065-1-iwj@xenproject.org>
	<2d9bcfc7-e7a4-1612-92e5-f584c45894fd@suse.com>
	<YWWjnAhkMGbct5Ii@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Re: [PATCH] libxl: CODING_STYLE: Explicitly deprecate #ifdef"):
> On Tue, Oct 12, 2021 at 03:52:26PM +0100, Ian Jackson wrote:
> > +Architecture-specific code should be isolated in libxl_<arch>.c,
> > +with a function call interface, whereever possible.
> 
> s/whereever/wherever/ ?

Fixed, thanks.

> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Juergen Gross writes ("Re: [PATCH] libxl: CODING_STYLE: Explicitly deprecate #ifdef"):
> Reviewed-by: Juergen Gross <jgross@suse.com>

And committed.

Thanks,
Ian.

