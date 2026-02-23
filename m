Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGkGFo5ZnGmzEgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 14:43:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE4E177291
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 14:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239066.1540506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuWCz-0002Mm-Aa; Mon, 23 Feb 2026 13:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239066.1540506; Mon, 23 Feb 2026 13:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuWCz-0002Jg-6r; Mon, 23 Feb 2026 13:42:45 +0000
Received: by outflank-mailman (input) for mailman id 1239066;
 Mon, 23 Feb 2026 13:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsDa=A3=bounce.vates.tech=bounce-md_30504962.699c594f.v1-304f47f826664a42b3732f93e853208b@srs-se1.protection.inumbo.net>)
 id 1vuWCx-0002JZ-KY
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 13:42:43 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a26b48-10bd-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 14:42:41 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fKMVR3h03z5QkLlr
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 13:42:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 304f47f826664a42b3732f93e853208b; Mon, 23 Feb 2026 13:42:39 +0000
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
X-Inumbo-ID: 85a26b48-10bd-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771854159; x=1772124159;
	bh=9NPyoFT7Wcr8FHjElqDeozSpjecFI7orW1Ki2H5HOU0=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=sOIrXCUZ4XNuD3fk6g5i3HpnFvWSq40wEnGdyK3pVf8yfxvUPkG8Gtj5qeC5eHeaU
	 shDrZj2923sefcxbTxLay36UYmLTtNNhndLBYoDSHE/CZ2baUDzM/YYbzngaLPIpsk
	 bbxosjUhSk472qGhAsZDONFGLewozJRzb7Mbqp8SSmhHredTYjG8GtHf0D3EPLaW5m
	 wg7PJaZzqkvyxAFM5y/JJdrKiRPBlUDipVeMbLtchXzcU7xWxxSY1EwaK0uQazbXvE
	 nGHgDUr3HLRlTQFLX3pEiDeKJU9hdyUN/OoJtvVd7wMHk49LQ3GiE/69jINnAnGNoe
	 EOxVIUh6HApDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771854159; x=1772114659; i=teddy.astie@vates.tech;
	bh=9NPyoFT7Wcr8FHjElqDeozSpjecFI7orW1Ki2H5HOU0=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=nU/d08zIjCTwkA7dY2npQcs9R9ApA1hIo5i0CTyEVHCb/gxyy2roJYmEyR0TZPDpu
	 OZ1BhGwlJeBYkfJcSzaHkWQt+kK2JYvuoXFHfiKP6CDpDif8nH3EAz15L0nes8b2Eb
	 WOLGaH9PHQEl9ixvHAMuU1VEXdH1XwU9PD/dlDDcUtdYI+F5JkdpVeI4bB810uwwt+
	 t62dysSjpTXKGNABpHsWrYn0e9zU3C2gOlhsQ5y2HOt0crIDKripw72Y73IvdlKrW3
	 y+mI9WiwjyL1+OQFyRx4mp5dATzwySYKr0l6dwceCTtM9eo6VB1aNAUQBSh5dlsuiF
	 99meBFTPAgSbQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?SecureBoot=20requirements=20regarding=20Dom0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771854158677
Message-Id: <99bb08a4-0872-46e4-b945-3687ca3ebc27@vates.tech>
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.304f47f826664a42b3732f93e853208b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260223:md
Date: Mon, 23 Feb 2026 13:42:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:url,vates.tech:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,andrewcoop-xen.readthedocs.io:url];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.894];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EBE4E177291
X-Rspamd-Action: no action

I have some questions regarding SecureBoot and Xen.
The only document that appears to define some sort of policy between Xen 
and SecureBoot is this one 
https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/uefi-secure-boot.html.
That is also similar to discussions made in SecureBoot-related talks.

 > Within the Xen architecture, Xen, the control domain and hardware 
domain share responsibility for running and administering the platform. 
This makes their kernels privileged as far as Secure Boot is concerned.

Why does SecureBoot needs to expand to Dom0 kernel ? If you e.g restrict 
DMA through IOMMU and restrict some key hypercalls like kexec (among 
some others), Dom0 shouldn't be able to compromise Xen (in principle); 
hence can't escape SecureBoot boundaries.

SecureBoot doesn't appears to require preventing device access from 
"unprivileged code" otherwise VFIO wouldn't be allowed under SecureBoot. 
But such device access still needs to be contained (e.g through IOMMU 
enforcement), that's something Xen already supports (e.g 
dom0-iommu=strict / PVH Dom0).
In that case, devices are only allowed to access Dom0, but can't access 
outside of it.

 From a technical standpoint, PVH Dom0 setups (and also PV Dom0 
depending on configuration) acts very similarly to a SecureBoot-able 
Linux kernel which runs a KVM virtual machine with all host devices 
passed-through it (using vfio-pci).
In that case, such VM doesn't need to be SecureBoot compliant, but it 
cannot be leveraged to escape SecureBoot.

Am I missing any specific detail which could explain the need for 
SecureBoot in Dom0 kernel ?

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


