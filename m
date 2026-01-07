Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E1CFF86E
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 19:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197145.1514779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdYW0-0001TR-Bf; Wed, 07 Jan 2026 18:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197145.1514779; Wed, 07 Jan 2026 18:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdYW0-0001Qz-94; Wed, 07 Jan 2026 18:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1197145;
 Wed, 07 Jan 2026 18:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSrZ=7M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vdYVy-0001QV-MA
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 18:44:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc1fe8be-ebf8-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 19:44:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBFD140B7B;
 Wed,  7 Jan 2026 18:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86E3C4CEF1;
 Wed,  7 Jan 2026 18:44:10 +0000 (UTC)
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
X-Inumbo-ID: dc1fe8be-ebf8-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811451;
	bh=IH21crszxnBTVgvTDCeHc7bX7rRWsx2nNWiLJPSphcQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MdCtA3FNShuf31iQMbrSF5g/ull+tA/DE1jdmZ9hC661ftP22oqKVchaJFEpJ0mMo
	 KowB9X/s8xwE3BGfVMbC9jVoKRTW5/uPBifyunGAvBicAT71mCnUStODkPis6TJQtN
	 x6flnBavDFX1fGFFmabCHJovgpKfavttORyphhoOmLAUlUO9JRSTGdWjUc3hg21PTe
	 It8evnTU6S1XP0A5XVVMfsMis1nN4Izi5fCjrhcUKrYRnNPWPN+7b3O1kl9G+rlSJI
	 QAbkWnxF+BhVhkwtJmgMw8BlaDN3MVgd0ueL+UWmNQUiFD4PWXohyPZRmj8+ba8YkV
	 XdkFwltTD0wrA==
Date: Wed, 7 Jan 2026 10:44:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] cirrus-ci: introduce FreeBSD 15.0-RELEASE as "current"
 version
In-Reply-To: <d2cff32b-0170-4afc-8033-b7bd7ca20eb7@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2601071043550.286060@ubuntu-linux-20-04-desktop>
References: <20260107173509.56155-1-roger.pau@citrix.com> <d2cff32b-0170-4afc-8033-b7bd7ca20eb7@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1837582523-1767811451=:286060"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1837582523-1767811451=:286060
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Jan 2026, Andrew Cooper wrote:
> On 07/01/2026 5:35 pm, Roger Pau Monne wrote:
> > Switch the current version to 15.0-RELEASE.  Sadly the 16 snapshot images
> > are not working, hence use the FREEBSD_CURRENT variable as a placeholder
> > for 15.0 until the issues with FreeBSD 16.0 snapshot images is solved.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1837582523-1767811451=:286060--

