Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C92309ADE
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 07:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79168.144198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l66d4-00076Q-MZ; Sun, 31 Jan 2021 06:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79168.144198; Sun, 31 Jan 2021 06:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l66d4-000762-JO; Sun, 31 Jan 2021 06:54:38 +0000
Received: by outflank-mailman (input) for mailman id 79168;
 Sun, 31 Jan 2021 06:54:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l66d2-00075x-MR
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 06:54:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3da9204b-3f6c-413a-b4d2-d64a2f691f42;
 Sun, 31 Jan 2021 06:54:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B3DDAED2;
 Sun, 31 Jan 2021 06:54:34 +0000 (UTC)
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
X-Inumbo-ID: 3da9204b-3f6c-413a-b4d2-d64a2f691f42
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612076074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sgi7D1SJP9+/0IpMtDAYZiwWgOs7gChuiUkyXiN8S6E=;
	b=Er76IK0GEn1jPGK4XCW7FebaJhusrce+/TJizxvnbvgNhRIeCAXHcqPTpFa6gQWkcnTZTB
	105M0fQE4fgYe7n0uVL4b522TWYC49nqw+WeaFN3Iia86WtWZd0vXpQBw1nFNNw+B6Cb3k
	w0mNzvRcwbd2S38RrWMlkGHxqCAT2eM=
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
 <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
 <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Troubles analyzing crash dumps from xl dump-core
Message-ID: <2bbb347c-bc5b-63f7-3e94-b90145ff5166@suse.com>
Date: Sun, 31 Jan 2021 07:54:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wfQKu5vSPiTvp1GA5bYeanDZqCQkNe00Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wfQKu5vSPiTvp1GA5bYeanDZqCQkNe00Q
Content-Type: multipart/mixed; boundary="PFGiNZDdOIRByxOg8gLeFEODUBBkY0TZp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <2bbb347c-bc5b-63f7-3e94-b90145ff5166@suse.com>
Subject: Re: Troubles analyzing crash dumps from xl dump-core
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
 <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
 <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
In-Reply-To: <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>

--PFGiNZDdOIRByxOg8gLeFEODUBBkY0TZp
Content-Type: multipart/mixed;
 boundary="------------165C15AF9BBAA93EB03AB68B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------165C15AF9BBAA93EB03AB68B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.01.21 19:53, Roman Shaposhnik wrote:
> On Fri, Jan 29, 2021 at 11:28 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
> wrote:
>>
>> On 29.01.21 21:12, Roman Shaposhnik wrote:
>>> Hi!
>>>
>>> I'm trying to see how much mileage I can get out of
>>> crash(1) 7.2.8 (based on gdb 7.6) when it comes to
>>> analyzing crash dumps taken via xl dump-core (this
>>> is all on x86_64 with stock Xen v. 4.14).
>>>
>>> The good news is that the image actually does load
>>> up but it throws the following WARNINGs in the process:
>>>
>>> WARNING: cannot access vmalloc'd module memory
>>> crash: read error: kernel virtual address: ffffffff93613480  type:
>>> "fill_task_struct"
>>> WARNING: active task ffffffff93613480 on cpu 0 not found in PID hash
>>> crash: read error: kernel virtual address: ffffffff93613480  type:
>>> "fill_task_struct"
>>> WARNING: cannot read log_buf contents
>>>
>>> And then the info that it gives me around basic things like
>>> ps, mod, log, etc. is really super limited (and I am now suspecting
>>> may even be wrong).
>>>
>>> Since I was primarily after dmesg/log initially, I tried:
>>> crash> log
>>> log: WARNING: cannot read log_buf contents
>>>
>>> Then I tried taking an xl dump-core from the domU that was still
>>> very much alive and happy and got similar results -- so it clearly
>>> doesn't seem to be related to the state domU is in.
>>>
>>> As matter of fact, I actually got to the desired dmesg output
>>> by simply running strings(1) on the core file -- so the info is
>>> definitely there -- but I guess some kind of index/reference maybe
>>> broken.
>>>
>>> With all that in mind, if there's anyone on this ML who has recently
>>> done Xen DomU crash dump analysis -- I would definitely appreciate
>>> the pointers!
>>
>> For me it just works (openSUSE).
>=20
> Can you please run:
>=20
> crash --version and readelf -a XXXX (on the xl dump-core output)
> and post the results?

# crash --version

crash 7.2.1
Copyright (C) 2002-2017  Red Hat, Inc.
Copyright (C) 2004, 2005, 2006, 2010  IBM Corporation
Copyright (C) 1999-2006  Hewlett-Packard Co
Copyright (C) 2005, 2006, 2011, 2012  Fujitsu Limited
Copyright (C) 2006, 2007  VA Linux Systems Japan K.K.
Copyright (C) 2005, 2011  NEC Corporation
Copyright (C) 1999, 2002, 2007  Silicon Graphics, Inc.
Copyright (C) 1999, 2000, 2001, 2002  Mission Critical Linux, Inc.
This program is free software, covered by the GNU General Public License,=

and you are welcome to change it and/or distribute copies of it under
certain conditions.  Enter "help copying" to see the conditions.
This program has absolutely no warranty.  Enter "help warranty" for detai=
ls.

GNU gdb (GDB) 7.6
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later=20
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying=
"
and "show warranty" for details.
This GDB was configured as "x86_64-unknown-linux-gnu".

# readelf -a pv-dump
ELF Header:
   Magic:   7f 45 4c 46 02 01 01 00 01 00 00 00 00 00 00 00
   Class:                             ELF64
   Data:                              2's complement, little endian
   Version:                           1 (current)
   OS/ABI:                            UNIX - System V
   ABI Version:                       1
   Type:                              CORE (Core file)
   Machine:                           Advanced Micro Devices X86-64
   Version:                           0x1
   Entry point address:               0x0
   Start of program headers:          0 (bytes into file)
   Start of section headers:          64 (bytes into file)
   Flags:                             0x0
   Size of this header:               64 (bytes)
   Size of program headers:           56 (bytes)
   Number of program headers:         0
   Size of section headers:           64 (bytes)
   Number of section headers:         7
   Section header string table index: 1

Section Headers:
   [Nr] Name              Type             Address           Offset
        Size              EntSize          Flags  Link  Info  Align
   [ 0]                   NULL             0000000000000000  00000000
        0000000000000000  0000000000000000           0     0     0
   [ 1] .shstrtab         STRTAB           0000000000000000  40404000
        0000000000000048  0000000000000000           0     0     0
   [ 2] .note.Xen         NOTE             0000000000000000  00000200
        0000000000000568  0000000000000000           0     0     0
   [ 3] .xen_prstatus     PROGBITS         0000000000000000  00000768
        0000000000002860  0000000000001430           0     0     8
   [ 4] .xen_shared_info  PROGBITS         0000000000000000  00002fc8
        0000000000001000  0000000000001000           0     0     8
   [ 5] .xen_pages        PROGBITS         0000000000000000  00004000
        0000000040000000  0000000000001000           0     0     4096
   [ 6] .xen_p2m          PROGBITS         0000000000000000  40004000
        0000000000400000  0000000000000010           0     0     8
Key to Flags:
   W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
   L (link order), O (extra OS processing required), G (group), T (TLS),
   C (compressed), x (unknown), o (OS specific), E (exclude),
   l (large), p (processor specific)

There are no section groups in this file.

There are no program headers in this file.

There is no dynamic section in this file.

There are no relocations in this file.

The decoding of unwind sections for machine type Advanced Micro Devices=20
X86-64 is not currently supported.

No version information found in this file.
No note segments present in the core file.

>=20
> also, what version of  Xen are you using?

Current staging branch.

>=20
>> I tried a pv guest only with a 4.4 kernel, though.
>=20
> I would really appreciate it if you could try it on HVM so that
> I know whether it is an issue that only affects my setup or
> other folks (especially after seeing answers to above).

Works as well.

# readelf -a hvm-dump
ELF Header:
   Magic:   7f 45 4c 46 02 01 01 00 01 00 00 00 00 00 00 00
   Class:                             ELF64
   Data:                              2's complement, little endian
   Version:                           1 (current)
   OS/ABI:                            UNIX - System V
   ABI Version:                       1
   Type:                              CORE (Core file)
   Machine:                           Advanced Micro Devices X86-64
   Version:                           0x1
   Entry point address:               0x0
   Start of program headers:          0 (bytes into file)
   Start of section headers:          64 (bytes into file)
   Flags:                             0x0
   Size of this header:               64 (bytes)
   Size of program headers:           56 (bytes)
   Number of program headers:         0
   Size of section headers:           64 (bytes)
   Number of section headers:         7
   Section header string table index: 1

Section Headers:
   [Nr] Name              Type             Address           Offset
        Size              EntSize          Flags  Link  Info  Align
   [ 0]                   NULL             0000000000000000  00000000
        0000000000000000  0000000000000000           0     0     0
   [ 1] .shstrtab         STRTAB           0000000000000000  8044f260
        0000000000000048  0000000000000000           0     0     0
   [ 2] .note.Xen         NOTE             0000000000000000  00000200
        0000000000000568  0000000000000000           0     0     0
   [ 3] .xen_prstatus     PROGBITS         0000000000000000  00000768
        0000000000001430  0000000000001430           0     0     8
   [ 4] .xen_shared_info  PROGBITS         0000000000000000  00001b98
        0000000000001000  0000000000001000           0     0     8
   [ 5] .xen_pages        PROGBITS         0000000000000000  00003000
        000000008004c000  0000000000001000           0     0     4096
   [ 6] .xen_pfn          PROGBITS         0000000000000000  8004f000
        0000000000400260  0000000000000008           0     0     8
Key to Flags:
   W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
   L (link order), O (extra OS processing required), G (group), T (TLS),
   C (compressed), x (unknown), o (OS specific), E (exclude),
   l (large), p (processor specific)

There are no section groups in this file.

There are no program headers in this file.

There is no dynamic section in this file.

There are no relocations in this file.

The decoding of unwind sections for machine type Advanced Micro Devices=20
X86-64 is not currently supported.

No version information found in this file.
No note segments present in the core file.


Juergen

--------------165C15AF9BBAA93EB03AB68B
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

--------------165C15AF9BBAA93EB03AB68B--

--PFGiNZDdOIRByxOg8gLeFEODUBBkY0TZp--

--wfQKu5vSPiTvp1GA5bYeanDZqCQkNe00Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAWVCkFAwAAAAAACgkQsN6d1ii/Ey/V
+wf9Ht/0Xc4xrq6PRksfCttixj1kSaxHgP5nmIpla0gjXlslRqBcPa6OkZWHckwODKY+eyzEdFNj
/0ZpoQPmUxcWG6dTp2lFFh7ZD8iGoEtwNawWuxB8+q3OFHWsvKOIibYSTxUm3LewfcPU5WiHkTUH
TKxdK1ZZsxcSsJ+mMFmG0TVhUzM7y/y9PL+AxaC58pd7XHenMc6PAPw4hc3YNEAPg2IKXBIXtPuK
ret3J553GwnGJfzJ68bHTxalt9xELv8nm8dvmQ/bbP7hKq1yGKr2cLr3lostrQW/2h4HcOGGOh4i
xLXHyg4rkx8ckS0AKG8Sl/7wVbfYK5yiZ7+HBs0Vjw==
=M9Pz
-----END PGP SIGNATURE-----

--wfQKu5vSPiTvp1GA5bYeanDZqCQkNe00Q--

