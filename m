Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOuPKk09tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E738287281
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254032.1550041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vu-0007Xp-6R; Fri, 13 Mar 2026 16:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254032.1550041; Fri, 13 Mar 2026 16:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vt-0007OE-UA; Fri, 13 Mar 2026 16:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1254032;
 Fri, 13 Mar 2026 16:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzHK=BN=bounce.vates.tech=bounce-md_30504962.69b43cb9.v1-444c273532074034b177761798950319@srs-se1.protection.inumbo.net>)
 id 1w15Tr-0006Ek-OD
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:19 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b963385-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:12 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT53DRJzPm0VQy
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 444c273532074034b177761798950319; Fri, 13 Mar 2026 16:35:05 +0000
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
X-Inumbo-ID: 9b963385-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419705; x=1773689705;
	bh=zCToo0BUt48GgGQBpWxoSVCEuPxLKsIzXwRS6hk9B5M=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kK1q9Z6xLekpynpevRex7JTlsukH91Fx35HwdyBHKHuuD2dWWaQDF4vnoFaocAtF4
	 TltRooNr2fn1uTGl+udUA9UwV8dzvHn0y//mDLmD4us/OC8vrmNFaiYwC9YA5MVv9T
	 Rz7TY/hT/t6rwIuor21WAzHC5ZIJIz5+15+tkipYZldQvno/Ekv8o6xl4sd//Zm2Pl
	 dGH+37qCjBx/Uv0f0d1jm8iqldvU5+KtSmxM1dYqMp0XZr3hX3gRf77akaq8Vt7Jms
	 UTcJ36e2Niliudpniz/hdzg8QFO9kHBR9wAJ56VGeVi4KlkYrr+tkkw3zvES6rK/z4
	 w8w0A4LZ0rX+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419705; x=1773680205; i=thierry.escande@vates.tech;
	bh=zCToo0BUt48GgGQBpWxoSVCEuPxLKsIzXwRS6hk9B5M=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HrYXqO+KVPt/1J6K75FQMSUAtjTQtazfmHaheTF5Pg2nm6sIC5UbSE67B2mW9sN5O
	 r9OtUiJfo2ZovCd/BUHGREH1IDxS8IjJ577zYKqKUyr/QQnTmFjKmSgApD4GnZjCUW
	 vvX2J1Zi45jYSzlTgmiDnFMhvirvR9JHqNOmg3ijNjFl1vTmrzTcRQVm4fW7rrrAw/
	 DEYoJBv1ATrEe0tuEO5oKL5BSXUWijnV5gqhoOeDKqnN1I3+gR9kB4JfBbvrPpnW0z
	 NHPeDLdpbukBtH32NvbsKH2UGW1qGLBBosobFsZ0p5b7x3kyblxFmwUJd3EgS7Nb5R
	 xEjpdRvQTA7Bw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2017/17]=20docs:=20provide=20description=20for=20device=5Fmodel=5Fmachine=20option?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419704742
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-18-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.444c273532074034b177761798950319?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.060];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5E738287281
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds description for 'device_model_machine' option which allows
to control which chipset will be emulated by device model.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 docs/man/xl.cfg.5.pod.in | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..67a5bc54a5 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2963,6 +2963,33 @@ you have existing guests then, depending on the nature of the guest
 Operating System, you may wish to force them to use the device
 model which they were installed with.
 
+=item B<device_model_machine="STRING">
+
+Selects which chipset the device model should emulate for this
+guest.
+
+Valid options are:
+
+=over 4
+
+=item B<"i440">
+
+Use i440 emulation (a default setting)
+
+=item B<"q35">
+
+Use Q35/ICH9 emulation. This enables additional features for
+PCIe device passthrough
+
+=back
+
+Note that omitting device_model_machine parameter means i440 system
+by default, so the default behavior doesn't change for old domain
+config files.
+
+It is recommended to install the guest OS from scratch to avoid issues
+due to the emulated platform change.
+
 =item B<device_model_override="PATH">
 
 Override the path to the binary to be used as the device-model running in
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


