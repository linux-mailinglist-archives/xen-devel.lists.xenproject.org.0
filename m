Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63B388E62
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 14:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130076.243876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLeS-0003Bh-9V; Wed, 19 May 2021 12:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130076.243876; Wed, 19 May 2021 12:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLeS-00039p-4i; Wed, 19 May 2021 12:50:16 +0000
Received: by outflank-mailman (input) for mailman id 130076;
 Wed, 19 May 2021 12:50:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iEmX=KO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ljLeQ-00039f-9R
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 12:50:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3204d45d-16cc-4623-9c62-d91e2b399ebf;
 Wed, 19 May 2021 12:50:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A7C0AED7;
 Wed, 19 May 2021 12:50:12 +0000 (UTC)
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
X-Inumbo-ID: 3204d45d-16cc-4623-9c62-d91e2b399ebf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621428612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBhF9NACif15HSNzoliXA7saFgfM+oNn346W0Y6vd+M=;
	b=Y7K4C1QtA56hQCNSa2KvZTiUsQQwhnOkb7HhprZFsvL1KO673mi1NxU5oKq+sB2zT12eYj
	d1WzY7LFDzNApojaie5dDW4lwse5rNFI05+nwFEO1/US6zbv2py5t2Ni1vhUKlgS3hZ0Og
	N/Ae/nWwOer3rOcvi0WZqvt8FHjR4HA=
Subject: Re: Preserving transactions accross Xenstored Live-Update
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, "Doebel, Bjoern" <doebel@amazon.de>,
 raphning@amazon.co.uk, "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <13bbb51e-f63d-a886-272f-e6a6252fb468@xen.org>
 <377d042d-40ec-dafc-3d03-370c4f5dbb4c@suse.com>
 <c14d7a27-b486-01c1-1a24-70f286c34431@xen.org>
 <b8413748-a889-8b0c-df93-2c93ed832369@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <95144b63-292b-3d60-b7d2-1847a1611fd6@suse.com>
Date: Wed, 19 May 2021 14:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b8413748-a889-8b0c-df93-2c93ed832369@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iDH0aVccMOs4XnyG2g8xEsPXqCpFs9zyg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iDH0aVccMOs4XnyG2g8xEsPXqCpFs9zyg
Content-Type: multipart/mixed; boundary="QGImb2DvUUkWPU3p9vgHyO63SCX6sFpCc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, "Doebel, Bjoern" <doebel@amazon.de>,
 raphning@amazon.co.uk, "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <95144b63-292b-3d60-b7d2-1847a1611fd6@suse.com>
Subject: Re: Preserving transactions accross Xenstored Live-Update
References: <13bbb51e-f63d-a886-272f-e6a6252fb468@xen.org>
 <377d042d-40ec-dafc-3d03-370c4f5dbb4c@suse.com>
 <c14d7a27-b486-01c1-1a24-70f286c34431@xen.org>
 <b8413748-a889-8b0c-df93-2c93ed832369@xen.org>
In-Reply-To: <b8413748-a889-8b0c-df93-2c93ed832369@xen.org>

--QGImb2DvUUkWPU3p9vgHyO63SCX6sFpCc
Content-Type: multipart/mixed;
 boundary="------------2924E910E0C4D61D5FEBF81B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2924E910E0C4D61D5FEBF81B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.05.21 14:33, Julien Grall wrote:
>=20
>=20
> On 19/05/2021 13:32, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 19/05/2021 10:09, Juergen Gross wrote:
>>> On 18.05.21 20:11, Julien Grall wrote:
>>>>
>>>> I have started to look at preserving transaction accross Live-update=20
in=20
>>>
>>>> C Xenstored. So far, I managed to transfer transaction that=20
>>>> read/write existing nodes.
>>>>
>>>> Now, I am running into trouble to transfer new/deleted node within a=20

>>>> transaction with the existing migration format.
>>>>
>>>> C Xenstored will keep track of nodes accessed during the transaction=20

>>>> but not the children (AFAICT for performance reason).
>>>
>>> Not performance reasons, but because there isn't any need for that:
>>>
>>> The children are either unchanged (so the non-transaction node record=
s
>>> apply), or they will be among the tracked nodes (transaction node
>>> records apply). So in both cases all children should be known.
>> In theory, opening a new transaction means you will not see any=20
>> modification in the global database until the transaction has been=20
>> committed. What you describe would break that because a client would=20
>> be able to see new nodes added outside of the transaction.
>>
>> However, C Xenstored implements neither of the two. Currently, when a =

>> node is accessed within the transaction, we will also store the names =

>> of the current children.
>>
>> To give an example with access to the global DB (prefixed with TID0)=20
>> and within a transaction (TID1)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01) TID0: MKDIR "data/bar"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2) Start transaction =
TID1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03) TID1: DIRECTORY "data"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will cache th=
e node data
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A04) TID0: MKDIR "data/foo"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will create "=
foo" in the global database
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A05) TID1: MKDIR "data/fish"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will create "=
fish" inthe transaction
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A05) TID1: DIRECTORY "data"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will only ret=
urn "bar" and "fish"
>>
>> If we Live-Update between 4) and 5). Then we should make sure that=20
>> "bar" cannot be seen in the listing by TID1.
>=20
> I meant "foo" here. Sorry for the confusion.
>=20
>>
>> Therefore, I don't think we can restore the children using the global =

>> node here. Instead we need to find a way to transfer the list of known=20

>> children within the transaction.
>>
>> As a fun fact, C Xenstored implements weirdly the transaction, so TID1=20

>> will be able to access "bar" if it knows the name but not list it.

And this is the basic problem, I think.

C Xenstored should be repaired by adding all (remaining) children of a
node into the TID's database when the list of children is modified
either globally or in a transaction. A child having been added globally
needs to be added as "deleted" into the TID's database.


Juergen

--------------2924E910E0C4D61D5FEBF81B
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------2924E910E0C4D61D5FEBF81B--

--QGImb2DvUUkWPU3p9vgHyO63SCX6sFpCc--

--iDH0aVccMOs4XnyG2g8xEsPXqCpFs9zyg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmClCYMFAwAAAAAACgkQsN6d1ii/Ey9H
8Af6A4HR4UT1jJsyp+tKtF+jnGN4IE5/vZp8CEkVwwQOjDRqxc6ohlKTy9dJcowFGNh7jbrdbspv
hQyHXrT1TEISie/aMwrPL0BoUPzsH8y+mSAKe/H5tSvZZu2AqezwNQvO3LSA/KJHYtCJbK6NOzM6
zaxruJ4mH1pwHFjmoyKuib7AbAZMjNRJ2dy3PHcFa5ONYC8KiWEIXP4DcpOLJjME32N0ZUpMTBob
KMBvDBNJ5/5LkrmyPXutXhBy5a4P+cCMfnZ+q+MAokYUpJD9kHT4iPKLTAF9W88Q+zQ3W1ZbMBLf
zUa3giyZ3Dcx1JIK6vgWduWOYzlzvWk0H4JsKDD6sw==
=ed1i
-----END PGP SIGNATURE-----

--iDH0aVccMOs4XnyG2g8xEsPXqCpFs9zyg--

