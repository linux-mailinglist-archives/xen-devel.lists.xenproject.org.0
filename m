Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF42AEFE1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24665.52022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoZK-0008M4-8T; Wed, 11 Nov 2020 11:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24665.52022; Wed, 11 Nov 2020 11:45:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoZK-0008Lf-4m; Wed, 11 Nov 2020 11:45:42 +0000
Received: by outflank-mailman (input) for mailman id 24665;
 Wed, 11 Nov 2020 11:45:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcoZI-0008La-QF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:45:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f080068-5ca6-4397-9dc9-f10b2db1ee91;
 Wed, 11 Nov 2020 11:45:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4AA8ABDE;
 Wed, 11 Nov 2020 11:45:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcoZI-0008La-QF
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:45:40 +0000
X-Inumbo-ID: 7f080068-5ca6-4397-9dc9-f10b2db1ee91
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7f080068-5ca6-4397-9dc9-f10b2db1ee91;
	Wed, 11 Nov 2020 11:45:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605095139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhly8ilgY2xEIQDMNyWtxnrDuhegOHSjMb1/Oy5d2Dg=;
	b=ExVavCl7hZiaGVbbvYMf6eYBBCZuI6aa9y7M4iFkAUYMoveXl2QynKQGLqQeJIpTtS08j0
	+Z0HxMMNDiPvuJZ8VzjVrfEb7wi013g7WbSxAhd8nJLAHiR8ye37tBAqDoLk2P7r9ZeIKw
	VRXXeQ12hQ1vyzqDYu4ShsAsLkiGVnE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D4AA8ABDE;
	Wed, 11 Nov 2020 11:45:38 +0000 (UTC)
Subject: Re: [PATCH] docs: fix documentation about default scheduler
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201110185129.5951-1-roger.pau@citrix.com>
 <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
 <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
 <19A67843-4667-46EB-8F11-109D8989BB71@citrix.com>
 <20201111113726.iqpzf64sgxpnl3gc@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d13b3920-1301-c345-ac6c-6f6ad7af9b8d@suse.com>
Date: Wed, 11 Nov 2020 12:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111113726.iqpzf64sgxpnl3gc@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7J1sQLY4kN27lRr05FopQBEm4ytSmTHfp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7J1sQLY4kN27lRr05FopQBEm4ytSmTHfp
Content-Type: multipart/mixed; boundary="KS7qOA1v6E5kZbiZkZ2LUVM0ZG5z44eEl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <d13b3920-1301-c345-ac6c-6f6ad7af9b8d@suse.com>
Subject: Re: [PATCH] docs: fix documentation about default scheduler
References: <20201110185129.5951-1-roger.pau@citrix.com>
 <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
 <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
 <19A67843-4667-46EB-8F11-109D8989BB71@citrix.com>
 <20201111113726.iqpzf64sgxpnl3gc@Air-de-Roger>
In-Reply-To: <20201111113726.iqpzf64sgxpnl3gc@Air-de-Roger>

--KS7qOA1v6E5kZbiZkZ2LUVM0ZG5z44eEl
Content-Type: multipart/mixed;
 boundary="------------CC63A13D7E118BD369DD5934"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CC63A13D7E118BD369DD5934
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.11.20 12:37, Roger Pau Monn=C3=A9 wrote:
> On Wed, Nov 11, 2020 at 12:24:50PM +0100, George Dunlap wrote:
>>
>>
>>> On Nov 11, 2020, at 11:10 AM, Andrew Cooper <Andrew.Cooper3@citrix.co=
m> wrote:
>>>
>>> On 11/11/2020 10:12, George Dunlap wrote:
>>>>
>>>>> On Nov 10, 2020, at 6:51 PM, Roger Pau Monne <roger.pau@citrix.com>=
 wrote:
>>>>>
>>>>> Fix the command line document to account for the default scheduler =
not
>>>>> being credit anymore likely, and the fact that it's selectable from=

>>>>> Kconfig and thus different builds could end up with different defau=
lt
>>>>> schedulers.
>>>>>
>>>>> Fixes: dafd936dddbd ('Make credit2 the default scheduler')
>>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>> ---
>>>>> Changes since v1:
>>>>> - Point that the default scheduler is being selected by Kconfig,
>>>>>   don't mention the default Kconfig selection.
>>>>> ---
>>>>> docs/misc/xen-command-line.pandoc | 2 +-
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-comm=
and-line.pandoc
>>>>> index 4ae9391fcd..eb1db25f92 100644
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -1876,7 +1876,7 @@ with read and write permissions.
>>>>> ### sched
>>>>>> `=3D credit | credit2 | arinc653 | rtds | null`
>>>>> -> Default: `sched=3Dcredit`
>>>>> +> Default: selectable via Kconfig.  Depends on enabled schedulers.=

>>>> Sorry for not weighing in earlier; but this basically makes this doc=
umentation useless.
>>>
>>> No.  It is the only half useable version, by being the only version
>>> which isn't misleading.
>>
>> The version in this patch essentially says =E2=80=9CThis has some opti=
ons, it also has a default, but we=E2=80=99re not going to tell you any o=
f them, nor what your default most likely is.  Go read KConfig to find ou=
t.=E2=80=9D  This is is completely useless to the person trying to figure=
 out what the default is and what potential alternate values they can put=
 here.
>>
>> The vast majority of people who search for this on the internet will h=
ave that list of options, and have credit2=3Ddefault.  As long as we tell=
 them that a local configuration can override the available options and t=
he default, people are smart enough to figure out what their system is do=
ing.
>>
>>> It would however be far better to name the CONFIG_ variable (we do
>>> elsewhere in this doc) in question so people can actually figure out
>>> what they've got in front of them.
>>
>> Something like that would be even better, if Roger (or someone) wants =
to write it up.
>=20
> I'm happy to send an updated version, but would like to have some
> agreement before doing so. Is the text below acceptable to everyone?
>=20
> ### sched
>> `=3D credit | credit2 | arinc653 | rtds | null`
>=20
>> Default: `sched=3Dcredit2`
>=20
> Choose the default scheduler. Note the default scheduler is selectable =
via
> Kconfig and depends on enabled schedulers. Check

=2E.. CONFIG_SCHED_DEFAULT to see which scheduler is the default.

CONFIG_SCHED_{scheduler_name} specify which schedulers are available.


Juergen

--------------CC63A13D7E118BD369DD5934
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

--------------CC63A13D7E118BD369DD5934--

--KS7qOA1v6E5kZbiZkZ2LUVM0ZG5z44eEl--

--7J1sQLY4kN27lRr05FopQBEm4ytSmTHfp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+rzuIFAwAAAAAACgkQsN6d1ii/Ey/o
fAf/WfBWWay4R4YebcvLo94gAgZiF3jgS8+Z+s07QiFKV6KBk6bmvVtKTMkRRIKW/UA57/qbjLld
klgwagzMxAaXU17WzPZ2+y9CbxsRb3WmLFPyPXocUQF7mDXnY4rm0wIkowMKNQ58HCqU6R1hmVXb
xPbVg9ymJ2ANc5pouEtimPjXU9jYOrBjAy3csviEgv2Jww9DIVlDQvtEj/9iXxzxgEshmACvqUFF
RLLvd3tesQ0cFuYGTdIn+QkeoT9TxIZlZMjW6lyNAxVj0FrhiPllihrX8U7+e0LMeOdNJbQLSh/b
PIdfNTm5P5Vx+mkax8BsxnIcguYvsPoMBZdAdPtU+g==
=EhBH
-----END PGP SIGNATURE-----

--7J1sQLY4kN27lRr05FopQBEm4ytSmTHfp--

