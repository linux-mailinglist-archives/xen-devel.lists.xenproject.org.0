Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5TtjGSstT2qUbgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 07:10:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0272CB35
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 07:10:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=FbvF4Bxm;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357502.1611899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whh0n-0007pA-B9; Thu, 09 Jul 2026 05:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357502.1611899; Thu, 09 Jul 2026 05:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whh0n-0007ms-7C; Thu, 09 Jul 2026 05:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1357502;
 Thu, 09 Jul 2026 05:09:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whh0l-0007mK-Kc
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 05:09:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whh0l-00C5RT-1K
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:09:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4f2ce5-5cb7-0a2a0a5109dd-0a2a45039e8e-16
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:09:22 +0200
Received: from [98.137.69.206] (helo=sonic312-25.consmr.mail.gq1.yahoo.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4f2d01-ec1a-0a2a45030019-628945ceae8e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:09:22 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 05:09:20 +0000
Received: by hermes--production-ne1-7568ccb994-mqdhs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID da73cafa7d25cff72b3b6899257e7b9a; 
 Thu, 09 Jul 2026 05:09:15 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783573760; bh=m2Glp8wi3kwkb5QhxQq01xhDsLdInXw/WE9Th4YGj7w=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=FbvF4Bxmi4Ci6Hv5xb+vV9U71ad2my3dCMUodg1CzrUK0YkET7hCIqlBDdPU3pkDG/Iv5g/VussMG/VmAbVqCIcGPZC+JMvayAiXf5WDNJb2h4zgoM/ntZkK5O/AWYppIJPchITFOucd54cmEi/Cj1G//islK+0s/X4Yx3tlWLc41VdrCA4KBPDRm861hn4PzNOjPHkVxMrmTctlVAc0BDGtrdtbn42TrfQjiB6lsdiPT1cphgWH2kNQkhR3FKNMJPddS7h4ZxF+QRVVwaQJbiVk6vNpjf279ikqwrI7c5rKjVi7exCMIdurlvauzbBKDgjbs+xYMeBj7xf4IOEAUw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783573760; bh=OHOrD+3w7dGTNtdsk72dzU4E9ANMJiTyFgbcK/ru5tX=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=OHuxLpznchqCXBF6RtQMf2NIwJ19nUIsa3CGjThqzYm7nPRJcYXYFpA2Z6KWU3kQpwuakhUlxS/ah/CzYWT4Tyg4SwFjQACG2RDnlk3Qw2DcqZbJtDSdE30RTGxP6Buymn/tP+LKDIb7g01Ky7moCG2WMtYeJWOljhtuykzlMqdg1navdJF1ewiHNGxRPfCc/ir7PKJJmKPUEYwVpg+MxR+wjcQZy+xgJCVv+QaRbZbdMliJfebMskt+c3ZYmi+wMkh1RHZuvWm/WH9e/4fNE5O+6hc99gbNErHv6okok+kl12ZVtr7C1+HmdzRvl1cRcb8dErMBmGrXesL19oXPSg==
X-YMail-OSG: L5_GXkAVM1nr5wX1RW1uU2hcTkTL5jxrxlRzDHwzSHFq5_HwNoSPzHMb8STgzcV
 Yyd_gnqlenOiF1AY_3yYVjoQWQoZ_uNHJaR.nKgmQj.C19VGRrFcPDa5o1N3i3B_.KqzUYh2mHtX
 sAzhM03LHWV4aJ4vAnyR6ujvYXhSzrrFAFUuxt2cx_WFC05Okt49awJxOPfN_wazg.AdP94d8seO
 8RSMVM7YJTLmfsr40dbLkpHx_D.tKNat5.SyWKckIuWn_umVtnfBrYERURZtzD.N0XdzH8sYwYzf
 sWhbMUIs7bWczklFk_UmC7.kpxhnlpabdrFkZHuHK5jMz8y5cgILVPzy9vtuK9lisoBCBlTjKGfn
 Gvi2WTQcVALyD_ptbvc3BMAOPgqmCqHadwN.Lbr7LMnkqja4jTAaWO5xNh9g7el.MjVBdWepBYo8
 gZRrWcBo_vIPjqUNtiJZ_EbmSi0qQwCsw6m62TOwAETg12oJN9ZSXr9pqzg6TKmjR_Z6y92ihN6V
 Ss9C.8XDLdv3p44a4gJLlWi7TCgV1vsbhaK2RGIh9HR1UNIN1TF94zWyMtgmeCKHjiRA6AEWkS8n
 QGaVwWN9uMd.kI29ZRFjxK216DRYLX_Qw.zj0a3shDbTjF.gxsTnOQ8H0Xe8BJGdmuCad6N_t9pG
 DF6l7ypmnCE3emzN9AVnLbbX.zv9dtEsGxiIFwcSlV8TduaFKooso8MG.qvKhX4J2JEO2JKsnfwa
 jLJfobfyjHgs7fXmlvYV5RDSXZJojuhaOU7iGejpk7ClVExPE8dXuBMnjuDwq.ysmSlV7qEWsOeH
 ok7YRUeItqjtjoCEeIo5nK8W4Nw1TvNpYil8.dyGCF0v14BeRQRdZkwguTWtmdIZLZp7jAgHgF9f
 pQCfEqeCxKBzfduyoJi8cnwdKX_LXspB_FpGmqaHfTKWFqy1K9MwedNzzQXY5Gd0ZQa_5AZsUrCt
 e7TcXGUEXSZORJiDctmy5mu3iLb33mY0N2t5e7t3Yo2yiYkbcTtJPXY7pHkMBnCFwRUW3JYdHvfQ
 SGz_JMwYSqXv_I5RbYcTU6XPP4IPLwfjkPVcKrQSnmWmR47JlUhgdLKaTgyfBc_IgIIWRbgHAW6J
 8qFSy.w.HS5n.7QGSxFaVtj9aoVxQUEkG42H36aeetCAnuXi1Nk8YaOxDze6PJvQJSL38pNgXxJu
 nkKdjrxwU5ylYAY5fw6HghbfBdEIESP1KcwuDarYYDasevuC_FJHJDZHHEDblaBc1m9BQN1wpLuT
 UjgJ61wLo9IjPodH7i2rREGENSSwTLDECAaV9HAdzSlk3pf1doOKxvuzvybj5_16zKGHc1wGg.03
 2qezvglC5gqQvS7HYl0AVSfeHOUptynWmRiZNO0R5GmpQEMxEd3LhCWDNR1PCnu64yYbUcfrkXD8
 1rorrNdnIAGCj19eXyv01Pn0AqvoIkC7nTGc5zHlTx08LLs.rdeaqmWjmkq7QyJ5Y2PMVPbioXcb
 uE8BP7d.j3CJTCy6OVl1_oVjUfxSTNw9ByU_lRyOw_e_xVczdvCo48fv6Z4sbDxO2MDPafp_bOxP
 PiPvA5vcBxwt4IkBzs6E_IS.8nE8ng5qnegOTvGcUMFxKCDelcZCMWsrVWe2qyYVCgfA8OShayj4
 Lo_ms74hnzfofMLExuISnkcgTNpx7zArfeW8OumP16QT3325IXZ_UNXn0uU00ZVeJAfcei3LfTnP
 FaoV01zWVo_gdalXvsaJSVqoBVYGLAkuMmt6oNNlYzL31LGIM.o8Zliipn1_iWa8HD3zKS16EV6i
 Dk8ZMiJ.xSSdmVfY_j4YiURA3dO6u1enbkCdLlEAcwmK3bikBCdPTR97g0slJZfUevKLKTbUgY5e
 UWfaib2qa7p527R55cJ38hyjumN0KmViOGCek.s.8zNEIuZLvydXERedbQYYvA7u.abodpj.suYJ
 i22rgC0UQuO5W3sRaG__zjNtXkn1_vYvLI.9y5ENh12ySOqChsm1ApNRtokTUkGllqCJN0d3t0vw
 _XBF5Nz13Tfpby4u9UzO._q.Sp2ZH2HZCenixsqk0J_9N4sBhKSiZZdOUHMdWsrdmoRu28PpbUT.
 RxeXlXLOzTwn0hZGd7oCNO7bEVquusAPQ.CG_Yt5lhOA9Ms5w2.FNaccbpyTo5DP48J1rKSc_XSz
 pugRh8c2xQVdH6JSkAo6HpLvL2hnk2J9HXNT9bMcVD7HssN7KF4FxsIE_bLQeHV9D6HLoj8fwbxb
 icQFb6VHbn_uTiy74g3kcy5Hmb7L0QydR
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: ed7a79c6-6a0d-46f1-b36a-b1ea89bd3ebf
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 2/3] xen/igd: don't register rom bar twice
Date: Thu,  9 Jul 2026 01:09:09 -0400
Message-ID: <20260709050910.8217-3-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709050910.8217-1-brchuckz@aol.com>
References: <20260709050910.8217-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1783573762-BD1BE5D1-2BDC9F9C/0/0
X-purgate-type: clean
X-purgate-size: 990
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,gmail.com];
	DKIM_TRACE(0.00)[aol.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55A0272CB35

This also fixes a failed assertion in pci [1] for Qemu
version 10 and higher when passing through an Intel
IGD with an option ROM to the guest.

[1] f6fc01c ("hw/pci: Assert a bar is not registered multiple times")

Fixes: 881213f ("xen, gfx passthrough: retrieve VGA BIOS to work")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 hw/xen/xen_pt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 474606e..c3b6c1e 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -495,7 +495,8 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
     }
 
     /* Register expansion ROM address */
-    if (d->rom.base_addr && d->rom.size) {
+    PCIIORegion region = s->dev.io_regions[PCI_ROM_SLOT];
+    if (!region.size && d->rom.base_addr && d->rom.size) {
         uint32_t bar_data = 0;
 
         /* Re-set BAR reported by OS, otherwise ROM can't be read. */
-- 
2.52.0


