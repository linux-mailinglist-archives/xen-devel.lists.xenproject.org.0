Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6FB38C0F1
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 09:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131172.245304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljzqp-0003qp-KY; Fri, 21 May 2021 07:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131172.245304; Fri, 21 May 2021 07:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljzqp-0003oT-Gv; Fri, 21 May 2021 07:45:43 +0000
Received: by outflank-mailman (input) for mailman id 131172;
 Fri, 21 May 2021 07:45:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7IOp=KQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ljzqn-0003oN-SE
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 07:45:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c584965b-0326-4988-a95b-0ea1611794cd;
 Fri, 21 May 2021 07:45:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9640BAACA;
 Fri, 21 May 2021 07:45:39 +0000 (UTC)
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
X-Inumbo-ID: c584965b-0326-4988-a95b-0ea1611794cd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621583139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/sMvNp+9lKkN+WiHz3qNpqJVARtOU7zT7NAo9LzV8rU=;
	b=lXvVE1ZGhPjH2EZB2MVm75MauFOOxpZ0wp6bf7V04u5oo3V1ymGp9U0BYRQ4U8rLG1NNug
	RS/iYtICwtUO8pjCJCmifcHX8ajoe88VSy0eLBazBE2uCMZAtoIdIwLw0IKxlfPCtkEsLm
	pBYSf/KiPeiaCS+XJzHZzrKfiXWkIeU=
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
 <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
 <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
Message-ID: <2d019c04-415b-293b-052b-26b1ea3be189@suse.com>
Date: Fri, 21 May 2021 09:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xYVPNHcK2UiZjHVM9n8b5M6RfVqE7AsuZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xYVPNHcK2UiZjHVM9n8b5M6RfVqE7AsuZ
Content-Type: multipart/mixed; boundary="PwWjzX44LP6A6yeUvPoM1lSs3gpCYXqct";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <2d019c04-415b-293b-052b-26b1ea3be189@suse.com>
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
 <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
 <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
In-Reply-To: <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>

--PwWjzX44LP6A6yeUvPoM1lSs3gpCYXqct
Content-Type: multipart/mixed;
 boundary="------------4B6D1E5FAC04B12CF593AF73"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4B6D1E5FAC04B12CF593AF73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.05.21 09:26, Jan Beulich wrote:
> On 21.05.2021 09:18, Juergen Gross wrote:
>> On 20.05.21 14:08, Jan Beulich wrote:
>>> On 20.05.2021 13:57, Juergen Gross wrote:
>>>> On 20.05.21 13:42, Jan Beulich wrote:
>>>>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tabl=
es.
>>>>> For this to work when NX is not available, x86_configure_nx() needs=20
to
>>>>> be called first.
>>>>>
>>>>> Reported-by: Olaf Hering <olaf@aepfle.de>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>>
>>> Thanks. I guess I forgot
>>>
>>> Cc: stable@vger.kernel.org
>>>
>>> If you agree, can you please add this before pushing to Linus?
>>
>> Uh, just had a look why x86_configure_nx() was called after
>> xen_setup_gdt().
>>
>> Upstream your patch will be fine, but before kernel 5.9 it will
>> break running as 32-bit PV guest (see commit 36104cb9012a82e7).
>=20
> Oh, indeed. That commit then actually introduced the issue here,
> and hence a Fixes: tag may be warranted.

Added it already. :-)

And I've limited the backport to happen not for 5.8 and older, of
course.


Juergen

--------------4B6D1E5FAC04B12CF593AF73
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

--------------4B6D1E5FAC04B12CF593AF73--

--PwWjzX44LP6A6yeUvPoM1lSs3gpCYXqct--

--xYVPNHcK2UiZjHVM9n8b5M6RfVqE7AsuZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCnZSIFAwAAAAAACgkQsN6d1ii/Ey8x
Twf/Yn8DWeclME/OqMShr1eqPWdNHCYDZsdr0FnzeC8A6xIA+1IRp17aqBql8JOxbqzwpYJ5gh3H
JzFRs/1xMBwwJcbKhbXVunXHlODsRqzD0BQlukoPTmTBYlaKINzGgcVw9fvlkD9jOnhmL8eGgKkj
xN3XYeeiqx3byngrO6fMOENq+vJmKLVvTbZgpQrWo50JhcH6GiaUM09GrXX8ZSZgsCwEepoHdO93
dtK4H3VkqeRM9OhNGHnbQHxRKFzSyYOtiC/n28WN7W1eMV4CwHZrfMCDJZXB6DXZqHAqPSlmYHQQ
SsinAGpZM7/CpSZuhHLB6/I1xy5DYJE2iMqyGJIKtw==
=h3ze
-----END PGP SIGNATURE-----

--xYVPNHcK2UiZjHVM9n8b5M6RfVqE7AsuZ--

