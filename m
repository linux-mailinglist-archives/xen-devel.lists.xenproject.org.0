Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2649F2C9C83
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 10:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41790.75237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1oF-00042J-8i; Tue, 01 Dec 2020 09:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41790.75237; Tue, 01 Dec 2020 09:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1oF-00041u-5W; Tue, 01 Dec 2020 09:18:55 +0000
Received: by outflank-mailman (input) for mailman id 41790;
 Tue, 01 Dec 2020 09:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk1oD-00041p-3w
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 09:18:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf825411-e4df-4939-aa9b-748e5bd81716;
 Tue, 01 Dec 2020 09:18:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54D22AB7F;
 Tue,  1 Dec 2020 09:18:51 +0000 (UTC)
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
X-Inumbo-ID: bf825411-e4df-4939-aa9b-748e5bd81716
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606814331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fWCxlC/CJPteGvSTp3tr4/lUzzyoA57LjvB2UgrxZWw=;
	b=rjpcSS3O7m/Xi7uTaCmvfz3tE6ivFdGzymgl7txFLvPNPvB9Drc40gIoLtlvVjsnvExPcO
	DNmm8/YzMmVMW8QnXAr9oIkbK1hHX4b6JmTjyQ5aANjF+J5wgor5ssu9dox1czWDRnmMhK
	XGS0hAPdnMrnvMe3n6O7Oj5XR/mo/OI=
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal list
 interface
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-6-jgross@suse.com>
 <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
Date: Tue, 1 Dec 2020 10:18:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DF6v35XDwOFfwLeKbACaaapOh4TuO42x6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DF6v35XDwOFfwLeKbACaaapOh4TuO42x6
Content-Type: multipart/mixed; boundary="hueREzuxdUo116A2T10fiR8Gvh92XlugY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal list
 interface
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-6-jgross@suse.com>
 <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
In-Reply-To: <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>

--hueREzuxdUo116A2T10fiR8Gvh92XlugY
Content-Type: multipart/mixed;
 boundary="------------E9628A0BADD5F12DA357219C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E9628A0BADD5F12DA357219C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.12.20 10:12, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>> @@ -260,23 +257,42 @@ static struct cpupool *cpupool_create(
>>  =20
>>       spin_lock(&cpupool_lock);
>>  =20
>> -    for_each_cpupool(q)
>> +    if ( poolid !=3D CPUPOOLID_NONE )
>>       {
>> -        last =3D (*q)->cpupool_id;
>> -        if ( (poolid !=3D CPUPOOLID_NONE) && (last >=3D poolid) )
>> -            break;
>> +        q =3D __cpupool_find_by_id(poolid, false);
>> +        if ( !q )
>> +            list_add_tail(&c->list, &cpupool_list);
>> +        else
>> +        {
>> +            list_add_tail(&c->list, &q->list);
>> +            if ( q->cpupool_id =3D=3D poolid )
>> +            {
>> +                *perr =3D -EEXIST;
>> +                goto err;
>> +            }
>=20
> You bail _after_ having added the new entry to the list?

Yes, this is making exit handling easier.

>=20
>> +        }
>> +
>> +        c->cpupool_id =3D poolid;
>>       }
>> -    if ( *q !=3D NULL )
>> +    else
>>       {
>> -        if ( (*q)->cpupool_id =3D=3D poolid )
>> +        /* Cpupool 0 is created with specified id at boot and never r=
emoved. */
>> +        ASSERT(!list_empty(&cpupool_list));
>> +
>> +        q =3D list_last_entry(&cpupool_list, struct cpupool, list);
>> +        /* In case of wrap search for first free id. */
>> +        if ( q->cpupool_id =3D=3D CPUPOOLID_NONE - 1 )
>>           {
>> -            *perr =3D -EEXIST;
>> -            goto err;
>> +            list_for_each_entry(q, &cpupool_list, list)
>> +                if ( q->cpupool_id + 1 !=3D list_next_entry(q, list)-=
>cpupool_id )
>> +                    break;
>>           }
>> -        c->next =3D *q;
>> +
>> +        list_add(&c->list, &q->list);
>> +
>> +        c->cpupool_id =3D q->cpupool_id + 1;
>=20
> What guarantees that you managed to find an unused ID, other
> than at current CPU speeds it taking too long to create 4
> billion pools? Since you're doing this under lock, wouldn't
> it help anyway to have a global helper variable pointing at
> the lowest pool followed by an unused ID?

An admin doing that would be quite crazy and wouldn't deserve better.

For being usable a cpupool needs to have a cpu assigned to it. And I
don't think we are coming even close to 4 billion supported cpus. :-)

Yes, it would be possible to create 4 billion empty cpupools, but for
what purpose? There are simpler ways to make the system unusable with
dom0 root access.


Juergen

--------------E9628A0BADD5F12DA357219C
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

--------------E9628A0BADD5F12DA357219C--

--hueREzuxdUo116A2T10fiR8Gvh92XlugY--

--DF6v35XDwOFfwLeKbACaaapOh4TuO42x6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/GCnoFAwAAAAAACgkQsN6d1ii/Ey8I
Bwf8DLsGEHdQnlflzpqp5MBbqCGgCPsdOh62BQMbslNw/nYeEa3e1iJZBnQOE2lngGgDl1iUNMlS
Zh18OqdmMi0BfZF5HkJi+C7TUXPD/DWQwYKWraDayNFhFtPNWD1DmnJYB+c+Nioqt8CB6O53iSQX
xaor7aXO8s07kYFBQuYlvy3U56Kjeyl2k0kG4hiYGsnNEYnSELDRfgOIMH2aUzG/uSzcHhhc7xbu
ZomzMVVyL4Y8e0nO1dcwSLqw/bzvmsj4bjY8V8Rqd+jP6dOoKXLqdTIBI8elritIoGC5RHIiuoZg
bKZtxr3kXQa2kKG/F+SEfKgoXfde4p1dQggz3a/27Q==
=9rvz
-----END PGP SIGNATURE-----

--DF6v35XDwOFfwLeKbACaaapOh4TuO42x6--

