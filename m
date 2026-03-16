Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJmwEBYVuGl/YwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 15:35:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E964929B771
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 15:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255588.1550493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w291L-0000Yb-37; Mon, 16 Mar 2026 14:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255588.1550493; Mon, 16 Mar 2026 14:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w291K-0000Vw-U4; Mon, 16 Mar 2026 14:34:14 +0000
Received: by outflank-mailman (input) for mailman id 1255588;
 Mon, 16 Mar 2026 14:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PwZs=BQ=bounce.vates.tech=bounce-md_30504962.69b814df.v1-d94525953523425bb436d36834fbbc98@srs-se1.protection.inumbo.net>)
 id 1w291I-0000Vg-PO
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 14:34:13 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e3f0b1-2145-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 15:34:08 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZHf74kpvz5QkLb6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 14:34:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d94525953523425bb436d36834fbbc98; Mon, 16 Mar 2026 14:34:07 +0000
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
X-Inumbo-ID: 30e3f0b1-2145-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773671647; x=1773941647;
	bh=gwdv71sUMq3fhmfuQTOxzGGx0ecKOIqyx3qkAuUr2jA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IAS7NtCtYXyfYBfpwT1at8dsKTN4cUES1U3STkCLnEKIwNvQnCCXLpJwZplYZAlRO
	 VNcimgWVyRT2jYxGum08Y0vPtEvsHGvyu5srbYUNhOe66BFiwtILfgioMf55AzReEt
	 l/Nd5ifp42bxJOI0l2j14PhwmtXoFxPagVfs3InW3Jn+LdjUNnuko9Wu73G9umYfnA
	 hR39YpFsHumGC4cWzduaE1OAE3eMhPgC6R4KUzBQcwA+H8go7CArAMcKkUS+MiURJR
	 OMj2szJpPT3lL3G69SxP3tNzZfj6FrugFHHZG2RYeWtIjorCL9VUFn9LyzttkoUIux
	 ITvI79PIQZCOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773671647; x=1773932147; i=teddy.astie@vates.tech;
	bh=gwdv71sUMq3fhmfuQTOxzGGx0ecKOIqyx3qkAuUr2jA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kcbdoPkmnO4cdwhDD42+tFfVaG0WjCJSpdSBa8RCTB0o8vM0ti9vxwE2q9xbWIMRV
	 OnjPlDtbpZOe3DTBOac3wr30OLfzPf2RDSvLPR/hcNIZ0cvgN52NJyy7b2TsV+vPtU
	 uegkz09QOpoWwMrfvvQstNFXgvvKsAJzriXkWMM27xW29MZnzmQixlk2pTNARN9EGS
	 nzbED8094uXxisCM6eZj+VHr9/pLTe8S+5H3d7hnnpMIhQ1ZlRpaHpZN4FTzkrAYc+
	 T+i1Cy05f0IMTN8HVWu0GXJI+phTZXHY/VgQ/20MJBJvMNLwKlYNAkTZJNzc0+yKIE
	 wVKXQa8BRr5gQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v9=202/3]=20xenpm:=20Use=20EXIT=5F{SUCCESS,FAILURE}=20instead=20of=20errno=20as=20=20exit=20codes?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773671646918
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <cafb3c93e212a20e314517418dc2ab9f316708b1.1773671343.git.teddy.astie@vates.tech>
In-Reply-To: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
References: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d94525953523425bb436d36834fbbc98?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 14:34:07 +0000
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
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,suse.com:email];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.909];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E964929B771
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

errno is not unified accross platforms, which makes error codes actually
platform specific. C standard defines EXIT_SUCCESS and EXIT_FAILURE
(respectively 0 and 1) as standard errors codes, even though it only reports
whether it failed or not.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v9:
 - Introduced

 tools/misc/xenpm.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..e4902d2e82 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -112,7 +112,7 @@ static void parse_cpuid(const char *arg, int *cpuid)
         if ( strcasecmp(arg, "all") )
         {
             fprintf(stderr, "Invalid CPU identifier: '%s'\n", arg);
-            exit(EINVAL);
+            exit(EXIT_FAILURE);
         }
         *cpuid = -1;
     }
@@ -124,7 +124,7 @@ static void parse_cpuid_and_int(int argc, char *argv[],
     if ( argc == 0 )
     {
          fprintf(stderr, "Missing %s\n", what);
-         exit(EINVAL);
+         exit(EXIT_FAILURE);
     }
 
     if ( argc > 1 )
@@ -133,7 +133,7 @@ static void parse_cpuid_and_int(int argc, char *argv[],
     if ( sscanf(argv[argc > 1], "%d", val) != 1 )
     {
         fprintf(stderr, "Invalid %s '%s'\n", what, argv[argc > 1]);
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -662,7 +662,7 @@ static void signal_int_handler(int signo)
 out:
     free(cputopo);
     xc_interface_close(xc_handle);
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 void start_gather_func(int argc, char *argv[])
@@ -1154,7 +1154,7 @@ void scaling_governor_func(int argc, char *argv[])
     else
     {
         fprintf(stderr, "Missing argument(s)\n");
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
 
     if ( cpuid < 0 )
@@ -1215,7 +1215,7 @@ void cpu_topology_func(int argc, char *argv[])
 out:
     free(cputopo);
     if ( rc )
-        exit(rc);
+        exit(EXIT_FAILURE);
 }
 
 void set_sched_smt_func(int argc, char *argv[])
@@ -1224,7 +1224,7 @@ void set_sched_smt_func(int argc, char *argv[])
 
     if ( argc != 1 ) {
         fprintf(stderr, "Missing or invalid argument(s)\n");
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
 
     if ( !strcasecmp(argv[0], "disable") )
@@ -1234,7 +1234,7 @@ void set_sched_smt_func(int argc, char *argv[])
     else
     {
         fprintf(stderr, "Invalid argument: %s\n", argv[0]);
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
 
     if ( !xc_set_sched_opt_smt(xc_handle, value) )
@@ -1254,12 +1254,12 @@ void set_vcpu_migration_delay_func(int argc, char *argv[])
 
     if ( argc != 1 || (value = atoi(argv[0])) < 0 ) {
         fprintf(stderr, "Missing or invalid argument(s)\n");
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
 
     if ( xc_sched_credit_params_get(xc_handle, 0, &sparam) < 0 ) {
         fprintf(stderr, "getting Credit scheduler parameters failed\n");
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
     sparam.vcpu_migr_delay_us = value;
 
@@ -1304,7 +1304,7 @@ void set_max_cstate_func(int argc, char *argv[])
            : (subval = XEN_SYSCTL_CX_UNLIMITED, strcmp(argv[1], "unlimited")))) )
     {
         fprintf(stderr, "Missing, excess, or invalid argument(s)\n");
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
     }
 
     snprintf(buf, ARRAY_SIZE(buf), "C%d", value);
@@ -1575,7 +1575,7 @@ static void cppc_set_func(int argc, char *argv[])
     uint32_t set_params;
 
     if ( parse_cppc_opts(&set_cppc, &cpuid, argc, argv) )
-        exit(EINVAL);
+        exit(EXIT_FAILURE);
 
     if ( cpuid != -1 )
     {
@@ -1637,7 +1637,7 @@ int main(int argc, char *argv[])
     if ( !xc_handle )
     {
         fprintf(stderr, "failed to get the handler\n");
-        return EIO;
+        return EXIT_FAILURE;
     }
 
     ret = xc_physinfo(xc_handle, &physinfo);
@@ -1647,7 +1647,7 @@ int main(int argc, char *argv[])
         fprintf(stderr, "failed to get processor information (%d - %s)\n",
                 ret, strerror(ret));
         xc_interface_close(xc_handle);
-        return ret;
+        return EXIT_FAILURE;
     }
     max_cpu_nr = physinfo.max_cpu_id + 1;
 
@@ -1662,7 +1662,8 @@ int main(int argc, char *argv[])
         for ( i = 0; i < nr_matches; i++ )
             fprintf(stderr, " %s", main_options[matches_main_options[i]].name);
         fprintf(stderr, "\n");
-        ret = EINVAL;
+        xc_interface_close(xc_handle);
+        return EXIT_FAILURE;
     }
     else if ( nr_matches == 1 )
         /* dispatch to the corresponding function handler */
@@ -1670,10 +1671,11 @@ int main(int argc, char *argv[])
     else
     {
         show_help();
-        ret = EINVAL;
+        xc_interface_close(xc_handle);
+        return EXIT_FAILURE;
     }
 
     xc_interface_close(xc_handle);
-    return ret;
+    return EXIT_SUCCESS;
 }
 
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


