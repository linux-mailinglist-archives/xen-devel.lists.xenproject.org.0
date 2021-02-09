Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F231544E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83335.154816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WCh-0008Of-WE; Tue, 09 Feb 2021 16:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83335.154816; Tue, 09 Feb 2021 16:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WCh-0008OF-TC; Tue, 09 Feb 2021 16:49:31 +0000
Received: by outflank-mailman (input) for mailman id 83335;
 Tue, 09 Feb 2021 16:49:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WCg-0008O3-Fb
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:49:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WCg-0002mm-Ev
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:49:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WCg-0004RZ-EG
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:49:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9WCd-0005u5-4k; Tue, 09 Feb 2021 16:49:27 +0000
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
	bh=yHG2qfc/IXAIs9CHJMF2Vx71A2v4y1qIu7VmreiNC4E=; b=T33QSR+JMN77FHDfATAi9eu0p7
	yip8C9fGx93KadqiPP6SNXBaetdDD9S3QRdL8ty8GszIg3SYSpuc39CKS2d/Pus+OLraCC2IRbcJC
	Yni0Rgc5g7/GRHtJpbpQ9g9NljUzBTTTpgc8L4xImJJ/i++GC8UnA9+wyyIf9o0fcVEw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.48406.940250.878091@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 16:49:26 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210209 2/4] tools: add with-xen-scriptdir configure option
In-Reply-To: <20210209154536.10851-3-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-3-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210209 2/4] tools: add with-xen-scriptdir configure option"):
> Some distros plan for fresh installations will have an empty /etc,
> whose content will not be controlled by the package manager anymore.
> 
> To make this possible, add a knob to configure to allow storing the
> hotplug scripts to libexec instead of /etc/xen/scripts.
> 
> The current default remains unchanged, which is /etc/xen/scripts.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

