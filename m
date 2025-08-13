Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA9B249BB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079882.1440563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAs9-00066F-Ao; Wed, 13 Aug 2025 12:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079882.1440563; Wed, 13 Aug 2025 12:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAs9-00064R-89; Wed, 13 Aug 2025 12:46:29 +0000
Received: by outflank-mailman (input) for mailman id 1079882;
 Wed, 13 Aug 2025 12:46:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1umAs7-00064L-B3
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:46:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umAs6-003McF-2K;
 Wed, 13 Aug 2025 12:46:26 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umAs6-002QqU-22;
 Wed, 13 Aug 2025 12:46:26 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=mpyuVnk7dXe5YvgV0HiL/W2djS5N8WP8Wp2zOpy1tXQ=; b=KEG4ay4LYVKk0Q9V12dOWIEhJ2
	Y+NDmDdypGgc4/JmNERPNXEsVaNQbeQGHr5ebzUF3R7GjRrQlCaIHXyHNkzbLaKc6CCt2M4GwQtWr
	vWjVTdLDLyNsKRJhT8E2/WJVqLePOxaet94Mx8WQfRcXS02uceUmTLKJTYvs0M4iuejc=;
Date: Wed, 13 Aug 2025 14:46:25 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/3] CI: Workaround extra content in junit
Message-ID: <aJyJIYKioCoVn4SP@l14>
References: <20250730152602.45436-1-anthony@xenproject.org>
 <20250730152602.45436-4-anthony@xenproject.org>
 <aJd2eHFgiLBNiWCy@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJd2eHFgiLBNiWCy@mail-itl>

On Sat, Aug 09, 2025 at 06:25:28PM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, Jul 30, 2025 at 05:26:02PM +0200, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Is it still an issue? AFAIR similar issue was fixed together with fixing
> xml upload hanging.

It was an issue in June:
    https://lore.kernel.org/xen-devel/20250603124222.52057-9-anthony@xenproject.org/

And it still is:
    https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10969191455
    > WARNING: Found 75 too many lines in junit.

Thanks,

-- 
Anthony PERARD

