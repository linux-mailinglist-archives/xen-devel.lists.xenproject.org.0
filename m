Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76196ED960
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 02:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525682.817011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6iM-0007kB-VD; Tue, 25 Apr 2023 00:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525682.817011; Tue, 25 Apr 2023 00:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6iM-0007i6-Rm; Tue, 25 Apr 2023 00:39:26 +0000
Received: by outflank-mailman (input) for mailman id 525682;
 Tue, 25 Apr 2023 00:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr6iL-0007i0-2q
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 00:39:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f60f5be-e301-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 02:39:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED13662A75;
 Tue, 25 Apr 2023 00:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C037FC433EF;
 Tue, 25 Apr 2023 00:39:20 +0000 (UTC)
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
X-Inumbo-ID: 9f60f5be-e301-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682383161;
	bh=W1UJTAecGf24uflNB+IwAZn61OUMilNv7ksRzV5lFeY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ldGJZQSfXT8GGfCQFFf+UpZzWtZ9t/49HjlGnS/JW5/TGGkfJWYiQ2ovXbHeUded0
	 /GNPQD2FqfbJ/MzEtx4ftXjiGQ1B+ueEc5Ph4tbssHtETCIZv3BvII1M7W19vGTkJF
	 9/mucdXa03YqiIQ26bPR/spqEa/D2fjsFUlc/3Jj+7IC88Lh2VOMk9IC4PVBn+PoAE
	 HCRjGgPdVKbATPSD6DFpx66KBXqhJajQopXoMBADvbwT2O6PJ+yCdArjmu9PD27IgP
	 lMP9XZyieUhyC/EWA3hxoS/h1eeeM+fzVXylJadloiAX8v03JCjQbArir19stF9NaC
	 V2S51WiPCN1ug==
Date: Mon, 24 Apr 2023 17:39:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] automation: include tail of serial log in the gitlab
 outout
In-Reply-To: <a3d33c869b7fcf4f72047daa4dcbcf4ff97143c3.1682369736.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304241718120.3419@ubuntu-linux-20-04-desktop>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com> <a3d33c869b7fcf4f72047daa4dcbcf4ff97143c3.1682369736.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1805575572-1682382124=:3419"
Content-ID: <alpine.DEB.2.22.394.2304241730230.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1805575572-1682382124=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304241730231.3419@ubuntu-linux-20-04-desktop>

On Mon, 24 Apr 2023, Marek Marczykowski-Górecki wrote:
> Make it a bit easier to see what has failed.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/scripts/qubes-x86-64.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 6442f7dda515..9b89d90f653c 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -228,5 +228,6 @@ fi
>  
>  sleep 1
>  
> +tail -n 100 smoke.serial
>  (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
>  exit 0

Isn't smoke.serial already in stdout and also part of the artifacts? The
user can always click on the full output or on the smoke.serial file
among artifacts.  Maybe the issue is that it is called ".serial" instead
of ".txt" so the browser will not try to open it directly in a browser
window. If we rename it to ".txt" the user could just click on
"artifacts" and then on "serial.txt" and it would be all there.

100 lines is not much, but I think in general it is better if we make it
easier to access smoke.serial in its entirety instead.
--8323329-1805575572-1682382124=:3419--

