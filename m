Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D563824BA
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 08:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128059.240502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liX3l-0002Qr-Tn; Mon, 17 May 2021 06:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128059.240502; Mon, 17 May 2021 06:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liX3l-0002P0-Qk; Mon, 17 May 2021 06:49:01 +0000
Received: by outflank-mailman (input) for mailman id 128059;
 Mon, 17 May 2021 06:49:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1liX3k-0002MT-A9
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 06:49:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e31979ac-1134-46ab-92d6-0baaaab921a2;
 Mon, 17 May 2021 06:48:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9760EAAFD;
 Mon, 17 May 2021 06:48:52 +0000 (UTC)
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
X-Inumbo-ID: e31979ac-1134-46ab-92d6-0baaaab921a2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621234132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t82WmwomixiXQU1aJXx8VZmvd3rCMkGrjCKqHwePMiQ=;
	b=cgJttrL3pOSPIKstid/5v/wLuxbVMpVcvwRUYoQTLD4C4ua+zzanH+pI3cmHmPI7CpAdFi
	Ya2nZwSrPu0phiZM4l3tdHV7KV79m9JCJbp6o+weNnVFKN5fdwALcTsHQxkqD4RolVTpYM
	xHlPmSLRo1BI6PNmg7LJx0arrFe4oEI=
Subject: Re: [PATCH] tools/xenstore: simplify xenstored main loop
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514083905.18212-1-jgross@suse.com>
 <304944cf-ac92-be14-e088-1975ef073255@xen.org>
 <3be1937f-3cd9-3eb8-48fd-bc9c9a85c051@suse.com>
 <5744a347-282c-ff61-7507-03b7a1e9d4c9@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ae53addb-7e64-8a93-10fc-149f5ae4bea3@suse.com>
Date: Mon, 17 May 2021 08:48:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5744a347-282c-ff61-7507-03b7a1e9d4c9@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3r2qIYjf4DevjROFZBuXZb59Kj1JbQ2AQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3r2qIYjf4DevjROFZBuXZb59Kj1JbQ2AQ
Content-Type: multipart/mixed; boundary="QhB45rtkKkDRUkzjfuIUtPO2RZ9DFAk1e";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <ae53addb-7e64-8a93-10fc-149f5ae4bea3@suse.com>
Subject: Re: [PATCH] tools/xenstore: simplify xenstored main loop
References: <20210514083905.18212-1-jgross@suse.com>
 <304944cf-ac92-be14-e088-1975ef073255@xen.org>
 <3be1937f-3cd9-3eb8-48fd-bc9c9a85c051@suse.com>
 <5744a347-282c-ff61-7507-03b7a1e9d4c9@xen.org>
In-Reply-To: <5744a347-282c-ff61-7507-03b7a1e9d4c9@xen.org>

--QhB45rtkKkDRUkzjfuIUtPO2RZ9DFAk1e
Content-Type: multipart/mixed;
 boundary="------------09DE16596C228E3025C1508A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------09DE16596C228E3025C1508A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.05.21 13:51, Julien Grall wrote:
> Hi Juergen,
>=20
> On 14/05/2021 10:42, Juergen Gross wrote:
>> On 14.05.21 11:35, Julien Grall wrote:
>>>> -struct connection *new_connection(connwritefn_t *write,=20
>>>> connreadfn_t *read);
>>>> +struct connection *new_connection(struct interface_funcs *funcs);
>>>> =C2=A0 struct connection *get_connection_by_id(unsigned int conn_id)=
;
>>>> =C2=A0 void check_store(void);
>>>> =C2=A0 void corrupt(struct connection *conn, const char *fmt, ...);
>>>> @@ -254,9 +258,6 @@ void finish_daemonize(void);
>>>> =C2=A0 /* Open a pipe for signal handling */
>>>> =C2=A0 void init_pipe(int reopen_log_pipe[2]);
>>>> -int writefd(struct connection *conn, const void *data, unsigned int=
=20
>>>> len);
>>>> -int readfd(struct connection *conn, void *data, unsigned int len);
>>>> -
>>>> =C2=A0 extern struct interface_funcs socket_funcs;
>>>
>>> Hmmm... I guess this change splipped in the staging before hand?
>>
>> No, I just forgot to make the functions static.
>=20
> Hmmm... I am not sure how this is related to my question. What I meant =

> it the line "extern struct interface_funcs ..." doesn't have a '+' in=20
> front.

Oh, I misunderstood you.

>=20
> If you look at the history, this was added by mistake in:
>=20
> commit 2ea411bc2c0a5a4c7ab145270f1949630460e72b
> Author: Juergen Gross <jgross@suse.com>
> Date:=C2=A0=C2=A0 Wed Jan 13 14:00:20 2021 +0100

Yes, this seems to be the case. I had this patch lying around for some
time and moving the LU patches further up in the queue seems to have
missed this line.


Juergen

--------------09DE16596C228E3025C1508A
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

--------------09DE16596C228E3025C1508A--

--QhB45rtkKkDRUkzjfuIUtPO2RZ9DFAk1e--

--3r2qIYjf4DevjROFZBuXZb59Kj1JbQ2AQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCiEdMFAwAAAAAACgkQsN6d1ii/Ey92
1AgAlalw3rHLwfJESZJzKZG93gplPQtm7s+yq/Qs/zC2K1r7H70dSY8nEjOlSWe6sjraqUrQtMFw
UYty2YPlQwRWc1aJW/pu/lV56PpZGgHigxOtj9bOwZGsXh30eiJngQAhwxXJ0OCTtNFQPNZ2BspU
iQMtrwuvJdYv2zAgo00WlGzA5/jcjEqmqhoSMtzf4O7zFMSiOBkuoW6aOXiHikfyPnmZ0Yv1zent
FlEW8PGrP0EYuMyehBFCjp+AoP/xaagFyAt1/EpSE9CtPQ52yeovC0/BbCzku+prCn1C6E9f01VP
RpwV18/AgBOMB16JNNE9kwNNfpDNsS7dkmy7mfhrrQ==
=IIU3
-----END PGP SIGNATURE-----

--3r2qIYjf4DevjROFZBuXZb59Kj1JbQ2AQ--

