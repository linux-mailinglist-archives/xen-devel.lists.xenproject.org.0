Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A3DA99ADB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965542.1356083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hnS-0002kR-UR; Wed, 23 Apr 2025 21:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965542.1356083; Wed, 23 Apr 2025 21:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hnS-0002it-Qy; Wed, 23 Apr 2025 21:38:22 +0000
Received: by outflank-mailman (input) for mailman id 965542;
 Wed, 23 Apr 2025 21:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Ler=XJ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7hnS-0002HR-6R
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:38:22 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4704cbe9-208b-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:38:21 +0200 (CEST)
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
X-Inumbo-ID: 4704cbe9-208b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745444300; x=1745703500;
	bh=mwR+hwtU4vbInIUOB+ru860NLxEHm5yqGgzzCU0ICE8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QahF8ZFrpA5GwAj5cZYODL1Ukb3p1FVf2G+58TgiqCQFlwNOdsnaYFCbhxl4JSqNA
	 OKLyaNycy05yzA7uPrs4u3Nah2jAernRjROucFWs+/mf6epOT6OEPGR/g5KDhnPDYO
	 1ixWzb7gA/3ytGQlVh4CtcsqRUTQYwKvLtf8KcZKl0Uip0PO2Zri6oHgVbazOc59rC
	 cytpJuzLG85Xy7UQw6s0U8j0zdy2fQrI+og58pE1J466Tg9YdB4REu5ZYXt7kwGY8Y
	 ysW3FO+zp1/96Zi1w6QLHLH8FCaFoSZMDnG0IQ+HmGKqaXvMkruuaC1i0eKJV95syj
	 rO5AOSvmE0Jrg==
Date: Wed, 23 Apr 2025 21:38:16 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] tools/xen-hptool: Replace hard tabs
Message-ID: <aAldxUIrieS25eoM@kraken>
In-Reply-To: <20250423212821.42776-3-jason.andryuk@amd.com>
References: <20250423212821.42776-1-jason.andryuk@amd.com> <20250423212821.42776-3-jason.andryuk@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7c2ec109c952c73b201dc92929eb137db8eaf5a2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 05:28:21PM -0400, Jason Andryuk wrote:
> With a tab stop of 8, the alignment is off.  Replace the hard tabs with
> spaces to match the file.
>=20
> Fixes: 284d5633be37 ("Tools: add online/offline hotplug user interfaces")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
>  tools/misc/xen-hptool.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
> index d850404e31..590810b6eb 100644
> --- a/tools/misc/xen-hptool.c
> +++ b/tools/misc/xen-hptool.c
> @@ -56,7 +56,7 @@ static int hp_mem_online_func(int argc, char *argv[])
>          fprintf(stderr, "Onlining page mfn %lx is broken, "
>                          "Memory online failed\n", mfn);
>          ret =3D -1;
> -=09}
> +    }
>      else if (status & PG_ONLINE_ONLINED)
>          printf("Memory mfn %lx onlined successfully\n", mfn);
>      else
> @@ -85,14 +85,14 @@ static int hp_mem_query_func(int argc, char *argv[])
>          fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn,=
 errno);
>      else
>      {
> -=09=09printf("Memory Status %x: [", status);
> +        printf("Memory Status %x: [", status);
>          if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
>              printf(" PAGE_OFFLINE_PENDING ");
>          if ( status & PG_OFFLINE_STATUS_BROKEN )
>              printf(" PAGE_BROKEND  ");
>          if ( status & PG_OFFLINE_STATUS_OFFLINED )
>              printf(" PAGE_OFFLINED ");
> -=09=09else
> +        else
>              printf(" PAGE_ONLINED ");
>          printf("]\n");
>      }
> --
> 2.49.0
>=20
>=20


