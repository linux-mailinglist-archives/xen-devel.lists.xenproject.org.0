Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TIbZBistT2qRbgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 07:10:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0272CB2B
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 07:10:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=Y7XXAh1p;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357501.1611889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whh0g-0007bm-3l; Thu, 09 Jul 2026 05:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357501.1611889; Thu, 09 Jul 2026 05:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whh0g-0007Z7-1C; Thu, 09 Jul 2026 05:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1357501;
 Thu, 09 Jul 2026 05:09:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whh0f-0007Z1-6U
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 05:09:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whh0e-001k4z-CT
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:09:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4f2ce7-2eae-0a2a0a5409dd-0a2a450781b8-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:09:15 +0200
Received: from [98.137.69.32] (helo=sonic316-8.consmr.mail.gq1.yahoo.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4f2cfa-9c8e-0a2a45070019-628945208102-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:09:15 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 05:09:13 +0000
Received: by hermes--production-ne1-7568ccb994-mqdhs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID da73cafa7d25cff72b3b6899257e7b9a; 
 Thu, 09 Jul 2026 05:09:12 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783573753; bh=6kwiiz6vzXFsU52pONZLCow3uL6CNjnBbJwtIEwpgSY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Y7XXAh1pgxOLbetVg1cQAo2tZIkS8Wpy5RW7fz2FytRq5H1jFuI1o5uTU4rr08zWR6G88rXFj55UK20RC7/qMuBcmscehyK0nTXoTwKaqI8m7BX/Qh227TY2K79LLwDasa151k3ZqLCJAWc81Vfc/nha6bB5TyoZh3uc1CO6+TAo8LAMxmk4+pj8VRinJbb0LsBCUimR/DXtZYZ5upNkYOaOAmnNpGerbmjKQSUmD1fjWnYvIkqaUZkQoDgovZZ/XRuLX9bGUVtKsuEUCY0hzlOWXgNrGLM/TrtMtpIX7I0mRlX84WGWy/GTbqh9Yv8qr0t5oAloegKYjceGsYlsyA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783573753; bh=Ek45+OKSiXAcv9KamB7PZ78+mUV+bMCwUDE2T1wXqe9=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=YAAG6OWHIzrG7ailh8b+SKpRWY9Knnt97EHKef61a2Sl0XAFrT8d9QtHFjSvfWLVQPMsoc3nj300Koiujj8SQ91q5XYIjdvzmQ68LnSiK3hJGHeCJ4PQ4sYrfXdajuSFxYYras6cQ0BiuNm7ST49JBD16xnso9B6DVbafcNcgJazqACYV/sOjr2+u3CXCUrZGrlbKbdCqpRfKmZNOAOMsLd+jcDanFXQPVhsnCrPN5ne2cma4Ej8c05hfYJlulmg5RyzVHDvWc1WW0Fr8BrC23+9r6r/CDFZtPj9E2A2z9CxoAOHq210bs3MS2l6ndpNq8vVj95fxWs5e2Q2y8jOHQ==
X-YMail-OSG: LxuUNu4VM1nbkAESYw17s7ue58ruNL2157YCsZ9.hRe3OyY4SrQOjJHQPkUgmJ7
 HT.xlgKkrTd.Wev5uGNaT5kCxO4_pQj2p5Q34tIwouv03MOnL_psQC9.xxVJnfkwa96vcZvjcabS
 BddlNPjOEiN9Owjw65QdwCLzbSUWOqTc0r_lOmgvOyOB6R17cW4YzeiW.YWLMHOW9tK3HtX5E.Wj
 ePzkcNefNdRjDyp5QEBXcpp8LnArRQ4cWAwKgGo9dzQg3eU5cx7.l7TgclFV3C69l73RC5WBZBNm
 oUOSHrXQilsMVEUU1SgF.5ACgOgy4tcxCrIslceMJSWPkIY4Rg4A4k7Z8YuK5XQuhvdAd4v_9vFs
 tPBYgmusek4wLwc2Oy78QmEmUj4Lb.wLLjj3y6WSPqaH_9qi7k4JxrCJWOAX9z1MR86ajXFFCsvP
 TUDW4hAg5oK8enMJP4VaZe_kFBWai6UxSoNSL_4UsQO6z3xnlX7JoM89X8etEj.MOjp9Vm5qdssZ
 048Ittba2zbBTAr2pwz8zQ38_3PZwLKTdL71Gg9eR_Yq2UVg7gtv6HNeDgOErCrxyXYqmdn.vUch
 6GCeqish24L6a6AJre3jgJe2oKaKdl9Zt_pW2WUa7UVyW91aAFtmYqzxZDz3jlQJjBWHAQulaQTY
 4g5FJXSU4l52S5f0DDj_aURb58CxsWsrL07i9ffjG9vFQePK.XCasPlIlcnwAXLnIm2qh.bZ_nFi
 BojN4GnfY2oz.wj9H2.R8KuXuvt3rmqPiT5vWzdom.LC4Mu6uTcIuoCTfhK.sz0pzp8jZC.IGuKp
 db2c4bfu3QGxLS7Nxlv_QeVfWvkQEFBT5FPR0FZFbuUHEbWaSs1Mt6WmgfMfbxU7eqI9lKaXEGPg
 ob095DghtCeDPwfvPIAJxAqDbHV7FBCx9uZ0QphZVPtE12eUqhXCHsR3kBDe1jv2zWf3YByWWmR6
 OAMFJyofU1GPVTtUjjFJj0ck4nfKPSNFUOQqM57hvF5qEiO1lFJJSN97Z4IFZkUlm0Tq9C9pqBR5
 cr.QHFXXFHxisMx5uiOzn7cNc2AiaGlCxuN63DHUcxjiflN96iPh15KhsCUb8.uM1XhA8XpuKF6R
 mH39Fji.RUfGGxRYXyx_LRAA14Q1a6Ikr5Ay55.MM_WuecwbizGW1qxwkBjRf60wdPwtNHK4zMT.
 nru85l_P2XUAjq0hs8xWssq6PjAjZaBTgZKbrrFVrH9yLR_qNsNo1GLMSKZbiVquylK2MYMZF1HL
 d0NWHiyf7S4B.RfqxElTnANhQf4kVF5aD0mQLxxObJXdAqM4eSAX7fSQVFW7X94jqxECKyRzJ6vy
 kNf470kzEz73s5Qhj_brHwG3.SQ1MY7jnBzUOogDl9V1cfzQxC9dmQdPPm_d1d.3H9SXUxQLjtkl
 N4FWNmHjGJMsp7qglL_iSc99KEIJ35VRDefjCyTFIYvihHmoOEuBbjfpTDFKkLOS6IKBobDoQyzM
 1DqnTg4PMoKi_IEocRSmbKLa0LaCWOEthVPiDqHSfAbaLQTO3BoA4vnhB78mtga_BAWkvdX_2Amf
 XBsptAwt6bjGNC_0sTLM2IppcCs0QJ_7ll_REj69L00zzfw0du9A9wcjuJrtH_2gEBIkwIwgE59y
 abShkIkuMR8mhwu3jKJ.obzQVOW_M57yDqgnunbPCImjwUdzTeXVoxHFNtGoUHNQF4OccE8ZMVfe
 Ub8QBCMYBjgt7duZrvfvc6gO9VYsH6TWriZVisRnGdBEWEgZJ7JrkJ0X_B0viUJBPaLvF.0fNurb
 MMXeStp7q8sIHiz2_qZvWW_mtj_8YCmnuU8CCdsUPFsbZjuAA.Zw5SOr6Zftx.PcTZS8NhIdLoAH
 pyBtQto.mqqI2XxwW0jdXYrfGl64y9EF.mn6w5sEOtjcqTYdqM_eInGP4U69y3QpCif.H6UaOR6C
 FOUnZMEVRBaB1Y3TOVTzM_aGWILpZtNcoL9eEUHsZ_vCIIZz4vJdJ3yDIYLwvbOzY6wtZqkhemRg
 DqPNpQn7RDrmQiOlnN4wsvOu3J1aRnsUI.DjNMRhmaS3exCJqOmQVwpI7uLfiCi2.wn_NOHAHBx0
 E502eniGqctY4ohr_A8iYZN61USvBs1KE9pTHlBOww5hGrNzPNxNTCThx_KWc9S4PY4wGcEj4_um
 HyIA3L_3ZNqG4iE6OPLuBiqsAReKFwKAVuSHnwNgKwsj6FOU_mCRFLs2EbH6mmd1ymOyAPy5k2wN
 oTrCpQnLIuRn8o4IIxeQi7WXgzCph
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 5bcfd46a-86cc-45df-a695-4da8c90a8007
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 0/3] xen/igd: fixes for Intel IGD passthrough
Date: Thu,  9 Jul 2026 01:09:07 -0400
Message-ID: <20260709050910.8217-1-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260709050910.8217-1-brchuckz.ref@aol.com>
X-purgate-ID: tlsNG-ef75cf/1783573755-FCD2C25E-62A4DFB6/0/0
X-purgate-type: clean
X-purgate-size: 1070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: A2B0272CB2B

This patch series aims to fix long-standing bugs that need
to be backported to all currently supported stable versions.

This series fixes three bugs that cause problems ranging from
a dark screen in the guest until the guest OS graphics drivers
are loaded to an assert failure that prevents the guest from
starting.

To test these patches, it is necessary to test with older Intel
IGD devices that have support for legacy VGA bios.

The patches have been tested using Xen 4.21 and Seabios 1.17
on Fedora 44 using an Intel NUC7i5BNK with an i5-7260U processor
and have been verified to fix the bugs as described in the
individual patches.

Chuck Zmudzinski (3):
  xen/igd: get PCH info from host sysfs
  xen/igd: don't register rom bar twice
  xen/igd: fixup device id before registering rom

 hw/xen/xen_pt.c          |  5 ++-
 hw/xen/xen_pt_graphics.c | 85 ++++++++++++++++++++++++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 18 ++++++---
 include/hw/xen/xen_igd.h |  3 +-
 4 files changed, 99 insertions(+), 12 deletions(-)

-- 
2.52.0


