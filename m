Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1B455419
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 06:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227092.392674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnZpt-0001HP-6P; Thu, 18 Nov 2021 05:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227092.392674; Thu, 18 Nov 2021 05:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnZpt-0001EQ-2m; Thu, 18 Nov 2021 05:19:49 +0000
Received: by outflank-mailman (input) for mailman id 227092;
 Thu, 18 Nov 2021 05:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l94Z=QF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mnZpq-0001EK-IP
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 05:19:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23ed5972-482f-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 06:19:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 171C3212BF;
 Thu, 18 Nov 2021 05:19:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A677A13CBE;
 Thu, 18 Nov 2021 05:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lEUQJm/ilWF2FgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 18 Nov 2021 05:19:43 +0000
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
X-Inumbo-ID: 23ed5972-482f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637212784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RFizS13dXr1U+nyRCg8f8JObCGX70vXaZf/eYyfxWtY=;
	b=RrsWBfT7XmArtmKbTblkMRpncAGd9jcdy6muZIz3pqfmBzfxa/NDB4rH7BKOJeXyrHMIC3
	mBu6s/ptJpdFY6J8qKhG+nuOjo/sD5MCLx4qvvM37ZDr7k/po5hOEsROX8P8WMBE/3TW2P
	h/QgYjmTGGGWqJyUwevdSsuuIRNjbL8=
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
 <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
Message-ID: <59e14393-a1fc-5b82-2f6e-5567f218cb3a@suse.com>
Date: Thu, 18 Nov 2021 06:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IPP9Ec1viq4GUQVvD7kduxVmbutMtMy7L"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IPP9Ec1viq4GUQVvD7kduxVmbutMtMy7L
Content-Type: multipart/mixed; boundary="EMZ8BuDzesKpUActVmVQCILibcfgb31dC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <59e14393-a1fc-5b82-2f6e-5567f218cb3a@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
 <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>

--EMZ8BuDzesKpUActVmVQCILibcfgb31dC
Content-Type: multipart/mixed;
 boundary="------------DB34264B6EE0AADC04E1BED5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DB34264B6EE0AADC04E1BED5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.11.21 03:19, Stefano Stabellini wrote:
> On Wed, 17 Nov 2021, Julien Grall wrote:
>>>>>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi Luca,
>>>>>>
>>>>>> On 17/11/2021 09:57, Luca Fancellu wrote:
>>>>>>> Currently Xen creates a default cpupool0 that contains all the cp=
u
>>>>>>> brought up
>>>>>>> during boot and it assumes that the platform has only one kind of=

>>>>>>> CPU.
>>>>>>> This assumption does not hold on big.LITTLE platform, but putting=

>>>>>>> different
>>>>>>> type of CPU in the same cpupool can result in instability and
>>>>>>> security issues
>>>>>>> for the domains running on the pool.
>>>>>>
>>>>>> I agree that you can't move a LITTLE vCPU to a big pCPU. However..=
=2E
>>>>>>
>>>>>>> For this reason this serie introduces an architecture specific wa=
y
>>>>>>> to create
>>>>>>> different cpupool at boot time, this is particularly useful on AR=
M
>>>>>>> big.LITTLE
>>>>>>> platform where there might be the need to have different cpupools=

>>>>>>> for each type
>>>>>>> of core, but also systems using NUMA can have different cpu pool =
for
>>>>>>> each node.
>>>>>>
>>>>>> ... from my understanding, all the vCPUs of a domain have to be in=
 the
>>>>>> same cpupool. So with this approach it is not possible:
>>>>>>     1) to have a mix of LITTLE and big vCPUs in the domain
>>>>>>     2) to create a domain spanning across two NUMA nodes
>>>>>>
>>>>>> So I think we need to make sure that any solutions we go through w=
ill
>>>>>> not prevent us to implement those setups.
>>>>> The point of this patch is to make all cores available without brea=
king
>>>>> the current behaviour of existing system.
>>>>
>>>> I might be missing some context here. By breaking current behavior, =
do you
>>>> mean user that may want to add "hmp-unsafe" on the command line?
>>>
>>> Right, with hmp-unsafe the behaviour is now the same as without, only=
 extra
>>> cores are parked in other cpupools.
>>>
>>> So you have a point in fact that behaviour is changed for someone who=
 was
>>> using hmp-unsafe before if this is activated.
>>> The command line argument suggested by Jurgen definitely makes sense =
here.
>>>
>>> We could instead do the following:
>>> - when this is activated in the configuration, boot all cores and par=
k them
>>> in different pools (depending on command line argument). Current beha=
viour
>>> not change if other pools are not used (but more cores will be on in =
xen)
>>
>>  From my understanding, it is possible to move a pCPU in/out a pool af=
terwards.
>> So the security concern with big.LITTLE is still present, even though =
it would
>> be difficult to hit it.
>=20
> As far as I know moving a pCPU in/out of a pool is something that canno=
t
> happen automatically: it requires manual intervention to the user and i=
t
> is uncommon. We could print a warning or simply return error to prevent=

> the action from happening. Or something like:
>=20
> "This action might result in memory corruptions and invalid behavior. D=
o
> you want to continue? [Y/N]

This should only be rejected if the source and target pool are not
compatible. So a cpupool could be attributed to allow only specific
cpus (and maybe domains?) in it.

Otherwise it would be impossible to create new cpupools after boot on
such a system and populating them with cpus.

>> I am also concerned that it would be more difficult to detect any
>> misconfiguration. So I think this option would still need to be turned=
 on only
>> if hmp-unsafe are the new command line one are both on.
>>
>> If we want to enable it without hmp-unsafe on, we would need to at lea=
st lock
>> the pools.
>=20
> Locking the pools is a good idea.

This would be another option, yes.

> My preference is not to tie this feature to the hmp-unsafe command line=
,
> more on this below.

I agree.

>>> - when hmp-unsafe is on, this feature will be turned of (if activated=
 in
>>> configuration) and all cores would be added in the same pool.
>>>
>>> What do you think ?
>>
>> I am split. On one hand, this is making easier for someone to try big.=
LITTLE
>> as you don't have manually pin vCPUs. On the other hand, this is handl=
ing a
>> single use-case and you would need to use hmp-unsafe and pinning if yo=
u want
>> to get more exotic setup (e.g. a domain with big.LITTLE).
>>
>> Another possible solution is to pin dom0 vCPUs (AFAIK they are just st=
icky by
>> default) and then create the pools from dom0 userspace. My assumption =
is for
>> dom0less we would want to use pinning instead.
>>
>> That said I would like to hear from Xilinx and EPAM as, IIRC, they are=
 already
>> using hmp-unsafe in production.
>=20
> This discussion has been very interesting, it is cool to hear new ideas=

> like this one. I have a couple of thoughts to share.
>=20
> First I think that the ability of creating cpupools at boot time is
> super important. It goes way beyond big.LITTLE. It would be incredibly
> useful to separate real-time (sched=3Dnull) and non-real-time
> (sched=3Dcredit2) workloads. I think it will only become more important=

> going forward so I'd love to see an option to configure cpupools that
> works for dom0less. It could be based on device tree properties rather
> than kconfig options.

I think device tree AND command line option should be possible (think of
x86 here).

> It is true that if we had the devicetree-based cpupool configuration I
> mentioned, then somebody could use it to create cpupools matching
> big.LITTLE. So "in theory" it solves the problem. However, I think that=

> for big.LITTLE it would be suboptimal. For big.LITTLE it would be best
> if Xen configured the cpupools automatically rather than based on the
> device tree configuration. That way, it is going to work automatically
> without extra steps even in the simplest Xen setups.
>=20
> So I think that it is a good idea to have a command line option (better=

> than a kconfig option) to trigger the MIDR-based cpupool creation at
> boot time. The option could be called midr-cpupools=3Don/off or
> hw-cpupools=3Don/off for example.

I'd rather go for:

cpupools=3D<options>

With e.g. <options>:

- "auto-midr": split system into cpupools based on MIDR
- "auto-numa": split system into cpupools based on NUMA nodes
- "cpus=3D<list of cpus>[,sched=3D<scheduler>]

This would be rather flexible without adding more and more options
doing similar things. Other sub-options could be added rather easily.

> In terms of whether it should be the default or not, I don't feel
> strongly about it. Unfortunately we (Xilinx) rely on a number of
> non-default options already so we are already in the situation where we=

> have to be extra-careful at the options passed. I don't think that
> adding one more would make a significant difference either way.
>=20
>=20
> But my preference is *not* to tie the new command line option with
> hmp-unsafe because if you use midr-cpupools and don't mess with the
> pools then it is actually safe. We could even lock the cpupools like
> Julien suggested or warn/return error on changing the cpupools. In this=

> scenario, it would be detrimental to also pass hmp-unsafe: it would
> allow actually unsafe configurations that the user wanted to avoid by
> using midr-cpupools. It would end up disabling checks we could put in
> place to make midr-cpupools safer.
>=20
> So in short I think it should be:
>=20
> - midr-cpupools alone
> cpupools created at boot, warning/errors on changing cpupools
>=20
> - midr-cpupools + hmp-unsafe
> cpupools created at boot, changing cpupools is allowed (we could still
> warn but no errors)

I'd rather add an explicit ",locked" option to above cpupools parameter.

>=20
> - hmp-unsafe alone
> same as today with hmp-unsafe
>=20
>=20
> For the default as I said I don't have a strong preference. I think
> midr-cpupools could be "on" be default.
>=20

What about making this a Kconfig option?


Juergen

--------------DB34264B6EE0AADC04E1BED5
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

--------------DB34264B6EE0AADC04E1BED5--

--EMZ8BuDzesKpUActVmVQCILibcfgb31dC--

--IPP9Ec1viq4GUQVvD7kduxVmbutMtMy7L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGV4m8FAwAAAAAACgkQsN6d1ii/Ey9J
jQf/ba8MPm0sJMQHN1Kxrod2DdedDP9rTpEBRiV7jcSfILuX/JRsB0GlKg+3N58XAZeFyUG6tMvY
zNsL1ilJ92bseMead0dJf9C7lV+DsACJb4ewe5ZSOh+ZzZMr6EfnR1+EtfjqlQFu1bu8xzbylRbv
cUnTGSoFzn8ZvZPhWNAbcvzeVurIsXmL9cDkoF1/5HhOgdfIDS0MR4RSKvj+xZpyeWnoWGv23Rgh
WhqEPsV1ZnPJoDHWCf1PC6p9rl2Iy37KrqolB89OoNfTHWui3sVEAhSEa/J3QsUFF5hCCLFIx5xb
3dTVfBnrNLgdKuF3KgYpA2ehkz8UwqbxdiFF+iZsnw==
=Gdvo
-----END PGP SIGNATURE-----

--IPP9Ec1viq4GUQVvD7kduxVmbutMtMy7L--

