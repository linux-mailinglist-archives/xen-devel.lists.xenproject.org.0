Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D3A66357
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 01:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918311.1323011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKTd-0004Wf-LG; Tue, 18 Mar 2025 00:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918311.1323011; Tue, 18 Mar 2025 00:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKTd-0004US-I5; Tue, 18 Mar 2025 00:06:37 +0000
Received: by outflank-mailman (input) for mailman id 918311;
 Tue, 18 Mar 2025 00:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKTc-0004UM-Mk
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 00:06:36 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d561cae0-038c-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 01:06:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6598A48E30;
 Tue, 18 Mar 2025 00:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F608C4CEE3;
 Tue, 18 Mar 2025 00:06:24 +0000 (UTC)
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
X-Inumbo-ID: d561cae0-038c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742256385;
	bh=Ss4p9k+hIsXzdpN0XdiI+1tMdzmFb4MLsBgNAMuryvQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Tku3bERldeFRpVTgfE/FYpdYfewdf9cj8Nraldoq+xixM99xSGokkTS1MmrbsO5t7
	 yP2/cp/GBA1aux/6UgKB+mZIg0gy8cql8NrNrgR7OOZHDsezQsDYjiNyI2UObyloV8
	 fmWlzIhBLFzGGgAQw/u1XURI1nORzVpuwVimfa82ax/hb9CjWBBzgOWmkp2c62D3eo
	 I09qCRYN4y01k1SAdYwtMeabfjTDq6oY4ecIAv7DLsCM3xjcC9namBEu7/QJ2dPQI4
	 x5CmGSZPTK3N+kTuXOLxi/DzXIOo4txzgx+X4kSQJYmgQe3oHUdpJsYpdyLylINk9y
	 sF9XjoILbaA5A==
Date: Mon, 17 Mar 2025 17:06:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/8] automation/cirrus-ci: use matrix keyword to generate
 per-version build tasks
In-Reply-To: <20250317121616.40687-5-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503171704220.3477110@ubuntu-linux-20-04-desktop>
References: <20250317121616.40687-1-roger.pau@citrix.com> <20250317121616.40687-5-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1240015680-1742256385=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1240015680-1742256385=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> Move the current logic to use the matrix keyword to generate a task for
> each version of FreeBSD we want to build Xen on.  The matrix keyword
> however cannot be used in YAML aliases, so it needs to be explicitly used
> inside of each task, which creates a bit of duplication.  At least abstract
> the FreeBSD minor version numbers to avoid repetition of image names.
> 
> Note that the full build uses matrix over an env variable instead of using
> it directly in image_family.  This is so that the alias can also be set
> based on the FreeBSD version, in preparation for adding further tasks that
> will depend on the full build having finished.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I could alternatively name FREEBSD_15 FREEBSD_CURRENT or FREEBSD_HEAD or
> something versionless, however I don't know about the other versions.
> 
> Assuming there will only be 3 versions tested at all times I could use:
> FREEBSD_HEAD, FREEBSD_PRODUCTION and FREEBSD_LEGACY, as to avoid having to
> specify versions in the task definitions.

I think it is OK but I'll leave it to others to comment as well

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-1240015680-1742256385=:3477110--

