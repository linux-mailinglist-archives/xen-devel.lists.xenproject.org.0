Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E39406E35
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 17:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184546.333234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOiWh-0007WI-IS; Fri, 10 Sep 2021 15:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184546.333234; Fri, 10 Sep 2021 15:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOiWh-0007Ss-FC; Fri, 10 Sep 2021 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 184546;
 Fri, 10 Sep 2021 15:33:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiWf-0007RG-Kl
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:33:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiWf-0001Tx-Jx
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:33:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiWf-0001Ea-Ix
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:33:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOiWc-0002vd-Cw; Fri, 10 Sep 2021 16:33:10 +0100
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
	bh=YFsFWZbKf9G0xnGvaiu0K9QyyR72cMC4F81CTsIMKMY=; b=jBJkG+Y5SoUlfA1rry5OvoNPg4
	TmRn0CFtMk7RZu5dND0F/T37/BVLITw2GDMBaqdVF2ZbtoQmFLOKQAAkIMv6jeIv5EJ/BI8Er0+b2
	LJAS65jw0MNUx4BBK/DkB2qcJUsSQUHpyBiXq23PU8Hmu4hxVfDtsm3qM85quWz93tYo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24891.31414.191381.348639@mariner.uk.xensource.com>
Date: Fri, 10 Sep 2021 16:33:10 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v3 1/3] stubdom: fix build with disabled pv-grub
In-Reply-To: <20210910055518.562-2-jgross@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
	<20210910055518.562-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v3 1/3] stubdom: fix build with disabled pv-grub"):
> Today the build will fail if --disable-pv-grub as a parameter of
> configure, as the main Makefile will unconditionally try to build a
> 32-bit pv-grub stubdom.
> 
> Fix that by introducing a pv-grub-if-enabled target in
> stubdom/Makefile taking care of this situation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

