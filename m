Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58750EC6D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 01:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313340.530848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj7nl-0005VH-7P; Mon, 25 Apr 2022 23:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313340.530848; Mon, 25 Apr 2022 23:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj7nl-0005Sz-3p; Mon, 25 Apr 2022 23:07:29 +0000
Received: by outflank-mailman (input) for mailman id 313340;
 Mon, 25 Apr 2022 23:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eo9G=VD=citrix.com=prvs=107e1699f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nj7ni-0005St-Le
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 23:07:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 765b44ac-c4ec-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 01:07:24 +0200 (CEST)
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
X-Inumbo-ID: 765b44ac-c4ec-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650928043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HfuahNNpA+hqwith49r0QNNc51ox4xCiXZ+yHc0fjTY=;
  b=KU0bUiUy2ozYnfJ+NjEXLQ+t+c9gtFthNfM44KhzxJOGkSiejhwMI2d0
   s/HfSI2cSkuls9XrIUZ3yxR4dQymkvODnSKCTzM0ENpfeq3WcPQ0tKE/r
   rp5sCkA7j3zV1lfaqTHvRBmXLFqlrjUIUDOV2ft0f8aw7EM41zobCamSu
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70306352
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Hm4m164Q52iyieOs0OxA3gxRtNXHchMFZxGqfqrLsTDasY5as4F+v
 jBLUWyPMvfeYmTzedtzPdvn/U4PucOAmIU1TVE5/ixnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS0FgILZojhpd9EQkB/PwcgF4oF5ZPudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5VBMmIxN0maC/FJEkkWT5MewuiJvFa8IjtamAKtt7g8/HeGmWSd15CyaYGIK7RmX/59oEGco
 W7X+nXjNTsTPtef1Dmt/2qlg6nEmiaTcJkJCLSy+/pugVuS7m8eEhsbUR28u/bRolG6c8JSL
 QoT4CVGhaov8E2mSPHtUhv+p2SL1jYWVsBMCeQ85EeIw7DN/geCLmEeS3hKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyAeShAey8L+u4x1hRXKJv5BOqOoitz+GRnr3
 iuH6iM5gt0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyN6lx8RtaASrGTsEmCytpmcqy+DUStl
 S1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9z23+KTPuftmU
 Xt+TSpLJSxHYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQM7hmsfrc+lSIq
 Yg32y62J/N3CrSWjs7/q9B7ELz3BSJjWcCeRzJ/K4Zv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchQw9bYLvlWecV/iQik6MNvHBM8vxVpmbX1EFQv5gBALPNfwhJrzgrNqJNHLAsQ4lqUqJ
 xTEEu3daslypsPvpmpNMMGh/NAzHPlp7CrXVxeYjPEEV8YIb2T0FhXMJ2MDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:9EpvrK7h17oH/7aZvAPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.90,289,1643691600"; 
   d="scan'208";a="70306352"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/build: Fix build failure from LDFLAGS mismatch
Date: Tue, 26 Apr 2022 00:06:56 +0100
Message-ID: <20220425230656.12808-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In a GNU compatbile makefile, $(LDFLAGS) are passed to $(CC), not $(LD).

In a default CentOS 7 build environment, $(LDFLAGS) is set to -Wl,-z,relro,
which causes the Xen build to explode with:

  ld: unrecognized option '-Wl,-z,relro'
  ld: use the --help option for usage information

It turns out that many downstreams identify this as a breakage in Xen's build
system and bodge around it in various ways, mostly by unsetting all of
$(CFLAGS), $(AFLAGS) and $(LDFLAGS).

However, that is a security issue because it means that tools/ is not built
with the distro-wide hardening flags that are otherwise expected of
packages (relro, _FORTIFY_SOURCE, stack-protector, etc).

tools/ specifically should honour the packaging environment's choice of flags,
while xen/ must not pass $(LDFLAGS) to $(LD), and should not be influenced by
the others either.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Wei Liu <wl@xen.org>

RFC, because CFLAGS/AFLAGS need nuking too, and they're rather more entangled.
I expect this to cause some disgreement, but Xen is behaving in a very
nonstandard way even among embedded projects and all downstreams are suffering
security problems as a consequence.
---
 xen/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index ec34524ed21d..a8e1de54823b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -254,6 +254,8 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
 # reparsing Config.mk by e.g. arch/x86/boot/.
 export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
 
+LDFLAGS :=
+
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS :=
-- 
2.11.0


