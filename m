Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52A6492EA
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 07:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458778.716576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4FqN-0000UL-Q7; Sun, 11 Dec 2022 06:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458778.716576; Sun, 11 Dec 2022 06:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4FqN-0000S5-Mq; Sun, 11 Dec 2022 06:29:47 +0000
Received: by outflank-mailman (input) for mailman id 458778;
 Sun, 11 Dec 2022 06:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4FqM-0000Ry-4k
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 06:29:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 337fdd10-791d-11ed-91b6-6bf2151ebd3b;
 Sun, 11 Dec 2022 07:29:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F36A95C93E;
 Sun, 11 Dec 2022 06:29:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D654413413;
 Sun, 11 Dec 2022 06:29:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id He0UM9d4lWOkKAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 11 Dec 2022 06:29:43 +0000
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
X-Inumbo-ID: 337fdd10-791d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670740184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QrbjmrDGUd9F3B2fw0U6cMSESF0MWdGudNrDHZgqs8c=;
	b=VyQh40gbtrrisRwHC6SyhNRfp3HaMBG1BspKmm+UbLcVrgdEYryKFx/nwGzJbZZUEMRwSh
	rDBs/MIQfbBZ+47z4dfQTUt24QYWSI3kPpB9wf8c1EVLnQBB8/jD5TUHs1A9yp+HOQ85Cf
	oC8LaC2ddZ2HfvJJNqX0g2qmTPkb8/U=
Message-ID: <ca3eaab6-8bbb-6169-6c9c-3fbf000f6e53@suse.com>
Date: Sun, 11 Dec 2022 07:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
References: <Y5OBOHd7hFGR+4GT@itl-email> <Y5Vd0Oqu1J7Z0j4R@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 6.0.8 generates L1TF-vulnerable PTE if Xen's PAT is
 modified
In-Reply-To: <Y5Vd0Oqu1J7Z0j4R@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FWVEI5EeosqtLSHPqEvtr6v0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FWVEI5EeosqtLSHPqEvtr6v0
Content-Type: multipart/mixed; boundary="------------rd1O3qjcLL8LCR6OFu2CsVbT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Message-ID: <ca3eaab6-8bbb-6169-6c9c-3fbf000f6e53@suse.com>
Subject: Re: Linux 6.0.8 generates L1TF-vulnerable PTE if Xen's PAT is
 modified
References: <Y5OBOHd7hFGR+4GT@itl-email> <Y5Vd0Oqu1J7Z0j4R@mail-itl>
In-Reply-To: <Y5Vd0Oqu1J7Z0j4R@mail-itl>

--------------rd1O3qjcLL8LCR6OFu2CsVbT
Content-Type: multipart/mixed; boundary="------------X3dSAC7APBOv3GXR1kkDBTKG"

--------------X3dSAC7APBOv3GXR1kkDBTKG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMTIuMjIgMDU6MzQsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gRnJpLCBEZWMgMDksIDIwMjIgYXQgMDE6NDA6NTNQTSAtMDUwMCwgRGVtaSBNYXJp
ZSBPYmVub3VyIHdyb3RlOg0KPj4gSWYgWGVuIGlzIHBhdGNoZWQgdG8gdXNlIHRoZSBzYW1l
IFBBVCBMaW51eCBkb2VzLCBpdCBhcHBlYXJzIHRvIGJyZWFrDQo+PiBMMVRGIG1pdGlnYXRp
b25zIGluIFBWIExpbnV4IDYuMC44LiAgTGludXggNS4xNS44MSB3b3JrcyBmaW5lLiAgVGhl
DQo+PiBzeW1wdG9tIGlzIHRoYXQgTGludXggZmFpbHMgdG8gYm9vdCwgd2l0aCBYZW4gY29t
cGxhaW5pbmcgYWJvdXQgYW4NCj4+IEwxVEYtdnVsbmVyYWJsZSBQVEUgd2l0aCBzaGFkb3cg
cGFnaW5nIGRpc2FibGVkLg0KPj4NCj4+IERldGFpbHMgYXJlIGF0IGh0dHBzOi8vZ2l0aHVi
LmNvbS9RdWJlc09TL3F1YmVzLWlzc3Vlcy9pc3N1ZXMvNzkzNS4NCj4gDQo+IENhbGwgdHJh
Y2U6DQo+IA0KPiAoZWFybHkpIFsgICAgMC40MTc1MjddIFJJUDogZTAzMDp4ZW5faHlwZXJj
YWxsX21tdV91cGRhdGUrMHg4LzB4MjANCj4gKGVhcmx5KSBbICAgIDAuNDE3NTM0XSBDb2Rl
OiBjYyBjYyA1MSA0MSA1MyBiOCAwMCAwMCAwMCAwMCAwZiAwNSA0MSA1YiA1OSBjMyBjYyBj
YyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyA1MSA0
MSA1MyBiOCAwMSAwMCAwMCAwMCA8MGY+IDA1IDQxIDViIDU5IGMzIGNjIGNjIGNjIGNjIGNj
IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjDQo+IChlYXJseSkgWyAgICAwLjQx
NzUzN10gUlNQOiBlMDJiOmZmZmZmZmZmODJjMDNkNjggRUZMQUdTOiAwMDAwMDA0Ng0KPiAo
ZWFybHkpIFsgICAgMC40MTc1NDBdIFJBWDogMDAwMDAwMDAwMDAwMDAwMSBSQlg6IDAwMDAw
MDAzOWY3ODgwMDAgUkNYOiBmZmZmZmZmZjgxZTI1MDJhDQo+IChlYXJseSkgWyAgICAwLjQx
NzU0M10gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDA4MDAwMDAwMSBSREk6
IGZmZmZmZmZmODJjMDNkODANCj4gKGVhcmx5KSBbICAgIDAuNDE3NTQ2XSBSQlA6IDgwMTAw
MDAwMTM2MDAwNjYgUjA4OiBmZmZmODg4MDE4Zjg4MDAwIFIwOTogMDAwMDAwMDAwMDAwMDAw
MA0KPiAoZWFybHkpIFsgICAgMC40MTc1NDhdIFIxMDogMDAwMDAwMDAwMDAwN2ZmMCBSMTE6
IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwDQo+IChlYXJseSkgWyAg
ICAwLjQxNzU1MF0gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAw
MCBSMTU6IDAwMDAwMDAwMDAwMDAwMDANCj4gKGVhcmx5KSBbICAgIDAuNDE3NTU3XSBGUzog
IDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjg4ODAxM2UwMDAwMCgwMDAwKSBrbmxH
UzowMDAwMDAwMDAwMDAwMDAwDQo+IChlYXJseSkgWyAgICAwLjQxNzU2MF0gQ1M6ICAxMDAw
MGUwMzAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+IChlYXJs
eSkgWyAgICAwLjQxNzU2Ml0gQ1IyOiBmZmZmYzkwMDAwN2NmMDAwIENSMzogMDAwMDAwMDAw
MmMxMDAwMCBDUjQ6IDAwMDAwMDAwMDAwNDA2NjANCj4gKGVhcmx5KSBbICAgIDAuNDE3NTY3
XSBDYWxsIFRyYWNlOg0KPiAoZWFybHkpIFsgICAgMC40MTc1NzBdICA8VEFTSz4NCj4gKGVh
cmx5KSBbICAgIDAuNDE3NTczXSAgPyBfX3hlbl9zZXRfcHRlKzB4ZGMvMHgyMTANCj4gKGVh
cmx5KSBbICAgIDAuNDE3NTc4XSAgPyBrZmVuY2VfcHJvdGVjdF9wYWdlKzB4NjgvMHhkMA0K
PiAoZWFybHkpIFsgICAgMC40MTc1ODJdICA/IGtmZW5jZV9pbml0X3Bvb2wrMHgxMmQvMHgy
ODANCj4gKGVhcmx5KSBbICAgIDAuNDE3NTg2XSAgPyBrZmVuY2VfaW5pdF9wb29sX2Vhcmx5
KzB4NGMvMHgyODENCj4gKGVhcmx5KSBbICAgIDAuNDE3NTkxXSAgPyBrZmVuY2VfaW5pdCsw
eDNmLzB4YzQNCj4gKGVhcmx5KSBbICAgIDAuNDE3NTk0XSAgPyBzdGFydF9rZXJuZWwrMHg0
MGQvMHg2ZWYNCj4gKGVhcmx5KSBbICAgIDAuNDE3NTk5XSAgPyB4ZW5fc3RhcnRfa2VybmVs
KzB4NWM0LzB4NWU5DQo+IChlYXJseSkgWyAgICAwLjQxNzYwM10gID8gc3RhcnR1cF94ZW4r
MHgxZi8weDFmDQo+IChlYXJseSkgWyAgICAwLjQxNzYwN10gIDwvVEFTSz4NCj4gDQo+IEF1
dG9tYXRlZCBiaXNlY3QgaW4gcHJvZ3Jlc3MuDQo+IA0KDQpJIHRoaW5rIHRoaXMgaXMgYSBi
dWcgaW4gdGhlIGtmZW5jZSBjb2RlLiBKdXN0IHNldHRpbmcgYSBwdGUgdG8gaW52YWxpZA0K
d2l0aG91dCBjbGVhcmluZyB0aGUgcGZuIGlzIGdvaW5nIHRvIHJlc3VsdCBpbiBMMVRGIHZ1
bG5lcmFibGUgUFRFcy4NCg0KV2h5IHRoaXMgd291bGQgYmUgcmVsYXRlZCB0byBYZW4ncyBQ
QVQgc2V0dGluZ3MgSSBoYXZlIG5vIGlkZWEsIHRob3VnaC4NCg0KDQpKdWVyZ2VuDQo=
--------------X3dSAC7APBOv3GXR1kkDBTKG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------X3dSAC7APBOv3GXR1kkDBTKG--

--------------rd1O3qjcLL8LCR6OFu2CsVbT--

--------------FWVEI5EeosqtLSHPqEvtr6v0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOVeNcFAwAAAAAACgkQsN6d1ii/Ey85
Ugf+JTJVDRVEw809aDI/hy4cNF7KVardiEhzffeD5aLdenRt8b4oFMWeVAzD0n+0Skvniap6ZERD
rlfEQ6lLDwNxAQeiC3BcwGpUuMA5q15CfiioMaPo91rIsWYHKnJXary9QMXZ7a2f6dlGpKucCRZ7
wpGIJmyY8ebWmZVuOnnH1TGRwElfIMlOmFvLpUFn7kVByXT0aYSiDFNvUZ4fOfh9EYFYSvryxvYe
Vl1HgQy/55Zq0G6Z9qtybuTQzGVzZFoidr2MimDLbgJor/+kRVm1p0XgHSwmHW81HPS28lX/1L6w
+fgSRJatPTy0Ov9XpeWyLRu2VlGzVAZjYRhBw+xSSQ==
=7crL
-----END PGP SIGNATURE-----

--------------FWVEI5EeosqtLSHPqEvtr6v0--

