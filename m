Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D830F8E5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 18:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81381.150352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7i07-0001NR-00; Thu, 04 Feb 2021 17:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81381.150352; Thu, 04 Feb 2021 17:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7i06-0001N2-Sy; Thu, 04 Feb 2021 17:01:02 +0000
Received: by outflank-mailman (input) for mailman id 81381;
 Thu, 04 Feb 2021 17:01:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7i05-0001Mx-GI
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:01:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7i05-0007oY-Dy
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:01:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7i05-0004JB-C6
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:01:01 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7i02-0000FB-6x; Thu, 04 Feb 2021 17:00:58 +0000
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
	bh=QNlvHYRroz6D6/RDu3PyVs6i+A0AYlfH++dbgPh+wDw=; b=3T+R76XiUqpkF9euMsRTNP7a3x
	vTKk9DVl7Sdy+Z7EPQp1hazQOIn5jZLeswPoyNAQMyZCM4CCrWcz09v5r7AT0q8XhKRuU6NDchZPY
	tyeAyWElm7pEOq6CHS3pTm0s5p6RdtSzsakYOKNWZArOy4OMhRzXP5Dz3eQlYPmm4U3s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24604.10313.939225.448487@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 17:00:57 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Julien Grall <julien.grall@arm.com>,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH for-4.15] libs/devicemodel: Fix ABI breakage from xendevicemodel_set_irq_level()
In-Reply-To: <20210204155850.23649-1-andrew.cooper3@citrix.com>
References: <20210204155850.23649-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] libs/devicemodel: Fix ABI breakage from xendevicemodel_set_irq_level()"):
> It is not permitted to edit the VERS clause for a version in a release of Xen.
> 
> Revert xendevicemodel_set_irq_level()'s inclusion in .so.1.2 and bump the the
> library minor version to .so.1.4 instead.
> 
> Fixes: 5d752df85f ("xen/dm: Introduce xendevicemodel_set_irq_level DM op")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Sorry for not spotting this earlier.

