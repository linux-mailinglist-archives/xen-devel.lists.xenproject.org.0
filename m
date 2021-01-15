Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9132F738B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 08:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67689.120952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0JGL-0008Sr-5Y; Fri, 15 Jan 2021 07:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67689.120952; Fri, 15 Jan 2021 07:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0JGL-0008SS-2E; Fri, 15 Jan 2021 07:11:13 +0000
Received: by outflank-mailman (input) for mailman id 67689;
 Fri, 15 Jan 2021 07:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0JGJ-0008SN-CR
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 07:11:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 347cfaf8-8a0a-484c-9a98-9efaa0ec038b;
 Fri, 15 Jan 2021 07:11:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CA13AB7A;
 Fri, 15 Jan 2021 07:11:08 +0000 (UTC)
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
X-Inumbo-ID: 347cfaf8-8a0a-484c-9a98-9efaa0ec038b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610694668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FPYYUNXR3uCVIaBn0lurWALGM5JsyzYXK93n/ui6d7A=;
	b=gmaPjyMZAICqvvGH0NlmOj14tq+leqDLPL9TrNMkuL0VXBCPVQB7PuhogCjMlu3/i4uZvo
	R23CpKlcjnqXCQkZNSVWJq2qckPAa0qfEMD5Lolo6+CINwc14xmoKoOIbpOJa/zNPiye+D
	UtvCkozvv2vvy7K3cTHsnzhqV39UyEE=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-6-jgross@suse.com>
 <21c113c0-9118-8c22-7c3b-50ffccb4db8c@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v11 05/27] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
Message-ID: <b7e9dd8f-bd47-8d20-efc8-75aa8f6fee68@suse.com>
Date: Fri, 15 Jan 2021 08:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <21c113c0-9118-8c22-7c3b-50ffccb4db8c@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uWZYBBcJKy9I3ATVk0OvSsPaK9uUe2dCy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uWZYBBcJKy9I3ATVk0OvSsPaK9uUe2dCy
Content-Type: multipart/mixed; boundary="K1FqjKGGmABY4mPW4fq7IFNml4VIXkI7m";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
Message-ID: <b7e9dd8f-bd47-8d20-efc8-75aa8f6fee68@suse.com>
Subject: Re: [PATCH v11 05/27] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-6-jgross@suse.com>
 <21c113c0-9118-8c22-7c3b-50ffccb4db8c@citrix.com>
In-Reply-To: <21c113c0-9118-8c22-7c3b-50ffccb4db8c@citrix.com>

--K1FqjKGGmABY4mPW4fq7IFNml4VIXkI7m
Content-Type: multipart/mixed;
 boundary="------------331E962FC3FA629F4E6330F8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------331E962FC3FA629F4E6330F8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.01.21 02:01, Andrew Cooper wrote:
> On 14/01/2021 15:37, Juergen Gross wrote:
>> diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
>> index 3e9b6e7323..b6dd8f3186 100644
>> --- a/tools/include/xenevtchn.h
>> +++ b/tools/include/xenevtchn.h
>> @@ -64,11 +64,25 @@ struct xentoollog_logger;
>>    *
>>    * Calling xenevtchn_close() is the only safe operation on a
>>    * xenevtchn_handle which has been inherited.
>> + *
>> + * Setting XENEVTCHN_NO_CLOEXEC allows to keep the file descriptor us=
ed
>> + * for the event channel driver open across exec(2). In order to be a=
ble
>> + * to use that file descriptor the new binary activated via exec(2) h=
as
>> + * to call xenevtchn_fdopen() with that file descriptor as parameter =
in
>> + * order to associate it with a new handle. The file descriptor can b=
e
>> + * obtained via xenevtchn_fd() before calling exec(2).
>>    */
>=20
> Earlier commentary in this block is already wrong (refer to gnttab, and=

> making what appear to be false claims), and/or made stale by this chang=
e.
>=20
> How about:
>=20
> /*
>  =C2=A0* Opens the evtchn device node.=C2=A0 Return a handle to the eve=
nt channel
>  =C2=A0* driver, or NULL on failure, in which case errno will be set
>  =C2=A0* appropriately.
>  =C2=A0*
>  =C2=A0* On fork(2):
>  =C2=A0*
>  =C2=A0*=C2=A0=C2=A0 After fork, a child process must not use any opene=
d evtchn handle
>  =C2=A0*=C2=A0=C2=A0 inherited from their parent.=C2=A0 This includes o=
perations such as
>  =C2=A0*=C2=A0=C2=A0 poll() on the underlying file descriptor.=C2=A0 Ca=
lling xenevtchn_close()
>  =C2=A0*=C2=A0=C2=A0 is the only safe operation on a xenevtchn_handle w=
hich has been
>  =C2=A0*=C2=A0=C2=A0 inherited.
>  =C2=A0*
>  =C2=A0*=C2=A0=C2=A0 The child must open a new handle if they want to i=
nteract with
>  =C2=A0*=C2=A0=C2=A0 evtchn.
>  =C2=A0*
>  =C2=A0* On exec(2):
>  =C2=A0*
>  =C2=A0*=C2=A0=C2=A0 Wherever possible, the device node will be opened =
with O_CLOEXEC,
>  =C2=A0*=C2=A0=C2=A0 so it is not inherited by the subsequent program.
>  =C2=A0*
>  =C2=A0*=C2=A0=C2=A0 However the XENEVTCHN_NO_CLOEXEC flag may be used =
to avoid opening
>  =C2=A0*=C2=A0=C2=A0 the device node with O_CLOEXEC.=C2=A0 This is inte=
nded for use by
>  =C2=A0*=C2=A0=C2=A0 daemons which support a self-reexec method of upda=
ting themselves.
>  =C2=A0*
>  =C2=A0*=C2=A0=C2=A0 In this case, the updated daemon should pass the u=
nderlying file
>  =C2=A0*=C2=A0=C2=A0 descriptor it inherited to xenevtchn_fdopen() to r=
econstruct the
>  =C2=A0*=C2=A0=C2=A0 library handle.
>  =C2=A0*/
>=20
> which I think is somewhat more concise?

Yes, I'll change it.

>=20
>=20
>> -/* Currently no flags are defined */
>> +
>> +/* Don't set O_CLOEXEC when opening event channel driver node. */
>> +#define XENEVTCHN_NO_CLOEXEC 0x01
>=20
> Do we really want an byte-looking constant?=C2=A0 Wouldn't (1 << 0) be =
a more
> normal way of writing this?

Fine with me.

>=20
>> +
>>   xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
>>                                    unsigned int flags);
>>  =20
>> +/* Flag XENEVTCHN_NO_CLOEXEC is ignored by xenevtchn_fdopen(). */
>> +xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
>> +                                    int fd, unsigned open_flags);
>=20
> True, but see below...
>=20
>> +
>>   /*
>>    * Close a handle previously allocated with xenevtchn_open().
>=20
> xenevtchn_{,fd}open(), now.

Ah, right.

>=20
>> diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
>> index c069d5da71..f2ab27384b 100644
>> --- a/tools/libs/evtchn/core.c
>> +++ b/tools/libs/evtchn/core.c
>>
>> +xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
>> +                                   int fd, unsigned int flags)
>> +{
>> +    xenevtchn_handle *xce;
>> +
>> +    if ( flags & ~XENEVTCHN_NO_CLOEXEC )
>> +    {
>> +        errno =3D EINVAL;
>> +        return NULL;
>> +    }
>=20
> Do we really want to tolerate XENEVTCHN_NO_CLOEXEC here?=C2=A0 I'd sugg=
est
> rejecting it, because nothing good can come of a caller thinking it has=

> avoided setting O_CLOEXEC when in fact it hasn't.

Fine with me.

>=20
>> diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c=

>> index bb601f350f..ed2baf3c95 100644
>> --- a/tools/libs/evtchn/freebsd.c
>> +++ b/tools/libs/evtchn/freebsd.c
>> @@ -33,8 +33,12 @@
>>  =20
>>   int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>>   {
>> -    int fd =3D open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
>> +    int open_flags =3D O_RDWR;
>> +    int fd;
>>  =20
>> +    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
>> +        open_flags |=3D O_CLOEXEC;
>=20
> As we're now consistently using hypervisor style, we ought to have an
> extra newline here and in equivalent positions.

Yes.

>=20
> If you're happy with the suggestions, I'm happy folding them on commit,=

> to avoid yet another posting.

I'll post v12 today.


Juergen

--------------331E962FC3FA629F4E6330F8
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

--------------331E962FC3FA629F4E6330F8--

--K1FqjKGGmABY4mPW4fq7IFNml4VIXkI7m--

--uWZYBBcJKy9I3ATVk0OvSsPaK9uUe2dCy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmABQAsFAwAAAAAACgkQsN6d1ii/Ey+Y
cAgAlP5nkU1XofmefEiQlhDNAOqOe3uHeO/mbVsW0YJlpuEmNghpo2BPQ0HVnRBUR8XtWat8LaqQ
F3JoLRhzLqX2Px7ARgUqULLiGIKFYaGbsu3rlWc9lTF2cNMwGOJMfDb8YxrftPGomaLLMniZSKsV
zZYxKlX2OPEa3pYyOmv5pJJDVq+GXJUPW8pND8SUAtoWMA9Uk3ALxzobniSYmW2Yj4Kb+eTwG3OR
/nYQsCQjBVH4mf8XXoQoyYWHM00EKfqdo4kONuY/HA5S/CRm0vQejzxnfkvO0TPVXHmMX7wPtwUW
7+61Udfzy9iwcv1/Z/vdx+cP9ALb6BzeiL5RKJsY6g==
=T+tq
-----END PGP SIGNATURE-----

--uWZYBBcJKy9I3ATVk0OvSsPaK9uUe2dCy--

