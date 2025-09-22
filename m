Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2924B92C65
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 21:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127970.1468486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0mBc-0001Jt-HQ; Mon, 22 Sep 2025 19:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127970.1468486; Mon, 22 Sep 2025 19:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0mBc-0001Go-EB; Mon, 22 Sep 2025 19:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1127970;
 Mon, 22 Sep 2025 19:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyC/=4B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1v0mBb-0001Gd-46
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 19:26:55 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17ac3aa8-97ea-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 21:26:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A53466013B;
 Mon, 22 Sep 2025 19:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29034C4CEF0;
 Mon, 22 Sep 2025 19:26:50 +0000 (UTC)
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
X-Inumbo-ID: 17ac3aa8-97ea-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758569211;
	bh=yHy+k2O362f4ukNf9FzIDOn87yC3M5HXDUAgv+Iuww4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V9AU/MQXHsJyBQENsH8WUGeS2qrvCgOwwKyD4exAyaSx4phInJHSSxFP+o950OTuH
	 HoYUKaK2kVxQUTQHpjf/WBZ73xyFyyE2dVVEYAM/Y8tA1mDw7T39pnqkUo+PKoSYDu
	 C9ejCtOhQMZouXL2XIXFR9Z/DrXuC83FBtH6rlvJWgESHtC2Nc5mQFtj3VdagSx7xr
	 QUg4oUKPb/4my9aDCxiBk1pI0siG9/i8TYX37LX0VKXc1kycDQ9u2S9nFxqJq8r+J7
	 W+aManWpR+fDWf05X5LUyvQhzxDr4iV34S/2EDbPlFE7lOnK6J1flbu2OB+TX6jJ53
	 A2RRTK5jMFInQ==
Date: Mon, 22 Sep 2025 12:26:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as vPCI reviewer
In-Reply-To: <20250922183537.8861-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509221226370.2244509@ubuntu-linux-20-04-desktop>
References: <20250922183537.8861-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1574738169-1758569211=:2244509"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1574738169-1758569211=:2244509
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Sep 2025, Stewart Hildebrand wrote:
> I'd like to take a more active role in reviewing vPCI bits.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 31dbba54bb6f..793561f63f83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -578,6 +578,7 @@ F:	xen/include/*/vm_event.h
>  
>  VPCI
>  M:	Roger Pau Monné <roger.pau@citrix.com>
> +R:	Stewart Hildebrand <stewart.hildebrand@amd.com>
>  S:	Supported
>  F:	tools/tests/vpci/
>  F:	xen/drivers/vpci/
> 
> base-commit: 656b9ca03bd340715aecf405da63c515afb344a1
> -- 
> 2.51.0
> 
--8323329-1574738169-1758569211=:2244509--

