Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64154C487A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279237.476913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKH-0006gC-MB; Fri, 25 Feb 2022 15:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279237.476913; Fri, 25 Feb 2022 15:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKH-0006dg-HJ; Fri, 25 Feb 2022 15:16:09 +0000
Received: by outflank-mailman (input) for mailman id 279237;
 Fri, 25 Feb 2022 15:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIN-0006fy-Re
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94bd007a-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:10 +0100 (CET)
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
X-Inumbo-ID: 94bd007a-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0bxiqkDioEV6QfS2tr8a6KFXyY+fCoCDm7KXgI9vhg=;
  b=O0uXr1DJ1UpyOgGqzR5nsHWdanyij+3B/gEI+FjbrMCr76S3J3XTueDe
   ACqFFHJ+RyQzcA8knjxB70YqF6Zz0dXIeZ7YFMRlHPsyTCeYhGLwcC/c/
   UPrmFicAhVk+aX/MYb2S600OgHrEJFHSB1jtG+GLiOSGE8rsGHlPo/u8Y
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64998418
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oYeLqqiMLvOXISJm/8lR0+BBX161GhAKZh0ujC45NGQN5FlHY01je
 htvXT2DaKmNM2HzKIt+aYjkpE4A68LSydMwTwVqr3w0FS0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQQ0A/3ywOYPbzdzAjshG69q1fzjP1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2Y+PUScOk0n1lE/VtE/hbiLolbFUDxSmUKYgod0unSO9VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSdxiCC6WmEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS6xywmpSM4RSlKEMVVGFnavAL9+sobGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHvJ6sz67DFzFtW
 UTofeDEvYji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpZJmOwP
 BKL4VsJjHO2AJdMRfUmC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVLfABScCNiXsieRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:2gbzpK3SaC2cCZBmduItOwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998418"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 20/29] libs/store: use of -iquote instead of -I
Date: Fri, 25 Feb 2022 15:13:12 +0000
Message-ID: <20220225151321.44126-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 tools/libs/store/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 778da51f95..2334c953bb 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -22,7 +22,7 @@ CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
 vpath xs_lib.c $(XEN_ROOT)/tools/xenstore
-CFLAGS += -I $(XEN_ROOT)/tools/xenstore
+CFLAGS += -iquote $(XEN_ROOT)/tools/xenstore
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
-- 
Anthony PERARD


