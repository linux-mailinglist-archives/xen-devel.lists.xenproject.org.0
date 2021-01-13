Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A712F49E9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 12:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66407.117914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzeCo-00068V-Ew; Wed, 13 Jan 2021 11:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66407.117914; Wed, 13 Jan 2021 11:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzeCo-000686-Bm; Wed, 13 Jan 2021 11:20:50 +0000
Received: by outflank-mailman (input) for mailman id 66407;
 Wed, 13 Jan 2021 11:20:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jk6d=GQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kzeCn-000681-Ap
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 11:20:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afbb24a3-2793-4ed0-9b25-8ea06aa2552a;
 Wed, 13 Jan 2021 11:20:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 040DCAEE0;
 Wed, 13 Jan 2021 11:20:47 +0000 (UTC)
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
X-Inumbo-ID: afbb24a3-2793-4ed0-9b25-8ea06aa2552a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610536847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wz+sAT79cBFHyobPsQUfEh5uToBf1T439JA5zlH+s+g=;
	b=fz8QoCnWJwMjGnd7KjfMnRz5QnaxAV0IVyhwhPgvz3grkJMsd7O3z4gOEwiKKa89RvuUWl
	RVualEq+xHZkWQBWMS5XWV/Mdpy4WqWfxEyMO/HR5KRcN28rjlFrYQdKHVrZfhV1FDZ9L+
	G4V0Vm5cvJLChOAQB4mL8nA28b2oZDI=
Subject: Re: [PATCH v3 1/5] xen: Fix event channel callback via INTX/GSI
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210106153958.584169-1-dwmw2@infradead.org>
 <20210106153958.584169-2-dwmw2@infradead.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f23614f6-2867-f114-a8b4-93cc64f3e2d5@suse.com>
Date: Wed, 13 Jan 2021 12:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210106153958.584169-2-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5wtai2aHyf8DQWde4f9CGCfyju5lDvWsz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5wtai2aHyf8DQWde4f9CGCfyju5lDvWsz
Content-Type: multipart/mixed; boundary="jLJJu55v7znU3cbEeguWk4QalsppSMgIw";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <f23614f6-2867-f114-a8b4-93cc64f3e2d5@suse.com>
Subject: Re: [PATCH v3 1/5] xen: Fix event channel callback via INTX/GSI
References: <20210106153958.584169-1-dwmw2@infradead.org>
 <20210106153958.584169-2-dwmw2@infradead.org>
In-Reply-To: <20210106153958.584169-2-dwmw2@infradead.org>

--jLJJu55v7znU3cbEeguWk4QalsppSMgIw
Content-Type: multipart/mixed;
 boundary="------------C19AA96762053987EA361030"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C19AA96762053987EA361030
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.01.21 16:39, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> For a while, event channel notification via the PCI platform device
> has been broken, because we attempt to communicate with xenstore before=

> we even have notifications working, with the xs_reset_watches() call
> in xs_init().
>=20
> We tend to get away with this on Xen versions below 4.0 because we avoi=
d
> calling xs_reset_watches() anyway, because xenstore might not cope with=

> reading a non-existent key. And newer Xen *does* have the vector
> callback support, so we rarely fall back to INTX/GSI delivery.
>=20
> To fix it, clean up a bit of the mess of xs_init() and xenbus_probe()
> startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM=

> case, deferring it to be called from xenbus_probe() in the XS_HVM case
> instead.
>=20
> Then fix up the invocation of xenbus_probe() to happen either from its
> device_initcall if the callback is available early enough, or when the
> callback is finally set up. This means that the hack of calling
> xenbus_probe() from a workqueue after the first interrupt, or directly
> from the PCI platform device setup, is no longer needed.
>=20
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Building for arm I get:

/home/gross/korg/src/drivers/xen/xenbus/xenbus_probe.c: In function=20
'xenbus_probe_initcall':
/home/gross/korg/src/drivers/xen/xenbus/xenbus_probe.c:711:41: error:=20
'xen_have_vector_callback' undeclared (first use in this function); did=20
you mean 'em_data_callback'?
        (!IS_ENABLED(CONFIG_XEN_PVHVM) || xen_have_vector_callback)))


Juergen

> ---
>   arch/arm/xen/enlighten.c          |  2 +-
>   drivers/xen/events/events_base.c  | 10 -----
>   drivers/xen/platform-pci.c        |  1 -
>   drivers/xen/xenbus/xenbus.h       |  1 +
>   drivers/xen/xenbus/xenbus_comms.c |  8 ----
>   drivers/xen/xenbus/xenbus_probe.c | 68 ++++++++++++++++++++++++------=
-
>   include/xen/xenbus.h              |  2 +-
>   7 files changed, 57 insertions(+), 35 deletions(-)
>=20
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 60e901cd0de6..5a957a9a0984 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -371,7 +371,7 @@ static int __init xen_guest_init(void)
>   	}
>   	gnttab_init();
>   	if (!xen_initial_domain())
> -		xenbus_probe(NULL);
> +		xenbus_probe();
>  =20
>   	/*
>   	 * Making sure board specific code will not set up ops for
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/even=
ts_base.c
> index a8030332a191..e850f79351cb 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -2060,16 +2060,6 @@ static struct irq_chip xen_percpu_chip __read_mo=
stly =3D {
>   	.irq_ack		=3D ack_dynirq,
>   };
>  =20
> -int xen_set_callback_via(uint64_t via)
> -{
> -	struct xen_hvm_param a;
> -	a.domid =3D DOMID_SELF;
> -	a.index =3D HVM_PARAM_CALLBACK_IRQ;
> -	a.value =3D via;
> -	return HYPERVISOR_hvm_op(HVMOP_set_param, &a);
> -}
> -EXPORT_SYMBOL_GPL(xen_set_callback_via);
> -
>   #ifdef CONFIG_XEN_PVHVM
>   /* Vector callbacks are better than PCI interrupts to receive event
>    * channel notifications because we can receive vector callbacks on a=
ny
> diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
> index dd911e1ff782..9db557b76511 100644
> --- a/drivers/xen/platform-pci.c
> +++ b/drivers/xen/platform-pci.c
> @@ -149,7 +149,6 @@ static int platform_pci_probe(struct pci_dev *pdev,=

>   	ret =3D gnttab_init();
>   	if (ret)
>   		goto grant_out;
> -	xenbus_probe(NULL);
>   	return 0;
>   grant_out:
>   	gnttab_free_auto_xlat_frames();
> diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
> index 2a93b7c9c159..dc1537335414 100644
> --- a/drivers/xen/xenbus/xenbus.h
> +++ b/drivers/xen/xenbus/xenbus.h
> @@ -115,6 +115,7 @@ int xenbus_probe_node(struct xen_bus_type *bus,
>   		      const char *type,
>   		      const char *nodename);
>   int xenbus_probe_devices(struct xen_bus_type *bus);
> +void xenbus_probe(void);
>  =20
>   void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
>  =20
> diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xen=
bus_comms.c
> index eb5151fc8efa..e5fda0256feb 100644
> --- a/drivers/xen/xenbus/xenbus_comms.c
> +++ b/drivers/xen/xenbus/xenbus_comms.c
> @@ -57,16 +57,8 @@ DEFINE_MUTEX(xs_response_mutex);
>   static int xenbus_irq;
>   static struct task_struct *xenbus_task;
>  =20
> -static DECLARE_WORK(probe_work, xenbus_probe);
> -
> -
>   static irqreturn_t wake_waiting(int irq, void *unused)
>   {
> -	if (unlikely(xenstored_ready =3D=3D 0)) {
> -		xenstored_ready =3D 1;
> -		schedule_work(&probe_work);
> -	}
> -
>   	wake_up(&xb_waitq);
>   	return IRQ_HANDLED;
>   }
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xen=
bus_probe.c
> index 44634d970a5c..b1b5b6fe9b52 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -683,29 +683,63 @@ void unregister_xenstore_notifier(struct notifier=
_block *nb)
>   }
>   EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
>  =20
> -void xenbus_probe(struct work_struct *unused)
> +void xenbus_probe(void)
>   {
>   	xenstored_ready =3D 1;
>  =20
> +	/*
> +	 * In the HVM case, xenbus_init() deferred its call to
> +	 * xs_init() in case callbacks were not operational yet.
> +	 * So do it now.
> +	 */
> +	if (xen_store_domain_type =3D=3D XS_HVM)
> +		xs_init();
> +
>   	/* Notify others that xenstore is up */
>   	blocking_notifier_call_chain(&xenstore_chain, 0, NULL);
>   }
> -EXPORT_SYMBOL_GPL(xenbus_probe);
>  =20
>   static int __init xenbus_probe_initcall(void)
>   {
> -	if (!xen_domain())
> -		return -ENODEV;
> -
> -	if (xen_initial_domain() || xen_hvm_domain())
> -		return 0;
> +	/*
> +	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
> +	 * need to wait for the platform PCI device to come up, which is
> +	 * the (XEN_PVPVM && !xen_have_vector_callback) case.
> +	 */
> +	if (xen_store_domain_type =3D=3D XS_PV ||
> +	    (xen_store_domain_type =3D=3D XS_HVM &&
> +	     (!IS_ENABLED(CONFIG_XEN_PVHVM) || xen_have_vector_callback)))
> +		xenbus_probe();
>  =20
> -	xenbus_probe(NULL);
>   	return 0;
>   }
> -
>   device_initcall(xenbus_probe_initcall);
>  =20
> +int xen_set_callback_via(uint64_t via)
> +{
> +	struct xen_hvm_param a;
> +	int ret;
> +
> +	a.domid =3D DOMID_SELF;
> +	a.index =3D HVM_PARAM_CALLBACK_IRQ;
> +	a.value =3D via;
> +
> +	ret =3D HYPERVISOR_hvm_op(HVMOP_set_param, &a);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If xenbus_probe_initcall() deferred the xenbus_probe()
> +	 * due to the callback not functioning yet, we can do it now.
> +	 */
> +	if (!xenstored_ready && xen_store_domain_type =3D=3D XS_HVM &&
> +	    IS_ENABLED(CONFIG_XEN_PVHVM) && !xen_have_vector_callback)
> +		xenbus_probe();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xen_set_callback_via);
> +
>   /* Set up event channel for xenstored which is run as a local process=

>    * (this is normally used only in dom0)
>    */
> @@ -818,11 +852,17 @@ static int __init xenbus_init(void)
>   		break;
>   	}
>  =20
> -	/* Initialize the interface to xenstore. */
> -	err =3D xs_init();
> -	if (err) {
> -		pr_warn("Error initializing xenstore comms: %i\n", err);
> -		goto out_error;
> +	/*
> +	 * HVM domains may not have a functional callback yet. In that
> +	 * case let xs_init() be called from xenbus_probe(), which will
> +	 * get invoked at an appropriate time.
> +	 */
> +	if (xen_store_domain_type !=3D XS_HVM) {
> +		err =3D xs_init();
> +		if (err) {
> +			pr_warn("Error initializing xenstore comms: %i\n", err);
> +			goto out_error;
> +		}
>   	}
>  =20
>   	if ((xen_store_domain_type !=3D XS_LOCAL) &&
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index 00c7235ae93e..2c43b0ef1e4d 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -192,7 +192,7 @@ void xs_suspend_cancel(void);
>  =20
>   struct work_struct;
>  =20
> -void xenbus_probe(struct work_struct *);
> +void xenbus_probe(void);
>  =20
>   #define XENBUS_IS_ERR_READ(str) ({			\
>   	if (!IS_ERR(str) && strlen(str) =3D=3D 0) {		\
>=20


--------------C19AA96762053987EA361030
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

--------------C19AA96762053987EA361030--

--jLJJu55v7znU3cbEeguWk4QalsppSMgIw--

--5wtai2aHyf8DQWde4f9CGCfyju5lDvWsz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/+144FAwAAAAAACgkQsN6d1ii/Ey/K
Cwf+Ogkm/f03ZQVVH7cw5P8BBvOBDTr2JGGHEnZb9ZBGFXqJf5V4VtTVGgjqGbjDkzcHxeOOjnpD
7F9ntLbL9zIydiDlrsX3u8l09AfiTn6i0f2GqY9v/sAjZtRjIM8JHN7BoLYB/2JemtvfpyX7YrC6
KrHW2adftV7liPSNLcF3gdzPAzxcl3gD85Ee3p+bng693pUfHAQE2qH5swpIZNChgu2QhNhS+zyK
ZZfMl6N+S99wSyMYAYByinPJscaI+j+TGjuZysn656z3dMWvhTz6Qux904kM8eaUWO1mZdDLmdRC
g5Ee1+jQtbOoVcSFKIyFQOWWAm0BWewBe3YLFcR0Rg==
=gEBW
-----END PGP SIGNATURE-----

--5wtai2aHyf8DQWde4f9CGCfyju5lDvWsz--

