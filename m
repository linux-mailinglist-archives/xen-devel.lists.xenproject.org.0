Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF258C731
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 13:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382388.617327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0a4-0005x5-U7; Mon, 08 Aug 2022 11:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382388.617327; Mon, 08 Aug 2022 11:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0a4-0005uh-R9; Mon, 08 Aug 2022 11:05:56 +0000
Received: by outflank-mailman (input) for mailman id 382388;
 Mon, 08 Aug 2022 11:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrjU=YM=citrix.com=prvs=2124ac30a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oL0a4-0005ep-5W
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 11:05:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d60e7a-170a-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 13:05:55 +0200 (CEST)
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
X-Inumbo-ID: 11d60e7a-170a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659956754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+TMoGxiqff4av5HP+7bjjRzkm1T+xybFBCI1AfNJyi4=;
  b=VxUc//Fdg8pIARCaUTHySDh5x7mzK80Q5tn6qIANx/ZUZkjukyZcRtWe
   OZuxwl+hqLc8g3Li/4lEX8kReUU7U+mAfrF7YMBclttzVIgjxOCsZY6D4
   YigsrccCQdbDuWIt8x/yA4vx5GoRqdJEUxr2Gh/uwEgaF6brg60YfDD6N
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80148078
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wHgEFqj7aZmE4a2AndrzZ+saX161HhAKZh0ujC45NGQN5FlHY01je
 htvX2DXaKrZMGOmL4t0bo2w8R4O75+EytM2GVE6riEwFiMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSq6GtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eNJJb27t+Hn532
 +08MDlQS0meiP2o+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZC9aIOJKoTVFa25mG6Jv
 SH3plSgCCgCPfLC4yjCqk+n2rfmyHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRokyxQdVEM
 GQP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUt6saggdw6kQ32YMdHCKfoq4ToFi7u+
 mXfxMQhvIn/nfLnxo3iow2W3Wzx+cGVJuImzl6JBzz4t2uVcKbgPtX1sgaDsJ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPnqgKuVmS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SIW1B6+PMYsWPcMZmOq7EMZGNSatM53FyhBwwcnTx
 7/BGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+iOL2TCPEFt843K6mNL9RAFWs/FqIq
 L6y9qKil31ibQEJSnCLqdBLcQhbcxDWx/ne8qRqSwJKGSI+cElJNhMb6ehJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:e4P0QKqb829wWHGwoNGNzeQaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.93,222,1654574400"; 
   d="scan'208";a="80148078"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH 1/2] tools/libxl: Replace deprecated -sdl option on QEMU command line
Date: Mon, 8 Aug 2022 12:05:44 +0100
Message-ID: <20220808110545.62886-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808110545.62886-1-anthony.perard@citrix.com>
References: <20220808110545.62886-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"-sdl" is deprecated upstream since 6695e4c0fd9e ("softmmu/vl:
Deprecate the -sdl and -curses option"), QEMU v6.2, and the option is
removed by 707d93d4abc6 ("ui: Remove deprecated options "-sdl" and
"-curses""), in upcoming QEMU v7.1.

Instead, use "-display sdl", available since 1472a95bab1e ("Introduce
-display argument"), before QEMU v1.0.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 1864ee30f0..04bf5d8563 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1349,7 +1349,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_append_pair(dm_args, "-display", "none");
 
     if (sdl && !is_stubdom) {
-        flexarray_append(dm_args, "-sdl");
+        flexarray_append_pair(dm_args, "-display", "sdl");
         if (sdl->display)
             flexarray_append_pair(dm_envs, "DISPLAY", sdl->display);
         if (sdl->xauthority)
-- 
Anthony PERARD


