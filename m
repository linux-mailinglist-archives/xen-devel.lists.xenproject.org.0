Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C92D5967
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 12:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49107.86834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKJY-00011s-5F; Thu, 10 Dec 2020 11:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49107.86834; Thu, 10 Dec 2020 11:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKJY-00011T-1j; Thu, 10 Dec 2020 11:40:52 +0000
Received: by outflank-mailman (input) for mailman id 49107;
 Thu, 10 Dec 2020 11:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PZm+=FO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1knKJW-00011O-SS
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 11:40:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 309028b6-33b3-41fa-af2d-f7c3522de9e4;
 Thu, 10 Dec 2020 11:40:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2436FAD63;
 Thu, 10 Dec 2020 11:40:48 +0000 (UTC)
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
X-Inumbo-ID: 309028b6-33b3-41fa-af2d-f7c3522de9e4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607600449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zaS3R0D28hfhRJRE8kS9Fjpf3ltkfs74Q0HQPBSqdr8=;
	b=l1ku7VnksbHmDI/hbfm+HUu1MfXIfYXOu3dojB1LBKeYCDxar1PKmTBS213bq9oCCc4E0U
	p4Luu9fLuvfi7i+/Gnt2G11845AMhTzcFCP9DkNixY7baetrDGi9+Iy9ZOAKPH3wosCOxQ
	bFoTD0LYZFaxB20mP5tglo2JiecXXWw=
Subject: Re: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201207133024.16621-1-jgross@suse.com>
 <20201207133024.16621-3-jgross@suse.com>
 <CAKf6xpuqdY=TctOjNsnTTexeBpkV+HMkOHFsAd4vxUudBpxizA@mail.gmail.com>
 <72bc4417-076c-78f0-9c7e-5a9c95e79fb2@suse.com>
 <20201210111454.dxykvyktzwr3fjyk@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7425aed6-ff6f-873a-b629-b9c7058e9b13@suse.com>
Date: Thu, 10 Dec 2020 12:25:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210111454.dxykvyktzwr3fjyk@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ksoksSJb3j0Ut26tcfA9wmBm4Bn3Gsd2Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ksoksSJb3j0Ut26tcfA9wmBm4Bn3Gsd2Y
Content-Type: multipart/mixed; boundary="LnRafePN06iNHry9leb0lMX8VhyDVlrY5";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <7425aed6-ff6f-873a-b629-b9c7058e9b13@suse.com>
Subject: Re: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory
References: <20201207133024.16621-1-jgross@suse.com>
 <20201207133024.16621-3-jgross@suse.com>
 <CAKf6xpuqdY=TctOjNsnTTexeBpkV+HMkOHFsAd4vxUudBpxizA@mail.gmail.com>
 <72bc4417-076c-78f0-9c7e-5a9c95e79fb2@suse.com>
 <20201210111454.dxykvyktzwr3fjyk@Air-de-Roger>
In-Reply-To: <20201210111454.dxykvyktzwr3fjyk@Air-de-Roger>

--LnRafePN06iNHry9leb0lMX8VhyDVlrY5
Content-Type: multipart/mixed;
 boundary="------------BA5A6B6E95D44F69ED3FB6FB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BA5A6B6E95D44F69ED3FB6FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.12.20 12:14, Roger Pau Monn=C3=A9 wrote:
> On Tue, Dec 08, 2020 at 07:45:00AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 07.12.20 21:48, Jason Andryuk wrote:
>>> On Mon, Dec 7, 2020 at 8:30 AM Juergen Gross <jgross@suse.com> wrote:=

>>>>
>>>> Commit 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated
>>>> memory") introduced usage of ZONE_DEVICE memory for foreign memory
>>>> mappings.
>>>>
>>>> Unfortunately this collides with using page->lru for Xen backend
>>>> private page caches.
>>>>
>>>> Fix that by using page->zone_device_data instead.
>>>>
>>>> Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated mem=
ory")
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Would it make sense to add BUG_ON(is_zone_device_page(page)) and the
>>> opposite as appropriate to cache_enq?
>>
>> No, I don't think so. At least in the CONFIG_ZONE_DEVICE case the
>> initial list in a PV dom0 is populated from extra memory (basically
>> the same, but not marked as zone device memory explicitly).
>=20
> I assume it's fine for us to then use page->zone_device_data even if
> the page is not explicitly marked as ZONE_DEVICE memory?

I think so, yes, as we are owner of that page and we were fine to use
lru, too.

>=20
> If that's fine, add my:
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> To both patches, and thank you very much for fixing this!

UR welcome. :-)


Juergen

--------------BA5A6B6E95D44F69ED3FB6FB
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

--------------BA5A6B6E95D44F69ED3FB6FB--

--LnRafePN06iNHry9leb0lMX8VhyDVlrY5--

--ksoksSJb3j0Ut26tcfA9wmBm4Bn3Gsd2Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/SBb8FAwAAAAAACgkQsN6d1ii/Ey+Y
JAgAhvi8On0omlCq6kAAnEhiDDtQpG1QxSB4jHR5B5cy5PJCgWGrrtxQj06Fm+nVv9UxAbNnPdxq
aSIoodvIB1HTeOCluhp3kV1jyOBoCEtHG3/M7gjA64LJxAgKYtgxcWxZc5AEXPAaa+4Z1FgpoM9Z
/rLx7ysQVM0gLMYYqQk5cbETqa8pCHpcbSN8DmI4vDk/cC4TlHWZ7SMwC5AMRfqFPh8Vnee6ozo1
Y8+XKGRFlFzjkB/nvg7jYc/bUl/+8EdXK+PJNPWjYwxPWgctNX8JHkSnYtNiX3iEF3zCR19mnYP5
2R15q5LdCuWQoot9zOb7gpMlO7V0KDxr6/h4UwhDMw==
=+PsR
-----END PGP SIGNATURE-----

--ksoksSJb3j0Ut26tcfA9wmBm4Bn3Gsd2Y--

