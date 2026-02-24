Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFzLKIVEnWkMOAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 07:26:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F689182680
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 07:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239396.1540829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vulqp-00025i-OS; Tue, 24 Feb 2026 06:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239396.1540829; Tue, 24 Feb 2026 06:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vulqp-00024H-LP; Tue, 24 Feb 2026 06:24:55 +0000
Received: by outflank-mailman (input) for mailman id 1239396;
 Tue, 24 Feb 2026 02:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1TO=A4=smail.nju.edu.cn=kexinsun@srs-se1.protection.inumbo.net>)
 id 1vui7M-0006iV-8m
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 02:25:46 +0000
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 141169ef-1128-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 03:25:28 +0100 (CET)
Received: from localhost.localdomain ( [116.172.93.199])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 24 Feb 2026 10:24:26 +0800 (CST)
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
X-Inumbo-ID: 141169ef-1128-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1771899877;
	bh=Z3Aj/5gqJxLV2xf46st4IBcHNWPExSd6g2RATw3la0o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=RgBTbs9BpmSAGN8TybkiyoGDfzh3Q8tELoowkRyGcvcYcWIrzH6ycxQnE9vD/s0M7
	 vay3q+HcqllDlUV9+PzCA3LjMwwp9vPsi7C2xWtURadrkWY5rKG4Q6M7b34/QAJWwy
	 X5BiDgc1bNWegk7oJKedWNSiaMrU3fbaUrGvY2hY=
X-QQ-mid: esmtpgz11t1771899869tfe798ebb
X-QQ-Originating-IP: FIapmEkRFnkqJa29yYNc8kyNQ9O0np8tOiJdKBZzaXM=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9509144588414941481
EX-QQ-RecipientCnt: 15
From: kexinsun <kexinsun@smail.nju.edu.cn>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg,
	kexinsun@smail.nju.edu.cn
Subject: [PATCH] x86/xen: update outdated comment
Date: Tue, 24 Feb 2026 10:24:24 +0800
Message-Id: <20260224022424.1718-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MQYXLRAkMyaewPsgnE4c4ZNd2McHPQcyK+76J1vlzjHT6FuGa/DmEy/H
	2RQ0bQm/nF9UpvWi5xKSijJ2Em/sfEBLtQ8DaNQi14DnU7oQuLcoMuC79A5/LeeQdNOkVzl
	c4gwKSkWW5iXArv3JoMK1iZr2B+8LZDy+iAykyDrDq5g3HMGRlwdBqdP8jts4Fr5yen2q/u
	83fo5c2igw3XTKes4ba/a4ILje1hCh98Fj9JH/VdjOInsS0t3Hp5pliXB/0Vhx6R/YYGh7X
	41UttrcbzeQ8WuAZQgWVJk3QFVV9gnnYqcqsOdfxRgnrZxUGgEIRym0xlxF5Zy47ixVbOEO
	NFsP7EAuYextENmkxzszM6wA8FQSG3Tcn4fCpXyVA8dVvCa8I2G4dQEGU/0qnA0GQykARzk
	5SYctJUWPLaY/jZb3hINK/TPjfLiywzgoOUp0sbX/M0INuRwzhrapbadjsL+Hf95FkOBCnM
	VtDe5TBLhzFKir2BKz+05SPqzX4IFXBM5RIsfp/9OvKT7qri9i5vk8l0Z2b6O/v4gxPTqdj
	FjNOYcQtSZTk60fxOm3kp2Z2+SImHReaEExvWPkkXz/m0NCVJMAYrdXVoKC1bl1qLxgv9oA
	hCsPccIpa8TVqBUZFyKnPWUO8vuEYvkh/X80V8PEClwBd7RluIjXx5Qwf0w2+zkrYjQbLll
	j6ZGGWctz7SOrKd0tGvdq5r2RfADNBAT5qFJlxAskAzD0YW4Azm2TTZC0/pfK3za4lOzaLv
	mE2InteGWmLsmtqSvogoc1Y0ur1ZrzuT4BW6tkW2uBN93DEjVg04Q55sqMPyPNKwoQzFwYz
	6yZZaQgPsB0tqx4s3C1llWvos6TIqnUAs47kYaVvB3WQFQAtbVM341YJs9FYIcNoYiDTGmO
	BBar0sgIESkZqMdW9nnO+v6dkLkQPqkMEuqVglI27X88pKBUrO3W9VkkTzoPjpWTCbOwtmt
	RcDeTTTibgHL6ZpyBMpzVxsoHI4Irj38jkRQgC59qV7BZAcOx1G6ZpQtQPPRgGrLOjC2k0r
	NKt+8RLfTjfmKIqQugeqnA/bwGcP6TJQG/YvFidMhvNnnfyr28/3ZVHT6E8Iv6cY/9NayU2
	S9uD5ltWsQxgPokGwZMMuLgbII1nfHBxm0S/xpNG8jAqX1Qn0XktEQs74sNxmD371J+PCN8
	CSap
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:xutong.ma@inria.fr,m:yunbolyu@smu.edu.sg,m:ratnadiraw@smu.edu.sg,m:kexinsun@smail.nju.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kexinsun@smail.nju.edu.cn,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smail.nju.edu.cn:?];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[kexinsun@smail.nju.edu.cn,xen-devel-bounces@lists.xenproject.org];
	DMARC_DNSFAIL(0.00)[nju.edu.cn : query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nju.edu.cn:email,smail.nju.edu.cn:mid];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.319];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_TEMPFAIL(0.00)[smail.nju.edu.cn:s=iohv2404];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F689182680
X-Rspamd-Action: no action

The function xen_flush_tlb_others() was renamed xen_flush_tlb_multi()
by commit 4ce94eabac16 ("x86/mm/tlb: Flush remote and local TLBs
concurrently").  Update the comment accordingly.

Signed-off-by: kexinsun <kexinsun@smail.nju.edu.cn>
---
 arch/x86/xen/enlighten_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 6e459e47cafd..eaad22b47206 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -392,7 +392,7 @@ static void __init xen_init_capabilities(void)
 
 	/*
 	 * Xen PV would need some work to support PCID: CR3 handling as well
-	 * as xen_flush_tlb_others() would need updating.
+	 * as xen_flush_tlb_multi() would need updating.
 	 */
 	setup_clear_cpu_cap(X86_FEATURE_PCID);
 
-- 
2.25.1


