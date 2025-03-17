Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E7A662F3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918237.1322971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKEO-0007ZQ-3w; Mon, 17 Mar 2025 23:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918237.1322971; Mon, 17 Mar 2025 23:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKEO-0007Y7-04; Mon, 17 Mar 2025 23:50:52 +0000
Received: by outflank-mailman (input) for mailman id 918237;
 Mon, 17 Mar 2025 23:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKEM-0007VL-Ne
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:50:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a654995e-038a-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 00:50:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B20005C5419;
 Mon, 17 Mar 2025 23:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F2CC4CEE3;
 Mon, 17 Mar 2025 23:50:46 +0000 (UTC)
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
X-Inumbo-ID: a654995e-038a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742255447;
	bh=zWUDTICe70W3fRvGWberd8WHdQ38WtKznBuujA8Pmu4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mdNnZ59sgtX68f8SjCCUZUwjoDjJH/oB6euiBYWhZbHL4ZwhCCKqeukNAdaKQllRi
	 Yp81zImSAWrljjufwt6QJS6RB/PlD/BZdrQVy9mdviTOVwHnd+83qsbom2GOEU5G2a
	 RLQDIFmYfnECeeGoEDoGqcMnr5eWOOA0X1gGmXqZXAX+d4mOUoTe3Sth12m7OPylXM
	 tJ8oDlcjQoXyC3ZnQ86/C31ilVsb/QVQc785KgVHS5+SlXywmATUNybQ4Wvq19DCY7
	 mFODXYlYUQXt0OfhslbA4RhbHl4onRIi+R4guAGQI+Kyxk7MRr9EywcmDWsh57mybU
	 yd2qXonWRVTgA==
Date: Mon, 17 Mar 2025 16:50:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/8] automation/cirrus-ci: store Xen Kconfig before doing
 a build
In-Reply-To: <20250317121616.40687-4-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503171649030.3477110@ubuntu-linux-20-04-desktop>
References: <20250317121616.40687-1-roger.pau@citrix.com> <20250317121616.40687-4-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-767909274-1742255447=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-767909274-1742255447=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> In case the build fails or gets stuck, store the Kconfig file ahead of
> starting the build.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-767909274-1742255447=:3477110--

