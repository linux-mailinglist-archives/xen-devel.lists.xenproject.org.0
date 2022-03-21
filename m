Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079F4E244D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 11:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292898.497429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFFe-0000wh-PK; Mon, 21 Mar 2022 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292898.497429; Mon, 21 Mar 2022 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFFe-0000u4-Lu; Mon, 21 Mar 2022 10:27:02 +0000
Received: by outflank-mailman (input) for mailman id 292898;
 Mon, 21 Mar 2022 10:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hCO=UA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWFFc-0000tn-SW
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 10:27:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70fb4aeb-a901-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 11:26:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 80D6A1F385;
 Mon, 21 Mar 2022 10:26:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3080013AD5;
 Mon, 21 Mar 2022 10:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T8HoCfNSOGIuegAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Mar 2022 10:26:59 +0000
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
X-Inumbo-ID: 70fb4aeb-a901-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647858419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2mtkALxVHViPF31UbfaqQerGr40TgNnHKOVHFVrOOw=;
	b=AOwffkojH/O2e3D8l4Ml/Y+GkM9ZRfwEmLWzJnupq3KTm7wMIoWlUifzCsIGiLozLRXg9i
	n0jQpN8lSwtcc2lL7IlDhSqGcV86n+ipQum6fMpTXj5IFXl4om5LwQoTSDCarq8LnB5Y9g
	vx6n0EmFHajqGAeBTtUdvOyAZVDC59I=
Message-ID: <9143f2f8-9f96-66f4-0020-64918481606c@suse.com>
Date: Mon, 21 Mar 2022 11:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/1] xen/blkfront: fix comment for need_copy
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, axboe@kernel.dk,
 linux-kernel@vger.kernel.org
References: <20220317220930.5698-1-dongli.zhang@oracle.com>
 <YjhN4neEJMs04JEN@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YjhN4neEJMs04JEN@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HDqalv0XKUt4dz6fA0XKZSyr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HDqalv0XKUt4dz6fA0XKZSyr
Content-Type: multipart/mixed; boundary="------------3da2YXrQFw7IfIqTv3HvrD0W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, axboe@kernel.dk,
 linux-kernel@vger.kernel.org
Message-ID: <9143f2f8-9f96-66f4-0020-64918481606c@suse.com>
Subject: Re: [PATCH 1/1] xen/blkfront: fix comment for need_copy
References: <20220317220930.5698-1-dongli.zhang@oracle.com>
 <YjhN4neEJMs04JEN@Air-de-Roger>
In-Reply-To: <YjhN4neEJMs04JEN@Air-de-Roger>

--------------3da2YXrQFw7IfIqTv3HvrD0W
Content-Type: multipart/mixed; boundary="------------k1urJJizQ7n30a6sz3vlkF5u"

--------------k1urJJizQ7n30a6sz3vlkF5u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDMuMjIgMTE6MDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFRodSwg
TWFyIDE3LCAyMDIyIGF0IDAzOjA5OjMwUE0gLTA3MDAsIERvbmdsaSBaaGFuZyB3cm90ZToN
Cj4+IFRoZSAnbmVlZF9jb3B5JyBpcyBzZXQgd2hlbiBycV9kYXRhX2RpcihyZXEpIHJldHVy
bnMgV1JJVEUsIGluIG9yZGVyIHRvDQo+PiBjb3B5IHRoZSB3cml0dGVuIGRhdGEgdG8gcGVy
c2lzdGVudCBwYWdlLg0KPj4NCj4+ICIubmVlZF9jb3B5ID0gcnFfZGF0YV9kaXIocmVxKSAm
JiBpbmZvLT5mZWF0dXJlX3BlcnNpc3RlbnQsIg0KPiANCj4gSSB3b3VsZCBhbHNvIGFkZDoN
Cj4gDQo+IEZpeGVzOiBjMDA0YTZmZTBjNDAgKCdibG9jay94ZW4tYmxrZnJvbnQ6IE1ha2Ug
aXQgcnVubmluZyBvbiA2NEtCIHBhZ2UgZ3JhbnVsYXJpdHknKQ0KDQpIbW0sIGEgIkZpeGVz
OiIgdGFnIGZvciBhIGNoYW5nZSBpbiBhIGNvbW1lbnQ/DQoNClRoaXMgbWlnaHQgZ2VuZXJh
dGUgYWRkaXRpb25hbCB3b3JrIGUuZy4gZm9yIGRvd25zdHJlYW1zICh3ZSBhdCBTVVNFIGhh
dmUNCnNjcmlwdHMgY2hlY2tpbmcgIkZpeGVzOiIgdGFncyBhbmQgcmVxdWlyZSBzdWNoIGNo
YW5nZXMgdG8gYmUgYXBwbGllZCB0bw0Ka2VybmVscyBoYXZpbmcgdGhlIGZpeGVkIHBhdGNo
IGFwcGxpZWQpLg0KDQpUaGF0IHNhaWQgSSdkIHByZWZlciBub3QgaGF2aW5nIGEgIkZpeGVz
OiIgdGFnIGZvciBzdWNoIGNoYW5nZXMsIGJ1dCBtYXliZQ0KdGhpcyBpcyBqdXN0IGR1ZSB0
byB0aGUgZmFjdCB0aGF0IGl0IHdvdWxkIGJlIG1lIGhhdmluZyB0byBhcHBseSB0aGlzDQpw
YXRjaCB0byB0aGUgU1VTRSBrZXJuZWxzLi4uDQoNCg0KSnVlcmdlbg0K
--------------k1urJJizQ7n30a6sz3vlkF5u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------k1urJJizQ7n30a6sz3vlkF5u--

--------------3da2YXrQFw7IfIqTv3HvrD0W--

--------------HDqalv0XKUt4dz6fA0XKZSyr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI4UvIFAwAAAAAACgkQsN6d1ii/Ey91
AwgAk7qUzQY7ppbSKnwccCfalJb2WWdN/Zo7e7wkqLz0ShjGLzCdOaDvq5JXOIx40ns0Z1Pm//pC
5pDpXvaVHkuFEZBOHoD3EhFp6dJUhAwFJLnpH81RvRQRP7m9jt5NBpgznQtaGl20sSxuvu6d1B6z
GlAI3egjKVvJaShMVpsykIpI8CJTZ8daQFxSBi+2A2oqQ5zHbmm6587wI1uu+Vi0thqD3gOIakPB
cENVrLpeIK9Adj1vIMSZXbSM+L/ND02G//BrSA9UTKUmdfMabVudUX6s9nbyVUt/kw6ZDzDHt5mY
q6dDewl9nnA1SuoxN3BDXb/LGhsKB86nFRdkqIFclQ==
=142m
-----END PGP SIGNATURE-----

--------------HDqalv0XKUt4dz6fA0XKZSyr--

