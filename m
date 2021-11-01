Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB6441A12
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 11:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219113.379778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUlx-00015c-MW; Mon, 01 Nov 2021 10:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219113.379778; Mon, 01 Nov 2021 10:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUlx-00012c-JO; Mon, 01 Nov 2021 10:42:37 +0000
Received: by outflank-mailman (input) for mailman id 219113;
 Mon, 01 Nov 2021 10:42:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUlv-00012S-Rt
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:42:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUlv-0005ft-R5
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:42:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUlv-0006iv-QC
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:42:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhUls-0004hn-6c; Mon, 01 Nov 2021 10:42:32 +0000
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
	bh=dclReh29izfomgWHXfcknF+eYpx5n6eEAV5EVtuQulw=; b=zCCkSbiPBikme+d7lftzHA9nwE
	Y5Evo/9+yKykYOLDzWKFqsqjmE4tVfM7pkMHDGLXNAKBF8rB/V8IhEjPfDO7Ldqg3vho6r/0/Owcw
	pq8PcWEbwUy/52Wd6vY8CaiBQr2OnhYeh4Q00udnfasHeWYR0LwNzzb3dyeiPk1eq/jE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24959.50327.734844.392991@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 10:42:31 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16 1/2] tools/golang: Regenerate bindings
In-Reply-To: <20211029173753.22892-1-andrew.cooper3@citrix.com>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
	<20211029173753.22892-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.16 1/2] tools/golang: Regenerate bindings"):
> This was missed previously.
> 
> Fixes: 1e6706b0d123 ("xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

(but note the mail I just sent about commit moratorium)

