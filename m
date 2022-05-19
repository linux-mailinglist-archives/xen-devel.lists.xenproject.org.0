Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C876752D61B
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333025.556808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhBM-0004uL-9q; Thu, 19 May 2022 14:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333025.556808; Thu, 19 May 2022 14:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhBM-0004rl-6f; Thu, 19 May 2022 14:31:16 +0000
Received: by outflank-mailman (input) for mailman id 333025;
 Thu, 19 May 2022 14:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vBWN=V3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nrhBK-0004rK-Ni
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:31:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55997722-d780-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 16:31:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2DBD01FD43;
 Thu, 19 May 2022 14:31:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDE8613456;
 Thu, 19 May 2022 14:31:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LT6WOLBUhmIgSAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 May 2022 14:31:12 +0000
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
X-Inumbo-ID: 55997722-d780-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652970673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b/07qHUzYvpEObVNl+Re9m/EoCA0HOiIwPKHhDH7M7c=;
	b=WTf0LHdGE/60ZOHN6WaQpv9YhpiPex2uKd2la11Iyaj6TshUVWXkWlC8sBbuiHFuGbpjny
	JZntyH8pdxmlx052g/XpPVqXqTDPtb+m9bNPbAs95JL3eqGKhQGMzZmK0H3qwfWbOnIxjK
	csiCShlETRRB2Lg8rINBs/8o959za+s=
Message-ID: <403a66db-143a-7d05-1d0f-5a7d30721e34@suse.com>
Date: Thu, 19 May 2022 16:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tools/libs/ctrl: add and export xc_memory_op
Content-Language: en-US
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>
References: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
 <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
 <CY4PR11MB0056943EA3C905629887A4E3FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CY4PR11MB0056943EA3C905629887A4E3FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EtefNS5gnDDF4A3NdlOwHIlg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EtefNS5gnDDF4A3NdlOwHIlg
Content-Type: multipart/mixed; boundary="------------YA7LONw6iPpF09Gy0sLh6EwF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>
Message-ID: <403a66db-143a-7d05-1d0f-5a7d30721e34@suse.com>
Subject: Re: [PATCH] tools/libs/ctrl: add and export xc_memory_op
References: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
 <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
 <CY4PR11MB0056943EA3C905629887A4E3FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR11MB0056943EA3C905629887A4E3FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>

--------------YA7LONw6iPpF09Gy0sLh6EwF
Content-Type: multipart/mixed; boundary="------------RoAzGDslZIwx1fwjR5VupjH4"

--------------RoAzGDslZIwx1fwjR5VupjH4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDUuMjIgMTU6NTksIExlbmd5ZWwsIFRhbWFzIHdyb3RlOg0KPiANCj4gDQo+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2
ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+PiBKdWVy
Z2VuIEdyb3NzDQo+PiBTZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDk6MzMgQU0NCj4+
IFRvOiBMZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsg
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ow0KPj4gQ29vcGVy
LCBBbmRyZXcgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBTdWJqZWN0OiBSZTog
W1BBVENIXSB0b29scy9saWJzL2N0cmw6IGFkZCBhbmQgZXhwb3J0IHhjX21lbW9yeV9vcA0K
Pj4NCj4+IE9uIDE5LjA1LjIyIDE1OjI3LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4g
QWRkIGFuZCBleHBvcnQgeGNfbWVtb3J5X29wIHNvIHRoYXQgZG9fbWVtb3J5X29wIGNhbiBi
ZSB1c2VkIGJ5IHRvb2xzDQo+Pj4gbGlua2luZyB3aXRoIGxpYnhjLiBUaGlzIGlzIGVmZmVj
dGl2ZWx5IGluIHRoZSBzYW1lIHNwaXJpdCBhcyB0aGUNCj4+PiBleGlzdGluZyB4Y19kb21j
dGwgYW5kIHhjX3N5c2N0bCBmdW5jdGlvbnMsIHdoaWNoIGFyZSBhbHJlYWR5IGV4cG9ydGVk
Lg0KPj4+DQo+Pj4gSW4gdGhpcyBwYXRjaCB3ZSBtb3ZlIGRvX21lbW9yeV9vcCBpbnRvIHhj
X3ByaXZhdGUuaCBhcyBhIHN0YXRpYw0KPj4+IGlubGluZSBmdW5jdGlvbiBhbmQgY29udmVy
dCBpdHMgJ2NtZCcgaW5wdXQgZnJvbSBpbnQgdG8gdW5zaWduZWQgaW50DQo+Pj4gdG8gYWNj
dXJhdGVseSByZWZsZWN0IHdoYXQgdGhlIGh5cGVydmlzb3IgZXhwZWN0cy4gTm8gb3RoZXIg
Y2hhbmdlcyBhcmUgbWFkZQ0KPj4gdG8gdGhlIGZ1bmN0aW9uLg0KPj4+DQo+Pj4gU2lnbmVk
LW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4NCj4+
PiAtLS0NCj4+PiAgICB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgIHwgIDEgKw0KPj4+
ICAgIHRvb2xzL2xpYnMvY3RybC94Y19wcml2YXRlLmMgfCA2MyArKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+PiAgICB0b29scy9saWJzL2N0cmwveGNfcHJpdmF0
ZS5oIHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+Pj4gICAgMyBm
aWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL3hlbmN0cmwuaCBiL3Rvb2xzL2luY2x1
ZGUveGVuY3RybC5oIGluZGV4DQo+Pj4gOTViZDVlY2E2Ny4uNDg0ZTM1NDQxMiAxMDA2NDQN
Cj4+PiAtLS0gYS90b29scy9pbmNsdWRlL3hlbmN0cmwuaA0KPj4+ICsrKyBiL3Rvb2xzL2lu
Y2x1ZGUveGVuY3RybC5oDQo+Pj4gQEAgLTE1OTcsNiArMTU5Nyw3IEBAIGludCB4Y192bXRy
YWNlX3NldF9vcHRpb24oeGNfaW50ZXJmYWNlICp4Y2gsDQo+Pj4gdWludDMyX3QgZG9taWQs
DQo+Pj4NCj4+PiAgICBpbnQgeGNfZG9tY3RsKHhjX2ludGVyZmFjZSAqeGNoLCBzdHJ1Y3Qg
eGVuX2RvbWN0bCAqZG9tY3RsKTsNCj4+PiAgICBpbnQgeGNfc3lzY3RsKHhjX2ludGVyZmFj
ZSAqeGNoLCBzdHJ1Y3QgeGVuX3N5c2N0bCAqc3lzY3RsKTsNCj4+PiArbG9uZyB4Y19tZW1v
cnlfb3AoeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkIGludCBjbWQsIHZvaWQgKmFyZywN
Cj4+PiArc2l6ZV90IGxlbik7DQo+Pj4NCj4+PiAgICBpbnQgeGNfdmVyc2lvbih4Y19pbnRl
cmZhY2UgKnhjaCwgaW50IGNtZCwgdm9pZCAqYXJnKTsNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS90b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5jDQo+Pj4gYi90b29scy9saWJzL2N0cmwv
eGNfcHJpdmF0ZS5jIGluZGV4IGMwNDIyNjYyZjAuLjZhMjQ3ZDJiMWYgMTAwNjQ0DQo+Pj4g
LS0tIGEvdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuYw0KPj4+ICsrKyBiL3Rvb2xzL2xp
YnMvY3RybC94Y19wcml2YXRlLmMNCj4+PiBAQCAtMzI2LDY0ICszMjYsNiBAQCBpbnQgeGNf
Zmx1c2hfbW11X3VwZGF0ZXMoeGNfaW50ZXJmYWNlICp4Y2gsIHN0cnVjdA0KPj4geGNfbW11
ICptbXUpDQo+Pj4gICAgICAgIHJldHVybiBmbHVzaF9tbXVfdXBkYXRlcyh4Y2gsIG1tdSk7
DQo+Pj4gICAgfQ0KPj4+DQo+Pj4gLWxvbmcgZG9fbWVtb3J5X29wKHhjX2ludGVyZmFjZSAq
eGNoLCBpbnQgY21kLCB2b2lkICphcmcsIHNpemVfdCBsZW4pDQo+Pg0KPj4gV2h5IGRvbid0
IHlvdSBqdXN0IHJlbmFtZSB0aGlzIGZ1bmN0aW9uIGFuZCBtb2RpZnkgdGhlIHVzZXJzIHRv
IHVzZSB0aGUgbmV3DQo+PiBuYW1lPw0KPiANCj4gRm9yIHR3byByZWFzb25zOg0KPiAxKSBo
YXZpbmcgdGhlIGRvX21lbW9yeV9vcCBhcyBhIHN0YXRpYyBpbmxpbmUgaXMgY29uc2lzdGVu
dCB3aXRoIGhvdyBkb19kb21jdGwgYW5kIGRvX3N5c2N0bCBhcmUgaW1wbGVtZW50ZWQsIHNv
IGxvZ2ljYWxseSB0aGF0J3Mgd2hhdCBJIHdvdWxkIGV4cGVjdCB0byBzZWUgZm9yIHRoZSBt
ZW1vcnlfb3AgaHlwZXJjYWxsIGFzIHdlbGwuDQoNCkl0IGlzIG11Y2ggbW9yZSBjb21wbGlj
YXRlZCB0aGFuIHRoZSBkb19kb21jdGwgYW5kIGRvX3N5c2N0bCBpbmxpbmVzLg0KDQpBZGRp
dGlvbmFsbHkgaXQgaXMgYmVpbmcgdXNlZCBieSBsaWJ4ZW5ndWVzdCwgc28gbWFraW5nIGl0
IGFuIGlubGluZSB3b3VsZA0KZXhwb3NlIGxvdHMgb2YgbGlieGVuY3RybCBpbnRlcm5hbHMg
dG8gbGlieGVuZ3Vlc3QuDQoNCj4gMikgdGhlIHBhdGNoIGl0c2VsZiBpcyBjbGVhbmVyIGJl
Y2F1c2UgdGhlcmUgaXMgbm8gY2h1cm4gaW4gYWxsIHRoZSBmaWxlcyB0aGF0IHByZXZpb3Vz
bHkgY2FsbGVkIGRvX21lbW9yeV9vcC4NCg0KT1RPSCBhbGwgY2FsbGVycyBhcmUgaW4gWGVu
LCBzbyBpdHMgbm8gZGVhbCB0byBjaGFuZ2UgdGhvc2UuDQoNCg0KSnVlcmdlbg0K
--------------RoAzGDslZIwx1fwjR5VupjH4
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

--------------RoAzGDslZIwx1fwjR5VupjH4--

--------------YA7LONw6iPpF09Gy0sLh6EwF--

--------------EtefNS5gnDDF4A3NdlOwHIlg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKGVLAFAwAAAAAACgkQsN6d1ii/Ey/k
fAgAhudhlQN0xAafqFDNkNVCSzWmUS+5hxxyEpyE03XO80TkGDrtZAqPOfFUbvRmhiP5FxuMY/pg
+zl2nCEi6dUbTzZTaEr113l/mW+b6BDW5XmvB41i9rU8i9R5kC+DSWRwNRq+BT6fUMw9b7/o1CRQ
KdbB04jSupUpRgJ7Y2owE8b75NwgUhgPeIb/t9KdmC8JzuiAxoY9qGArCzEaHMykjRZac+mmCbCJ
dOgkiZ/zISYxUdX4SUMpzPS2yf1Q9CAi30q/wnO/nvswzGNLNOauXnIYLlzyj7/M4ZVcOMGxSffy
RLQktJ8QnZXmou7IjjUCZumjUaBp2p9iJPws/8/YSg==
=qSOS
-----END PGP SIGNATURE-----

--------------EtefNS5gnDDF4A3NdlOwHIlg--

