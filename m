Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE594CB1766
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182316.1505208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7ff-0000RV-Fi; Wed, 10 Dec 2025 00:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182316.1505208; Wed, 10 Dec 2025 00:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7ff-0000OE-CU; Wed, 10 Dec 2025 00:03:07 +0000
Received: by outflank-mailman (input) for mailman id 1182316;
 Wed, 10 Dec 2025 00:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT7fe-0008Im-8j
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:03:06 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c565ac-d55b-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:03:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D517A60129;
 Wed, 10 Dec 2025 00:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F15C113D0;
 Wed, 10 Dec 2025 00:03:02 +0000 (UTC)
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
X-Inumbo-ID: 99c565ac-d55b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765324983;
	bh=aehMpTm0bqB9OYtczh85Mvt61CtqIiBN8VtAIPT4+e4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dW4UCLnW6TljVKoVzLctZLx66eJDZCvt8hadHKA9QYeM0CLorfSHDeY0cqPCYcAh+
	 2DdsCN/o/E2BlMiUKXHcsFcTb739wIAtqRORDYlBxQZA6KF+k6glamUGCA+OdE7t04
	 fCo+oL8TVdfij9KQuh8LRDxg1dG457jrYK59yVM4J8e1fv8gJCGKk/Vy3DeOpBlmTr
	 RimqQKBD2Nnxp2f6cWT64IZFLTTWQNMt6AvfbIhDZT+mqr7/nGryzj5N3UvY9kegi1
	 tEtQy6jcMgsOl3fy0AOsTbds+z2BF/hqt3GpRH50Mh9ibJHS9/ZfjPM6n0IcLrke9/
	 7J0FQLTcT8MOw==
Date: Tue, 9 Dec 2025 16:03:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 5/6] CI: Add configure --enable-systemd for full
 build
In-Reply-To: <1363a4377800fb2cbe8dbbbbc2b08d2af968a47e.1764989098.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091602510.19429@ubuntu-linux-20-04-desktop>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com> <1363a4377800fb2cbe8dbbbbc2b08d2af968a47e.1764989098.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-905369331-1765324977=:19429"
Content-ID: <alpine.DEB.2.22.394.2512091603010.19429@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-905369331-1765324977=:19429
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2512091603011.19429@ubuntu-linux-20-04-desktop>

On Sat, 6 Dec 2025, Marek Marczykowski-Górecki wrote:
> This doesn't exclude sysvinit scripts, but allows testing systemd too.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> --
> Changes in v4:
> - drop systemd-dev, add --enable-systemd always
> Changes in v3:
> - switch to trixie
> 
> New in v2.
> ---
>  automation/scripts/build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 7a81d229decd..9485f37c7020 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -71,6 +71,7 @@ else
>      # Full build.  Figure out our ./configure options
>      cfgargs=("--prefix=/usr")
>      cfgargs+=("--enable-docs")
> +    cfgargs+=("--enable-systemd")
>  
>      # booleans for which compiler is in use
>      cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
> -- 
> git-series 0.9.1
> 
--8323329-905369331-1765324977=:19429--

