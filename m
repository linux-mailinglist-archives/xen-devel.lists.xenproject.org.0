Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D838F368432
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115678.220765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbZz-0005LV-SK; Thu, 22 Apr 2021 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115678.220765; Thu, 22 Apr 2021 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbZz-0005L5-O2; Thu, 22 Apr 2021 15:49:23 +0000
Received: by outflank-mailman (input) for mailman id 115678;
 Thu, 22 Apr 2021 15:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGUy=JT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZbZy-0005Kw-8b
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:49:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 010243c3-3106-46ed-9d86-db6ae96562d9;
 Thu, 22 Apr 2021 15:49:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13522B184;
 Thu, 22 Apr 2021 15:49:20 +0000 (UTC)
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
X-Inumbo-ID: 010243c3-3106-46ed-9d86-db6ae96562d9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619106560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hz9XYKqwpYHccMVq4bsKUKqKOZAp25cT/I1NdE2EWjU=;
	b=pz7duKlZYpGD1CTyF/POHpJxqT7wkGYksUMNdU8iWs5EP3pMuWqhb7mQvN6wN4NasONWJe
	GEDiYLZNrz/pWv0iRjuJbIfd3cgnz10cghERCjdYXAxvhK5MVC0oK+slgUdPYO8iOAjOfQ
	r9wpPIg/hB+ejIb2HqdmNL2g7c+AG2E=
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
 <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
 <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
Message-ID: <de44d94c-f018-ad77-8083-f5acc8ef7507@suse.com>
Date: Thu, 22 Apr 2021 17:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F0Yc8BA3IXYCie2CVrwFR4t5PxTxKUyZZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F0Yc8BA3IXYCie2CVrwFR4t5PxTxKUyZZ
Content-Type: multipart/mixed; boundary="apamsbglEX41XbtEqnkh9Lm22D1T4KpvS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Message-ID: <de44d94c-f018-ad77-8083-f5acc8ef7507@suse.com>
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
References: <20210422151007.2205-1-jgross@suse.com>
 <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
 <b69df7d3-6fcb-a565-9ec5-a272b6163320@suse.com>
 <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>
 <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
 <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>
In-Reply-To: <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>

--apamsbglEX41XbtEqnkh9Lm22D1T4KpvS
Content-Type: multipart/mixed;
 boundary="------------55018C58D764913433BA096E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------55018C58D764913433BA096E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.04.21 17:42, Jan Beulich wrote:
> On 22.04.2021 17:28, Juergen Gross wrote:
>> On 22.04.21 17:23, Jan Beulich wrote:
>>> On 22.04.2021 17:17, Juergen Gross wrote:
>>>> On 22.04.21 17:16, Jan Beulich wrote:
>>>>> On 22.04.2021 17:10, Juergen Gross wrote:
>>>>>> Some features of Xen can be assumed to be always present, so add a=

>>>>>> central check to verify this being true and remove the other check=
s.
>>>>>>
>>>>>> Juergen Gross (3):
>>>>>>      xen: check required Xen features
>>>>>>      xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for p=
v guests
>>>>>>      xen: assume XENFEAT_gnttab_map_avail_bits being set for pv gu=
ests
>>>>>
>>>>> I wonder whether it's a good idea to infer feature presence from
>>>>> version numbers. If (at some point in the past) you had inferred
>>>>> gnttab v2 being available by version, this would have been broken
>>>>> by its availability becoming controllable by a command line option
>>>>> in Xen.
>>>>
>>>> I'm testing the feature to be really present when booting and issue =
a
>>>> message if it is not there.
>>>
>>> And how does this help if the feature really isn't there yet other co=
de
>>> assumes it is?
>>
>> Did you look at the features I'm testing?
>=20
> I did, yes.
>=20
>> Those are really just low
>> level additions I can't imagine will ever be removed again.
>=20
> I don't expect them to be removed. But I don't think the people having
> contributed gnttab v2 expected any such for it, either.

There is a major difference here.

gnttab v2 was replacing an existing functionality by a more scalable,
but more complex solution.

The features I'm assuming to be present are basically repairing issues
which have been present due to omissions in the initial implementation.

Especially the XENFEAT_gnttab_map_avail_bits causes a racy workaround in
the kernel when not present. The race is only avoided in case the user
code is well-behaved. It is dom0 user code, yes, but nevertheless such
issues are never nice.


Juergen

--------------55018C58D764913433BA096E
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

--------------55018C58D764913433BA096E--

--apamsbglEX41XbtEqnkh9Lm22D1T4KpvS--

--F0Yc8BA3IXYCie2CVrwFR4t5PxTxKUyZZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCBmv8FAwAAAAAACgkQsN6d1ii/Ey/v
Vwf9Gw7dj26e80Pm5BriAq8iEhAv4IA2WJHwx70rVR5MzaIll9VAhRvgv7qWVwe/6kviOTWLwmhO
vHKzbzkeQeejjaBX6Wbl1Rpnihtgnv50PvxmNSlAkkt2KnaCa4HYjc71wIx0UZDLDrCxcAuHEEkM
EsMyUXwXj/aKc5VQSneU4o5ic8Uj2G4paThgAduYTcXpnAGWSMEZuvozaUx4O1GN66czuFDbqmyl
y72iwg0I9x8xI4keXXYVkVMvWL+L5/ANurHZ71r2ccE5nwTwDmufHqY5p2yr+GEV9cV0UN4DghY3
mA/u1GXWXSl7Y16HnkXyOrTlgOR/bj61wJ3APOeA7g==
=jITu
-----END PGP SIGNATURE-----

--F0Yc8BA3IXYCie2CVrwFR4t5PxTxKUyZZ--

