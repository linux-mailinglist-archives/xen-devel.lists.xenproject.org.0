Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554A4412FC6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191487.341540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSabV-0005yv-Qq; Tue, 21 Sep 2021 07:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191487.341540; Tue, 21 Sep 2021 07:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSabV-0005vj-Ma; Tue, 21 Sep 2021 07:54:13 +0000
Received: by outflank-mailman (input) for mailman id 191487;
 Tue, 21 Sep 2021 07:54:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x95K=OL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSabT-0005mk-JX
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:54:11 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ada695f-5030-4d1e-bd14-c60ca4cd26be;
 Tue, 21 Sep 2021 07:54:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B0AB1FD47;
 Tue, 21 Sep 2021 07:54:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3908813B0A;
 Tue, 21 Sep 2021 07:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5TM7DKGPSWExEwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Sep 2021 07:54:09 +0000
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
X-Inumbo-ID: 7ada695f-5030-4d1e-bd14-c60ca4cd26be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632210849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2DFODHzNbeP+tC+5YNGkcdF5SILtU2iZsU6zWx71r4=;
	b=Xdfw/hTxUv8Ap/lOfYmrUzi2KB5jrWsYI068h25d4g3ok+WKpEJR/QjU87t4HUKnRHojnt
	6ATv7INfI4AC56HzfXgqcinaAWJUdcm3VmQHW8qhuzea7boUyCQsoL69GWo9WbosAtintA
	HXhTMjIk5HqfYyJv0EsiOMMtEWPAK2I=
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 jbeulich@suse.com, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <809c7a0c-cc8b-ce6f-bab4-97029e538053@suse.com>
Date: Tue, 21 Sep 2021 09:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210917130123.1764493-1-andr2000@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zjbIflcdM0RFlPchq1VJSgX1W9fScMSxn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zjbIflcdM0RFlPchq1VJSgX1W9fScMSxn
Content-Type: multipart/mixed; boundary="fHkvMZ5xDuOMmMrlB09mkGBha2r34g40x";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 jbeulich@suse.com, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Message-ID: <809c7a0c-cc8b-ce6f-bab4-97029e538053@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
References: <20210917130123.1764493-1-andr2000@gmail.com>
In-Reply-To: <20210917130123.1764493-1-andr2000@gmail.com>

--fHkvMZ5xDuOMmMrlB09mkGBha2r34g40x
Content-Type: multipart/mixed;
 boundary="------------0253082D65A4A2883D8F7851"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0253082D65A4A2883D8F7851
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.09.21 15:01, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
> Re-structure the driver in a way that it can be built for other
> platforms as well.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
>=20
> ---
> Tested on Arm and x86.
> ---
>   arch/x86/include/asm/xen/pci.h     | 24 ----------
>   arch/x86/pci/xen.c                 | 74 +----------------------------=

>   drivers/xen/Kconfig                |  2 +-
>   drivers/xen/events/events_base.c   |  1 +
>   drivers/xen/pci.c                  | 75 +++++++++++++++++++++++++++++=
+
>   drivers/xen/xen-pciback/pci_stub.c |  3 +-
>   drivers/xen/xen-pciback/xenbus.c   |  2 +-
>   include/xen/pci.h                  | 34 ++++++++++++++
>   8 files changed, 115 insertions(+), 100 deletions(-)
>   create mode 100644 include/xen/pci.h
>=20
> diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/=
pci.h
> index 3506d8c598c1..9ff7b49bca08 100644
> --- a/arch/x86/include/asm/xen/pci.h
> +++ b/arch/x86/include/asm/xen/pci.h
> @@ -14,30 +14,6 @@ static inline int pci_xen_hvm_init(void)
>   	return -1;
>   }
>   #endif
> -#if defined(CONFIG_XEN_DOM0)
> -int __init pci_xen_initial_domain(void);

Why are you removing this prototype? It is X86 specific.

> -int xen_find_device_domain_owner(struct pci_dev *dev);
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t dom=
ain);
> -int xen_unregister_device_domain_owner(struct pci_dev *dev);
> -#else
> -static inline int __init pci_xen_initial_domain(void)
> -{
> -	return -1;
> -}
> -static inline int xen_find_device_domain_owner(struct pci_dev *dev)
> -{
> -	return -1;
> -}
> -static inline int xen_register_device_domain_owner(struct pci_dev *dev=
,
> -						   uint16_t domain)
> -{
> -	return -1;
> -}
> -static inline int xen_unregister_device_domain_owner(struct pci_dev *d=
ev)
> -{
> -	return -1;
> -}
> -#endif
>  =20
>   #if defined(CONFIG_PCI_MSI)
>   #if defined(CONFIG_PCI_XEN)
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 3d41a09c2c14..4a45b0bf9ae4 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -23,6 +23,7 @@
>  =20
>   #include <xen/features.h>
>   #include <xen/events.h>
> +#include <xen/pci.h>
>   #include <asm/xen/pci.h>
>   #include <asm/xen/cpuid.h>
>   #include <asm/apic.h>
> @@ -583,77 +584,4 @@ int __init pci_xen_initial_domain(void)
>   	}
>   	return 0;
>   }
> -
> -struct xen_device_domain_owner {
> -	domid_t domain;
> -	struct pci_dev *dev;
> -	struct list_head list;
> -};
> -
> -static DEFINE_SPINLOCK(dev_domain_list_spinlock);
> -static struct list_head dev_domain_list =3D LIST_HEAD_INIT(dev_domain_=
list);
> -
> -static struct xen_device_domain_owner *find_device(struct pci_dev *dev=
)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	list_for_each_entry(owner, &dev_domain_list, list) {
> -		if (owner->dev =3D=3D dev)
> -			return owner;
> -	}
> -	return NULL;
> -}
> -
> -int xen_find_device_domain_owner(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -	int domain =3D -ENODEV;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	owner =3D find_device(dev);
> -	if (owner)
> -		domain =3D owner->domain;
> -	spin_unlock(&dev_domain_list_spinlock);
> -	return domain;
> -}
> -EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
> -
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t dom=
ain)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	owner =3D kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL)=
;
> -	if (!owner)
> -		return -ENODEV;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	if (find_device(dev)) {
> -		spin_unlock(&dev_domain_list_spinlock);
> -		kfree(owner);
> -		return -EEXIST;
> -	}
> -	owner->domain =3D domain;
> -	owner->dev =3D dev;
> -	list_add_tail(&owner->list, &dev_domain_list);
> -	spin_unlock(&dev_domain_list_spinlock);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
> -
> -int xen_unregister_device_domain_owner(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	owner =3D find_device(dev);
> -	if (!owner) {
> -		spin_unlock(&dev_domain_list_spinlock);
> -		return -ENODEV;
> -	}
> -	list_del(&owner->list);
> -	spin_unlock(&dev_domain_list_spinlock);
> -	kfree(owner);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
>   #endif
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a37eb52fb401..057ddf61ef61 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -182,7 +182,7 @@ config SWIOTLB_XEN
>  =20
>   config XEN_PCIDEV_BACKEND
>   	tristate "Xen PCI-device backend driver"
> -	depends on PCI && X86 && XEN
> +	depends on PCI && XEN
>   	depends on XEN_BACKEND
>   	default m
>   	help
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/even=
ts_base.c
> index a78704ae3618..35493ff0d146 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -65,6 +65,7 @@
>   #include <xen/interface/vcpu.h>
>   #include <xen/xenbus.h>
>   #include <asm/hw_irq.h>
> +#include <xen/pci.h>

This wouldn't be needed if you'd let the pci_xen_initial_domain()
prototype where it has been.


Juergen

--------------0253082D65A4A2883D8F7851
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

--------------0253082D65A4A2883D8F7851--

--fHkvMZ5xDuOMmMrlB09mkGBha2r34g40x--

--zjbIflcdM0RFlPchq1VJSgX1W9fScMSxn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFJj6AFAwAAAAAACgkQsN6d1ii/Ey9U
twf/XcEg1ogU6Ouk0Wp+4q8pEx51ZrldNzcRmrZwvbzcAy0Z3v6sx/6356qdllrkt3CUHUNUeJxi
At76G2koVtDJB331Ej3XUm5+CHkAt3ZJcnJqQJlwAXBFS4s+vwCqeVSxLCQdJgWfLqFHvhgufEgN
JdwBzATJ5ezSLErvhNytkmuf8yBKZepiCuzoZ8doMekEW/l/gOzqiaq8zD/QIULm+c3g90h1CWvA
+wiRKPUOMhSDaLejhDhI4vrCl9P+NUNMeZCC8wtWKGq2LBVxjLvV2KLNHPvxU0tT7siXZGc0iESc
ipt0EyT2aauxZ7k/l8YNmodJsybb919WKVZh4Vnl2A==
=qGyM
-----END PGP SIGNATURE-----

--zjbIflcdM0RFlPchq1VJSgX1W9fScMSxn--

