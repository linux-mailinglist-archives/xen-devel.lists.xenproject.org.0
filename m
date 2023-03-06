Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626926AB6C5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506658.779748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ4xA-0003gy-2C; Mon, 06 Mar 2023 07:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506658.779748; Mon, 06 Mar 2023 07:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ4x9-0003e6-Vb; Mon, 06 Mar 2023 07:08:11 +0000
Received: by outflank-mailman (input) for mailman id 506658;
 Mon, 06 Mar 2023 07:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ4x8-0003dy-Gl
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:08:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6557a0b-bbed-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:08:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D48D821A3C;
 Mon,  6 Mar 2023 07:08:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1D5313513;
 Mon,  6 Mar 2023 07:08:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gX5GJliRBWRzJQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:08:08 +0000
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
X-Inumbo-ID: a6557a0b-bbed-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678086488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GxnEcqxtAuM7DCHjX6Aj+nxa2Y99uuDgnDC9yGlaTf8=;
	b=Q6h3AzueJA2LsHjC0dFuHURbb3o+LrqUAIm0T9rEFmgznEbHPf56aDLg3b787jpT974SlA
	nl5hD2Vg809qAb1s81Mt7E18edaY9sKHAOi64wBgNEM6O0gpHdFCOqDyMIveldFuCxr7Mi
	gdM0kG8tQzKMa8hERYc3NCVqyXRebDY=
Message-ID: <21357fda-9e22-d46e-17c2-81b72b76ea59@suse.com>
Date: Mon, 6 Mar 2023 08:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] tools: add offsetof() to xen-tools/common-macros.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-5-jgross@suse.com>
 <8a0a2cb9-17e9-31c3-5876-cdfcc669ddc4@suse.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8a0a2cb9-17e9-31c3-5876-cdfcc669ddc4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tMm1yFFimv9NaxGmcABv9nzx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tMm1yFFimv9NaxGmcABv9nzx
Content-Type: multipart/mixed; boundary="------------46HIhK00EMfhtfl8OI6tQ8wQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <21357fda-9e22-d46e-17c2-81b72b76ea59@suse.com>
Subject: Re: [PATCH v2 4/4] tools: add offsetof() to xen-tools/common-macros.h
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-5-jgross@suse.com>
 <8a0a2cb9-17e9-31c3-5876-cdfcc669ddc4@suse.com>
In-Reply-To: <8a0a2cb9-17e9-31c3-5876-cdfcc669ddc4@suse.com>

--------------46HIhK00EMfhtfl8OI6tQ8wQ
Content-Type: multipart/mixed; boundary="------------mEKhpf2TyHgRog5cm7pwQTaT"

--------------mEKhpf2TyHgRog5cm7pwQTaT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDIuMjMgMTY6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wMi4yMDIz
IDE2OjQxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUv
aW5jbHVkZS9zdGRkZWYuaA0KPj4gKysrIGIvdG9vbHMvZmlybXdhcmUvaW5jbHVkZS9zdGRk
ZWYuaA0KPj4gQEAgLTEsMTAgKzEsMTAgQEANCj4+ICAgI2lmbmRlZiBfU1REREVGX0hfDQo+
PiAgICNkZWZpbmUgX1NURERFRl9IXw0KPj4gICANCj4+ICsjaW5jbHVkZSA8eGVuLXRvb2xz
L2NvbW1vbi1tYWNyb3MuaD4NCj4+ICsNCj4+ICAgdHlwZWRlZiBfX1NJWkVfVFlQRV9fIHNp
emVfdDsNCj4+ICAgDQo+PiAgICNkZWZpbmUgTlVMTCAoKHZvaWQqKTApDQo+PiAgIA0KPj4g
LSNkZWZpbmUgb2Zmc2V0b2YodCwgbSkgX19idWlsdGluX29mZnNldG9mKHQsIG0pDQo+PiAt
DQo+PiAgICNlbmRpZg0KPiANCj4gVGhlIEMgc3RhbmRhcmQgaXMgcHJldHR5IHNwZWNpZmlj
IGFib3V0IHdoYXQgYSBoZWFkZXIgb2YgdGhpcyBuYW1lDQo+IG1heSBvciAoaW4gcGFydGlj
dWxhciBoZXJlKSBtYXkgbm90IGRlZmluZS4gWW91IGFkZCBtdWNoIG1vcmUgdG8gdGhlDQo+
IG5hbWUgc3BhY2UgdGhhbiBqdXN0IHRoZSByZXBsYWNlbWVudCBvZmZzZXRvZigpLiBJZiB0
aGlzIHdhcyBhDQo+IGhlYWRlciB1c2VkIGJ5IGFuIGluZGl2aWR1YWwgY29tcG9uZW50LCB0
aGlzIG1pZ2h0IGJlIGZpbmUuIEJ1dCB0aGlzDQo+IGhlYWRlciBpcyBtZWFudCB0byBzZXJ2
ZSBhbGwgY29tcG9uZW50cyB1bmRlciBmaXJtd2FyZS8gd2hpY2ggY2FyZQ0KPiB0byBpbmNs
dWRlIGl0LiBBdCBwcmVzZW50IHRoYXQncyBodm1sb2FkZXIgKHdoaWNoIHdlIGNvbnRyb2ws
IHNvIHdlDQo+IGNhbiBhcnJhbmdlIGZvciBpdCB0byBiZSBmcmVlIG9mIGNvbGxpc2lvbnMp
IGFuZCByb21iaW9zICh3aGljaCB3ZQ0KPiBkbyBub3QgcmVhbGx5IGNvbnRyb2wsIGFuZCB3
aGljaCBwZW9wbGUgYWxzbyBtYXkgbm90IGJ1aWxkIHJvdXRpbmVseQ0KPiBhbnltb3JlKS4N
Cg0KR29vZCBwb2ludC4NCg0KSSBoYXZlIHZlcmlmaWVkIHRoYXQgdGhlIGJ1aWxkIGlzIHN0
aWxsIHN1Y2NlZWRpbmcgd2l0aG91dCB0aGUgbW9kaWZpY2F0aW9uDQpvZiB0b29scy9maXJt
d2FyZS9pbmNsdWRlL3N0ZGRlZi5oLCBzbyBJJ2xsIGRyb3AgdGhpcyBodW5rLg0KDQoNCkp1
ZXJnZW4NCg0K
--------------mEKhpf2TyHgRog5cm7pwQTaT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mEKhpf2TyHgRog5cm7pwQTaT--

--------------46HIhK00EMfhtfl8OI6tQ8wQ--

--------------tMm1yFFimv9NaxGmcABv9nzx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQFkVgFAwAAAAAACgkQsN6d1ii/Ey+k
xwf9FyAuK9EHmk6KlgL7JX9LZqRFMMaKAjG+c1pnuU9mBoKce/9HJ80Y7GyR3/rSkw5EjujWH8jk
SferJLgdLbb6ahpAWJpc5ZF3lMf+3y4LlVaFLftp2oXVxtIe8R7j9GAD8eppT967rvPo5Vn5lDfi
qSEzmnTM6Js9F0o9g1UTrkutzFe4X/7CN8wYSC82XojuuB5AG8ipmsc1SNg1A2nkp/SvWdl1zMNC
bWMTuYQcHi0+sdBuiRm+KGyIcFObCMNskuEP18anBkU6/kMm8dHwZUHOIiekiYLc1/3Ss0nQPcpv
8vJFYR8+HOMJn7gBYNhlvZFUR2ZbhKSUfi00v2N15g==
=5Bg/
-----END PGP SIGNATURE-----

--------------tMm1yFFimv9NaxGmcABv9nzx--

