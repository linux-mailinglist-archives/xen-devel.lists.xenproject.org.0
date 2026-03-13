Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gENlMU89tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3E287290
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254035.1550048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vu-0007iR-JX; Fri, 13 Mar 2026 16:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254035.1550048; Fri, 13 Mar 2026 16:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vu-0007YY-AN; Fri, 13 Mar 2026 16:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1254035;
 Fri, 13 Mar 2026 16:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wk8P=BN=bounce.vates.tech=bounce-md_30504962.69b43cb8.v1-2bcbd756c26342c989cfe55e6cc82acb@srs-se1.protection.inumbo.net>)
 id 1w15Tp-0006Ek-O4
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:17 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a79d599-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:10 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT42nVczPm0V3w
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2bcbd756c26342c989cfe55e6cc82acb; Fri, 13 Mar 2026 16:35:04 +0000
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
X-Inumbo-ID: 9a79d599-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419704; x=1773689704;
	bh=LlYPKk0xH8yJMporrB500MvTCwnh+CM9hoJ6qpHIVMQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hPzO+XdGGHvtKFO1fOJgo0kn40j1p7JS0jnOI/cOk+iPYBCdCWyvEYlpIh16M8yt8
	 yB7xy16VrFIzVtjjGO9cBoe3HEARG3Z3N/q89InuJOFVCV0o6S7O2CIufJi/gsXusi
	 b9KRUBqXzoET0JovhnURvBaKkGCnpomfbImSrhtQRBQJoiA3G4n6vDYzimT/X7DJ6q
	 ak4M8dhmzRT1dCL8+v6BCI0Gb/85AI6kW7YZpJx6bDQo/qmiwJAF67H5zYr29M5cwI
	 c0Hwe6I2SR8jFRWM0QtJRfCTqIbnfeajxw3UnWT6PBbzELN//WYhdHwCSubS0KOLqX
	 wAwgBA5Y3kdlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419704; x=1773680204; i=thierry.escande@vates.tech;
	bh=LlYPKk0xH8yJMporrB500MvTCwnh+CM9hoJ6qpHIVMQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YnPrZi1NG75A8b7T72/WH8GTlzBXWpWMNj9KPFvcXXpO4uyrhNwbz/XJ6DTImMNGZ
	 99vT2Nz2DRHLs8CDuvCjiNmpeKhMHoJroKOf4q64qGtNvttBpE7IxZnbjJyr+Lzi/i
	 GRsBkc9NWNZbZ8yiw3Lf73gZtjyHl07waYrgCMX7k6Qk4kK/qhneRKDDZgl3oW9vLM
	 CJMLApsEdmjyMcN6ncMYM2OInoqfv7VdWr8N5ZFdTzX7DjF53F4HTf/LqLDbbgE9nB
	 /mGFXQX5gXEQhK9cwP4RTAIdL4xdLOvPYYwCB0nRGlgmKqfXuLekJJBO4deoCzXzHu
	 fTmgyYr4kdilg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2013/17]=20libxl:=20Add=20xen-platform=20device=20for=20Q35=20machine?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419703848
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <20260313163455.790692-14-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2bcbd756c26342c989cfe55e6cc82acb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:04 +0000
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
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.514];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BEB3E287290
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current Xen/QEMU method to control Xen Platform device is done by
setting the 'xen_platform_device' option value that modifies QEMU
emulated machine type, namely xenfv <--> pc.

In order to avoid multiplying machine types, this patch supplies
'-device xen-platform' directly to Qemu. To maintain backward
compatibility with existing Xen/QEMU setups, this is currently only
applicable to q35 machine. i440 emulation uses the old method (xenfv/pc
machine) to control Xen Platform device.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/libs/light/libxl_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 36f2813cde..a64e4779d0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1811,6 +1811,12 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 flexarray_append(dm_args, state->dm_runas);
             }
         }
+
+        if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35 &&
+            libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+            flexarray_append(dm_args, "-device");
+            flexarray_append(dm_args, "xen-platform");
+        }
     }
     flexarray_append(dm_args, NULL);
     *args = (char **) flexarray_contents(dm_args);
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


