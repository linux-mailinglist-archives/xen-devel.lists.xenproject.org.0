Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666531099D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 11:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81590.150884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ymi-0001WY-Id; Fri, 05 Feb 2021 10:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81590.150884; Fri, 05 Feb 2021 10:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ymi-0001W9-FQ; Fri, 05 Feb 2021 10:56:20 +0000
Received: by outflank-mailman (input) for mailman id 81590;
 Fri, 05 Feb 2021 10:56:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v9N4=HH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7ymg-0001W4-FE
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 10:56:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49da6690-2fe2-4ab0-a6ae-cfc0c7214356;
 Fri, 05 Feb 2021 10:56:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75FC0AD29;
 Fri,  5 Feb 2021 10:56:16 +0000 (UTC)
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
X-Inumbo-ID: 49da6690-2fe2-4ab0-a6ae-cfc0c7214356
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612522576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bf1mxx6eK5gG8ZLJEsNSc3VGRjRjdiizHDkYiSTVUjs=;
	b=H1gKocv+4XxdeW8q3Yr1TG7DyQKHuKBRZymW34T/AcvNJaHIQK7/4Ie21LIXqvEGovusZo
	zgNbHJFkh9iFMI7h3/qVq2ImmLWoNkr5Mnb5y0wKYlIGDRcAPpYriLJZYhSQ8jbXzTQQTc
	hvv2UW4QbvbKDILKrbKR5wjga0fQMYM=
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
Date: Fri, 5 Feb 2021 11:56:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MY5rErkQlgpO6WqO6NCTFEF6atPO4AO6p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MY5rErkQlgpO6WqO6NCTFEF6atPO4AO6p
Content-Type: multipart/mixed; boundary="05gFgNqyiCiOA0LbuBztRQsPeJfa7m44z";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
In-Reply-To: <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>

--05gFgNqyiCiOA0LbuBztRQsPeJfa7m44z
Content-Type: multipart/mixed;
 boundary="------------4F1780995A3F4A68DDE27EB8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4F1780995A3F4A68DDE27EB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05.02.21 11:14, Jan Beulich wrote:
> (simply re-sending what was sent over 2 months ago)
>=20
> On 04.11.2020 11:50, Jan Beulich wrote:
>> On 03.11.2020 18:31, Andrew Cooper wrote:
>>> On 03/11/2020 17:06, Jan Beulich wrote:
>>>> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
>>>> handler early enough to cover for example the rdmsrl_safe() of
>>>> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded re=
ad
>>>> of MSR_K7_HWCR later in the same function). The respective change
>>>> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") =
was
>>>> backported to 4.14, but no further - presumably since it wasn't real=
ly
>>>> easy because of other dependencies.
>>>>
>>>> Therefore, to prevent our change in the handling of guest MSR access=
es
>>>> to render PV Linux 4.13 and older unusable on at least AMD systems, =
make
>>>> the raising of #GP on these paths conditional upon the guest having
>>>> installed a handler. Producing zero for reads and discarding writes
>>>> isn't necessarily correct and may trip code trying to detect presenc=
e of
>>>> MSRs early, but since such detection logic won't work without a #GP
>>>> handler anyway, this ought to be a fair workaround.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I appreciate that we probably have to do something, but I don't think=

>>> this is a wise move.
>>
>> I wouldn't call it wise either, but I'm afraid something along
>> these lines is necessary.
>>
>>> Linux is fundamentally buggy.=C2=A0 It is deliberately looking for a
>>> potential #GP fault given its use of rdmsrl_safe().=C2=A0 The reason =
this bug
>>> stayed hidden for so long was as a consequence of Xen's inappropriate=

>>> MSR handling for guests, and the reasons for changing Xen's behaviour=

>>> still stand.
>>
>> I agree.
>>
>>> This change, in particular, does not apply to any explicitly handled
>>> MSRs, and therefore is not a comprehensive fix.
>>
>> But it's intentional that this deals with the situation in a
>> generic way, not on a per-MSR basis. If we did as you suggest
>> further down, we'd have to audit all Linux versions up to 4.14
>> for similar issues with other MSRs. I don't think this would
>> be a practical thing to do, and I also don't think that leaving
>> things as they are until we have concrete reports of problems
>> is a viable option either.
>>
>> Adding explicit handling for the two offending MSRs (and any
>> possible further ones we discover) would imo only be to avoid
>> issuing the respective log messages.
>>
>>>  =C2=A0 Nor is it robust to
>>> someone adding code to explicitly handling the impacted MSRs at a lat=
er
>>> date (which are are likely to need to do for HWCR), and which would
>>> reintroduce this failure to boot.
>>
>> I'm afraid I don't understand. Looking at the two functions
>> the patch alters, only X86EMUL_OKAY is used in return statements
>> other than the final one. If this model is to be followed by
>> future additions (which I think it ought to be; perhaps we
>> should add comments to this effect), the code introduced here
>> will take care of the situation nevertheless.
>>
>>> We should have the impacted MSRs handled explicitly, with a note stat=
ing
>>> this was a bug in Linux 4.14 and older.=C2=A0 We already have workaro=
und for
>>> similar bugs in Windows, and it also gives us a timeline to eventuall=
y
>>> removing support for obsolete workarounds, rather than having a "now =
and
>>> in the future, we'll explicitly tolerate broken PV behaviour for one =
bug
>>> back in ancient linux".
>>
>> Comparing with Windows isn't very helpful; the patch here is
>> specifically about PV, and would help other OSes as well in
>> case they would have missed setting up exceptions early in
>> just the PV-on-Xen case. For the HVM case I'd indeed rather
>> see us go the route we've gone for Windows, if need be.
>=20
> As can be seen from this reply, we're not in agreement what to
> do here. But we need to do something. I'm not sure how to get
> unstuck discussions like this one ...
>=20
> Besides this suggestion of yours I also continue to have
> trouble seeing what good it will do to record an exception to
> inject into a guest when we know it didn't install a handler
> yet.

As we need to consider backports of processor bug mitigations
in old guests, too, I think we need to have a "catch-all"
fallback.

Not being able to run an old updated guest until we add handling
for a new MSR isn't a viable option IMO.


Juergen

--------------4F1780995A3F4A68DDE27EB8
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

--------------4F1780995A3F4A68DDE27EB8--

--05gFgNqyiCiOA0LbuBztRQsPeJfa7m44z--

--MY5rErkQlgpO6WqO6NCTFEF6atPO4AO6p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAdJE8FAwAAAAAACgkQsN6d1ii/Ey+y
NAgAklZ/+yTSJ8YV5UdZ83YWrF49RdrplE3Ul96lqAytlzlmsRiMBjpt/TGdtnRJgVBYmkMpCsTB
UT0eWYyDvKk/8ErN2UHbpWMGiTdyfXcYeGkfxT7HCBwnzSZ4lARRxljrRaWKiE5rq/gTu8kfPs8f
Xs+oryzjA9orlCKFMhAVs953nLOsp/nt0ezVcsVrTtiHxkxgdhoSLypleCSvLdKtrLoL9OqJl3U4
tf/9V0wH5U/gg93kqFiUxhDkqvW9wAblPx6q84gm5QKfQUI6T17c00T/co56x8d6hIcPtal221qq
f8UNu/3JcFKSvHQwQrDkLLOKgfWvD97JRPZNXqh4Rw==
=2ofY
-----END PGP SIGNATURE-----

--MY5rErkQlgpO6WqO6NCTFEF6atPO4AO6p--

