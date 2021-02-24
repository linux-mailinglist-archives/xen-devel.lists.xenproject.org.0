Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0522323AEE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 12:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89263.168015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErvW-0003rW-IY; Wed, 24 Feb 2021 11:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89263.168015; Wed, 24 Feb 2021 11:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErvW-0003rA-FR; Wed, 24 Feb 2021 11:01:54 +0000
Received: by outflank-mailman (input) for mailman id 89263;
 Wed, 24 Feb 2021 11:01:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lErvV-0003r5-7W
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:01:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lErvV-0003ml-0n
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:01:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lErvU-0006yH-SR
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:01:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lErvR-0006d7-Jm; Wed, 24 Feb 2021 11:01:49 +0000
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
	bh=KGUKAx6F4QFDhjlJfQFEI6wrsIO6N4p5EZcQDnzLuXs=; b=skGDHhJF3gRaXopY704B2AOe0K
	oyMZLnFCT8PdK0bCEBkh3GglrKJMSqYZgcEpEGDuUTm7wG0sOn9ibfx/jN+36icB7tgr/n/D+Bp1J
	WNaFWk0LQVufj0LlM8jQd7MgVeTLTklr24CKG/ApXtfnDxHdzOeYsEX6Yq1/qcdfoA9U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24630.12829.379628.348559@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 11:01:49 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    hongyxia@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Paul Durrant <paul@xen.org>
Subject: Re: [for-4.15][RESEND PATCH v4 0/2] xen/iommu: Collection of bug fixes for IOMMU teardown
In-Reply-To: <20210224094356.7606-1-julien@xen.org>
References: <20210224094356.7606-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[for-4.15][RESEND PATCH v4 0/2] xen/iommu: Collection of bug fixes for IOMMU teardown"):
> This series is a collection of bug fixes for the IOMMU teardown code.
> All of them are candidate for 4.15 as they can either leak memory or
> lead to host crash/host corruption.
> 
> This is sent directly on xen-devel because all the issues were either
> introduced in 4.15 or happen in the domain creation code.

Thanks.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I'd appreciate it if reviewers would double-check the comments and
commit messages which Julien has helpfully provided, to check that the
assertions made are true.  It seems this is quite complex...

Ian.

