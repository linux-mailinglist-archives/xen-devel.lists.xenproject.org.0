Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B655FD24
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357775.586573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Uwx-0002e6-S4; Wed, 29 Jun 2022 10:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357775.586573; Wed, 29 Jun 2022 10:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Uwx-0002bC-P7; Wed, 29 Jun 2022 10:29:35 +0000
Received: by outflank-mailman (input) for mailman id 357775;
 Wed, 29 Jun 2022 10:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o6Uww-0002b6-97
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:29:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d68e7c9-f796-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 12:29:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01E641FEF9;
 Wed, 29 Jun 2022 10:29:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7481132C0;
 Wed, 29 Jun 2022 10:29:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iNU2M4wpvGKUIQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Jun 2022 10:29:32 +0000
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
X-Inumbo-ID: 5d68e7c9-f796-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656498573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiIzUnp80qj7odxnRHFL40W1UZOBVwV1YdzoZJs4SZs=;
	b=hlsRi9gv44N+ZGp/b4w8rsC1455WCuHOZMQwbZKLIDSx5oujn65TuBH68q+vOWC2DjAfg4
	sU1cWVZD/vdVk8raG06qgakcIGOS654Ogwav+n/eG3c8ebFWsxydjYa3J/zPOZKOLEPJdK
	ALu0p8S9Z5ItcfM3VZR+T2rCX+8EmV8=
Message-ID: <ec3487df-bf54-cf99-71c3-bddf296fa1bb@suse.com>
Date: Wed, 29 Jun 2022 12:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v3 19/25] tools: Introduce $(xenlibs-ldlibs, ) macro
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-20-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220624160422.53457-20-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ofYjV57i3RDAhuvTKJuvPH49"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ofYjV57i3RDAhuvTKJuvPH49
Content-Type: multipart/mixed; boundary="------------jcZwaMb0vRvGbj93Acdx15XK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Message-ID: <ec3487df-bf54-cf99-71c3-bddf296fa1bb@suse.com>
Subject: Re: [XEN PATCH v3 19/25] tools: Introduce $(xenlibs-ldlibs, ) macro
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-20-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-20-anthony.perard@citrix.com>

--------------jcZwaMb0vRvGbj93Acdx15XK
Content-Type: multipart/mixed; boundary="------------TD8v8nF6KcHcVTopEY9IoxmX"

--------------TD8v8nF6KcHcVTopEY9IoxmX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjIgMTg6MDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBUaGlzIGNhbiBi
ZSB1c2VkIHdoZW4gbGlua2luZyBhZ2FpbnN0IG11bHRpcGxlIGluLXRyZWUgWGVuIGxpYnJh
cmllcywNCj4gYW5kIGF2b2lkIGR1cGxpY2F0ZWQgZmxhZ3MuIEl0IGNhbiBiZSB1c2VkIGlu
c3RlYWQgb2YgbXVsdGlwbGUNCj4gJChMRExJQlNfbGlieGVuKikuDQo+IA0KPiBGb3Igbm93
LCByZXBsYWNlIHRoZSBvcGVuLWNvZGluZyBpbiBsaWJzLm1rLg0KPiANCj4gVGhlIG1hY3Jv
ICQoeGVubGlicy1saWJzLCApIHdpbGwgYmUgdXNlZnVsIGxhdGVyIHdoZW4gb25seSB0aGUg
cGF0aCB0bw0KPiB0aGUgbGlicmFyaWVzIGlzIHdhbnRlZCAoZS5nLiBmb3IgY2hlY2tpbmcg
Zm9yIGRlcGVuZGVuY2llcykuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------TD8v8nF6KcHcVTopEY9IoxmX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TD8v8nF6KcHcVTopEY9IoxmX--

--------------jcZwaMb0vRvGbj93Acdx15XK--

--------------ofYjV57i3RDAhuvTKJuvPH49
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK8KYwFAwAAAAAACgkQsN6d1ii/Ey+B
Fwf+PgyPF986RcKTLU2DcbJGhVd6WyEqwHvTcE5tXMPMuu+WqM7oFjHi1wm1UD0IJYXyl4tyS28D
QTyK6OisF3uyQSb8VzKvDfjfogm6dBLm5rsTz1vWKfoAQdVoUY/UpEUX0d3UkrKG4JGnX7pAd5Vu
Pbl0g8qwt8UCFXcu/hWrsL8Jj34CBPOQekyRVAMRiAoDaYeG6dwH4JdoZR59lSe9kaByWGk5eD/E
OozC3HIqglMdDhjgEuP350hPK5TbIP6zKSa5KKrPBqVw5yfLEponUak2wgSfC76Jdaqb+M/pB0XA
dEvUkB3wiSr8RuIU/hPAHysAmn9P467SkDoH2tQg9g==
=D6jH
-----END PGP SIGNATURE-----

--------------ofYjV57i3RDAhuvTKJuvPH49--

