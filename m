Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD480E115
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652614.1018585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrt5-0002vR-53; Tue, 12 Dec 2023 01:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652614.1018585; Tue, 12 Dec 2023 01:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrt5-0002t8-22; Tue, 12 Dec 2023 01:48:43 +0000
Received: by outflank-mailman (input) for mailman id 652614;
 Tue, 12 Dec 2023 01:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCrt3-0002t2-Bw
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:48:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9264ee6d-9890-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 02:48:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1B0461524;
 Tue, 12 Dec 2023 01:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD99C433C8;
 Tue, 12 Dec 2023 01:48:37 +0000 (UTC)
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
X-Inumbo-ID: 9264ee6d-9890-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345718;
	bh=HlZh59wGfAVBSuorjxj41ZEQZnizjiwbSz1ec6mgCCY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ERK/yd43EQvKEMvujhtvY7GVYRceWO5Ebv5D0ddTCSG8GFJpjA4xr9bvYh1Wpty8K
	 YBrAHFLlSPB/su7hkL7nLTLiKkkB9DsQuWqQY6Et0HyzZJTwTqD/sA8KMGkX73/gC8
	 K3Qm/cEY30ewsgaomeysFRrLYg2/8CNfHxXx/eDtkEmPlSZqYMRJrhUvRpLE1YUvzy
	 1kLtKFiFhVCxm72u1V5fB3yZ7F9JStbcdMp1itQJlFdXmglM8/3VHIwCzRP1dHy7t9
	 sODmY0RnL/pl5Na34PqpK4OzULZU+besOJs5CPhFcZLGVixYJsYRsvRYoRW72NCn3e
	 VpAZxEZvgNhag==
Date: Mon, 11 Dec 2023 17:48:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 1/3] xen/x86: add missing instances of asmlinkage
 attributes
In-Reply-To: <2282f4b7ff0143f513f9677e0cca2d68c0f2a08c.1702285639.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111748300.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com> <2282f4b7ff0143f513f9677e0cca2d68c0f2a08c.1702285639.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

