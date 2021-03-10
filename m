Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C30333E80
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 14:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96073.181539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJz0p-0004Gc-Fi; Wed, 10 Mar 2021 13:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96073.181539; Wed, 10 Mar 2021 13:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJz0p-0004GG-CX; Wed, 10 Mar 2021 13:36:31 +0000
Received: by outflank-mailman (input) for mailman id 96073;
 Wed, 10 Mar 2021 13:36:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJz0n-0004GB-BY
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:36:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJz0n-0002f4-9w
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:36:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJz0n-0004hp-95
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:36:29 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJz0Y-00069h-12; Wed, 10 Mar 2021 13:36:14 +0000
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
	bh=8ms5qV+gEfYguU4vkBpxWrkWXvk58ThvNl32YBhoIys=; b=RB4Pbl7y1jdNHa1mPbEs6t8K4H
	4iObhrQs9CievR0CPM0UjdMrvDXTMNl6h0vuLo3JhrjxaKsa15K6M9C7zSI1JUzhCefUPevO4j7Th
	3D++C7kZ03yI9O20Srn9UiDI/2Tp6GvUi22gpeSDfBY+Ov5hrD7Ia+5UmTBSDrTZDhrI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24648.52045.413392.930954@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 13:36:13 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    Michal Orzel <michal.orzel@arm.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    bertrand.marquis@arm.com,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
In-Reply-To: <c9595c38-ea5d-b975-c742-25017dfb5899@xen.org>
References: <20210310065803.348-1-michal.orzel@arm.com>
	<3247ee1d-f843-7c74-20a4-315716a91097@suse.com>
	<24648.44686.272676.156900@mariner.uk.xensource.com>
	<c9595c38-ea5d-b975-c742-25017dfb5899@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE"):
> I was under the impression that this patch would not target 4.15. At 
> least I didn't see any request for it.

OK, good :-).

Thanks,
Ian.

