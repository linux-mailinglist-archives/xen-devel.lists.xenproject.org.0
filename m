Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A137E1C8D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 09:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627807.978668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzvC3-0003dW-00; Mon, 06 Nov 2023 08:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627807.978668; Mon, 06 Nov 2023 08:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzvC2-0003b1-Sz; Mon, 06 Nov 2023 08:42:46 +0000
Received: by outflank-mailman (input) for mailman id 627807;
 Mon, 06 Nov 2023 08:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=czoR=GT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qzvC1-0003aZ-Up
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 08:42:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73f1f3b2-7c80-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 09:42:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0F6F21846;
 Mon,  6 Nov 2023 08:42:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92F51138E5;
 Mon,  6 Nov 2023 08:42:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eFkgIgKnSGVqXgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Nov 2023 08:42:42 +0000
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
X-Inumbo-ID: 73f1f3b2-7c80-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699260162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/CyEE+nyKyQmVlQ/exmrZWx9a8YfUq09Ec3Pge4YxWw=;
	b=AnXPwcmN8uCUOHKJKEYuj6vh+n8iKm6jq1koHE5nKZTo2vezX+4f0Nhu8uPCQbHbAAd/ZR
	yV73Pg4jxc9e3iGm+drqK+UH1WTUuVF85FQWNm3thUrEDQp7PMCN1KlXBXK8SOC6E5sKd3
	RJ0Hzorbwq3khUeIOvUqDRwZOKP3Dmo=
Message-ID: <2f9dc89a-fab3-4a83-a557-c22afa5aaf1d@suse.com>
Date: Mon, 6 Nov 2023 09:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Mini-OS: keep a positive list of externally visible
 symbols
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20231101153551.11733-1-jgross@suse.com>
 <20231101153551.11733-3-jgross@suse.com>
 <20231103020958.4fwx75czgkwa5oxt@begin>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20231103020958.4fwx75czgkwa5oxt@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5tAF8FihmJIbOEculUIEgr02"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5tAF8FihmJIbOEculUIEgr02
Content-Type: multipart/mixed; boundary="------------mcoZ0c7CvINgCTS2ztvvRFnE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <2f9dc89a-fab3-4a83-a557-c22afa5aaf1d@suse.com>
Subject: Re: [PATCH 2/2] Mini-OS: keep a positive list of externally visible
 symbols
References: <20231101153551.11733-1-jgross@suse.com>
 <20231101153551.11733-3-jgross@suse.com>
 <20231103020958.4fwx75czgkwa5oxt@begin>
In-Reply-To: <20231103020958.4fwx75czgkwa5oxt@begin>

--------------mcoZ0c7CvINgCTS2ztvvRFnE
Content-Type: multipart/mixed; boundary="------------VB9whz1cuiJFJVgDjpLmdgvu"

--------------VB9whz1cuiJFJVgDjpLmdgvu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTEuMjMgMDM6MDksIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiBKdWVyZ2VuIEdyb3NzLCBsZSBtZXIuIDAxIG5vdi4gMjAyMyAxNjozNTo1MSArMDEw
MCwgYSBlY3JpdDoNCj4+IFRoZSBzeW1ib2xzIGluIG1pbmktb3MubWFwIGhhdmUgYmVlbiBv
YnRhaW5lZCB2aWEgYnVpbGRpbmcgYWxsIGRlZmluZWQNCj4+IGFuZCBub3QgZmFpbGluZyBz
dHViZG9tcyAoY2FtbC1zdHViZG9tIGRvZXNuJ3QgYnVpbGQpLg0KPj4NCj4+ICsrKyBiL21p
bmktb3MubWFwDQo+PiBAQCAtMCwwICsxLDE4NyBAQA0KPj4gKyMgTWluaS1PUyBzeW1ib2xz
IGJlaW5nIGV4dGVybmFsbHkgdmlzaWJsZQ0KPj4gKyMgZW50cnkgcG9pbnQNCj4+ICtfc3Rh
cnQNCj4+ICsjIE1pbmktT1Mgc2VydmljZSBmdW5jdGlvbnMNCj4+ICthbGxvY19mZA0KPj4g
K2FsbG9jX2ZpbGVfdHlwZQ0KPj4gK2FsbG9jX3BhZ2VzDQo+PiArYmluZF92aXJxDQo+IA0K
PiBJIGJlbGlldmUgd2UgYWxzbyB3YW50IGJpbmRfcGlycQ0KDQpJbiBnZW5lcmFsOiB5ZXMg
dG8gYWxsIG9mIHlvdXIgcmVtYXJrcyAodGhhbmtzIGZvciBsb29raW5nIHVwIHRoZSBtaXNz
aW5nDQpzeW1ib2xzKS4NCg0KVGhpcyB3YXMgYSBmaXJzdCByb3VuZCB0byBzZWUgd2hldGhl
ciB0aGUgYXBwcm9hY2ggaXMgZmluZS4gWW91ciBhbnN3ZXIgc2VlbXMNCnRvIGluZGljYXRl
IHRoYXQgdGhpcyBpcyB0aGUgY2FzZS4NCg0KSSdsbCBleHBhbmQgdGhlIGxpc3QgYXMgeW91
IHJlcXVlc3RlZCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------VB9whz1cuiJFJVgDjpLmdgvu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------VB9whz1cuiJFJVgDjpLmdgvu--

--------------mcoZ0c7CvINgCTS2ztvvRFnE--

--------------5tAF8FihmJIbOEculUIEgr02
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVIpwIFAwAAAAAACgkQsN6d1ii/Ey9i
aQf/dYAZR8R2xYO7F/AwG38hTb78RpONI0bq6wEK4Ztdhn+j70gvv7vvn23LCuR+YCyiTEYTGY/y
oqeMch6geGHEahX2PRcqbcQj6c4UUcVvz6lWgUl/i/e+WmmMesNW3b3US2h8Af5o726i/tEmr5rf
ujRB+DLU7fVLZ78Xi9YrTKY9hdXwQ6niHpE9MQrBvDuWv89VRrBF6yxO2xvKQwOdKOEG7PU8Jbxc
teH6nRYCkWLGjUZPe9JurIizOpGssuIdmJW05nzC77HMs5gYIiEIbMiaJi/NQIAHjzVsYYXZxwcz
rKFS/al0uV8mg95kA6JfHQLzzO8nf1eQmksxDFAp9g==
=thIM
-----END PGP SIGNATURE-----

--------------5tAF8FihmJIbOEculUIEgr02--

