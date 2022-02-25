Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490314C4718
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279122.476682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbHS-0004WD-Ia; Fri, 25 Feb 2022 14:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279122.476682; Fri, 25 Feb 2022 14:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbHS-0004Tm-Es; Fri, 25 Feb 2022 14:09:10 +0000
Received: by outflank-mailman (input) for mailman id 279122;
 Fri, 25 Feb 2022 14:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNbHQ-0004Te-9C
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:09:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e5d2d71-9644-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 15:09:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0304E1F38B;
 Fri, 25 Feb 2022 14:09:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBDB013BE6;
 Fri, 25 Feb 2022 14:09:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KzRcNAHjGGLIXgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Feb 2022 14:09:05 +0000
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
X-Inumbo-ID: 7e5d2d71-9644-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645798146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E6JzscrfvjSDBwdZnpXujsEETbxz2T4zIpCYvRb6+qo=;
	b=Rfv+9BG7yUEzVrXTny0g3wY3EuxK0In5UVXt9UT1nuaBFQZ1XMHvuqVUk+ltaS/5m7p5Rs
	ayEf+L+xPu4WIPzhOGSUjLaOTlfogmW6P6WA3403ZGX/6pnwqKCLWW2VsM19kjS5ymog1j
	o+hXbDpBmXzlJ4cQEwiLcvcARfcpk9E=
Message-ID: <d89c0991-b437-31c3-8432-281c3fa24c41@suse.com>
Date: Fri, 25 Feb 2022 15:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
References: <20220223180859.GA1412216@dingwall.me.uk>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC] kernel: xenfs parameter to hide deprecated files
In-Reply-To: <20220223180859.GA1412216@dingwall.me.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1oylJZz3Ri82TsAanZ0cP0jd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1oylJZz3Ri82TsAanZ0cP0jd
Content-Type: multipart/mixed; boundary="------------Taz6Er9V87gXq4GGMVSXjlwF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
Message-ID: <d89c0991-b437-31c3-8432-281c3fa24c41@suse.com>
Subject: Re: [RFC] kernel: xenfs parameter to hide deprecated files
References: <20220223180859.GA1412216@dingwall.me.uk>
In-Reply-To: <20220223180859.GA1412216@dingwall.me.uk>

--------------Taz6Er9V87gXq4GGMVSXjlwF
Content-Type: multipart/mixed; boundary="------------bMs6IAiJ0qHlQ232Gl000Eri"

--------------bMs6IAiJ0qHlQ232Gl000Eri
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDIuMjIgMTk6MDgsIEphbWVzIERpbmd3YWxsIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IEkgaGF2ZSBiZWVuIGludmVzdGlnYXRpbmcgYSB2ZXJ5IGludGVybWl0dGVudCBpc3N1ZSB3
ZSBoYXZlIHdpdGggeGVuc3RvcmUNCj4gYWNjZXNzIGhhbmdpbmcuICBUeXBpY2FsbHkgaXQg
c2VlbXMgdG8gaGFwcGVuIHdoZW4gYWxsIGRvbWFpbnMgYXJlIHN0b3BwZWQNCj4gcHJpb3Ig
dG8gYSBzeXN0ZW0gcmVib290LiAgeGVuc3RvcmUgaXMgcnVubmluZyBpbiBhIHN0dWJkb20g
YW5kIHVzaW5nIHRoZQ0KPiBoeXBlcnZpc29yIGRlYnVnIGtleXMgaW5kaWNhdGVzIHRoZSBk
b21haW4gaXMgc3RpbGwgdGhlcmUuDQoNCkNvdWxkIGl0IGJlIGRvbTAgc2h1dGRvd24gaGFu
ZGxpbmcgaXMgdW5sb2FkaW5nIHNvbWUgbW9kdWxlcyB3aGljaCBhcmUNCm5lZWRlZCBmb3Ig
WGVuc3RvcmUgY29tbXVuaWNhdGlvbj8gRS5nLiB4ZW4tZXZ0Y2huPw0KDQo+IA0KPiBJIGhh
dmUgY29tZSBhY3Jvc3Mgc29tZSBvbGQgbGlzdCB0aHJlYWRzIHdoaWNoIHN1Z2dlc3RlZCBh
Y2Nlc3MgdmlhDQo+IC9wcm9jL3hlbi94ZW5idXMgY291bGQgY2F1c2UgcHJvYmxlbXMgYnV0
IGl0IHNlZW1zIHBhdGNoZXMgd2VudCBpbiB0byB0aGUNCj4ga2VybmVsIGZvciA0LjEwLiAg
SG93ZXZlciB0byBlbGltaW5hdGUgdGhpcyBlbnRpcmVseSBhcyBhIHBvc3NpYmlsaXR5DQo+
IEkgY2FtZSB1cCB3aXRoIHRoaXMga2VybmVsIHBhdGNoIHRvIGhpZGUgZGVwcmVjYXRlZCBl
bnRyaWVzIGluIHhlbmZzLg0KDQpJIGRvbid0IHNlZSBob3cgdGhpcyBwYXRjaCBjb3VsZCBo
ZWxwLg0KDQpsaWJ4ZW5zdG9yZSBpcyB1c2luZyAvZGV2L3hlbi94ZW5idXMgaWYgaXQgaXMg
YXZhaWxhYmxlLiBTbyB0aGUgb25seQ0KY2FzZSB3aGVyZSB5b3VyIHBhdGNoIHdvdWxkIGF2
b2lkIGFjY2Vzc2luZyAvcHJvYy94ZW4veGVuYnVzIHdvdWxkIGJlDQppZiAvZGV2L3hlbi94
ZW5idXMgaXNuJ3QgdGhlcmUuIEJ1dCB0aGlzIHdvdWxkbid0IG1ha2UgWGVuc3RvcmUgbW9y
ZQ0KcmVhY3RpdmUsIEkgZ3Vlc3MuIDstKQ0KDQo+IEkgZm91bmQgdGhpcyBvbGQgdGhyZWFk
IGZvciBhIHNpbWlsYXIgY2hhbmdlIHdoZXJlIHRoZSBlbnRyaWVzIHdlcmUgbWFkZQ0KPiBj
b25kaXRpb25hbCBvbiBrZXJuZWwgY29uZmlnIG9wdGlvbnMgaW5zdGVhZCBvZiBhIG1vZHVs
ZSBwYXJhbWV0ZXIgYnV0DQo+IHRoaXMgd2FzIG5ldmVyIG1lcmdlZC4NCj4gDQo+IGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDE1LzExLzMwLzc2MQ0KPiANCj4gSWYgdGhpcyB3b3VsZCBi
ZSBhIHVzZWZ1bCBmZWF0dXJlIEkgd291bGQgd2VsY29tZSBmZWVkYmFjay4NCg0KSSdtIG5v
dCBzdXJlIGhvdyBoZWxwZnVsIGl0IGlzIHRvIGxldCB0aGUgdXNlciBzcGVjaWZ5IGEgYm9v
dCBwYXJhbWV0ZXINCmZvciBoaWRpbmcgdGhlIGZpbGVzLiBJdCB3aWxsIHByb2JhYmx5IG5v
dCBnZXQgdXNlZCBhIGxvdC4NCg0KDQpKdWVyZ2VuDQo=
--------------bMs6IAiJ0qHlQ232Gl000Eri
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------bMs6IAiJ0qHlQ232Gl000Eri--

--------------Taz6Er9V87gXq4GGMVSXjlwF--

--------------1oylJZz3Ri82TsAanZ0cP0jd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIY4wEFAwAAAAAACgkQsN6d1ii/Ey8O
Bgf9Fvi+qOUQAqs2IAJ1qcBFy6fiqwrI8TQOA8BSZFBYjIKtWwe2kUF1SNTlHM0erSDVgyb5ra36
k0AZ0yt9B75iHh7WwFK+MaLGmfNLSOF4z2+hNdEHODswyFh6+Q6V9E47xR+dswKe2axl8FYEzxTj
QAOxe/v5AK8NiYBCKktqi+qyVHJY7DC8fe7U18+cssmIhOhUmh5TAz95hIpGqZA5qynJrGwBktB8
DjqWElQTrMxrkkElJi4cUji9jItZI7aDqy3ykrtFUnC6w+YN+77UmOY42VkPuBWqAOAiU0fyWQU+
/ShwLwnJSpJw29AGHhL+1wbkfRPZn9v+eHQOQzKjVA==
=eXaV
-----END PGP SIGNATURE-----

--------------1oylJZz3Ri82TsAanZ0cP0jd--

