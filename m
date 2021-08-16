Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097133ECE11
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 07:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167114.305035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFV7p-0007TS-VV; Mon, 16 Aug 2021 05:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167114.305035; Mon, 16 Aug 2021 05:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFV7p-0007QW-SR; Mon, 16 Aug 2021 05:25:29 +0000
Received: by outflank-mailman (input) for mailman id 167114;
 Mon, 16 Aug 2021 05:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Usjg=NH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mFV7o-0007QQ-9Z
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 05:25:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cd77252-fe52-11eb-a440-12813bfff9fa;
 Mon, 16 Aug 2021 05:25:27 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F25D921E87;
 Mon, 16 Aug 2021 05:25:25 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9EB8D136A6;
 Mon, 16 Aug 2021 05:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id UlKcJMX2GWHMTAAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 16 Aug 2021 05:25:25 +0000
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
X-Inumbo-ID: 5cd77252-fe52-11eb-a440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629091526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vzu71VUIg1vRD5P7AR20Dhir23vGcrVJQz6gDZnXydQ=;
	b=jUjkXHpplHCp2uBXm0JucoxPi0NWQ8y8BzVRf1OlPf+UKbt4Uit9FChtOiCKbjhi3Xq/Ya
	+LSh6voPGOzewe/PqYQ2rBHTDmQGowwwbu8hB9Bb3k0KqgSPjS4pYJzC4r/fTKsl/IBRGQ
	1gPXSrO/bRhZgC14DP62OuCOQA+LK+M=
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
 <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
 <b9c64bcd-4192-0075-ddf5-711e84301063@suse.com>
 <94d629fd-27e2-f2be-ed26-c3e04e95c5b4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4a5d8b43-7ffa-cbcd-943c-3c459d56e55e@suse.com>
Date: Mon, 16 Aug 2021 07:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <94d629fd-27e2-f2be-ed26-c3e04e95c5b4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0YDAgvSxZoXES2DPafGWXKRmkt5woajup"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0YDAgvSxZoXES2DPafGWXKRmkt5woajup
Content-Type: multipart/mixed; boundary="rzMeFHTewOMb9kUZ2EUuDzcoIDVYioMoT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <4a5d8b43-7ffa-cbcd-943c-3c459d56e55e@suse.com>
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
 <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
 <b9c64bcd-4192-0075-ddf5-711e84301063@suse.com>
 <94d629fd-27e2-f2be-ed26-c3e04e95c5b4@suse.com>
In-Reply-To: <94d629fd-27e2-f2be-ed26-c3e04e95c5b4@suse.com>

--rzMeFHTewOMb9kUZ2EUuDzcoIDVYioMoT
Content-Type: multipart/mixed;
 boundary="------------0DF83859D78268D39CC7BA70"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0DF83859D78268D39CC7BA70
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.08.21 12:42, Jan Beulich wrote:
> On 30.07.2021 11:00, Juergen Gross wrote:
>> On 16.06.21 12:43, Juergen Gross wrote:
>>> On 16.06.21 11:56, Jan Beulich wrote:
>>>> On 16.06.2021 09:30, Juergen Gross wrote:
>>>>> --- a/arch/x86/xen/p2m.c
>>>>> +++ b/arch/x86/xen/p2m.c
>>>>> @@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
>>>>>  =C2=A0 EXPORT_SYMBOL_GPL(xen_p2m_addr);
>>>>>  =C2=A0 unsigned long xen_p2m_size __read_mostly;
>>>>>  =C2=A0 EXPORT_SYMBOL_GPL(xen_p2m_size);
>>>>> -unsigned long xen_max_p2m_pfn __read_mostly;
>>>>> -EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
>>>>> +unsigned long xen_p2m_max_size __read_mostly;
>>>>> +EXPORT_SYMBOL_GPL(xen_p2m_max_size);
>>>>
>>>> Instead of renaming the exported variable (which will break consumer=
s
>>>> anyway), how about dropping the apparently unneeded export at this
>>>> occasion?
>>>
>>> Why do you think it isn't needed? It is being referenced via the inli=
ne
>>> function __pfn_to_mfn() in arch/x86/include/asm/xen/page.h. And
>>> __pfn_to_mfn() is used via lots of other inline functions and macros.=

>>>
>>>> Further it looks to me as if xen_p2m_size and this variable
>>>> were actually always kept in sync, so I'd like to put up the questio=
n
>>>> of dropping one of the two.
>>>
>>> Hmm, should be possible, yes.
>>
>> Looking into this it seems this is not possible.
>>
>> xen_p2m_size always holds the number of p2m entries in the p2m table,
>> including invalid ones at the end. xen_p2m_pfn_limit however contains
>> the (rounded up) index after the last valid p2m entry.
>=20
> I'm afraid I can't follow:
>=20
> xen_build_dynamic_phys_to_machine() sets xen_p2m_size and then syncs
> its value to what so far has been xen_max_p2m_pfn.
>=20
> xen_vmalloc_p2m_tree() sets xen_max_p2m_pfn and then syncs its value
> to xen_p2m_size.
>=20
> I therefore can't see how the two values would hold different values,
> except for the brief periods between updating one and then the other.

The brief period in xen_vmalloc_p2m_tree() is the problematic one. The
different values are especially important for the calls of
__pfn_to_mfn() during xen_rebuild_p2m_list().


Juergen

--------------0DF83859D78268D39CC7BA70
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

--------------0DF83859D78268D39CC7BA70--

--rzMeFHTewOMb9kUZ2EUuDzcoIDVYioMoT--

--0YDAgvSxZoXES2DPafGWXKRmkt5woajup
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEZ9sQFAwAAAAAACgkQsN6d1ii/Ey9w
LAf/XPiKmcqLWZ4tf5OuXTWeJfyvPNH0d8TDXfb8n58gakD42EGqUloV+fZWYox4UBmOPkQTtGWG
TOwPdMvuLm4urjZKoZh/Fkwl2YIi259zRV7IrRbT++qh1NoLPgGaI6vjDcIs7r1pVQ2c8zxjDSLO
b7e32b3hHSdK++bJMQwsDYjT013mMxOOWFxQBA5oUSf4Hwv5x9iy3xdny4ioSXb3vTHlGgSUjQJD
/GvldPCYgUZtuLPTxRJIy2+1Y9YGeK2tsJXs/ggwJ4bseGYEkJLWg0sX8K2mn6eGX3LdJ0oOtD3c
Lv0FKzDPbiMZPyMytSsjCzZ3otBlK0kgt3xJ1fqdUQ==
=D0Cp
-----END PGP SIGNATURE-----

--0YDAgvSxZoXES2DPafGWXKRmkt5woajup--

