Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D15402A3C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181076.328061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbX8-0007dI-KC; Tue, 07 Sep 2021 13:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181076.328061; Tue, 07 Sep 2021 13:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbX8-0007Zt-Fc; Tue, 07 Sep 2021 13:53:06 +0000
Received: by outflank-mailman (input) for mailman id 181076;
 Tue, 07 Sep 2021 13:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xlGX=N5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNbX6-0007Zn-Sy
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:53:04 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45fbc0fe-7e96-4ad0-b06a-85d1b067e582;
 Tue, 07 Sep 2021 13:53:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADE741FF95;
 Tue,  7 Sep 2021 13:53:02 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9515513A24;
 Tue,  7 Sep 2021 13:53:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id QE3gIr5uN2GgfwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 07 Sep 2021 13:53:02 +0000
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
X-Inumbo-ID: 45fbc0fe-7e96-4ad0-b06a-85d1b067e582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631022782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ni/NQ190x3Mlq9HWfhTgoCgr+slvDM1E7IewUCMMiMQ=;
	b=G4U3H2ifSiawaKDYI8HS5SMBvYKZEi1oT4Sc57S9YIfwSpXnxLuvPI7N7gf+3h772GZciD
	vNCuiRcUob/LGW63FuezNGjKRClJQLuTVn3/wfTDeLW+WPsiqsNL9zIpY6oZKtifZ1dByn
	NyUEHzcx3aaKgipXopsDDFEzZzv4eV8=
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
To: Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
From: Juergen Gross <jgross@suse.com>
Message-ID: <955da8ce-40f2-32c5-ee78-6801ce18afe5@suse.com>
Date: Tue, 7 Sep 2021 15:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y0QXcXgTugGoqPx0Eq7pOX3EV4o9pfd7F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y0QXcXgTugGoqPx0Eq7pOX3EV4o9pfd7F
Content-Type: multipart/mixed; boundary="dUye6vfcouJSbb1w8PO2dLlk1jDNCtNt9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <955da8ce-40f2-32c5-ee78-6801ce18afe5@suse.com>
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
In-Reply-To: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>

--dUye6vfcouJSbb1w8PO2dLlk1jDNCtNt9
Content-Type: multipart/mixed;
 boundary="------------72E11293AFB37D2C9018C87B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------72E11293AFB37D2C9018C87B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.09.21 23:35, Sander Eikelenboom wrote:
> L.S.,
>=20
> On my AMD box running:
>  =C2=A0=C2=A0=C2=A0 xen-unstable changeset: Fri Sep 3 15:10:43 2021 +02=
00 git:2d4978ead4
>  =C2=A0=C2=A0=C2=A0 linux kernel: 5.14.1
>=20
> With this setup I'm encountering some issues in dom0, see below.

Could you test whether the attached patch (only compile tested)
fixes the issue for you?


Juergen

--------------72E11293AFB37D2C9018C87B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-fix-usage-of-pmd-pud_poplulate-in-mremap-for-pv-.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-xen-fix-usage-of-pmd-pud_poplulate-in-mremap-for-pv-.pa";
 filename*1="tch"

=46rom c9e4ce85bcb9003ffa4877743e1792ac6ec24f19 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: x86@kernel.org
To: linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org
Date: Tue, 7 Sep 2021 15:17:39 +0200
Subject: [PATCH] xen: fix usage of pmd/pud_poplulate in mremap for pv gue=
sts

Commit 0881ace292b662 ("mm/mremap: use pmd/pud_poplulate to update page
table entries") introduced a regression when running as Xen PV guest.

Today pmd/pud_poplulate() for Xen PV assumes that the PFN inserted is
referencing a not yet used page table. In case of move_normal_pmd/pud()
this is not true, resulting in WARN splats like:

[34321.304270] ------------[ cut here ]------------
[34321.304277] WARNING: CPU: 0 PID: 23628 at arch/x86/xen/multicalls.c:10=
2 xen_mc_flush+0x176/0x1a0
[34321.304288] Modules linked in:
[34321.304291] CPU: 0 PID: 23628 Comm: apt-get Not tainted 5.14.1-2021090=
6-doflr-mac80211debug+ #1
[34321.304294] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V=
1.8B1 09/13/2010
[34321.304296] RIP: e030:xen_mc_flush+0x176/0x1a0
[34321.304300] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60 0=
3 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00 00=
 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
[34321.304303] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
[34321.304305] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX: ffff88807=
d416398
[34321.304306] RDX: 0000000000000001 RSI: 0000000000000001 RDI: deadbeefd=
eadf00d
[34321.304308] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09: ffff88800=
6160cc0
[34321.304309] R10: deadbeefdeadf00d R11: ffffea000026a600 R12: 000000000=
0000000
[34321.304310] R13: ffff888012f6b000 R14: 0000000012f6b000 R15: 000000000=
0000001
[34321.304320] FS:  00007f5071177800(0000) GS:ffff88807d400000(0000) knlG=
S:0000000000000000
[34321.304322] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[34321.304323] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4: 000000000=
0000660
[34321.304326] Call Trace:
[34321.304331]  xen_alloc_pte+0x294/0x320
[34321.304334]  move_pgt_entry+0x165/0x4b0
[34321.304339]  move_page_tables+0x6fa/0x8d0
[34321.304342]  move_vma.isra.44+0x138/0x500
[34321.304345]  __x64_sys_mremap+0x296/0x410
[34321.304348]  do_syscall_64+0x3a/0x80
[34321.304352]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[34321.304355] RIP: 0033:0x7f507196301a
[34321.304358] Code: 73 01 c3 48 8b 0d 76 0e 0c 00 f7 d8 64 89 01 48 83 c=
8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 19 00 00 00 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 0e 0c 00 f7 d8 64 89 01 48
[34321.304360] RSP: 002b:00007ffda1eecd38 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000019
[34321.304362] RAX: ffffffffffffffda RBX: 000056205f950f30 RCX: 00007f507=
196301a
[34321.304363] RDX: 0000000001a00000 RSI: 0000000001900000 RDI: 00007f506=
dc56000
[34321.304364] RBP: 0000000001a00000 R08: 0000000000000010 R09: 000000000=
0000004
[34321.304365] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f506=
dc56060
[34321.304367] R13: 00007f506dc56000 R14: 00007f506dc56060 R15: 000056205=
f950f30
[34321.304368] ---[ end trace a19885b78fe8f33e ]---
[34321.304370] 1 of 2 multicall(s) failed: cpu 0
[34321.304371]   call  2: op=3D12297829382473034410 arg=3D[aaaaaaaaaaaaaa=
aa] result=3D-22

Fix that by modifying xen_alloc_ptpage() to only pin the page table in
case it wasn't pinned already.

Fixes: 0881ace292b662 ("mm/mremap: use pmd/pud_poplulate to update page t=
able entries")
Cc: <stable@vger.kernel.org>
Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu_pv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 1df5f01529e5..8d751939c6f3 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1518,14 +1518,17 @@ static inline void xen_alloc_ptpage(struct mm_str=
uct *mm, unsigned long pfn,
 	if (pinned) {
 		struct page *page =3D pfn_to_page(pfn);
=20
-		if (static_branch_likely(&xen_struct_pages_ready))
+		pinned =3D false;
+		if (static_branch_likely(&xen_struct_pages_ready)) {
+			pinned =3D PagePinned(page);
 			SetPagePinned(page);
+		}
=20
 		xen_mc_batch();
=20
 		__set_pfn_prot(pfn, PAGE_KERNEL_RO);
=20
-		if (level =3D=3D PT_PTE && USE_SPLIT_PTE_PTLOCKS)
+		if (level =3D=3D PT_PTE && USE_SPLIT_PTE_PTLOCKS && !pinned)
 			__pin_pagetable_pfn(MMUEXT_PIN_L1_TABLE, pfn);
=20
 		xen_mc_issue(PARAVIRT_LAZY_MMU);
--=20
2.26.2


--------------72E11293AFB37D2C9018C87B
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

--------------72E11293AFB37D2C9018C87B--

--dUye6vfcouJSbb1w8PO2dLlk1jDNCtNt9--

--Y0QXcXgTugGoqPx0Eq7pOX3EV4o9pfd7F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE3br4FAwAAAAAACgkQsN6d1ii/Ey+R
Ewf/VFek8aJAUMbjuWxGgqIccUOkBjyZN2fG8a1f1eQ8VdKJy+lTH7Z9pu+iyBBVTwutLHdYP1gU
7yDd040CmChljDWQz4ZdzvvJulVvlze6dcGrjhfUwfZADRS+mHc8iO/jDjjzYJB5xL81LgIR+lnR
QVEsK78QpWogPpAuTX2k1xiHLXAEfXiTjD0Dph+yLcWUU4IbLkYluzduR0L78C0n7gpFHaWG8Z/W
7fVKKhJf8/8KpSMMCOwaTESbpa2p3F6ENvBKCCf5lho3iqrnBq4SNkcHSwKGf1cCrNtPXJb3Pbd4
M6sWY+Dl6ksFIwn6gUfm90OKpcGodJQ/WSl2chYgkw==
=vCbt
-----END PGP SIGNATURE-----

--Y0QXcXgTugGoqPx0Eq7pOX3EV4o9pfd7F--

