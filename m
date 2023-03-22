Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B16C4AF2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513423.794380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexpf-0004bA-7A; Wed, 22 Mar 2023 12:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513423.794380; Wed, 22 Mar 2023 12:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexpf-0004YA-43; Wed, 22 Mar 2023 12:44:47 +0000
Received: by outflank-mailman (input) for mailman id 513423;
 Wed, 22 Mar 2023 12:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexpd-0004Y1-VG
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:44:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51990f0c-c8af-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:44:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C45320DA8;
 Wed, 22 Mar 2023 12:44:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8329138E9;
 Wed, 22 Mar 2023 12:44:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kvNJMzr4GmThZAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:44:42 +0000
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
X-Inumbo-ID: 51990f0c-c8af-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679489083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C/oCa3yXpKOebkpxoTvhRp2lRLTV2BjVKWc9Y4UOUH0=;
	b=EdDXAQSmG4wQGl3IfOT+fW1PNuGvdGzaaCW7GUGeLHLBdZ/Aw5DeJQH7y9Vo0NKATErZGD
	jA0Ckc0kvJqr6aEGrPyLytJVYAYuhA3SISwLpDp9QZW8/G/QsHVbwZQPHFyrCorvCx3kzI
	T6gi8G+A4KYgja3BBm3FgaCfUbiPuuA=
Message-ID: <0cf45783-6be2-3f9d-c801-a046e6853405@suse.com>
Date: Wed, 22 Mar 2023 13:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/5] tools: add container_of() macro to
 xen-tools/common-macros.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-2-jgross@suse.com>
 <a0f3d153-5698-3915-0ee8-4a6fd2e82ff6@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a0f3d153-5698-3915-0ee8-4a6fd2e82ff6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rs0viZJc0iqfogXP6TY5DHsG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Rs0viZJc0iqfogXP6TY5DHsG
Content-Type: multipart/mixed; boundary="------------dgGGmtR0JB2ZGKohvJCElGJ3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <0cf45783-6be2-3f9d-c801-a046e6853405@suse.com>
Subject: Re: [PATCH v4 1/5] tools: add container_of() macro to
 xen-tools/common-macros.h
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-2-jgross@suse.com>
 <a0f3d153-5698-3915-0ee8-4a6fd2e82ff6@suse.com>
In-Reply-To: <a0f3d153-5698-3915-0ee8-4a6fd2e82ff6@suse.com>

--------------dgGGmtR0JB2ZGKohvJCElGJ3
Content-Type: multipart/mixed; boundary="------------N25RfDVODptbQGJ0BisEeo4H"

--------------N25RfDVODptbQGJ0BisEeo4H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDMuMjMgMTM6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wMy4yMDIz
IDEzOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94
ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oDQo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi10
b29scy9jb21tb24tbWFjcm9zLmgNCj4+IEBAIC03Niw0ICs3Niw4IEBADQo+PiAgICNkZWZp
bmUgX19tdXN0X2NoZWNrIF9fYXR0cmlidXRlX18oKF9fd2Fybl91bnVzZWRfcmVzdWx0X18p
KQ0KPj4gICAjZW5kaWYNCj4+ICAgDQo+PiArI2RlZmluZSBjb250YWluZXJfb2YocHRyLCB0
eXBlLCBtZW1iZXIpICh7ICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgdHlwZW9mKCAoKHR5
cGUgKikwKS0+bWVtYmVyICkgKl9fbXB0ciA9IChwdHIpOyAgICAgICAgXA0KPj4gKyAgICAo
dHlwZSAqKSggKGNoYXIgKilfX21wdHIgLSBvZmZzZXRvZih0eXBlLG1lbWJlcikgKTt9KQ0K
PiANCj4gQ2FuIHRoZSB2YXJpYW50IHVzZWQgaGVyZSBwbGVhc2UgYmUgY2xvc2VyIHRvIC4u
Lg0KPiANCj4+IC0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5o
DQo+PiArKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2LWVtdWxhdGUuaA0KPj4g
QEAgLTU2LDExICs1Niw2IEBADQo+PiAgIA0KPj4gICAjZGVmaW5lIGNmX2NoZWNrIC8qIE5v
IENvbnRyb2wgRmxvdyBJbnRlZ3JpeSBjaGVja2luZyAqLw0KPj4gICANCj4+IC0jZGVmaW5l
IGNvbnRhaW5lcl9vZihwdHIsIHR5cGUsIG1lbWJlcikgKHsgICAgICAgICAgICAgXA0KPj4g
LSAgICB0eXBlb2YoKCh0eXBlICopMCktPm1lbWJlcikgKm1wdHJfXyA9IChwdHIpOyAgICAg
ICBcDQo+PiAtICAgICh0eXBlICopKChjaGFyICopbXB0cl9fIC0gb2Zmc2V0b2YodHlwZSwg
bWVtYmVyKSk7IFwNCj4+IC19KQ0KPiANCj4gLi4uIHRoaXMgcmF0aGVyIHRoYW4gLi4uDQo+
IA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUvbGlzdC5oDQo+PiArKysgYi90b29scy94ZW5z
dG9yZS9saXN0LmgNCj4+IEBAIC0zLDYgKzMsOCBAQA0KPj4gICAvKiBUYWtlbiBmcm9tIExp
bnV4IGtlcm5lbCBjb2RlLCBidXQgZGUta2VybmVsaXplZCBmb3IgdXNlcnNwYWNlLiAqLw0K
Pj4gICAjaW5jbHVkZSA8c3RkZGVmLmg+DQo+PiAgIA0KPj4gKyNpbmNsdWRlIDx4ZW4tdG9v
bHMvY29tbW9uLW1hY3Jvcy5oPg0KPj4gKw0KPj4gICAjdW5kZWYgTElTVF9IRUFEX0lOSVQN
Cj4+ICAgI3VuZGVmIExJU1RfSEVBRA0KPj4gICAjdW5kZWYgSU5JVF9MSVNUX0hFQUQNCj4+
IEBAIC0xNSwxMCArMTcsNiBAQA0KPj4gICAjZGVmaW5lIExJU1RfUE9JU09OMSAgKCh2b2lk
ICopIDB4MDAxMDAxMDApDQo+PiAgICNkZWZpbmUgTElTVF9QT0lTT04yICAoKHZvaWQgKikg
MHgwMDIwMDIwMCkNCj4+ICAgDQo+PiAtI2RlZmluZSBjb250YWluZXJfb2YocHRyLCB0eXBl
LCBtZW1iZXIpICh7CQkJXA0KPj4gLSAgICAgICAgdHlwZW9mKCAoKHR5cGUgKikwKS0+bWVt
YmVyICkgKl9fbXB0ciA9IChwdHIpOwlcDQo+PiAtICAgICAgICAodHlwZSAqKSggKGNoYXIg
KilfX21wdHIgLSBvZmZzZXRvZih0eXBlLG1lbWJlcikgKTt9KQ0KPiANCj4gLi4uIHRoaXMs
IGJvdGggZm9ybWF0dGluZy13aXNlIChleGNlc3MgYmxhbmtzKSBhbmQgbG9jYWwtdmFyaWFi
bGUtDQo+IG5hbWluZy13aXNlICh0cmFpbGluZyB1bmRlcnNjb3JlcyBpbnN0ZWFkIG9mIGxl
YWRpbmcgb25lcyk/IChJZiBJIHdhcw0KPiB0aGUgb25lIHRvIGNvbW1pdCB0aGlzLCBJJ2Qg
YmUgaGFwcHkgdG8gbWFrZSB0aGUgYWRqdXN0bWVudCBhdCB0aGF0DQo+IHRpbWUuKSBUaGVu
DQoNClllcywgYWJzb2x1dGVseSBmaW5lIHdpdGggbWUuDQoNCj4gQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg0K

--------------N25RfDVODptbQGJ0BisEeo4H
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------N25RfDVODptbQGJ0BisEeo4H--

--------------dgGGmtR0JB2ZGKohvJCElGJ3--

--------------Rs0viZJc0iqfogXP6TY5DHsG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQa+DoFAwAAAAAACgkQsN6d1ii/Ey+j
fAf/dmCODp5nod5pf/LVA/WVUuutSHho9n7/5pLC/YZYvdaScVuRX8L7wMDRFALQk0UItUYZQe0B
5Ls5MQc7G5Fd81APsXcY8nps8LE958LUBdgYYuK9/LJDoUzYoghbJiFAq65v3ASaIsqINVptiLdM
0jXMedNomY4Qo9bUycwCBOmtdfaRod6cAVTt8fnt+vYEjdYGbQDVBv8J/wLuf/Smq5bN4lnKCDd9
Wj8a5DWoMf0+PFV2D+2SGxGp4ckEyCC0C8HUcfvO4LfV8s1XtTnrBwYVXrG3IizQjtbmpUqgWEwS
4F3pu3Ee7xpPYzGXef/e8VAPWBhpIfsjO4P3/LolbA==
=EeBc
-----END PGP SIGNATURE-----

--------------Rs0viZJc0iqfogXP6TY5DHsG--

