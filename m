Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5FB454623
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 13:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226817.392092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJiA-0005Rj-1v; Wed, 17 Nov 2021 12:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226817.392092; Wed, 17 Nov 2021 12:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJi9-0005Ot-V0; Wed, 17 Nov 2021 12:06:45 +0000
Received: by outflank-mailman (input) for mailman id 226817;
 Wed, 17 Nov 2021 12:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mnJi8-0005On-Fd
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:06:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d40d07a3-479e-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 13:06:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ACC6C1FD35;
 Wed, 17 Nov 2021 12:06:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B1AB13C94;
 Wed, 17 Nov 2021 12:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nn2dHFLwlGH2OwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 17 Nov 2021 12:06:42 +0000
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
X-Inumbo-ID: d40d07a3-479e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637150802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=avaztLJdsrNFSbjMNXBuMdm/PFlhMNAEY4JkM2A0Kgk=;
	b=euPtZFpbP5TLGcfo9j6H6X3go6odlZxURELt+Bekf8SeepZ//e/H67DJ99MjfowAVQOwsJ
	CEK2XelzUj9ulpk3s6qyOfTiwyQegyS22lEyTTGeWt4DRLWNOXj7i3XGGH15v6PYus75dD
	24Y2EByZLbzfAhBqoR0KsYGBr+qUELU=
Subject: Re: [RFC PATCH 2/2] tools/cpupools: Give a name to unnamed cpupools
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <20211117095711.26596-3-luca.fancellu@arm.com>
 <2d0140be-8830-3d7a-5ee9-58ef80357888@suse.com>
 <D14A26F2-487D-42B6-BD3B-552CEFA84294@arm.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3ecbae61-ade8-955f-a1f9-bf7478e2821a@suse.com>
Date: Wed, 17 Nov 2021 13:06:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <D14A26F2-487D-42B6-BD3B-552CEFA84294@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A55LLCymQoFWQVvVWsjxkChqiKqCXwHqg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A55LLCymQoFWQVvVWsjxkChqiKqCXwHqg
Content-Type: multipart/mixed; boundary="quh4cbrLX0zNc7ZXut7FuqVJzXNMKI0wh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <3ecbae61-ade8-955f-a1f9-bf7478e2821a@suse.com>
Subject: Re: [RFC PATCH 2/2] tools/cpupools: Give a name to unnamed cpupools
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <20211117095711.26596-3-luca.fancellu@arm.com>
 <2d0140be-8830-3d7a-5ee9-58ef80357888@suse.com>
 <D14A26F2-487D-42B6-BD3B-552CEFA84294@arm.com>
In-Reply-To: <D14A26F2-487D-42B6-BD3B-552CEFA84294@arm.com>

--quh4cbrLX0zNc7ZXut7FuqVJzXNMKI0wh
Content-Type: multipart/mixed;
 boundary="------------2F67CE2DF4FC6EC3DE8AF75E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2F67CE2DF4FC6EC3DE8AF75E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.21 12:52, Luca Fancellu wrote:
>=20
>=20
>> On 17 Nov 2021, at 11:10, Juergen Gross <jgross@suse.com> wrote:
>>
>> On 17.11.21 10:57, Luca Fancellu wrote:
>>> With the introduction of boot time cpupools, Xen can
>>> create at boot time many cpupools different from the
>>> cpupool with id 0.
>>> Since these newly created cpupools can't have an
>>> entry in Xenstore, name them with the same convention
>>> used for the cpupool 0: Pool-<cpupool id>.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   tools/libs/light/libxl_utils.c | 13 ++++++++-----
>>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_=
utils.c
>>> index 4699c4a0a3..d97d91ca98 100644
>>> --- a/tools/libs/light/libxl_utils.c
>>> +++ b/tools/libs/light/libxl_utils.c
>>> @@ -147,13 +147,16 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_=
ctx *ctx, const char *p,
>>>   char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>>>   {
>>>       unsigned int len;
>>> -    char path[strlen("/local/pool") + 12];
>>> +    char buffer[strlen("/local/pool") + 12];
>>>       char *s;
>>>   -    snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
>>> -    s =3D xs_read(ctx->xsh, XBT_NULL, path, &len);
>>> -    if (!s && (poolid =3D=3D 0))
>>> -        return strdup("Pool-0");
>>> +    snprintf(buffer, sizeof(buffer), "/local/pool/%d/name", poolid);=

>>> +    s =3D xs_read(ctx->xsh, XBT_NULL, buffer, &len);
>>> +    if (!s)
>>> +    {
>>> +        snprintf(buffer, sizeof(buffer), "Pool-%d", poolid);
>>> +        return strdup(buffer);
>>> +    }
>>>       return s;
>>>   }
>>>  =20
>>
>> This breaks libxl_cpupoolid_is_valid(), as it will now return always
>> true, regardless whether the poolid is existing or not.
>=20
> Hi Juergen,
>=20
> Yes right, do you think I can use safely xc_cpupool_getinfo(=E2=80=A6) =
when there is no entry
> in xenstore?
> I would check that the returned cpupool id is the same and if it isn=E2=
=80=99t or if I get a null
> result, then I will return NULL to ensure libxl_cpupoolid_is_valid(=E2=80=
=A6) works again.

An alternative might be to let tools/helpers/xen-init-dom0.c let write
the missing cpupool entries (including for Pool-0) and drop the
poolid =3D=3D 0 special casing from libxl_cpupoolid_to_name().

This should be rather easy by using xc_cpupool_getinfo() until it finds
no further cpupool.


Juergen

--------------2F67CE2DF4FC6EC3DE8AF75E
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

--------------2F67CE2DF4FC6EC3DE8AF75E--

--quh4cbrLX0zNc7ZXut7FuqVJzXNMKI0wh--

--A55LLCymQoFWQVvVWsjxkChqiKqCXwHqg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGU8FEFAwAAAAAACgkQsN6d1ii/Ey+C
jgf/VJKRjfrG4egWRJunihzw6RgU0Cp4Ft3xhMet+aEv+639LDFSvh/DEQ4uez4tdhJ8RA30Vprd
jRjO8KU7L2DSpz7xAT0YuXy8oRfq2lx3WDG7G9VOfT4BYP26FoYDpqg6gGDjN5/OmQcp23wp/VSa
xHEzDyN5LGPM+uTiEbXrR++1R6YoMUaDqSxamgLtUhxTz18F6OCH2q3Kte7hml9lt0zvZ85qf4+I
oXWI1NY980UlmSE70JgoRMDMOOVN36bIpTZwAEWcCfm/eU5pzLrS9yjmEfUJh1aqGUJ8XvCjLGbP
Mst4IeBQXcydKXVuTdk9PjkVVX0DPEwDxT1MWxjyNA==
=G4DF
-----END PGP SIGNATURE-----

--A55LLCymQoFWQVvVWsjxkChqiKqCXwHqg--

