Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7EA662F4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918236.1322960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKEK-0007Hx-SR; Mon, 17 Mar 2025 23:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918236.1322960; Mon, 17 Mar 2025 23:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKEK-0007GV-Pk; Mon, 17 Mar 2025 23:50:48 +0000
Received: by outflank-mailman (input) for mailman id 918236;
 Mon, 17 Mar 2025 23:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKCW-0004j7-To
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:48:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b8097cc-038a-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 00:48:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 36BC35C05A4;
 Mon, 17 Mar 2025 23:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77956C4CEE9;
 Mon, 17 Mar 2025 23:48:40 +0000 (UTC)
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
X-Inumbo-ID: 5b8097cc-038a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742255321;
	bh=N8lMHLh4I6dE/jaMrleqckyzjze/Y/o+wsr06kozJw0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I9BgVT0ja77Odi5G8lFfXO1j8lX0XXCe6+LODgreu+qD37lsPyeY5kIi2q8GBTcRn
	 hlQItzRDUOE5isv8ZTA98or6i9uqaAmvzFJflCgdFPZXZExClolX33GjUX/JFrP7fR
	 udqsBp+WjFj35eH//Sqi3OIslA6Y+wXVLlzBKm4I+xNQjCh0nigSQ4/1fbh8Z18ukt
	 XyrSlvo/fgWTgCTG0RgrBvkHXU2JU2NVTzflvgv9RzZ3acSobDlb4FP1fUDF3Y1NYa
	 iJw3/rm8rMxyIcoMHjw5SJOCjigScwfdcNlsV2QLvgxs9MddZmRQDIKUAQqzJBxt9R
	 pDvqOaXfp4Tow==
Date: Mon, 17 Mar 2025 16:48:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/8] automation/cirrus-ci: update FreeBSD to 13.5
In-Reply-To: <20250317121616.40687-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503171648340.3477110@ubuntu-linux-20-04-desktop>
References: <20250317121616.40687-1-roger.pau@citrix.com> <20250317121616.40687-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1946558123-1742255322=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1946558123-1742255322=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  .cirrus.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index aa195ba370ac..ce7588b7b6b1 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,7 +1,7 @@
>  # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
>  freebsd_13: &FREEBSD_13
>    freebsd_instance:
> -    image_family: freebsd-13-4
> +    image_family: freebsd-13-5
>  freebsd_14: &FREEBSD_14
>    freebsd_instance:
>      image_family: freebsd-14-2
> -- 
> 2.48.1
> 
--8323329-1946558123-1742255322=:3477110--

