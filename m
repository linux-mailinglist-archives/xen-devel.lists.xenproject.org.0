Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4146D344
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 13:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242246.419026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muw1U-0000B7-Jr; Wed, 08 Dec 2021 12:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242246.419026; Wed, 08 Dec 2021 12:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muw1U-00008o-FY; Wed, 08 Dec 2021 12:26:12 +0000
Received: by outflank-mailman (input) for mailman id 242246;
 Wed, 08 Dec 2021 12:26:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muw1S-00008i-Kk
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 12:26:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muw1S-0004yN-IS
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 12:26:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muw1S-0007k6-HQ
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 12:26:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1muw1J-0000Jm-E2; Wed, 08 Dec 2021 12:26:01 +0000
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
	bh=uJXxfR7j8sDohJ2+l/ENoFnAV2xbAa1fCRYOFh+/PQA=; b=nPIglgG7ZCej4kGSdT27Qb6qkm
	TQjoseY+K5T+Gy5UW0LnxTv8KsrcsgQsUzx6V7lYpzEA/n6tPBEGIJNoBH8QDHxLufuwuVTEWyAUV
	H8L1+O9Y9ezCMkyEFcod1Zie161eQLoeSDbFaQGNCiaa8SqPlj0kcMOkNZJSGgrvdI+8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25008.42059.134133.56142@mariner.uk.xensource.com>
Date: Wed, 8 Dec 2021 12:25:47 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: widen Anthony's area
In-Reply-To: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
References: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] MAINTAINERS: widen Anthony's area"):
> As was briefly discussed on the December Community Call, I'd like to
> propose to widen Anthony's maintainership to all of tools/. This then
> means that the special LIBXENLIGHT entry can go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

FWIW

Acked-by: Ian Jackson <iwj@xenproject.org>

I have full confidence in Anthony here.

Ian.

