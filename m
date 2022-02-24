Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA04C3008
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278437.475687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGEt-0005lI-QD; Thu, 24 Feb 2022 15:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278437.475687; Thu, 24 Feb 2022 15:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGEt-0005iR-Lz; Thu, 24 Feb 2022 15:41:07 +0000
Received: by outflank-mailman (input) for mailman id 278437;
 Thu, 24 Feb 2022 15:41:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNGEr-0005iL-Cp
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:41:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c964266-9588-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 16:41:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A8D31F37C;
 Thu, 24 Feb 2022 15:41:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5035213AFF;
 Thu, 24 Feb 2022 15:41:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b+//EQ+nF2IHZQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Feb 2022 15:41:03 +0000
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
X-Inumbo-ID: 2c964266-9588-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645717263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNDlErUUGn7Wki06GJZwW8Uu96EoZJWASJg9lACDEaY=;
	b=bzi1NAoRCOd1MMXMOHkZOTko86j+HQ54IN5LMOtpHrVq7H+/eFQ7eLpA/uC7ul8HG+Njzh
	tlx50Ds6Y1JwpUvfpxdKoP9tQP6bL19RC+iy5ErZsIDYwkkkrdl8XN9vKWKBQOOOR8Fnz1
	lbV97aDPlqcL+v88lkevgNgHDbbcLW4=
Message-ID: <93d49d5f-29d5-72d1-c00c-ad14fb08b9c4@suse.com>
Date: Thu, 24 Feb 2022 16:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] xen/public: add comment to struct
 xen_mem_acquire_resource
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220224152414.27948-1-jgross@suse.com>
 <9972f96c-d0cc-d9a8-3566-74dbaf7e9e33@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <9972f96c-d0cc-d9a8-3566-74dbaf7e9e33@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rSEb6uvca7yT7sZZZMsniJOQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rSEb6uvca7yT7sZZZMsniJOQ
Content-Type: multipart/mixed; boundary="------------XKqg7b7NN0drSqOeXfvI0SsG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <93d49d5f-29d5-72d1-c00c-ad14fb08b9c4@suse.com>
Subject: Re: [PATCH v3] xen/public: add comment to struct
 xen_mem_acquire_resource
References: <20220224152414.27948-1-jgross@suse.com>
 <9972f96c-d0cc-d9a8-3566-74dbaf7e9e33@suse.com>
In-Reply-To: <9972f96c-d0cc-d9a8-3566-74dbaf7e9e33@suse.com>

--------------XKqg7b7NN0drSqOeXfvI0SsG
Content-Type: multipart/mixed; boundary="------------2EEnrZ1bPYvQxxnxK580JW9c"

--------------2EEnrZ1bPYvQxxnxK580JW9c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjIgMTY6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMi4yMDIy
IDE2OjI0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVi
bGljL21lbW9yeS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgNCj4+
IEBAIC02NjIsNiArNjYyLDEzIEBAIHN0cnVjdCB4ZW5fbWVtX2FjcXVpcmVfcmVzb3VyY2Ug
ew0KPj4gICAgICAgICogdHdvIGNhbGxzLg0KPj4gICAgICAgICovDQo+PiAgICAgICB1aW50
MzJfdCBucl9mcmFtZXM7DQo+PiArICAgIC8qDQo+PiArICAgICAqIFBhZGRpbmcgZmllbGQs
IG11c3QgYmUgemVybyBvbiBpbnB1dC4NCj4+ICsgICAgICogSW4gYSBwcmV2aW91cyB2ZXJz
aW9uIHRoaXMgd2FzIGFuIG91dHB1dCBmaWVsZCB3aXRoIHRoZSBsb3dlc3QNCj4+ICsgICAg
ICogYml0IG5hbWVkIFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQuIEZ1dHVyZSB2ZXJz
aW9ucyBvZiB0aGlzDQo+PiArICAgICAqIGludGVyZmFjZSB3aWxsIG5vdCByZXVzZSB0aGlz
IGJpdCB3aXRoIHRoZSBmaWVsZCBiZWluZyB6ZXJvIG9uDQo+PiArICAgICAqIGlucHV0Lg0K
Pj4gKyAgICAgKi8NCj4+ICAgICAgIHVpbnQzMl90IHBhZDsNCj4gDQo+IERpZCB5b3UgbWVh
biAiLi4uIGJlaW5nIG5vbi16ZXJvIC4uLiIgYW5kICJiaXQiIGFuZCAiZmllbGQiIGNoYW5n
aW5nDQo+IHBvc2l0aW9ucz8NCg0KTm8sIHdoeT8gVGhlIGN1cnJlbnQgTGludXgga2VybmVs
IHdpbGwgc2V0IHBhZCAodGhlICJmaWVsZCIpIHRvIHplcm8NCndoZW4gZG9pbmcgdGhlIGh5
cGVyY2FsbCwgYW5kIGl0IGV4cGVjdHMgdGhlIGJpdCB0byBiZSBzZXQgb3Igbm90IG9uDQpy
ZXR1cm4uIFRoaXMgbWVhbnMgdGhhdCB0aGUgYml0IGlzIHJlc2VydmVkIGZvciB0aGUgY2Fz
ZSB0aGF0IHBhZA0Kd2FzIHplcm8gb24gaW5wdXQuDQoNCg0KSnVlcmdlbg0KDQo=
--------------2EEnrZ1bPYvQxxnxK580JW9c
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2EEnrZ1bPYvQxxnxK580JW9c--

--------------XKqg7b7NN0drSqOeXfvI0SsG--

--------------rSEb6uvca7yT7sZZZMsniJOQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIXpw4FAwAAAAAACgkQsN6d1ii/Ey+j
5wgAlSgxXguNNU04gqqv7MWuqLWz5R6EcgLtfjQxrGgfpwLT73QLA1UNXZzd0leDqMr3YeM0fCpk
jMElFvg7nAd/VAQHkFPycV6KNGc76P6J0Xj6mzuKQsXg1XzFMvDMe7s4+cmK1nHZQQC/86fQNtes
MT3OPg/UE2/Aqlb5q29pNqioA0LO3lqkQRkKTcFrRDyYqPtzE2bsgPLMUOtcEZIlGElcfUfHn1FI
a8P0MDUtvwoOOzk0yfzQEE2VHznQwLojGAY+03G3DIrssq/WlD1uf8kpFkaTQV19lPk+Bs7XW1z4
Qcy/VXfTDbEVSQ8kGuU73UjeJ71HYNYHAca3zGpBoA==
=cSpV
-----END PGP SIGNATURE-----

--------------rSEb6uvca7yT7sZZZMsniJOQ--

