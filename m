Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB86A3D14
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 09:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502257.773971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYt4-0000Ya-Q0; Mon, 27 Feb 2023 08:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502257.773971; Mon, 27 Feb 2023 08:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYt4-0000Vp-NI; Mon, 27 Feb 2023 08:29:34 +0000
Received: by outflank-mailman (input) for mailman id 502257;
 Mon, 27 Feb 2023 08:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWYt3-0000Vj-5v
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 08:29:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db78914e-b678-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 09:29:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08B23219E9;
 Mon, 27 Feb 2023 08:29:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B169013A43;
 Mon, 27 Feb 2023 08:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MVyIKepp/GNJOAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 08:29:30 +0000
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
X-Inumbo-ID: db78914e-b678-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677486571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94d+MxmPoJb4+Q2TGJQjnS7ST674rFseImevc/csRBY=;
	b=eKktAwg5P+jt+s57UaDY4da/wjL/jcBwPfX8K6wtKyaUvxdBQJYCL8WJ8JnOq7wuy7MTTM
	7LDfxMM8qxl6Guuztcm1c2I+LZgwlwsL1BObu972dc/+vOiZy4BYG0AjDPXS9aIUZnT0ig
	lSAYoCjbZxSImUm+wOxspFLngP6TWS8=
Message-ID: <f3f8584e-e97d-abe9-5749-da5bf3587a57@suse.com>
Date: Mon, 27 Feb 2023 09:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] xen-netback: remove unused variables pending_idx and
 index
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230226163429.2351600-1-trix@redhat.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230226163429.2351600-1-trix@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OkfDc060i77ItM0rXRTMchNL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OkfDc060i77ItM0rXRTMchNL
Content-Type: multipart/mixed; boundary="------------raDtPFfI0jd0xZRsd3ztGYmg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Tom Rix <trix@redhat.com>, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <f3f8584e-e97d-abe9-5749-da5bf3587a57@suse.com>
Subject: Re: [PATCH] xen-netback: remove unused variables pending_idx and
 index
References: <20230226163429.2351600-1-trix@redhat.com>
In-Reply-To: <20230226163429.2351600-1-trix@redhat.com>

--------------raDtPFfI0jd0xZRsd3ztGYmg
Content-Type: multipart/mixed; boundary="------------WswNWS6AXr0AlqNVcgpIdz0Q"

--------------WswNWS6AXr0AlqNVcgpIdz0Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDIuMjMgMTc6MzQsIFRvbSBSaXggd3JvdGU6DQo+IGJ1aWxkaW5nIHdpdGggZ2Nj
IGFuZCBXPTEgcmVwb3J0cw0KPiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmM6
ODg2OjIxOiBlcnJvcjogdmFyaWFibGUNCj4gICAg4oCYcGVuZGluZ19pZHjigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtYnV0LXNldC12YXJpYWJsZV0NCj4gICAgODg2
IHwgICAgICAgICAgICAgICAgIHUxNiBwZW5kaW5nX2lkeDsNCj4gICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fg0KPiANCj4gcGVuZGluZ19pZHggaXMgbm90IHVz
ZWQgc28gcmVtb3ZlIGl0LiAgU2luY2UgaW5kZXggd2FzIG9ubHkNCj4gdXNlZCB0byBzZXQg
cGVuZGluZ19pZHgsIHJlbW92ZSBpbmRleCBhcyB3ZWxsLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------WswNWS6AXr0AlqNVcgpIdz0Q
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WswNWS6AXr0AlqNVcgpIdz0Q--

--------------raDtPFfI0jd0xZRsd3ztGYmg--

--------------OkfDc060i77ItM0rXRTMchNL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP8aeoFAwAAAAAACgkQsN6d1ii/Ey/3
1wf/cHgHTwEvMmGQWUwEoPDOEKv5h+oG/SVBjnAKwI4iHHUuH/10cmg5eno363lVgBjFwpbn2r0q
7VhfWK0hARtIrS0/f3jAlXWWCaPbprbLkkl+BNhAAqbjwJskxfCzfc+WZ7NjrDgF9Y+uoJKmHTwe
2biV511StPIzc6/vhOK+tmQxqEfRk76jBmN4Rp5DPLghJpp2fY+byPU7KDVXedUTUQ0f1wr2qIpB
eObWn8TNixmChAfarLNH9sUZdhbxtVLwOf8kZf3jU3LQb2BU/9TtvyMMC+4CiNPEzNi0CayzgNrY
I3rzQNGOrVyR/Ip3HpRUeE71kwJgZEjpRQmBlT2XXA==
=T5v7
-----END PGP SIGNATURE-----

--------------OkfDc060i77ItM0rXRTMchNL--

