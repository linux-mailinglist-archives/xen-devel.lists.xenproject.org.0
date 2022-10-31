Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98579614000
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 22:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433213.686101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcS5-0006DE-UD; Mon, 31 Oct 2022 21:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433213.686101; Mon, 31 Oct 2022 21:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opcS5-0006AN-RS; Mon, 31 Oct 2022 21:36:13 +0000
Received: by outflank-mailman (input) for mailman id 433213;
 Mon, 31 Oct 2022 21:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2TDv=3A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1opcS3-0006AC-Kx
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 21:36:12 +0000
Received: from sonic311-24.consmr.mail.gq1.yahoo.com
 (sonic311-24.consmr.mail.gq1.yahoo.com [98.137.65.205])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07312e52-5964-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 22:36:08 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Mon, 31 Oct 2022 21:36:06 +0000
Received: by hermes--production-ne1-c47ffd5f5-2l5gs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d450870d12d3f727fe97841ca3633d5; 
 Mon, 31 Oct 2022 21:36:03 +0000 (UTC)
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
X-Inumbo-ID: 07312e52-5964-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1667252166; bh=uxOwrD0U0H546e379z6pIj7ishCHeKXz2cYS+K7ZCSA=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=t4PsUBVbL+tFKr+SCIjGYKBa8LZKNdOhXiAlD8Ly2GVIw9xKKr7GAb6WLl8nkGWlL9rdNykimQXvuey826Pa902P/J+FkhDiPMR8A7yagH3KB2HywKVEc2YKSBHVehmvz3F7xcGkQnDXmp/Jc+0/izPD+GctV5hyPFJsMXGC5SV/MX6leP/eGcEhfahXzR5uoM9ojxit7mD9uSuh99+SYGUhuuS+dxHhgrO6pGQfoCH9bFoKy4NoFksxRYVc20PrSsWwXydXXXi4kdPe6/azfT8a5TuQDdoXQG9YnqIpFSdPefMnP09w8JstPUX8iMASOrXJKDnk2qaSz9jPJXUcmw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1667252166; bh=LRLXbF/s7/ITJbULB0qtJPEFf5qS9irXKOaTvElYx3I=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=QQqxT1+t3wWPEZ2YuPMqeG2lGig4FKsOxCc7iSM9SioH2/08Bri9fGMg0QMvnpo9jYMRhD5u7RCGJrbUq1FnZrVyHS6JsIMf/UbF1G2mtDBxOfkMU40FdBg5O3dZaqq4NZ6HAB5TTM/k0Zu7PxEyeyUi851bTcfkt178HNSU5CnltRmT10j+A8+On8/su50CwENmzIhYlyhW20bySUAX3bvxeKuZRTSqzeC5OUMZPMXIpfIn8JDBmTu8wer/FAsUcdKFvQe26ikGjQj4KXPfxG7W32lxgo2rLmsMrunrJctLBjV1AKXqL5LRX6KLrXQnbUWVMgFL9Prq5DNHk6lZ3g==
X-YMail-OSG: TrYy9g4VM1lWmXA0S3_Txh3IolAWizPT4cc1wBKX7DrboJBnewHToGBPbqJPiPo
 LXMUjBKN5dm.y1mMxLx9T2IGrHqRf3SqMpk9y6rvyTQFmJA8B41Z_DFJYaZW1rHhXKS9.L8pvtMS
 Kkoiv4BozHwDZZQmccnwgSaxoNyTGE0rqPFJzHbi2xThVJjb4byFJuafxtCqPV5OqxtwL9fvnQrL
 sTJ8zX2ymlG7.XouBq3yacHDhNiy.tFsMxjVvNzyJf4JAQCWGbKID4qrYHDMay7NFu5h1.4Cb4ga
 0psVCajKZyyf44HNZK0kC2ade4VSY4_tugvos_pxPkiOW3vaZyswY0Uq8BnEMozX3_phlA3yGJCv
 8yPybUXO5m4UHWmAO7PA8cOIFZ9XMzs2QbGrL.qm9H759_qFoajVGY6WiJ0.s.ydWDCg.HORmg27
 mBV7ZMeP0Q4750mJ9wLnnDcsSSEu.rwUOYgjjUzdkBeYyfTk6Bbe0OHwTglbUrjio3ETGIFJiXeD
 xTHm022rg7ZwKUnFeej1WZm18egsamcIB5_WVrvgrwfGURLCy8kAV7a3H3W5KH09Rkw.PVtRVovU
 GqPioWEuCEaBIWRc1aQgn_ZEaq15.dcGdwHa.qv298TQh6_MjHWIkQpp7XU6C0T.sm.aHh5Lyqdl
 C20.D54OoO0QSONrV8iXWza8n2wRys04kfknXiTqvpCp0.eYShKOMFoziAfWnjGsXe86cvlfyXUc
 odxYs6Xyy59JPo.G0z4SQYh6freIDjoVHxOaeMWYMN90eBYviYHozk_k29lv.KAptbL_LUFpH0L4
 bAIwDI9SR5CEaHS8jwKgCazVYg4ikOwsT4nu_h5gPJpmqeCfc6cpI.GVjZyzhWpXcdbZEXrPlxZN
 _qiQEh4xC21.VX7HhTvZZplbAF1eYT1j5j_NgW7vFg8RM5p7Q2oJud6hZl2_6v28OaIJhsDOv8sL
 Q446JpUE4klxwh9SxmGKEML_XeI5nZq2An3EuqYcGEIeZA8pNrheJxkcRWAF.mNSMDW7U2MdEQaS
 j.ZV1VLD9rIdfpM0xLiR8kIzYbYuetma6LuMzjkJScWwCcycCZygchycab4qsyNJ4mffmV9mmu7F
 qm8ooHzGqKFwpJU465pOc8u1gq40A1.BULOaYPMl9GRGRzr6uDQemUv8ohh5BGNi1DWj_l3zT8jB
 toKO8L__YcHil8ozB6vs4vRJEPgZTEf9qfOhmyxhqPniaKVzRRiTk5C4C0FhUmsoYxTQLJdVTLqV
 5cNzrNcntCMZKWFf_kiyqFzfxTgZ0yPgKM59L6alBoJUYEMlVwVQG5YWX7WekrTJyQ9uYWgWPpR3
 jLuE6x1AR8eCh_mN8uScWvTOIPd3I0FMTve8palMJNu0CMfkE.39yXp3QaFgeWlFSTYVoCaywAlv
 Wse2_IpIorDjOaqntZKad2_rD5aHknHNk0va96TLeisApzPCr4ncGMfZ_d_M68WlH.3lWzMkt1o_
 hNK1G40PYdvZdQh3XTOGVeQ1GcZtdtgvaHnkhiIrP8alfI5Wwa6RdxJEpeqbKCWJDtIvHwMaZE3l
 MdBzCfeZSLhwIfpHt.X2oYMNJU5SKPUh3xEqtn6T_IDLSkgu090iMUttM7tOnM_XRCAuctKqBEAr
 CnZauTtEeAh4yaqsLbfhy7058VL.L0fxbHp2tRNH4ROxc49.3orrEa1VPxppwtxqvm5Kdj1wJDkO
 SC3tKXYb25Kd8Netz5e7XEkqvgmArlgywyY1GH7ssOqZy.4cnyVstaI_4WEqR4ORvLDtKfzGO7Cr
 _b5ivGFcn8Bh9UI0mxDU33YlraZmWDSumETmG012Bu2iiILcOilXBAANYjKehG9h2GZSIYVNra21
 ovQelIX6fsXibhAXFvhulszrRAEc4RHKHFsipYcAa0VlwcUhAMQF9HecxOboBmJ.WyW34YqIhC.Q
 uEghrocvcRGcqCVNHbQRyEPZDXq7TksBpUZak_xTNYQLDxch.4gT3fUCfSWr3CzodhAWpoEOsGpJ
 q2qXPOFfRpy_t8DgB5mj35appz66z1SOgk4j7KO8M0PJZrfizhBnDUG9RtwOJnp.wkrkVVgTcA8B
 qwcwgYvq3mGi5BTl.bBZP0F.nmyaZz7LUGdvvU9me9lercry3L2sMLzYGIeYzWwLWDMsOBPTfCfk
 3Tr3f6FIEJHFKkfFdl9cE_.CeKJUogSbzcanBSVPIru89S6BkQ8OP4UcUMuqfPeidrs1uXpitkQg
 ftLSUzf0-
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
Subject: [PATCH v4 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel IGD
Date: Mon, 31 Oct 2022 17:35:51 -0400
Message-Id: <cover.1667242033.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1667242033.git.brchuckz.ref@aol.com>

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

v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
    email address to match the address used by the same author in commits
    be9c61da and c0e86b76 

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


