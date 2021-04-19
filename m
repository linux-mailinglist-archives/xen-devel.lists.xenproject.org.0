Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA36363E87
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 11:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112766.215062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYQHc-0005lH-9h; Mon, 19 Apr 2021 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112766.215062; Mon, 19 Apr 2021 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYQHc-0005ks-6Z; Mon, 19 Apr 2021 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 112766;
 Mon, 19 Apr 2021 09:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lYQHa-0005kn-P8
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 09:33:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8409c26-af7f-474c-a9be-557b40a7574e;
 Mon, 19 Apr 2021 09:33:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8049EAF27;
 Mon, 19 Apr 2021 09:33:28 +0000 (UTC)
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
X-Inumbo-ID: b8409c26-af7f-474c-a9be-557b40a7574e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618824808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4JLndugxS8nFtww4Gr3ZdxVHql0xCLCm/rEDFNpIy94=;
	b=HGraXLn+Ugg87nGh1nGuVXsHWPbGjmyyouQS2LEo/T5b6e++GzsugU2bSiamTtPu/rZn5t
	RetbYJzMq0aaRC7AksFkMLn9a39yxDWeaeVsbnSPylaz/GQs0ahCPUYdi8jc8sP4ZJVMFk
	XQXPCixm0+D0mE6TleFwFB8XZhuy1gE=
Subject: Re: kernel NULL pointer dereference in gntdev_mmap ->
 mmu_interval_notifier_remove
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YHxFtj3dyjFbeusP@mail-itl>
From: Juergen Gross <jgross@suse.com>
Message-ID: <68f4d2e3-4b25-58a6-d690-d5854c509354@suse.com>
Date: Mon, 19 Apr 2021 11:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YHxFtj3dyjFbeusP@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dOpKLHRg8ubRsmkbk1m7eSci79BJsaX8G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dOpKLHRg8ubRsmkbk1m7eSci79BJsaX8G
Content-Type: multipart/mixed; boundary="ZpEtNdtBqjZPGD27gNPIwBrGeJkCcbaoi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <68f4d2e3-4b25-58a6-d690-d5854c509354@suse.com>
Subject: Re: kernel NULL pointer dereference in gntdev_mmap ->
 mmu_interval_notifier_remove
References: <YHxFtj3dyjFbeusP@mail-itl>
In-Reply-To: <YHxFtj3dyjFbeusP@mail-itl>

--ZpEtNdtBqjZPGD27gNPIwBrGeJkCcbaoi
Content-Type: multipart/mixed;
 boundary="------------76E967BB506C0B05BD62E4E7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------76E967BB506C0B05BD62E4E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.04.21 16:44, Marek Marczykowski-G=C3=B3recki wrote:
> Hi,
>=20
> I've recently got the crash like below. I'm not sure what exactly
> triggers it (besides grant table mapping as seen in the call trace), an=
d
> also I don't have reliable reproducer. It happened once for about ~30
> startups.
>=20
> Previous version tested was 5.10.25 and it didn't happened there, but
> since reproduction rate is not great, it could be just luck...
>=20
> [ 1053.550389] BUG: kernel NULL pointer dereference, address: 000000000=
00003b0
> [ 1053.557844] #PF: supervisor read access in kernel mode
> [ 1053.557847] #PF: error_code(0x0000) - not-present page
> [ 1053.557851] PGD 0 P4D 0
> [ 1053.557858] Oops: 0000 [#1] SMP NOPTI
> [ 1053.557863] CPU: 1 PID: 8806 Comm: Xorg Tainted: G        W         =
5.10.28-1.fc32.qubes.x86_64 #1
> [ 1053.557865] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 0.0.0 02/06/2015
> [ 1053.557876] RIP: e030:mmu_interval_notifier_remove+0x2e/0x190
> [ 1053.557879] Code: 00 41 55 41 54 55 48 89 fd 53 48 83 ec 30 4c 8b 67=
 38 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 c7 04 24 00 00 00 =
00 <49> 8b 9c 24 b0 03 00 00 48 c7 44 24 08 00 00 00 00 48 c7 44 24 10
> [ 1053.557881] RSP: e02b:ffffc90041617d18 EFLAGS: 00010246
> [ 1053.557883] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
> [ 1053.557884] RDX: 0000000000000001 RSI: ffffffff81c3e9a0 RDI: ffff888=
12588b700
> [ 1053.557885] RBP: ffff88812588b700 R08: 7fffffffffffffff R09: 0000000=
000000000
> [ 1053.557886] R10: ffff8881088d4708 R11: ffff888108aa6180 R12: 0000000=
000000000
> [ 1053.557887] R13: 00000000fffffffc R14: ffff888106a3ec00 R15: ffff888=
106a3ec10
> [ 1053.557913] FS:  0000716f7f9a3a40(0000) GS:ffff888140300000(0000) kn=
lGS:0000000000000000
> [ 1053.557915] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1053.557916] CR2: 00000000000003b0 CR3: 0000000105cf4000 CR4: 0000000=
000000660
> [ 1053.557919] Call Trace:
> [ 1053.557944]  gntdev_mmap+0x275/0x2f9 [xen_gntdev]
> [ 1053.557950]  mmap_region+0x47e/0x720
> [ 1053.557953]  do_mmap+0x438/0x540
> [ 1053.557959]  ? security_mmap_file+0x81/0xd0
> [ 1053.557963]  vm_mmap_pgoff+0xdf/0x130
> [ 1053.557967]  ksys_mmap_pgoff+0x1d6/0x240
> [ 1053.557973]  do_syscall_64+0x33/0x40
> [ 1053.557977]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 1053.557981] RIP: 0033:0x716f7fe8c2e6
> [ 1053.557985] Code: 01 00 66 90 f3 0f 1e fa 41 f7 c1 ff 0f 00 00 75 2b=
 55 48 89 fd 53 89 cb 48 85 ff 74 37 41 89 da 48 89 ef b8 09 00 00 00 0f =
05 <48> 3d 00 f0 ff ff 77 62 5b 5d c3 0f 1f 80 00 00 00 00 48 8b 05 79
> [ 1053.557986] RSP: 002b:00007ffcb4ef35c8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000009
> [ 1053.557988] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 0000716=
f7fe8c2e6
> [ 1053.557989] RDX: 0000000000000001 RSI: 0000000000001000 RDI: 0000000=
000000000
> [ 1053.557990] RBP: 0000000000000000 R08: 0000000000000009 R09: 0000000=
000000000
> [ 1053.557991] R10: 0000000000000001 R11: 0000000000000246 R12: 00007ff=
cb4ef35e0
> [ 1053.557992] R13: 0000000000000001 R14: 0000000000000009 R15: 0000000=
000000001
> [ 1053.557995] Modules linked in: loop nf_tables nfnetlink vfat fat xfs=
 snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg sound=
wire_intel soundwire_generic_allocation ppdev snd_soc_core snd_compress s=
nd_pcm_dmaengine soundwire_cadence joydev snd_hda_codec snd_hda_core ac97=
_bus snd_hwdep snd_seq snd_seq_device snd_pcm edac_mce_amd snd_timer pcsp=
kr snd soundcore e1000e i2c_piix4 parport_pc parport xenfs fuse ip_tables=
 dm_crypt bochs_drm drm_vram_helper drm_kms_helper cec drm_ttm_helper ttm=
 serio_raw drm virtio_scsi virtio_console ehci_pci ehci_hcd ata_generic p=
ata_acpi floppy qemu_fw_cfg xen_privcmd xen_pciback xen_blkback xen_gntal=
loc xen_gntdev xen_evtchn uinput
> [ 1053.558040] CR2: 00000000000003b0
> [ 1053.558135] ---[ end trace 3c5c2ca63aac717a ]---
> [ 1054.277085] snd_hda_intel 0000:00:03.0: IRQ timing workaround is act=
ivated for card #0. Suggest a bigger bdl_pos_adj.
> [ 1054.927022] RIP: e030:mmu_interval_notifier_remove+0x2e/0x190
> [ 1054.929170] Code: 00 41 55 41 54 55 48 89 fd 53 48 83 ec 30 4c 8b 67=
 38 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 c7 04 24 00 00 00 =
00 <49> 8b 9c 24 b0 03 00 00 48 c7 44 24 08 00 00 00 00 48 c7 44 24 10
> [ 1054.937800] RSP: e02b:ffffc90041617d18 EFLAGS: 00010246
> [ 1054.947281] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
> [ 1054.949535] RDX: 0000000000000001 RSI: ffffffff81c3e9a0 RDI: ffff888=
12588b700
> [ 1054.973016] RBP: ffff88812588b700 R08: 7fffffffffffffff R09: 0000000=
000000000
> [ 1054.976678] R10: ffff8881088d4708 R11: ffff888108aa6180 R12: 0000000=
000000000
> [ 1054.978850] R13: 00000000fffffffc R14: ffff888106a3ec00 R15: ffff888=
106a3ec10
> [ 1054.980751] FS:  0000716f7f9a3a40(0000) GS:ffff888140300000(0000) kn=
lGS:0000000000000000
> [ 1054.982878] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1054.984509] CR2: 00000000000003b0 CR3: 0000000105cf4000 CR4: 0000000=
000000660
> [ 1054.990508] Kernel panic - not syncing: Fatal exception
> [ 1054.991967] Kernel Offset: disabled
> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>=20
> Looking at the surrounding code, it is access to 0x3b0(%r12), which is
> 0x38(%rdi):
>=20
> ffffffff812f5930 <mmu_interval_notifier_remove>:
> ffffffff812f5930:       e8 8b 09 d7 ff          callq  ffffffff810662c0=
 <__fentry__>
> ffffffff812f5935:       41 55                   push   %r13
> ffffffff812f5937:       41 54                   push   %r12
> ffffffff812f5939:       55                      push   %rbp
> ffffffff812f593a:       48 89 fd                mov    %rdi,%rbp
> ffffffff812f593d:       53                      push   %rbx
> ffffffff812f593e:       48 83 ec 30             sub    $0x30,%rsp
> ffffffff812f5942:       4c 8b 67 38             mov    0x38(%rdi),%r12
> ffffffff812f5946:       65 48 8b 04 25 28 00    mov    %gs:0x28,%rax
> ffffffff812f594d:       00 00
> ffffffff812f594f:       48 89 44 24 28          mov    %rax,0x28(%rsp)
> ffffffff812f5954:       31 c0                   xor    %eax,%eax
> ffffffff812f5956:       48 c7 04 24 00 00 00    movq   $0x0,(%rsp)
> ffffffff812f595d:       00
> ffffffff812f595e:       49 8b 9c 24 b0 03 00    mov    0x3b0(%r12),%rbx=

> ffffffff812f5965:       00
>=20
> If my calculation is right, it means map->notifier->mm is NULL.
>=20

Could you try the attached patch?


Juergen

--------------76E967BB506C0B05BD62E4E7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-gntdev-fix-gntdev_mmap-error-exit-path.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-xen-gntdev-fix-gntdev_mmap-error-exit-path.patch"

=46rom 7ff3c32b36279aacef9cf80f4103fc6050759c10 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 19 Apr 2021 11:15:59 +0200
Subject: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Commit d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
introduced an error in gntdev_mmap(): in case the call of
mmu_interval_notifier_insert_locked() fails the exit path should not
call mmu_interval_notifier_remove().

One reason for failure is e.g. a signal pending for the running
process.

Fixes: d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
Cc: stable@vger.kernel.org
Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/gntdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index f01d58c7a042..a3e7be96527d 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -1017,8 +1017,10 @@ static int gntdev_mmap(struct file *flip, struct v=
m_area_struct *vma)
 		err =3D mmu_interval_notifier_insert_locked(
 			&map->notifier, vma->vm_mm, vma->vm_start,
 			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
-		if (err)
+		if (err) {
+			map->vma =3D NULL;
 			goto out_unlock_put;
+		}
 	}
 	mutex_unlock(&priv->lock);
=20
--=20
2.26.2


--------------76E967BB506C0B05BD62E4E7
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

--------------76E967BB506C0B05BD62E4E7--

--ZpEtNdtBqjZPGD27gNPIwBrGeJkCcbaoi--

--dOpKLHRg8ubRsmkbk1m7eSci79BJsaX8G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmB9TmcFAwAAAAAACgkQsN6d1ii/Ey+b
Qgf+Jl87H0yOSclfw7mCqkIdLXBFVxn5NBH8hEzGXQkV27gzvJYRef/sXJO3WojXMSYpAlOL5Odb
qQNJP1pYWLANDBwvb3V+M4Mbp1w3iUFoJRVwZZhcQFVHCIlLF162+OZdIatsKjBvgfs8T0LL2qaN
shXJypO+kbXGxgB2EdyqHrpMfM1BHPwMTjCpgJZL08xq6xxai0cHUV7pHCWpEsu1JCs8ro56Fmfs
ljcMlxI7/t//pDJxfYkkA/3vIfV/zuu886rAa9n79rw4TgugoEH7WXmMf4IHHPgaRtH+bp/7O00c
iJLItxVo7WwY2csadwvGvgwQLN2A+zrsnDk1YUI+FA==
=WhGj
-----END PGP SIGNATURE-----

--dOpKLHRg8ubRsmkbk1m7eSci79BJsaX8G--

