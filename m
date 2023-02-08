Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A568E5C4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 03:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491474.760568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPZo9-00024z-9q; Wed, 08 Feb 2023 02:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491474.760568; Wed, 08 Feb 2023 02:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPZo9-00022e-5N; Wed, 08 Feb 2023 02:03:37 +0000
Received: by outflank-mailman (input) for mailman id 491474;
 Wed, 08 Feb 2023 02:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+nY9=6E=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pPZo7-00022Y-5c
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 02:03:35 +0000
Received: from sonic315-55.consmr.mail.gq1.yahoo.com
 (sonic315-55.consmr.mail.gq1.yahoo.com [98.137.65.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c814daab-a754-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 03:03:31 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Wed, 8 Feb 2023 02:03:28 +0000
Received: by hermes--production-ne1-746bc6c6c4-j9j2r (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6c67ca8b47a829739ee46a2e499b4e4c; 
 Wed, 08 Feb 2023 02:03:23 +0000 (UTC)
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
X-Inumbo-ID: c814daab-a754-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1675821808; bh=NXJ9PRylLClq1paqhxQPO6X19sNqGm+8vVMc3JLv+yo=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=K81FqFtOTeBnloDm8unpt8jM7HSXiSqoSjHwDxcqWTgNmGjf1tNMjn4yFltK8b6ETRdF3aYHttqINhgLyYj5WPwO14VxAVOdjrChd1Byw4yqpXq89Qnfjk++D0DXz0pACrx12qOepvsyY/jA79XPfli7K9/OyIqKPQHLDZ7t4zJXUyhJqzDWKSEh8GxyadBC8AWgTcSEzRgphOr4KnawQ5NCDsgiU+OOBSsboODTosmEaMEOVLX7Zgne2COwsTNtdSOHnDQTElT37nxv+Y6YEOTbIZ2RHzD6N3BFoO53ec644VcVi2N63a4YneXyne1kP6Nzaq25thYteDcxHdrqHQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1675821808; bh=kWlPj0khdqgamcY3cVxsxxVYNpSRMoDGw3WTDoMW/XM=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=RExVFcu4TsjeJMcqv6P/tTrkNKS71TbcVS4EHEp8CXq5PoTCnr88GqkJiQVAxAKTr2JTBAhlJrbt/BDZbG4hlkAxoD9pQer2SSDTBl8Zob/BxWevEZS68j1FS1KZpts2Iks/02TVo3q2ePgv63awwSNCDyPde9opyxNXSTn4YLe0+p84Q0JFFrtlmvukrP4tIcAj6Cq1ng8TXPHKqkpnoRzsZ3b4uY6X3/9AS3kycLdXNCooPpUWawqLjcKGk6hDgOP1bwCPYDSZlMXz4MNX3hzBuo9t+95bdIUF/QNBG7R8naQTijFokx2sES1zooblSr0J3uAou8Hby9K8JieFLg==
X-YMail-OSG: HdhH2KYVM1mUq4HnKWmrYNjCXKkD8WAM8t491iad3X6T7_EAe0YYzySz2eUIXaD
 xaTI2LKPoLQEtMVSoddtnOIxIpyvFZI.fbXxClaOxb3HZOuCTKjPxghK1BZ.QaRssSkk8G.Yor_W
 MdyDDWd57U9_.hIqAXG2HPcR3hBmvnqyi9YGO5q7E3_DQrqSYx0NbATXrZC0EkY2_wNHEUqHyBnx
 Is4.NX25k0lVY6..iNT939SG7w6biAgEtQW8ckKFWraN8E20E43Lyfeh34KhymL.v08XzW.XKa2d
 nttcy43MzS6ewwOEKT3HMpJIFBTjIzwnm3N5tmIKPk5iuWb2lYP49tEHFcioFvQuccf238KQSe7x
 TsRWUrsk_gT93B_XdS9Lp47.a59lDsHbWZSIB7iYKlkT86PJjPZlqxWbSHnxQVYYGkw8dEhvwWzD
 UBDg.UI8OA.DcHAO8iRgtWE7WNxyNytAAMZEVDXA1TWAx7QAborNhPngTnMW2zyInlNE2m5kFtGE
 28rUxlB9JxhHPV5o7NWWaErCyYA6ZQ_.OHiHq6Q6IiDwJcTWwwWJRarCGy5y8VLnav2iP4cqLAkb
 7MiRkJxkri.56BPxNyleSZpucB5dsahJ7IgIr8nSPs68IIkoniPm6dSh8ZIrM.O_drsAbWjS3Qpc
 feKocN9vJ8.JQ7mRmvgJeSqtJK1TExeilbtDSKIlfu7d19uZ7PwfdtRTLvHqQhHljZXw98Z5rMG3
 dmvGSP3FNHsYw5UckRlsxVSeZa3rKXSGKZd3ZQKKJeoa1a6KbqyuTzEeP.lNCKbUKKxXZ2ASk6C6
 _pi6hMIbbEHmXKGDtZp16JxHWE_OCE4ZYnLApPevldrzPa9g4XY.5ZObcs2eR9w8jAqD_UmWyL84
 H1mtNznwoslQT_Nzf7WO_VwRlVsqOCwblO2F6EzPFdmNpUo3dEio2LJ32udP7WnNn2DrZYiGXxbu
 5g3fDaFBuRThhOH.ZAXR4.hKMWjHdPE1unfUCWzAuMzIlGf.ScUnzD8IKHj5eyaRy4YLYNuwgZxx
 tE4bfaB0PQQpN60cOFSyiQmNlv1kFjgxPTFxXqdvfyTUWhGsb_GzoDR2Xeod56R168q4Rz9XQHWE
 .aW0W2d1_hUwTdPeMRiGKGSBeJVSTRNrtRs7UPqr2AA.s08NtJMccSg64FAyKsnwOGbo7X7QbQFv
 SnHBmvwOG89etq8D5ZyX7zvYrhut9EgPUM4a_DQZqrmK83Si1PBXxImxCEWsPWKhvbUxEQci9wCN
 cXJgPtcCX8yXm1v3EABhJ4t5WEiUDCoz2p29zLgmZfDUBIHrzJ5YMctOJtnxR1HOcUUJ.fMgtia9
 w69lYx8UGB13Gf7XPmiiyKbnVuUKTeKB47Placr9tYLbsK4FYoBJ.Y6b5UkO84RrTbBem9Cawcf8
 ChQ9Fk7cd5zwTvUo08anwmcUJqcwgZBCJ7TFV6vZpc6eeTFc0AK_y3h4Z6SbEowHYS82foAGsaO_
 k3Uv9_EgU2LrbzxZrwbwtET2Q85.e0JtHU8HJnKBFSJwGE6rto.JpGOrj4I4TIFm2KCUCVZi2rGX
 PX3OG8kckEqzvAJqREbpAyoXj5XDvXGv4c8KN.dwnzpMaqyXeJLw3LepVJJS4dBM.lKJ3Ym6O3Wn
 ZCi101UTfl0MRaIIETFQ_a4fFlfyMDcXwM1Wdi9h9kKPKt1j7W0EFs4vP5YamW1Cs4QJf7chKTDx
 iaIh17eguneIV3rUEWxP05oP_VX1zZJ8k4ku1BNTwe5yDp1B1Vq_YPilJMCDx.IlKHnjtYWWJSC_
 rCYjUn4Bgs433Y_AJxFzF9r6kuOMjdUnhrlIQKzVcFQwu7aUdIKLnrdxFOyHIbT6hmNmHc.lZTm2
 u5OsylnaUTidIL2_88mew0pCbV.G1TDkiJ6qFAdwfh2dsN0PGM9MXOb4H9y7RaiBZncWYEq6OF4y
 SGdREhllhbjr795.WE6gkjPoFzJlXikjxQs8.tgORiTCpmwfLtj5zZ9q.kcAMvvGGIQJt033.qmZ
 EyhwLQosavtEt_CM2ULZzJ0R_uecKXJd3FYRhQS4uSvMjnBzvpgEO.vDIW_5_s0atxIt8VuVHNzg
 TT.xUseeyax5yKWXEqKA110m0LxOp0qNtvKOYCdn5pkqUNx939atMDPUgCAjw2OW_XyvLkSd3He.
 9SgLZPvwlOboR3app02mNQ3.IUSvVVaqXHwJVH3uQ_acHma4bN0.WvorHyeMrhfvAUxUrpCX65Ih
 o
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-stable@nongnu.org
Subject: [PATCH] xen/pt: fix igd passthrough for pc machine with xen accelerator
Date: Tue,  7 Feb 2023 21:03:05 -0500
Message-Id: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com>

Commit 998250e97661 ("xen, gfx passthrough: register host bridge specific
to passthrough") uses the igd-passthrough-i440FX pci host device with
the xenfv machine type and igd-passthru=on, but using it for the pc
machine type, xen accelerator, and igd-passtru=on was omitted from that
commit.

The igd-passthru-i440FX pci host device is also needed for guests
configured with the pc machine type, the xen accelerator, and
igd-passthru=on. Specifically, tests show that not using the igd-specific
pci host device with the Intel igd passed through to the guest results
in slower startup performance and reduced resolution of the display
during startup. This patch fixes this issue.

To simplify the logic that is needed to support both the --enable-xen
and the --disable-xen configure options, introduce the boolean symbol
pc_xen_igd_gfx_pt_enabled() whose value is set appropriately in the
sysemu/xen.h header file as the test to determine whether or not
to use the igd-passthrough-i440FX pci host device instead of the
normal i440FX pci host device.

Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge specific to passthrough")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
This patch is intended to replace or complement a recently proposed
patch that modifies slot_reserved_mask for the xenfv machine with
igd-passthru=on in order to fix the problem of Qemu not reserving slot 2
for the Intel IGD for the xenfv machine type. This patch provides a
simple way to improve Qemu support for the Intel IGD with the xen
accelerator without needing to change how slot_reserved_mask functions.

For reference, the latest version of the patch to fix the xenfv machine
using slot_reserved_mask is at:

https://lore.kernel.org/qemu-devel/b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com/

Reason for introducing the new boolean pc_xen_igd_gfx_pt_enabled():

It is also possible to use xen_igd_gfx_pt_enabled() directly to check
if the igd-passthru-i440FX pci host device is needed in this patch,
but in that case it would be necessary to implement it in
accel/stubs/xen-stub.c like this:

bool xen_igd_gfx_pt_enabled(void)
{
    return false;
}

to cover the case when Qemu is configured with --disable-xen. I thought
it was simpler to introduce the same boolean prefixed with pc_ and
set it to 0 when --disable-xen is the configure option, and that explains
why the proposed patch introduces pc_xen_igd_gfx_pt_enabled() instead of
using xen_igd_gfx_pt_enabled() directly.

Another reason to use pc_xen_igd_gfx_pt_enabled() is to distinguish it
from xen_igd_gfx_pt_enabled() in hw/i386/pc_piix.c, because the use of
xen_igd_gfx_pt_enabled() is guarded by CONFIG_XEN but this patch needs
to place the boolean in a position that is not guarded by CONFIG_XEN.
This approach will simplify any future effort to move the code in
pc_piix.c that is not guarded by CONFIG_XEN to a xen-specific file.

 hw/i386/pc_piix.c    | 2 ++
 include/sysemu/xen.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..fd5b9ae1eb 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -433,6 +433,8 @@ static void pc_xen_hvm_init(MachineState *machine)
             compat(machine); \
         } \
         pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, \
+                 pc_xen_igd_gfx_pt_enabled() ? \
+                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : \
                  TYPE_I440FX_PCI_DEVICE); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn)
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 0ca25697e4..99ae41e619 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -23,6 +23,7 @@
 extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
+#define pc_xen_igd_gfx_pt_enabled()    xen_igd_gfx_pt_enabled()
 
 #ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
@@ -33,6 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
+#define pc_xen_igd_gfx_pt_enabled() 0
 #ifndef CONFIG_USER_ONLY
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
-- 
2.39.1


