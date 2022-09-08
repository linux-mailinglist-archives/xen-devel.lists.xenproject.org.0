Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A815B1520
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 08:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402709.644562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBNN-00047o-9J; Thu, 08 Sep 2022 06:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402709.644562; Thu, 08 Sep 2022 06:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBNN-00044L-6Y; Thu, 08 Sep 2022 06:51:01 +0000
Received: by outflank-mailman (input) for mailman id 402709;
 Thu, 08 Sep 2022 06:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWBNL-00044D-Np
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 06:50:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f7edc0-2f42-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 08:50:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0373A33BAA;
 Thu,  8 Sep 2022 06:50:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A3031322C;
 Thu,  8 Sep 2022 06:50:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eB+iI9GQGWNzPwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Sep 2022 06:50:57 +0000
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
X-Inumbo-ID: 97f7edc0-2f42-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662619858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IkMYpdLUCGb3LGZVwqULNpnr6j9qQEifgmyhvZkI4DY=;
	b=bKWKXfXrBl4yF/lXygjGTtJO/idkH/Eu3oVIz+5CK8K4sIsoFaSLxltjaIYMkt/5WeVJ8I
	wFyWzpKD0FrSbCFBddpEFycLJWWf8QhWHH28ifGvcSo/seI/NSDI/eIKD+taebD28asxcq
	kv3a3J9F92Bfml9YheMRVIGsjRr9yVg=
Message-ID: <824eddb0-540d-657a-e41b-66c002caf645@suse.com>
Date: Thu, 8 Sep 2022 08:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, Julien Grall <julien@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xen.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
 <YxdyGXxois95bNdI@perard.uk.xensource.com>
 <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
 <402d1abf-85f6-b13a-8a6e-80cb1792c2ee@xen.org>
 <20220908042442.7sa6p23qqhuik6ai@vireshk-i7>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
In-Reply-To: <20220908042442.7sa6p23qqhuik6ai@vireshk-i7>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lL7Nb6AjsMAvJ0MCMUVos114"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lL7Nb6AjsMAvJ0MCMUVos114
Content-Type: multipart/mixed; boundary="------------U8xMmEegv7Tm1ebQ5nsUrU9v";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Julien Grall <julien@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xen.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Message-ID: <824eddb0-540d-657a-e41b-66c002caf645@suse.com>
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
 <YxdyGXxois95bNdI@perard.uk.xensource.com>
 <20220907123224.rz7vvope37l6l6mg@vireshk-i7>
 <402d1abf-85f6-b13a-8a6e-80cb1792c2ee@xen.org>
 <20220908042442.7sa6p23qqhuik6ai@vireshk-i7>
In-Reply-To: <20220908042442.7sa6p23qqhuik6ai@vireshk-i7>

--------------U8xMmEegv7Tm1ebQ5nsUrU9v
Content-Type: multipart/mixed; boundary="------------rSR3oCAEpBy8RHYEnyDDnkbK"

--------------rSR3oCAEpBy8RHYEnyDDnkbK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDkuMjIgMDY6MjQsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gT24gMDctMDktMjIs
IDE4OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBMb29raW5nIGF0IHRoaXMgc2VyaWVz
LCB5b3Ugd2lsbCBhZGQgfjI1MCBsaW5lcyAoYXNzdW1pbmcgeW91ciBuZXcgcGF0Y2gpDQo+
PiBmb3IgdGhlIGkyYyBhbmQgdGhlbiBsaWtlbHkgdGhlIHNhbWUgYW1vdW50IGZvciBHUElP
Lg0KPj4NCj4+IEkgYW0gYXNzdW1pbmcgdGhhdCBmb3IgZXZlcnkgbmV3IHZpcnRpbyBkZXZp
Y2UgKGUuZy4gZ3BzLCBzb3VuZCwNCj4+IGRpc3BsYXkuLi4pLCB3ZSB3b3VsZCBhbHNvIG5l
ZWQgdG8gMjUwIGxpbmVzIG9mIGNvZGUuIEkgYW0gd29ycnkgdGhhdCB3ZQ0KPj4gd2lsbCBl
bmQgdXAgdG8gYmxvYXQgbGlieGwgd2l0aCBkdXBsaWNhdGVkIGNvZGUgYW5kIG9yIGZvciBk
ZXZpY2UgdGhhdCBhcmUNCj4+IGJhcmVseSB1c2VkLg0KPiANCj4gSSBhZ3JlZS4NCj4gDQo+
PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBmaW5kIGEgZ2VuZXJpYyB3YXkgdG8g
YWRkIG5ldyB2aXJ0aW8gZGV2aWNlDQo+PiB3aXRob3V0IGFkZGluZyBjb2RlICh2ZXJ5IGxp
bWl0ZWQpIGluIGxpYnhsLiBUaGUgYWR2YW50YWdlIGlzIHNvbWVvbmUgd2lsbA0KPj4gYmUg
YWJsZSB0byBjcmVhdGUgYSBuZXcgdmlydGlvIGRldmljZSB3aXRoIGxlc3MgZWZmb3J0Lg0K
Pj4NCj4+IFRoZSBhcHByb2FjaCBJIGNhbiB0aGluayBvZiBpcyBzb21ldGhpbmcgYWxvbmcg
dGhlIGxpbmVzOg0KPj4NCj4+IHZpcnRpbyA9IFsidHlwZT08Y29tcGF0aWJsZT4sdHJhbnNw
b3J0PTx0cmFuc3BvcnQ+LC4uLiJdDQo+IA0KPiBJdCBzb3VuZHMgZ29vZCBhbmQgeWVhaCBp
dCB3aWxsIHNhdmUgYSBsb3Qgb2YgdHJvdWJsZS4NCg0KWWVzLCBJJ2QgbGlrZSB0aGF0LCB0
b28uDQoNCj4gDQo+PiB3aGVyZSB0aGUgY29tcGF0aWJsZSBpcyB0aGUgb25lIHRoYXQgc2hv
dWxkIGJlIHdyaXR0ZW4gaW4gdGhlIERUIGFuZA0KPj4gdHJhbnNwb3J0IGlzIG1taW8gb3Ig
cGNpLiB0aGUgWy4uLl0gcmVmZXJzIHRvIHNwZWNpZmljIHBhcmFtZXRlcnMgdGhhdCB3b3Vs
ZA0KPj4gbmVlZCB0byBiZSBwYXNzZWQgdG8gdGhlIGJhY2tlbmQgKGl0IGlzIG5vdCBjbGVh
ciBob3cgeW91IHByb3ZpZGUgdGhlbQ0KPj4gdG9kYXk/KS4NCj4gDQo+IFRoZSBiYWNrZW5k
IGRvZXNuJ3QgbmVlZCBsb3Qgb2YgcGFyYW1ldGVycyB0byBiZSBwYXNzZWQgcmlnaHQgbm93
LCB0aGUgaG9zdA0KPiBzcGVjaWZpYyBvbmVzIChsaWtlIHdoaWNoIGRldmljZXMgb24gYSBi
dXMgdG8gc2hhcmUgdG8gdGhlIGd1ZXN0cykgYXJlIHBhc3NlZCBieQ0KPiBpdHMgY29tbWFu
ZCBsaW5lLiBUaGUgYmFja2VuZHMgaW4gb3VyIGNhc2UgYXJlIGh5cGVydmlzb3IgYWdub3N0
aWMgYW5kIGFyZSBydW4NCj4gaW5kZXBlbmRlbnRseSBhcyBkYWVtb25zLCB0aGV5IGp1c3Qg
bmVlZCB0byBrbm93IGJhc2UvaXJxLCB3aGljaCB3ZSBnZXQgZnJvbSB4ZW4NCj4gbGlicmFy
aWVzLg0KDQpXaGVuIHVzaW5nIHFlbXUgYXMgYSBiYWNrZW5kIHRoaXMgd2lsbCBiZSBxdWl0
ZSBkaWZmZXJlbnQuDQoNCkZvciBteSBwcm90b3R5cGUgInZpcnRpbyB1c2luZyBncmFudHMi
IEkgbmVlZGVkIHRvIGFkZCB0aGUgZm9sbG93aW5nIHBhcmFtZXRlcnMNCndoZW4gc3RhcnRp
bmcgcWVtdSBqdXN0IGZvciBvbmUgdmlydGlvIGRpc2s6DQoNCi1kcml2ZSBmaWxlPS9ob21l
L3ZtL3NsZTE1c3AxL2ltYWdlLGlmPW5vbmUsaWQ9ZHJpdmUtdmlydGlvLWRpc2swLGZvcm1h
dD1yYXcnIA0KLWRldmljZSANCnZpcnRpby1ibGstcGNpLHNjc2k9b2ZmLGRyaXZlPWRyaXZl
LXZpcnRpby1kaXNrMCxpZD12aXJ0aW8tZGlzazAsYm9vdGluZGV4PTAsZGlzYWJsZS1sZWdh
Y3k9b24NCg0KQXMgaW4gY29tbWl0IDY2ZGQxYzYyYjJhM2M3MCBJJ2Qgc3VnZ2VzdCB0byBh
ZGQgImJhY2tlbmR0eXBlPSIgaW4gb3JkZXIgdG8NCnN1cHBvcnQgZnVydGhlciBzcGVjaWFs
IGhhbmRsaW5nIGZvciBlLmcuIHFlbXUuIEkgZ3Vlc3MgeW91ciBiYWNrZW5kdHlwZSB3b3Vs
ZA0KcHJvYmFibHkgYmUgInN0YW5kYWxvbmUiLCBidXQgaW4gY2FzZSB5b3UgbmVlZCBmdXJ0
aGVyIHBhcmFtZXRlcnMgZnJvbSB4bC9saWJ4bA0KeW91IGNvdWxkIGFkZCBhbm90aGVyIHR5
cGUgc3VpdGluZyB5b3VyIG5lZWRzLg0KDQoNCkp1ZXJnZW4NCg==
--------------rSR3oCAEpBy8RHYEnyDDnkbK
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

--------------rSR3oCAEpBy8RHYEnyDDnkbK--

--------------U8xMmEegv7Tm1ebQ5nsUrU9v--

--------------lL7Nb6AjsMAvJ0MCMUVos114
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMZkNEFAwAAAAAACgkQsN6d1ii/Ey+Z
cQf9GSSatEHbqlHp7o+ef/vf75c5NWKANWoWmWOPf92V98oNQRF23tJzhPpiiVU3qWywW73zjtEb
02SLerZ42yfXI+HDkEDcRFSfQ9mXtcGiasy/2gdBc49UPR9XKY4+sXX2rMCGGT6cjy5olfQFojKd
O7gw6UjtdHKIPT4C16JjynGcmDxgSLropq/PZZqTUJYMJJrO72J4lcGyZiqs0NwKGFWMXw6A8yVj
YFiltdjg8KskcozoBolb0xZRwMBu47IZXVSX7w1w0cvmWOu6oC1ez1fmrC271Cv0+21MFyX3A6GC
UCn/R+JHP90ekSotO5aqC1FQGtSa1WZlrvhYcR+OyA==
=gU0K
-----END PGP SIGNATURE-----

--------------lL7Nb6AjsMAvJ0MCMUVos114--

