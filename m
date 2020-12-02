Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E042A2CBB23
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 11:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42616.76676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkPpp-00051l-MO; Wed, 02 Dec 2020 10:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42616.76676; Wed, 02 Dec 2020 10:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkPpp-00050b-IR; Wed, 02 Dec 2020 10:58:09 +0000
Received: by outflank-mailman (input) for mailman id 42616;
 Wed, 02 Dec 2020 10:58:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvYF=FG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkPpn-00050W-RM
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 10:58:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26ab1df6-224b-482f-9a79-efbb5947e83d;
 Wed, 02 Dec 2020 10:58:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCEABACB5;
 Wed,  2 Dec 2020 10:58:05 +0000 (UTC)
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
X-Inumbo-ID: 26ab1df6-224b-482f-9a79-efbb5947e83d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606906686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pcC5tv/RPuVxDRXJIH45H5SSFlITXbWJ3gmYhUOhN2U=;
	b=hdFiXpFvO6QKSE8EpROVk3f8jgxX58gDRNqS0GSgB96TnZlOJCYGe9UYboOT3IRbTo6b2e
	SsrjFtTw4TDHLV88UzT9gzl/T8E6pRbPTt7+k2NlZvoZ7IA0J3L/r0eSEkT24b9DJbcSAR
	gRPpk6oYlZvuH/ZoHcILb1qFfGww1xo=
Subject: Re: [PATCH v2 06/17] xen/cpupool: use ERR_PTR() for returning error
 cause from cpupool_create()
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-7-jgross@suse.com>
 <08f377a7-7862-0597-fe42-98851dc3db37@suse.com>
 <b130d75b-8cfa-7158-7f27-947ee50c579f@suse.com>
 <841e972f-4b46-e606-3344-c6ba423acf5c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <17387dc8-1a10-e822-f38c-1dcd8eac2f62@suse.com>
Date: Wed, 2 Dec 2020 11:58:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <841e972f-4b46-e606-3344-c6ba423acf5c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M7mbblpm1ScmAi3QJgUvjieHDHENK8x2l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--M7mbblpm1ScmAi3QJgUvjieHDHENK8x2l
Content-Type: multipart/mixed; boundary="XNVEaSkvSwYRw7Ek3nZiv1Nw4QwtbhnF0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <17387dc8-1a10-e822-f38c-1dcd8eac2f62@suse.com>
Subject: Re: [PATCH v2 06/17] xen/cpupool: use ERR_PTR() for returning error
 cause from cpupool_create()
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-7-jgross@suse.com>
 <08f377a7-7862-0597-fe42-98851dc3db37@suse.com>
 <b130d75b-8cfa-7158-7f27-947ee50c579f@suse.com>
 <841e972f-4b46-e606-3344-c6ba423acf5c@suse.com>
In-Reply-To: <841e972f-4b46-e606-3344-c6ba423acf5c@suse.com>

--XNVEaSkvSwYRw7Ek3nZiv1Nw4QwtbhnF0
Content-Type: multipart/mixed;
 boundary="------------0F89D87545B999E56FFF0EE0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0F89D87545B999E56FFF0EE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.12.20 11:46, Jan Beulich wrote:
> On 02.12.2020 10:56, J=C3=BCrgen Gro=C3=9F wrote:
>> On 02.12.20 09:58, Jan Beulich wrote:
>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>> Instead of a pointer to an error variable as parameter just use
>>>> ERR_PTR() to return the cause of an error in cpupool_create().
>>>>
>>>> This propagates to scheduler_alloc(), too.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> with one small question:
>>>
>>>> --- a/xen/common/sched/core.c
>>>> +++ b/xen/common/sched/core.c
>>>> @@ -3233,26 +3233,25 @@ struct scheduler *scheduler_get_default(void=
)
>>>>        return &ops;
>>>>    }
>>>>   =20
>>>> -struct scheduler *scheduler_alloc(unsigned int sched_id, int *perr)=

>>>> +struct scheduler *scheduler_alloc(unsigned int sched_id)
>>>>    {
>>>>        int i;
>>>> +    int ret;
>>>
>>> I guess you didn't merge this with i's declaration because of a
>>> plan/hope for i to be converted to unsigned int?
>>
>> The main reason is I don't like overloading variables this way.
>=20
> That's no what I asked. I was wondering why the new decl wasn't
>=20
>      int i, ret;

Oh, then I completely misunderstood your question, sorry.

I had no special reason when writing the patch, but I think changing
i to be unsigned is a good idea. I'll do that in the next iteration.


Juergen

--------------0F89D87545B999E56FFF0EE0
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

--------------0F89D87545B999E56FFF0EE0--

--XNVEaSkvSwYRw7Ek3nZiv1Nw4QwtbhnF0--

--M7mbblpm1ScmAi3QJgUvjieHDHENK8x2l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Hcz0FAwAAAAAACgkQsN6d1ii/Ey+l
QQgAlWwvuDhrJYlOCbD+llwqQqvxguB7v+H0VZSajMU4+hIQnO1B8PghBiOCgjnwoyqVv22R7pDn
rZNdhwwtt29+o9VGaghL1g8VRFXM+gMmRvjxfywtjTmJlYqegSH/Mxl/hW4HFmA/y32hmUj4sPST
I5KAzEFyQuTWYFnx1S/oNtZRTNzO7Qbbwywj165r8W8cbdJY8ZfoLdJ3F8NiiTfjYIQ8oBMIryE6
bpSYrtNVeZ7GOGzNQ6ggYuVYdI8htXHF4VOlBks3oIgnRiI9NICD/Yd+Zi+6PLMYV1+JlQ88hZXZ
qfVGjU3EqdNl2n7vxDT28Jqf2cQqdD7OsljC9Bzr5g==
=WiDG
-----END PGP SIGNATURE-----

--M7mbblpm1ScmAi3QJgUvjieHDHENK8x2l--

