Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DC333B7D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96020.181445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJx68-0000yY-IE; Wed, 10 Mar 2021 11:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96020.181445; Wed, 10 Mar 2021 11:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJx68-0000y9-Ey; Wed, 10 Mar 2021 11:33:52 +0000
Received: by outflank-mailman (input) for mailman id 96020;
 Wed, 10 Mar 2021 11:33:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJx66-0000xy-Nf
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:33:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJx66-0000IC-Mq
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:33:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJx66-0003rV-M7
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:33:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJx5q-0005uA-HG; Wed, 10 Mar 2021 11:33:34 +0000
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
	bh=9WAQxYiJ3+8ZC3U2C8pjaWlX1R549vui2Sv0g+sv0hs=; b=7LJUGbLBdqXR8dXFPhv4zntrvq
	WqJe4CNSqdcRlcBwEspNDLcp9VnE+j70d6fopUDUNckmcf+DsBz18koED8k/SsPEJJ/tc6oTvETMk
	wtttPSfZWAYoyZKdF6YVHw9ztyejNIIbz/VCRg86JVn3V32GykCbK7arvqRhrpCFlMJA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24648.44686.272676.156900@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 11:33:34 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Michal Orzel <michal.orzel@arm.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall  <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    bertrand.marquis@arm.com,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
In-Reply-To: <3247ee1d-f843-7c74-20a4-315716a91097@suse.com>
References: <20210310065803.348-1-michal.orzel@arm.com>
	<3247ee1d-f843-7c74-20a4-315716a91097@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE"):
> Nit: Linux, iirc, has dropped support for ---help--- (allowing
> only help now). To limit churn whenever we're going to re-sync
> our kconfig again, I'd like to avoid introduction of new uses
> of the old form. I'm sure this could be taken care of while
> committing.

At this stage of the release I would prefer to avoid updates made by
the committer when committing.  Ie the thing that is committed should
have been previously posted and had at least some minimal time to spot
howlers.

Thanks,
Ian.

