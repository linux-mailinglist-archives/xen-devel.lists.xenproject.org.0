Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ED5631B88
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 09:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446440.702027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox2G4-0003uG-Nd; Mon, 21 Nov 2022 08:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446440.702027; Mon, 21 Nov 2022 08:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox2G4-0003r1-KQ; Mon, 21 Nov 2022 08:34:28 +0000
Received: by outflank-mailman (input) for mailman id 446440;
 Mon, 21 Nov 2022 08:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gx0o=3V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ox2G3-0003qc-PJ
 for xen-devel@lists.xen.org; Mon, 21 Nov 2022 08:34:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e889e55-6977-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 09:34:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0158A21D61;
 Mon, 21 Nov 2022 08:34:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAA9E1376E;
 Mon, 21 Nov 2022 08:34:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ur7qLxE4e2O0TgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Nov 2022 08:34:25 +0000
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
X-Inumbo-ID: 4e889e55-6977-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669019666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAYfXQcdNToH3FWmAOzlk7EzYDNtXqlvFgsSgsh+wOU=;
	b=rceGxtU8LHhCfWjY4R6lHBmG8RVOi5PVGAV2FbcihDgo2YFJl491yP6cJbNc8rYm+APihF
	njCskZ/a4A90eRiSyTE51ITCfSmQGIq9QSW3nSxviwBokkoa7HYVPT4Ph/o2WcGQhQaNqk
	UB9Ang+q1xL5JsMVtso9V5+PyjxcAak=
Message-ID: <ab2d0063-8334-6201-6e95-373bfa841d39@suse.com>
Date: Mon, 21 Nov 2022 09:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yu Zhao <yuzhao@google.com>, Sander Eikelenboom <linux@eikelenboom.it>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Xen-devel <xen-devel@lists.xen.org>
References: <42579618-f8e2-9fd2-0b6c-f2c87f7c57a6@eikelenboom.it>
 <99178e0a-ff6a-9bfa-4ade-b4bf6fdc306f@suse.com>
 <CAOUHufY8it25rBbV1QeO3-wF3g32VkDwrsT6mL4fQUNZsMGkKw@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Xen-unstable Linux-6.1.0-rc5 BUG: unable to handle page fault for
 address: ffff8880083374d0
In-Reply-To: <CAOUHufY8it25rBbV1QeO3-wF3g32VkDwrsT6mL4fQUNZsMGkKw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Kfk3CqL3c2ximaN4GegaSaNe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Kfk3CqL3c2ximaN4GegaSaNe
Content-Type: multipart/mixed; boundary="------------6q0oqkju0wGjGElA5N1Uc8tl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Yu Zhao <yuzhao@google.com>, Sander Eikelenboom <linux@eikelenboom.it>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Xen-devel <xen-devel@lists.xen.org>
Message-ID: <ab2d0063-8334-6201-6e95-373bfa841d39@suse.com>
Subject: Re: Xen-unstable Linux-6.1.0-rc5 BUG: unable to handle page fault for
 address: ffff8880083374d0
References: <42579618-f8e2-9fd2-0b6c-f2c87f7c57a6@eikelenboom.it>
 <99178e0a-ff6a-9bfa-4ade-b4bf6fdc306f@suse.com>
 <CAOUHufY8it25rBbV1QeO3-wF3g32VkDwrsT6mL4fQUNZsMGkKw@mail.gmail.com>
In-Reply-To: <CAOUHufY8it25rBbV1QeO3-wF3g32VkDwrsT6mL4fQUNZsMGkKw@mail.gmail.com>

--------------6q0oqkju0wGjGElA5N1Uc8tl
Content-Type: multipart/mixed; boundary="------------6liXf91R80rbZ4shFsSeAVdW"

--------------6liXf91R80rbZ4shFsSeAVdW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTEuMjIgMDk6MTgsIFl1IFpoYW8gd3JvdGU6DQo+IE9uIE1vbiwgTm92IDIxLCAy
MDIyIGF0IDEyOjEwIEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6
DQo+Pg0KPj4gT24gMTkuMTEuMjIgMDk6MjgsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToN
Cj4+PiBIaSBZdSAvIEp1ZXJnZW4sDQo+IA0KPiBIaSBTYW5kZXIgLyBKdWVyZ2VuLA0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgcmVwb3J0IGFuZCB0aGUgYW5hbHlzaXMuDQo+IA0KPj4+IFRo
aXMgbmlnaHQgSSBnb3QgYSBkb20wIGtlcm5lbCBjcmFzaCBvbiBteSBuZXcgUnl6ZW4gYm94
IHJ1bm5pbmcgWGVuLXVuc3RhYmxlDQo+Pj4gYW5kIGEgTGludXgtNi4xLjAtcmM1IGtlcm5l
bC4NCj4+PiBJIGRpZCBlbmFibGUgdGhlIG5ldyBhbmQgc2hpbnkgTUdMUlUsIGNvdWxkIHRo
aXMgYmUgcmVsYXRlZCA/DQo+Pg0KPj4gSXQgbWlnaHQgYmUgcmVsYXRlZCwgYnV0IEkgdGhp
bmsgaXQgY291bGQgaGFwcGVuIGluZGVwZW5kZW50bHkgZnJvbSBpdC4NCj4gDQo+IFllcywg
SSB0aGluayBpdCdzIHJlbGF0ZWQuDQo+IA0KPj4+IE5vdiAxOSAwNjozMDoxMSBzZXJ2ZWVy
c3RlcnRqZSBrZXJuZWw6IFs2ODk1OS42NDczNzFdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBw
YWdlDQo+Pj4gZmF1bHQgZm9yIGFkZHJlc3M6IGZmZmY4ODgwMDgzMzc0ZDANCj4+PiBOb3Yg
MTkgMDY6MzA6MTEgc2VydmVlcnN0ZXJ0amUga2VybmVsOiBbNjg5NTkuNjYzNTU1XSAjUEY6
IHN1cGVydmlzb3Igd3JpdGUNCj4+PiBhY2Nlc3MgaW4ga2VybmVsIG1vZGUNCj4+PiBOb3Yg
MTkgMDY6MzA6MTEgc2VydmVlcnN0ZXJ0amUga2VybmVsOiBbNjg5NTkuNjc3NTQyXSAjUEY6
IGVycm9yX2NvZGUoMHgwMDAzKSAtDQo+Pj4gcGVybWlzc2lvbnMgdmlvbGF0aW9uDQo+Pj4g
Tm92IDE5IDA2OjMwOjExIHNlcnZlZXJzdGVydGplIGtlcm5lbDogWzY4OTU5LjY5MTE4MV0g
UEdEIDMwMjYwNjcgUDREIDMwMjYwNjcNCj4+PiBQVUQgMzAyNzA2NyBQTUQgN2ZlZTUwNjcg
UFRFIDgwMTAwMDAwMDgzMzcwNjUNCj4+PiBOb3YgMTkgMDY6MzA6MTEgc2VydmVlcnN0ZXJ0
amUga2VybmVsOiBbNjg5NTkuNzA1MDg0XSBPb3BzOiAwMDAzIFsjMV0gUFJFRU1QVA0KPj4+
IFNNUCBOT1BUSQ0KPj4+IE5vdiAxOSAwNjozMDoxMSBzZXJ2ZWVyc3RlcnRqZSBrZXJuZWw6
IFs2ODk1OS43MTg3MTBdIENQVTogNyBQSUQ6IDE1OCBDb21tOg0KPj4+IGtzd2FwZDAgTm90
IHRhaW50ZWQgNi4xLjAtcmM1LTIwMjIxMTE4LWRvZmxyLW1hYzgwMjExZGVidWcrICMxDQo+
Pj4gTm92IDE5IDA2OjMwOjExIHNlcnZlZXJzdGVydGplIGtlcm5lbDogWzY4OTU5LjczMjQ1
N10gSGFyZHdhcmUgbmFtZTogVG8gQmUNCj4+PiBGaWxsZWQgQnkgTy5FLk0uIFRvIEJlIEZp
bGxlZCBCeSBPLkUuTS4vQjQ1MCBQcm80IFIyLjAsIEJJT1MgUDUuNjAgMTAvMjAvMjAyMg0K
Pj4+IE5vdiAxOSAwNjozMDoxMSBzZXJ2ZWVyc3RlcnRqZSBrZXJuZWw6IFs2ODk1OS43NDYz
OTFdIFJJUDoNCj4+PiBlMDMwOnBtZHBfdGVzdF9hbmRfY2xlYXJfeW91bmcrMHgyNS8weDQw
DQo+Pg0KPj4gVGhlIGtlcm5lbCB0aXJlZCB0byByZXNldCB0aGUgImFjY2Vzc2VkIiBiaXQg
aW4gdGhlIHBtZCBlbnRyeS4NCj4gDQo+IENvcnJlY3QuDQo+IA0KPj4gSXQgZG9lcyBzbyBv
bmx5IHNpbmNlIGNvbW1pdCBlZWQ5YTMyOGFhMWFlLiBCZWZvcmUgdGhhdA0KPj4gcG1kcF90
ZXN0X2FuZF9jbGVhcl95b3VuZygpIGNvdWxkIGJlIGNhbGxlZCBvbmx5IGZvciBodWdlIHBh
Z2VzLCB3aGljaCBhcmUNCj4+IGRpc2FibGVkIGluIFhlbiBQViBndWVzdHMuDQo+IA0KPiBD
b3JyZWN0LiBBZnRlciB0aGF0IGNvbW1pdCwgd2UgYWxzbyBjYW4gY2xlYXIgdGhlIGFjY2Vz
c2VkIGJpdCBpbg0KPiBub24tbGVhZiBQTUQgZW50cmllcyAocG9pbnRpbmcgdG8gUFRFIHRh
YmxlcykuDQo+IA0KPj4gcG1kcF90ZXN0X2FuZF9jbGVhcl95b3VuZygpIGRvZXMgYSB0ZXN0
X2FuZF9jbGVhcl9iaXQoKSBvZiB0aGUgcG1kIGVudHJ5LCB3aGljaA0KPj4gaXMgZmFpbGlu
ZyBzaW5jZSB0aGUgaHlwZXJ2aXNvciBpcyBlbXVsYXRpbmcgcHRlIGVudHJ5IG1vZGlmaWNh
dGlvbnMgb25seSAocG1kDQo+PiBhbmQgcHVkIGVudHJpZXMgY2FuIGJlIHNldCB2aWEgaHlw
ZXJjYWxscyBvbmx5KS4NCj4+DQo+PiBDb3VsZCB5b3UgcGxlYXNlIHRlc3QgdGhlIGF0dGFj
aGVkIHBhdGNoIHdoZXRoZXIgaXQgZml4ZXMgdGhlIGlzc3VlIGZvciB5b3U/DQo+IA0KPiBU
aGVyZSBpcyBhIHJ1bnRpbWUga2lsbCBzd2l0Y2ggZm9yIEFSQ0hfSEFTX05PTkxFQUZfUE1E
X1lPVU5HLCBzaW5jZSBJDQo+IHdhc24ndCBhYmxlIHRvIHZlcmlmeSB0aGlzIGNhcGFiaWxp
dHkgb24gYWxsIHg4NiB2YXJpZXRpZXMuIFRoZSBmb2xsb3dpbmcNCj4gc2hvdWxkIGRvIGl0
Og0KPiANCj4gICAgIyBjYXQgL3N5cy9rZXJuZWwvbW0vbHJ1X2dlbi9lbmFibGVkDQo+ICAg
IDB4MDAwNw0KPiAgICAjIGVjaG8gMyA+L3N5cy9rZXJuZWwvbW0vbHJ1X2dlbi9lbmFibGVk
DQo+IA0KPiBEZXRhaWxzIGFyZSBpbiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21tL211
bHRpZ2VuX2xydS5yc3QuDQo+IA0KPiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBtYWtlIEFS
Q0hfSEFTX05PTkxFQUZfUE1EX1lPVU5HIGEgcnVudGltZQ0KPiBjaGVjayBzaW1pbGFyIHRv
IGFyY2hfaGFzX2h3X3B0ZV95b3VuZygpIG9uIGFybTY0Lg0KDQpJIGxpa2UgdGhpcyBpZGVh
Lg0KDQpUaGUgcGF0Y2ggc2hvdWxkIGJlIHJhdGhlciB0cml2aWFsLiBMZXQgbWUgaGF2ZSBh
IHRyeSAuLi4NCg0KDQpKdWVyZ2VuDQo=
--------------6liXf91R80rbZ4shFsSeAVdW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------6liXf91R80rbZ4shFsSeAVdW--

--------------6q0oqkju0wGjGElA5N1Uc8tl--

--------------Kfk3CqL3c2ximaN4GegaSaNe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmN7OBEFAwAAAAAACgkQsN6d1ii/Ey9t
ugf/ZZV3nHL08qIK81y4NnuFeGp4Rwx8ZzbQKaQASeppe8yrwGmTeN4FB675mAXwxdNlzojJ2mav
3+BjJiOzom+cTzOqt1Yh9nTFmXQQDJGQOsGo7r+B83Xb4VF+HkN8C1Cx7zT4nwqBInp5LnEnLXkN
PTs1DmbDA4XWTKBLK5YKiB9aN1K7+NIniJ0dpAbS534jFKvyOU3yzuJbMuD5QfokBtvsI+INX7+s
IlMAkbtAE411O++Pg9l30QZpTrxo8426VyW17EkDROqCibjMugOxreXF+4e6g5EDw5GKD4+v7T/u
KpFqvV3cyCJUJ2XM4tMu3fclaXXtTkQy6x3p06ESUA==
=Oniq
-----END PGP SIGNATURE-----

--------------Kfk3CqL3c2ximaN4GegaSaNe--

