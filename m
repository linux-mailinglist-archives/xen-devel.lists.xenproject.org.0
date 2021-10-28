Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D528A43DB9E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 09:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217673.377798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzOb-0001xC-Pw; Thu, 28 Oct 2021 07:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217673.377798; Thu, 28 Oct 2021 07:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzOb-0001uU-Ld; Thu, 28 Oct 2021 07:00:17 +0000
Received: by outflank-mailman (input) for mailman id 217673;
 Thu, 28 Oct 2021 07:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfzOZ-0001u5-Nu
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 07:00:15 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a59fe0c8-4ab9-4b3c-9d3b-f8eaf4778075;
 Thu, 28 Oct 2021 07:00:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F31E1FD4B;
 Thu, 28 Oct 2021 07:00:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C0AA13EC9;
 Thu, 28 Oct 2021 07:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6mfJAX1KemHjDwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 07:00:13 +0000
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
X-Inumbo-ID: a59fe0c8-4ab9-4b3c-9d3b-f8eaf4778075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635404413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hR5TGXRQVQkw6zIe3acsy/m0ARZTYmLwVeDdkmr0o8=;
	b=lZtQH9UdJczVGiwq03JhFSRRql36X1yvCa5IvgG6miCjSi8bU5ryad7X4Z4fSeZUNPoIWw
	RrmpLUCAWZ+6rok5+bY1b3ZBh6wNVPpC8kXsbM7YaitryweAu1v2w2t4Kj1ICE6oEe4SYd
	CaML0Yhd63mU4lwbKznP8PZiFoQUy5c=
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
 <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
 <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
Message-ID: <4f82901a-2e74-f4ee-311e-b8187d856745@suse.com>
Date: Thu, 28 Oct 2021 09:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8tTS3EAeEY8aqWI31agR6YRyIzlHM6igP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8tTS3EAeEY8aqWI31agR6YRyIzlHM6igP
Content-Type: multipart/mixed; boundary="4xVbZeMI34GdqL0pKQ94tjWax7zfzoINd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com,
 wl@xen.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <4f82901a-2e74-f4ee-311e-b8187d856745@suse.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
 <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
 <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
 <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
 <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
 <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>

--4xVbZeMI34GdqL0pKQ94tjWax7zfzoINd
Content-Type: multipart/mixed;
 boundary="------------FB101BD822545065E5676DF2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FB101BD822545065E5676DF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.10.21 01:24, Stefano Stabellini wrote:
> On Wed, 27 Oct 2021, Stefano Stabellini wrote:
>> On Wed, 27 Oct 2021, Juergen Gross wrote:
>>> On 26.10.21 02:54, Stefano Stabellini wrote:
>>>> On Mon, 25 Oct 2021, Juergen Gross wrote:
>>>>> On 22.10.21 21:41, Stefano Stabellini wrote:
>>>>>> +Juergen
>>>>>>
>>>>>> On Fri, 22 Oct 2021, Andrew Cooper wrote:
>>>>>>> On 22/10/2021 00:08, Stefano Stabellini wrote:
>>>>>>>> +# build depends
>>>>>>>> +RUN apt-get update && \
>>>>>>>> +    apt-get --quiet --yes install \
>>>>>>>> +        build-essential \
>>>>>>>> +        libssl-dev \
>>>>>>>> +        bc \
>>>>>>>> +        curl \
>>>>>>>> +        flex \
>>>>>>>> +        bison \
>>>>>>>> +        libelf-dev \
>>>>>>>> +        && \
>>>>>>>> +    \
>>>>>>>> +    # Build the kernel
>>>>>>>> +    curl -fsSLO
>>>>>>>> https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSI=
ON".tar.xz
>>>>>>>> && \
>>>>>>>> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
>>>>>>>> +    cd linux-"$LINUX_VERSION" && \
>>>>>>>> +    make defconfig && \
>>>>>>>> +    make xen.config && \
>>>>>>>> +    cp .config .config.orig && \
>>>>>>>> +    cat .config.orig | grep XEN | grep =3Dm |sed 's/=3Dm/=3Dy/g=
' >>
>>>>>>>> .config
>>>>>>>> && \
>>>>>>>> +    make -j$(nproc) bzImage && \
>>>>>>>
>>>>>>> defconfig is huuuuge.=C2=A0 Can we use tinyconfig instead?
>>>>>>>
>>>>>>> Also, you want to turn off CONFIG_MODULES seeing as you only copy=

>>>>>>> bzImage to the test.
>>>>>>>
>>>>>>> This also fixes the fact that `grep XEN` also matches
>>>>>>> CONFIG_NETXEN_NIC
>>>>>>> which has nothing to do with Xen.
>>>>>>
>>>>>> Tinyconfig would be a good idea but it crashes on QEMU with the ap=
pended
>>>>>> boot log. I did:
>>>>>>
>>>>>> # make tinyconfig
>>>>>> # make xen.config
>>>>>> # make bzImage
>>>>>>
>>>>>> Of course we could have our own tailored special kernel config for=
 this
>>>>>> kernel but I like the simplicify of "make tinyconfig" or "make
>>>>>> defconfig" followed by "make xen.config".
>>>>>>
>>>>>> Unless you know one kconfig option or two that we need to add to
>>>>>> tinyconfig to make it work my preference is to go with defconfig f=
or
>>>>>> now.
>>>>>
>>>>> You will need to add the dom0 and SMP related config options at lea=
st.
>>>>>
>>>>> I'll have a look at config.xen, which is a little bit weird: it
>>>>> configures the backends, but not dom0.
>>>>
>>>> Thanks, it would be good if make tinyconfig && make xen.config would=

>>>> just work on QEMU. In the meantime I'll keep defconfig for this test=
, we
>>>> can always improve later.
>>>
>>> Can you please test the attached patch?
>>
>> Yes, that works, thanks!
>=20
> Sorry, I spoke too soon: same error as before:
>=20
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1722909607=
/raw
>=20
> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>=20
> No output from the kernel.

This is not very surprising, as tinyconfig doesn't have CONFIG_PRINTK.
BTW, it doesn't have initrd support either (BLK_DEV_RAM and
BLK_DEV_INITRD), so I added those to xen.config as well.

With the (updated) attached patch the kernel boots fine as dom0 until
rootfs is tried to be mounted on a physical machine.

I've added CONFIG_BUG, too, in order to have more debugging output if
needed.


Juergen

--------------FB101BD822545065E5676DF2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-x86-xen-update-xen.config.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-x86-xen-update-xen.config.patch"

=46rom cb08391f332c850ba569b9232c8225ebe0e0758c Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Wed, 27 Oct 2021 09:05:28 +0200
Subject: [PATCH] x86/xen: update xen.config

Update some entries in xen.config:

- add ACPI as being required for running as dom0
- add SMP for convenience
- add PRINTK and BUG for diagnosis support
- add BLK_DEV_INITRD and BLK_DEV_RAM for initrd support
- remove HIGHMEM64G as this option no longer exists
- remove XEN_MAX_DOMAIN_MEMORY as this option no longer exists

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/configs/xen.config | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index d9fc7139fd46..8db14cadf5b0 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -1,6 +1,4 @@
 # global x86 required specific stuff
-# On 32-bit HIGHMEM4G is not allowed
-CONFIG_HIGHMEM64G=3Dy
 CONFIG_64BIT=3Dy
=20
 # These enable us to allow some of the
@@ -9,12 +7,17 @@ CONFIG_HYPERVISOR_GUEST=3Dy
 CONFIG_PCI=3Dy
 CONFIG_PCI_MSI=3Dy
 CONFIG_X86_MCE=3Dy
+CONFIG_ACPI=3Dy
 CONFIG_ACPI_PROCESSOR=3Dy
 CONFIG_CPU_FREQ=3Dy
+CONFIG_SMP=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_BLK_DEV_RAM=3Dy
+CONFIG_BLK_DEV_INITRD=3Dy
=20
 # x86 xen specific config options
 CONFIG_XEN_PVH=3Dy
-CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500
 CONFIG_XEN_SAVE_RESTORE=3Dy
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_MCE_LOG=3Dy
--=20
2.26.2


--------------FB101BD822545065E5676DF2
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

--------------FB101BD822545065E5676DF2--

--4xVbZeMI34GdqL0pKQ94tjWax7zfzoINd--

--8tTS3EAeEY8aqWI31agR6YRyIzlHM6igP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmF6SnwFAwAAAAAACgkQsN6d1ii/Ey9l
fAf/dYu4D2wYqOE1Ou/zYyLj8KWnoJjXMYyOavVniqSMSjBgNJJGaoV/lzBfL5oH409YbGO1Qjgx
+2nB6WRv1jMWOdW41GDgu3zxs+O9+fAULdKi4k7k4XZyw9Ilcutj+65rkerijgiHnDL3E9udhcKF
Y7XQ8aJ/Dme3JRYrkKwh1lpvts2t1BALxCVlPkgvquJOVP4Rw/aFRKCKPyyR1ENU6fw4iRmGWNjO
Tn5Ir6dNU46BHDnuBT4SzC4Q9j6lhkGU3kPisU0KBDPmPhR+kWThTaU4ftlGUbOJ35zowfHsNUPh
67fpuJkFk9sZ6wUTbXz/fVm3MWLIYwuDNic/xC5IMA==
=mjKT
-----END PGP SIGNATURE-----

--8tTS3EAeEY8aqWI31agR6YRyIzlHM6igP--

