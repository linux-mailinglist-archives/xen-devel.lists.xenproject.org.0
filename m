Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAxfBIVxj2ncQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:46:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6C13901F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231672.1536740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqyBD-0004NU-Fp; Fri, 13 Feb 2026 18:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231672.1536740; Fri, 13 Feb 2026 18:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqyBD-0004LV-DD; Fri, 13 Feb 2026 18:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1231672;
 Fri, 13 Feb 2026 18:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHiT=AR=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vqyBC-0004LP-AQ
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 18:46:14 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c74f41-090c-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 19:46:13 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 14B82414BEF8;
 Fri, 13 Feb 2026 13:45:58 -0500 (EST)
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
X-Inumbo-ID: 44c74f41-090c-11f1-b163-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com
Subject: Re: Re: [PATCH 0/3] Virtual NMI
Date: Fri, 13 Feb 2026 18:42:49 +0000
Message-ID: <20260213184252.93141-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAC6C13901F
X-Rspamd-Action: no action

>Patches 1 and 2 want merging.  They're both enumerations and
>configuration bits, although the very first hunk of patch 1 (the P())
>wants delaying until the final patch; we shouldn't print out the
>capability until it's being used.
>
>The patch subjects want to be:
>
>    x86/svm: Enumerations for virtual NMI
>and
>    x86/svm: Use virtual NMI when available
Ack.
I Will merge these in V2.
I will move (the P()) hunk to patch 2.

>
>
>Everything here is local to SVM.  Notably there should be no edits to
>hvm.c or hvm.h.  By introducing hvm_intblk_vnmi, you break NMI injection
>in other cases.  vNMI is just a hardware-optimised way of handling the
>hvm_intblk_nmi_iret case.
The handling for the introduced hvm_intblk_vnmi is separate from the other
interrupts handling. I will remove the introduced hvm_intblk_vnmi and I will
rather use the existing hvm_intblk_nmi_iret. This should have the side effect
of setting the VMCB's interrupt-shadow. However, it should be benign side
effect as this should not currently cause an actual interrupt shadow on the
AMD platforms prior to the vNMI support.

>
>
>
>svm_inject_nmi() wants to gain a check to see whether vNMI is enabled,
>and in the case that it is, simply set vnmi_pending.  You have this
>partially, but it needs to be dependent on the VMCB vNMI setting, not
>some global idea of enablement.
>
I will add one more is_vnmi_enabled callback for the check functionality and I
will use that introduced check in the svm_inject_nmi

>svm_get_interrupt_shadow() needs a similar adjustment to read
>vnmi_blocked rather than unconditionally depending on INTERCEPT_IRET.
>
Ack, I will add the check in the V2

>In construct_vmcb(), you need to check cpu_has_svm_vnmi.  I think this
>change is simple enough to be enabled unconditionally.  (We'll need to
>change this in due course, but that's going to take other infrastructure
>which we don't have yet.)
>
Ack, I will change it, as suggested, in the V2

>
>A couple of other minor notes:
>
>In the vintr_t union, use an anonymous 3 bit field (literally "u64 :3;",
>which is valid syntax) instead of renumbering the rsvd$N fields.  That
>will shrink the diff.
>
Ack, I will change it, as suggested, in the V2

>Xen's style has spaces inside the outermost brackets for control
>structures, and {'s on new lines.  For the functions you're modifying,
>just copy the surrounding style.
>
Ack, I will stick to the formatting guideline in the V2

--Abdelkareem

