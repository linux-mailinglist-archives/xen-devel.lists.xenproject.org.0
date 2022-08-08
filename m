Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6D58C645
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 12:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382355.617277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKztA-0000CH-IT; Mon, 08 Aug 2022 10:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382355.617277; Mon, 08 Aug 2022 10:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKztA-000090-EL; Mon, 08 Aug 2022 10:21:36 +0000
Received: by outflank-mailman (input) for mailman id 382355;
 Mon, 08 Aug 2022 10:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qbuG=YM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oKzt8-00008s-Fh
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 10:21:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfea6c85-1703-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 12:21:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 83BFF1FEBA;
 Mon,  8 Aug 2022 10:21:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50EDA13A7C;
 Mon,  8 Aug 2022 10:21:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +2LKEazj8GJyCAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 Aug 2022 10:21:32 +0000
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
X-Inumbo-ID: dfea6c85-1703-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659954092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiVDu9L2SK5hcIvnswXroy+I4f05Cq3o95eqceWP36c=;
	b=RjjXemFo2CdoGoMsqPWda6nNkHQGJX3Uqa7vNZuH55mD5kN+OQgGy3Hu3ZuC8t4l1Po18y
	dK3yNNDd9s4WCkxG6BRcrB2lY9GpWWBCezoggBpQUIKKj5bxkpq/XIor3VyM6IOAk9SbtU
	RRvS+te6fGN2N2PRrt8bcbbZs1tCs+s=
Message-ID: <353f3e95-f8e8-5c25-b5e8-8d90ea62e737@suse.com>
Date: Mon, 8 Aug 2022 12:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802133619.22965-1-jgross@suse.com>
 <e62049ce-09e4-f457-f849-16ce9c581145@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] xen/sched: fix cpu hotplug
In-Reply-To: <e62049ce-09e4-f457-f849-16ce9c581145@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mO6Qx4gH3Iqj0D5sYHANGhev"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mO6Qx4gH3Iqj0D5sYHANGhev
Content-Type: multipart/mixed; boundary="------------XpTVwd2LTSlPXb6h056WHRF6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 xen-devel@lists.xenproject.org
Message-ID: <353f3e95-f8e8-5c25-b5e8-8d90ea62e737@suse.com>
Subject: Re: [PATCH 3/3] xen/sched: fix cpu hotplug
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802133619.22965-1-jgross@suse.com>
 <e62049ce-09e4-f457-f849-16ce9c581145@suse.com>
In-Reply-To: <e62049ce-09e4-f457-f849-16ce9c581145@suse.com>

--------------XpTVwd2LTSlPXb6h056WHRF6
Content-Type: multipart/mixed; boundary="------------rEDsPYdO951uw7RzXekUF0tL"

--------------rEDsPYdO951uw7RzXekUF0tL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjIgMTE6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wOC4yMDIy
IDE1OjM2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jcHVwb29sLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+PiBA
QCAtNDE5LDYgKzQxOSw4IEBAIHN0YXRpYyBpbnQgY3B1cG9vbF9hbGxvY19hZmZpbl9tYXNr
cyhzdHJ1Y3QgYWZmaW5pdHlfbWFza3MgKm1hc2tzKQ0KPj4gICAgICAgICAgIHJldHVybiAw
Ow0KPj4gICANCj4+ICAgICAgIGZyZWVfY3B1bWFza192YXIobWFza3MtPmhhcmQpOw0KPj4g
KyAgICBtZW1zZXQobWFza3MsIDAsIHNpemVvZigqbWFza3MpKTsNCj4gDQo+IEZSRUVfQ1BV
TUFTS19WQVIoKT8NCg0KT2gsIHllcy4NCg0KPiANCj4+IEBAIC0xMDMxLDEwICsxMDQxLDIz
IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgY3B1X2NhbGxiYWNrKA0KPj4gICB7DQo+PiAgICAg
ICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpaGNwdTsNCj4+ICAgICAgIGlu
dCByYyA9IDA7DQo+PiArICAgIHN0YXRpYyBzdHJ1Y3QgY3B1X3JtX2RhdGEgKm1lbTsNCj4g
DQo+IFdoZW4geW91IG1lbnRpb25lZCB5b3VyIHBsYW4sIEkgd2FzIGFjdHVhbGx5IGVudmlz
aW9uaW5nIGEgc2xpZ2h0bHkNCj4gZGlmZmVyZW50IG1vZGVsOiBJbnN0ZWFkIG9mIGRvaW5n
IHRoZSBhbGxvY2F0aW9uIGF0IENQVV9ET1dOX1BSRVBBUkUsDQo+IGFsbG9jYXRlIGEgc2lu
Z2xlIGluc3RhbmNlIGR1cmluZyBib290LCB3aGljaCB3b3VsZCBuZXZlciBiZSBmcmVlZC4N
Cj4gRGlkIHlvdSBjb25zaWRlciBzdWNoLCBhbmQgaXQgdHVybmVkIG91dCB3b3JzZT8gSSBn
dWVzcyB0aGUgbWFpbg0KPiBvYnN0YWNsZSB3b3VsZCBiZSBmaWd1cmluZyBhbiB1cHBlciBi
b3VuZCBmb3Igc3ItPmdyYW51bGFyaXR5LCBidXQNCj4gb2YgY291cnNlIHNjaGVkdWxlX2Nw
dV9ybV9hbGxvYygpLCBiZXNpZGVzIHRoZSBhbGxvY2F0aW9ucywgYWxzbw0KPiBkb2VzIHF1
aXRlIGEgYml0IG9mIGZpbGxpbmcgaW4gdmFsdWVzLCB3aGljaCBjYW4ndCBiZSBkb25lIHVw
IGZyb250Lg0KDQpXaXRoIHNjaGVkLWdyYW49c29ja2V0IHNyLT5ncmFudWxhcml0eSBjYW4g
Z3JvdyB0byBhYm92ZSAxMDAsIHNvIEknbQ0Kbm90IHN1cmUgd2UnZCB3YW50IHRvIGRvIHRo
YXQuDQoNCj4gDQo+PiAgICAgICBzd2l0Y2ggKCBhY3Rpb24gKQ0KPj4gICAgICAgew0KPj4g
ICAgICAgY2FzZSBDUFVfRE9XTl9GQUlMRUQ6DQo+PiArICAgICAgICBpZiAoIHN5c3RlbV9z
dGF0ZSA8PSBTWVNfU1RBVEVfYWN0aXZlICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAg
ICAgICBpZiAoIG1lbSApDQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAg
ICBpZiAoIG1lbWNocl9pbnYoJm1lbS0+YWZmaW5pdHksIDAsIHNpemVvZihtZW0tPmFmZmlu
aXR5KSkgKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9mcmVlX2FmZmluX21h
c2tzKCZtZW0tPmFmZmluaXR5KTsNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhlIGNvbmRpdGlv
bmFsIGlzIHJlYWxseSBuZWVkZWQgLSBpdCBtZXJlbHkgYXZvaWRzIHR3bw0KPiB4ZnJlZShO
VUxMKSBpbnZvY2F0aW9ucyBhdCB0aGUgZXhwZW5zZSBvZiByZWFkYWJpbGl0eSBoZXJlLiBQ
bHVzIC0NCg0KT2theS4NCg0KPiB3b3VsZG4ndCB0aGlzIGJldHRlciBiZSBwYXJ0IG9mIC4u
Lg0KPiANCj4+ICsgICAgICAgICAgICAgICAgc2NoZWR1bGVfY3B1X3JtX2ZyZWUobWVtLCBj
cHUpOw0KPiANCj4gLi4uIHRoaXMgYW55d2F5Pw0KDQpUaGlzIHdvdWxkIGFkZCBhIGxheWVy
aW5nIHZpb2xhdGlvbiBJTUhPLg0KDQo+IA0KPj4gQEAgLTEwNDIsMTIgKzEwNjUsMzIgQEAg
c3RhdGljIGludCBjZl9jaGVjayBjcHVfY2FsbGJhY2soDQo+PiAgICAgICBjYXNlIENQVV9E
T1dOX1BSRVBBUkU6DQo+PiAgICAgICAgICAgLyogU3VzcGVuZC9SZXN1bWUgZG9uJ3QgY2hh
bmdlIGFzc2lnbm1lbnRzIG9mIGNwdXMgdG8gY3B1cG9vbHMuICovDQo+PiAgICAgICAgICAg
aWYgKCBzeXN0ZW1fc3RhdGUgPD0gU1lTX1NUQVRFX2FjdGl2ZSApDQo+PiArICAgICAgICB7
DQo+PiAgICAgICAgICAgICAgIHJjID0gY3B1cG9vbF9jcHVfcmVtb3ZlX3Byb2xvZ3VlKGNw
dSk7DQo+PiArICAgICAgICAgICAgaWYgKCAhcmMgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+
ICsgICAgICAgICAgICAgICAgQVNTRVJUKCFtZW0pOw0KPj4gKyAgICAgICAgICAgICAgICBt
ZW0gPSBzY2hlZHVsZV9jcHVfcm1fYWxsb2MoY3B1KTsNCj4+ICsgICAgICAgICAgICAgICAg
cmMgPSBtZW0gPyBjcHVwb29sX2FsbG9jX2FmZmluX21hc2tzKCZtZW0tPmFmZmluaXR5KSA6
IC1FTk9NRU07DQo+IA0KPiBBaCAtIGhlcmUgeW91IGFjdHVhbGx5IHdhbnQgYSBub24tYm9v
bGVhbiByZXR1cm4gdmFsdWUuIE5vIG5lZWQgdG8NCj4gY2hhbmdlIHRoYXQgdGhlbiBpbiB0
aGUgZWFybGllciBwYXRjaCAoYWxiZWl0IG9mIGNvdXJzZSBhIGNoYW5nZQ0KPiB0aGVyZSBj
b3VsZCBiZSBlYXNpbHkgYWNjb21tb2RhdGVkIGhlcmUpLg0KPiANCj4gQWxvbmcgdGhlIGxp
bmVzIG9mIHRoZSBlYXJsaWVyIGNvbW1lbnQgdGhpcyAybmQgYWxsb2NhdGlvbiBtYXkgYWxz
bw0KPiB3YW50IHRvIG1vdmUgaW50byBzY2hlZHVsZV9jcHVfcm1fYWxsb2MoKS4gSWYgb3Ro
ZXIgdXNlcnMgb2YgdGhlDQo+IGZ1bmN0aW9uIGRvbid0IG5lZWQgdGhlIGV4dHJhIGFsbG9j
YXRpb25zLCBwZXJoYXBzIGJ5IGFkZGluZyBhIGJvb2wNCj4gcGFyYW1ldGVyLg0KDQpJIGNv
dWxkIGRvIHRoYXQsIGJ1dCBJIHN0aWxsIHRoaW5rIHRoaXMgd291bGQgcHVsbCBjcHVwb29s
IHNwZWNpZmljIG5lZWRzDQppbnRvIHNjaGVkL2NvcmUuYy4NCg0KDQpKdWVyZ2VuDQo=
--------------rEDsPYdO951uw7RzXekUF0tL
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

--------------rEDsPYdO951uw7RzXekUF0tL--

--------------XpTVwd2LTSlPXb6h056WHRF6--

--------------mO6Qx4gH3Iqj0D5sYHANGhev
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLw46sFAwAAAAAACgkQsN6d1ii/Ey9T
/Qf7BScKje/ocGm4/OCBC4clyPYoOK3D7S825i0wQmbtFLe1Pxgl/RGctxunAzwuaRBUzlYK+UK0
lr1hVcaQp5yQpKNRM+czvCkbcl+M7pvU8pd+cifvYt22MLZVAFfhSiJU8zkZGaa+dkNY8hGxbvPU
vwzeNxl4iQWdEW/raggC9IvXNjndktZzz23+eP74YDyBLaJJfnO6RLiMobX8/LctRqmaM1Cvds5S
M8CK+Je8aSc660Gtm4sGWnsphStesyddj5exDUvzDOChLpE3Nz07dawhs7RcfsIGsDsD45+1xzu5
Crc47xI8iQ2YQq+KlROHb2X5cr8iK6WYPLaZkeUo0g==
=HBvr
-----END PGP SIGNATURE-----

--------------mO6Qx4gH3Iqj0D5sYHANGhev--

