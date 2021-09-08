Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C234034CD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181514.328668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrj5-0000iH-6B; Wed, 08 Sep 2021 07:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181514.328668; Wed, 08 Sep 2021 07:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrj5-0000gT-32; Wed, 08 Sep 2021 07:10:31 +0000
Received: by outflank-mailman (input) for mailman id 181514;
 Wed, 08 Sep 2021 07:10:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrj4-0000gN-8d
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:10:30 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e2bd219-9118-4494-9a0d-590a504c9997;
 Wed, 08 Sep 2021 07:10:29 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrha-008aj6-H4; Wed, 08 Sep 2021 07:09:14 +0000
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
X-Inumbo-ID: 0e2bd219-9118-4494-9a0d-590a504c9997
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BIE/LIdFO8jY5B6XQFOTWQMi8dbTNeZ9iRgAJzUQFJU=; b=sj3hwvVEXJG7RXFgHJKiWrl2DW
	PSMKQHTTMqu0a23Z7httVaAjEPT4AM/xssoAfAMFxEVJ6rBlvytzg+s4FehCm7M2Zxirf64YczMY7
	12aopbnZx89CwC6n3lwGa5O0523gUpp+NyNoIRD2nC/aGJ3FvqwZHevdybiDOFcOFgaGILaXKVRNe
	Guo/1qOs4FIXJKtxXEZwQhH4ONEiYUG6xp7qxMxYlUPnI8paKE4dBt5vDzj/NFUNVslm6Yp2u200T
	CuTrCqt17eJo9fP2yxyZHTHqo9QXfN+KhClS4uoWVTEBVxSLfZlemZN6pP2UsIeLh8g8G0WXBkRNM
	kRaojG4w==;
Date: Wed, 8 Sep 2021 08:08:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 11/12] xen/pci-swiotlb: reduce visibility of symbols
Message-ID: <YThhih963WfY/3/W@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <75591cef-95e8-c694-fd11-283800499e4e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75591cef-95e8-c694-fd11-283800499e4e@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:11:14PM +0200, Jan Beulich wrote:
> xen_swiotlb and pci_xen_swiotlb_init() are only used within the file
> defining them, so make them static and remove the stubs. Otoh
> pci_xen_swiotlb_detect() has a use (as function pointer) from the main
> pci-swiotlb.c file - convert its stub to a #define to NULL.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

