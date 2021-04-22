Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3208368350
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115655.220714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbFx-0002qZ-4m; Thu, 22 Apr 2021 15:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115655.220714; Thu, 22 Apr 2021 15:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbFx-0002q9-0n; Thu, 22 Apr 2021 15:28:41 +0000
Received: by outflank-mailman (input) for mailman id 115655;
 Thu, 22 Apr 2021 15:28:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGUy=JT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZbFv-0002q4-KE
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:28:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e1ec2be-9966-4476-82a5-672b10999730;
 Thu, 22 Apr 2021 15:28:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B83C8B173;
 Thu, 22 Apr 2021 15:28:37 +0000 (UTC)
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
X-Inumbo-ID: 1e1ec2be-9966-4476-82a5-672b10999730
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619105317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S2s8d3b/btx56QtdjB6CaPjK6sRnOI8xTAb1jIG6CP4=;
	b=gKlHsP004cKaavaGty6eAilBjsn32BXi8GxNGVNZQ3Auye5rclIv+J2+hr/DRgp9ycm/5p
	d+yaCMu/Ey3L7YXJPsv4RmCUkmWDiqvR37XCdiQDqbKN8A1n47Z524DZsSmVlMnBYAFZH2
	S8jHh3sSdJd36D2YHnCG5DZycpoWJTQ=
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20210422151007.2205-1-jgross@suse.com>
 <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
 <b69df7d3-6fcb-a565-9ec5-a272b6163320@suse.com>
 <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
Date: Thu, 22 Apr 2021 17:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9rkSk1vSn9FbOegTsaEK6WLbeoKsWPGaO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9rkSk1vSn9FbOegTsaEK6WLbeoKsWPGaO
Content-Type: multipart/mixed; boundary="I3qPelmf7Vi6Vq6oeYr6pX5DdsUKm5jN6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Message-ID: <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
References: <20210422151007.2205-1-jgross@suse.com>
 <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
 <b69df7d3-6fcb-a565-9ec5-a272b6163320@suse.com>
 <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>
In-Reply-To: <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>

--I3qPelmf7Vi6Vq6oeYr6pX5DdsUKm5jN6
Content-Type: multipart/mixed;
 boundary="------------C85339484172C36ACC5E171B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C85339484172C36ACC5E171B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.04.21 17:23, Jan Beulich wrote:
> On 22.04.2021 17:17, Juergen Gross wrote:
>> On 22.04.21 17:16, Jan Beulich wrote:
>>> On 22.04.2021 17:10, Juergen Gross wrote:
>>>> Some features of Xen can be assumed to be always present, so add a
>>>> central check to verify this being true and remove the other checks.=

>>>>
>>>> Juergen Gross (3):
>>>>     xen: check required Xen features
>>>>     xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv g=
uests
>>>>     xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guest=
s
>>>
>>> I wonder whether it's a good idea to infer feature presence from
>>> version numbers. If (at some point in the past) you had inferred
>>> gnttab v2 being available by version, this would have been broken
>>> by its availability becoming controllable by a command line option
>>> in Xen.
>>
>> I'm testing the feature to be really present when booting and issue a
>> message if it is not there.
>=20
> And how does this help if the feature really isn't there yet other code=

> assumes it is?

Did you look at the features I'm testing? Those are really just low
level additions I can't imagine will ever be removed again.


Juergen

--------------C85339484172C36ACC5E171B
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

--------------C85339484172C36ACC5E171B--

--I3qPelmf7Vi6Vq6oeYr6pX5DdsUKm5jN6--

--9rkSk1vSn9FbOegTsaEK6WLbeoKsWPGaO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCBliQFAwAAAAAACgkQsN6d1ii/Ey8R
kAf/Yn8ZB8bHah0fvuPFH2DhwdOi6paaQoWP1M7PTJteX5Rw+3lPCM4q18Rh+r9AQZu67wVkCwwR
HTTaSwvOA6t5bfLroJcyDz6EEPa8PogSjCljSEUCJbU2nWD1t/OzMuozAr0iZ1LM1MHmojKDjfy1
xdKUtbfkObaaHTuV/yqsMrncDAT0GQGDtDbyG6qWex94a304g6Sh1b0khyuje+r9E7ozVwsKiH74
96Ta6f2fvb43kmQLd/ol/SeMzDnuOjLGHiDKx/jZbq1/Lqf1LAIYhtLv+lPKzVZgUoNaLttToN6K
IluqnFluwQ7FehfJYbClQLmkdi+OhFCyDowQMYLaEg==
=5oYG
-----END PGP SIGNATURE-----

--9rkSk1vSn9FbOegTsaEK6WLbeoKsWPGaO--

