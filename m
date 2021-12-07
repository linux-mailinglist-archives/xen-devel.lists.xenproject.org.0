Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06046B994
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240867.417617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6O-0007BX-Gz; Tue, 07 Dec 2021 10:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240867.417617; Tue, 07 Dec 2021 10:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6O-00078h-Di; Tue, 07 Dec 2021 10:53:40 +0000
Received: by outflank-mailman (input) for mailman id 240867;
 Tue, 07 Dec 2021 10:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=myTo=QY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muY6N-00078Z-0M
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:53:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee3b61c7-574b-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 11:53:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC29121B3D;
 Tue,  7 Dec 2021 10:53:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9876B13A1F;
 Tue,  7 Dec 2021 10:53:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A4/zIzA9r2EnfAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Dec 2021 10:53:36 +0000
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
X-Inumbo-ID: ee3b61c7-574b-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638874416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iMU5kFRFW4+mIyjlpwDRmaB93Kkrj4D2KFkdZFHBh+I=;
	b=OVxh46/Of1hKJDvZ3zjFRJKpELSoo6e2w+WERG1jyP90CYYURPdQKr30BGB6+4pBCYavbG
	NrETmzYiBNnPnwxXBxgBrJSDo1EW+8T7FXX8rsvvB+AihNKBaolu61wgxMqE16+m6D3wly
	UYI3k9Ux8Z7JA03KOqWfWzYC9K6HNG0=
Subject: Re: [XEN PATCH 18/57] tools: Use config.h from autoconf instead of
 "buildmakevars2header"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-19-anthony.perard@citrix.com>
 <d9819a32-7a45-f753-0b6d-50e01aacb6a1@suse.com> <Ya88SjdSbANPGrcF@perard>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1c7d51ee-a3f7-e458-b699-906e50ef57a0@suse.com>
Date: Tue, 7 Dec 2021 11:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <Ya88SjdSbANPGrcF@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iQduExcDZJDa2grjZDDFjdZLwUA2PjwRm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iQduExcDZJDa2grjZDDFjdZLwUA2PjwRm
Content-Type: multipart/mixed; boundary="7pKB62OYhZGVVlrXApwTt2DjCrVokXCHz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <1c7d51ee-a3f7-e458-b699-906e50ef57a0@suse.com>
Subject: Re: [XEN PATCH 18/57] tools: Use config.h from autoconf instead of
 "buildmakevars2header"
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-19-anthony.perard@citrix.com>
 <d9819a32-7a45-f753-0b6d-50e01aacb6a1@suse.com> <Ya88SjdSbANPGrcF@perard>
In-Reply-To: <Ya88SjdSbANPGrcF@perard>

--7pKB62OYhZGVVlrXApwTt2DjCrVokXCHz
Content-Type: multipart/mixed;
 boundary="------------7BAF95EC78BB71DC8159B772"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7BAF95EC78BB71DC8159B772
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.12.21 11:49, Anthony PERARD wrote:
> On Tue, Dec 07, 2021 at 11:08:55AM +0100, Juergen Gross wrote:
>> On 06.12.21 18:02, Anthony PERARD wrote:
>>> This avoid the need to generate the _paths.h header when the
>>> information is from autoconf anyway.
>>>
>>> They are no more users of the "buildmakevars2header" macro, so it can=

>>> be removed from "Config.mk".
>>>
>>> Also removed the extra "-f" flag where "$(RM)" is used (xl/Makefile).=

>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> The changes for configure should be done in the respective configure.a=
c
>> files and then configure can be generated via a call of "autoconf".
>=20
> This is what this patch does, via changes in "m4/paths.m4" ;-).
> All the respective "configure.ac" have "m4_include([m4/paths.m4])", so
> nearly any modification to "paths.m4" will change the generated
> "configure" script.

Oh, I just looked at the modified files and didn't see any *.ac ones.

I was already wondering how you could miss that, especially as you did
it correctly in the next patch. :-)

You can then add my:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------7BAF95EC78BB71DC8159B772
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

--------------7BAF95EC78BB71DC8159B772--

--7pKB62OYhZGVVlrXApwTt2DjCrVokXCHz--

--iQduExcDZJDa2grjZDDFjdZLwUA2PjwRm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGvPTAFAwAAAAAACgkQsN6d1ii/Ey/S
4wf/U5RHMU/cjsN6Y/B7gWHHsmVa0B1neCtcTE+p9UganhA+GUtohlcoLFKXInxSBuQ2FKzW11+k
YIZrJr8jlGgtotk2Ts2g2u2j8bqkg0L6Nig3HcWoTDsuBACKl2uRvnHdoVTDJ9Gba7dtYaP5/oTA
D72sa+Vj4kxqtNfz5VVKkK6w9GPiozObal2wKK7FM4w3GR2sKzaGgX4M6q67keLY4sXdjpAO6xyq
m1+73hbp+WtKSAGpj8KpNtilsUNboXRHsTaXQ/uic1dzXVa/XkfjHuZYgmSSVW9rYMoYiaBn/cgV
A7159VNvQ3c6Bb+LJbmkSjHSxsw8QsceiSeQf55a1w==
=UN2i
-----END PGP SIGNATURE-----

--iQduExcDZJDa2grjZDDFjdZLwUA2PjwRm--

