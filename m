Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F64024F1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180572.327295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWGw-0002Zy-Ny; Tue, 07 Sep 2021 08:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180572.327295; Tue, 07 Sep 2021 08:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWGw-0002ZA-Kb; Tue, 07 Sep 2021 08:16:02 +0000
Received: by outflank-mailman (input) for mailman id 180572;
 Tue, 07 Sep 2021 08:16:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xlGX=N5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNWGv-0002Yy-86
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:16:01 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d545c744-0fb3-11ec-b0da-12813bfff9fa;
 Tue, 07 Sep 2021 08:15:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02C2B1FD3E;
 Tue,  7 Sep 2021 08:15:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D17FB132AB;
 Tue,  7 Sep 2021 08:15:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id zpc8L74fN2FKHgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 07 Sep 2021 08:15:58 +0000
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
X-Inumbo-ID: d545c744-0fb3-11ec-b0da-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631002559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6zXc+LSbfebUefAjRoXqLW7t85EtxUizUQ2aQ73x/0=;
	b=gzbyRSyonhBjA+jvjd6JqRiJKCTbqKUWaChVq35WHoHLjJpnUn7x7SM//07TPvom7T2Jx8
	zaRVytzbgMBHNS/pf/1LvLEqs0+Y1aTZ/CAdNLDl9HksxD7b0oJVeC3z/1knuk2VVacpKe
	yDeDwJ+/jZs/Y+xulyUPyitGkMdxsY8=
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
 <0ae9bb1e-dacc-a3d2-ed90-f85cb52c698d@suse.com>
 <36e8dec0-e777-a4d1-de8a-8991d95407cb@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <96b25976-4109-8aa2-b763-f00cfb1c20f7@suse.com>
Date: Tue, 7 Sep 2021 10:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <36e8dec0-e777-a4d1-de8a-8991d95407cb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rkLvAjn7JyDnXoy3ThW9ioqDZPHBBuMI3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rkLvAjn7JyDnXoy3ThW9ioqDZPHBBuMI3
Content-Type: multipart/mixed; boundary="s002Bm9I1HUjHEKtUbAXCiPi5Qbn6KY6W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <96b25976-4109-8aa2-b763-f00cfb1c20f7@suse.com>
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
 <0ae9bb1e-dacc-a3d2-ed90-f85cb52c698d@suse.com>
 <36e8dec0-e777-a4d1-de8a-8991d95407cb@suse.com>
In-Reply-To: <36e8dec0-e777-a4d1-de8a-8991d95407cb@suse.com>

--s002Bm9I1HUjHEKtUbAXCiPi5Qbn6KY6W
Content-Type: multipart/mixed;
 boundary="------------D51AD51E6B56470FE6CB0F0C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D51AD51E6B56470FE6CB0F0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.09.21 10:11, Jan Beulich wrote:
> On 07.09.2021 09:58, Juergen Gross wrote:
>> On 06.09.21 23:35, Sander Eikelenboom wrote:
>>> L.S.,
>>>
>>> On my AMD box running:
>>>   =C2=A0=C2=A0=C2=A0 xen-unstable changeset: Fri Sep 3 15:10:43 2021 =
+0200 git:2d4978ead4
>>>   =C2=A0=C2=A0=C2=A0 linux kernel: 5.14.1
>>>
>>> With this setup I'm encountering some issues in dom0, see below.
>>>
>>> --=20
>>> Sander
>>>
>>> xl dmesg gives:
>>>
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63b936 already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a0622 already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6b63da already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 638dd9 already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 68a7bc already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63c27d already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a04f2 already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 690d49 already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6959a0 already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a055e already pin=
ned
>>> (XEN) [2021-09-06 18:15:04.090] mm.c:3506:d0v0 mfn 639437 already pin=
ned
>>>
>>>
>>> dmesg gives:
>>>
>>> [34321.304270] ------------[ cut here ]------------
>>> [34321.304277] WARNING: CPU: 0 PID: 23628 at
>>> arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
>>> [34321.304288] Modules linked in:
>>> [34321.304291] CPU: 0 PID: 23628 Comm: apt-get Not tainted
>>> 5.14.1-20210906-doflr-mac80211debug+ #1
>>> [34321.304294] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)=C2=A0=
 , BIOS
>>> V1.8B1 09/13/2010
>>> [34321.304296] RIP: e030:xen_mc_flush+0x176/0x1a0
>>> [34321.304300] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 =
60
>>> 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 =
00
>>> 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 6=
5
>>> [34321.304303] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
>>> [34321.304305] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX:
>>> ffff88807d416398
>>> [34321.304306] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
>>> deadbeefdeadf00d
>>> [34321.304308] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09:
>>> ffff888006160cc0
>>> [34321.304309] R10: deadbeefdeadf00d R11: ffffea000026a600 R12:
>>> 0000000000000000
>>> [34321.304310] R13: ffff888012f6b000 R14: 0000000012f6b000 R15:
>>> 0000000000000001
>>> [34321.304320] FS:=C2=A0 00007f5071177800(0000) GS:ffff88807d400000(0=
000)
>>> knlGS:0000000000000000
>>> [34321.304322] CS:=C2=A0 10000e030 DS: 0000 ES: 0000 CR0: 00000000800=
50033
>>> [34321.304323] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4:
>>> 0000000000000660
>>> [34321.304326] Call Trace:
>>> [34321.304331]=C2=A0 xen_alloc_pte+0x294/0x320
>>> [34321.304334]=C2=A0 move_pgt_entry+0x165/0x4b0
>>> [34321.304339]=C2=A0 move_page_tables+0x6fa/0x8d0
>>> [34321.304342]=C2=A0 move_vma.isra.44+0x138/0x500
>>> [34321.304345]=C2=A0 __x64_sys_mremap+0x296/0x410
>>> [34321.304348]=C2=A0 do_syscall_64+0x3a/0x80
>>> [34321.304352]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [34321.304355] RIP: 0033:0x7f507196301a
>>
>> I can see why this failure is occurring, but I'm not sure which way is=

>> the best to fix it.
>>
>> The problem is that a pinned page table is moved: the pmd entry
>> referencing it is cleared and a new reference is put into the pmd.
>> This is done by getting the old pmd entry, clearing that entry, and th=
en
>> using pmd_populate() to write the new pmd entry. pmd_populate() will
>> lead to a call of xen_pte_alloc() trying to pin the referenced page
>> table, which is failing, as it is already pinned.
>>
>> The problem has been introduced by commit 0881ace292b662d2 in kernel
>> 5.14.
>>
>> Following solutions would be possible:
>>
>> 1. When running as PV guest skip the optimization of move_pgt_entry()
>>      by letting arch_supports_page_table_move() return false. This wil=
l
>>      result in a performance drop in some cases.
>>
>> 2. Unpin the page table before calling pmd_populate(). This adds some
>>      unneeded hypercall and without flushing the TLB I'm feeling uneas=
y
>>      to do that.
>=20
> I agree as far as the "unneeded hypercall" aspect goes, but I don't
> see any connection to the TLB (or a need to flush it): Pinning has
> nothing to do with insertion into a live page table; a pinned page
> table can be entirely free floating. It's the removal from a
> (possibly) live page table which would require a flush.

And this removal is happening:

         /* Clear the pmd */
         pmd =3D *old_pmd;
         pmd_clear(old_pmd);

         VM_BUG_ON(!pmd_none(*new_pmd));

         pmd_populate(mm, new_pmd, pmd_pgtable(pmd));

So unpinning after calling pmd_clear() seems to be risky.

>=20
>> 3. Add a check in xen_pte_alloc() if the page table is pinned already
>>      and if this is the case, don't do the pinning. This is a rather c=
lean
>>      solution, but will result in other failures if a page table is us=
ed
>>      multiple times (this case would be caught today as in the failure=

>>      above).
>>
>> My tendency is towards solution 3 as it is local to Xen code and has t=
he
>> best performance.
>=20
> I agree 3 looks most promising. I can't judge how big of a risk
> there is for a page table to get used in more than one place, and
> hence how important it is to be able to detect that case.

Thanks. I'm going that route then.


Juergen

--------------D51AD51E6B56470FE6CB0F0C
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

--------------D51AD51E6B56470FE6CB0F0C--

--s002Bm9I1HUjHEKtUbAXCiPi5Qbn6KY6W--

--rkLvAjn7JyDnXoy3ThW9ioqDZPHBBuMI3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE3H74FAwAAAAAACgkQsN6d1ii/Ey+R
2wf/T8k4DXCL0IjMFs5iazUnq4wLJn+r9VvSXMFGOPepylzZ6ZLtnB7VqXksgOtoz62aIVt0LUHC
rxR662Mno0CP4jbyONfxh+fxC3ijHsIylXp7bctAtEoEUTbrqdFDZGIaFadzUiGFGrvNr5H/2bUA
fwzqoF6wmKwmpb3vMYu/SaRS3x8Lfu6LgkZLby78LFfi34oVE/vTrHmo3TSVeygtIBA2kPgjd74g
wqfKoILPxujt4bYrR0Z4e6FzySLugxpJX3g2a207sJheF7IOyHPX0gzVjRyrM33PySLelNpOI4Pi
iSVHCVXafnfVcMebQBY6FM4ImjEi0p2vDMOJhb64bg==
=IP9j
-----END PGP SIGNATURE-----

--rkLvAjn7JyDnXoy3ThW9ioqDZPHBBuMI3--

