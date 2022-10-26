Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F460E5FE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 19:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430699.682655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjll-0005xp-VP; Wed, 26 Oct 2022 17:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430699.682655; Wed, 26 Oct 2022 17:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjll-0005ue-S6; Wed, 26 Oct 2022 17:00:45 +0000
Received: by outflank-mailman (input) for mailman id 430699;
 Wed, 26 Oct 2022 17:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onjlj-0005uW-IM
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 17:00:44 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b815b5c7-554f-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 19:00:41 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 17:00:38 +0000
Received: by hermes--production-ne1-c47ffd5f5-8c2cz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 93f63f5da119448f595de422776c389f; 
 Wed, 26 Oct 2022 17:00:37 +0000 (UTC)
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
X-Inumbo-ID: b815b5c7-554f-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666803638; bh=zb9TRqADCGUlSjnc/6p3hLWAmFwYge6kxBzZzfgm3nI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=hOmfJzpS1Le1suDPpUVex+MuO1fsi3K4G2dIqxNauqBTCyCe+slpTkbwhYPIpxxz/s7+EnP5PkA1v5Ktrby4d96G6iSMpVCnim1f8aUX632UneXfmDOL2ZamQVsiAaukpZveBKRgZKLKs7h42qKjLSOupHCfW6a5vxsfyx+YUlipAuxOrnXfEo7yqHhLpIIF1BXkNhpuOiYAi3LObaKMgMsU4mqV7l0k0q9nNXckx0iMTK5YFL0xNW61M3Jp1yVVkYXJYhF2vEhdGQ4gwSAXnHUnyVXlzmy45pit6TPk1gyd1gAqs+WdiRRY+1NWOeafKMWktKZxpn17l5fIyVxcwA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666803638; bh=psU36/V8qwUhsHYEEgkkx68ScTcq5dMEEdFw3pYAggB=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=N4RA2j/WZca9NqhQL1SImL11htm3lq7l8UbsawDFDIm9d/PrgCxlGiasM/uWYKAOhVzyUlapJcpoabA2SPS/qPAvphdbRdqGPmcFBiZzq+Adxj/SclxGlWFSP1wFc2LQox4TZOagNNkqE524gTXNM7608r7mW9B+KrqcD3U8n9syklTUJF+Z+gz3L6Igz7EytSmyMzCW+QtUY/Fza1LhD2VkdomN406dB9uMSCGyTTVepJCYRolTT2sGmvCNeqd3jQCBFJnHgjlYhNWrs7jMbzQ7NES46mbJAY4L0ESTrMZnVFVsxJzc38ZTdIpeW8DED//mwmcuj41huuy8umde5w==
X-YMail-OSG: qqhJPAsVM1mKMCiM7fMFEtjmc3LTDFTcfwj6g3rvZezEOc_eN9s4GXzQWDU69.i
 puz0BUcOzNc3LGe_ha7HMTAIySNhZJquPdsvn3_ajRphWFNg46mdHFKHG2xF8vhOWF.ABsEliHL2
 _IQvK_Q7Y2AH_b1gE4eDHVAHsCVxdSXt8mSE05ZOb7QgvXOfkFuoufQWRw5HcDzO5HSPZzou4mOu
 kr9qDKm6DVxirIhg82vCymm98m1jgIbfkJEliFhXNA2jjO1Zz3EVuhbYllbgQENUn0xwSyT.o1FQ
 LZI0jLLbwT8BrsV0EGw905PHpluSblQDA.C0jRK.wF2tcT0YlMz.bi1YdXEQLFtaMwPJO.QGsdfd
 Pb0iEypNlnCHwqKRLyHVOnF8F.FnBAQea0OBbN9Y0YgpfeGDV8_SCH3JlpMBgxGctmUvQxPh864d
 mfy9KS7W0cHpW1ZiapW_7b0DU0Wdg8TiOhBlLdooGi1wm6jjTtjgSc_eGXCgDv7GfWlixx0VZ.wa
 3F8hyceYHn.nR1rvyvUVqGcbxl5j8u7kUnBrA_Usow_DB.42Rw9uReJypTC2.Jem8Q8hLqyb194Q
 iqeIfyKprBKG.9jxR03_7VHMLN4ZJQF0Nh8kCHDJUBRdH1ftDJWynGz0RD5lr8QYnbRzBuyqH48S
 PatwGvq4hfYwhTkbKVA6PIvnqQ4e1RS11Le_HM6LMozCeY.mgL2OY_eSuKHHVRoQ8g33bStqaxEX
 59pXiSxlx6T_szlpUhwJqnyY8UyddoB0j9VwWWXZsDytIbfvIyIAf5PJI7VfvvNSAEhwAM9_PvQ8
 3zzxe8TBJPld_W1ZSLcvKmeC9NnUTKLWEPrL_o_tPUOyg7MobuqLD8sxS9O4Ev8DzVLcOurraugz
 CbrxRcyNJTDYZOTAZ0Q5e.6XqGsqxWSkBsiPp68ssZY6GlbLDN2Ovw4KVWXegtPvwz4TpOZuYQ.r
 LyE6bSiOINbdsrrqwnQHI14xocgYykOb0qoMHnCWOealCXA3LHDFS5XMCDUj9nbtNyP6UJ2axY1n
 kw4BpQBDbXAmSd2U_6xgF14p5SXcJ.z8xy9M.F4FtcmMEX4p57XJ_C9T8phzXbKwP5zTvconEDw3
 DXJGm8aoAm0Gt7utMJfFBxh3S.92T9xcKTZf3OITEJQmNk652ySCbx6J6lOwyTVB3b5d.37xuqQ7
 NXUfeB9RKBraekXu6XV0ZXbjghe6sksHJ8JYBrpV0sdyiMAA48wJglX9UGaywNKLqQ1JZyv9mqp7
 DKLDqKR7dw9T2Sn8q9_sY599iyKoF9fYPqMOpc854MKeQHOxlyoqMbFZA850zc0dhGyWUuVyrpXl
 Q81yD5t0AoQP5D8OSt48RcmS5Fqjl1bO5QNMYA6Fo5xcCGiS.l1gIbnitEm6AeXvqSfvO.Hiv8bQ
 .0OwzP.D.FGYM.6FMm_HhvAXebLyo7OfC..T9uMW2vlv9h3vBhbBKd4X1JvgMdgQ99wMy1F8XP5w
 a6HVYnNFbofBpOdk20gR..RQePtAoybFZ_vpIiqRdJZytHPKtFNAHvbgKKdqBZYS_StFZuEIZb0o
 5eT9w8MCxQQdfPvwbdrDpWbgT0tE46oPGTAO8XrhJkSNXjt7go8.q1_DkgTqLOm9NkJFom_ZDuBB
 uNSLXjAtv3ktbITNv_asf2ktRzV.agd42A261aZHcVULi0NtVTxgOauxeatHBuIh_TKvS_nvYW2k
 9Yh.PbqgN_YTJLTw3NVGNIJ6C1aGbasxa9rtmvHphb4pKdi0jjR3WnqOusvQePAuvXpVREk1DGxW
 JVnt2uMFxehnyi.VIGfne12tWCSlJuogTyFccwCARH1pd70NLE6hoAefeUQBN77pl5thGdR10y9Y
 saNwpcoOoyqo3UtuZ_iMxSY5iDSMTaaxNTFLw05URUZxrsI2W2s5RG6m4zmY9mZsGrqCjVj9dXDe
 G7Skc.2BJNBuCTArlWuSA5Aycctc.g2k2V0N2xMWQgTCVYhjZTT8URdMzOxZka6XK0lnjEqRNO3U
 pi_NR4hp6iWnsGU343Kvv9o2NHva5slIB2eQnKNNjCELhGJRDo9JaE2yvuOf2tyVWfncnf7HB9jJ
 WiyEgloEG87y_rhL.t58AS0QlV_dr_6djXtVx3ihvkApHbGcMbFAmqKhXSpfcG87iIGyVDv.AD82
 Vx7NNTwYvyVqlaWzj7Vz60urTSu0nMKdr65_Xj_Lg6FFKX3qP2G3BMmYbSlK3Qp6W1fZquxoLA41
 F9Q--
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel IGD
Date: Wed, 26 Oct 2022 13:00:25 -0400
Message-Id: <cover.1666802059.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1666802059.git.brchuckz.ref@netscape.net>

This is a series of two patches:

The first fixes FTBFS when --enable-xen and --disable-xen-pci-passthrough
configure options are set with when building for the linux target os.

The second fixes a regression that was introduced many years ago with the
upgrade from the Qemu traditional device model that is still available
from xenbits.xen.org and based on very old Qemu version 0.10.2.

The regression is that the Qemu traditional device model reserves slot 2
for the Intel IGD on the PCI bus when the Intel IGD is passed through
to a Xen HVM domain, but the current Qemu upsream device model does not
and in fact results in a different slot assigned to the Intel IGD.

This behavior does not conform to the requirement that the Intel IGD must
be assigned to slot 2, as noted in docs/igd-assign.txt in the Qemu source
code: "IGD must be given address 02.0 on the PCI root bus in the VM."

I have used the second patch of the series for the past two years with
no problems. Without the patch, the reliability of PCI passthrough of the
Intel IGD to a Xen HVM guest is very poor, and in some cases the guest
fails to start without the patch.

v2: Remove From: <email address> tag at top of message

v3: No change to this cover letter since v2

Chuck Zmudzinski (2):
  xen/pt: fix syntax error that causes FTBFS in some configurations
  xen/pt: reserve PCI slot 2 for Intel igd-passthru

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/meson.build   |  2 +-
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.37.2


