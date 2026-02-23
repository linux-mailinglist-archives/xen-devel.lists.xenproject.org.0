Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCWhBQd7nGlfIAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:06:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC41E179587
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239174.1540616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYRt-0000T2-GR; Mon, 23 Feb 2026 16:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239174.1540616; Mon, 23 Feb 2026 16:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYRt-0000R6-DV; Mon, 23 Feb 2026 16:06:17 +0000
Received: by outflank-mailman (input) for mailman id 1239174;
 Mon, 23 Feb 2026 16:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkMW=A3=bounce.vates.tech=bounce-md_30504962.699c7af3.v1-cd7d1d01e52741e1998800ff57263eba@srs-se1.protection.inumbo.net>)
 id 1vuYRr-0000R0-UY
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:06:15 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 931b80da-10d1-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 17:06:13 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fKQh36dFpz5QlJd0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 16:06:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cd7d1d01e52741e1998800ff57263eba; Mon, 23 Feb 2026 16:06:11 +0000
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
X-Inumbo-ID: 931b80da-10d1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771862771; x=1772132771;
	bh=pck4nHMO7GEQjBuUYYujPZgCMlhKQWrP4o5UQZ66kJ8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=L05lLJUSSPzGQd4rJrhaxELghLo4jDeawVVQnxR/ehHbhszAuy9TJWnsx7/yzgJjZ
	 RFQpjg1rLsV0WojHHrgy/4cYtC6ULjn+puSgzJ8mBqcxTXX73vE/8IGrLa0tTXgm5k
	 fhGyStKev03gTMn8lqBSxBSQsdXCC5HJkp1Rul/6Qm/VJfA6m8hvuqLzkDAzCKrq+w
	 gYbOYDd81UiQD2zl4tgsA9C/pbALWFGfoP3tUqRGbcgwBifrASdHykKF2tTH80ppCW
	 OTATt8mkNw8Lx+fJH6jFxtWF/w0yZnW/neCBjPEmlRyqA2CA9Z79ZGXBwYxKvIXKTv
	 MK0XE+7sRP1yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771862771; x=1772123271; i=teddy.astie@vates.tech;
	bh=pck4nHMO7GEQjBuUYYujPZgCMlhKQWrP4o5UQZ66kJ8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=DIgY6lGOtiYodd/DK8DWJCBDay6UtxKly5JQxxhMb8IEHa0SeLmdxls1wrXVopMbo
	 mP1HLx57q3DaVYnvcHzPrsijPO+or+mtDL5J3OFpWskbfNxWuZ773hmc025uzWN9p5
	 zpdejVuUuc3XY0XDKNcP9230Wg17jXOoccDGD0ESIXdiTMkDNx3NSuSdhQ/zhqunaN
	 fDZV4Y/bOTKtjmjMgMw5P+u/axVbwe+4CQf3RfChcxScEmcTIuHlY6x7w520a2rXXM
	 QP8EFWoIS0787LKfhwSStqqAl+TAoh5rTA4LME2lc4qJXLddYQIuVsXkI8Ai47FEpT
	 +wdn/5YS0YYUA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v7=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771862771271
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cd7d1d01e52741e1998800ff57263eba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260223:md
Date: Mon, 23 Feb 2026 16:06:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.588];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EC41E179587
X-Rspamd-Action: no action

xc_report_op returns -1 in some error conditions.
Make sure it returns -ENOMEM in out of memory errors and -EINVAL
in invalid usages errors.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v7: Introduced

 tools/libs/ctrl/xc_resource.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/ctrl/xc_resource.c b/tools/libs/ctrl/xc_resource.c
index cb6a97202b..1ca71ee048 100644
--- a/tools/libs/ctrl/xc_resource.c
+++ b/tools/libs/ctrl/xc_resource.c
@@ -28,7 +28,7 @@ static int xc_resource_op_one(xc_interface *xch, xc_resource_op_t *op)
                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
 
     if ( xc_hypercall_bounce_pre(xch, entries) )
-        return -1;
+        return -ENOMEM;
 
     platform_op.cmd = XENPF_resource_op;
     platform_op.u.resource_op.nr_entries = op->nr_entries;
@@ -54,19 +54,19 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
     call_list = xc_hypercall_buffer_alloc(xch, call_list,
                                           sizeof(*call_list) * nr_ops);
     if ( !call_list )
-        return -1;
+        return -ENOMEM;
 
     platform_ops = xc_hypercall_buffer_array_create(xch, nr_ops);
     if ( !platform_ops )
     {
-        rc = -1;
+        rc = -ENOMEM;
         goto out;
     }
 
     entries_list = xc_hypercall_buffer_array_create(xch, nr_ops);
     if ( !entries_list )
     {
-        rc = -1;
+        rc = -ENOMEM;
         goto out;
     }
 
@@ -81,7 +81,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
                         platform_op, sizeof(xen_platform_op_t));
         if ( !platform_op )
         {
-            rc = -1;
+            rc = -ENOMEM;
             goto out;
         }
 
@@ -90,7 +90,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
                    entries, entries_size);
         if ( !entries)
         {
-            rc = -1;
+            rc = -ENOMEM;
             goto out;
         }
         memcpy(entries, op->entries, entries_size);
@@ -137,7 +137,7 @@ int xc_resource_op(xc_interface *xch, uint32_t nr_ops, xc_resource_op_t *ops)
     if ( nr_ops > 1 )
         return xc_resource_op_multi(xch, nr_ops, ops);
 
-    return -1;
+    return -EINVAL;
 }
 
 /*
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


