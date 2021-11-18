Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0F4556A2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227170.392816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncY1-0007tY-QK; Thu, 18 Nov 2021 08:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227170.392816; Thu, 18 Nov 2021 08:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncY1-0007rA-NH; Thu, 18 Nov 2021 08:13:33 +0000
Received: by outflank-mailman (input) for mailman id 227170;
 Thu, 18 Nov 2021 08:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l94Z=QF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mncXz-0007r4-G7
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:13:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a144fb0-4847-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 09:13:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19FCE217BA;
 Thu, 18 Nov 2021 08:13:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C811C13CBE;
 Thu, 18 Nov 2021 08:13:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pOwLLykLlmHfUAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 18 Nov 2021 08:13:29 +0000
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
X-Inumbo-ID: 6a144fb0-4847-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637223210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rydNytA6MHRQbMCt1EMxirsJHx5fRBgzi3NjEbmAKIU=;
	b=krkkvSvdcqBQaIiurW4vWzuh2XNu5mwmPFIhDMdW+QD1Voa3JFALQSOZEinI8NLU9/wX3w
	CUcW3yr7gWRZn19TP5MJF6QCBg8jzDlh29yzGr2SpG1KH6FSVYZMj1R52N6r3lj6gJ3L3A
	wdZnsaURGDT26X7pmu50GV5C4pIEJP4=
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
References: <20211028061341.1479333-1-andr2000@gmail.com>
 <CAMuHMdXEGtr5Js4QwyGBMLP_LzG8mk0Ovv9PiOpnU2-VVp+7dg@mail.gmail.com>
 <ab6a44b3-6b56-191a-a653-ce5ace50975d@epam.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Message-ID: <da612bdd-4fb7-2361-d167-cc1a829d62a1@suse.com>
Date: Thu, 18 Nov 2021 09:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ab6a44b3-6b56-191a-a653-ce5ace50975d@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kjDlSqsddPsApzzGQz1djnRLXh7gvIi7q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kjDlSqsddPsApzzGQz1djnRLXh7gvIi7q
Content-Type: multipart/mixed; boundary="XfZMtVDaabDHq5xYIBiojcvIwNQpfGnBH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Message-ID: <da612bdd-4fb7-2361-d167-cc1a829d62a1@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
References: <20211028061341.1479333-1-andr2000@gmail.com>
 <CAMuHMdXEGtr5Js4QwyGBMLP_LzG8mk0Ovv9PiOpnU2-VVp+7dg@mail.gmail.com>
 <ab6a44b3-6b56-191a-a653-ce5ace50975d@epam.com>
In-Reply-To: <ab6a44b3-6b56-191a-a653-ce5ace50975d@epam.com>

--XfZMtVDaabDHq5xYIBiojcvIwNQpfGnBH
Content-Type: multipart/mixed;
 boundary="------------80A444647212451F77DC65D1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------80A444647212451F77DC65D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.11.21 11:45, Oleksandr Andrushchenko wrote:
> Hi, Geert!
>=20
> On 16.11.21 11:36, Geert Uytterhoeven wrote:
>> Hi Oleksandr,
>>
>> On Thu, Oct 28, 2021 at 8:15 AM Oleksandr Andrushchenko
>> <andr2000@gmail.com> wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Xen-pciback driver was designed to be built for x86 only. But it
>>> can also be used by other architectures, e.g. Arm.
>>>
>>> Currently PCI backend implements multiple functionalities at a time,
>>> such as:
>>> 1. It is used as a database for assignable PCI devices, e.g. xl
>>>      pci-assignable-{add|remove|list} manipulates that list. So, when=
ever
>>>      the toolstack needs to know which PCI devices can be passed thro=
ugh
>>>      it reads that from the relevant sysfs entries of the pciback.
>>> 2. It is used to hold the unbound PCI devices list, e.g. when passing=

>>>      through a PCI device it needs to be unbound from the relevant de=
vice
>>>      driver and bound to pciback (strictly speaking it is not require=
d
>>>      that the device is bound to pciback, but pciback is again used a=
s a
>>>      database of the passed through PCI devices, so we can re-bind th=
e
>>>      devices back to their original drivers when guest domain shuts d=
own)
>>> 3. Device reset for the devices being passed through
>>> 4. Para-virtualised use-cases support
>>>
>>> The para-virtualised part of the driver is not always needed as some
>>> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-fronte=
nd
>>> model for PCI device passthrough.
>>>
>>> For such use-cases make the very first step in splitting the
>>> xen-pciback driver into two parts: Xen PCI stub and PCI PV backend
>>> drivers.
>>>
>>> For that add new configuration options CONFIG_XEN_PCI_STUB and
>>> CONFIG_XEN_PCIDEV_STUB, so the driver can be limited in its
>>> functionality, e.g. no support for para-virtualised scenario.
>>> x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND for the
>>> fully featured backend driver.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.=
com>
>>> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>=

>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> Thanks for your patch, which is now commit a67efff28832a597
>> ("xen-pciback: allow compiling on other archs than x86")
>> in v5.16-rc1.
>>
>>> --- a/drivers/xen/Kconfig
>>> +++ b/drivers/xen/Kconfig
>>> @@ -181,10 +181,34 @@ config SWIOTLB_XEN
>>>           select DMA_OPS
>>>           select SWIOTLB
>>>
>>> +config XEN_PCI_STUB
>>> +       bool
>>> +
>>> +config XEN_PCIDEV_STUB
>>> +       tristate "Xen PCI-device stub driver"
>>> +       depends on PCI && !X86 && XEN
>>> +       depends on XEN_BACKEND
>>> +       select XEN_PCI_STUB
>>> +       default m
>> Please note that this means "default y" if CONFIG_MODULES=3Dn.
>> Perhaps this should be "default m if MODULES" instead?
> I don't really have strong opinion on this and will let Xen maintainers=

> speak: @Boris, @Juergen what's your preference here?

TBH, I don't have any.

All other backends have no "default" line, so maybe the cleanest
solution would be to remove the "default" lines for XEN_PCIDEV_STUB
and XEN_PCIDEV_BACKEND, too?

>>
>>> +       help
>>> +         The PCI device stub driver provides limited version of the =
PCI
>>> +         device backend driver without para-virtualized support for =
guests.
>>> +         If you select this to be a module, you will need to make su=
re no
>>> +         other driver has bound to the device(s) you want to make vi=
sible to
>>> +         other guests.
>>> +
>>> +         The "hide" parameter (only applicable if backend driver is =
compiled
>>> +         into the kernel) allows you to bind the PCI devices to this=
 module
>>> +         from the default device drivers. The argument is the list o=
f PCI BDFs:
>>> +         xen-pciback.hide=3D(03:00.0)(04:00.0)
>>> +
>>> +         If in doubt, say m.
>>> +
>>>    config XEN_PCIDEV_BACKEND
>>>           tristate "Xen PCI-device backend driver"
>>>           depends on PCI && X86 && XEN
>>>           depends on XEN_BACKEND
>>> +       select XEN_PCI_STUB
>>>           default m
>>>           help
>>>             The PCI device backend driver allows the kernel to export=
 arbitrary


Juergen

--------------80A444647212451F77DC65D1
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

--------------80A444647212451F77DC65D1--

--XfZMtVDaabDHq5xYIBiojcvIwNQpfGnBH--

--kjDlSqsddPsApzzGQz1djnRLXh7gvIi7q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGWCykFAwAAAAAACgkQsN6d1ii/Ey/Q
Cwf+Jhc/1Jm9LFxI79T5Jq+bvkmctPEYk9ihYb+/AzNfCCfmi3pv+MLdtfC+o4SwqgMnV4OLJRkz
erlNSepcFQ0wywncJ5smsDPCbhRO87t8vSXNOS8yUz27YnEszkn8YrahUzuTxP9mBTTmmu6ggx9k
/4luFLQVkBrTI/AcSMYzCxYmVOW+ClqnWut4rtcFtyvOMs0a1Rh+z7LpRazWhR8Uii4qBI0vsobM
vck/r7LwAQb+oF/1srQl/v9yx9h4OaRUFA7Z9QQNAq05Eo4AxOvBw0RKWapn+g4e0UehnKTrA9Dv
FPJOkRSLbyMhw2OrBRk09r4AFChl+BDGg8aCspIcuQ==
=zSZW
-----END PGP SIGNATURE-----

--kjDlSqsddPsApzzGQz1djnRLXh7gvIi7q--

