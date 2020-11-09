Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1022AB91C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 14:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22540.48905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6ro-0006CP-KZ; Mon, 09 Nov 2020 13:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22540.48905; Mon, 09 Nov 2020 13:05:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6ro-0006C0-HN; Mon, 09 Nov 2020 13:05:52 +0000
Received: by outflank-mailman (input) for mailman id 22540;
 Mon, 09 Nov 2020 13:05:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc6rn-0006Bv-Br
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:05:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d56a37ee-06c8-4ee2-ab5c-ea2b9d3598b3;
 Mon, 09 Nov 2020 13:05:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CE9CABAE;
 Mon,  9 Nov 2020 13:05:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc6rn-0006Bv-Br
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:05:51 +0000
X-Inumbo-ID: d56a37ee-06c8-4ee2-ab5c-ea2b9d3598b3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d56a37ee-06c8-4ee2-ab5c-ea2b9d3598b3;
	Mon, 09 Nov 2020 13:05:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604927149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/55AuPuvYJH5yF3KbYVD4llOq1t8Ht16pu3so/uKXk=;
	b=GibwIyrKtTw9XEt5e0zI8B+KXYUT1NJUu5Db4H1Bcj/l7RXv3ktSSwVYnz+RUubMyJgBRO
	N7c6QZgF2PdlCPtLhiapRX/OZHJuDSwXMVo4EFd9Qorpfx9NGM2hvFJCthJjbUqsoYyofI
	psIaEVGbKbcBqcdnmqZTags2KguKs8Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8CE9CABAE;
	Mon,  9 Nov 2020 13:05:49 +0000 (UTC)
Subject: Re: [PATCH v5 0/2] XSA-343 followup patches
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20201109064128.3908-1-jgross@suse.com>
 <e9326609-0808-8f0b-6cb9-3ed4401b9f1d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <54840a9d-8fc4-e97e-8c97-3fdad8d273fd@suse.com>
Date: Mon, 9 Nov 2020 14:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e9326609-0808-8f0b-6cb9-3ed4401b9f1d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="128oblLcpeljJaao10Lw3Se9IcigBrpp3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--128oblLcpeljJaao10Lw3Se9IcigBrpp3
Content-Type: multipart/mixed; boundary="OF7iSyQ0yH2W8xlIizqcMkaWZtRX83APi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <54840a9d-8fc4-e97e-8c97-3fdad8d273fd@suse.com>
Subject: Re: [PATCH v5 0/2] XSA-343 followup patches
References: <20201109064128.3908-1-jgross@suse.com>
 <e9326609-0808-8f0b-6cb9-3ed4401b9f1d@suse.com>
In-Reply-To: <e9326609-0808-8f0b-6cb9-3ed4401b9f1d@suse.com>

--OF7iSyQ0yH2W8xlIizqcMkaWZtRX83APi
Content-Type: multipart/mixed;
 boundary="------------4F25DD51BE6063AE65733C2F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4F25DD51BE6063AE65733C2F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.11.20 13:00, Jan Beulich wrote:
> On 09.11.2020 07:41, Juergen Gross wrote:
>> The patches for XSA-343 produced some fallout, especially the event
>> channel locking has shown to be problematic.
>>
>> Patch 1 is targeting fifo event channels for avoiding any races for th=
e
>> case that the fifo queue has been changed for a specific event channel=
=2E
>>
>> The second patch is modifying the per event channel locking scheme in
>> order to avoid deadlocks and problems due to the event channel lock
>> having been changed to require IRQs off by the XSA-343 patches.
>>
>> Changes in V5:
>> - moved evtchn_write_[un]lock() to event_channel.c (Jan Beulich)
>> - used normal read_lock() in some cases (Jan Beulich)
>>
>> Changes in V4:
>> - switched to real rwlock
>>
>> Changes in V3:
>> - addressed comments
>>
>> Juergen Gross (2):
>>    xen/events: access last_priority and last_vcpu_id together
>>    xen/evtchn: rework per event channel lock
>=20
> Didn't you mean to add a 3rd patch here to drop the 2nd call to
> xsm_evtchn_send() again?

I wanted to that after this series has been accepted, but I can include
it here, of course.


Juergen


--------------4F25DD51BE6063AE65733C2F
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4F25DD51BE6063AE65733C2F--

--OF7iSyQ0yH2W8xlIizqcMkaWZtRX83APi--

--128oblLcpeljJaao10Lw3Se9IcigBrpp3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+pPqwFAwAAAAAACgkQsN6d1ii/Ey8w
jwf/adhJcRo5OAbOsxNU1KwhFbrwEJNDhYjXptg1my4woYWfw1XlAB/XzhcFTlBdksYumdWm/uz9
uN6HuWHsiuvcGDB8p2/TwcWEk9RNbnUdy4BcpjT76uFHWmmnrivL7lOAmphGortLLO7fddGt+8bd
fOAHx9rtxf+2EqG5Tpw5/BJJz7NxG8ZP8CjPmzF3dc8ZEx/HYJaqX4X2DJPtb4rM9z2PverZPCci
KX5s25sNWYWzXe0BvQdzExClqQTNw+1oNcxJhUI1a34U8R9V1ycoqeJ8HqYF2u4d+loThiyN3E6m
fkt/+D6K5/m0C7p9JEbVGzN16MDbsMp8LCRqLIo5Jw==
=pl9p
-----END PGP SIGNATURE-----

--128oblLcpeljJaao10Lw3Se9IcigBrpp3--

