Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E52F1D10
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65245.115666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Km-0007E8-TO; Mon, 11 Jan 2021 17:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65245.115666; Mon, 11 Jan 2021 17:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Km-0007D3-OM; Mon, 11 Jan 2021 17:50:28 +0000
Received: by outflank-mailman (input) for mailman id 65245;
 Mon, 11 Jan 2021 17:50:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1EW-0002aB-RZ
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:00 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af6d430f-bfed-49f6-aca3-479af83c7426;
 Mon, 11 Jan 2021 17:42:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgfM3m
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:41 +0100 (CET)
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
X-Inumbo-ID: af6d430f-bfed-49f6-aca3-479af83c7426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386967;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=WwDDnhse8CduXneDRBL6YsHp+XW3yq2GXbQKQDe3Eoo=;
	b=BBz3Ubpeblvh003qSTSy9QYMgqExG/Aq37NgN10K6F5WpEiTqY6Qd7O26qDvMjOt31
	pnnmc9HATKkdgvqF6OOUW8dYYtLCxT55zOzZYxVGzgQgzr59ALY6y5OydAjrmBr5+TG3
	2d3whHsmMhFcr1cjPDORNY6Sj+M/ZtyMCEegWyjweHH/S43miYpQkrYea7SfrLfQxbmK
	Fi1BvxFQgKlLSsPLw3Zu8GKnCIRuvwbgdWJr/9CYRoSd43D61UxjfPeedu5/uBLZeFlg
	4d3jEI5lRrWJvz3jT0WSBcDdBSQpa9CY8B/36Evx65ftAG5SPRPBD3zbJYLFBAHjJIHR
	AdAg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 32/39] tools: remove tabs from code produced by libxl_save_msgs_gen.pl
Date: Mon, 11 Jan 2021 18:42:17 +0100
Message-Id: <20210111174224.24714-33-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/light/libxl_save_msgs_gen.pl | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_save_msgs_gen.pl b/tools/libs/light/libxl_save_msgs_gen.pl
index 5bfbd4fd10..9d425b1dee 100755
--- a/tools/libs/light/libxl_save_msgs_gen.pl
+++ b/tools/libs/light/libxl_save_msgs_gen.pl
@@ -120,8 +120,8 @@ sub typeid ($) { my ($t) = @_; $t =~ s/\W/_/; return $t; };
 
 $out_body{'callout'} .= <<END;
 static int bytes_get(const unsigned char **msg,
-		     const unsigned char *const endmsg,
-		     void *result, int rlen)
+                     const unsigned char *const endmsg,
+                     void *result, int rlen)
 {
     if (endmsg - *msg < rlen) return 0;
     memcpy(result, *msg, rlen);
@@ -132,11 +132,11 @@ static int bytes_get(const unsigned char **msg,
 END
 $out_body{'helper'} .= <<END;
 static void bytes_put(unsigned char *const buf, int *len,
-		      const void *value, int vlen)
+                      const void *value, int vlen)
 {
     assert(vlen < INT_MAX/2 - *len);
     if (buf)
-	memcpy(buf + *len, value, vlen);
+        memcpy(buf + *len, value, vlen);
     *len += vlen;
 }
 
@@ -155,7 +155,7 @@ static int ${typeid}_get(const unsigned char **msg,
 END
     $out_body{'helper'} .= <<END;
 static void ${typeid}_put(unsigned char *const buf, int *len,
-			 const $simpletype value)
+                          const $simpletype value)
 {
     bytes_put(buf, len, &value, sizeof(value));
 }
@@ -192,15 +192,15 @@ END
 $out_body{'helper'} .= <<END;
 static void BLOCK_put(unsigned char *const buf,
                       int *len,
-		      const uint8_t *bytes, uint32_t size)
+                      const uint8_t *bytes, uint32_t size)
 {
     uint32_t_put(buf, len, size);
     bytes_put(buf, len, bytes, size);
 }
 
 static void STRING_put(unsigned char *const buf,
-		       int *len,
-		       const char *string)
+                       int *len,
+                       const char *string)
 {
     size_t slen = strlen(string);
     assert(slen < INT_MAX / 4);
@@ -216,7 +216,7 @@ foreach my $sr (qw(save restore)) {
            "(void *data)");
 
     f_decl("${receiveds}_${sr}", 'callout', 'int',
-	   "(const unsigned char *msg, uint32_t len, void *user)");
+           "(const unsigned char *msg, uint32_t len, void *user)");
 
     f_decl("${enumcallbacks}_${sr}", 'callout', 'unsigned',
            "(const ".cbtype($sr)." *cbs)");
@@ -301,7 +301,7 @@ END_ALWAYS
 	$c_callback_args .= "$c_args, ";
 	$c_recv.=
             "        if (!${typeid}_get(&msg, endmsg, $c_get_args)) return 0;\n";
-        f_more("${encode}_$name", "	${typeid}_put(buf, &len, $c_args);\n");
+        f_more("${encode}_$name", "        ${typeid}_put(buf, &len, $c_args);\n");
     }
     $f_more_sr->($c_recv);
     $c_decl .= "void *user)";

