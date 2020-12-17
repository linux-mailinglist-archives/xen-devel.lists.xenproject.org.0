Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434682DD046
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 12:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55867.97454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kprOZ-00033h-8w; Thu, 17 Dec 2020 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55867.97454; Thu, 17 Dec 2020 11:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kprOZ-00033I-5p; Thu, 17 Dec 2020 11:24:31 +0000
Received: by outflank-mailman (input) for mailman id 55867;
 Thu, 17 Dec 2020 11:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kprOX-00033D-M1
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 11:24:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e131b507-f56c-4203-9743-48af4942746c;
 Thu, 17 Dec 2020 11:24:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38CE9AC7B;
 Thu, 17 Dec 2020 11:24:25 +0000 (UTC)
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
X-Inumbo-ID: e131b507-f56c-4203-9743-48af4942746c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608204265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MP9UxfvgjBLYYDtLO5UiNo0vpABNC26Bp38hk0HlVaI=;
	b=p4WpRp+JJZtle1GcXGfKt4WaRTh9E5R5rioyP6Hc2BCSETUeV6OR3hPOoUWLXGgunXFn+N
	BiFuTOQk4UfwPJcmN8r19ETLX5PtgWWl7Zb7EYf9R3q17emC25VuvRLwrN4iiKpdPQpNc3
	nXeFUjL375z/w0Rlkv2oDWfvw/6Dqs0=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-5-jgross@suse.com>
 <beda1152-4cab-2ed2-bc76-e9125f805e3f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v3 4/8] xen/hypfs: support dynamic hypfs nodes
Message-ID: <4be1bda2-ca1a-1e81-6212-9a6a44af39da@suse.com>
Date: Thu, 17 Dec 2020 12:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <beda1152-4cab-2ed2-bc76-e9125f805e3f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3byKQ92V0fZYiP4p59zikbCv8wwTsmUOk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3byKQ92V0fZYiP4p59zikbCv8wwTsmUOk
Content-Type: multipart/mixed; boundary="619p0ZPhdHxSjovfHG40hyz2QLAjN5mhr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <4be1bda2-ca1a-1e81-6212-9a6a44af39da@suse.com>
Subject: Re: [PATCH v3 4/8] xen/hypfs: support dynamic hypfs nodes
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-5-jgross@suse.com>
 <beda1152-4cab-2ed2-bc76-e9125f805e3f@suse.com>
In-Reply-To: <beda1152-4cab-2ed2-bc76-e9125f805e3f@suse.com>

--619p0ZPhdHxSjovfHG40hyz2QLAjN5mhr
Content-Type: multipart/mixed;
 boundary="------------2DA53DB95359E2404CC4A16D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2DA53DB95359E2404CC4A16D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.20 12:01, Jan Beulich wrote:
> On 09.12.2020 17:09, Juergen Gross wrote:
>> @@ -158,6 +159,30 @@ static void node_exit_all(void)
>>           node_exit(*last);
>>   }
>>  =20
>> +void *hypfs_alloc_dyndata_size(unsigned long size)
>> +{
>> +    unsigned int cpu =3D smp_processor_id();
>> +
>> +    ASSERT(per_cpu(hypfs_locked, cpu) !=3D hypfs_unlocked);
>> +    ASSERT(per_cpu(hypfs_dyndata, cpu) =3D=3D NULL);
>> +
>> +    per_cpu(hypfs_dyndata, cpu) =3D xzalloc_bytes(size);
>> +
>> +    return per_cpu(hypfs_dyndata, cpu);
>> +}
>> +
>> +void *hypfs_get_dyndata(void)
>> +{
>> +    ASSERT(this_cpu(hypfs_dyndata));
>> +
>> +    return this_cpu(hypfs_dyndata);
>> +}
>> +
>> +void hypfs_free_dyndata(void)
>> +{
>> +    XFREE(this_cpu(hypfs_dyndata));
>> +}
>=20
> In all three cases, would an intermediate local variable perhaps
> yield better generated code? (In hypfs_get_dyndata() this may be
> less important because the 2nd use is only an ASSERT().)

Okay.

>=20
>> @@ -219,6 +244,12 @@ int hypfs_add_dir(struct hypfs_entry_dir *parent,=

>>       return ret;
>>   }
>>  =20
>> +void hypfs_add_dyndir(struct hypfs_entry_dir *parent,
>> +                      struct hypfs_entry_dir *template)
>> +{
>> +    template->e.parent =3D &parent->e;
>> +}
>=20
> I'm struggling with the direction here: This makes the template
> point at the parent, but the parent will still have no
> "knowledge" of its new templated children. I suppose that's how
> it is meant to be, but maybe this could do with a comment, since
> it's the opposite way of hypfs_add_dir()?

I'll add a comment.

>=20
> Also - does this mean parent may not also have further children,
> templated or "normal"?

No, the related read and findentry functions just need to cover that
case, e.g. by calling multiple sub-functions.

>=20
>> @@ -177,6 +182,10 @@ struct hypfs_entry *hypfs_leaf_findentry(const st=
ruct hypfs_entry_dir *dir,
>>   struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir=
 *dir,
>>                                           const char *name,
>>                                           unsigned int name_len);
>> +void *hypfs_alloc_dyndata_size(unsigned long size);
>> +#define hypfs_alloc_dyndata(type) (type *)hypfs_alloc_dyndata_size(si=
zeof(type))
>=20
> This wants an extra pair of parentheses.

Okay.

>=20
> As a minor point, I also wonder whether you really want the type
> unsafe version to be easily usable. It would be possible to
> largely "hide" it by having
>=20
> void *hypfs_alloc_dyndata(unsigned long size);
> #define hypfs_alloc_dyndata(type) ((type *)hypfs_alloc_dyndata(sizeof(t=
ype)))

Yes, will change.


Juergen

--------------2DA53DB95359E2404CC4A16D
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

--------------2DA53DB95359E2404CC4A16D--

--619p0ZPhdHxSjovfHG40hyz2QLAjN5mhr--

--3byKQ92V0fZYiP4p59zikbCv8wwTsmUOk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/bP+gFAwAAAAAACgkQsN6d1ii/Ey/c
XQf/VmTTWXQ1hnUoTh5Od67AZC+vnmhPE29GEsZ8HoXCLIjgenFzVeZtME6bYKAs9XLSBCv9v7Dp
tonRCj4qb7Zvf/cinvtSQQWKmu4SZGzbmmzeKIS9En3ZxTFNwAev7oZUTA3YzlkksAw7rCbA2HKd
FCR43hOvk0U+phdMC9Dexny434J5dWpGX6c2+pDgq76ohKZEVwG1AKB6aSOUs9FmtdvqAljeHw+L
SNPHOvM3z9cE/c/Lzs5wJBS4DTD5Y9+G0sMZLoec+X/Gsda5SE/USJO689aULqErV4T7s/3dRs0F
5U+xQ1CclVGEhQjjh4mGjf4Eeh57GHHf+zR7dPMyDA==
=yxgV
-----END PGP SIGNATURE-----

--3byKQ92V0fZYiP4p59zikbCv8wwTsmUOk--

