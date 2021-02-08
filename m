Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F041D3138CC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82941.153463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l991i-0002Vv-JP; Mon, 08 Feb 2021 16:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82941.153463; Mon, 08 Feb 2021 16:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l991i-0002VW-Fq; Mon, 08 Feb 2021 16:04:38 +0000
Received: by outflank-mailman (input) for mailman id 82941;
 Mon, 08 Feb 2021 16:04:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l991h-0002VQ-Bw
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:04:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l991h-0007aA-9Y
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:04:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l991h-0006NL-8j
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:04:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l991e-0002sI-3u; Mon, 08 Feb 2021 16:04:34 +0000
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
	bh=6WJbPb41gFwOKUOGB3oaG9gDtRnmuWnQbnrdy0KBGRA=; b=d8IO6ueEjR5yAoyshhvxuHOJZO
	u5VDLYIp0r2oToKPDgOohE36STdAjMDJOe5GC2ka9wwYRWa2QOhanfaYRsTP6TsO9LFLUc77c85wF
	qFd9683m1umhllXVp0obDP9jzRFELiLyUoO79uxvyrFM7ErUUfm6pC6A0oyyX/aJqHzo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.24849.166342.342346@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 16:04:33 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 06/39] Use XEN_SCRIPT_DIR to refer to /etc/xen/scripts
In-Reply-To: <20210111174224.24714-7-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-7-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 06/39] Use XEN_SCRIPT_DIR to refer to /etc/xen/scripts"):
> Replace all hardcoded paths to use XEN_SCRIPT_DIR to expand the actual location.
> 
> Update .gitignore.

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Although I would have preferred these to be separate patches.

I see no reason not to commit this now so I will queue it.

Ian.

