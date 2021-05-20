Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F8C389E1B
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 08:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130635.244578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljcN8-0004c4-Vy; Thu, 20 May 2021 06:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130635.244578; Thu, 20 May 2021 06:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljcN8-0004Zb-T4; Thu, 20 May 2021 06:41:30 +0000
Received: by outflank-mailman (input) for mailman id 130635;
 Thu, 20 May 2021 06:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RJtO=KP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ljcN7-0004ZT-9X
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 06:41:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f67741ca-acba-48c5-a5df-b5138bf8791b;
 Thu, 20 May 2021 06:41:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC806B024;
 Thu, 20 May 2021 06:41:26 +0000 (UTC)
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
X-Inumbo-ID: f67741ca-acba-48c5-a5df-b5138bf8791b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621492886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mVXTagReuGycKErdPG7FDZ+tTCn3ID5QCn8f5wW5t/E=;
	b=nAgwpRA4hRG2dfTSd1M7F/fv+pZmGlEOYjWV4tlabM+8ojkqVM+MAvcUKwayEd9oEdE3yJ
	TkOgph35BcWOkRZxdBbmKAHUEfYtgWq8IMKGYRq2moh0pN60BhRvJg3946DKK9JIZ2KinM
	9zeSjQqPp93uuU86XlKP/D+J4QpXk4E=
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, "Doebel, Bjoern" <doebel@amazon.de>,
 raphning@amazon.co.uk, "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <13bbb51e-f63d-a886-272f-e6a6252fb468@xen.org>
 <377d042d-40ec-dafc-3d03-370c4f5dbb4c@suse.com>
 <c14d7a27-b486-01c1-1a24-70f286c34431@xen.org>
 <b8413748-a889-8b0c-df93-2c93ed832369@xen.org>
 <95144b63-292b-3d60-b7d2-1847a1611fd6@suse.com>
 <911b7981-5c92-b224-1ce3-c312ebd423f7@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Preserving transactions accross Xenstored Live-Update
Message-ID: <9b2b0fc1-a0a3-043d-8924-05c05a547e91@suse.com>
Date: Thu, 20 May 2021 08:41:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <911b7981-5c92-b224-1ce3-c312ebd423f7@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pbXZBJu5LoogYkwt1xYBJxbQEUecFhGOK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pbXZBJu5LoogYkwt1xYBJxbQEUecFhGOK
Content-Type: multipart/mixed; boundary="lyWCHCmrnenusREgf0Ao9orD9SJ3bR7pm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, "Doebel, Bjoern" <doebel@amazon.de>,
 raphning@amazon.co.uk, "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <9b2b0fc1-a0a3-043d-8924-05c05a547e91@suse.com>
Subject: Re: Preserving transactions accross Xenstored Live-Update
References: <13bbb51e-f63d-a886-272f-e6a6252fb468@xen.org>
 <377d042d-40ec-dafc-3d03-370c4f5dbb4c@suse.com>
 <c14d7a27-b486-01c1-1a24-70f286c34431@xen.org>
 <b8413748-a889-8b0c-df93-2c93ed832369@xen.org>
 <95144b63-292b-3d60-b7d2-1847a1611fd6@suse.com>
 <911b7981-5c92-b224-1ce3-c312ebd423f7@xen.org>
In-Reply-To: <911b7981-5c92-b224-1ce3-c312ebd423f7@xen.org>

--lyWCHCmrnenusREgf0Ao9orD9SJ3bR7pm
Content-Type: multipart/mixed;
 boundary="------------823AEA93739DD27E2782A2E3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------823AEA93739DD27E2782A2E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.05.21 19:10, Julien Grall wrote:
> Hi Juergen,
>=20
> On 19/05/2021 13:50, Juergen Gross wrote:
>> On 19.05.21 14:33, Julien Grall wrote:
>>>
>>>
>>> On 19/05/2021 13:32, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 19/05/2021 10:09, Juergen Gross wrote:
>>>>> On 18.05.21 20:11, Julien Grall wrote:
>>>>>>
>>>>>> I have started to look at preserving transaction accross Live-upda=
te=20
>> in
>>>>>
>>>>>> C Xenstored. So far, I managed to transfer transaction that=20
>>>>>> read/write existing nodes.
>>>>>>
>>>>>> Now, I am running into trouble to transfer new/deleted node within=20
a=20
>>
>>>>>> transaction with the existing migration format.
>>>>>>
>>>>>> C Xenstored will keep track of nodes accessed during the transacti=
on=20
>>
>>>>>> but not the children (AFAICT for performance reason).
>>>>>
>>>>> Not performance reasons, but because there isn't any need for that:=

>>>>>
>>>>> The children are either unchanged (so the non-transaction node reco=
rds
>>>>> apply), or they will be among the tracked nodes (transaction node
>>>>> records apply). So in both cases all children should be known.
>>>> In theory, opening a new transaction means you will not see any=20
>>>> modification in the global database until the transaction has been=20
>>>> committed. What you describe would break that because a client would=20

>>>> be able to see new nodes added outside of the transaction.
>>>>
>>>> However, C Xenstored implements neither of the two. Currently, when =

>>>> a node is accessed within the transaction, we will also store the=20
>>>> names of the current children.
>>>>
>>>> To give an example with access to the global DB (prefixed with TID0)=20

>>>> and within a transaction (TID1)
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01) TID0: MKDIR "data/bar"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2) Start transactio=
n TID1
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03) TID1: DIRECTORY "data"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will cache =
thenode data
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A04) TID0: MKDIR "data/foo"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will create=20
"foo" in the global database
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A05) TID1: MKDIR "data/fish"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will create=20
"fish" inthe transaction
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A05) TID1: DIRECTORY "data"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> This will only r=
eturn "bar" and "fish"
>>>>
>>>> If we Live-Update between 4) and 5). Then we should make sure that=20
>>>> "bar" cannot be seen in the listing by TID1.
>>>
>>> I meant "foo" here. Sorry for the confusion.
>>>
>>>>
>>>> Therefore, I don't think we can restore the children using the=20
>>>> global node here. Instead we need to find a way to transfer the list=20

>>>> of known=20
>>
>>>> children within the transaction.
>>>>
>>>> As a fun fact, C Xenstored implements weirdly the transaction, so TI=
D1=20
>>
>>>> will be able to access "bar" if it knows the name but not list it.
>>
>> And this is the basic problem, I think.
>>
>> C Xenstored should be repaired by adding all (remaining) children of a=

>> node into the TID's database when the list of children is modified
>> either globally or in a transaction. A child having been added globall=
y
>> needs to be added as "deleted" into the TID's database.
>=20
> IIUC, for every modifications in the global database, we would need to =

> walk every single transactions and check whether a parent was accessed.=20

> Am I correct?

Not really. When a node is being read during a transaction and it is
found in the global data base only, its gen-count can be tested for
being older or newer than the transaction start. If it is newer we can
traverse the path up to "/" and treat each parent the same way (so if
a parent is found in the transaction data base, the presence of the
child can be verified, and if it is global only, the gen-count can be
tested against the transaction again).

> If so, I don't think this is a workable solution because of the cost to=20

> execute a single command.

My variant will affect the transaction internal reads only, and the
additional cost will be limited by the distance of the read node from
the root node.

> Is it something you plan to address differently with your rework of the=20
DB?

Yes. I want to have the transaction specific variants of nodes linked to
the global ones, which solves this problem in an easy way.


Juergen

--------------823AEA93739DD27E2782A2E3
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

--------------823AEA93739DD27E2782A2E3--

--lyWCHCmrnenusREgf0Ao9orD9SJ3bR7pm--

--pbXZBJu5LoogYkwt1xYBJxbQEUecFhGOK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCmBJUFAwAAAAAACgkQsN6d1ii/Ey+H
QQf/ek+rawQt/Cf2PlUToX1R5xK/Pb9FPIlWCA1WjW5KTXwFyoo955g/OJOlSHlZZUIVAjd5wO4t
RunPAAU9wARy83x7LzZmAyoKJnGOSPsU+kpZslhn4XIqEpQhcB3mfURo7doxSKf5cyo9Pk1ZcI9h
WkEW4MpBRzTgkXTCvil4gWMMMoleiviF3/511Bs5IFGDQvpuCuOOuxdagUPT1AlwTHSJFLYbK/H+
lw7/utyvnYef9Vp3M32PvmNbOpx67aXcQ61jLmJAycbuZNsR2672AO6BgvxLL1blm808rXAlyuFG
ctOXgt/edB3AfjQJuzkF6qPcg/jjzPtF9dj0bCZZaQ==
=ogy7
-----END PGP SIGNATURE-----

--pbXZBJu5LoogYkwt1xYBJxbQEUecFhGOK--

