Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHFLLc/IlWkrUwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:12:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C4F156FC9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235585.1538533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiHD-0001JU-6y; Wed, 18 Feb 2026 14:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235585.1538533; Wed, 18 Feb 2026 14:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiHD-0001HL-3w; Wed, 18 Feb 2026 14:11:39 +0000
Received: by outflank-mailman (input) for mailman id 1235585;
 Wed, 18 Feb 2026 14:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIww=AW=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vsiHC-0001HF-Fm
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 14:11:38 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ae9775-0cd3-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 15:11:32 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 2DD614146E2B;
 Wed, 18 Feb 2026 09:11:15 -0500 (EST)
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
X-Inumbo-ID: b9ae9775-0cd3-11f1-9ccf-f158ae23cfc8
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	teddy.astie@vates.tech,
	jbeulich@suse.com,
	jason.andryuk@amd.com
Subject: Re: Re: Re: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
Date: Wed, 18 Feb 2026 14:10:48 +0000
Message-ID: <20260218141125.15807-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <4fa87ec0-8daf-4c62-bf34-56b23cf06531@citrix.com>
References: <4fa87ec0-8daf-4c62-bf34-56b23cf06531@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 57C4F156FC9
X-Rspamd-Action: no action

On 16/02/2026 10:39 pm, Andrew Cooper wrote:
>On 16/02/2026 4:10 pm, Abdelkareem Abdelsaamad wrote:
>> On 16/02/2026 10:15 am, Andrew Cooper wrote:
>>> So what happens to the NMI we're trying to inject when NMIs are
>>> currently blocked?
>> Ah, I see this...
>> The handling flow will eventually land on the function svm_enable_intr_window
>> with HVM_INTR_SHADOW_NMI.

>What happens is that you drop the NMI on the floor and discard it.  Note
>how svm_inject_nmi() has no return value, and therefore must not fail.

>It is buggy to check the blocked bit when injecting using this
>mechanism.  The blocked bit roughly equates to "NMI in progress" in the
>guest, and it is explicitly possible to queue another NMI while the
>first is in progress.

>Both pending and masked being set roughly means "One NMI in progress,
>and one queued", which is a perfectly fine state to be in.

Right, Actually, I see the changes in the svm_get_interrupt_shadow and the
svm_enable_intr_window functions are not correct. There should not be changes
in the two functions. The vNMI handling for multiple\concurrent NMIs should
first set the vnmi_pending bit for the first NMI. The subsequent NMI should
either see the vnmi_pending bit is still set, in which case, it should be just
dropped, i.e, do nothing or it can see the vnmi_pending is cleared in which
case the current vNMI might be is in progress or might be completed but the
code should safely not consider the NMI as blocked, if the vnmi_blocking is
set.

The confusion, I had, is due to looking at the KVM codebase. The upstream
commit fa4c027a7956 ("KVM: x86: Add support for SVM's Virtual NMI") [1]
that was later fixed with the fixing upstream commit
b2ce89978889 ("KVM: SVM: vNMI pending bit is V_NMI_PENDING_MASK not V_NMI_BLOCKING_MASK")
[2].

--Abdelkareem

[1]https://lore.kernel.org/r/20230227084016.3368-11-santosh.shukla@amd.com
[2]https://lore.kernel.org/r/be4ca192eb0c1e69a210db3009ca984e6a54ae69.1684495380.git.maciej.szmigiero@oracle.com

