Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yycADx3qT2rEqAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:36:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB773452B
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:36:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=suhQKlaw;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358455.1612560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtas-0003iX-0j; Thu, 09 Jul 2026 18:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358455.1612560; Thu, 09 Jul 2026 18:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtar-0003dv-U6; Thu, 09 Jul 2026 18:35:29 +0000
Received: by outflank-mailman (input) for mailman id 1358455;
 Thu, 09 Jul 2026 18:35:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whtaq-0003cA-03
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:35:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whtap-00CZrX-CN
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 20:35:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fe99b-2eae-0a2a0a5409dd-0a2a4508b8aa-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:35:26 +0200
Received: from [98.137.68.31] (helo=sonic308-55.consmr.mail.gq1.yahoo.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fe9ed-ee29-0a2a45080019-6289441fb079-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:35:26 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 18:35:24 +0000
Received: by hermes--production-ne1-7568ccb994-fjmzg (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 910e3b4d72a347495c18993f77062a0e; 
 Thu, 09 Jul 2026 18:35:18 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783622124; bh=6pmAJjcUB5q8haQTvbnM0zogdQ5zH/eTiLvwW+j9fm8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=suhQKlawReJfhHuDdVMiNiIWTqvx5x2xbaHPLkGg6xExVCKMGgH1K26YqsDcIbi5w+2w7RSqQFagUGActkNL+cE3nVpyp/FSw8brXuo3wyXnEp+sSiiXL/bWFpNN2upwudI+k8QDtrVrUecy7lILVObvU7QHTSA8HM0Ta6dz8E7GjvLLwQSI6ut4HRbTva45MmAgLgK2uYFpeu4iNPSZJaekvpbBQgiFQhNonC4jMvfHhpY87p2urFHIPNP3Vg3JZ0lY+7pueUKxOHBVfVQQn6bqhCpFmZuFyww+c1DjYnQmopjnuYzGRcItUBftyrO0jdYyyBrZLR94XQoTvVYPsA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783622124; bh=YbAc9UOu0BeKowFlBqJ4iCwzGIb50Lalyd1ZEG25njI=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=fUnxTC6hGi26haE9mXa/MuDpp3fy8jN/LoNjlCjG9Ii6GXE9QAP/iTswUZ7Y6oOD8B845pojt4CEnhXQpLRe1RkX31i4n1J4St5ZCRvm2uqE0JqYCLV6MDB89QYMG2ujuAW2j0jBMJovAlhklk5waqB/CqlJ/LekLFTvVCU0uzCHRWAGmteDTngCsIfGZFQo/i4nQHgukufzfgzySOer8xvbm0uzeMOduZSTFpn9kymr70iN/mcC3ZQ8qF+EqmvBXq6wByl6uxPmEP15t4MoBhQCapQd5ti/gMeNT4C03NSWvkZ6k2IVLylTKjXMnQSPPUs72VtZA1zzRWayHJ0E+w==
X-YMail-OSG: GRRgYWYVM1lHNfMJWOAqwv6mlEfZzZhs37EeWkgCVNkndp.OWT_55kR6H2tdoXq
 .ETG4t.HZwjO_zpFAJ7_3jlBTPFH5Czvxo20eD9rIIBThM7zxDugIu4Toc93DsCojhuTzg4dPnbH
 dlPw4GlgoFGSK5zvQKiqwXu.M5Ixdhtuhx_0jFW2Jqhvn6w3yeXD3DYHP9jtNk32KZzwaUN63J5Z
 VJ3ATZI2sYvwyDBIjaGymjYPR8y1qire.EfHglRcxDNU1Kl5JhAm.mmZO6PKA.FrMlD3OWa42rQQ
 O89TSzERQPxbAh5b5ngCfG0QS45U249A5X1EEuYKAXMtgGG74CS.4JWEM20S6ocQLA0tDi.vOlxu
 FY9msu.axaHpPOqibZKVDCaFJwfX0Wc8GZ8sVaWpGnU7D9EA1wZm4GJqQqyeW.g0OM1WM4nhujha
 oaNArOEqo.77T7T9kNtRvR_LiFyIEAEQ1x6EAQsobpBw5iRDNNanPOJFqEZawCx7jRPsFLUTfJ1N
 L5Lyfo3sf6Y99O_.MZYmMfst1zGpnZK1TFMYwlgnPqZKtUr5cY4xVDIW5FBO9uq9YZxM6pA5GCR_
 G7VB2iMmrYmmgsBMw7H9HYCD8nyLUU4h3AP0G2Im98iUbBtB3_oRe_cW36wszrQBZaNH1krqDM.y
 zQuZhekO8goTh38iFBgqJ4lrKya1gsTH.HNMGVyXErjpoO3xT_jMlOBCbn8hHO3ONBfQYYTROoLz
 GxRVbwxRoLsj3IsrAcKQ8nMmfZai5hX7cvhj_yo6kasfEpjKWU4pYgJoMs0emTpfYiFOBd9iSHoq
 TjjLjA8hQDJvo80OT87IIxh3rXDSa5uX_rb2SYo_6TOTy7d5ba78KJOBWVYfwqg9ubcGQevfCIgu
 Z3ZXe_5Uu6A54FNR9.mWl.xY3xJCTf.X16B.bpOd2nR6x0oKL6Zp..n.kYvq55cbCs5sykRBE2j3
 8Vvj92_NFXHATmwCCdX0KfJ8B2LRosC0o4K8nDelipWxt._yOXPgb5Lf9MaOaDvD.OUmn6l1fYU.
 WXvWjXi7b_3IHONmK8XE7tgMBpCpdG8iBYbGUgCiY5hcwLb1DaI1iMBUeiTJOqx.BqKk9WNxXzp5
 13hLX6_OMWDgNbQ.u4fsyliqrvO51ZW44snYBhOpKGs_3sKgJ8g42J1.cZVLfyRzodYFYCLQsrbK
 1HXzjTZkqXYKqHShUW1gILmuDmwFfFs2yqDlvDVzcrKZgIS4Ax1UOBZ6Uz3WQ9I9g6RJFoiACytY
 2kq2Q6QHmY7pocqnS4r9Ql3WZ.r.T9wLY3ynksaQkBOfyhucg5whcsGOxwLVMBuAP1WOT2aku_..
 QDBmJ_VnxZhZRHyxa.ovx0sVUsESuPj82grjW.JxCrK2sLkTL0_i7_Y2DhabkjC5R_Mh4yI8BsyT
 fF5wVjr_PCeNiy.JGAndz9nYjSwokwSqAKTDhTPmhxG.cnqrmjvlaoPB1wZJ5qvjdl_AH.33UpL6
 G5hdv.VukPsH5s72Pn_FRdkjTVruVtt4vngswTeaPziJxkR.JVXC7RbxNVT7XMdgAeDrh6I4Hjjm
 yMmZtQZB76jFCUPJ_MyVpw.r213wT3i3oT515hXEFj.ZZDKzV9bYOcfZdE4Cu9lfRjKb6lSbmML_
 o8WMozzRPnR4CFmTr4iuCgkGrXRPTr061UNwEVBJeHvrmjuloYCQjXaUxKLDZdk7qjLUOQdfnZ93
 Wuc4zZmImORw4xQC64R4rs4exmhvlNJmQCmja2g1qUOdkSJ7crONCZFn39ZJ1Y6ap4FPCUQ0UaqL
 QBelb.AJKlas6UhLfLu7D9k8kvGwFPS8j8aS5Lm9eUFbKzr0IGrw2xEwwxCPkzg6KHyi5oggzSTv
 lcwrh.C_KV4pnz3S.5PGUxUqtFoka4p0NuCgJEUqps3rLsLrdl1QD6Zp8sl.vudykpiPFs7eat5K
 PaU4dt8jASVK.3rpN_E.NfoStyMtA87pjTtizpPY9VgD6BCKIr8FUMVco_6CTqyBL6PNvTAKBpU8
 Q3uAKTypnumQBzXDjS79fld05MtAP3DLfbje2h8LVmcL.D9XwOdEde3VLZ9XI5Im2q5Q45p3IBtz
 IjEpQA8rEBntk6f7gTJeLVviJtrlWRWPBwz09yc69u0a6BmXXrDYI8HOEyYpWdLbsRnZI1Hs_v0.
 qqD_zjSBsFe9PF6DtMvFHfy2kZw5RsK5G9x_Doby4q2pbsE6Kf4S4DYx1qb1S9XmA7ZFqPQuP2e9
 JWoAQCWRgzmyj6YMrH1yY.xI7j9Dw2yPnw9qWt2U-
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 7cd21549-264e-427b-ac56-e248d8c18734
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v3 0/3] xen/igd: fixes for Intel IGD passthrough
Date: Thu,  9 Jul 2026 14:35:13 -0400
Message-ID: <20260709183517.25866-1-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260709183517.25866-1-brchuckz.ref@aol.com>
X-purgate-ID: tlsNG-c1860d/1783622126-78A3901C-565D52F6/0/0
X-purgate-type: clean
X-purgate-size: 1335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:qemu-stable@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 8CBB773452B

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

Changes in v2:
  - close open files before setting errp
  - improvements to readability and style
  - small corrections to the commit messages
  - add stable to Cc list

Changes in v3:
  - whitespace fix in first patch
  - fix Cc address for qemu-stable

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


