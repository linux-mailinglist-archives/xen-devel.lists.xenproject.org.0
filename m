Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E331381C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 16:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82920.153378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98ae-000741-S9; Mon, 08 Feb 2021 15:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82920.153378; Mon, 08 Feb 2021 15:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98ae-00073f-Om; Mon, 08 Feb 2021 15:36:40 +0000
Received: by outflank-mailman (input) for mailman id 82920;
 Mon, 08 Feb 2021 15:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98ac-00073a-Od
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98ac-0006Yi-Kz
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:36:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98ac-0003mS-Ja
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:36:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l98aX-0002lg-TP; Mon, 08 Feb 2021 15:36:33 +0000
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
	bh=IeKenqTVIrnUaxr0XGlDtL9CPSeaPfsXjev4fLBnT98=; b=Q2N+xm+U52BzBbqq/0RArE+3ID
	YpNBmG72VWHzHvBf896egEFBun2Js+T5eP65WAEJ8SsoY7mkamUBkWOlujocUJJotDub7644f6wHv
	jBHQBElbF+Z+SHZZkhixizMvduhpyWhUu5NtusshASHO/UU0jyeuJcXIGeUpt8CeUZUA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.23169.639047.297808@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 15:36:33 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD  <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] tools: create libxensaverestore
In-Reply-To: <20210208155746.2021dde7.olaf@aepfle.de>
References: <20210111164646.13543-1-olaf@aepfle.de>
	<20210208155746.2021dde7.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: [PATCH v2] tools: create libxensaverestore"):
> Am Mon, 11 Jan 2021 17:46:46 +0100
> schrieb Olaf Hering <olaf@aepfle.de>:
> 
> > Move all save/restore related code from libxenguest.so into a separate library libxensaverestore.so.
> 
> Was this considered, in general, or for 4.15?

I'm afraid we have had a problem with tools review bandwidth, for
which I must apologise on behalf of the project.  This also falls
within one of my own areas of responsibility, but we have had a
shortage of effort in this area for a while now.

Ian.

