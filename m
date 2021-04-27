Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C636C914
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 18:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118693.224934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQJ5-0008Aa-FW; Tue, 27 Apr 2021 16:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118693.224934; Tue, 27 Apr 2021 16:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQJ5-0008AA-CL; Tue, 27 Apr 2021 16:11:27 +0000
Received: by outflank-mailman (input) for mailman id 118693;
 Tue, 27 Apr 2021 16:11:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJzn=JY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbQJ3-0008A4-Nm
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 16:11:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab5810a2-e339-46eb-a73a-fbde90406247;
 Tue, 27 Apr 2021 16:11:25 +0000 (UTC)
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
X-Inumbo-ID: ab5810a2-e339-46eb-a73a-fbde90406247
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619539884;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k8R0nO84vdjD7WiYzhu/0REIsxIMiDXT7mDSGYyyDyw=;
  b=Tt0yjHBidmNF+pUGsCYZTYl+Ly/FundHJzf4zPv+QXwtzKYNBATJTuAZ
   BrKarJEdt3PXX/+a6hitnM7OxdU1zXd3yBrPyL5iHKX4id0GqoBsdeyRZ
   9cKK5vSVeW8gWbgeNqRqCg1aegj5EHling9Pj/koDA/JKCFEgmHOgF8yW
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wJOM4cQgGs07JbsFRbISyax5rQ3QfbhgkmK58glV7BBREzKJ1rT7efqQJxXjT8871WQj1O2+us
 thT0yC0HFahD6109raqj4sknp+GnfV/0IUF0DFZ3Op3zYBiUZtQbCtvWXl9+I69WURDNWeu5BJ
 trfjZwVzBykZPM4QV+Rv+p3prMaK976yUXr34zFS4O8A74KgtZLsuvoilK9P1EH7403j1iaJtY
 vyoX0C3hqnGquaR1yxeKoYQmdvGrh95GOIqFbXd0m9Hhkt4wlCpLkzUDfSMJkphvwCn2XcSpTq
 75c=
X-SBRS: 5.1
X-MesageID: 44029925
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rq5bZaM1Uz6MisBcT7b155DYdL4zR+YMi2QD/0p6RQVJNumRkM
 6zlPoWvCWE7Ao5cltIo7y9EYOHRm7R8oMwxIEXM6urUgWOghrOEKhJ64z+zzr8XxDv7+I179
 YaT4FSAMD9ZGIbse/U+w+9euxL/PCm9+SSif7a3zNRS2hRGsRdxiNYLireLUFsXglBAvMCZe
 Chz+5KvSCpd3hSTunTPAhnY8H5q9fGlI3rbHc9bnZN1CC0gTyl87L8GRSDty1uMQ9n+6so8m
 TOjmXCiZmLjvChxhfQk0/V4phG8eGB9vJ/BdeBgsVQFzP0igzAXupccoCF1QpZnMifrHIR1P
 jFuVMJItl64XK5RBDSnTLdny3blAsIx1Cn41mCmnfnqdH+X1sBerN8rJMcdADY5UomtMx916
 wO33vxjesuMS/9
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="44029925"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xl: constify cmd_table entries
Date: Tue, 27 Apr 2021 17:11:04 +0100
Message-ID: <20210427161105.91731-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

and cmdtable_len.

The entries in cmd_table don't need to be modified once xl is running.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xl/xl.c          | 4 ++--
 tools/xl/xl.h          | 6 +++---
 tools/xl/xl_cmdtable.c | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 3a8929580212..4107d10fd469 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -362,7 +362,7 @@ int main(int argc, char **argv)
 {
     int opt = 0;
     char *cmd = 0;
-    struct cmd_spec *cspec;
+    const struct cmd_spec *cspec;
     int ret;
     void *config_data = 0;
     int config_len = 0;
@@ -462,7 +462,7 @@ int child_report(xlchildnum child)
 void help(const char *command)
 {
     int i;
-    struct cmd_spec *cmd;
+    const struct cmd_spec *cmd;
 
     if (!command || !strcmp(command, "help")) {
         printf("Usage xl [-vfNtT] <subcommand> [args]\n\n");
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 137a29077c1e..e5a106dfbc82 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -218,10 +218,10 @@ int main_qemu_monitor_command(int argc, char **argv);
 void help(const char *command);
 
 extern const char *common_domname;
-extern struct cmd_spec cmd_table[];
-extern int cmdtable_len;
+extern const struct cmd_spec cmd_table[];
+extern const int cmdtable_len;
 /* Look up a command in the table, allowing unambiguous truncation */
-struct cmd_spec *cmdtable_lookup(const char *s);
+const struct cmd_spec *cmdtable_lookup(const char *s);
 
 extern libxl_ctx *ctx;
 extern xentoollog_logger_stdiostream *logger;
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 07f54daabec3..84e2067e278b 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -18,7 +18,7 @@
 
 #include "xl.h"
 
-struct cmd_spec cmd_table[] = {
+const struct cmd_spec cmd_table[] = {
     { "create",
       &main_create, 1, 1,
       "Create a domain from config file <filename>",
@@ -631,12 +631,12 @@ struct cmd_spec cmd_table[] = {
     },
 };
 
-int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);
+const int cmdtable_len = sizeof(cmd_table)/sizeof(struct cmd_spec);
 
 /* Look up a command in the table, allowing unambiguous truncation */
-struct cmd_spec *cmdtable_lookup(const char *s)
+const struct cmd_spec *cmdtable_lookup(const char *s)
 {
-    struct cmd_spec *cmd = NULL;
+    const struct cmd_spec *cmd = NULL;
     size_t len;
     int i, count = 0;
 
-- 
Anthony PERARD


