Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406B3FB9E6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 18:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175191.319234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjtl-0005nm-E6; Mon, 30 Aug 2021 16:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175191.319234; Mon, 30 Aug 2021 16:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjtl-0005lt-Aq; Mon, 30 Aug 2021 16:12:37 +0000
Received: by outflank-mailman (input) for mailman id 175191;
 Mon, 30 Aug 2021 16:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFp4=NV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mKjtj-0005ln-T5
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 16:12:35 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15c96184-09ad-11ec-ac9b-12813bfff9fa;
 Mon, 30 Aug 2021 16:12:34 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7BC5200D7;
 Mon, 30 Aug 2021 16:12:33 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 90CC3139BB;
 Mon, 30 Aug 2021 16:12:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id GdbNIXEDLWGsIAAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 30 Aug 2021 16:12:33 +0000
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
X-Inumbo-ID: 15c96184-09ad-11ec-ac9b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630339953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBQ7FIg+6O9siSbKpK8EjSIbBKNvrFU9Ut9QehKS9a4=;
	b=iovPIVz2Nx8Kf+6XMfuc0Gk1sBC6D+rmCHaclRSHk888d5KVTn/YmVq8i6D/aFbFxVx6WB
	Qnx3Mu2LS7l/yHbpbJQmCFOugz0Zb4c3qLOx1kPRHkyU/T/7Tp8SyqqUwS46e029CGvo8t
	8CZWdHRV3S6ir71UzFokDCd4RTC2sWg=
Subject: Re: [PATCH v2] xen/pcifront: Removed unnecessary __ref annotation
To: =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?= <lonyelon@gmail.com>,
 konrad.wilk@oracle.com
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, bhelgaas@google.com,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?=
 <sergio@lony.xyz>
References: <20210830175305.13370-1-sergio@lony.xyz>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c30a0835-e1c2-eca1-90d9-fcf8808c6510@suse.com>
Date: Mon, 30 Aug 2021 18:12:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210830175305.13370-1-sergio@lony.xyz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mSX3MV3pc7lCaHXzywjt4cM0ijUa0JFTe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mSX3MV3pc7lCaHXzywjt4cM0ijUa0JFTe
Content-Type: multipart/mixed; boundary="wgqNTkARa6z9h1rsIpTkGELfWVqJ3Iy5l";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?= <lonyelon@gmail.com>,
 konrad.wilk@oracle.com
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, bhelgaas@google.com,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?=
 <sergio@lony.xyz>
Message-ID: <c30a0835-e1c2-eca1-90d9-fcf8808c6510@suse.com>
Subject: Re: [PATCH v2] xen/pcifront: Removed unnecessary __ref annotation
References: <20210830175305.13370-1-sergio@lony.xyz>
In-Reply-To: <20210830175305.13370-1-sergio@lony.xyz>

--wgqNTkARa6z9h1rsIpTkGELfWVqJ3Iy5l
Content-Type: multipart/mixed;
 boundary="------------4C62CBBA30041344696CEC9B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4C62CBBA30041344696CEC9B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.08.21 19:53, Sergio Migu=C3=A9ns Iglesias wrote:
> An unnecessary "__ref" annotation was removed from the
> "drivers/pci/xen_pcifront.c" file. The function where the annotation
> was used was "pcifront_backend_changed()", which does not call any
> functions annotated as "__*init" nor "__*exit". This makes "__ref"
> unnecessary since this annotation is used to make the compiler ignore
> section miss-matches when they are not happening here in the first
> place.
>=20
> In addition to the aforementioned change, some code style issues were
> fixed in the same file.
>=20
> Signed-off-by: Sergio Migu=C3=A9ns Iglesias <sergio@lony.xyz>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------4C62CBBA30041344696CEC9B
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

--------------4C62CBBA30041344696CEC9B--

--wgqNTkARa6z9h1rsIpTkGELfWVqJ3Iy5l--

--mSX3MV3pc7lCaHXzywjt4cM0ijUa0JFTe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEtA3EFAwAAAAAACgkQsN6d1ii/Ey8q
TAf+MVn0lQXPCkA3G8XCakPAwOP+HEof7NLvoGaAVNv8XzHA48C+CoUEqV7ibOn0iNW/gkvheZLA
fvXrAQqUi7P+n7YFcBV6xFCbbtFyCb6jgyZ7RUNpgd/YNmo3ZHc8Ae5KS0+uI4stXKBav6SvIXs9
MWzaNOqhBR25Se9qaJvbO8JJ2tq2bzZWS1vsc4q7HTx5Uz9F3PUjtBdq//tD0pPTSyaA1SXtg+A2
bmkbZ6cV9dK6A6rs1D8qyfUMQF+zL1gwbEU8SKA0XCsIGUk7AcLp8yvfLKDor+1zeAIc5cjMNjl/
eviBfsf14LfRZ925sB2e/gdvmi0Wjo74tdQNSE+iMg==
=Xg+X
-----END PGP SIGNATURE-----

--mSX3MV3pc7lCaHXzywjt4cM0ijUa0JFTe--

