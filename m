Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476C22F6644
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 17:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67435.120381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l05nh-0006Ub-EG; Thu, 14 Jan 2021 16:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67435.120381; Thu, 14 Jan 2021 16:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l05nh-0006UC-B3; Thu, 14 Jan 2021 16:48:45 +0000
Received: by outflank-mailman (input) for mailman id 67435;
 Thu, 14 Jan 2021 16:48:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l05nf-0006Tr-Ln
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:48:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30b7a581-7ba6-45a8-884e-2ef402580f7d;
 Thu, 14 Jan 2021 16:48:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91C8EABD6;
 Thu, 14 Jan 2021 16:48:40 +0000 (UTC)
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
X-Inumbo-ID: 30b7a581-7ba6-45a8-884e-2ef402580f7d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610642920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/T56YX5xcckg1NR2urStuVPLq91BhQSwNfO5S9EXDCs=;
	b=SWbJdOKE5DbnUCY3n9Ntmb18UD0PLqUkmkeY4XMalTAyjnJBPfWJ+9j11zpfT7M3pNVn1X
	UqHRLczVKsjoqDgmCw2dtpLQcYzgkYsCespfnRLw/QwxXvzbuiZFmVdLVztK7t/RWDGyHU
	eEgCObvUbhSJs4cMqf2tvDEEHYoauAk=
Subject: Re: [PATCH v11 00/27] tools/xenstore: support live update for
 xenstored
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20210114153803.2591-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6b660f98-d6b0-bd2a-9d70-bd75a94e0beb@suse.com>
Date: Thu, 14 Jan 2021 17:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hzBjCcpI3Vhi4D26gHKV6Vchg1BNdaJVo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hzBjCcpI3Vhi4D26gHKV6Vchg1BNdaJVo
Content-Type: multipart/mixed; boundary="BteIpprZ6MoJSiHJilKFDZmLR71O4pA8w";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <6b660f98-d6b0-bd2a-9d70-bd75a94e0beb@suse.com>
Subject: Re: [PATCH v11 00/27] tools/xenstore: support live update for
 xenstored
References: <20210114153803.2591-1-jgross@suse.com>
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>

--BteIpprZ6MoJSiHJilKFDZmLR71O4pA8w
Content-Type: multipart/mixed;
 boundary="------------2F17F60FC6AB78D2E11E18C7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2F17F60FC6AB78D2E11E18C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.01.21 16:37, Juergen Gross wrote:
> Today Xenstore is not restartable. This means a Xen server needing an
> update of xenstored has to be rebooted in order to let this update
> become effective.
>=20
> This patch series is changing that: The internal state of xenstored
> (the contents of Xenstore, all connections to various clients like
> programs or other domains, and watches) is saved in a defined format
> and a new binary is being activated consuming the old state. All
> connections are being restored and the new Xenstore binary will
> continue where the old one stopped.
>=20
> This patch series has been under (secret) development until V9.
> It has been posted to xen-devel only from V10 onwards.
>=20
> There will be a similar series for oxenstored posted.
>=20
> Xenstore-stubdom is not yet supported, but I'm planning to start
> working on that soon.
>=20
> Changes in V11:
> - dropped patches 1-3 of V10 as already appled
> - new patches 1-4 (Andrew Cooper): more libxenevtchn cleanup
> - new patch 12 (Edwin Torok): handle timeout of LU completely in
>    xenstored instead of split xenstore-control/xenstored. I've kept
>    the xenstore-control timeout handling for the case of premature
>    LU supporting downstream versions
>=20
> Changes in V10 (for the members of the security team):
> - dropped patch 6 as requested by Andrew
>=20
> Juergen Gross (26):
>    tools/libxenevtchn: switch to standard xen coding style
>    tools/libxenevtchn: rename open_flags to flags
>    tools/libxenevtchn: check xenevtchn_open() flags for not supported
>      bits
>    tools/libxenevtchn: propagate xenevtchn_open() flags parameter
>    tools/libxenevtchn: add possibility to not close file descriptor on
>      exec
>    tools/xenstore: refactor XS_CONTROL handling
>    tools/xenstore: add live update command to xenstore-control
>    tools/xenstore: add basic live-update command parsing
>    tools/xenstore: introduce live update status block
>    tools/xenstore: save new binary for live update
>    tools/xenstore: add command line handling for live update
>    tools/xenstore: add support for delaying execution of a xenstore
>      request
>    tools/xenstore: add the basic framework for doing the live update
>    tools/xenstore: allow live update only with no transaction active
>    docs: update the xenstore migration stream documentation
>    tools/xenstore: add include file for state structure definitions
>    tools/xenstore: dump the xenstore state for live update
>    tools/xenstore: handle CLOEXEC flag for local files and pipes
>    tools/xenstore: split off domain introduction from do_introduce()
>    tools/xenstore: evaluate the live update flag when starting
>    tools/xenstore: read internal state when doing live upgrade
>    tools/xenstore: add reading global state for live update
>    tools/xenstore: add read connection state for live update
>    tools/xenstore: add read node state for live update
>    tools/xenstore: add read watch state for live update
>    tools/xenstore: activate new binary for live update
>=20
> Julien Grall (1):
>    tools/xenstore: handle dying domains in live update
>=20
>   docs/designs/xenstore-migration.md      |  19 +-
>   docs/misc/xenstore.txt                  |  21 +
>   tools/include/xenevtchn.h               |  18 +-
>   tools/libs/evtchn/Makefile              |   2 +-
>   tools/libs/evtchn/core.c                |  74 ++-
>   tools/libs/evtchn/freebsd.c             |  33 +-
>   tools/libs/evtchn/libxenevtchn.map      |   4 +
>   tools/libs/evtchn/linux.c               |  12 +-
>   tools/libs/evtchn/minios.c              | 104 +++-
>   tools/libs/evtchn/netbsd.c              |  24 +-
>   tools/libs/evtchn/private.h             |   2 +-
>   tools/libs/evtchn/solaris.c             |  14 +-
>   tools/xenstore/Makefile                 |   3 +-
>   tools/xenstore/include/xenstore_state.h | 131 +++++
>   tools/xenstore/utils.c                  |  17 +
>   tools/xenstore/utils.h                  |   6 +
>   tools/xenstore/xenstore_control.c       | 333 +++++++++++-
>   tools/xenstore/xenstored_control.c      | 665 +++++++++++++++++++++++=
-
>   tools/xenstore/xenstored_control.h      |   1 +
>   tools/xenstore/xenstored_core.c         | 549 +++++++++++++++++--
>   tools/xenstore/xenstored_core.h         |  59 +++
>   tools/xenstore/xenstored_domain.c       | 301 ++++++++---
>   tools/xenstore/xenstored_domain.h       |  11 +-
>   tools/xenstore/xenstored_posix.c        |  13 +-
>   tools/xenstore/xenstored_transaction.c  |   5 +
>   tools/xenstore/xenstored_watch.c        | 171 ++++--
>   tools/xenstore/xenstored_watch.h        |   5 +
>   27 files changed, 2354 insertions(+), 243 deletions(-)
>   create mode 100644 tools/xenstore/include/xenstore_state.h
>=20

There is something wrong with the patches. Please ignore (at least from
patch 12 onwards).


Juergen

--------------2F17F60FC6AB78D2E11E18C7
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

--------------2F17F60FC6AB78D2E11E18C7--

--BteIpprZ6MoJSiHJilKFDZmLR71O4pA8w--

--hzBjCcpI3Vhi4D26gHKV6Vchg1BNdaJVo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAAdecFAwAAAAAACgkQsN6d1ii/Ey9m
KQf/QYuXITiUgCmhq86wvsjjTUQ8hhphFayhig9KQmWFNptdJvhFcDVqRlMOzBtbQflveUN7w4NB
bSyDl75w1K2kI3aomZYSsbGo+dp6VNfVY4zZUJl20k0YbhxLudgdTa8YDZINMZYhG4M9smfq9igg
dQGjkCnGo/JeyGBJaIamaRCtXdlPsFK2TtCjs3SAa72BL4udViA6aXWRnyQXaK17zFkcc739XmCY
WDXFAZQWZjQTUOX3R5hERPcQERMzkGGnwBvLfOfyfvylgH9g9DX2+8sJXwB35I2m1lOOMhkRE3El
ojsAqbdkbF/6Ki/1A/kNIPnKZE/iPNKkUnMHlFloNA==
=Hxic
-----END PGP SIGNATURE-----

--hzBjCcpI3Vhi4D26gHKV6Vchg1BNdaJVo--

