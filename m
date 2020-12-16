Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D42DBAFE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 07:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55060.95796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpPxE-0002On-AC; Wed, 16 Dec 2020 06:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55060.95796; Wed, 16 Dec 2020 06:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpPxE-0002OO-6t; Wed, 16 Dec 2020 06:06:28 +0000
Received: by outflank-mailman (input) for mailman id 55060;
 Wed, 16 Dec 2020 06:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJND=FU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpPxC-0002OJ-He
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 06:06:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0ad8d84-63ff-4351-a7af-b6fad766b9a5;
 Wed, 16 Dec 2020 06:06:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E114AB113;
 Wed, 16 Dec 2020 06:06:23 +0000 (UTC)
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
X-Inumbo-ID: e0ad8d84-63ff-4351-a7af-b6fad766b9a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608098784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uC3ARCQsbnLz9ctv7WVMZZqqqu6Ljd+T/YxhzPh3Smc=;
	b=V48NrEo4d6hxDT6uo90Q4DmgZnk6c24mDD0YpDQGP2m7WJztnfSd2bWLQf8LiSMTvS/Dm9
	v7Q6V87psCjNl+iPu1o6WnskED2twG+IXJtHGbXBQZd56pFWxRvqcMxwLpe16cnWIWpb+w
	MyO2dtFIsNAlfWxKUHvpdk9ekhkfGsM=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-5-jgross@suse.com>
 <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
Message-ID: <e33205e7-11cb-e463-8c6f-92cfff2c74da@suse.com>
Date: Wed, 16 Dec 2020 07:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f7yBGInJaHJLm7JkohHoSqGRbg64YniXN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f7yBGInJaHJLm7JkohHoSqGRbg64YniXN
Content-Type: multipart/mixed; boundary="U5wKb6JrF9t2XrP2sxTQ3cgtgCcLv2Qnu";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
Message-ID: <e33205e7-11cb-e463-8c6f-92cfff2c74da@suse.com>
Subject: Re: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-5-jgross@suse.com>
 <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
In-Reply-To: <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>

--U5wKb6JrF9t2XrP2sxTQ3cgtgCcLv2Qnu
Content-Type: multipart/mixed;
 boundary="------------F2AC585614C0DAE1BDBB8EF7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F2AC585614C0DAE1BDBB8EF7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.12.20 19:09, Andrew Cooper wrote:
> On 15/12/2020 16:35, Juergen Gross wrote:
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Wei Liu <wl@xen.org>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> ---
>> V7:
>> - new patch
>>
>> V8:
>> - some minor comments by Julien Grall addressed
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Various of your patches still have double SoB.=C2=A0 (Just as a note to=
 be
> careful to anyone committing...)

Yeah, this is annoying.

They are all after the first "---" mark, so they shouldn't end up in
git AFAICS.

Why git is adding those duplicates I don't know. I had this problem
before, but some git update made it disappear. Now it is back, but
not for all patches. :-(

>=20
>> diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
>> index 91821ee56d..dadc46ea36 100644
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
>> + * to call xenevtchn_open_fd() with that file descriptor as parameter=
 in
>> + * order to associate it with a new handle. The file descriptor can b=
e
>> + * obtained via xenevtchn_fd() before calling exec(2).
>>    */
>=20
> More of the comment block than this needs adjusting in light of the
> exec() changes.
>=20
>> -/* Currently no flags are defined */
>> +
>> +/* Don't set O_CLOEXEC when opening event channel driver node. */
>> +#define XENEVTCHN_NO_CLOEXEC 0x01
>> +
>>   xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
>>                                    unsigned open_flags);
>>  =20
>> +/* Flag XENEVTCHN_NO_CLOEXEC is ignored by xenevtchn_open_fd(). */
>> +xenevtchn_handle *xenevtchn_open_fd(struct xentoollog_logger *logger,=

>> +                                    int fd, unsigned open_flags);
>> +
>=20
> I spotted this before, but didn't have time to reply.
>=20
> This isn't "open fd".=C2=A0 It is "construct a xenevtchn_handle object =
around
> an already-open fd".=C2=A0 As such, open_flags appears bogus because at=
 no
> point are we making an open() call.=C2=A0 (I'd argue that it irrespecti=
ve of
> other things, it wants naming xenevtchn_fdopen() for API familiarity.)

Okay.

>=20
> However, the root of the problem is actually the ambiguity in the name.=

> These are not flags to the open() system call, but general flags for
> xenevtchn.
>=20
> Therefore, I recommend a prep patch which renames open_flags to just
> flags, and while at it, changes to unsigned int rather than a naked
> "unsigned" type.=C2=A0 There are no API/ABI implications for this, but =
it
> will help massively with code clarity.

Okay.

>=20
> I'd also possibly go as far as to say that plumbing 'flags' down into
> osdep ought to split out into a separate patch.=C2=A0 There is also a w=
ild
> mix of coding styles even within the hunks here.

Fine with me.

>=20
> Additionally, something in core.c should check for unknown flags and
> reject them them with EINVAL.=C2=A0 It was buggy that this wasn't done
> before, and really needs to be implemented before we start having cases=

> where people might plausibly pass something other than 0.

Are you sure this is safe? I'm not arguing against it, but we considered
to do that and didn't dare to.

>=20
> ~Andrew
>=20
> P.S. if you don't fancy doing all of this, my brain could do with a
> break from the complicated work, and I can see about organising this
> cleanup.
>=20

I'm fine doing it. I'm sure you'll find some other no-brainer to work
on :-)


Juergen

--------------F2AC585614C0DAE1BDBB8EF7
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

--------------F2AC585614C0DAE1BDBB8EF7--

--U5wKb6JrF9t2XrP2sxTQ3cgtgCcLv2Qnu--

--f7yBGInJaHJLm7JkohHoSqGRbg64YniXN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Zo98FAwAAAAAACgkQsN6d1ii/Ey8N
mAgAgUUv6lZ96bg84wX2/9npnS/PLbzuUZmCu93fhbw0z9zdvSphyB4P/LLIWOZRipOatWyGhWUR
cra4M9ykd8dmq/5waix9148w1bqhiManIJSOdMsKNDgpfjgiEvyCMbuNIlUDPpCeBDpgFJUwSULu
D9cpofBwI6ztSipzoo2VTOiyLZvzT8frWHPSo9DQPpMcboBiuYXcomKFzjeARw8B6IBRX4lD2hVH
76w9yDv1Hp1WR5Mj7elPXG11jRnDRBxELMoN6i2vjD4rmL6mppAhw9qk95ZfyHcM9qxXppEyRpBN
N249UzqtvxqhOKxUyFIUKNDIV9kN9cVQvBdlk94xuQ==
=OAZk
-----END PGP SIGNATURE-----

--f7yBGInJaHJLm7JkohHoSqGRbg64YniXN--

