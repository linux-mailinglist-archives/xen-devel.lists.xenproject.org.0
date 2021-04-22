Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCE236835E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115664.220729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbJk-0003jr-Rx; Thu, 22 Apr 2021 15:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115664.220729; Thu, 22 Apr 2021 15:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbJk-0003jS-Oj; Thu, 22 Apr 2021 15:32:36 +0000
Received: by outflank-mailman (input) for mailman id 115664;
 Thu, 22 Apr 2021 15:32:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGUy=JT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZbJj-0003jN-Em
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:32:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41328a5f-1828-4ecf-b0b1-44e82fb347dd;
 Thu, 22 Apr 2021 15:32:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A014B179;
 Thu, 22 Apr 2021 15:32:33 +0000 (UTC)
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
X-Inumbo-ID: 41328a5f-1828-4ecf-b0b1-44e82fb347dd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619105553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQ6FPFHZQRUWwK1WFV9xuIql7UDydCraqdC8XsOGujc=;
	b=KA1wYIi7ooX7MRU4eDU93LL1CI1FRbElssNxfUJLBKVtJR9zaF16TMy8YCZk+y5BV2CtJ6
	oo5MAF+IrLigcBaeJpgSoWBgg+Azuvlf9i/MQN8+ZGZpfL2Q+Oo/4ozRHC7+nOUY7O1YFR
	Mn9DsAoJz+CfIOEF8rY6pen/kY2xYtQ=
Subject: Re: [PATCH 1/3] xen: check required Xen features
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20210422151007.2205-1-jgross@suse.com>
 <20210422151007.2205-2-jgross@suse.com>
 <alpine.DEB.2.21.2104220823160.5018@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6f3a782b-0d1d-e86e-998b-bc3b46e1f4c3@suse.com>
Date: Thu, 22 Apr 2021 17:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104220823160.5018@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9jsmYefyZXuxd8BEDEztk8fd9EHtUlzTD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9jsmYefyZXuxd8BEDEztk8fd9EHtUlzTD
Content-Type: multipart/mixed; boundary="vO2PCTeA41QelLhMxxseFypK2vpnN563G";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
Message-ID: <6f3a782b-0d1d-e86e-998b-bc3b46e1f4c3@suse.com>
Subject: Re: [PATCH 1/3] xen: check required Xen features
References: <20210422151007.2205-1-jgross@suse.com>
 <20210422151007.2205-2-jgross@suse.com>
 <alpine.DEB.2.21.2104220823160.5018@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2104220823160.5018@sstabellini-ThinkPad-T480s>

--vO2PCTeA41QelLhMxxseFypK2vpnN563G
Content-Type: multipart/mixed;
 boundary="------------7E3599148FA0E975EDDBF1E7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7E3599148FA0E975EDDBF1E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.04.21 17:26, Stefano Stabellini wrote:
> On Thu, 22 Apr 2021, Juergen Gross wrote:
>> Linux kernel is not supported to run on Xen versions older than 4.0.
>>
>> Add tests for required Xen features always being present in Xen 4.0
>> and newer.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   drivers/xen/features.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/xen/features.c b/drivers/xen/features.c
>> index 25c053b09605..60503299c9bc 100644
>> --- a/drivers/xen/features.c
>> +++ b/drivers/xen/features.c
>> @@ -9,13 +9,26 @@
>>   #include <linux/types.h>
>>   #include <linux/cache.h>
>>   #include <linux/export.h>
>> +#include <linux/printk.h>
>>  =20
>>   #include <asm/xen/hypercall.h>
>>  =20
>> +#include <xen/xen.h>
>>   #include <xen/interface/xen.h>
>>   #include <xen/interface/version.h>
>>   #include <xen/features.h>
>>  =20
>> +/*
>> + * Linux kernel expects at least Xen 4.0.
>> + *
>> + * Assume some features to be available for that reason (depending on=
 guest
>> + * mode, of course).
>> + */
>> +#define chk_feature(f) {						\
>> +		if (!xen_feature(f))					\
>> +			pr_err("Xen: feature %s not available!\n", #f);	\
>> +	}
>=20
> I think this could be done as a static inline function in
> include/xen/features.h. That way it would be available everywhere. Also=
,
> static inlines are better than macro when it is possible to use them in=

> terms of code safety.

It is a macro in order to have only one parameter.

And being a local macro is rendering the code safety reasoning moot.

Additionally I don't want this testing to be scattered all over the
code base. It should be done in one place only.


Juergen

--------------7E3599148FA0E975EDDBF1E7
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

--------------7E3599148FA0E975EDDBF1E7--

--vO2PCTeA41QelLhMxxseFypK2vpnN563G--

--9jsmYefyZXuxd8BEDEztk8fd9EHtUlzTD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCBlxAFAwAAAAAACgkQsN6d1ii/Ey8L
CQf5AT0Wvlrt5lx4Bs58DO6d3FuHdrHUfBJgu78N6o4y9e/+jqIVYzO8jVfkZtO3kuLUWlM33fka
h+0NEOKoJFB9mlD5iASgb/tcswOIrWekzGH8AxDZ3F3R/Hi+JsVoNe0k4xlgWXlzO2SQKRGNlCxf
i83mMiZEUeE6eUgWwqhZVMbGpuS1SM8rmeRne9IMozSZLNpOGKZ0XNZ2srG5po41CFKERYN/H1NW
6Eq3rxVWU1T04xDuAQYNx2YY4NkPHRoCm/3AHnp2QpfUSoLWb7G5YIpZ2EmugpkEf5eyp2FMoanb
IPRDxrapVjq4KFAjZfJteXtnNXD0MaYQgFpuinVxoA==
=7nvl
-----END PGP SIGNATURE-----

--9jsmYefyZXuxd8BEDEztk8fd9EHtUlzTD--

