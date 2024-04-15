Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166F8A5D39
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 23:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706497.1103658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUFI-0006KG-3X; Mon, 15 Apr 2024 21:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706497.1103658; Mon, 15 Apr 2024 21:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUFI-0006IG-07; Mon, 15 Apr 2024 21:52:12 +0000
Received: by outflank-mailman (input) for mailman id 706497;
 Mon, 15 Apr 2024 21:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNdO=LU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwUFG-0006IA-A6
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 21:52:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 677891e5-fb72-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 23:52:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D1B260EC3;
 Mon, 15 Apr 2024 21:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBB0C113CC;
 Mon, 15 Apr 2024 21:52:06 +0000 (UTC)
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
X-Inumbo-ID: 677891e5-fb72-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713217926;
	bh=Lz/SDKMbXD0hzL8e7UQggC7vkeR7kjh7KnUKomRHsZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ehgqo+pV9rsO5EBSUKqawGMmmbTIUzAh6TlkWw/xUV3KCDHiTMEfW8OkGoN6YSkg2
	 50UUm9H8uo//1bOLiBcSUwv/L0ngGNpBs9PeXVhtujD1IXyq2PTuivyKzBtp/00xKl
	 YTrkTJptmCX4qiU+8bbm3Fka5GXJP/AEOKuMtCayQvCe9bMfMgP6iYTDpHsyY03QHx
	 WjxEJ3cUkSslNYfVhR8LTMH3gP7zvq24jQMPYReJssfgdHLeBkb+/mkr4Y/12KaPZk
	 o1SoOdhZgt8Y+lfiOsCf0BuHU7Iig0DdX17wHtcYk8Q4oUOqwwppWSea90J7E5tA73
	 VhOtQiV7b3Fbg==
Date: Mon, 15 Apr 2024 14:52:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/4] xen/xlat: Sort structs per file
In-Reply-To: <20240415154155.2718064-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404151451580.997881@ubuntu-linux-20-04-desktop>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com> <20240415154155.2718064-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Apr 2024, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


