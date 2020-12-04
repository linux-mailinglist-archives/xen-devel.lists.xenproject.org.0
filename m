Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891C2CF1BE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 17:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44932.80379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDkm-00048b-KG; Fri, 04 Dec 2020 16:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44932.80379; Fri, 04 Dec 2020 16:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDkm-00048C-Gi; Fri, 04 Dec 2020 16:16:16 +0000
Received: by outflank-mailman (input) for mailman id 44932;
 Fri, 04 Dec 2020 16:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov5/=FI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1klDkk-000487-O7
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 16:16:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8b1828c-dd67-46ec-a396-4132fbe838bf;
 Fri, 04 Dec 2020 16:16:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9BB7ACC4;
 Fri,  4 Dec 2020 16:16:12 +0000 (UTC)
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
X-Inumbo-ID: c8b1828c-dd67-46ec-a396-4132fbe838bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607098572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8wHFCJcXLxaRCE//c8KZw/xWEWSTTcGqjK8EPcNdN4s=;
	b=hxvmS2q6N3Nl4P/4aNpN+Np+nJM7kvSudLfdsp1+kBLKZw0HT6BQ0wgEZ6tvzBPW6WHNw4
	PobokZctW6TEOQB6ZEK3RpBP3nZBSEBXhlXAWcbph1TO6ie92yB1XEv0679P9AEqvStUp2
	sMPU2HKyU5TeQdhQKEo8MGLMSUjlrWs=
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal list
 interface
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-6-jgross@suse.com>
 <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
 <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
 <fe0b6924122aa9dff2095403738f111750cc815a.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <76e7d00f-b049-97fc-f9e2-ade76b10a93e@suse.com>
Date: Fri, 4 Dec 2020 17:16:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fe0b6924122aa9dff2095403738f111750cc815a.camel@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Na8waiugEdiEkwE6AMBr4JLGmOuQAJmic"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Na8waiugEdiEkwE6AMBr4JLGmOuQAJmic
Content-Type: multipart/mixed; boundary="zZ5RQvfaEdQoknt99G5x3RkM1YvBQuudI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <76e7d00f-b049-97fc-f9e2-ade76b10a93e@suse.com>
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal list
 interface
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-6-jgross@suse.com>
 <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
 <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
 <fe0b6924122aa9dff2095403738f111750cc815a.camel@suse.com>
In-Reply-To: <fe0b6924122aa9dff2095403738f111750cc815a.camel@suse.com>

--zZ5RQvfaEdQoknt99G5x3RkM1YvBQuudI
Content-Type: multipart/mixed;
 boundary="------------38956755D0F484510DE165D9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------38956755D0F484510DE165D9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.12.20 17:13, Dario Faggioli wrote:
> On Tue, 2020-12-01 at 10:18 +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 01.12.20 10:12, Jan Beulich wrote:
>>> What guarantees that you managed to find an unused ID, other
>>> than at current CPU speeds it taking too long to create 4
>>> billion pools? Since you're doing this under lock, wouldn't
>>> it help anyway to have a global helper variable pointing at
>>> the lowest pool followed by an unused ID?
>>
>> An admin doing that would be quite crazy and wouldn't deserve better.
>>
>> For being usable a cpupool needs to have a cpu assigned to it. And I
>> don't think we are coming even close to 4 billion supported cpus. :-)
>>
>> Yes, it would be possible to create 4 billion empty cpupools, but for
>> what purpose? There are simpler ways to make the system unusable with
>> dom0 root access.
>>
> Yes, I agree. I don't think it's worth going through too much effort
> for trying to deal with that.
>=20
> What I'd do is:
>   - add a comment here, explaining quickly exactly this fact, i.e.,
>     that it's not that we've forgotten to deal with this and it's all
>     on=C2=A0purpose. Actually, it can be either a comment here or it ca=
n be
>     mentioned in the changelog. I'm fine either way
>   - if we're concerned about someone doing:
>       for i=3D1...N { xl cpupool-create foo bar }
>     with N ending up being some giant number, e.g., by mistake, I don't=

>     think it's unreasonable to come up with an high enough (but
>     certainly not in the billions!) MAX_CPUPOOLS, and stop creating new=

>     ones when we reach that level.

Do you agree that this could be another patch?

I'm not introducing that (theoretical) problem here.


Juergen

--------------38956755D0F484510DE165D9
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

--------------38956755D0F484510DE165D9--

--zZ5RQvfaEdQoknt99G5x3RkM1YvBQuudI--

--Na8waiugEdiEkwE6AMBr4JLGmOuQAJmic
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/KYMwFAwAAAAAACgkQsN6d1ii/Ey+M
Pwf/fithXX+j1WDC8LgFkxUA74j8tEbR21GoRHgpvFB60RrVHUkhCJAPz1IRBLSLDWr7EUgWX2X4
aJda8afRVjwioryzrCbr+q6hyrPwjJ5INWO7ZyNB8yOsK71paVCHeFxeItsMsNeFMMhteNcwzmGh
xifQh7derOa7syUbJn8Zh9cd1sMjUoc4LCL3csoEwMvAeGJWXCEtWDGZfS+72BL301exP8Qd8vc9
hf60brsA4wcqrRV2P7bNPahGVn+LCpuCqqpGFrHcj7aa7Lhh/bg06FNntNoEMlACgbf8uDnk9igJ
6HjjJzKI9Q9OldiEspvbe4YLiMq13yUruDREPpPB3g==
=Lxw8
-----END PGP SIGNATURE-----

--Na8waiugEdiEkwE6AMBr4JLGmOuQAJmic--

