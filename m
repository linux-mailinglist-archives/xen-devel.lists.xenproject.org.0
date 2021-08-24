Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF183F614C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171563.313058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIY1w-0004OH-6N; Tue, 24 Aug 2021 15:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171563.313058; Tue, 24 Aug 2021 15:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIY1w-0004Ll-3O; Tue, 24 Aug 2021 15:08:00 +0000
Received: by outflank-mailman (input) for mailman id 171563;
 Tue, 24 Aug 2021 15:07:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uw6=NP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mIY1u-0004Lf-QZ
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:07:58 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1035afee-04ed-11ec-a8e4-12813bfff9fa;
 Tue, 24 Aug 2021 15:07:57 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7AE9E1FD9D;
 Tue, 24 Aug 2021 15:07:56 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 48F6613A58;
 Tue, 24 Aug 2021 15:07:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ELBNEEwLJWEwSQAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 24 Aug 2021 15:07:56 +0000
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
X-Inumbo-ID: 1035afee-04ed-11ec-a8e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629817676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4stQJMazP/WS+SVw0/QbZRIgOsFKEmpt8967LvluvGA=;
	b=L9oa70eUMeLPnfl4ojr9e/bAAXRwjmZOt10M9bhAVGnTcjVXlENN66Tw2nq039/SNdCKPS
	s26pVneKnaXxNQlDMk/wDcptF0/h5JFeaSVIl3NXGn1HWN0qoB94K5TbWyfv08Q71+wiNU
	UbRyZMGuDGyTRY8yJOW/95NfH9gM7VI=
Subject: Re: Xen 4.16: Proposed release manager and schedule
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@citrix.com>, committers@xenproject.org
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
 <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
 <24862.31351.137596.242803@mariner.uk.xensource.com>
 <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
 <24868.63053.121473.979573@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8247650a-e0fa-a442-bd65-f06be54b1e1e@suse.com>
Date: Tue, 24 Aug 2021 17:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24868.63053.121473.979573@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UYGrnSNVTdMJPkZaujpXPHsTk1gAjEJkC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UYGrnSNVTdMJPkZaujpXPHsTk1gAjEJkC
Content-Type: multipart/mixed; boundary="ogeOgcjzJyVURPQOCWHedk1ZnrfJi49sv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@citrix.com>, committers@xenproject.org
Message-ID: <8247650a-e0fa-a442-bd65-f06be54b1e1e@suse.com>
Subject: Re: Xen 4.16: Proposed release manager and schedule
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
 <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
 <24862.31351.137596.242803@mariner.uk.xensource.com>
 <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
 <24868.63053.121473.979573@mariner.uk.xensource.com>
In-Reply-To: <24868.63053.121473.979573@mariner.uk.xensource.com>

--ogeOgcjzJyVURPQOCWHedk1ZnrfJi49sv
Content-Type: multipart/mixed;
 boundary="------------B51558198862F3CCFB541662"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B51558198862F3CCFB541662
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.08.21 15:38, Ian Jackson wrote:
> Julien Grall writes ("Re: Xen 4.16: Proposed release manager and schedu=
le"):
>> On 19/08/2021 16:36, Ian Jackson wrote:
>>> One option is to slip the whole release, in the expectation (hope!) o=
f
>>> collecting more input.  In practical terms because of the impact of
>>> Christmas and New Year on many of our contributors, a month's slip no=
w
>>> is probably more like two months' slip to the release.  So arguably
>>> for this to be worth it, we ought to plan to slip 2 months now and
>>> release in February.
>>
>> A 2 months slip looks appealling to get more features. But it means we=

>> will end up to split all the future releases.
>=20
> No, it wouldn't, really.  Our usual release interval is 9 months.

8 months (that's what I suggested in my time as a release manager and
what was approved and never changed "officially").

> 9+2 =3D 11, so the result would be a one month longer release, if we
> delayed this one by 2 months.  In practice it is always a bit of a
> struggle to keep things to time (that's the way things are set up with
> this system) so I think this is well within our usual tolerances.
>=20
> For the avoidance of doubt, I am not arguing in favour of this option.
> But I wanted to present it as a reasonable option the community might
> want to consider.
>=20
> Jan, do you have an opnion about this ?  Do you expect that a 2-3
> month slip would help with your review backlog, bearing in mind the
> people who are currently on leave and when they'll be back ?
>=20
> If no-one wishes to argue in favour of the longer slip I think we
> should go with the normal plan.
>=20
>> At the moment, my preference is to stick with the release in December.=

>> We don't have major contributions checked in yet on Arm, but there is =
a
>> chance to have a couple of them with the current schedule on Arm.
>>
>> We also have a collection of bug fixes which makes Arm running better =
on
>> some platform.
>>
>> So I think the release would still be worthwhile even in the worst cas=
e
>> where nothing major is merged.
>=20
> Thanks for the opinion.
>=20
>=20
> Can I at least get a +1 from someone for appointing me as RM
> for 4.16 ? :-)

+1 :-)


Juergen

--------------B51558198862F3CCFB541662
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

--------------B51558198862F3CCFB541662--

--ogeOgcjzJyVURPQOCWHedk1ZnrfJi49sv--

--UYGrnSNVTdMJPkZaujpXPHsTk1gAjEJkC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmElC0sFAwAAAAAACgkQsN6d1ii/Ey+1
8AgAn+q1SvmxoNvn1ss6YgKj3dcdau4Aago8EzEgIso8rQ25nnrneEGEGjFs0/cLaYuZmchgh0Yu
f6qDvivLZpm12chYw4RsDuYV/mnoBLOkREWodS++igdIWV79WrVzPw0NH7ALp4KRC7q5jFlDfvtF
pSrlJcN17/mNO53yeSYXTqkuw1qregRL4i8bQOuh5wrzXYijVIpPQ6uVZMhiN8HWDtvLv1Lucb/n
t3wQFL9M5VEwwWivTW3Bg8hYusnW3CD+ribq1v/BopRmSBmo5ep2zO2nkCLERGnE/jj8eKZMAdaO
jPK/olK8+hKdcEV0zXFeo+Hwqq2CJuQaCjTDag6NvA==
=QhvA
-----END PGP SIGNATURE-----

--UYGrnSNVTdMJPkZaujpXPHsTk1gAjEJkC--

