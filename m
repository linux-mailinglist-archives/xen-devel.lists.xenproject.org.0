Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769F31F9BB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 14:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86871.163360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD5fj-00032y-Vf; Fri, 19 Feb 2021 13:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86871.163360; Fri, 19 Feb 2021 13:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD5fj-00032c-Sf; Fri, 19 Feb 2021 13:18:15 +0000
Received: by outflank-mailman (input) for mailman id 86871;
 Fri, 19 Feb 2021 13:18:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jZy7=HV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lD5fi-00032W-BX
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 13:18:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11476446-b00c-49f0-acdd-2186da0ed5e6;
 Fri, 19 Feb 2021 13:18:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6613EACBF;
 Fri, 19 Feb 2021 13:18:11 +0000 (UTC)
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
X-Inumbo-ID: 11476446-b00c-49f0-acdd-2186da0ed5e6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613740691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rei8ANkquo1IN73rAIcLIbZSfWjXiehiuCZ+FJpkFu4=;
	b=OQJg9x3S5KXZZbgFsHP+8hzxTHUxf6Zo+UWaka8Ljvlz5g+EP9FsQkJvYribd4J2ghLj54
	LFPaKUnp26nHOqdp/pvx4UzekJk4jyVp/T5UlMxQWSIFD3lfDuZsBTx8FpSj/S5HsMZ1S2
	jhT27vsmM0MprQNOc0u1nMoM7BZMGFs=
Subject: Re: Linux PV/PVH domU crash on (guest) resume from suspend
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YCylpKU8F+Hsg8YL@mail-itl>
 <0b71a671-592a-53ab-6b4a-1fe15b9eb453@suse.com> <YC0exVYljxxvwFFt@mail-itl>
 <d848053e-b708-167a-ab7c-e7985e61d608@suse.com>
 <08117ed3-7e84-b233-4a74-248896e2a2d8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <81dfdb6c-00bc-86c1-a27f-2f7b312b4360@suse.com>
Date: Fri, 19 Feb 2021 14:18:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <08117ed3-7e84-b233-4a74-248896e2a2d8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m3hFf1vGlJ3WJ2JB55j0TJZ2y4tCB9d0P"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m3hFf1vGlJ3WJ2JB55j0TJZ2y4tCB9d0P
Content-Type: multipart/mixed; boundary="gOp6d9G01zkkOSyRdRbtVX5AmzOyVGOHg";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <81dfdb6c-00bc-86c1-a27f-2f7b312b4360@suse.com>
Subject: Re: Linux PV/PVH domU crash on (guest) resume from suspend
References: <YCylpKU8F+Hsg8YL@mail-itl>
 <0b71a671-592a-53ab-6b4a-1fe15b9eb453@suse.com> <YC0exVYljxxvwFFt@mail-itl>
 <d848053e-b708-167a-ab7c-e7985e61d608@suse.com>
 <08117ed3-7e84-b233-4a74-248896e2a2d8@suse.com>
In-Reply-To: <08117ed3-7e84-b233-4a74-248896e2a2d8@suse.com>

--gOp6d9G01zkkOSyRdRbtVX5AmzOyVGOHg
Content-Type: multipart/mixed;
 boundary="------------8046E4BB7CA7B59F4A190BC1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8046E4BB7CA7B59F4A190BC1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.02.21 14:10, Jan Beulich wrote:
> On 19.02.2021 13:48, J=C3=BCrgen Gro=C3=9F wrote:
>> On 17.02.21 14:48, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Wed, Feb 17, 2021 at 07:51:42AM +0100, J=C3=BCrgen Gro=C3=9F wrote=
:
>>>> On 17.02.21 06:12, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> Hi,
>>>>>
>>>>> I'm observing Linux PV/PVH guest crash when I resume it from sleep.=
 I do
>>>>> this with:
>>>>>
>>>>>        virsh -c xen dompmsuspend <vmname> mem
>>>>>        virsh -c xen dompmwakeup <vmname>
>>>>>
>>>>> But it's possible to trigger it with plain xl too:
>>>>>
>>>>>        xl save -c <vmname> <some-file>
>>>>>
>>>>> The same on HVM works fine.
>>>>>
>>>>> This is on Xen 4.14.1, and with guest kernel 5.4.90, the same happe=
ns
>>>>> with 5.4.98. Dom0 kernel is the same, but I'm not sure if that's
>>>>> relevant here. I can reliably reproduce it.
>>>>
>>>> This is already on my list of issues to look at.
>>>>
>>>> The problem seems to be related to the XSA-332 patches. You could tr=
y
>>>> the patches I've sent out recently addressing other fallout from XSA=
-332
>>>> which _might_ fix this issue, too:
>>>>
>>>> https://patchew.org/Xen/20210211101616.13788-1-jgross@suse.com/
>>>
>>> Thanks for the patches. Sadly it doesn't change anything - I get exac=
tly
>>> the same crash. I applied that on top of 5.11-rc7 (that's what I had
>>> handy). If you think there may be a difference with the final 5.11 or=

>>> another branch, please let me know.
>>>
>>
>> Some more tests reveal that this seems to be s hypervisor regression.
>> I can reproduce the very same problem with a 4.12 kernel from 2019.
>>
>> It seems as if the EVTCHNOP_init_control hypercall is returning
>> -EINVAL when the domain is continuing to run after the suspend
>> hypercall (in contrast to the case where a new domain has been created=

>> when doing a "xl restore").
>=20
> But when you resume the same domain, the kernel isn't supposed to
> call EVTCHNOP_init_control, as that's a one time operation (per
> vCPU, and unless EVTCHNOP_reset was called of course). In the
> hypervisor map_control_block() has (always had) as its first step
>=20
>      if ( v->evtchn_fifo->control_block )
>          return -EINVAL;
>=20
> Re-setup is needed only when resuming in a new domain.

But the same guest will not crash when doing the same on a 4.12
hypervisor.


Juergen


--------------8046E4BB7CA7B59F4A190BC1
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

--------------8046E4BB7CA7B59F4A190BC1--

--gOp6d9G01zkkOSyRdRbtVX5AmzOyVGOHg--

--m3hFf1vGlJ3WJ2JB55j0TJZ2y4tCB9d0P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAvupIFAwAAAAAACgkQsN6d1ii/Ey99
Pwf/SZMCnS4M0xMawWG67h4d7g+YeXcaSZYagzoFFpex6n0fEQFuUE791dkCTqJYr4DgTqO5rwAS
VLDcCeE/Ibc/fM268TtJq6H/pl8gRMWy6HCBGm6gvaAvHbw3ZXUTjrQig6mQMWVr3bgqVXgpI+zD
NVcG7Xet8lYqCGU+jMu5akTw4uLIKntIBohinDjw64HEldIpWEOGuaqlY8seIY1JMhcsP5jACgRY
7DQFSP+kbvImvlc8hN/PzKLg/zOk8a6x91bgcteKTOAABfPCRjyPDkh548ywlJ1UNgFo5MyKrSmL
YHFG/q/d1tsLhg5CSEzVTh+mcQ5aO3lklVI/ViLurw==
=amJa
-----END PGP SIGNATURE-----

--m3hFf1vGlJ3WJ2JB55j0TJZ2y4tCB9d0P--

