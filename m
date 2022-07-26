Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED605808D9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 02:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374902.607096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG8sG-0003m5-BU; Tue, 26 Jul 2022 00:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374902.607096; Tue, 26 Jul 2022 00:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG8sG-0003ja-7b; Tue, 26 Jul 2022 00:56:36 +0000
Received: by outflank-mailman (input) for mailman id 374902;
 Tue, 26 Jul 2022 00:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xban=X7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oG8sD-0003jT-V5
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 00:56:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca1f65cc-0c7d-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 02:56:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A44B60FDB;
 Tue, 26 Jul 2022 00:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A90C341C6;
 Tue, 26 Jul 2022 00:56:30 +0000 (UTC)
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
X-Inumbo-ID: ca1f65cc-0c7d-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658796990;
	bh=LeEZV5faHLvTsF6TwF/tRHiJ0/fhg4SX7hZy7ZfmmS4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sJRqRmXdQKrMnd/MjJDF823s18IVkX/2z3wOfy6OMECvyuHaaF6Oj5CnAxeha3W4n
	 BKP2joM1HnswQ95yNilPitIbw3P6cys9bKDZpMy5cDC6ZIOzpnHgKZnVE1LZ5hAZlx
	 htYS2bdGGlYLc183/hMA3yy5u1wu1cNBdahOSaBCnO3rQ0jYvMmIXj8q+9AKKvfcDl
	 sZHLNG+ZQkGzJze1WBL/V0BF8wNJxoV/Zmnj/bYEZHPBmcRwFzPHJ6sT1zlM5il5/7
	 LfYDUz9r5RtqosnnhEDsVa0L8dm6TIqXnKBf8uozrYLoUeDNPVch6eDGZPb/qs4Hjd
	 XCOIqFnxAZgyg==
Date: Mon, 25 Jul 2022 17:56:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Licensing issues
In-Reply-To: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2207251750310.4648@ubuntu-linux-20-04-desktop>
References: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1675117545-1658796990=:4648"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1675117545-1658796990=:4648
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 22 Jul 2022, Andrew Cooper wrote:
> I'm also intending to start using SDPX identifiers to save on all the
> boilerplate.  They're already used elsewhere.

I just wanted to add that adding/using SPDX is important and came up
quite a few times in Linux Foundation discussions recently [1]. Linux
and Zephyr already support it. As a community, I think we should move
toward it reasonably quickly.

[1] https://elisa.tech/blog/2022/06/29/elisas-new-systems-working-group/?utm_campaign=ELISA%20Project%20Blog&utm_content=213223762&utm_medium=social&utm_source=linkedin&hss_channel=lcp-35579852
--8323329-1675117545-1658796990=:4648--

