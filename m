Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFuUBhYVuGl/YwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 15:35:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A329B770
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 15:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255590.1550504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w291L-0000fk-If; Mon, 16 Mar 2026 14:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255590.1550504; Mon, 16 Mar 2026 14:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w291L-0000cn-Bd; Mon, 16 Mar 2026 14:34:15 +0000
Received: by outflank-mailman (input) for mailman id 1255590;
 Mon, 16 Mar 2026 14:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tk1S=BQ=bounce.vates.tech=bounce-md_30504962.69b814e1.v1-b18f5b09c0604483807fcecab1c85ec0@srs-se1.protection.inumbo.net>)
 id 1w291J-0000Vg-KF
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 14:34:13 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320fa13e-2145-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 15:34:10 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fZHf95VtQzPm0YCX
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 14:34:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b18f5b09c0604483807fcecab1c85ec0; Mon, 16 Mar 2026 14:34:09 +0000
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
X-Inumbo-ID: 320fa13e-2145-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773671649; x=1773941649;
	bh=bDNF/5Vy1gLBiqNe5tEBVim+dhZH1Kyasg4KXkbniuU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d5IYVnuHCRnlfMvmbZky4YbZZuKnDgnvazIDZ4sIdyQT6K2wboMwAZff+qr3K7aZ9
	 9bTPaZXev7OTEuDZEUaWhpqTM7+z7g+pVOlr3qozZPRElGmrwk8tGrExoqoN1MNTco
	 OlB1iOrmKOter941EtWXISFN3oO3KQ7mR+u9f2ctrUZ0fzyIgGYANbz7ya+V9Nd0wo
	 pTwZSM3kftcsPjh06sJeAb0enVbxCh8UQr35W5VsBQQksXYzQwW/3H+gKG13DEHhxC
	 c5p8ojOiK+QgwDa1Y8eli7zi0nc0xZ7zjrAoDzmqbfyMErsrTt13DodYoGT3/Mc2w6
	 52TojOR+qWtfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773671649; x=1773932149; i=teddy.astie@vates.tech;
	bh=bDNF/5Vy1gLBiqNe5tEBVim+dhZH1Kyasg4KXkbniuU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=do2f2rtkaADnvAEOiX4boBqG242GOrtchJY8SAc405NCVciTimiI9RocLTnl08owY
	 chOTC82nvm/LyJTeuI4RZrn+2t5FDvSNeNlMOoYz/OAc+4/v5I+DhcC7hzEzoZqaHg
	 FvGhVwuFLxDigkWnow4E60gcXX6IHBPJ9At4ptM2qOSabzWB7q0YuGEohHcZFWC3PZ
	 8EudNqxtDoU8aa6OJ7exQK4cibXpyUZpvAjh8YwQxWNcRqcgegRmJWm8qRMGRIeWOc
	 gLCRXVWfo3E+JUSPbA0TTu8VI/UI+PodhbNo4x3XfiGLd9REwUMP7AQ85m3SJQEVMH
	 94JCi8mTeHR4Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v9=203/3]=20xenpm:=20Add=20get-core-temp=20subcommand?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773671648961
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <97e34958e8070ee8771157e5ece78e7db1308174.1773671343.git.teddy.astie@vates.tech>
In-Reply-To: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
References: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b18f5b09c0604483807fcecab1c85ec0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 14:34:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [6.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,suse.com:email,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,changelog.md:url];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.695];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,xenproject.org,suse.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 827A329B770
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

get-core-temp allows querying the per-core CPU temperature and
per-package one on processors that supports Digital Temperature Sensors
(most Intel processors; as usual Dom0 drivers cannot work due to
misalignment between Dom0 vCPU and pCPUs).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
CC: Jan Beulich <jbeulich@suse.com>

v4: https://lore.kernel.org/xen-devel/cover.1766158766.git.teddy.astie@vate=
s.tech/
v5: Removed trailing whitespace.
v6: Report errors through errno and use strerror() to display them
v7:
 - Rename get-intel-temp with get-dts-temp
 - handle properly errno
 - make process return a error code if no data
v8:
 - update Changelog
 - improve error handling
 - rename core-dts-temp with get-core-temp
v9:
 - exit with EXIT_{SUCCESS,FAILURE} instead of errno

 CHANGELOG.md       |   2 +
 tools/misc/xenpm.c | 128 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c191e504ab..69cce1c874 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
      mitigate (by rate-limiting) the system wide impact of an HVM guest
      misusing atomic instructions.
    - Support for CPIO microcode in discrete multiboot modules.
+   - Introduce get-core-temp to xenpm to query CPU temperatures on Intel
+     platforms.
 
 ### Removed
  - On x86:
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index e4902d2e82..37f484b362 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -32,11 +32,14 @@
 
 #include <xen-tools/common-macros.h>
 
+#include <xen/asm/msr-index.h>
+
 #define MAX_PKG_RESIDENCIES 12
 #define MAX_CORE_RESIDENCIES 8
 
 static xc_interface *xc_handle;
 static unsigned int max_cpu_nr;
+static xc_physinfo_t physinfo;
 
 /* help message */
 void show_help(void)
@@ -93,6 +96,7 @@ void show_help(void)
             "                                           units default to \=
"us\" if unspecified.\n"
             "                                           truncates un-repre=
sentable values.\n"
             "                                           0 lets the hardwar=
e decide.\n"
+            " get-core-temp          [cpuid]      get CPU temperature for =
<cpuid> or all (Intel only)\n"
             " start [seconds]                     start collect Cx/Px stat=
istics,\n"
             "                                     output after CTRL-C or S=
IGINT or several seconds.\n"
             " enable-turbo-mode     [cpuid]       enable Turbo Mode for pr=
ocessors that support it.\n"
@@ -1354,6 +1358,128 @@ void enable_turbo_mode(int argc, char *argv[])
                 errno, strerror(errno));
 }
 
+static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, i=
nt *temp)
+{
+    xc_resource_entry_t entries[] =3D {
+        { .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STA=
TUS },
+        { .idx =3D MSR_TEMPERATURE_TARGET },
+    };
+    struct xc_resource_op ops =3D {
+        .cpu =3D cpu,
+        .entries =3D entries,
+        .nr_entries =3D ARRAY_SIZE(entries),
+    };
+    int tjmax;
+
+    int ret =3D xc_resource_op(xch, 1, &ops);
+
+    switch ( ret )
+    {
+    case 0:
+        /* This CPU isn't online or can't query this MSR */
+        errno =3D ENODATA;
+        return -1;
+
+    case 1:
+    {
+        /*
+         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it's =
100
+         * which is correct aside a few selected Atom CPUs. Check Linux
+         * kernel's coretemp.c for more information.
+         */
+        static bool has_reported_once =3D false;
+
+        if ( !has_reported_once )
+        {
+            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, assu=
me "
+                            "tjmax =3D 100, readings may be incorrect.\n")=
;
+            has_reported_once =3D true;
+        }
+
+        tjmax =3D 100;
+        break;
+    }
+
+    case 2:
+        tjmax =3D (entries[1].val >> 16) & 0xff;
+        break;
+
+    default:
+        if ( ret > 0 )
+        {
+            fprintf(stderr, "Got unexpected xc_resource_op return value: %=
d", ret);
+            errno =3D EINVAL;
+        }
+        return -1;
+    }
+
+    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
+    return 0;
+}
+
+static void get_core_temp(int argc, char *argv[])
+{
+    int temp =3D -1, cpu =3D -1;
+    unsigned int socket;
+    bool has_data =3D false;
+
+    if ( argc > 0 )
+        parse_cpuid(argv[0], &cpu);
+
+    if ( cpu !=3D -1 )
+    {
+        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
+            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
+        else
+        {
+            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
+                    errno, strerror(errno));
+            printf("No data\n");
+            exit(EXIT_FAILURE);
+        }
+        return;
+    }
+
+    /* Per socket measurement */
+    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
+          socket++, cpu +=3D physinfo.cores_per_socket * physinfo.threads_=
per_core )
+    {
+        if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )
+        {
+            fprintf(stderr,
+                    "[Package%u] Unable to fetch temperature (%d - %s)\n",
+                    cpu, errno, strerror(errno));
+            continue;
+        }
+
+        has_data =3D true;
+        printf("Package%u: %d=C2=B0C\n", socket, temp);
+    }
+
+    if ( has_data )
+        /* Avoid inserting a trailing line if we have nothing */
+        printf("\n");
+
+    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_core =
)
+    {
+        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
+        {
+            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - %s)=
\n",
+                    cpu, errno, strerror(errno));
+            continue;
+        }
+
+        has_data =3D true;
+        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
+    }
+
+    if ( !has_data )
+    {
+        printf("No data\n");
+        exit(EXIT_FAILURE);
+    }
+}
+
 void disable_turbo_mode(int argc, char *argv[])
 {
     int cpuid =3D -1;
@@ -1618,12 +1744,12 @@ struct {
     { "set-max-cstate", set_max_cstate_func},
     { "enable-turbo-mode", enable_turbo_mode },
     { "disable-turbo-mode", disable_turbo_mode },
+    { "get-core-temp", get_core_temp },
 };
 
 int main(int argc, char *argv[])
 {
     int i, ret =3D 0;
-    xc_physinfo_t physinfo;
     int nr_matches =3D 0;
     int matches_main_options[ARRAY_SIZE(main_options)];
 
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



