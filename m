Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6630520DB2
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325228.547717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noJDw-0005OI-7M; Tue, 10 May 2022 06:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325228.547717; Tue, 10 May 2022 06:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noJDw-0005LM-4Q; Tue, 10 May 2022 06:19:56 +0000
Received: by outflank-mailman (input) for mailman id 325228;
 Tue, 10 May 2022 06:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=91Tp=VS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1noJDu-0005LB-6R
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 06:19:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34022310-d029-11ec-a406-831a346695d4;
 Tue, 10 May 2022 08:19:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CCF51FA35;
 Tue, 10 May 2022 06:19:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3906613AC1;
 Tue, 10 May 2022 06:19:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OpAxCwgEemL5WQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 10 May 2022 06:19:52 +0000
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
X-Inumbo-ID: 34022310-d029-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652163592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NJxgkt+9muhPnfdpekGe4J9H+bDH8Vrk2WszTx0k0QI=;
	b=OThfI19W1LY6G7PLbWxoGywO3oi5m/ujjz52Es6h9OSKmnHDn5FxYymJBO5ON29B1wVmLx
	pKM42HcA3ZdCsSb6AS55/PF0tIW83SWiT/vyhTedbWMT+JVmz391S/JOWC7LjsOy/IreMu
	Bz1nyFRBxn/atNkSee1jkB5EJ/6M5Oc=
Message-ID: <edfeb5d5-f8dc-b529-7260-d6655a53a5f4@suse.com>
Date: Tue, 10 May 2022 08:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Attributing linux related patches on xen-devel
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1c5619ff-0872-8c0a-9dbd-9f419b9c957f@suse.com>
 <alpine.DEB.2.22.394.2205091159480.43560@ubuntu-linux-20-04-desktop>
 <15ec8f3b-7d04-9fa2-dd32-b834fb660a89@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <15ec8f3b-7d04-9fa2-dd32-b834fb660a89@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tZgb9WAHBGfGRLFe7WVNugCV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tZgb9WAHBGfGRLFe7WVNugCV
Content-Type: multipart/mixed; boundary="------------jKbKInT0rUtRQ8mRLOzWAQeI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <edfeb5d5-f8dc-b529-7260-d6655a53a5f4@suse.com>
Subject: Re: Attributing linux related patches on xen-devel
References: <1c5619ff-0872-8c0a-9dbd-9f419b9c957f@suse.com>
 <alpine.DEB.2.22.394.2205091159480.43560@ubuntu-linux-20-04-desktop>
 <15ec8f3b-7d04-9fa2-dd32-b834fb660a89@oracle.com>
In-Reply-To: <15ec8f3b-7d04-9fa2-dd32-b834fb660a89@oracle.com>

--------------jKbKInT0rUtRQ8mRLOzWAQeI
Content-Type: multipart/mixed; boundary="------------Ih2Hr9Z8Xk24Ttq0JJmFcIUE"

--------------Ih2Hr9Z8Xk24Ttq0JJmFcIUE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDUuMjIgMjE6MzUsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToNCj4gDQo+IE9uIDUv
OS8yMiAzOjAxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBNb24sIDkg
TWF5IDIwMjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gSVJDIHRoZSBxdWVzdGlv
biBjYW1lIHVwIHdoZXRoZXIgaXQgd291bGQgYmUgcG9zc2libGUgdG8gaGF2ZSBhDQo+Pj4g
c3BlY2lhbCBtYXJrZXIgZm9yIExpbnV4IHBhdGNoZXMgb24gdGhlIHhlbi1kZXZlbCBNTC4N
Cj4+Pg0KPj4+IEkgc3VnZ2VzdGVkIHRvIHVzZSB4ZW4tZGV2ZWwrbGludXhAbGlzdHMueGVu
cHJvamV4dC5vcmcgZm9yIHRob3NlDQo+Pj4gcGF0Y2hlcy4gV2l0aCBhIHBhdGNoIGZvciB0
aGUga2VybmVsJ3MgTUFJTlRBSU5FUlMgZmlsZSB0aGlzIHdvdWxkDQo+Pj4gYmUgcXVpdGUg
ZWFzeSB0byBhY2hpZXZlLg0KPj4+DQo+Pj4gQW55IHRob3VnaHRzPw0KPj4gRmluZSBieSBt
ZSwgYXMgbG9uZyBhcyB4ZW4tZGV2ZWwrbGludXhAbGlzdHMueGVucHJvamV4dC5vcmcgd29y
a3MgOi0pDQo+Pg0KPj4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGNvbWUgdXAgd2l0
aCBhIGRpZmZlcmVudCBzdWJqZWN0IHRhZyAoZS5nLg0KPj4gIlBBVENIIExJTlVYIikgYnV0
IHRoYXQgZG9lc24ndCB3b3JrIGFzIGl0IGlzIG5vdCBzdXBwb3J0ZWQgYnkgdG9kYXkncw0K
Pj4gTGludXggTUFJTlRBSU5FUlMgZmlsZS4NCj4+DQo+PiBTbyBJIHRoaW5rIHhlbi1kZXZl
bCtsaW51eCBpcyBmaW5lLg0KPiANCj4gDQo+IA0KPiBJJ2QgcHJlZmVyICctJyBpbnN0ZWFk
IG9mICcrJyBidXQgZWl0aGVyIHdheSBpcyBmaW5lLg0KDQpNeSBzdWdnZXN0aW9uIHdhcyBi
YXNlZCBvbiBSRkMtNTIzMzoNCg0KaHR0cHM6Ly9kYXRhdHJhY2tlci5pZXRmLm9yZy9kb2Mv
aHRtbC9yZmM1MjMzDQoNCg0KSnVlcmdlbg0K
--------------Ih2Hr9Z8Xk24Ttq0JJmFcIUE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Ih2Hr9Z8Xk24Ttq0JJmFcIUE--

--------------jKbKInT0rUtRQ8mRLOzWAQeI--

--------------tZgb9WAHBGfGRLFe7WVNugCV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJ6BAcFAwAAAAAACgkQsN6d1ii/Ey95
lwf/QRkMu0lkA6+O8VPhDwA2p3EDgSHk/5EbuD7P1/ASohor5WgqpCmhvwsG/CH1a2o1pHH0NvVs
qYelGcQsUwcukfn09cNG/2GGiOuuja0lHKwc87jRZvZldES7WrXrK3RFnBkiyCKOF+s5usCgPzeL
fTxQfBlBo/9CHrsdWr0GHboPq4JG0rvX486NpplfOtuEpwetgsKvlmQ+7Sp/N2jkCkqUweFQLP5D
xGesDwF8wwg8pDpTrvWyNMHBH4RMpNMsxyU+zL6fWn7nsOCe07J1IrKVdE1g340aYqcUxGSxg4rh
Vm3PFpP5WZIokNaHZRbB0HC5QMeTUlDSq0GLyaLJ4Q==
=iVrZ
-----END PGP SIGNATURE-----

--------------tZgb9WAHBGfGRLFe7WVNugCV--

