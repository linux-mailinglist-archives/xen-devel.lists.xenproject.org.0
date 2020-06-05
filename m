Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6E1EFF96
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 20:03:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhGg6-000715-ER; Fri, 05 Jun 2020 18:02:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgD6=7S=nerdbynature.de=lists@srs-us1.protection.inumbo.net>)
 id 1jhGg4-000710-As
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 18:02:48 +0000
X-Inumbo-ID: c2bb63b6-a756-11ea-ba62-bc764e2007e4
Received: from trent.utfs.org (unknown [2a03:3680:0:3::67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2bb63b6-a756-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 18:02:47 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id 050E75FE75;
 Fri,  5 Jun 2020 20:02:46 +0200 (CEST)
Date: Fri, 5 Jun 2020 11:02:45 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Subject: Re: 5.7.0 / BUG: kernel NULL pointer dereference / setup_cpu_watcher
In-Reply-To: <7e2dec0c-8e27-6454-7793-d1246262283d@suse.com>
Message-ID: <alpine.DEB.2.22.395.2006051059200.13291@trent.utfs.org>
References: <alpine.DEB.2.22.395.2006050059530.13291@trent.utfs.org>
 <7e2dec0c-8e27-6454-7793-d1246262283d@suse.com>
User-Agent: Alpine 2.22 (DEB 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 5 Jun 2020, Jürgen Groß wrote:
> Do you happen to start the guest with vcpus < maxvcpus?

Indeed, I was booting with vcpus=2, maxvcpus=4. Setting both to the same 
value made the domU boot.

> If yes there is already a patch pending for 5.8:
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/commit/?h=for-linus-5.8&id=c54b071c192dfe8061336f650ceaf358e6386e0b

Applied that manually and now the system boots even with vcpus < maxvcpus. 
So, if this still matters:
 
   Tested-by: Christian Kujau <lists@nerdbynature.de>

Thank you for your response, and the fix!

Christian.
-- 
BOFH excuse #146:

Communications satellite used by the military for star wars.

