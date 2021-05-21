Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51B38BDE4
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 07:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131103.245206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljxg4-0002uo-6f; Fri, 21 May 2021 05:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131103.245206; Fri, 21 May 2021 05:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljxg4-0002ss-34; Fri, 21 May 2021 05:26:28 +0000
Received: by outflank-mailman (input) for mailman id 131103;
 Fri, 21 May 2021 05:26:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7IOp=KQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ljxg1-0002sm-U5
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 05:26:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c286a887-0914-4eae-8ffc-13b5c554babb;
 Fri, 21 May 2021 05:26:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E133AAC1A;
 Fri, 21 May 2021 05:26:22 +0000 (UTC)
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
X-Inumbo-ID: c286a887-0914-4eae-8ffc-13b5c554babb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621574783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJLMNq1dYimxxdw70v+420DgM7LUa17lAK04OQM3TM8=;
	b=L2J2OI1AxpIpk+icFhpPJS4GmkdXfuyTYSZZ93VWWDem5XPXzJ4TZ9S10d1rKlsKJ7zxQc
	mf/ho2pAOg10chaNQyNUWNoWi8XGNt0MGBbqWzutrEZ+SPlnMtCsfkyTsmVgO204WxDCFB
	weNFV7wMMJtnFH4/4JukEBy1rvcXurM=
Subject: Re: [PATCH v2] libelf: improve PVH elfnote parsing
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210518144741.44395-1-roger.pau@citrix.com>
 <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
 <YKYreLP8N16vcIVB@Air-de-Roger>
 <162f76e1-9da5-c750-2591-ea011b4b2842@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d4250baa-9680-cd48-3684-2b61b955713d@suse.com>
Date: Fri, 21 May 2021 07:26:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <162f76e1-9da5-c750-2591-ea011b4b2842@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HdSGxOgLC3lGjgTwDp6KHEeuIMFHJI8dY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HdSGxOgLC3lGjgTwDp6KHEeuIMFHJI8dY
Content-Type: multipart/mixed; boundary="RLmkayiUrPnLMbGmBDWzKaZGYPWdByjPN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <d4250baa-9680-cd48-3684-2b61b955713d@suse.com>
Subject: Re: [PATCH v2] libelf: improve PVH elfnote parsing
References: <20210518144741.44395-1-roger.pau@citrix.com>
 <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
 <YKYreLP8N16vcIVB@Air-de-Roger>
 <162f76e1-9da5-c750-2591-ea011b4b2842@suse.com>
In-Reply-To: <162f76e1-9da5-c750-2591-ea011b4b2842@suse.com>

--RLmkayiUrPnLMbGmBDWzKaZGYPWdByjPN
Content-Type: multipart/mixed;
 boundary="------------2ADF1466956EDA7E1D5545BB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2ADF1466956EDA7E1D5545BB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.05.21 11:28, Jan Beulich wrote:
> On 20.05.2021 11:27, Roger Pau Monn=C3=A9 wrote:
>> On Wed, May 19, 2021 at 12:34:19PM +0200, Jan Beulich wrote:
>>> On 18.05.2021 16:47, Roger Pau Monne wrote:
>>>> @@ -425,8 +425,11 @@ static elf_errorstatus elf_xen_addr_calc_check(=
struct elf_binary *elf,
>>>>           return -1;
>>>>       }
>>>>  =20
>>>> -    /* Initial guess for virt_base is 0 if it is not explicitly def=
ined. */
>>>> -    if ( parms->virt_base =3D=3D UNSET_ADDR )
>>>> +    /*
>>>> +     * Initial guess for virt_base is 0 if it is not explicitly def=
ined in the
>>>> +     * PV case. For PVH virt_base is forced to 0 because paging is =
disabled.
>>>> +     */
>>>> +    if ( parms->virt_base =3D=3D UNSET_ADDR || hvm )
>>>>       {
>>>>           parms->virt_base =3D 0;
>>>>           elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",=

>>>
>>> This message is wrong now if hvm is true but parms->virt_base !=3D UN=
SET_ADDR.
>>> Best perhaps is to avoid emitting the message altogether when hvm is =
true.
>>> (Since you'll be touching it anyway, perhaps a good opportunity to do=20
away
>>> with passing parms->virt_base to elf_msg(), and instead simply use a =
literal
>>> zero.)
>>>
>>>> @@ -441,8 +444,10 @@ static elf_errorstatus elf_xen_addr_calc_check(=
struct elf_binary *elf,
>>>>        *
>>>>        * If we are using the modern ELF notes interface then the def=
ault
>>>>        * is 0.
>>>> +     *
>>>> +     * For PVH this is forced to 0, as it's already a legacy option=20
for PV.
>>>>        */
>>>> -    if ( parms->elf_paddr_offset =3D=3D UNSET_ADDR )
>>>> +    if ( parms->elf_paddr_offset =3D=3D UNSET_ADDR || hvm )
>>>>       {
>>>>           if ( parms->elf_note_start )
>>>
>>> Don't you want "|| hvm" here as well, or alternatively suppress the
>>> fallback to the __xen_guest section in the PVH case (near the end of
>>> elf_xen_parse())?
>>
>> The legacy __xen_guest section doesn't support PHYS32_ENTRY, so yes,
>> that part could be completely skipped when called from an HVM
>> container.
>>
>> I think I will fix that in another patch though if you are OK, as
>> it's not strictly related to the calculation fixes done here.
>=20
> That's fine; it wants to be a prereq to the one here then, though,
> I think.

Would it be possible to add some comment to xen/include/public/elfnote.h
Indicating which elfnotes are evaluated for which guest types, including
a hint which elfnotes _have_ been evaluated before this series? This
will help cleaning up guests regarding advertisement of elfnotes
(something I've been planning to do for the Linux kernel).


Juergen

--------------2ADF1466956EDA7E1D5545BB
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

--------------2ADF1466956EDA7E1D5545BB--

--RLmkayiUrPnLMbGmBDWzKaZGYPWdByjPN--

--HdSGxOgLC3lGjgTwDp6KHEeuIMFHJI8dY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCnRH0FAwAAAAAACgkQsN6d1ii/Ey/c
jQf+NsE4DA1mFjXMBEUP+0SDGa1ytt1ksFbkh0Ty0clnvqVy9JogkAEccOyPHro9gS2J1nRq2EAp
BvITKHNB1ycQUOeWPldBXD8ATjk2XT7QW5Na724jAf5FO9EC213Q76hPYVqIJBWH7feH5DfYzDZg
+Bv7FASi5hTLmyTt36K6LPkcUaRoGZ/auMQBRQwk2hEgFRiQtoP2z62FTFBQmReLX9XdgUXJQelZ
jAU3iJoOeGqknfaU281lSdErWnlyb5DEsl9NYi0GCKuG3iIW/y9GO03U4E12VvP5UYAwAFVhWpkm
rCi0IufNqQTVTnUeLH4ncwdhb05CkYGmXf8gzLHb1w==
=Kjpd
-----END PGP SIGNATURE-----

--HdSGxOgLC3lGjgTwDp6KHEeuIMFHJI8dY--

