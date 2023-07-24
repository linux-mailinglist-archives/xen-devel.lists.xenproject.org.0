Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AAF75EAB7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 07:08:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568406.887685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNnnK-0007Be-7w; Mon, 24 Jul 2023 05:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568406.887685; Mon, 24 Jul 2023 05:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNnnK-00079i-5L; Mon, 24 Jul 2023 05:07:42 +0000
Received: by outflank-mailman (input) for mailman id 568406;
 Mon, 24 Jul 2023 05:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNnnH-00079b-R3
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 05:07:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0141dee7-29e0-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 07:07:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BFFF20488;
 Mon, 24 Jul 2023 05:07:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 015B213476;
 Mon, 24 Jul 2023 05:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KtRWOhcHvmREIgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 05:07:35 +0000
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
X-Inumbo-ID: 0141dee7-29e0-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690175256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EuokPu4ognUR5ZFVPKHLs8t+Gf4ukm1xma2Lw7D/Fo0=;
	b=fmQGmgAinCZ0zrWBGVXJepy0xYmbXSxYrwVJgcU43oGYOmeWBMl2Yyu32YZH2QOt6ENKW7
	NQ6tWiaNDGKYhVQXLwrT4crJHCWbiiEmzyyfKwTBeKuNdsoxyJQSQYWjG/fer0ewnkfxr7
	paKaHqoHOugM44L1o3XG2S36LxFFp7Y=
Message-ID: <609d6f0c-8987-2beb-01fc-89a140dd1418@suse.com>
Date: Mon, 24 Jul 2023 07:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/2] tools/xenstore: fix get_spec_node()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230722081646.4136-1-jgross@suse.com>
 <7604c148-47c5-ce67-d691-4f642b1876a9@xen.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <7604c148-47c5-ce67-d691-4f642b1876a9@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b433qyvSEMT4TDa2TMsODKjj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b433qyvSEMT4TDa2TMsODKjj
Content-Type: multipart/mixed; boundary="------------TRjsbSvfkIiI9MU304qj0mzx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <609d6f0c-8987-2beb-01fc-89a140dd1418@suse.com>
Subject: Re: [PATCH v2 0/2] tools/xenstore: fix get_spec_node()
References: <20230722081646.4136-1-jgross@suse.com>
 <7604c148-47c5-ce67-d691-4f642b1876a9@xen.org>
In-Reply-To: <7604c148-47c5-ce67-d691-4f642b1876a9@xen.org>

--------------TRjsbSvfkIiI9MU304qj0mzx
Content-Type: multipart/mixed; boundary="------------5UGJuyB12jIwTMcGPhEePpsV"

--------------5UGJuyB12jIwTMcGPhEePpsV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDcuMjMgMTg6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIyLzA3LzIwMjMgMDk6MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBT
bWFsbCBzZXJpZXMgdG8gZml4IGEgYnVnIGluIGdldF9zcGVjX25vZGUoKS4NCj4+DQo+PiBQ
YXRjaCAxIGlzIHR1cm5pbmcgc2V2ZXJhbCBmdW5jdGlvbiBwYXJhbWV0ZXJzIGludG8gY29u
c3QgaW4gb3JkZXIgdG8NCj4+IGF2b2lkIGhhdmluZyB0byBjYXN0IGF3YXkgdGhlIGNvbnN0
IGF0dHJpYnV0ZSBpbiBnZXRfc3BlY19ub2RlKCkuDQo+Pg0KPj4gUGF0Y2ggMiBpcyB0aGUg
Zml4LCB3aGljaCBpcyBhIGJhY2twb3J0IGNhbmRpZGF0ZS4NCj4+DQo+PiBBbHRlcm5hdGl2
ZXMgdG8gdGhpcyBzZXJpZXMgd291bGQgYmU6DQo+Pg0KPj4gLSBtZXJnZSB0aGUgcGF0Y2hl
cyBpbnRvIG9uZSBwYXRjaCBhbmQgYmFja3BvcnQgdGhhdA0KPiANCj4gQUZBSVUsIHRoaXMg
d291bGQgaGF2ZSB0aGUgc2FtZSBvdXRjb21lIGFzIGFwcGx5aW5nIHRoZSB0d28gcGF0Y2hl
cyBidXQgaXQgd291bGQgDQo+IGNpcmN1bXZlbnQgdGhlICJ3ZSBkb24ndCBiYWNrcG9ydCBj
bGVhbi11cCB0byBzdGFibGUgdHJlZSIgYW5kIGxvc2UgdGhlIGhpc3RvcnkuDQoNCkNvcnJl
Y3QuIFdpdGggeW91ciBzdWdnZXN0ZWQgcGF0Y2ggbW9kaWZ5aW5nIGdldF9zdHJpbmdzKCkg
dGhpcyB3b3VsZCBncm93IGV2ZW4NCmxhcmdlciwgdGhvdWdoLg0KDQo+IA0KPj4gLSBzd2Fw
IHRoZSBzZXF1ZW5jZSBvZiB0aGUgcGF0Y2hlcyBpbiBvcmRlciB0byBoYXZlIGxlc3MgY29k
ZSBjaHVybg0KPj4gwqDCoCB3aGVuIGJhY2twb3J0aW5nLCBidXQgcmUtYWRkaW5nIHRoZSBj
YXN0IGZyb20gY29uc3QgdG8gbm9uLWNvbnQsDQo+PiDCoMKgIHdoaWxlIGJhY2twb3J0aW5n
IG9ubHkgdGhlIGZpeA0KPiANCj4gSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhpcy4g
SWYgeW91IHN3YXAgdGhlIHBhdGNoLCB3b3VsZG4ndCB0aGUgY29uc3QtYXdheSANCj4gY2Fz
dCBiZSBuZWVkZWQgdG8gY29tcGlsZSBhbmQgYWxsb3cgYmlzZWN0aW9uPw0KDQpZZXMuIFRo
aXMgc3VnZ2VzdGlvbiB3b3VsZCBiZSBvbmUgd2F5IHRvIHVzZSB0aGUgY29uc3QtYXdheSBj
YXN0IGZvciB0aGUNCmJhY2twb3J0cy4gSXQgd291bGQgYmFzaWNhbGx5IGVuYWJsZSB1cyB0
byBoYXZlIHRoZSBzYW1lIChvciB2ZXJ5IHNpbWlsYXIpDQpwYXRjaCBpbiB1bnN0YWJsZSBh
bmQgdGhlIHN0YWJsZSBicmFuY2hlcy4NCg0KPiANCj4+IC0gbGVhdmUgdGhlIHNlcmllcyBh
cyBpcyBhbmQgYmFja3BvcnQgYm90aCBwYXRjaGVzDQo+IA0KPiBJIGFtIHNwbGl0LiBPbiBv
bmUgaGFuZCwgaXQgd291bGQgYmUgZ29vZCB0byBoYXJkZW4gb2xkZXIgWGVuc3RvcmVkLCBv
biB0aGUgDQo+IG90aGVyIGhhbmQgdGhpcyBpcyBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IHRv
IGZpeCBpdC4gU28gcG9zc2libHkgbm90IGEgZ29vZCANCj4gb3B0aW9uIGNvbXBhcmUgdG8g
dGhlIG90aGVycy4NCg0KSSBhZ3JlZS4NCg0KPiANCj4+IC0gbGVhdmUgdGhlIHNlcmllcyBh
cyBpcyBhbmQgdXNlIFYxIG9mIHBhdGNoIDIgZm9yIHRoZSBiYWNrcG9yDQo+IEl0IHdvdWxk
IGJlIG15IHByZWZlcmVuY2UuIEJ1dCBJIHdvdWxkIGFsc28gYmUgaGFwcHkgd2l0aCBzd2Fw
cGluZyBwYXRjaCAjMSBhbmQgDQo+IHBhdGNoICMyIGlmIHRoZXJlIGlzIGEgZGVzaXJlIHRv
IGhhdmUgYSBjbGVhbiBjaGVycnktcGljay4NCg0KSSdtIGZpbmUgYm90aCB3YXlzLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------5UGJuyB12jIwTMcGPhEePpsV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5UGJuyB12jIwTMcGPhEePpsV--

--------------TRjsbSvfkIiI9MU304qj0mzx--

--------------b433qyvSEMT4TDa2TMsODKjj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS+BxcFAwAAAAAACgkQsN6d1ii/Ey8s
0Qf/bNr3TXM3MvvU9UQjTNM7bpUQwu9h9hD5ig5uMFb7DBIXj1Zf2bBnE+oSp1+ECGPCb9/Y4j4s
HS/0MS3AKC+LaV+Od2yfOhfN+GgVCuxQVBiVbfv+LbAo1rEP7pdeq0FCA52rHQV33k/VcOF82/fV
gFa4m47674IXM7NsQdtO4c/O7C7u0SCNObBiGkqfju+UixuS4JX4om8yyIYK/ZbQO6igT8vYjVKF
OJjWKQ7r+RSVnu5qDjUDa+OoHVA4EhhM78FwbLNz4oWwfOSriiV3SL2Y0o7+xloo8/1IHe170w4H
OOsL/ScFvJUjmycb1cUorQezjsUMCZnlkKMknyV8DA==
=otrs
-----END PGP SIGNATURE-----

--------------b433qyvSEMT4TDa2TMsODKjj--

