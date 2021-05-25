Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1BA38FBD1
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 09:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132087.246521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llRYO-0002Zp-Ug; Tue, 25 May 2021 07:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132087.246521; Tue, 25 May 2021 07:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llRYO-0002XJ-Ri; Tue, 25 May 2021 07:32:40 +0000
Received: by outflank-mailman (input) for mailman id 132087;
 Tue, 25 May 2021 07:32:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1llRYM-0002XD-Vs
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 07:32:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6207b7cf-dbbf-4445-a799-e11db0c2953f;
 Tue, 25 May 2021 07:32:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC8EFAEA6;
 Tue, 25 May 2021 07:32:36 +0000 (UTC)
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
X-Inumbo-ID: 6207b7cf-dbbf-4445-a799-e11db0c2953f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621927957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvoPXNgD6HCBQBuP8ufVrFcviWUq9lvfxgeW6D9GpHQ=;
	b=P8nFyf0S7yJjjKYv6oUtJAZzE6q42aT3PjNXiq4uObz12EQaGhnmc56wGCLrdHLfws/oel
	C330pScEn46W5Vwpf+0NYx+j9XgGFEfhPIUOQhH0mf2pW+bF1rgJcFEjpC1AVRqelBgn/Q
	9CFZs49FuyUtDPQlzuSD4wcfwMFvVJk=
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20210412152236.1975-1-jgross@suse.com>
 <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
Message-ID: <9cbac4d9-16d8-ff52-eb8f-8375cb88af93@suse.com>
Date: Tue, 25 May 2021 09:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="u5G3R3gAkiK0fJcRYcH5NGX47UOp7UR92"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--u5G3R3gAkiK0fJcRYcH5NGX47UOp7UR92
Content-Type: multipart/mixed; boundary="LrgSeolZaKzXCi9bFdcJEAQcswtA4W63B";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Message-ID: <9cbac4d9-16d8-ff52-eb8f-8375cb88af93@suse.com>
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
References: <20210412152236.1975-1-jgross@suse.com>
 <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
In-Reply-To: <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>

--LrgSeolZaKzXCi9bFdcJEAQcswtA4W63B
Content-Type: multipart/mixed;
 boundary="------------6C914B3192B381E4EB82397E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6C914B3192B381E4EB82397E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.05.21 08:58, Juergen Gross wrote:
> Ping?

Now each patch has an Ack by Wei. Could the series be either applied or
get more comments, please?


Juergen

>=20
> On 12.04.21 17:22, Juergen Gross wrote:
>> There are some corners left which don't support the not so very new
>> linear p2m list of pv guests, which has been introduced in Linux kerne=
l
>> 3.19 and which is mandatory for non-legacy versions of Xen since kerne=
l
>> 4.14.
>>
>> This series adds support for the linear p2m list where it is missing
>> (colo support and "xl dump-core").
>>
>> In theory it should be possible to merge the p2m list mapping code
>> from migration handling and core dump handling, but this needs quite
>> some cleanup before this is possible.
>>
>> The first three patches of this series are fixing real problems, so
>> I've put them at the start of this series, especially in order to make=

>> backports easier.
>>
>> The other three patches are only the first steps of cleanup. The main
>> work done here is to concentrate all p2m mapping in libxenguest instea=
d
>> of having one implementation in each of libxenguest and libxenctrl.
>>
>> Merging the two implementations should be rather easy, but this will
>> require to touch many lines of code, as the migration handling variant=

>> seems to be more mature, but it is using the migration stream specific=

>> structures heavily. So I'd like to have some confirmation that my way
>> to clean this up is the right one.
>>
>> My idea would be to add the data needed for p2m mapping to struct
>> domain_info_context and replace the related fields in struct
>> xc_sr_context with a struct domain_info_context. Modifying the
>> interface of xc_core_arch_map_p2m() to take most current parameters
>> via struct domain_info_context would then enable migration coding to
>> use xc_core_arch_map_p2m() for mapping the p2m. xc_core_arch_map_p2m()=

>> should look basically like the current migration p2m mapping code
>> afterwards.
>>
>> Any comments to that plan?
>>
>> Changes in V2:
>> - added missing #include in ocaml stub
>>
>> Juergen Gross (6):
>> =C2=A0=C2=A0 tools/libs/guest: fix max_pfn setting in map_p2m()
>> =C2=A0=C2=A0 tools/libs/ctrl: fix xc_core_arch_map_p2m() to support li=
near p2m
>> =C2=A0=C2=A0=C2=A0=C2=A0 table
>> =C2=A0=C2=A0 tools/libs/ctrl: use common p2m mapping code in xc_domain=
_resume_any()
>> =C2=A0=C2=A0 tools/libs: move xc_resume.c to libxenguest
>> =C2=A0=C2=A0 tools/libs: move xc_core* from libxenctrl to libxenguest
>> =C2=A0=C2=A0 tools/libs/guest: make some definitions private to libxen=
guest
>>
>> =C2=A0 tools/include/xenctrl.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 63 ---
>> =C2=A0 tools/include/xenguest.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 63 +++
>> =C2=A0 tools/libs/ctrl/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 4 -
>> =C2=A0 tools/libs/ctrl/xc_core_x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 223 ------=
----
>> =C2=A0 tools/libs/ctrl/xc_domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 -
>> =C2=A0 tools/libs/ctrl/xc_private.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=20
43 +-
>> =C2=A0 tools/libs/guest/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 4 +
>> =C2=A0 .../libs/{ctrl/xc_core.c =3D> guest/xg_core.c}=C2=A0 |=C2=A0=C2=
=A0 7 +-
>> =C2=A0 .../libs/{ctrl/xc_core.h =3D> guest/xg_core.h}=C2=A0 |=C2=A0 15=20
+-
>> =C2=A0 .../xc_core_arm.c =3D> guest/xg_core_arm.c}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 31 +-
>> =C2=A0 .../xc_core_arm.h =3D> guest/xg_core_arm.h}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 0
>> =C2=A0 tools/libs/guest/xg_core_x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 399 +++++++++=
+++++++++
>> =C2=A0 .../xc_core_x86.h =3D> guest/xg_core_x86.h}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 0
>> =C2=A0 tools/libs/guest/xg_dom_boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2=20
+-
>> =C2=A0 tools/libs/guest/xg_domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=20
19 +-
>> =C2=A0 tools/libs/guest/xg_offline_page.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 tools/libs/guest/xg_private.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +=
-
>> =C2=A0 .../{ctrl/xc_resume.c =3D> guest/xg_resume.c}=C2=A0=C2=A0 |=C2=A0=20
69 +--
>> =C2=A0 tools/libs/guest/xg_sr_save_x86_pv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 tools/ocaml/libs/xc/xenctrl_stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 20 files changed, 545 insertions(+), 420 deletions(-)
>> =C2=A0 delete mode 100644 tools/libs/ctrl/xc_core_x86.c
>> =C2=A0 rename tools/libs/{ctrl/xc_core.c =3D> guest/xg_core.c} (99%)
>> =C2=A0 rename tools/libs/{ctrl/xc_core.h =3D> guest/xg_core.h} (92%)
>> =C2=A0 rename tools/libs/{ctrl/xc_core_arm.c =3D> guest/xg_core_arm.c}=20
(72%)
>> =C2=A0 rename tools/libs/{ctrl/xc_core_arm.h =3D> guest/xg_core_arm.h}=20
(100%)
>> =C2=A0 create mode 100644 tools/libs/guest/xg_core_x86.c
>> =C2=A0 rename tools/libs/{ctrl/xc_core_x86.h =3D> guest/xg_core_x86.h}=20
(100%)
>> =C2=A0 rename tools/libs/{ctrl/xc_resume.c =3D> guest/xg_resume.c} (80=
%)
>>
>=20


--------------6C914B3192B381E4EB82397E
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

--------------6C914B3192B381E4EB82397E--

--LrgSeolZaKzXCi9bFdcJEAQcswtA4W63B--

--u5G3R3gAkiK0fJcRYcH5NGX47UOp7UR92
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCsqBQFAwAAAAAACgkQsN6d1ii/Ey/1
Qwf/dsAdtVCVvbEpG//i4HfheFy1rRpBu+WVb823Kp28zAEAMC5dQFsaSoPZ58h1R/ZcHhgpbyXK
SEl/xR5pEGXyUHQ/affgdXecZZ+FQCrinCFyvDnHVemBnWPo+QKc5DQaSYrbDDnPRpVht8+mRPvx
C9BDzx9sBBCUShwq+1ENQi/RtpO4/fnI3O5IuWzYsYMC0SvSMmp43z760n8A6tJgLwwumb+iZhgT
6A0KHyB+KMPbOT4c1vXze/PLnNoN2HftbnepNu3goL4ylhipIzBbi6Wi9SXeIVR12sqdPLIxy7Rr
LCTGgSrdfQt+nTGOuG2g5zB31pvjZGA7Qcb0K7lWRQ==
=I2G+
-----END PGP SIGNATURE-----

--u5G3R3gAkiK0fJcRYcH5NGX47UOp7UR92--

