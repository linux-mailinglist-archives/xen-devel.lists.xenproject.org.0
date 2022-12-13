Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14664B0A3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 08:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460246.718127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p508H-00025X-P0; Tue, 13 Dec 2022 07:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460246.718127; Tue, 13 Dec 2022 07:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p508H-00023S-M3; Tue, 13 Dec 2022 07:55:21 +0000
Received: by outflank-mailman (input) for mailman id 460246;
 Tue, 13 Dec 2022 07:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p508G-00023M-8W
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 07:55:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c727a75-7abb-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 08:55:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1828F1FDAC;
 Tue, 13 Dec 2022 07:55:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E167A138F9;
 Tue, 13 Dec 2022 07:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +xTaNOUvmGPGDgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 07:55:17 +0000
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
X-Inumbo-ID: 7c727a75-7abb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670918118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+4/YTvIVuszh7SEitE8aIM70LH8vIe1BnKWYSn98ko=;
	b=BQD93sEyO7VgYjWjZ7RiOjrke8dZzoqcr1s3H/4nMdel2OGohu6fk6Awnzx0LcLMeRMOJT
	T81UjKEpPcK9sCg7bHQU+Mc87Ypik4ql9LGvjv7DKAEb6qiN0xW+gUd1e97slzENWAZOVY
	nEwE+r17R4BPbsuJ6kGKMTzC/0787AU=
Message-ID: <cfa95b1c-9550-7ecb-f987-0cd2c6b63f13@suse.com>
Date: Tue, 13 Dec 2022 08:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
 <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
 <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>
 <ceda3142-f5c0-f1b1-19c4-40aade11fa63@suse.com>
 <39f4a517-7263-2431-920f-fe8ea65b7495@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
In-Reply-To: <39f4a517-7263-2431-920f-fe8ea65b7495@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y0Y7BK3POLmH7ebxbfz0Vp1y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y0Y7BK3POLmH7ebxbfz0Vp1y
Content-Type: multipart/mixed; boundary="------------hFG2SiX4VZIOEtnSGNTETz51";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <cfa95b1c-9550-7ecb-f987-0cd2c6b63f13@suse.com>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
 <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
 <c878e5dc-1cfc-fc7f-f535-9d1afb99f378@xen.org>
 <ceda3142-f5c0-f1b1-19c4-40aade11fa63@suse.com>
 <39f4a517-7263-2431-920f-fe8ea65b7495@xen.org>
In-Reply-To: <39f4a517-7263-2431-920f-fe8ea65b7495@xen.org>

--------------hFG2SiX4VZIOEtnSGNTETz51
Content-Type: multipart/mixed; boundary="------------p4fttdr2m0WRa44KjmiyUMqY"

--------------p4fttdr2m0WRa44KjmiyUMqY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMjA6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA4LzExLzIwMjIgMDg6MDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNy4xMS4yMiAxOTozNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9uIDA3LzExLzIw
MjIgMDg6MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDA2LjExLjIyIDIzOjAw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4NCj4+Pj4+
IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gVGhl
IGFjY291bnRpbmcgZm9yIHRoZSBudW1iZXIgb2Ygbm9kZXMgb2YgYSBkb21haW4gaW4gYW4g
YWN0aXZlDQo+Pj4+Pj4gdHJhbnNhY3Rpb24gaXMgbm90IHdvcmtpbmcgY29ycmVjdGx5LCBh
cyBpdCBhbGxvd3MgdG8gY3JlYXRlIGFyYml0cmFyeQ0KPj4+Pj4+IG51bWJlciBvZiBub2Rl
cy4gVGhlIHRyYW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1ZSB0byBleGNlZWRpbmcN
Cj4+Pj4+PiB0aGUgbnVtYmVyIG9mIG5vZGVzIHF1b3RhLCBidXQgYmVmb3JlIGNsb3Npbmcg
dGhlIHRyYW5zYWN0aW9uIGFuDQo+Pj4+Pj4gdW5wcml2aWxlZ2VkIGd1ZXN0IGNvdWxkIGNh
dXNlIFhlbnN0b3JlIHRvIHVzZSBhIGxvdCBvZiBtZW1vcnkuDQo+Pj4+Pg0KPj4+Pj4gSSBo
YXZlIGFscmVhZHkgbWFkZSBzb21lIG9mIGNvbW1lbnRzIG9uIHRoZSBzZWN1cml0eSBNTCB3
aGVuIHRoaXMgd2FzIA0KPj4+Pj4gaW5pdGlhbGx5IHNldC4gVGhlIGFyZ3VtZW50cyBzdGls
bCBkb24ndCBzb3VuZCByaWdodCB0byBtZS4NCj4+Pj4+DQo+Pj4+PiBGb3IgYSBmaXJzdCwg
c2luY2UgWFNBLTMyNiwgd2UgaGF2ZSBhIGNhcCBpbiBwbGFjZSBmb3IgdGhlIG1lbW9yeSBh
IGRvbWFpbiANCj4+Pj4+IGNhbiBjb25zdW1lLiBTbyB0aGlzIHN1cmVseSBjYW4ndCBiZSBh
ICJsb3Qgb2YgbWVtb3J5Ii4gT3RoZXJ3aXNlIHdlIGFyZSANCj4+Pj4+IHNheWluZyB0aGF0
IG91ciBsaW1pdCAodGhlcmUgYXJlIG90aGVyIHdheSB0byBoaXQgaXQpIHdlcmUgd3Jvbmcu
Li4NCj4+Pj4NCj4+Pj4gWWVhaCwgbWF5YmUgSSBzaG91bGQgcmV3b3JrIHRoZSBjb21taXQg
bWVzc2FnZS4NCj4+Pj4NCj4+Pj4gVGhlIHJlYXNvbiBJIHN0aWxsIHdhbnQgdG8ga2VlcCB0
aGUgcGF0Y2ggaXMgdGhhdCBpbiBhIHRyYW5zYWN0aW9uIHdpdGhvdXQgYW55DQo+Pj4+IGNv
bmZsaWN0cyBhbmQgd2l0aG91dCBoaXR0aW5nIGFueSB0cmFuc2FjdGlvbiBzcGVjaWZpYyBs
aW1pdHMgKG51bWJlciBvZiBub2Rlcw0KPj4+PiBhY2Nlc3NlZCksIHRoZSBlcnJvcnMgcmV0
dXJuZWQgZHVlIHRvIGEgc2luZ2xlIG9wZXJhdGlvbiBzaG91bGQgYmUgdGhlIHNhbWUgYXMN
Cj4+Pj4gd2l0aCB0aGUgc2FtZSBvcGVyYXRpb24gcGVyZm9ybWVkIG91dHNpZGUgYSB0cmFu
c2FjdGlvbi4NCj4+Pg0KPj4+IFRoaXMgc2VlbXMgdG8gYmUgYSB2ZXJ5IG5pY2hlIHVzZSBj
YXNlLiBTbyBpdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoaXMgDQo+Pj4gbWF0dGVyIGFu
ZCB3ZSB3YW50IHRvIGFkZCBleHRyYSBjaGVjayBmb3IgZXZlcnlvbmUuDQo+Pg0KPj4gSXQg
aXMgYSBtYXR0ZXIgb2YgY29ycmVjdG5lc3MuDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBt
YXR0ZXIgb2YgcGVyc3BlY3RpdmUuIFRyYW5zYWN0aW9ucyBhcmUgaW5oZXJlbnRseSByYWN5
IGFuZCBJIA0KPiBzZWUgbm8gcG9pbnQgb2YgdHJ5IHRvIHNvbHZlIGlzc3VlcyBpbiB0aGUg
aWRlYWxpc3RpYyBjYXNlIChpLmUuIG5vIGNvbmZsaWN0KS4NCj4gVGhlIHJlYXNvbmluZyBi
ZWxvdy4uLg0KPiANCj4+DQo+PiBBZGRpdGlvbmFsbHksIGFmdGVyIHRoZSBpbnRlcm5hbCBh
Y2NvdW50aW5nIHJld29yayB0aGlzIG1ha2VzIGV2ZW4gbW9yZQ0KPj4gc2Vuc2UsIGFzIHRo
ZSBtYXhpbXVtIHZhbHVlcyBwZXIgZG9tYWluIHNlZW4gYXJlIHJlYWxseSBjb3JyZWN0LCBl
dmVuIHdoZW4NCj4+IHF1ZXJpZWQgd2hpbGUgdHJhbnNhY3Rpb25zIGFyZSBhY3RpdmUuDQo+
IC4uLiBtaWdodCBiZSBhIGJldHRlciBqdXN0aWZpY2F0aW9uLiBCdXQgSSB3aWxsIG5lZWQg
dG8gcmV2aWV3IHRoZSBvdGhlciBwYXRjaCANCj4gaW4gb3JkZXIgdG8gZm9yZ2UgYSBtb3Jl
IHBvc2l0aXZlIG9waW5pb24uIENhbiB5b3UgcG9pbnQgbWUgdG8gdGhlIHBhdGNoPw0KDQpU
aGUgbWFpbiBjaGFuZ2VzIGFyZSBpbiBwYXRjaGVzIDItNCBvZiB0aGUgMm5kIHNlcmllcyBb
MV0uDQoNCg0KSnVlcmdlbg0KDQpbMV06IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDIyLTExL21zZzAwMDUwLmh0bWwNCg0K
--------------p4fttdr2m0WRa44KjmiyUMqY
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

--------------p4fttdr2m0WRa44KjmiyUMqY--

--------------hFG2SiX4VZIOEtnSGNTETz51--

--------------Y0Y7BK3POLmH7ebxbfz0Vp1y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOYL+UFAwAAAAAACgkQsN6d1ii/Ey+9
bQf9FMNyGnmhzVTIWhWkLjaNLuyVZ616lV0sU8b1sivESNeCFG0pkGYhFxHOAqnitKSmsQVnaNUq
v1r+ihef8Q5GoNgtx8o06eGUgAreYkvPRYyYpnLxWpoIFy1pyjlQmhWvmDYkzrAXiEnB73s8MCJt
qNL8X29bmgO/DlPsSevHOQrhewLVHM/2+3ddq+FN4ODEZx4IJJgbBNk95GjrSB+qWjs6yX1IVGvV
zJ3WbLfVTLMRbg9w0yhF4laI7HEpq7L1Bl3in/Sx7sFO2WFHHY+2Luo5qL0glekkbyV+enpAHtF2
g5gN3kySp8dB0DOiOrao3FodeV6M+yQuDSfeHm6MWw==
=CgMM
-----END PGP SIGNATURE-----

--------------Y0Y7BK3POLmH7ebxbfz0Vp1y--

