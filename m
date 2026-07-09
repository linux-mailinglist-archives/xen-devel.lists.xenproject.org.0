Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WrrYKR7qT2rHqAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:36:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57719734535
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:36:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=OgKTMquD;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358454.1612555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtar-0003dq-QK; Thu, 09 Jul 2026 18:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358454.1612555; Thu, 09 Jul 2026 18:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtar-0003cR-NJ; Thu, 09 Jul 2026 18:35:29 +0000
Received: by outflank-mailman (input) for mailman id 1358454;
 Thu, 09 Jul 2026 18:35:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whtaq-0003c8-1s
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:35:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whtap-003m4z-6m
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 20:35:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fe9ca-bab6-0a2a0a5309dd-0a2a450a9ac2-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:35:26 +0200
Received: from [98.137.69.83] (helo=sonic314-20.consmr.mail.gq1.yahoo.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fe9ed-ec7d-0a2a450a0019-62894553875c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:35:26 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 18:35:24 +0000
Received: by hermes--production-ne1-7568ccb994-fjmzg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 910e3b4d72a347495c18993f77062a0e; 
 Thu, 09 Jul 2026 18:35:22 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783622124; bh=fhRf3JXRumlxIz5yKMV8dJMfO0BC+czU20wlGumg1eI=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=OgKTMquDMTrsCsgbyr/lZI9CMmP6cr5kFKT9rQjoMcklC6WPWeNuTV5aGyYigIiTy2C4nWvUcMLvFEgZ0et27x6Lhu3jm95uu28s3u24NUZwTEnS0HI9aw0OhfJLYKhgjlUjNFq6Rs/Jh6YswYcTUfX3ub0SWG9K36XryuLNlIbvRs712Md2CNTTXo7tes/tJYZqL5vsPSFGJijpo4WlcYurjLtdukA8hfkyG02VdFwJODewNv9XSa3Yn1gV91NenXafsZwvDILdGpqF7hd4VzD/NAza0jA/r+fjLonc4M3AiM4UgKWn+EhfoVzuMW9AfegPNAp3apYDhnH3sYnRdQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783622124; bh=Fxl9JSWtFg22iJgekLWhHRW+keyQqc/ymx0xSqxvrtY=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ALfQMvQdY2ivsfq4jOPVmKRw9mj9jCEyUYG2XMLjL5A9RMQzWaIrgew3zzIJk5oAbDZMsFfK5X0P2AtFLv57s6/Cnwn+pOn+lV+BjyK4Ibdiu1NcAcuDgJxNfVKn9Kj5ZHh+41RVOItO7MEsuENEosMugpvDZzl24vKoZrJLCoG1AVvTHlpx0vBMJL0CbaU9KjuixxqxyLQdiiGqdZP/9/dbPAWMoiAfxd4V6HYtZBbd05XS+Kn5xqK9fWam9ieSdiISJrbzOLFKmIDnSst9evSpeRUXM2PjULqbavipFeYodSSm/favCMNiW9AOU6uywRgju8lvYAstjP94TaTzKA==
X-YMail-OSG: 4vtytHcVM1mTYVbczyB0ZzzbPW8QMAw3YIayICRq6WXMla4mpjNEdHsJcIM6C6j
 Fvl4oi6GGVU4EIgdm4bIQHEYnVNQ0I.vzaM3JA37eWfPyEzIgT0Z4GjlhioFVWhhcfTuDIoBEn9r
 EvkELIOWA_SGIVDhYZkoGBAME2fE87Y6J2CPC.009hQ3m3OXFQC9wsYAK7AUbi.xHbS9pnzRfiAj
 xwogK7WBwQtr.qKBnRWcGhQazm8PpMs.DFZvzUUk77qjEhwhL8TO2MK7cLSEnB7eUP.UQk08bPFH
 WVK01Z3zv5EpqBjabzEcpKa5P8d8Wgb.qkej89OYFkTiv31swSQ.1vvpfuAlIs9gl.6C25jVjwcH
 XHCJc9cV9xbUZArcsk8oRaoAgke2bJIlf6rtiDNvfB.EQBJ1HjPlIaoo5QG6hJGtWjoPixWjOk4Y
 V.VVo2y19LgaNjpQ7vJT_70wqTFwp453cEafE5HIKFqx5p.9fH5pU3K_GezfX6Jqce3JrFrUxBE3
 nJQA7TL8ASkFNpyQydCzWG4bYSQUg63_dDGz9vtupWthmdDmnAaLPifZOObrarE3pxeHPkms2Ozd
 PAgztQ9xEocNvac6R8k5duarFABkiT6Z4pGkaGDG2_AGrVn0hQgexHfUceZaKp0FrXYXnEqzPVyZ
 tL15TcggNea_yLzwsKtJrC.Gm5UIml0jK.oQl4Mb11SI1Cp5GyOrdcwrXU4.twPVKPw5cWCOhOxe
 hwZ3AfnznynhB_voqw7op8kKUEP_d7ZuJfs.Yrz1j2DxYO8jnyLQ.ro.IvcIZcWU_tLlFogxTEkF
 mHJIGYOGFPHcUFOOVA3BCsm4U.nR6O.THiCE4LNfgzXZmImBr1AS8CuKIQfXljpsi7SggyTG_.g0
 vD0UMyOIXc5N8KFr3QpS4Kfu00UZ.PRcOUY9CNQPeJm2lx_v.bFYtA3dwfwHbZBmQV4Mhcs0ZhWR
 t.0F5D_pXPX2wBuaKlQr7zk48HTRBf_624hcaTHUgNwPSyHWi5_Be8yD.NsWJFSl6yoyFV.qtiT5
 RGUD1BQ16_9AMCVAiG7x2Vr0d8ESYQmmbFoKb8d3NzZfCGIt83I.l.wMeJZEb8rxG6HL7TD4EEms
 tne7Rs1MTqXuKVZ__RCYjm6PvYwuVUJE2PYSF_R3a_lri5uqZzREr_CkAgbM.J4k0ZnL8xIWzWFJ
 DWE1nXf4OoKiVq0GZviZbhRAKK7zntfQ9eKd7O4YVSzaGmgZuKpND5JRswHrcL8ODP2j4CS81NE0
 g.tIjXq1PfVLsExnm7W_Qo2AZgDjx8MdXFwwl6Xl6pwkSZl_7SfZ4h8SA9QcTPMI9nx8lDlqq0MC
 g49Jt6vB.kSaT12FUZdgatV_AXup7gA8sz3rUV4QtFniyJ4_diatfhi_CAkrVqgtyS4tcplC_Qsw
 ZV2w0kdAdKWkdr9hAdDRHbQ4e5_GuyGbnFbBd0tGpy39xGQq26qMPl9kszaewEF9KmTNfNQRA68m
 _Zy1S_T6pt8jutSSqK_1t0sm.60fHkdSgyA5Hi6e1MbnFBRZyT0KMRgKnWuTY91TR2_WwCWVtvGA
 zdN2wJWvgltabwGqZSokj6TmxgQHGqPb8NVkdJeLXCgp2LmCoi1xG2a43pvcnitQ_b8vjFU3966o
 X87eap9Bv6GroTPlMzsxVCvfzr6tF0EXVUePtLvX6FS_WOgbsQKgwZD6GBQ5pwirphixd8Cm72.R
 ejFiQDXD9Vaisf.yIEiNsOiMJJ4E_v6Mj0MZqeWgNuh_zvuTv9gQ8i_mn3Y_kwg95IvUyNc3hIoq
 WvcCsqznKYwO.LpCdrePqVb_zIOM0zUwaqcF7gVubGyiK_wlGgXdbSlrUnPAUVFD_zhELWPQgdTk
 4h7KvkUZoaCXMe5tQgsKhEpXnAGgL.t_bq47wkHGglcvI2bKyVzoiE6gQNDmYKL_XLr_bowz3lSf
 o8Y8FGKAtBdOur.jJkCPKPZAGspiJtLbKg1.T9eItPkiUrOK7p.MqRCIRykYU68pED.UMzuBxY1G
 zSBawtqcaBTsZXLpkkKKpEmzFDrdmM_mVeZtRDEoc_6kaFMVVPTXyQGvgqSYkLtOAb9xCnGTkIcq
 _08Zb8bcwFpdUf_9ozREQxpKFErCE_bZ4lCGeYmUu_DPTeqJk6FqUoqW8gyvoNY379mtSqZWCK0X
 qgkAW8M5n8Qpvs_ILk553K_6CeJSRwjmJzH2OJEH0IPXZZ_0X2G5ugPYkm0jm03fU8ppsqxUxCcm
 PDQnsHjwIsgdKt__6TzOmJFn_6PltgZM50WAqEHHJ
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: ff122649-501c-4d3c-8192-01dd0a2a047a
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v3 2/3] xen/igd: don't register rom bar twice
Date: Thu,  9 Jul 2026 14:35:15 -0400
Message-ID: <20260709183517.25866-3-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709183517.25866-1-brchuckz@aol.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783622126-3F168248-DA5E1F8D/0/0
X-purgate-type: clean
X-purgate-size: 1484
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:qemu-stable@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nongnu.org,lists.xenproject.org,kernel.org,xenproject.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[aol.com:+];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57719734535

This also fixes a failed assertion in pci [1] for Qemu
version 10 and higher when passing through an Intel
IGD with an option ROM to the guest.

[1] f6fc01c ("hw/pci: Assert a bar is not registered multiple times")

Fixes: 881213f ("xen, gfx passthrough: retrieve VGA BIOS to work")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v2:
  - get 'pcibus_t romsize' instead of 'PCIIORegion region'
  - move definition of romsize to the top of the function
    and make it constant
  - add stable to Cc list

Changes in v3:
  - fix Cc address for qemu-stable

 hw/xen/xen_pt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 474606e..8b30b61 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -459,6 +459,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
 {
     int i = 0;
     XenHostPCIDevice *d = &s->real_device;
+    const pcibus_t romsize = s->dev.io_regions[PCI_ROM_SLOT].size;
 
     /* Register PIO/MMIO BARs */
     for (i = 0; i < PCI_ROM_SLOT; i++) {
@@ -495,7 +496,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
     }
 
     /* Register expansion ROM address */
-    if (d->rom.base_addr && d->rom.size) {
+    if (!romsize && d->rom.base_addr && d->rom.size) {
         uint32_t bar_data = 0;
 
         /* Re-set BAR reported by OS, otherwise ROM can't be read. */
-- 
2.52.0


