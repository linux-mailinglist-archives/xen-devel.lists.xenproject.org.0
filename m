Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6D4534D1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226345.391116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzxY-00004z-E2; Tue, 16 Nov 2021 15:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226345.391116; Tue, 16 Nov 2021 15:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzxY-0008TW-Ao; Tue, 16 Nov 2021 15:01:20 +0000
Received: by outflank-mailman (input) for mailman id 226345;
 Tue, 16 Nov 2021 15:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Wk1=QD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mmzxW-0008TQ-N2
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:01:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cf489e6-46ee-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 16:01:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F8EF212B6;
 Tue, 16 Nov 2021 15:01:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C19B13C1B;
 Tue, 16 Nov 2021 15:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7uAfAb3Hk2ECKAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Nov 2021 15:01:17 +0000
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
X-Inumbo-ID: 0cf489e6-46ee-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637074877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XeuZ0+ntnw8AvCOCLcRrjfSoiSRid468au7ycxI+be0=;
	b=RXEqFlGK3w5mQ5zyrUy91agF75LqwfU8P54vp+WdlXxZ31m6tBTTewjlwxz8X/terc1eEM
	ITwWCjcNBcaaANKrBzjIdP6Z0UqMJqOVbwKwSKj2PE8J0c2t1m0v+dgajYcPZY2BwKTRew
	MKt5bihUe1hhf5OElkox+i4+j2ECd8A=
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
To: Jan Beulich <jbeulich@suse.com>
Cc: linux@weissschuh.net, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20211116143323.18866-1-jgross@suse.com>
 <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b155f66d-8259-ba87-62c4-ce8a0f7ed82f@suse.com>
Date: Tue, 16 Nov 2021 16:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i8FKDEJdp8XPNNhnlPoWSA2txn447H8mS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i8FKDEJdp8XPNNhnlPoWSA2txn447H8mS
Content-Type: multipart/mixed; boundary="1mV0JI7SNvJF6BZaJCgL2zM8fLJydHXNK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: linux@weissschuh.net, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <b155f66d-8259-ba87-62c4-ce8a0f7ed82f@suse.com>
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
References: <20211116143323.18866-1-jgross@suse.com>
 <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
In-Reply-To: <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>

--1mV0JI7SNvJF6BZaJCgL2zM8fLJydHXNK
Content-Type: multipart/mixed;
 boundary="------------1E98CE127DBC4401F0518A9F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1E98CE127DBC4401F0518A9F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.11.21 15:55, Jan Beulich wrote:
> On 16.11.2021 15:33, Juergen Gross wrote:
>> This configuration option provides a misc device as an API to userspac=
e.
>> Make this API usable without having to select the module as a transiti=
ve
>> dependency.
>>
>> This also fixes an issue where localyesconfig would select
>> CONFIG_XEN_PRIVCMD=3Dm because it was not visible and defaulted to
>> building as module.
>>
>> Based-on-patch-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -259,9 +259,14 @@ config XEN_SCSI_BACKEND
>>   	  if guests need generic access to SCSI devices.
>>  =20
>>   config XEN_PRIVCMD
>> -	tristate
>> +	tristate "Xen hypercall passthrough driver"
>>   	depends on XEN
>>   	default m
>> +	help
>> +	  The hypercall passthrough driver allows user land programs to perf=
orm
>=20
> Maybe worth adding "privileged" here? Albeit of course that's different=

> from the use of the word ...

I guess you mean "... allows privileged user programs ..." (another
variant might be "The privileged hypercall passthrough ...")?


Juergen

--------------1E98CE127DBC4401F0518A9F
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

--------------1E98CE127DBC4401F0518A9F--

--1mV0JI7SNvJF6BZaJCgL2zM8fLJydHXNK--

--i8FKDEJdp8XPNNhnlPoWSA2txn447H8mS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGTx7sFAwAAAAAACgkQsN6d1ii/Ey86
DAf/VS0bpSvXrWKpz2fvlBlqBh3q9TOwlw9DYHEMKg7Ps9r/rwSvIJtp5YcMmMRNJlvh170LULPl
bQ9LAJurQWQklPoZjy3jZx6iGNZmWrLxe0Dt7uXkyIDI8tiVszD5TOexeiFqspHD8RkR5rfEfvI1
/+gL9QIQaauie4MPiEqAranGjZ9UHLsum7yAYcbtO3bjU5wQERVEtOIA+UCeD6TAGG7UJg27WjRb
KfUuBy+nOvWDobamEq5mmTRJFi0OAn5H6yemZPgbkqSMhpM+StNgiocA3VEmvak73LbaXVR7MkFN
dvquyC7reEIxsMUwOxnT+x6efioFcV9UX/KyBXezYw==
=PYgV
-----END PGP SIGNATURE-----

--i8FKDEJdp8XPNNhnlPoWSA2txn447H8mS--

