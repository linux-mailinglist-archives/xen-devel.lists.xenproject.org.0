Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350D423CDE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202858.357890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY5C8-0005ml-1j; Wed, 06 Oct 2021 11:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202858.357890; Wed, 06 Oct 2021 11:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY5C7-0005k5-Uz; Wed, 06 Oct 2021 11:34:43 +0000
Received: by outflank-mailman (input) for mailman id 202858;
 Wed, 06 Oct 2021 11:34:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY5C6-0005jx-8d
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:34:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY5C6-0002Bz-7r
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:34:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY5C6-0001sY-71
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:34:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mY5C3-0003Hx-0W; Wed, 06 Oct 2021 12:34:39 +0100
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
	bh=SJfFYgQP6f6wlaBR5TA3Vhdn5P5/jliUd9S5Vklng7w=; b=KduO/Jyiv06KNSSHd1qEsf/VSa
	zPxczgUuEPQ0lWaWXcMYsAeOaEpoMtTdNlUtPzMF8BX/yJtXBsuY2VixxOefGiIdErdGGJ10vWhi1
	hak935qJWpetl8+6JTDZfcWTM2i2/yVP6Tptyd4Zb+yjDsBBNsoRlzygQCccQsGQ3Zyo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24925.35278.762786.539238@mariner.uk.xensource.com>
Date: Wed, 6 Oct 2021 12:34:38 +0100
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU
In-Reply-To: <1633519346-3686-3-git-send-email-olekstysh@gmail.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
	<1633519346-3686-3-git-send-email-olekstysh@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr Tyshchenko writes ("[PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU"):
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.

Please forgive me for asking this question now, but: why is this
ARM-specific ?

Ian.

