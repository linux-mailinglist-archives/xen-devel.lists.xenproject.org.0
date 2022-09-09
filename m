Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44F5B32EC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403953.646233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa0G-0003rp-LY; Fri, 09 Sep 2022 09:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403953.646233; Fri, 09 Sep 2022 09:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa0G-0003pb-Ia; Fri, 09 Sep 2022 09:08:48 +0000
Received: by outflank-mailman (input) for mailman id 403953;
 Fri, 09 Sep 2022 09:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWa0E-0003pS-K8
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:08:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f6b35b-301e-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:08:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCEF9225EC;
 Fri,  9 Sep 2022 09:08:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8336F139D5;
 Fri,  9 Sep 2022 09:08:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KCGBHpwCG2N5WAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 09:08:44 +0000
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
X-Inumbo-ID: f8f6b35b-301e-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662714524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mc68v7mdvAfeGm7Rus62jf7uy6bSn4spc43rQoZUiWo=;
	b=F92mVjJE/eUIEMtLEsFm/YdT8UgY4P3uRtbOBmFuLBSkukFD+/hNyBDlgK70JoMjEFA4xt
	Ki0a/fZgrT9NFB/UyubrHD8y9/kOVNTacwhAH6jeTi5QzXLdLwsxQrv7sf4cyO8KTevuv+
	v3laN6RT/CGM/qQovLS/Ajfm72IvH4M=
Message-ID: <2a32d8ed-14bc-192b-a2ce-6457490b182e@suse.com>
Date: Fri, 9 Sep 2022 11:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220909080944.28559-1-jgross@suse.com>
 <689f7d26-b691-56de-7adb-dfb6480e7469@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
In-Reply-To: <689f7d26-b691-56de-7adb-dfb6480e7469@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9744SflxtvLQiALZy1FW5lhD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9744SflxtvLQiALZy1FW5lhD
Content-Type: multipart/mixed; boundary="------------Wbn0X0z07URzJDpBs1bxoVDJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <2a32d8ed-14bc-192b-a2ce-6457490b182e@suse.com>
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
References: <20220909080944.28559-1-jgross@suse.com>
 <689f7d26-b691-56de-7adb-dfb6480e7469@xen.org>
In-Reply-To: <689f7d26-b691-56de-7adb-dfb6480e7469@xen.org>

--------------Wbn0X0z07URzJDpBs1bxoVDJ
Content-Type: multipart/mixed; boundary="------------SJkSGzaxDmtoARz0l0M8cuK9"

--------------SJkSGzaxDmtoARz0l0M8cuK9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjIgMTA6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA5LzA5LzIwMjIgMDk6MDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBD
b21taXQgOWRjNDYzODZkODlkICgiZ250dGFiOiB3b3JrIGFyb3VuZCAibWF5IGJlIHVzZWQg
dW5pbml0aWFsaXplZCINCj4+IHdhcm5pbmciKSB3YXMgd3JvbmcsIGFzIHZhZGRyIGNhbiBs
ZWdpdGltYXRlbHkgYmUgTlVMTCBpbiBjYXNlDQo+PiBYRU5NRU1fcmVzb3VyY2VfZ3JhbnRf
dGFibGVfaWRfc3RhdHVzIHdhcyBzcGVjaWZpZWQgZm9yIGEgZ3JhbnQgdGFibGUNCj4+IHYx
LiBUaGlzIHdvdWxkIHJlc3VsdCBpbiBjcmFzaGVzIGluIGRlYnVnIGJ1aWxkcyBkdWUgdG8N
Cj4+IEFTU0VSVF9VTlJFQUNIQUJMRSgpIHRyaWdnZXJpbmcuDQo+Pg0KPj4gQmFzaWNhbGx5
IHJldmVydCBzYWlkIGNvbW1pdCwgYnV0IGtlZXAgcmV0dXJuaW5nIC1FTk9EQVRBIGluIHRo
YXQgY2FzZS4NCj4gDQo+IFRoaXMgY29tbWl0IHdhcyBpbnRyb2R1Y2VkIHRvIHNpbGVuY2Ug
YSBjb21waWxlciB3YXJuaW5nICh0cmVhdGVkIGFzIGVycm9yIGluIA0KPiBYZW4gYnVpbGQg
c3lzdGVtKS4gQXMgeW91IHJldmVydCBpdCwgZGlkIHlvdSBjaGVjayB0aGUgc2FpZCBjb21w
aWxlciAoSUlSQyBHQ0MgDQo+IDQuMykgd2FzIHN0aWxsIGhhcHB5Pw0KDQpJIGRpZG4ndCBy
ZW1vdmUgdGhlIHZhZGRyIGluaXRpYWxpemVyLg0KDQo+IA0KPj4gRml4ZXM6IDlkYzQ2Mzg2
ZDg5ZCAoImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQi
IHdhcm5pbmciKQ0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPj4gLS0tDQo+PiBNaWdodCBiZSBjb25zaWRlcmVkIGZvciA0LjE3IGFuZCBm
b3IgYmFja3BvcnRpbmcNCj4+IC0tLQ0KPj4gwqAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
IHwgMTQgKysrLS0tLS0tLS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4+IGluZGV4IGFk
NzczYTY5OTYuLjY4ZTdmMWRmMzggMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPj4gQEAgLTQx
MjUsNyArNDEyNSwxMCBAQCBpbnQgZ250dGFiX2FjcXVpcmVfcmVzb3VyY2UoDQo+PiDCoMKg
wqDCoMKgIGNhc2UgWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1czoNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGd0LT5ndF92ZXJzaW9uICE9IDIgKQ0KPj4gK8Kg
wqDCoMKgwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gLUVOT0RB
VEE7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDC
oMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogQ2hlY2sgdGhhdCB2b2lkICoq
IGlzIGEgc3VpdGFibGUgcmVwcmVzZW50YXRpb24gZm9yIGd0LT5zdGF0dXMuICovDQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgQlVJTERfQlVHX09OKCFfX2J1aWx0aW5fdHlwZXNfY29tcGF0
aWJsZV9wKA0KPj4gQEAgLTQxMzUsMTcgKzQxMzgsNiBAQCBpbnQgZ250dGFiX2FjcXVpcmVf
cmVzb3VyY2UoDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDCoMKg
IH0NCj4+IC3CoMKgwqAgLyoNCj4+IC3CoMKgwqDCoCAqIFNvbWUgb2xkZXIgdG9vbGNoYWlu
cyBjYW4ndCBzcG90IHRoYXQgdmFkZHJzIHdvbid0IHJlbWFpbiB1bmluaXRpYWxpemVkDQo+
PiAtwqDCoMKgwqAgKiBvbiBub24tZXJyb3IgcGF0aHMsIGFuZCBoZW5jZSBpdCBuZWVkcyBz
ZXR0aW5nIHRvIE5VTEwgYXQgdGhlIHRvcCBvZiB0aGUNCj4+IC3CoMKgwqDCoCAqIGZ1bmN0
aW9uLsKgIExlYXZlIHNvbWUgcnVudGltZSBzYWZldHkuDQo+PiAtwqDCoMKgwqAgKi8NCj4+
IC3CoMKgwqAgaWYgKCAhdmFkZHJzICkNCj4+IC3CoMKgwqAgew0KPj4gLcKgwqDCoMKgwqDC
oMKgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJjID0gLUVO
T0RBVEE7DQo+PiAtwqDCoMKgIH0NCj4+IC0NCj4+IMKgwqDCoMKgwqAgLyogQW55IGVycm9y
cz/CoCBCYWQgaWQsIG9yIGZyb20gZ3Jvd2luZyB0aGUgdGFibGU/ICovDQo+PiDCoMKgwqDC
oMKgIGlmICggcmMgKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Ow0KPiANCj4g
TG9va2luZyBhdCB0aGUgY29kZSBqdXN0IGJlbG93IHRoZSBsb29wIGlzOg0KPiANCj4gZm9y
ICggaSA9IDA7IGkgPCBucl9mcmFtZXM7ICsraSApDQo+ICDCoMKgIG1mbl9saXN0W2ldID0g
dmlydF90b19tZm4odmFkZHJzW2ZyYW1lICsgMV0pOw0KPiANCj4gR2l2ZW4gdGhhdCAnbnJf
ZnJhbWVzJyBpcyBwcm92aWRlZCBieSB0aGUgY2FsbGVyIGl0IGlzIGEgYml0IHVuY2xlYXIg
aG93IHdlIA0KPiBndWFyYW50ZWUgdGhhdCAndmFkZHJzJyB3aWxsIG5vdCBiZSBOVUxMIHdo
ZW4gbnJfZnJhbWVzID4gMC4NCj4gDQo+IENhbiB5b3UgZXhwbGFpbiBob3cgeW91IGNhbWUg
dG8gdGhlIGNvbmNsdXNpb24gdGhhdCB0aGlzIGlzIG5vdCBwb3NzaWJsZT8NCg0KV2UgY2Fu
IHJlYWNoIHRoaXMgcG9pbnQgb25seSBpbiBjYXNlIHJjIGlzIDAuDQoNCnJjIGNhbiBiZSAw
IG9ubHkgaW4gY2FzZSBnbnR0YWJfZ2V0X3NoYXJlZF9mcmFtZV9tZm4oKSBvcg0KZ250dGFi
X2dldF9zdGF0dXNfZnJhbWVfbWZuKCkgcmV0dXJuZWQgMCwgd2hpY2ggd2lsbCBiZSB0aGUg
Y2FzZSBvbmx5LCBpZg0KdGhlIHZhbHVlIHZhZGRycyB3YXMgc2V0IHRvIGJlZm9yZSBjYWxs
aW5nIHRob3NlIGZ1bmN0aW9ucyB3YXMgdmFsaWQuDQoNCg0KSnVlcmdlbg0K
--------------SJkSGzaxDmtoARz0l0M8cuK9
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

--------------SJkSGzaxDmtoARz0l0M8cuK9--

--------------Wbn0X0z07URzJDpBs1bxoVDJ--

--------------9744SflxtvLQiALZy1FW5lhD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMbApwFAwAAAAAACgkQsN6d1ii/Ey/6
dQf/Rmv3P3JCzMU9N5sIHt0ltQP1L1h2yFsKfQP3Kck9k9X10mb77ZVUnEtwC2VLbTA/lKoQjsvf
LFN5+hGzXOrfzg6e3Pxz4E+yiZLKgJ17FdOZkqhfuQk3xTa3ovqxnlCxgK3jmLLMeVCRFJ79G1Y7
jIJXBH+zE3FI+A9wrH/q8+388LskDcRBZXtK2PS4tfrPtk1wvmeuHg3EmbgbCIvDjyaaoqrmtt7f
H/kq6VNieohtGI+r3Jg9CIYqLcwZ+aQK9GBTyEPiMwmWmRqg91srFMrFkAEwCAuMrfhzx1F/uT/K
6jDpC0DmlMPf1P91H2gnKT7taBWE2gRUSoZ6WQHrZQ==
=VadY
-----END PGP SIGNATURE-----

--------------9744SflxtvLQiALZy1FW5lhD--

