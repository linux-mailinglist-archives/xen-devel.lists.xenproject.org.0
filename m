Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153913823F7
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 08:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128035.240459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liWSq-0005Q1-VA; Mon, 17 May 2021 06:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128035.240459; Mon, 17 May 2021 06:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liWSq-0005Nz-Pr; Mon, 17 May 2021 06:10:52 +0000
Received: by outflank-mailman (input) for mailman id 128035;
 Mon, 17 May 2021 06:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1liWSp-0005Nt-Sr
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 06:10:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e947e231-7526-4dcd-af13-fdba7e689a5b;
 Mon, 17 May 2021 06:10:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 084AEB17E;
 Mon, 17 May 2021 06:10:50 +0000 (UTC)
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
X-Inumbo-ID: e947e231-7526-4dcd-af13-fdba7e689a5b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621231850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qCdkIsV7Fle2n1PZaY30cqASV5X3cN/rbGLPhtugg8c=;
	b=OJU8n3JP5M1r5K/ywx4r/wORD9puCMBfqWVZQjtIaIcTTA1NaReRMG8o07/sj70xQ/OwSi
	fvzEIKXPbnKSuKX2gHI3lBOI3/vnmUCeMgOBxe/Wkb/ONn3HvaD2+F8L+Mk5XXnDiSFe1v
	s//w5jvIIx+4a8qqIb95u3YeVk8dNaI=
Subject: Re: [PATCH v2 2/2] tools/xenstore: simplify xenstored main loop
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514115620.32731-1-jgross@suse.com>
 <20210514115620.32731-3-jgross@suse.com>
 <24e89076-4440-a32e-f701-71957cc2a9e4@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <12b13143-717b-c288-b96b-50613dafc6d3@suse.com>
Date: Mon, 17 May 2021 08:10:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24e89076-4440-a32e-f701-71957cc2a9e4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uhyCoXdgLTLBAJJpxQta8UGpiqqAG1jzm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uhyCoXdgLTLBAJJpxQta8UGpiqqAG1jzm
Content-Type: multipart/mixed; boundary="ivS4C9vKhIRFbI3T3j9Wwpbn8bjBbAU3x";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <12b13143-717b-c288-b96b-50613dafc6d3@suse.com>
Subject: Re: [PATCH v2 2/2] tools/xenstore: simplify xenstored main loop
References: <20210514115620.32731-1-jgross@suse.com>
 <20210514115620.32731-3-jgross@suse.com>
 <24e89076-4440-a32e-f701-71957cc2a9e4@xen.org>
In-Reply-To: <24e89076-4440-a32e-f701-71957cc2a9e4@xen.org>

--ivS4C9vKhIRFbI3T3j9Wwpbn8bjBbAU3x
Content-Type: multipart/mixed;
 boundary="------------445480A3475B0BCD97F9E246"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------445480A3475B0BCD97F9E246
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.05.21 19:05, Julien Grall wrote:
> Hi Juergen,
>=20
> On 14/05/2021 12:56, Juergen Gross wrote:
>> The main loop of xenstored is rather complicated due to different
>> handling of socket and ring-page interfaces. Unify that handling by
>> introducing interface type specific functions can_read() and
>> can_write().
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - split off function vector introduction (Julien Grall)
>> ---
>> =C2=A0 tools/xenstore/xenstored_core.c=C2=A0=C2=A0 | 77 ++++++++++++++=
+----------------
>> =C2=A0 tools/xenstore/xenstored_core.h=C2=A0=C2=A0 |=C2=A0 2 +
>> =C2=A0 tools/xenstore/xenstored_domain.c |=C2=A0 2 +
>> =C2=A0 3 files changed, 41 insertions(+), 40 deletions(-)
>>
>> diff --git a/tools/xenstore/xenstored_core.c=20
>> b/tools/xenstore/xenstored_core.c
>> index 856f518075..883a1a582a 100644
>> --- a/tools/xenstore/xenstored_core.c
>> +++ b/tools/xenstore/xenstored_core.c
>> @@ -1659,9 +1659,34 @@ static int readfd(struct connection *conn, void=
=20
>> *data, unsigned int len)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>> =C2=A0 }
>> +static bool socket_can_process(struct connection *conn, int mask)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (conn->pollfd_idx =3D=3D -1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (fds[conn->pollfd_idx].revents & ~(POLLIN | POL=
LOUT)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 talloc_free(conn);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return (fds[conn->pollfd_idx].revents & mask) && !=
conn->is_ignored;
>> +}
>> +
>> +static bool socket_can_write(struct connection *conn)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return socket_can_process(conn, POLLOUT);
>> +}
>> +
>> +static bool socket_can_read(struct connection *conn)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return socket_can_process(conn, POLLIN);
>> +}
>> +
>> =C2=A0 const struct interface_funcs socket_funcs =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .write =3D writefd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .read =3D readfd,
>> +=C2=A0=C2=A0=C2=A0 .can_write =3D socket_can_write,
>> +=C2=A0=C2=A0=C2=A0 .can_read =3D socket_can_read,
>> =C2=A0 };
>> =C2=A0 static void accept_connection(int sock)
>> @@ -2296,47 +2321,19 @@ int main(int argc, char *argv[])
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (&next->list !=3D &connections)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 talloc_increase_ref_count(next);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (conn->domain) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (domain_can_read(conn))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle_input(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (talloc_free(conn) =3D=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 talloc_increase_ref_count(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (domain_can_write(conn) &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !list_empty(&conn->out_list=
))
>=20
> AFAICT, the check "!list_empty(&conn->out_list)" can be safely removed =

> because write_messages() will check if the list is empty (list_top()=20
> returns NULL in this case). Is that correct?

Yes.


Juergen


--------------445480A3475B0BCD97F9E246
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

--------------445480A3475B0BCD97F9E246--

--ivS4C9vKhIRFbI3T3j9Wwpbn8bjBbAU3x--

--uhyCoXdgLTLBAJJpxQta8UGpiqqAG1jzm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCiCOkFAwAAAAAACgkQsN6d1ii/Ey+b
qAf+Jznf+p+VRCCemACVSCt2xff1CIaEVCB7yyWf+gPHbET4ofdFcYnB2F58uVnd5cYOTGSu3jPI
emXuD4jTxytBB2u1u8zXFjqHCxcAIECQ6SvXDTbLaIHr4TZJBu6u3pyqrBCmExxH7+YIDV7HSOYS
Z1BYLV3fn+814+5ICZ6ibJ9G5Tg0qYsPnhX8gTkOQXO5ykGqKiD1aqvh2CltNzX10Qd81eqfKsL5
wOP1Rasbtb+NafC0LfO8Kr06kM3SuWOLSvLvKXqA32vKZyfctqY6+mRDmof+2C89NusxhGAV7Igh
5HX26mWy0XkjT3nx2u8TS07ZeHtq2YiTxxpRe0mezw==
=JNT/
-----END PGP SIGNATURE-----

--uhyCoXdgLTLBAJJpxQta8UGpiqqAG1jzm--

