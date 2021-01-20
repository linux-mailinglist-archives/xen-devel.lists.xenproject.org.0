Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D102FD389
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71557.128222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FBF-0004SL-O6; Wed, 20 Jan 2021 15:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71557.128222; Wed, 20 Jan 2021 15:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FBF-0004Rv-KW; Wed, 20 Jan 2021 15:13:57 +0000
Received: by outflank-mailman (input) for mailman id 71557;
 Wed, 20 Jan 2021 15:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2FBD-0004R0-Rh
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24c1a989-1214-47ad-82be-d042f2258978;
 Wed, 20 Jan 2021 15:13:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13C72AAAE;
 Wed, 20 Jan 2021 15:13:54 +0000 (UTC)
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
X-Inumbo-ID: 24c1a989-1214-47ad-82be-d042f2258978
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611155634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhixMr2vL2QHKV3hgUWsE/N972TBntxti+itplkf2lM=;
	b=FQAcUqmm6bX7nT8kWTWcK++azMTkP9C7fmdaAWK/OLTzlAnQeORG9Z5MuJeWunQVI7/4F6
	cowpBlgA0kJNcD6/YmgfKxAHdntFsUIkC2EfvdF1ZIb9Nmgv6Z9eTR/sx8tH5uN1a97c+h
	4HkF2o4hNFTH7ud4AfvtwWLJOOfkweQ=
To: Jan Beulich <jbeulich@suse.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
Message-ID: <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
Date: Wed, 20 Jan 2021 16:13:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="71wP3GYBBVwYFfDx21TMMaFnUcRqnUM9g"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--71wP3GYBBVwYFfDx21TMMaFnUcRqnUM9g
Content-Type: multipart/mixed; boundary="HUsw4uaqiwAhV5EnskAbFP2wfchgHRYhU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
In-Reply-To: <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>

--HUsw4uaqiwAhV5EnskAbFP2wfchgHRYhU
Content-Type: multipart/mixed;
 boundary="------------7CC27B004032C306321C5D72"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7CC27B004032C306321C5D72
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.01.21 09:50, Jan Beulich wrote:
> On 19.01.2021 20:36, Claudemir Todo Bom wrote:
>> I do not have serial output on this setup, so I recorded a video with
>> boot_delay=3D50 in order to be able to get all the kernel messages:
>> https://youtu.be/y95h6vqoF7Y
>=20
> This doesn't show any badness afaics.
>=20
>> This is running 4.14 from debian bullseye (testing).
>>
>> I'm also attaching the dmesg output when booting xen 4.8 with  the sam=
e
>> kernel version and same parameters.
>>
>> I visually compared all the messages, and the only thing I noticed was=
 that
>> 4.14 used tsc as clocksource and 4.8 used xen. I tried to boot the ker=
nel
>> with "clocksource=3Dxen" and the problem is happening with that also.
>=20
> There's some confusion here I suppose: The clock source you talk
> about is the kernel's, not Xen's. I didn't think this would
> change for the same kernel version with different Xen underneath,
> but the Linux maintainers of the Xen code there may know better.
> Cc-ing them.

This might depend on CPUID bits given to dom0 by Xen, e.g. regarding
TSC stability.

>=20
>> The "start" of the problem is that when the kernel gets to the "Freein=
g
>> unused kernel image (initmem) memory: 2380K" it hangs and stays there =
for a
>> while. After a few minutes it shows that a process (swapper) is blocke=
d for
>> sometime (image attached)
>=20
> Now that's pretty unusual - the call trace seen in the screen
> shot you had attached indicates the kernel didn't even make it
> past its own initialization just yet. Just to have explored that
> possibility - could you enable Xen's NMI watchdog (simply
> "watchdog" on the Xen command line)? Among the boot messages
> there ought to be one indicating whether it actually works on
> your system. Without a serial console you wouldn't see anything
> if it triggers, but the system would then never make it to the
> kernel side issue.
>=20
> As far as making sure we at least see all kernel messages -
> are you having "ignore_loglevel" in place? I don't think I've
> been able to spot the kernel command line anywhere in the video.
>=20
> I'm afraid there's no real way around seeing the full Xen
> messages, i.e. including possible ones while Dom0 already boots
> (and allowing some debug keys to be issued, as the rcu_barrier
> on the stack may suggest there's an issue with one of the
> secondary CPUs). You could try whether "vag=3Dkeep" on the Xen
> command line allows you to see more, but this option may have
> quite severe an effect on the timing of Dom0's booting, which
> may make an already bad situation worse.
>=20
> Alternatively the kernel may need instrumenting to figure what
> exactly it is that prevent forward progress.
>=20
> There's one other wild guess you may want to try: "cpuidle=3Dno"
> on the Xen command line.

Other wild guesses are:

- add "sched=3Dcredit" to the Xen command line

or

- add "xen.fifo_events=3D0" to the dom0 command line


Juergen

--------------7CC27B004032C306321C5D72
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

--------------7CC27B004032C306321C5D72--

--HUsw4uaqiwAhV5EnskAbFP2wfchgHRYhU--

--71wP3GYBBVwYFfDx21TMMaFnUcRqnUM9g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAISLEFAwAAAAAACgkQsN6d1ii/Ey9q
2ggAnV6DFjSeeD9nEIimzDHxA53oyZb2590IkUeNz5rcjLql64a5bqTqaeHnwemK9ybohbVOZEl3
y3tfuYat0xcoaSuEwYptlh45N4Zhy58igK/tmGe5uZucCTbsrpJRXEyN+fCmTIZuNDl3yrgqaky9
gRnRqumCqVXjquQoNSPmra/9wY43xIt9+NcYaWmGPtjHqwUx7ED+U4HVTKAnCupJ0fnxlK/Q0tzb
Ew3qndA/fZ06yb+JB817wQd5atfp6GvDztvdYSo9JxQ+FORk91IEDarNPC8I/1A7zktH5iCSAXSz
Poc4z6/l1E7IO0m6cguzVBYG+I/UQsK9fXSGk+ssug==
=9al0
-----END PGP SIGNATURE-----

--71wP3GYBBVwYFfDx21TMMaFnUcRqnUM9g--

