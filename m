Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0144ABE9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 11:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223860.386787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOkI-0001Xs-S1; Tue, 09 Nov 2021 10:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223860.386787; Tue, 09 Nov 2021 10:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOkI-0001UQ-OR; Tue, 09 Nov 2021 10:52:54 +0000
Received: by outflank-mailman (input) for mailman id 223860;
 Tue, 09 Nov 2021 10:52:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkOkG-0001UK-FK
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:52:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkOkG-0005IP-BO
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:52:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkOkG-00075y-AV
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:52:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mkOkC-0004wR-P6; Tue, 09 Nov 2021 10:52:48 +0000
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
	bh=IDMTRU2RCDKH3WBmqB8KfTyjLM5pGiiSrgL4BmFurSQ=; b=tGC23z4HYWmQaC78UzwisPIReM
	/zvP6zKRvt+2hl+NpTw5odixwXYoWisUohyxxQyDNhgWzuhH9J3KGrWriRcydM2AWB/M7yNdLHsI1
	qEGaasMcjQR1fHYYzZVTytSggCWqNoE+FHj6esjVtwMzg7AMJ3x5sLazGp+JnQz6sk14=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24970.21248.183587.545654@mariner.uk.xensource.com>
Date: Tue, 9 Nov 2021 10:52:48 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.16] tools/configure: make iPXE dependent on QEMU traditional
In-Reply-To: <20211109094721.53346-1-roger.pau@citrix.com>
References: <20211109094721.53346-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] tools/configure: make iPXE dependent on QEMU traditional"):
> iPXE is only used by QEMU traditional, so make it off by default
> unless QEMU traditional is enabled.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: bcf77ce510 ('configure: modify default of building rombios')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This seems to me to be, effectively, a missing hunk from bcf77ce510.
I have stared at it and it looks right to me.  I also looked at some
CI logs.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

Ian.

