Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D232873C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:23:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91830.173307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmG8-0000Ly-J7; Mon, 01 Mar 2021 17:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91830.173307; Mon, 01 Mar 2021 17:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmG8-0000LZ-FV; Mon, 01 Mar 2021 17:23:04 +0000
Received: by outflank-mailman (input) for mailman id 91830;
 Mon, 01 Mar 2021 17:23:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmG7-0000LU-VS
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmG7-00051F-Rt
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:23:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmG7-0003FG-NU
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:23:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmG4-00050L-Ft; Mon, 01 Mar 2021 17:23:00 +0000
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
	bh=WbpzYTsRS88Sja6k7+DSNQhIBS6w6XPw9uybmNVBtDo=; b=rSvxa+UYE40LtAd3TrHHrrk8B0
	ZESIlRGAsnLg5GeNLxoh6k15f3CISZiUJQ/KE9TY0FBWhAKLyOaC2finXosmrHcrIJfgR9F6YAr5u
	j9r80LzMPCv/vrwBZ3nfgKg69PrBn3mZCgl50cFob382Y2/kVeZOcv6hvlpk7ZrLcY8g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.8948.259850.836226@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:23:00 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15 2/3] firmware: provide a stand alone set of headers
In-Reply-To: <20210226085908.21254-3-roger.pau@citrix.com>
References: <20210226085908.21254-1-roger.pau@citrix.com>
	<20210226085908.21254-3-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15 2/3] firmware: provide a stand alone set of headers"):
> The current build of the firmware relies on having 32bit compatible
> headers installed in order to build some of the 32bit firmware, but
> that usually requires multilib support and installing a i386 libc when
> building from an amd64 environment which is cumbersome just to get
> some headers.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

