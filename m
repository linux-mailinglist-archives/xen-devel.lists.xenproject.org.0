Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE96C79E1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 09:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514213.796262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfcsL-0007kh-QI; Fri, 24 Mar 2023 08:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514213.796262; Fri, 24 Mar 2023 08:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfcsL-0007i3-NG; Fri, 24 Mar 2023 08:34:17 +0000
Received: by outflank-mailman (input) for mailman id 514213;
 Fri, 24 Mar 2023 08:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jsbp=7Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfcsK-0007hx-2O
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 08:34:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a895a44a-ca1e-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 09:34:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27995219E8;
 Fri, 24 Mar 2023 08:34:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02E07133E5;
 Fri, 24 Mar 2023 08:34:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MQ6LOoVgHWTgfwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Mar 2023 08:34:13 +0000
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
X-Inumbo-ID: a895a44a-ca1e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679646854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sTey4jBFubwjfyO6oW4RFjhMsehsllOxdCR5NIyZmw=;
	b=JqnSLgeb6oyTwvgzlkuIqOyWzq0iCfE+mpXF+YbVs+1ibsB1iB8V73vlnwL2Ibm9lY0YX6
	VtRirzJp9ifm4wjWYZ47okjDBeqlDJjWt6DjZolJKVuoxGfEe/8L6z2p+07K9B8dFeBhRg
	a0G8FnDOaDFdbaOqjKkoPnRbsdjlqPk=
Message-ID: <731e6a57-df37-6dc8-d1cd-29f3afcb79f8@suse.com>
Date: Fri, 24 Mar 2023 09:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [adhoc test] 179901: regressions - trouble:
 blocked/broken/fail/pass
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
References: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
 <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
 <145d84a7-b3dd-f578-3c8b-10a5aba53491@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <145d84a7-b3dd-f578-3c8b-10a5aba53491@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RzQFxsLLkffADENs16OaXZst"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RzQFxsLLkffADENs16OaXZst
Content-Type: multipart/mixed; boundary="------------1J3oQdIzMz90ZJkubcxiUU31";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
Message-ID: <731e6a57-df37-6dc8-d1cd-29f3afcb79f8@suse.com>
Subject: Re: [adhoc test] 179901: regressions - trouble:
 blocked/broken/fail/pass
References: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
 <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
 <145d84a7-b3dd-f578-3c8b-10a5aba53491@suse.com>
In-Reply-To: <145d84a7-b3dd-f578-3c8b-10a5aba53491@suse.com>

--------------1J3oQdIzMz90ZJkubcxiUU31
Content-Type: multipart/mixed; boundary="------------WJ16Hkbu2yWgHmZoRUUambCr"

--------------WJ16Hkbu2yWgHmZoRUUambCr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjMgMDg6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMy4yMDIz
IDA4OjA3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjQuMDMuMjMgMDE6MTgsIGFw
ZXJhcmRAeGVuYml0cy54ZW4ub3JnIHdyb3RlOg0KPj4+IFthZGhvYyBwbGF5XSA8b3NzdGVz
dCBtYXN0ZXIgL2Rldi9wdHMvMTY+DQo+Pj4gaGFybmVzcyBlZDFkOGRlNDogUERVL0lQTUk6
IEJlIGxlc3MgYWdncmVzc2l2ZSB3aXRoIElQTUkgY29tbWFuZHMNCj4+PiAxNzk5MDE6IHJl
Z3Jlc3Npb25zIC0gdHJvdWJsZTogYmxvY2tlZC9icm9rZW4vZmFpbC9wYXNzDQo+Pj4NCj4+
PiBmbGlnaHQgMTc5OTAxIGxpbnV4LWxpbnVzIHBsYXkgW3BsYXldDQo+Pj4gaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE3OTkwMS8NCj4+Pg0K
Pj4+IFJlZ3Jlc3Npb25zIDotKA0KPj4NCj4+IEl0IHNlZW1zIHRoZSBncmFudCBjb3B5IGZh
aWx1cmVzIGFyZSBnb25lLCBidXQgdGhlIHRlc3RzIGFyZSBzdGlsbCBmYWlsaW5nLg0KPj4N
Cj4+IEkgaGF2ZSBzcG90dGVkOg0KPj4NCj4+IFsgICAxOC4yNTgwMzBdIG5ldCBldGgwOiBS
ZXNwb25zZSBmb3IgaW5hY3RpdmUgcmVxdWVzdA0KPj4gWyAgIDE4LjI1ODA4MF0gbmV0IGV0
aDA6IERpc2FibGVkIGZvciBmdXJ0aGVyIHVzZQ0KPj4NCj4+IGluDQo+PiBodHRwOi8vbG9n
cy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc5OTAxL3Rlc3QtYW1k
NjQtYW1kNjQteGwvZWxibGluZzEtLS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRlYmlh
bi5ndWVzdC5vc3N0ZXN0LmxvZw0KPj4NCj4+IFRoaXMgaXMgY2xlYXJseSBhbiBleHBsYW5h
dGlvbiBmb3IgdGhlIGZhaWxlZCB0ZXN0cy4gSSdtIGxvb2tpbmcgaW50byBpdC4NCj4gDQo+
IFJpZ2h0IC0geGVudmlmX3R4X2NoZWNrX2dvcCgpIG5vdyBzZW5kcyB0d28gcmVzcG9uc2Vz
IGZvciB0aGUgc3BsaXQgY29weS4NCg0KWWVzLiBJJ20ganVzdCBmaWd1cmluZyBvdXQgaG93
IHRvIGtlZXAgdHJhY2sgb2YgdGhlIHJlbGF0aW9uIGNvcHlfb3AgYW5kIHBlbmRpbmcNCnJl
cXVlc3QuIEkgY2FuJ3QganVzdCBkb3VibGUgdGhlIGNvcHlfcGVuZGluZ19pZHhbXSBhcnJh
eSBzaXplLCBhcyB0aGlzIHdvdWxkDQpncm93IHRoZSBzdHJ1Y3QgYWJvdmUgdGhlIGFsbG93
ZWQgc2l6ZSBvZiA0OCBieXRlcy4NCg0KDQpKdWVyZ2VuDQo=
--------------WJ16Hkbu2yWgHmZoRUUambCr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WJ16Hkbu2yWgHmZoRUUambCr--

--------------1J3oQdIzMz90ZJkubcxiUU31--

--------------RzQFxsLLkffADENs16OaXZst
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQdYIUFAwAAAAAACgkQsN6d1ii/Ey8L
nAf/XjlODbCpthKjt4R4PwbgHTdrQR2nGzH5X5Y0BKzBmEvpRa7k2cXHVockQJ8b5x97mhR94K+8
+OfpIRVOC6xODc1H07EQJkWSZZahWOqW7UORg2ETHLDXkyVXYzZx+OfGB9cIxs9VGwx6KSlDEQI3
YsFPd1ZPi9eZ0kmwhWdHx0Fz+HoGlnXuedBCMVgbNqh/QW7P/rRo7bRaeBjD+cayhfDSXdkdvfuA
itOzTJGaC6Czk4joCLHRerQn3xRfhEuTsn7pd4xIW3tw5Sqt4BJVjxEoe7Gy7bBlwwiG1qV4EGUA
qUBiwlfW1YwEgboYVd/gr241VAtdctsF1T3ngkofXg==
=JdwF
-----END PGP SIGNATURE-----

--------------RzQFxsLLkffADENs16OaXZst--

