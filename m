Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKV4GX7rt2mzWwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E4298C97
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255504.1550466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wn-0000Gw-7k; Mon, 16 Mar 2026 11:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255504.1550466; Mon, 16 Mar 2026 11:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wn-0000Df-4z; Mon, 16 Mar 2026 11:17:21 +0000
Received: by outflank-mailman (input) for mailman id 1255504;
 Mon, 16 Mar 2026 11:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mIq=BQ=bounce.vates.tech=bounce-md_30504962.69b7e6ac.v1-2848ffd7a12249e187719e471bba1343@srs-se1.protection.inumbo.net>)
 id 1w25wl-00080D-88
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 11:17:19 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a74fbc47-2129-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 12:17:01 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZCGh1TFcz5QkT4l
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 11:17:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2848ffd7a12249e187719e471bba1343; Mon, 16 Mar 2026 11:17:00 +0000
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
X-Inumbo-ID: a74fbc47-2129-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773659820; x=1773929820;
	bh=m+XRXNPj2npkVGU0el+wj52+hillU7MVSf6508UQkBw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TvgbkD9nD8cAk2KDMWvKBk1f3YYpEX8MVA3hAkUXasvfAucmDxIUbNinf4vmx2YdA
	 TKuuGZXXp+SjMC6wgN1LQja2Hs/WcoHADoMfyy+UEdN+JC0ZqH8eugst/hrZ+RDtN3
	 A+sDsFoQpMp/CVgeyy7fm9tgwzLfcQ0f4sxN3q00LKPXqWs6afTNWIR1jCuN1Dcpuy
	 o7qaalMaXHJti0PbFHcU2RJ3V94Wjf7YUKToziwlSsOJkqsFkQ4khQxv1DuQLf6eet
	 nF+4rFCVxM9SjiVPdOglBieYzkU/e2Iq1RKIJbVylaNSnZUBwLHFrskDIec28o3BHm
	 ESUwOxTAMl0sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773659820; x=1773920320; i=julian.vetter@vates.tech;
	bh=m+XRXNPj2npkVGU0el+wj52+hillU7MVSf6508UQkBw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Ni3jG04n78tC5VinDGjB0K0iaGqdpBQPMLdPpfPy1kmdEU3dTjsM8UskrDvJVa0TT
	 GrkuDbFux69jqVCV1YXBFrYAH1CXEoelkHmbiVMmbGHJOeS+NpNO8Qk5KPjUuziZWw
	 uDPrLoeYob8xr8+DjsP2nj/nd7EF6bqmjZL/ccQPsd2DjDMNRb6kDvOvZwPiF9wXt9
	 xZ+mX4r4E3sbmDoVdtGP+5aQ04mc/0I920E8v9CR/VyDTNyj0mC9AB6CEJHZHqedt+
	 7lbgiVHBhrfS80Z0bfxoGCqozmaE7a6+HzEH1cVdauBtRBrdUrkFbySMnTmJoegXXp
	 ZvxN+ac7mDnTw==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v5=200/3]=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773659818688
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260316111653.178104-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2848ffd7a12249e187719e471bba1343?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 11:17:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.926];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1C9E4298C97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you again Jan for you feedback on the series! As you suggested I
have kept the struct ioreq_page fully intakt and just dropped the struct
page_info *page, because I have replaced the __map_domain_page_global()
by an explicit vmap(). So, the page can be recovered via vmap_to_page().
My only concern with my patch series is that in non-debug builds on x86,
map_domain_page_global() avoids vmap overhead for low MFNs by directly
returning a directmap address. But when switching to vmap()
unconditionally this optimization is gone. But this is required so that
vmap_to_page() works correctly and can recover the struct page_info *
uniformly at teardown. What do you think?

Julian Vetter (3):
  ioreq: Unify buf and non-buf ioreq page management
  ioreq: Indent ioreq_server_{alloc,free}_mfn() body one level deeper
  x86/ioreq: Extend ioreq server to support multiple ioreq pages

 xen/arch/x86/hvm/ioreq.c |  65 +++++++++++++++---
 xen/common/ioreq.c       | 141 +++++++++++++++++++++++++++------------
 xen/include/xen/ioreq.h  |   7 +-
 3 files changed, 158 insertions(+), 55 deletions(-)

-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


