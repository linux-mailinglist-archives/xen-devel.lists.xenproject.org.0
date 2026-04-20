Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOmhAOuM5mmryAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:30:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A572F433BEC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287344.1567803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvGE-0004L8-2x; Mon, 20 Apr 2026 20:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287344.1567803; Mon, 20 Apr 2026 20:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvGD-0004IJ-WC; Mon, 20 Apr 2026 20:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1287344;
 Mon, 20 Apr 2026 20:30:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEvGD-0004IA-An
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:30:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEvGC-00EZzS-Nn
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 22:30:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68cba-bab6-0a2a0a5309dd-0a2a4506eabe-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:30:24 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68cdf-7371-0a2a45060019-22cac1c5d222-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:30:24 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1174183712; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 20:30:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=I6P3TblqYgnWEf8LO4BYN6+STJh5kzb3WrMXQZYU27r2FvFtYvLCWrHmpKyVeSTKJfbNumwnGquc6/HjqdebXZODCUsIh/iwmzGB/HckmjLsB3fRyyWARpqshCAC/EPrejU2EzEOib6wW9ymcG68pAwueS8nvOtDsOPZW+IqPMSXdXQBjzcc4rME8KibnsoPu3XPq36skVol8nC4PSwYvIaFaHHWIpZ3gUCTu8QUEDJX5y7ckx4/ApypvK+t+rg8HCO0IHrM/RypoXzOaPVpAwzZ5IMz4NuPD/DYwwANzw4LhgGr4s8/PrQZHf325fgIfgBnqloa3PJZ5JeTEZP/GA==; s=purelymail1; d=purelymail.com; v=1; bh=1n2x3Sc6bG4P+vvG8u+e4XEkaninvIkxhNvSvfMquGM=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC PATCH v6 32/43] x86/altp2m: Add altp2m_set_view_visibility_locked
Date: Mon, 20 Apr 2026 16:30:09 -0400
Message-Id: <20260420203020.208184-1-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-16d1c6/1776717024-9047FD75-D9307B76/0/0
X-purgate-type: clean
X-purgate-size: 2593
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elektrobit.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A572F433BEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit splits the altp2m_set_view_visibility into two functions, where
the altp2m_set_view_visibility_locked variant has the preconditions that
the altp2m lock is held. This makes it possible to change a view's
visibility in an architecture independent way in code that already holds
the altp2m lock (namely, altp2m_flush).

This is commit 3/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  4 ++++
 xen/arch/x86/mm/altp2m.c          | 14 +++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 56ae19b24b42..99c4cfa5a68b 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -106,6 +106,10 @@ int altp2m_change_gfn(struct domain *d, unsigned int i=
dx, gfn_t old_gfn,
 int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                uint8_t visible);
=20
+/* Set a specific p2m view visibility (with lock already held) */
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2=
m_idx,
+                                      uint8_t visible);
+
 /*
  * Looks up altp2m entry. If the entry is not found it looks up the entry =
in
  * hostp2m.
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0542e3ef9196..8672b8c061d3 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -685,9 +685,19 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, b=
ool *suppress_ve,
 int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                uint8_t visible)
 {
-    int rc =3D 0;
+    int rc;
=20
     altp2m_lock(d);
+    rc =3D altp2m_set_view_visibility_locked(d, altp2m_idx, visible);
+    altp2m_unlock(d);
+
+    return rc;
+}
+
+int altp2m_set_view_visibility_locked(struct domain *d, unsigned int altp2=
m_idx,
+                                      uint8_t visible)
+{
+    int rc =3D 0;
=20
     if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc =3D -EINVAL;
@@ -698,8 +708,6 @@ int altp2m_set_view_visibility(struct domain *d, unsign=
ed int altp2m_idx,
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPT=
P)] =3D
             mfn_x(INVALID_MFN);
=20
-    altp2m_unlock(d);
-
     return rc;
 }
=20
--=20
2.34.1


