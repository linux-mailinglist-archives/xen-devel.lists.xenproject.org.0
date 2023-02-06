Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552068B9C5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490243.758880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyZ4-0001EK-Qw; Mon, 06 Feb 2023 10:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490243.758880; Mon, 06 Feb 2023 10:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyZ4-0001BO-Nl; Mon, 06 Feb 2023 10:17:34 +0000
Received: by outflank-mailman (input) for mailman id 490243;
 Mon, 06 Feb 2023 10:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pOyZ3-0001Aw-Ip
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:17:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7590dc98-a607-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 11:17:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6432D60508;
 Mon,  6 Feb 2023 10:17:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E58F138E8;
 Mon,  6 Feb 2023 10:17:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f5vnDbjT4GPUCQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Feb 2023 10:17:28 +0000
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
X-Inumbo-ID: 7590dc98-a607-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675678648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=evmouaSQrGwFasoc4XbxgEKPXVKqbWqSn5F4PbsDFnA=;
	b=VUVaSMael8ihCS3giFabVmYD+FZ2TvxlR99RRV/eh1ngmGEaV4UiIDa8aZ30kFy9Kon7er
	ZKbAsAV3ajUJZ8YfE4P23XHn7LSaq+LB2z8fp90LFbRttKEHKUWTfUa3CkP4I9fhr2GjOS
	c3f2jaBjEr3A6G70UZJ63xVauBr3d28=
Message-ID: <77d6d486-5ad5-1f13-e223-79295707d090@suse.com>
Date: Mon, 6 Feb 2023 11:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 7/7] Mini-OS: add read and write support to 9pfsfront
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-8-jgross@suse.com>
 <20230206101341.5l7cxb2vvregskrx@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230206101341.5l7cxb2vvregskrx@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yclteTcnPxnWv8Sct0dAK7cP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yclteTcnPxnWv8Sct0dAK7cP
Content-Type: multipart/mixed; boundary="------------ZNp3eWVZTHb7uEwrN7eu7GJn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <77d6d486-5ad5-1f13-e223-79295707d090@suse.com>
Subject: Re: [PATCH 7/7] Mini-OS: add read and write support to 9pfsfront
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-8-jgross@suse.com>
 <20230206101341.5l7cxb2vvregskrx@begin>
In-Reply-To: <20230206101341.5l7cxb2vvregskrx@begin>

--------------ZNp3eWVZTHb7uEwrN7eu7GJn
Content-Type: multipart/mixed; boundary="------------DMoWO1LRQM0vB4sWYiinpiYJ"

--------------DMoWO1LRQM0vB4sWYiinpiYJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDIuMjMgMTE6MTMsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gDQo+IEp1ZXJn
ZW4gR3Jvc3MsIGxlIHZlbi4gMDMgZsOpdnIuIDIwMjMgMTA6MTg6MDkgKzAxMDAsIGEgZWNy
aXQ6DQo+PiBUaGlzIHBhdGNoIGlzIG1pc3NpbmcgdGhlIGxpbWl0YXRpb24gb2YgcmVhZC93
cml0ZSBtZXNzYWdlcyB0byBzdGF5DQo+PiBiZWxvdyB0aGUgbWF4LiBzdXBwb3J0ZWQgbWVz
c2FnZSBzaXplLg0KPiANCj4gSXQgc2hvdWxkIGF0IGxlYXN0IGJlIGFzc2VydGVkLg0KDQpJ
dCBjYW4gZWFzaWx5IGJlIGxpbWl0ZWQgYnkgcmV0dXJuaW5nIHRoZSByZXN1bHRpbmcgbGlt
aXQgYXMgdGhlDQpudW1iZXIgb2YgcHJvY2Vzc2VkIGJ5dGVzLg0KDQo+IA0KPj4gK3N0YXRp
YyBpbnQgcDlfcmVhZChzdHJ1Y3QgZGV2XzlwZnMgKmRldiwgdWludDMyX3QgZmlkLCB1aW50
NjRfdCBvZmZzZXQsDQo+PiArICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgKmRhdGEsIHVp
bnQzMl90IGxlbikNCj4+ICt7DQo+PiArICAgIHN0cnVjdCByZXEgKnJlcSA9IGdldF9mcmVl
X3JlcShkZXYpOw0KPj4gKyAgICBpbnQgcmV0Ow0KPj4gKyAgICB1aW50MzJfdCBjb3VudDsN
Cj4+ICsNCj4+ICsgICAgaWYgKCAhcmVxICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgZXJy
bm8gPSBFSU87DQo+IA0KPiBIZXJlIGFzIHdlbGwgKGFuZCBpbiBwOV93cml0ZSkgd2UnZCB3
YW50IEVBR0FJTiByYXRoZXIgdGhhbiBFSU8gd2hpY2gNCj4gY2FuIGJlIG1pc3Rha2VuIHdp
dGggdGhlIGVycm9yIGNhc2UgYmVsb3cuDQoNCkZpbmUgd2l0aCBtZS4NCg0KDQpKdWVyZ2Vu
DQoNCg==
--------------DMoWO1LRQM0vB4sWYiinpiYJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------DMoWO1LRQM0vB4sWYiinpiYJ--

--------------ZNp3eWVZTHb7uEwrN7eu7GJn--

--------------yclteTcnPxnWv8Sct0dAK7cP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPg07cFAwAAAAAACgkQsN6d1ii/Ey/Y
ewf/Vs2qlPU52r/B/GeotisiJJzEbN7c93ENdaydlUth3ICAPO7+W2kKy8W1ZShmDHZKM7Xa6NGW
7Bk9kde9LMp7LDsNzckJ/+5IjLvATdoZM+TmDmq3fIkcWnXv7c3dnagoFqWXJfV5JXExgAJRaEtE
xatHxhq9Uh0Qv4PooJBZ+vSP7h2CaQfzGu4cwlwW9o6pTfEAY5nhjt7KXRZ3bRpJiwhvpeIIT0pm
oeYEx25eIwJNNZQkBwnOwm6rS4GB/BLWiFfb7zPDoeZSdoVoiIUOrm9NkD3PlWWZV0/uchsP1HqS
TXIWArImFew8eSB3o4PKwjm67DAoAKyxpR0WT/KCIw==
=Wzru
-----END PGP SIGNATURE-----

--------------yclteTcnPxnWv8Sct0dAK7cP--

