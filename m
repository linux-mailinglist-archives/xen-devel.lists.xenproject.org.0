Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4249FFC9C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 18:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864348.1275548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOgw-000436-Jt; Thu, 02 Jan 2025 17:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864348.1275548; Thu, 02 Jan 2025 17:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOgw-00041B-GR; Thu, 02 Jan 2025 17:09:02 +0000
Received: by outflank-mailman (input) for mailman id 864348;
 Thu, 02 Jan 2025 17:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTOgv-000415-Oa
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 17:09:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4240655d-c92c-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 18:09:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0A885C61AB;
 Thu,  2 Jan 2025 17:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77676C4CED0;
 Thu,  2 Jan 2025 17:08:57 +0000 (UTC)
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
X-Inumbo-ID: 4240655d-c92c-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735837738;
	bh=swDL28UCiug+6IkstA4ntZ9DhdKTiK1toqspmjC/cTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UZZkcxP8XX2eJiFGZIggU23kwQkH9alXoTBctyeSvMi9O/HNUCdQz2efhLX0Buap7
	 oIFjCHlQC5J44ovB09OeZqDx7UJDRtFnk5dB++7XOLP0efYbKkr6XngeF4irMnOch2
	 SsmZNmJuXgzpfwDmhq5c/e8sZ+m0MZA5jn4xr6g76MrbasLANrmG7JR1yxGkZXghYH
	 /tRa4jNUgEgx+bi29I9VjelBRW1AU/dkDfWnmbOUFukrKPbze+OypxBR0f6GtuzrjR
	 rqqARi8E8AGlEKOfeldq/35U2QjeVuQcOfa7e/Pw4v7KXweRkQ8DojHHU5fc/Fl0fR
	 F0gasGI6KMuww==
Date: Thu, 2 Jan 2025 09:08:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/1] xen/common: Remove dead code
In-Reply-To: <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr>
Message-ID: <alpine.DEB.2.22.394.2501020908160.16425@ubuntu-linux-20-04-desktop>
References: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr> <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-65381810-1735837738=:16425"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-65381810-1735837738=:16425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Dec 2024, Ariel Otilibili wrote:
> The if-statement tests `res` is non-zero; meaning the case zero is never reached.
> 
> Coverity-ID: 1055253
> Fixes: e2b1ebf4de ("x86: Support booting a bzImage format domain 0 kernel.")
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/common/gzip/inflate.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index b9a2d7a23a..cb146555c8 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -1164,8 +1164,6 @@ static int __init gunzip(struct gunzip_state *s)
>      if ( (res = inflate(s)) )
>      {
>          switch (res) {
> -        case 0:
> -            break;
>          case 1:
>              error("invalid compressed format (err=1)");
>              break;
> -- 
> 2.47.1
> 
--8323329-65381810-1735837738=:16425--

