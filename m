Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9274303C39
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74911.134713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MxP-00071D-Mn; Tue, 26 Jan 2021 11:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74911.134713; Tue, 26 Jan 2021 11:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MxP-00070i-JW; Tue, 26 Jan 2021 11:56:27 +0000
Received: by outflank-mailman (input) for mailman id 74911;
 Tue, 26 Jan 2021 11:56:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4MxN-00070d-U3
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:56:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4MxN-0005C8-ST
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:56:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4MxN-00009z-Ri
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:56:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4MxK-0006Xq-HP; Tue, 26 Jan 2021 11:56:22 +0000
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
	bh=R360XRmK62L9z/bgCDz/qMbWwMD3QQciR+iJxBJyddU=; b=KNz/B7wJPLahVTcAJVFm0oPKVE
	Sj9UZu8MZnVbr5xaRV/znyLGZfsqiITSRvTwXEKHKu9mc1q4w/nmb1jct+Dl0m+ENwKfUDfzhooQo
	1rf5cOgNG0trhOzO9IAD79rhjEgbdJWNWRK2sdgKwiqnp7hwDDyCNv+o+gxv09RVbqTs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.870.302768.927980@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 11:56:22 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC
In-Reply-To: <b33f4fd3-e81a-a703-9fb5-a01880c2db9a@suse.com>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
	<b33f4fd3-e81a-a703-9fb5-a01880c2db9a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC"):
> There's no need for the extra abstraction.

Thanks for tidying things up.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

However, I think this is a refactoring commit which wasn't posted
before the last posting date and can easily be postponed ?  So:

Release-Nacked-by: Ian Jackson <ian.jackson@eu.citrix.com>
        ^^^^^^

Please correct me if I am wrong and you (Jan, or Andy, or anyone)
think this should go into 4.15.

Thanks,
Ian.

