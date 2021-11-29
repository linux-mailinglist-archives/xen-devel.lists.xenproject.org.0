Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9A9461D68
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 19:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234799.407455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrlAG-0006r9-EA; Mon, 29 Nov 2021 18:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234799.407455; Mon, 29 Nov 2021 18:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrlAG-0006pL-Az; Mon, 29 Nov 2021 18:14:08 +0000
Received: by outflank-mailman (input) for mailman id 234799;
 Mon, 29 Nov 2021 18:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lt1X=QQ=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mrlAE-0006pF-FG
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 18:14:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 209d4276-5140-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 19:14:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CC2BFCE13C6;
 Mon, 29 Nov 2021 18:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77001C53FAD;
 Mon, 29 Nov 2021 18:13:57 +0000 (UTC)
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
X-Inumbo-ID: 209d4276-5140-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638209638;
	bh=F+WfkWfrxxnIhMlyNpExanRvNwfWDNap8xamGA8a5cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsVPD6/9hEJi2Btrc/oHhwFMXnhqB/92eu2VqHUUMVsw0cp/4CJYCiDQA5nb+N0q+
	 VWOWgLa1XeFLdpQ1SA97eCHCPazkXapcTUGfJLYCpE523uX2W4W6dfBSCk4bL6vTID
	 YZQ0tkYoz3gfOb3KGP29UVFxdvcBir/ONFif0FWY=
Date: Mon, 29 Nov 2021 19:13:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Stable backports of Xen related patches
Message-ID: <YaUYYzzPR5p7ePZU@kroah.com>
References: <bb28bab1-eb2e-0dde-3a59-6b5c25e3744d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb28bab1-eb2e-0dde-3a59-6b5c25e3744d@suse.com>

On Mon, Nov 29, 2021 at 04:15:31PM +0100, Juergen Gross wrote:
> Hi Greg,
> 
> attached are git bundles for some patches you merged into the 5.10
> stable kernel already this morning.
> 
> Naming should be obvious, the patches are on the branch "back" in
> each bundle.

All now queued up, thanks!

greg k-h

