Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IUWLpOhBWo1ZAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 12:18:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D95404EA
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 12:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308774.1580129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNT8i-0005WX-Sf; Thu, 14 May 2026 10:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308774.1580129; Thu, 14 May 2026 10:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNT8i-0005UX-Pb; Thu, 14 May 2026 10:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1308774;
 Thu, 14 May 2026 10:17:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fkyv=DL=gmail.com=nicola.vetrini@bugseng.com>)
 id 1wNT8h-0005UR-A7
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 10:17:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNT8g-00GhHP-Mu
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 12:17:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <SRS0=Fkyv=DL=gmail.com=nicola.vetrini@bugseng.com>)
 id 6a05a11b-bab6-0a2a0a5309dd-0a2a4502dff2-44
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 12:17:58 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <SRS0=Fkyv=DL=gmail.com=nicola.vetrini@bugseng.com>)
 id 6a05a156-af86-0a2a45020019-a237832f8248-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 12:17:58 +0200
Received: from nico-ideapad.sca.unipi.it (unknown [131.114.30.34])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 9D3C24EE3CFD;
 Thu, 14 May 2026 12:17:57 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=131.114.30.34
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778753878;
	b=vrVY1tf3+RCzl5ZfIkcRzlNvGHsb60OAvUBeTTaNNQcTlAATiRXO5IioJLunpbSuOr7L
	 FF0dz7p4LjeP+cq0DTH61DT13JFhKker82I1k207yKtt6mLurc9TPb6GoumEQScvtDjij
	 7j15b5cBBistsjbdkqw+gqoBu3L6EHN7TWWBn2VygILLVk+Aa08ivi6EbaXJkcO79oVW0
	 MsZWIbeZpXJX7A04thQ5GxA5bHjkGCTUOpqtk8yjNtoa7gW+aU5O8JRl8h2xFDqKfyJie
	 f1W7Xhu+9CEtzQfdSNxVkK+pew8uPiYf1apXh1jeZhwZlwkCeR1Mnkz7Yw81b//F03YoF
	 VS0izfP1+vedqExXS2e3EKdtqLqDJyIIlxJQ6LBw2XUPytPs5RpVlG5KWT9W9ldYONgfo
	 eDCSkYpD0F6E4mpw2EJGZQKptd96cUhAs8198Z1z46n/auzpriKx8Ai/EVczhcbATmBlu
	 Uphu+jKtPS19pGxdeQyPzJGRgLYjEPJzj1+VWpM36bXYAN0Br1XUdD7LTyBjReiDY9dVf
	 EJ8Y2oylhmQBefdNb5tduRVmHC4fD/0XjtGil7naoG/5ZWOMVas9YsA6sYToBrr/aSJNm
	 iz8itEtnH8umj4Wm2LdluCffD/QpD1AjeO9O9Y2gqAjpz2jbIYQDTUtPUPvas/I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778753878;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zh73BPxmAVtviTnIt+PaWBA8sAaQSvHP6+asUf5cbXI=;
	b=ygkMBRSMFcV/naw7ZxTji3SuTcgSwftO8TIQoHNf/7kAjDxLruAr4po7pmqd8fYDtpvp
	 Qz8RUZQeo7WiaTvir/2ptzb3/6jAvaOZAjCtwDHXI9qibVOls8pEi5YkOBy4jDt3Vakdn
	 tolIjZNf81H8Jx7w10nhUpvkVGBt6oASKcG9bN8gbYZKxmICgHYd8CM5AIHrQs8ITVDGF
	 FvE/dARQzzjDzrhrmI+lQ9/bNmUlqWXDDmUwkgR1SjQfbOUMZh29JG2auFy4Nq5/3UuHl
	 Wha1GeoSzLuZX98NNDHOQvtSfUikkDjOpGSxoTTsj6VaQMCiPjRTz5Xie9GdcAtaspHJv
	 U8vyUiJB+ccz7v1hDkxasf4MSfdy6TJMBEfKq7uck9QVK8+KMM+kHkHAxL8SeGD9Hc2pM
	 pwB2d2LI+6vRQejlr6PPSakadynOzH0wh3hubkWhbMjgnvWla1OF712EJE5fV7FiSd8hk
	 jjNHEkG83X5U232GcW6BsNcn/W2gQkdiCiEtAAB/YGKSYyvUTVas5WVrmARhDIvIqocqn
	 v3luvAviiAm3Uu0RDyNAW8i4Bbc7RfQq0nNEc8bwALyH3MLBemJvfKXmYPClnNs3U+Lqp
	 3UVQ4tZ9PDWBc2cbF1uro5tuX3ZpmGMiPJ/ghww9iJeCL39wp3+cfMVAYTkc/nU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=131.114.30.34
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] ci: ECLAIR: avoid intercepting intermediate linking steps
Date: Thu, 14 May 2026 12:16:20 +0200
Message-ID: <edd4d992a269dc45b4a41f1c8277ff0d04995dc6.1778753597.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778753878-82374161-AB444DE1/0/0
X-purgate-type: clean
X-purgate-size: 1422
X-Rspamd-Queue-Id: 634D95404EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.89 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[nicolavetrini@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:email,bugseng.com:email,bugseng.com:mid];
	FROM_NEQ_ENVFROM(0.00)[nicolavetrini@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

These do not add any value to the analysis other than duplicating some reports
in whole-program analysis, as the intermediate linking steps are only used to
build the symbol table.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2524548198

A significant reduction in wallclock time can be seen for both arm64 and x86_64 jobs,
with no impact on correctness as far as I'm aware.
---
 automation/eclair_analysis/ECLAIR/analysis.ecl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index 399099938f..ec37f7eff5 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -34,6 +34,13 @@ their Standard Library equivalents."
 
 -doc_end
 
+-doc_begin="Do not analyze intermediate linking artifacts, as they do not differ from their final
+counterparts for the purposes of MISRA C static analysis."
+-file_tag+={xen_efi, "^xen/\\.xen\\.efi\\..*$"}
+-file_tag+={xen_syms, "^xen/\\.xen-syms\\.[0-9]+$"}
+-frames+={hide, "kind(program)&&target(xen_syms||xen_efi)"}
+-doc_end
+
 -eval_file=toolchain.ecl
 -eval_file=public_APIs.ecl
 
-- 
2.54.0


