Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBB2CC12C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 16:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42852.77123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUL1-0001qp-AO; Wed, 02 Dec 2020 15:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42852.77123; Wed, 02 Dec 2020 15:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUL1-0001qU-73; Wed, 02 Dec 2020 15:46:39 +0000
Received: by outflank-mailman (input) for mailman id 42852;
 Wed, 02 Dec 2020 15:46:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvYF=FG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkUKz-0001qP-U5
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 15:46:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec901e13-2da2-47f2-b919-cae44d9700bf;
 Wed, 02 Dec 2020 15:46:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5BF3AB63;
 Wed,  2 Dec 2020 15:46:35 +0000 (UTC)
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
X-Inumbo-ID: ec901e13-2da2-47f2-b919-cae44d9700bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606923996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of94Q3nLN+PvayhaMtmgKrrKbZUjhpkb3kLPQDuNWLE=;
	b=tIfSb9cGGwTNMoSHHthIG2ZUWf0Xf7sL82a3nxyIzQkA11yIO2smKQLYvxbfQFpyp5r0Ka
	efypXlWEuv0gjZLR6wfMB0a3ogWH8ryekGg6PtP0fv1qNlOEUvTmb2oGRiLkOrg10uMI28
	7k1IDPQ/NNpMOi//Ufx/uea/K0fWrVM=
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <89f52bed-c611-70c5-1349-63838530debd@suse.com>
Date: Wed, 2 Dec 2020 16:46:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-16-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hdxCukwDLpEhSpLXcecK7ulHambp58YCQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hdxCukwDLpEhSpLXcecK7ulHambp58YCQ
Content-Type: multipart/mixed; boundary="rqHCrMOxyfYUsPffIOvUC2amAcn6LZi4K";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <89f52bed-c611-70c5-1349-63838530debd@suse.com>
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
In-Reply-To: <20201201082128.15239-16-jgross@suse.com>

--rqHCrMOxyfYUsPffIOvUC2amAcn6LZi4K
Content-Type: multipart/mixed;
 boundary="------------7B75E4804D05BCE6C326C307"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7B75E4804D05BCE6C326C307
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.12.20 09:21, Juergen Gross wrote:
> Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
> dynamic, so the related hypfs access functions need to be implemented.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - added const (Jan Beulich)
> - call hypfs_add_dir() in helper (Dario Faggioli)
> - switch locking to enter/exit callbacks
> ---
>   docs/misc/hypfs-paths.pandoc |   9 +++
>   xen/common/sched/cpupool.c   | 122 ++++++++++++++++++++++++++++++++++=
+
>   2 files changed, 131 insertions(+)
>=20
> diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pando=
c
> index 6c7b2f7ee3..aaca1cdf92 100644
> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -175,6 +175,15 @@ The major version of Xen.
>  =20
>   The minor version of Xen.
>  =20
> +#### /cpupool/
> +
> +A directory of all current cpupools.
> +
> +#### /cpupool/*/
> +
> +The individual cpupools. Each entry is a directory with the name being=
 the
> +cpupool-id (e.g. /cpupool/0/).
> +
>   #### /params/
>  =20
>   A directory of runtime parameters.
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index 0db7d77219..3e17fdf95b 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -13,6 +13,8 @@
>  =20
>   #include <xen/cpu.h>
>   #include <xen/cpumask.h>
> +#include <xen/guest_access.h>
> +#include <xen/hypfs.h>
>   #include <xen/init.h>
>   #include <xen/keyhandler.h>
>   #include <xen/lib.h>
> @@ -33,6 +35,7 @@ static int cpupool_moving_cpu =3D -1;
>   static struct cpupool *cpupool_cpu_moving =3D NULL;
>   static cpumask_t cpupool_locked_cpus;
>  =20
> +/* This lock nests inside sysctl or hypfs lock. */
>   static DEFINE_SPINLOCK(cpupool_lock);
>  =20
>   static enum sched_gran __read_mostly opt_sched_granularity =3D SCHED_=
GRAN_cpu;
> @@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb =3D {
>       .notifier_call =3D cpu_callback
>   };
>  =20
> +#ifdef CONFIG_HYPFS
> +static const struct hypfs_entry *cpupool_pooldir_enter(
> +    const struct hypfs_entry *entry);
> +
> +static struct hypfs_funcs cpupool_pooldir_funcs =3D {
> +    .enter =3D cpupool_pooldir_enter,
> +    .exit =3D hypfs_node_exit,
> +    .read =3D hypfs_read_dir,
> +    .write =3D hypfs_write_deny,
> +    .getsize =3D hypfs_getsize,
> +    .findentry =3D hypfs_dir_findentry,
> +};
> +
> +static HYPFS_VARDIR_INIT(cpupool_pooldir, "%u", &cpupool_pooldir_funcs=
);
> +
> +static const struct hypfs_entry *cpupool_pooldir_enter(
> +    const struct hypfs_entry *entry)
> +{
> +    return &cpupool_pooldir.e;
> +}
I have found a more generic way to handle entering a dyndir node,
resulting in no need to have cpupool_pooldir_enter() and
cpupool_pooldir_funcs.

This will add some more lines to the previous patch, but less than
saved here.


Juergen

--------------7B75E4804D05BCE6C326C307
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

--------------7B75E4804D05BCE6C326C307--

--rqHCrMOxyfYUsPffIOvUC2amAcn6LZi4K--

--hdxCukwDLpEhSpLXcecK7ulHambp58YCQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/HttsFAwAAAAAACgkQsN6d1ii/Ey/K
agf/WaeVbTibJfJn9zrxD4x/ecZ9u9dCb9ps5jG8uK7HM2sWj8scc3Z0/VF45ydQa7doyN+p/Fhc
c+tpuBSNobaU2y7uQqclVwFyUIK9mQY3qyzeeSvseUaT2n/9/pj+8smRjeUijpCJa5lWcGROVT5I
V9JauKM/t/UeH06swMvyWR5uDj432Kraj4IxwMt0x0aqD2D7JrQqseO0B3RMgfo2edCozldaATcU
dtRJRnORm+8Kz1rpAER5BPtyPj64F8uvU6dWzAoE1iYZM7LFeZyS0eyZAYpI5XM29AvE8EWmR3vN
JqZWSO3vPvdwvq7B9LD92T6VfiRcIm9Kd2A5/Q0m8Q==
=kgug
-----END PGP SIGNATURE-----

--hdxCukwDLpEhSpLXcecK7ulHambp58YCQ--

