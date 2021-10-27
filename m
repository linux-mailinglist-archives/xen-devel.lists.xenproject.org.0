Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C941D43C3FE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 09:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216681.376383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfdST-0004qO-MQ; Wed, 27 Oct 2021 07:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216681.376383; Wed, 27 Oct 2021 07:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfdST-0004nt-Ik; Wed, 27 Oct 2021 07:34:49 +0000
Received: by outflank-mailman (input) for mailman id 216681;
 Wed, 27 Oct 2021 07:34:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AFjD=PP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfdSS-0004nn-Bq
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 07:34:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b85071e-36f8-11ec-8454-12813bfff9fa;
 Wed, 27 Oct 2021 07:34:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FE0C1FD40;
 Wed, 27 Oct 2021 07:34:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1621E13FE6;
 Wed, 27 Oct 2021 07:34:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DRIJBBUBeWFwdAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Oct 2021 07:34:45 +0000
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
X-Inumbo-ID: 5b85071e-36f8-11ec-8454-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635320085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SGsc+rKVQp8jWOqk3u1cUh9KZPpTGB48MIUoFQFk5vk=;
	b=fP5RUCRDLdpSipyVlycKwnhcjPb5Yn8T+rOLbh+ODw3Jounzo8/8YQm5MG7Y4dhPZ5gPoQ
	6Fnr1JxDczdNjAEAx72VADnCCI/wLW6fIKMc4b487FPSvB/pHFrfGMnjmQ2fNXk6uWoeOp
	dfwqQUx0284iRrdFudkMYffj6qhzh5Q=
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com,
 wl@xen.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
 <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
 <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
 <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
Date: Wed, 27 Oct 2021 09:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tkxxSisEHe8asd35vFCr4o0fdf4cwG2VA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tkxxSisEHe8asd35vFCr4o0fdf4cwG2VA
Content-Type: multipart/mixed; boundary="UWGaFghLhPaMNKLKLwItKwCoNmkXuYdNs";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com,
 wl@xen.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
 <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
 <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
 <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>

--UWGaFghLhPaMNKLKLwItKwCoNmkXuYdNs
Content-Type: multipart/mixed;
 boundary="------------CB8D8CE8FB3D64D88EE57881"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CB8D8CE8FB3D64D88EE57881
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.10.21 02:54, Stefano Stabellini wrote:
> On Mon, 25 Oct 2021, Juergen Gross wrote:
>> On 22.10.21 21:41, Stefano Stabellini wrote:
>>> +Juergen
>>>
>>> On Fri, 22 Oct 2021, Andrew Cooper wrote:
>>>> On 22/10/2021 00:08, Stefano Stabellini wrote:
>>>>> +# build depends
>>>>> +RUN apt-get update && \
>>>>> +    apt-get --quiet --yes install \
>>>>> +        build-essential \
>>>>> +        libssl-dev \
>>>>> +        bc \
>>>>> +        curl \
>>>>> +        flex \
>>>>> +        bison \
>>>>> +        libelf-dev \
>>>>> +        && \
>>>>> +    \
>>>>> +    # Build the kernel
>>>>> +    curl -fsSLO
>>>>> https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION"=
=2Etar.xz
>>>>> && \
>>>>> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
>>>>> +    cd linux-"$LINUX_VERSION" && \
>>>>> +    make defconfig && \
>>>>> +    make xen.config && \
>>>>> +    cp .config .config.orig && \
>>>>> +    cat .config.orig | grep XEN | grep =3Dm |sed 's/=3Dm/=3Dy/g' >=
> .config
>>>>> && \
>>>>> +    make -j$(nproc) bzImage && \
>>>>
>>>> defconfig is huuuuge.=C2=A0 Can we use tinyconfig instead?
>>>>
>>>> Also, you want to turn off CONFIG_MODULES seeing as you only copy
>>>> bzImage to the test.
>>>>
>>>> This also fixes the fact that `grep XEN` also matches CONFIG_NETXEN_=
NIC
>>>> which has nothing to do with Xen.
>>>
>>> Tinyconfig would be a good idea but it crashes on QEMU with the appen=
ded
>>> boot log. I did:
>>>
>>> # make tinyconfig
>>> # make xen.config
>>> # make bzImage
>>>
>>> Of course we could have our own tailored special kernel config for th=
is
>>> kernel but I like the simplicify of "make tinyconfig" or "make
>>> defconfig" followed by "make xen.config".
>>>
>>> Unless you know one kconfig option or two that we need to add to
>>> tinyconfig to make it work my preference is to go with defconfig for
>>> now.
>>
>> You will need to add the dom0 and SMP related config options at least.=

>>
>> I'll have a look at config.xen, which is a little bit weird: it
>> configures the backends, but not dom0.
>=20
> Thanks, it would be good if make tinyconfig && make xen.config would
> just work on QEMU. In the meantime I'll keep defconfig for this test, w=
e
> can always improve later.

Can you please test the attached patch?


Juergen

--------------CB8D8CE8FB3D64D88EE57881
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-x86-xen-update-xen.config.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-x86-xen-update-xen.config.patch"

=46rom 8ffe2d58a3507dfd42996a38f0de66c1e7ca2c6a Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Wed, 27 Oct 2021 09:05:28 +0200
Subject: [PATCH] x86/xen: update xen.config

Update some entries in xen.config:

- add ACPI as being required for running as dom0
- add SMP for convenience
- remove HIGHMEM64G as this option no longer exists
- remove XEN_MAX_DOMAIN_MEMORY as this option no longer exists

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/configs/xen.config | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index d9fc7139fd46..e59fdb0f6b67 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -1,6 +1,4 @@
 # global x86 required specific stuff
-# On 32-bit HIGHMEM4G is not allowed
-CONFIG_HIGHMEM64G=3Dy
 CONFIG_64BIT=3Dy
=20
 # These enable us to allow some of the
@@ -9,12 +7,13 @@ CONFIG_HYPERVISOR_GUEST=3Dy
 CONFIG_PCI=3Dy
 CONFIG_PCI_MSI=3Dy
 CONFIG_X86_MCE=3Dy
+CONFIG_ACPI=3Dy
 CONFIG_ACPI_PROCESSOR=3Dy
 CONFIG_CPU_FREQ=3Dy
+CONFIG_SMP=3Dy
=20
 # x86 xen specific config options
 CONFIG_XEN_PVH=3Dy
-CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500
 CONFIG_XEN_SAVE_RESTORE=3Dy
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_MCE_LOG=3Dy
--=20
2.26.2


--------------CB8D8CE8FB3D64D88EE57881
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

--------------CB8D8CE8FB3D64D88EE57881--

--UWGaFghLhPaMNKLKLwItKwCoNmkXuYdNs--

--tkxxSisEHe8asd35vFCr4o0fdf4cwG2VA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmF5ARQFAwAAAAAACgkQsN6d1ii/Ey/c
vQgAhyZfg14tPMUJk4abuM+ZGOY3DP2urCyEOP4fWRI//iaWUSg5Uh6OPTBTgqv8VUJOHK1sc5SI
vTcDncRUNTeesyea/T+b+QfpqZhqOwZ/fbJo/Xggxfb8SKWsg9FWRubAsBXgglRlzEh/PV8TRm2U
EnzLhkFOJI2dG/k3HM44oJGsg0ceN3oxumALmTVRFOr+crIVLVVyE6pMSSmtmxaJf30yfkjgaVRz
OTOvEoE6mMcNBOwr8Ers4TYtd/HN83AElLtrsDBncg8pJ5jH+7m6V5u3w8WBK9ac5doLlSJNWtEn
8I3h0CO3YWAN/jbeKjlQn5/6z9uXAvY6rM/xNlb3mQ==
=6BSE
-----END PGP SIGNATURE-----

--tkxxSisEHe8asd35vFCr4o0fdf4cwG2VA--

