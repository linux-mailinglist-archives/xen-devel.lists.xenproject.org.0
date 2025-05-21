Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC18ABE879
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 02:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991326.1375208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHX2c-0005Ze-3N; Wed, 21 May 2025 00:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991326.1375208; Wed, 21 May 2025 00:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHX2b-0005Ws-W9; Wed, 21 May 2025 00:10:37 +0000
Received: by outflank-mailman (input) for mailman id 991326;
 Wed, 21 May 2025 00:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHX2a-0005Wm-P1
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 00:10:36 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03edc5f7-35d8-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 02:10:34 +0200 (CEST)
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
X-Inumbo-ID: 03edc5f7-35d8-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747786233; x=1748045433;
	bh=ZdzoAR0r2d1QCrjvC7H8Dzdphpg/hImZBTr3IbkxKRI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AZHLFsKxjm1g3dMkvSFD41woWtBfJaIYwa0SlczIgGKbtncJyPhWQZDNddoAP2OnH
	 UaVQXGDm91X35bDJl5b2L0csv7fGE1aJ974P0JR469/5A1+rIK1Hj7ZR1lhnrl/AYW
	 2jnc2xrL9Svd6er7/9VTgp75Bx7/kDOKU8HGXr6bMem6jRSPSebsSn+pfDOT6Jm0Xy
	 jJklzwbLCgQajASiW84Twosui/1o9ZnPHu/a/LdWbyRNXsII+KzpDKucDg4/oFTW+7
	 jk+lve6Dj7zPgHm3mB3NgdWqOxZGvMbIPVjf0SrkORn98m3EV9mH6hHqDYDTvhESIo
	 rKIgyWlbCrlrw==
Date: Wed, 21 May 2025 00:10:28 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] CI: Improvements to *-tools-test-* jobs
Message-ID: <aC0Z8fVuBXyfiRYa@kraken>
In-Reply-To: <20250520205239.203253-1-andrew.cooper3@citrix.com>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: fe9eb75b489afd68bd5fe6eb732e773ef895fe48
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 09:52:36PM +0100, Andrew Cooper wrote:
> Rearrange tools/tests to be more ameanable to running in CI, and drop the
> special casing holding it together.
>=20
>=20
>=20
> Andrew Cooper (3):
>   tools/tests: Drop depriv-fd-checker
>   tools/tests: Install tests into $(LIBEXEC)/tests
>   CI: Drop custom handling of tools/tests

The code changes look good to me

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

for the series.

>=20
>  .gitignore                             |   1 -
>  automation/scripts/build               |   1 -
>  automation/scripts/qubes-x86-64.sh     |   7 +-
>  automation/scripts/run-tools-tests     |  43 ++-
>  tools/tests/Makefile                   |   1 -
>  tools/tests/cpu-policy/Makefile        |   6 +-
>  tools/tests/depriv/Makefile            |  52 ---
>  tools/tests/depriv/depriv-fd-checker.c | 436 -------------------------
>  tools/tests/paging-mempool/Makefile    |   6 +-
>  tools/tests/rangeset/Makefile          |   6 +-
>  tools/tests/resource/Makefile          |   6 +-
>  tools/tests/tsx/Makefile               |   6 +-
>  tools/tests/xenstore/Makefile          |   6 +-
>  13 files changed, 40 insertions(+), 537 deletions(-)
>  delete mode 100644 tools/tests/depriv/Makefile
>  delete mode 100644 tools/tests/depriv/depriv-fd-checker.c
>=20
> --
> 2.39.5
>=20
>=20


