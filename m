Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59A314F51
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 13:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83217.154285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SMF-0006Wi-OS; Tue, 09 Feb 2021 12:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83217.154285; Tue, 09 Feb 2021 12:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SMF-0006WJ-L0; Tue, 09 Feb 2021 12:43:07 +0000
Received: by outflank-mailman (input) for mailman id 83217;
 Tue, 09 Feb 2021 12:43:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9SMD-0006WE-Ua
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 12:43:06 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c223e0d-f572-4785-a7b9-dc15ac0baa76;
 Tue, 09 Feb 2021 12:43:04 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id m08c6fx19Ch01Ka
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 13:43:00 +0100 (CET)
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
X-Inumbo-ID: 7c223e0d-f572-4785-a7b9-dc15ac0baa76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612874583;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=kt+HjqYDFzVkKWwKnvvp0Lqb/b/anGw/0WXWlcWl1Nw=;
	b=fOt6XlMQPxDnB5YCI3UStL7Gri8AEyhnnet2/vvDeF6FexLQiVAlc8FExapSxHZwK9
	y68O28oy2sG/3vm/CodLtLKIBgvRdD0TvpIALzQ4AgO9AO0T14ccfbb2zO4qDBRuwQOj
	pOBpOdj8Scpf0QUB4nI546ct8EkfW85Df9jdQ19RO64Yoc5LrSSLljxoRenFofNmk1zW
	xW/oacjEPCqmm705U2KFsEV4WTVfNpNTKlTTPUL/VB22fcdLEzIxKxwO/nq9ZQwT8CHC
	WQD9MoxvXYDmiQjWNLsFlHCONVrZms0HxvgYxZkQ3XZUNIqy+dxfvMkJEPTLdSYY9zzw
	PEuw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Tue, 9 Feb 2021 13:42:53 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 08/39] xl: fix description of migrate --debug
Message-ID: <20210209134253.5eb68cbe.olaf@aepfle.de>
In-Reply-To: <6debd4a3-2d12-2b9f-c857-11dc2346d750@citrix.com>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-9-olaf@aepfle.de>
	<24609.26131.733756.369535@mariner.uk.xensource.com>
	<6debd4a3-2d12-2b9f-c857-11dc2346d750@citrix.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/z0idfK3Yl/YitIqovWtHLcR"; protocol="application/pgp-signature"

--Sig_/z0idfK3Yl/YitIqovWtHLcR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Feb 2021 16:39:01 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> It is possibly worth noting that you typically do see changed data when
> using --debug, because of how the front/back pairs work.=C2=A0 This was a=
 bit
> of a curveball during development.

I just noticed "migrate --debug" is a noop, "verify" works just for remus o=
r colo, per send_domain_memory_live():
- libxl_domain_remus_start sets checkpointed_stream to COLO/REMUS
- libxl_domain_suspend sets checkpointed_stream to NONE.
- external callers can not influence this internal state.
- main_migrate_receive sets it based on the command line option.


In case we want a "verify" functionality also for migration, the "stream_ty=
pe" check could be removed to make it work everywhere.
The domU is suspended, it should not make much difference how often its mem=
ory is passed around in this suspended state.
But this would be a separate thing to explore.

Having a "LIBXL_SUSPEND_DEBUG/XCFLAGS_DEBUG" might be useful, but in its cu=
rrent state the flags should have "STREAM_VERIFY" in their name.

So instead of changing the help string I suggest to remove "--debug" altoge=
ther from the xl UI.


Olaf

--Sig_/z0idfK3Yl/YitIqovWtHLcR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAig00ACgkQ86SN7mm1
DoCgKA/+MDD1AFX0KRPpNeqwPTflao9EzaHMAMGvpH/BvC2XnnVkLuoa4LTTxSHY
8i1UTMl80zyxfNNHGcaKVm5JwHujIt8j7Cd1zdJIyrsC0GOP54CHUfhgElDNQJAz
5jDV6QnsmSKT5JwdCZd0CC2rKL63OxSrd5D/sbEthcP8fUUsascgSLQmHSJ6SYAC
vMIdjAn7mSg4nBjXbnkRY7KoWpycSN/1BCbz1wktxmakOMLlYEf4QDJlx/gFoIug
314hdR+tBR7kz4CO4cRzOOPnG+0O0EG03Ic90KD5mLyiVEPh0vqdFjMpUMiINLTo
jIeZMb5zN9q3ZMrpOPwZG0cB9Fsh+kbyxhtO3t7b93IxjdKTjaWdzINpxIxHSTMg
r8emrGTB3L2VoCgvhG/CSWnT1lyYv4wp9nFnQdHsBLtOYUpDKmt/F/5ti3cXLGVB
cAxYBvWq06KnXs2P5nmECs8zZmj4p5R4U3I8yghrlbOFJZONZFgKyEeFTGU+g4Zr
7H/x5MC09yTAEh7eyFLwkO26XYbKmt0e7FLvstFv8q206v8cGwlEpLrfhhdac8Ro
wtxFBlmHADbvhS6mFO30wLvJZTUKlqwdb3G1ea5DqUP9q+1bxBH2v4LoTjY44+01
9QW2FAFnxi32ZYqqK71vMo0vWsc2YXGqnXPLFgngqarN8uPghvA=
=KR7j
-----END PGP SIGNATURE-----

--Sig_/z0idfK3Yl/YitIqovWtHLcR--

