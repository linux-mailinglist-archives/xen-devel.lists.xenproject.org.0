Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43ECA99ADD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965536.1356073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hn6-0002J1-MR; Wed, 23 Apr 2025 21:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965536.1356073; Wed, 23 Apr 2025 21:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hn6-0002Hc-JT; Wed, 23 Apr 2025 21:38:00 +0000
Received: by outflank-mailman (input) for mailman id 965536;
 Wed, 23 Apr 2025 21:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Ler=XJ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7hn5-0002HR-9p
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:37:59 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38da036e-208b-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:37:57 +0200 (CEST)
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
X-Inumbo-ID: 38da036e-208b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745444276; x=1745703476;
	bh=VSnLlwfA6Iwz7C+5HgbOlS1Ie7U7FiKW3Vbjy5NknbY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=aLRsSevE1bbTTGMdJJc2/MF6JA3hVEjkXvsRLKvbHWxSpRPYCeCg2Y1CUyGPRNrBY
	 e14uimJD7ZLXHkuxByPbE+Qxd4HJwDdE7IJhjd1LNqO4lJ2oKqbJ7hNzpyQQSav6Gc
	 B7G0HwfLzJT6GPWdYnufHNbMT3hzv7qu2V4tP84/KBTD7IP4vvexBgofqwmyU7SF6b
	 578eKa7ertpW0EfqoVZdFEsXS+kcvFSFA9bxwXH06PqTrGJOlU7NQxFwIEbDVpVpRw
	 BR3T7tsj+gW7NsWet72U/sPeH05oV7E88ue2amImeChK53V8elIyRmzbgGGzmjQDyz
	 5T8lIg2mIrbQw==
Date: Wed, 23 Apr 2025 21:37:51 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 1/2] tools/xen-hptool: Add missing newlines
Message-ID: <aAldrBmY5ef5JJ2Q@kraken>
In-Reply-To: <20250423212821.42776-2-jason.andryuk@amd.com>
References: <20250423212821.42776-1-jason.andryuk@amd.com> <20250423212821.42776-2-jason.andryuk@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b6cb30b6d77acc918e6f5bbf06c42d8e25bb1b94
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 05:28:20PM -0400, Jason Andryuk wrote:
> Add some missing newlines to error messages.
>=20
> Fixes: 284d5633be37 ("Tools: add online/offline hotplug user interfaces")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
>  tools/misc/xen-hptool.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
> index 6d6aec8bad..d850404e31 100644
> --- a/tools/misc/xen-hptool.c
> +++ b/tools/misc/xen-hptool.c
> @@ -51,7 +51,7 @@ static int hp_mem_online_func(int argc, char *argv[])
>      ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
>=20
>      if (ret < 0)
> -        fprintf(stderr, "Onlining page mfn %lx failed, error %x", mfn, e=
rrno);
> +        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn,=
 errno);
>      else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
>          fprintf(stderr, "Onlining page mfn %lx is broken, "
>                          "Memory online failed\n", mfn);
> @@ -82,7 +82,7 @@ static int hp_mem_query_func(int argc, char *argv[])
>      ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
>=20
>      if (ret < 0)
> -        fprintf(stderr, "Querying page mfn %lx failed, error %x", mfn, e=
rrno);
> +        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn,=
 errno);
>      else
>      {
>  =09=09printf("Memory Status %x: [", status);
> --
> 2.49.0
>=20
>=20


