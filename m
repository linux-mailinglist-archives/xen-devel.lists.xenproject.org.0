Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDBC680C71
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486937.754380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSey-0002rp-O2; Mon, 30 Jan 2023 11:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486937.754380; Mon, 30 Jan 2023 11:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSey-0002ov-LG; Mon, 30 Jan 2023 11:49:16 +0000
Received: by outflank-mailman (input) for mailman id 486937;
 Mon, 30 Jan 2023 11:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMSex-0002op-Nm
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:49:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d94d574-a094-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:49:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E36E21FE4C;
 Mon, 30 Jan 2023 11:49:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97E5513444;
 Mon, 30 Jan 2023 11:49:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tuy8I7eu12MsLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 11:49:11 +0000
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
X-Inumbo-ID: 1d94d574-a094-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675079351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9prjl4m2Rk4B/GytnuBQOODd9ZaELhm9GsrZsLQeA9o=;
	b=V9ceniBLf0wNyjL1WvYpGMR2kytNJULJiF54/AxX8WWBsliZNe91/s/DbTngX61twPdz/M
	fnQsNhdUhWYumdog3kUQXNxvH9bGMx+zUmkeH2ifHmO+nFp3oDTpGYJuo7hs8YoRzhHo3M
	e+3+/0rAeMkkXe/bBV9f1/VKrJ5z2hc=
Message-ID: <e1943855-729e-8bb2-4af2-138be84c0576@suse.com>
Date: Mon, 30 Jan 2023 12:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dF3i0ecysf9AJQWulpeQ63FA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dF3i0ecysf9AJQWulpeQ63FA
Content-Type: multipart/mixed; boundary="------------Fh3fGTKT3p6uwLn90hBgyw5R";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
Message-ID: <e1943855-729e-8bb2-4af2-138be84c0576@suse.com>
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
In-Reply-To: <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>

--------------Fh3fGTKT3p6uwLn90hBgyw5R
Content-Type: multipart/mixed; boundary="------------uaeY0p00u1ACrQlFUO184YnO"

--------------uaeY0p00u1ACrQlFUO184YnO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjMgMTI6MzUsIE9sZWtzaWkgd3JvdGU6DQo+IEhpIEp1bGllbiwNCj4gT24g
RnJpLCAyMDIzLTAxLTI3IGF0IDE2OjAyICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
PiBIaSBPbGVrc2lpLA0KPj4NCj4+IE9uIDI3LzAxLzIwMjMgMTM6NTksIE9sZWtzaWkgS3Vy
b2Noa28gd3JvdGU6DQo+Pj4gVGhlIHBhdGNoIGludHJvZHVjZXMgbWFjcm9zOiBCVUcoKSwg
V0FSTigpLCBydW5faW5fZXhjZXB0aW9uKCksDQo+Pj4gYXNzZXJ0X2ZhaWxlZC4NCj4+Pg0K
Pj4+IFRoZSBpbXBsZW1lbnRhdGlvbiB1c2VzICJlYnJlYWsiIGluc3RydWN0aW9uIGluIGNv
bWJpbmF0aW9uIHdpdGgNCj4+PiBkaWZmcmVudCBidWcgZnJhbWUgdGFibGVzIChmb3IgZWFj
aCB0eXBlKSB3aGljaCBjb250YWlucyB1c2VmdWwNCj4+PiBpbmZvcm1hdGlvbi4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29A
Z21haWwuY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5nZXM6DQo+Pj4gIMKgwqAgLSBSZW1vdmUg
X18gaW4gZGVmaW5lIG5hbWluZ3MNCj4+PiAgwqDCoCAtIFVwZGF0ZSBydW5faW5fZXhjZXB0
aW9uX2hhbmRsZXIoKSB3aXRoDQo+Pj4gIMKgwqDCoMKgIHJlZ2lzdGVyIHZvaWQgKmZuXyBh
c20oX19zdHJpbmdpZnkoQlVHX0ZOX1JFRykpID0gKGZuKTsNCj4+PiAgwqDCoCAtIFJlbW92
ZSBidWdfaW5zdHJfdCB0eXBlIGFuZCBjaGFuZ2UgaXQncyB1c2FnZSB0byB1aW50MzJfdA0K
Pj4+IC0tLQ0KPj4+ICDCoCB4ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9idWcuaCB8IDEx
OA0KPj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiAgwqAgeGVuL2FyY2gv
cmlzY3YvdHJhcHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTI4DQo+Pj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4+ICDCoCB4ZW4vYXJjaC9yaXNjdi94ZW4ubGRz
LlPCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArKysNCj4+PiAgwqAgMyBmaWxlcyBjaGFuZ2Vk
LCAyNTYgaW5zZXJ0aW9ucygrKQ0KPj4+ICDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYnVnLmgNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9idWcuaA0KPj4+IGIveGVuL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYnVnLmgNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAw
MDAwMDAwMDAuLjRiMTVkOGViYTYNCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIveGVu
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYnVnLmgNCj4+PiBAQCAtMCwwICsxLDExOCBAQA0K
Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPj4+ICsvKg0K
Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTIgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBv
ZiBDYWxpZm9ybmlhDQo+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyMS0yMDIzIFZhdGVzDQo+
Pg0KPj4gSSBoYXZlIHRvIHF1ZXN0aW9uIHRoZSB0d28gY29weXJpZ2h0cyBoZXJlIGdpdmVu
IHRoYXQgdGhlIG1ham9yaXR5IG9mDQo+PiB0aGUgY29kZSBzZWVtcyB0byBiZSB0YWtlbiBm
cm9tIHRoZSBhcm0gaW1wbGVtZW50YXRpb24gKHNlZQ0KPj4gYXJjaC9hcm0vaW5jbHVkZS9h
c20vYnVnLmgpLg0KPj4NCj4+IFdpdGggdGhhdCBzYWlkLCB3ZSBzaG91bGQgY29uc29saWRh
dGUgdGhlIGNvZGUgcmF0aGVyIHRoYW4NCj4+IGR1cGxpY2F0aW5nDQo+PiBpdCBvbiBldmVy
eSBhcmNoaXRlY3R1cmUuDQo+Pg0KPiBDb3B5cmlnaHRzIHNob3VsZCBiZSByZW1vdmVkLiBU
aGV5IHdlcmUgdGFrZW4gZnJvbSB0aGUgcHJldmlvdXMNCj4gaW1wbGVtZW50YXRpb24gb2Yg
YnVnLmggZm9yIFJJU0MtViBzbyBJIGp1c3QgZm9yZ290IHRvIHJlbW92ZSB0aGVtLg0KPiAN
Cj4gSXQgbG9va3MgbGlrZSB3ZSBzaG91bGQgaGF2ZSBjb21tb24gYnVnLmggZm9yIEFSTSBh
bmQgUklTQ1YgYnV0IEkgYW0NCj4gbm90IHN1cmUgdGhhdCBJIGtub3cgaG93IHRvIGRvIHRo
YXQgYmV0dGVyLg0KPiBQcm9iYWJseSB0aGUgY29kZSB3YW50cyB0byBiZSBtb3ZlZCB0byB4
ZW4vaW5jbHVkZS9idWcuaCBhbmQgdXNpbmcNCj4gaWZkZWYgQVJNICYmIFJJU0NWIC4uLg0K
PiBCdXQgc3RpbGwgSSBhbSBub3Qgc3VyZSB0aGF0IHRoaXMgaXMgdGhlIGJlc3Qgb25lIG9w
dGlvbiBhcyBhdCBsZWFzdCB3ZQ0KPiBoYXZlIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBm
b3IgeDg2XzY0Lg0KDQpUaGVyZSBhcmUgYWxyZWFkeSBhIGxvdCBvZiBkdXBsaWNhdGVkICNk
ZWZpbmVzIGluIHRoZSBBcm0gYW5kIHg4NiBhc20vYnVnLmgNCmZpbGVzLg0KDQpJJ2QgY3Jl
YXRlIHhlbi9pbmNsdWRlL3hlbi9idWcuaCBpbmNsdWRpbmcgYXNtL2J1Zy5oIGZpcnN0IGFu
ZCB0aGVuIGFkZGluZw0KYWxsIHRoZSBjb21tb24gc3R1ZmYuDQoNCkluIGNhc2UgMiBhcmNo
cyBhcmUgc2hhcmluZyBzb21lICNkZWZpbmUgRk9PIHlvdSBjb3VsZCAjZGVmaW5lIEZPTyBp
biB0aGUNCmFzbS9idWcuaCBmb3IgdGhlIGFyY2ggbm90IHVzaW5nIHRoZSBjb21tb24gZGVm
aW5pdGlvbiBhbmQgZG8gI2lmbmRlZiBGT08NCmluIHhlbi9pbmNsdWRlL3hlbi9idWcuaCBh
cm91bmQgdGhlIHZhcmlhbnQgc2hhcmVkIGJ5IHRoZSBvdGhlciBhcmNocy4NCg0KDQpKdWVy
Z2VuDQoNCg==
--------------uaeY0p00u1ACrQlFUO184YnO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uaeY0p00u1ACrQlFUO184YnO--

--------------Fh3fGTKT3p6uwLn90hBgyw5R--

--------------dF3i0ecysf9AJQWulpeQ63FA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPXrrcFAwAAAAAACgkQsN6d1ii/Ey/F
rwf/W8rz5wC0ViUsGPe7ppRiONsesYMT87n/Je70W7N9rNImTqj1uZ1JLz2KiSm/iOotNJ7uN++Z
ZZnYOYERa+552som3MARe8vFPRuRBRbtsmsVXZiFx9b4gFZBTWCdJPdajP2Kxo+59PMK6jE0de59
I056LEJX7oTTvirnhOXnwUHQ8X+RyGzzKkTjrAve9GO57k2Q347OGcPJ/Xq0vl4MfyTHf8X6hg3l
NLe6Cf9tY0UkJBXTJXrPHxPDUWikkHppVg9xz5kxzhFfUmGRMVRLzGJQSPBzY3dVfxLT0BPaMz0I
ZDiBNdS1ZylQ1JpzXNEN71NqDCU9WdqovyO2cH32Rw==
=lFZI
-----END PGP SIGNATURE-----

--------------dF3i0ecysf9AJQWulpeQ63FA--

