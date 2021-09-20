Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694334112EF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190682.340477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGe5-0007vC-6o; Mon, 20 Sep 2021 10:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190682.340477; Mon, 20 Sep 2021 10:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGe5-0007s4-3C; Mon, 20 Sep 2021 10:35:33 +0000
Received: by outflank-mailman (input) for mailman id 190682;
 Mon, 20 Sep 2021 10:35:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGe3-0007ry-DL
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:35:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGe3-0004lN-CV
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:35:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGe3-0006kq-Bg
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:35:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGe0-0005Ui-5a; Mon, 20 Sep 2021 11:35:28 +0100
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
	bh=AywCxshs2A46tEZsdTT1hl1DjftwdGO+aYQ8DibDXdI=; b=bXaf4/yN3G9o26i2bIG5DkY3RJ
	+fK/490fjy71nYXMwkjL9ba1J0dXnjtkJU56Ja9PN9k8rT3bc11szLf/rXN6wDR4dL0R3uPIKOL7a
	yT1DXr/bT7fxRrWE4MFQUvA6n+HnPTEK0jOO6KTgNX5Kd/UQG78JXsGXxMvhznAJpMlM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.25583.920124.88776@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:35:27 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH DNA 5/6] tools/xenstored: restore support for mapping ring as foreign memory
In-Reply-To: <20210917154625.89315-6-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
	<20210917154625.89315-6-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH DNA 5/6] tools/xenstored: restore support for mapping ring as foreign memory"):
> Restore the previous way of mapping the xenstore ring using foreign
> memory. Use xenforeignmemory instead of libxc in order to avoid adding
> another dependency on a unstable interface.

AIUI this therefore partially reverts something - can you point us to
the specific commits ?  In the commit message, ideally.

Thanks,
Ian.

