Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA5057EFD8
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jul 2022 16:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373736.605962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFGUj-00012z-RK; Sat, 23 Jul 2022 14:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373736.605962; Sat, 23 Jul 2022 14:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFGUj-00010S-OQ; Sat, 23 Jul 2022 14:52:41 +0000
Received: by outflank-mailman (input) for mailman id 373736;
 Sat, 23 Jul 2022 14:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=saOr=X4=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oFGUj-00010K-0w
 for xen-devel@lists.xenproject.org; Sat, 23 Jul 2022 14:52:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f9aedf-0a97-11ed-924f-1f966e50362f;
 Sat, 23 Jul 2022 16:52:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A68A60B71;
 Sat, 23 Jul 2022 14:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC40C341C0;
 Sat, 23 Jul 2022 14:52:33 +0000 (UTC)
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
X-Inumbo-ID: 16f9aedf-0a97-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658587954;
	bh=eHGhJ9gT5hbsaF5ne4IhQFx6DfM/kznHBz4j3QNAFyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wxodx3+zAsm0XiEbE3jw6YNNywhqynaK28nIT8AcIzHvhFoVT1zmIXMDlmXG45CFd
	 NfY8R+wL8UyExZ6+RhMoqBPSvo6tKE/P+/IVdduH//9Cae0uMHuoBOvs/aGgJhTfL9
	 R1/IQm4BXaOV9l1b+826TQBDHUItZ5Ks7ijSw5e4=
Date: Sat, 23 Jul 2022 16:52:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: Backport of 166d38632316 ("xen/gntdev: Ignore failure to unmap
 INVALID_GRANT_HANDLE")
Message-ID: <YtwLL6hONAyOwjT6@kroah.com>
References: <20220723034415.1560-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723034415.1560-1-demi@invisiblethingslab.com>

On Fri, Jul 22, 2022 at 11:44:10PM -0400, Demi Marie Obenour wrote:
> This series backports upstream commit 166d3863231667c4f64dee72b77d1102cdfad11f
> to all supported stable kernel trees.

All now queued up, thanks.

greg k-h

