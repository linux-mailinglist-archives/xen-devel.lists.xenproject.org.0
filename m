Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F3044E69A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225216.388934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVuF-0001kj-Tj; Fri, 12 Nov 2021 12:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225216.388934; Fri, 12 Nov 2021 12:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVuF-0001hz-Qc; Fri, 12 Nov 2021 12:43:47 +0000
Received: by outflank-mailman (input) for mailman id 225216;
 Fri, 12 Nov 2021 12:43:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlVuE-0001ht-ID
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:43:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlVuE-0008Me-FS
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:43:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlVuE-0007sa-EM
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:43:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mlVuA-0000xF-Mb; Fri, 12 Nov 2021 12:43:42 +0000
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
	bh=AEp/Q0dSRck3VrluOqyBxSTAdMtsAQ8MvAxwFc5VuSE=; b=IAzTlslII95jwmbi7t8v+xdCWq
	7kdZ9YCONbDTQQ3xcMuwLA78pxXrbXL42sEMCspjOfhOie5/S78J9V+9VC7QjLR5m4aYq1TMXqHcq
	Dkk45aBzqA0uTT0IaSg59QW9c8+x7X8GJnzRrardu80TgTL4OBno7wVFlPRxNAO4xVCk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24974.24958.17968.347517@mariner.uk.xensource.com>
Date: Fri, 12 Nov 2021 12:43:42 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH RESEND 1/3][4.16] VT-d: per-domain IOMMU bitmap needs to have
 dynamic size
In-Reply-To: <684f2650-7230-debf-1de6-21745c8efa9b@suse.com>
References: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
	<684f2650-7230-debf-1de6-21745c8efa9b@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH RESEND 1/3][4.16] VT-d: per-domain IOMMU bitmap needs to have dynamic size"):
> With no upper bound (anymore) on the number of IOMMUs, a fixed-size
> 64-bit map may be insufficient (systems with 40 IOMMUs have already been
> observed).
> 
> Fixes: 27713fa2aa21 ("VT-d: improve save/restore of registers across S3")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

provided it can be committed today.

Thanks,
Ian.

