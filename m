Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111362FEFD8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 17:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72251.129952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cXu-0004ea-5V; Thu, 21 Jan 2021 16:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72251.129952; Thu, 21 Jan 2021 16:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cXu-0004eB-1L; Thu, 21 Jan 2021 16:10:54 +0000
Received: by outflank-mailman (input) for mailman id 72251;
 Thu, 21 Jan 2021 16:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EIdR=GY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2cXr-0004e6-Rm
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 16:10:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 797eb91a-6fd0-42c8-8cb6-ce1b692d940f;
 Thu, 21 Jan 2021 16:10:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CED7B725;
 Thu, 21 Jan 2021 16:10:49 +0000 (UTC)
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
X-Inumbo-ID: 797eb91a-6fd0-42c8-8cb6-ce1b692d940f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611245449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HE0PbjkyJ2/rBNn4JeF3GPM3ZN/ylEw1RLJlM0Yh584=;
	b=ce72U8kw5KII7FoFLfCiOEHmtEVDsUsdvLGl2Goco2iYcVsIfcicCsTIeYoC/UTvpYsDsy
	nSPmXoHsuYaOhnOHzHicRVK2fCnUwBE3ftgYMtPRyFGzwZAFHOsxfl5olNF9udBdItMDPA
	w8WAoQNPsHHVSs3LKNzL3AC/SKk4ZKo=
Subject: Re: [PATCH v4 5/5] xen/cpupool: make per-cpupool sched-gran hypfs
 node writable
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210118115516.11001-1-jgross@suse.com>
 <20210118115516.11001-6-jgross@suse.com>
 <d2d99ac9-07e4-68fc-bfaa-51edaff7055b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4ae28f6a-e52c-e093-9f36-469d895fa18c@suse.com>
Date: Thu, 21 Jan 2021 17:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d2d99ac9-07e4-68fc-bfaa-51edaff7055b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qon7Ynu5keY4N3sTd2wtXxozpr5htcziv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qon7Ynu5keY4N3sTd2wtXxozpr5htcziv
Content-Type: multipart/mixed; boundary="3f4VTPrNAlpetkfgmlUh1F0sAFUvvEEJU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Message-ID: <4ae28f6a-e52c-e093-9f36-469d895fa18c@suse.com>
Subject: Re: [PATCH v4 5/5] xen/cpupool: make per-cpupool sched-gran hypfs
 node writable
References: <20210118115516.11001-1-jgross@suse.com>
 <20210118115516.11001-6-jgross@suse.com>
 <d2d99ac9-07e4-68fc-bfaa-51edaff7055b@suse.com>
In-Reply-To: <d2d99ac9-07e4-68fc-bfaa-51edaff7055b@suse.com>

--3f4VTPrNAlpetkfgmlUh1F0sAFUvvEEJU
Content-Type: multipart/mixed;
 boundary="------------2FE74F59BC15A43B58A07EC9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2FE74F59BC15A43B58A07EC9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.01.21 16:55, Jan Beulich wrote:
> On 18.01.2021 12:55, Juergen Gross wrote:
>> Make /cpupool/<id>/sched-gran in hypfs writable. This will enable per
>> cpupool selectable scheduling granularity.
>>
>> Writing this node is allowed only with no cpu assigned to the cpupool.=

>> Allowed are values "cpu", "core" and "socket".
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two small adjustment requests:
>=20
>> @@ -85,36 +85,43 @@ static int __init sched_select_granularity(const c=
har *str)
>>       {
>>           if ( strcmp(sg_name[i].name, str) =3D=3D 0 )
>>           {
>> -            opt_sched_granularity =3D sg_name[i].mode;
>> +            *mode =3D sg_name[i].mode;
>>               return 0;
>>           }
>>       }
>>  =20
>>       return -EINVAL;
>>   }
>> +
>> +static int __init sched_select_granularity(const char *str)
>> +{
>> +    return sched_gran_get(str, &opt_sched_granularity);
>> +}
>>   custom_param("sched-gran", sched_select_granularity);
>> +#elif CONFIG_HYPFS
>=20
> Missing defined().
>=20
>> @@ -1126,17 +1136,55 @@ static unsigned int hypfs_gran_getsize(const s=
truct hypfs_entry *entry)
>>       return strlen(gran) + 1;
>>   }
>>  =20
>> +static int cpupool_gran_write(struct hypfs_entry_leaf *leaf,
>> +                              XEN_GUEST_HANDLE_PARAM(const_void) uadd=
r,
>> +                              unsigned int ulen)
>> +{
>> +    const struct hypfs_dyndir_id *data;
>> +    struct cpupool *cpupool;
>> +    enum sched_gran gran;
>> +    unsigned int sched_gran =3D 0;
>> +    char name[SCHED_GRAN_NAME_LEN];
>> +    int ret =3D 0;
>> +
>> +    if ( ulen > SCHED_GRAN_NAME_LEN )
>> +        return -ENOSPC;
>> +
>> +    if ( copy_from_guest(name, uaddr, ulen) )
>> +        return -EFAULT;
>> +
>> +    if ( memchr(name, 0, ulen) =3D=3D (name + ulen - 1) )
>> +        sched_gran =3D sched_gran_get(name, &gran) ?
>> +                     0 : cpupool_check_granularity(gran);
>> +    if ( sched_gran =3D=3D 0 )
>> +        return -EINVAL;
>> +
>> +    data =3D hypfs_get_dyndata();
>> +    cpupool =3D data->data;
>> +    ASSERT(cpupool);
>> +
>> +    if ( !cpumask_empty(cpupool->cpu_valid) )
>> +        ret =3D -EBUSY;
>> +    else
>> +    {
>> +        cpupool->gran =3D gran;
>> +        cpupool->sched_gran =3D sched_gran;
>> +    }
>=20
> I think this could do with a comment clarifying what lock this
> is protected by, as the function itself has no sign of any
> locking, not even an assertion that a certain lock is being held.
> If you were to suggest some text, this as well as the minor issue
> above could likely be taken care of while committing.

cpupool_gran_[read|write]() are both guarded by the cpupool_lock
taken via cpupool_dir_enter().


Juergen

--------------2FE74F59BC15A43B58A07EC9
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

--------------2FE74F59BC15A43B58A07EC9--

--3f4VTPrNAlpetkfgmlUh1F0sAFUvvEEJU--

--qon7Ynu5keY4N3sTd2wtXxozpr5htcziv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAJp4gFAwAAAAAACgkQsN6d1ii/Ey/c
5QgAjQdo4poGt4c6/yJfIeu0fcdta5ZWPnFZ2Z/VOHnbFaCX5TdTr7J4cdFYhslMh1Pjr6R1hPRT
2RRbYVdcDx4eIjGhhgofM6wShjUXq4Tn/P6CMyU3VL7Gc6Pj1rKkNNDxA+MN4cw34R/GAn2DOZO8
3CjejmPAIFRVG0chYvUa6E9g7Y+LztaEwlyLsXfq4UAwlvQWdaQmoYFDD/HqIHqVAjo7IVMloMjJ
SF88x2xgz81/xsYJnJ6OyBOrJ4AyGqi4Jf0my20solax/1h6cWpJ493U0xiPr0Fl5FyPxeVfSgRH
r8A63vBX3KlEzbAGZjX5IaXKMOQBerlnTSFQleiLAA==
=zglI
-----END PGP SIGNATURE-----

--qon7Ynu5keY4N3sTd2wtXxozpr5htcziv--

