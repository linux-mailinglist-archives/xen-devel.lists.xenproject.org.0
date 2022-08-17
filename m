Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5032596887
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 07:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388684.625412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOBR9-0004eW-Kb; Wed, 17 Aug 2022 05:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388684.625412; Wed, 17 Aug 2022 05:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOBR9-0004b8-Hh; Wed, 17 Aug 2022 05:17:51 +0000
Received: by outflank-mailman (input) for mailman id 388684;
 Wed, 17 Aug 2022 05:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vp8f=YV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oOBR7-0004b2-KL
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 05:17:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eecef93d-1deb-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 07:17:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A4021F932;
 Wed, 17 Aug 2022 05:17:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 508E713A8E;
 Wed, 17 Aug 2022 05:17:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 01YsEvt5/GInFgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 17 Aug 2022 05:17:47 +0000
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
X-Inumbo-ID: eecef93d-1deb-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660713467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9FIB9APHyvxcz6qG/MJTSvpExkiHlko1fC+3c1KxFWQ=;
	b=mVpsH3foPRGr4EE4woNjKiZGwf5ZGXLLJ2XLYkA3Tu5fhAhbN56fc8DIvr5rfTs/QvIAYd
	Eck+hNkRdQiT+zlfVJxhxBdeUmc/02ct/0QTUMz4LUdijPwsV451XxZdxuC1wu0Iz2rPbh
	77CVU0SXX4/lsYELEhac6EIRcEq2HK4=
Message-ID: <17a94dba-e5ba-3678-5376-4a236ec1fabe@suse.com>
Date: Wed, 17 Aug 2022 07:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 jbeulich@suse.com, wl@xen.org, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
 <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
 <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
 <db2ee8d6-a58a-20d1-bed6-72885cbd9268@suse.com>
 <alpine.DEB.2.22.394.2208161244170.3790@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2208161244170.3790@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZFuBw4MUFiw7xAZLgXgWIG5d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZFuBw4MUFiw7xAZLgXgWIG5d
Content-Type: multipart/mixed; boundary="------------HQJFfy2k30yYI6LZaz7A9w8U";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 jbeulich@suse.com, wl@xen.org, roger.pau@citrix.com
Message-ID: <17a94dba-e5ba-3678-5376-4a236ec1fabe@suse.com>
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
 <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
 <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
 <db2ee8d6-a58a-20d1-bed6-72885cbd9268@suse.com>
 <alpine.DEB.2.22.394.2208161244170.3790@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2208161244170.3790@ubuntu-linux-20-04-desktop>

--------------HQJFfy2k30yYI6LZaz7A9w8U
Content-Type: multipart/mixed; boundary="------------LbeLag3L2ymVrthKetEXdNxW"

--------------LbeLag3L2ymVrthKetEXdNxW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDguMjIgMjE6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVHVl
LCAxNiBBdWcgMjAyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDE1LjA4LjIyIDIy
OjMyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gKyBYZW4gbWFpbnRhaW5lcnMg
YW5kIGNvbW1pdHRlcnMNCj4+Pg0KPj4+DQo+Pj4gRm9yIGNvbnRleHQsIEkgd3JvdGUgYSBw
YXRjaCB0byBpbnRyb2R1Y2UgU1BEWCB0YWdzIHN0YXJ0aW5nIGZyb20NCj4+PiBhcmNoL2Fy
bS8qLmMuDQo+Pg0KPj4gRG9uJ3Qgd2Ugd2FudCBzb21ldGhpbmcgbGlrZSB0aGUga2VybmVs
J3MgTElDRU5TRVMgZGlyZWN0b3J5IGluIG9yZGVyIHRvDQo+PiBoYXZlIHNvbWV0aGluZyB0
aGUgU1BEWCBsaW5lcyByZWZlciB0bz8gQ09QWUlORyBzaG91bGQgbWF5YmUgYWRhcHRlZCwg
dG9vLg0KPiANCj4gSSBkb24ndCBrbm93IGlmIHdlIG5lZWQgdG8gZ28gYXMgZmFyIGFzIHRo
ZSBMSUNFTlNFUyBkaXJlY3RvcnkuIEZvcg0KPiBleGFtcGxlLCBaZXBoeXIgZG9lc24ndCBo
YXZlIGFueXRoaW5nIG9mIHRoZSBzb3J0IEFGQUlDVC4gQnV0IG1heWJlIGl0DQo+IGlzIGNs
ZWFuZXIgdG8gaGF2ZSBpdD8NCg0KSSB3b3VsZCB0aGluayBzby4NCg0KPiBGb3IgdGhlIGh5
cGVydmlzb3IsIEdQTC0yLjAgYW5kIEdQTC0yLjAtb3ItbGF0ZXIgYXJlIHRoZSBvbmVzIHRo
YXQgYXJlDQo+IHJlbGV2YW50IHNvIHdlIHdvdWxkIG9ubHkgbmVlZCBMSUNFTlNFUy9wcmVm
ZXJyZWQvR1BMLTIuMCBpbml0aWFsbHk/DQoNCkkgZG9uJ3QgdGhpbmsgd2UgcmVhbGx5IG5l
ZWQgdGhlICJwcmVmZXJyZWQiIGRpcmVjdG9yeSBsZXZlbC4NCg0KQW5kIEkgZG8gdGhpbmsg
dGhhdCBhdCBsZWFzdCBpbiB0aGUgaW5jbHVkZS9wdWJsaWMgZGlyZWN0b3J5IHdlIGhhdmUg
bWFueQ0KZmlsZXMgd2l0aCBNSVQgbGljZW5zZS4gVGhlcmUgbWlnaHQgYmUgQlNEIG9uZXMg
YXQgb3RoZXIgcGxhY2VzLCB0b28uDQoNCg0KSnVlcmdlbg0KDQo=
--------------LbeLag3L2ymVrthKetEXdNxW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------LbeLag3L2ymVrthKetEXdNxW--

--------------HQJFfy2k30yYI6LZaz7A9w8U--

--------------ZFuBw4MUFiw7xAZLgXgWIG5d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL8efoFAwAAAAAACgkQsN6d1ii/Ey8B
qAgAgvsb0iMwx7jaIVDmxCdW8TWE66/McEPK45x03AXWl3eE9Mv6wCzUxKDkBW341yoiWBT2oH4U
H2ZsqXmUD7FLw3+Zzuz6rbKJtNbYVhHERk4nYOxJGjcVqtG2nOejvbrbqNz6tsD01AcVjRgoeP9y
g9SFVDJdklGCcdPum2rmqLDnXso8nxaUj/0iCCopZlZlbCLS97SFjBcbrFq1ZyxMGnXTdfbUC/9/
X5KVlCvsqfUEupUrxTQTny9WRfhr/LLbushYrE0nYRPq1aUFZuclWl4jbvchVrr7NGcx5mr8MwBV
MKns1r7ctfMlzoZ9vGvPfu0hQqjw9r2STA4EbT4yhg==
=zGYa
-----END PGP SIGNATURE-----

--------------ZFuBw4MUFiw7xAZLgXgWIG5d--

