Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF73FB098
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 06:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174850.318722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKZKT-0006sx-ON; Mon, 30 Aug 2021 04:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174850.318722; Mon, 30 Aug 2021 04:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKZKT-0006r8-LM; Mon, 30 Aug 2021 04:55:29 +0000
Received: by outflank-mailman (input) for mailman id 174850;
 Mon, 30 Aug 2021 04:55:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFp4=NV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mKZKR-0006r2-W1
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 04:55:28 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f49a7d9d-2a03-4352-ac9d-6935d7297b7c;
 Mon, 30 Aug 2021 04:55:26 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25CED20060;
 Mon, 30 Aug 2021 04:55:25 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id BF6D31365E;
 Mon, 30 Aug 2021 04:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RfeQLLxkLGEDegAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 30 Aug 2021 04:55:24 +0000
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
X-Inumbo-ID: f49a7d9d-2a03-4352-ac9d-6935d7297b7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630299325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc6v1qvmceLEeAERPrQ8/V0IZDTxjfiq/geyYnfx82k=;
	b=usBIe/c+my7o4ECqzWCTF3OKUluhQba28fcIuLsWwm+IOvoZ2Jnx2uEOvpzdf5FPyEzfWg
	AOVGnUxB4A6uaOBh7ryfu1spVPKfDHMFYLPHBo42vqaUfsGjcBLqOrC+CfAVGGdgGNBp0q
	qEneonCC2AJRWojKHE+KkWA2lDfcHQ8=
Subject: Re: [PATCH] xen/pcifront: Removed unnecessary __ref annotation
To: =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?= <lonyelon@gmail.com>,
 konrad.wilk@oracle.com
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, bhelgaas@google.com,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?=
 <sergio@lony.xyz>
References: <20210829221415.647744-1-sergio@lony.xyz>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2df006a3-d232-c356-3402-888739835967@suse.com>
Date: Mon, 30 Aug 2021 06:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210829221415.647744-1-sergio@lony.xyz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3OUz0Wy9HJufji2HpIjnsImkaZC9e888d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3OUz0Wy9HJufji2HpIjnsImkaZC9e888d
Content-Type: multipart/mixed; boundary="TRUuJTafEqklpTUbifwhTten2MeLBi8j8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?= <lonyelon@gmail.com>,
 konrad.wilk@oracle.com
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, bhelgaas@google.com,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Sergio_Migu=c3=a9ns_Iglesias?=
 <sergio@lony.xyz>
Message-ID: <2df006a3-d232-c356-3402-888739835967@suse.com>
Subject: Re: [PATCH] xen/pcifront: Removed unnecessary __ref annotation
References: <20210829221415.647744-1-sergio@lony.xyz>
In-Reply-To: <20210829221415.647744-1-sergio@lony.xyz>

--TRUuJTafEqklpTUbifwhTten2MeLBi8j8
Content-Type: multipart/mixed;
 boundary="------------08AB25C0E8EF0DD9B25A51A8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------08AB25C0E8EF0DD9B25A51A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.08.21 00:14, Sergio Migu=C3=A9ns Iglesias wrote:
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
> ---
>   drivers/pci/xen-pcifront.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index b7a8f3a1921f..f06661704f3a 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -115,7 +115,7 @@ static int do_pci_op(struct pcifront_device *pdev, =
struct xen_pci_op *op)
>   	struct xen_pci_op *active_op =3D &pdev->sh_info->op;
>   	unsigned long irq_flags;
>   	evtchn_port_t port =3D pdev->evtchn;
> -	unsigned irq =3D pdev->irq;
> +	unsigned int irq =3D pdev->irq;
>   	s64 ns, ns_timeout;
>  =20
>   	spin_lock_irqsave(&pdev->sh_info_lock, irq_flags);
> @@ -152,11 +152,10 @@ static int do_pci_op(struct pcifront_device *pdev=
, struct xen_pci_op *op)
>   		}
>   	}
>  =20
> -	/*
> -	* We might lose backend service request since we
> -	* reuse same evtchn with pci_conf backend response. So re-schedule
> -	* aer pcifront service.
> -	*/
> +	/* We might lose backend service request since we

This is no net or drivers/net file, so please keep the initial "/*"
line and fixup the other multi-line comments accordingly.

> +	 * reuse same evtchn with pci_conf backend response. So re-schedule
> +	 * aer pcifront service.
> +	 */
>   	if (test_bit(_XEN_PCIB_active,
>   			(unsigned long *)&pdev->sh_info->flags)) {
>   		dev_err(&pdev->xdev->dev,
> @@ -493,7 +492,8 @@ static int pcifront_scan_root(struct pcifront_devic=
e *pdev,
>   	list_add(&bus_entry->list, &pdev->root_buses);
>  =20
>   	/* pci_scan_root_bus skips devices which do not have a
> -	* devfn=3D=3D0. The pcifront_scan_bus enumerates all devfn. */
> +	 * devfn=3D=3D0. The pcifront_scan_bus enumerates all devfn.
> +	 */
>   	err =3D pcifront_scan_bus(pdev, domain, bus, b);
>  =20
>   	/* Claim resources before going "live" with our devices */
> @@ -651,8 +651,9 @@ static void pcifront_do_aer(struct work_struct *dat=
a)
>   	pci_channel_state_t state =3D
>   		(pci_channel_state_t)pdev->sh_info->aer_op.err;
>  =20
> -	/*If a pci_conf op is in progress,
> -		we have to wait until it is done before service aer op*/
> +	/* If a pci_conf op is in progress, we have to wait until it is done
> +	 * before service aer op
> +	 */
>   	dev_dbg(&pdev->xdev->dev,
>   		"pcifront service aer bus %x devfn %x\n",
>   		pdev->sh_info->aer_op.bus, pdev->sh_info->aer_op.devfn);
> @@ -676,6 +677,7 @@ static void pcifront_do_aer(struct work_struct *dat=
a)
>   static irqreturn_t pcifront_handler_aer(int irq, void *dev)
>   {
>   	struct pcifront_device *pdev =3D dev;
> +
>   	schedule_pcifront_aer_op(pdev);
>   	return IRQ_HANDLED;
>   }
> @@ -1027,6 +1029,7 @@ static int pcifront_detach_devices(struct pcifron=
t_device *pdev)
>   	/* Find devices being detached and remove them. */
>   	for (i =3D 0; i < num_devs; i++) {
>   		int l, state;
> +
>   		l =3D snprintf(str, sizeof(str), "state-%d", i);
>   		if (unlikely(l >=3D (sizeof(str) - 1))) {
>   			err =3D -ENOMEM;
> @@ -1078,7 +1081,7 @@ static int pcifront_detach_devices(struct pcifron=
t_device *pdev)
>   	return err;
>   }
>  =20
> -static void __ref pcifront_backend_changed(struct xenbus_device *xdev,=

> +static void pcifront_backend_changed(struct xenbus_device *xdev,
>   						  enum xenbus_state be_state)
>   {
>   	struct pcifront_device *pdev =3D dev_get_drvdata(&xdev->dev);
> @@ -1137,6 +1140,7 @@ static int pcifront_xenbus_probe(struct xenbus_de=
vice *xdev,
>   static int pcifront_xenbus_remove(struct xenbus_device *xdev)
>   {
>   	struct pcifront_device *pdev =3D dev_get_drvdata(&xdev->dev);
> +
>   	if (pdev)
>   		free_pdev(pdev);
>  =20
>=20

Juergen

--------------08AB25C0E8EF0DD9B25A51A8
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

--------------08AB25C0E8EF0DD9B25A51A8--

--TRUuJTafEqklpTUbifwhTten2MeLBi8j8--

--3OUz0Wy9HJufji2HpIjnsImkaZC9e888d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEsZLwFAwAAAAAACgkQsN6d1ii/Ey98
yQf/U0IJKnJ6YmrMtynOBIB1DEVuQ3Yt/RNO0/VkuP0fFvEkW/84CvJ+sRCNRQIQv/NP1d5LRTQs
rN0wPozseBb0bNcMhhUhp7HUAlIIq8xG/f9unN+4As+7siiJLMid+ssz+Hbi6HW9p1XLb66SLr+q
V58MMq0fjN8pvNGDM12NZrDoNsNcE4O6oKHIXUbNtG7ti85VBv2TfTge1qONUM2tXqDrwG2p3K4d
cea6bu9Zs0KZUKBUgSTDaytHg3zAQd0aDCWvvhH6pYSpmNaHSUcTxnfLbUmGh4RBnUvJMHrfYlMb
dvmXpsMWecM8xZgqVD9Jy6hXbgTUR13cMh+TBoDA+w==
=io9f
-----END PGP SIGNATURE-----

--3OUz0Wy9HJufji2HpIjnsImkaZC9e888d--

