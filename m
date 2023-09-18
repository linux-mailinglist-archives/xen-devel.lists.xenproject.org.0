Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631AA7A552F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 23:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604247.941494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiM05-0007AI-8b; Mon, 18 Sep 2023 21:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604247.941494; Mon, 18 Sep 2023 21:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiM05-00077f-5H; Mon, 18 Sep 2023 21:41:49 +0000
Received: by outflank-mailman (input) for mailman id 604247;
 Mon, 18 Sep 2023 21:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTdg=FC=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1qiM02-00076b-CK
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 21:41:47 +0000
Received: from gandalf.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 263b017f-566c-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 23:41:43 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RqJCN1dznz4wd0;
 Tue, 19 Sep 2023 07:41:36 +1000 (AEST)
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
X-Inumbo-ID: 263b017f-566c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1695073296;
	bh=Vb4eL9CHfhRBJsfJ0QsA45UJHbqU+38DlbUmYxZcS5Q=;
	h=Date:From:To:Cc:Subject:From;
	b=salWIiGxClYMhB8OJT8bjACqDFCVOL8DX6OpgycRUWdkNdnuyouIHGg9V1rOEqLdA
	 lB3Pkfd/pKTEriamMfKah8I2SvP0jCeHKPAcJ+Wk84Ez9/9tBimh10qf38FNqienPo
	 kVXS6uR7LRze4UN72z8vU/z3+u/A7UGooBJqVUKJfmZKYf85jajrpO9Ug9R3ksByRH
	 tfccSwmEEe2IN210tHsKVDFScaVEQm2psATwDAoqOvnEzAufbEhty/gvZ3U4En6EL6
	 i49BqqrUW6pIo+ppvxUWt9wQAk1cijwhr2KsOlBnHImgnHxEpSo0WOzwQO5Erz0vdp
	 VVLJPsOkjr2jQ==
Date: Tue, 19 Sep 2023 07:41:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the xen-tip tree
Message-ID: <20230919074135.3e9b06b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+kF1L/j/yNt5jxoz.jnIOrC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+kF1L/j/yNt5jxoz.jnIOrC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  603392995417 ("x86/paravirt: Fix tlb_remove_table function callback proto=
type warning")

This is commit

  fcce1c6cb156 ("x86/paravirt: Fix tlb_remove_table function callback proto=
type warning")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+kF1L/j/yNt5jxoz.jnIOrC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUIxA8ACgkQAVBC80lX
0GympAgAm1mO57c/f5RDekcV0a/MNqPpNNpvhkHZqMAezFHrKmY0STuctRsiqv03
Jd55r/qxXVrpmBPC37dawEn+bF9nJb+KgF/K9pVFFwu7AXqjYUEgbMyGu5Ahe3c5
pksjE9fVVfLIzHqj1EhQOwUngZcKUoVBEoaFzifmbj4yyrYWZOuksAtNKWqgpiTc
F4LYqL8TjPHI4qifm8wxCZCmQZ0FlmpJAOJYC+StZmjLG6WVoMU0PVg6x14zODfk
e6KnNC7f25z2JniTiDlziDpaFgnNqbh1dHdBpitZ2HvqoAscQVQaA/SPZzGQvTfh
MqyoXR3BgGQmUXWipC6tdOGHh0RxDg==
=eOiP
-----END PGP SIGNATURE-----

--Sig_/+kF1L/j/yNt5jxoz.jnIOrC--

