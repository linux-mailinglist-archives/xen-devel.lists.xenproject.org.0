Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2187C357
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 20:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693465.1081556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqQg-0003aH-5O; Thu, 14 Mar 2024 19:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693465.1081556; Thu, 14 Mar 2024 19:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqQg-0003XV-2c; Thu, 14 Mar 2024 19:07:50 +0000
Received: by outflank-mailman (input) for mailman id 693465;
 Thu, 14 Mar 2024 19:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMpg=KU=gmail.com=wei.liu.xen@srs-se1.protection.inumbo.net>)
 id 1rkqM4-0003PL-Ka
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 19:03:04 +0000
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b714a19-e235-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 20:03:03 +0100 (CET)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6e6ee9e3cffso525375b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 12:03:03 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net
 ([20.69.120.36]) by smtp.gmail.com with ESMTPSA id
 c28-20020a631c5c000000b005dc4829d0e1sm1020966pgm.85.2024.03.14.12.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 12:03:01 -0700 (PDT)
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
X-Inumbo-ID: 7b714a19-e235-11ee-afdd-a90da7624cb6
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710442982; x=1711047782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIhTvWiIiruvW4futHFoixCiMWFfl1h56d1q6p2Xg1I=;
        b=Yx8po4H1i4vOrNkqiAj1hLq+ua2SBfVnhZ4/ogF8QfpPQ/HWEG/fdFu4xB4hMJMvNL
         8Ns8HD9coK1NLpjTH6f4xe/HrjzGjtQ9iCZ4AML7pwuPcmkEZ0NC73wpqsJag+JHIKKf
         IMUKt25s40vHhksizRIdEItLBoUOcg4b/rW18sTLGMddW1V9vGN7qzu/i1K9FwXRXbJX
         uURPvwcU22WeFwz8qY7DZ3feeeVUmvM87ZepLwk7/i7A8egQl6kqvT0lb1YgE9to1Rdl
         110+ziZkaON+nB1dCl7tzo1lH22IyF4d0DcH9AaDQE8NgvGKHoAOLnsD91u7luY1Brm+
         J79Q==
X-Gm-Message-State: AOJu0YyRYPwTMnxkjnHZqnv0fF9VL1a1kz8q57L47AiZeToow7Qj5SEE
	zSV6k8kfc8lXbFgEBf3GgCkYMbjH1ibsP5pBT7+2cIPRLTcCW5xPdzjjU7U9
X-Google-Smtp-Source: AGHT+IHsagkwLC9rBgzPMX3mqy9u/Ds6Fdh3w7nLO5y8n6iMR9M8tc0hW4/zXvKW9/XPzVIPz9/S5Q==
X-Received: by 2002:a05:6a00:3d01:b0:6e6:9cc9:59b3 with SMTP id lo1-20020a056a003d0100b006e69cc959b3mr4167236pfb.5.1710442982022;
        Thu, 14 Mar 2024 12:03:02 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Cc: liuwe@microsoft.com,
	wei.liu@kernel.org,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: remove myself from various positions
Date: Thu, 14 Mar 2024 19:02:37 +0000
Message-ID: <20240314190239.908402-1-wl@xen.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I have not been active in the Xen community for some time. Update the
MAINTAINERS file to reflect reality.

Signed-off-by: Wei Liu <wl@xen.org>
---
It has been a pleasure working with all of you. I'm sure we will cross
paths in the future.

Seabios is in need for a new owner. For now I left my name there.
---
 MAINTAINERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2cc3cc3921b..f003085ad175 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -387,7 +387,6 @@ F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
 LIBS
-M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 R:	Juergen Gross <jgross@suse.com>
 S:	Supported
@@ -422,7 +421,6 @@ F:	xen/test/livepatch/*
 MINI-OS
 M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
 M:	Juergen Gross <jgross@suse.com>
-R:	Wei Liu <wl@xen.org>
 S:	Supported
 L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
@@ -436,7 +434,6 @@ F:	tools/ocaml/
 
 OVMF UPSTREAM
 M:	Anthony PERARD <anthony.perard@citrix.com>
-M:	Wei Liu <wl@xen.org>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/ovmf.git
 
@@ -521,7 +518,6 @@ F:	xen/arch/arm/include/asm/tee
 F:	xen/arch/arm/tee/
 
 TOOLSTACK
-M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
 F:	autogen.sh
@@ -583,7 +579,6 @@ X86 ARCHITECTURE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
 M:	Roger Pau Monné <roger.pau@citrix.com>
-R:	Wei Liu <wl@xen.org>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
@@ -626,7 +621,6 @@ F:	xen/arch/x86/mm/shadow/
 
 X86 VIRIDIAN ENLIGHTENMENTS
 M:	Paul Durrant <paul@xen.org>
-M:	Wei Liu <wl@xen.org>
 S:	Supported
 F:	xen/arch/x86/guest/hyperv/
 F:	xen/arch/x86/hvm/viridian/
@@ -636,7 +630,6 @@ F:	xen/arch/x86/include/asm/guest/hyperv-tlfs.h
 F:	xen/arch/x86/include/asm/hvm/viridian.h
 
 XENSTORE
-M:	Wei Liu <wl@xen.org>
 M:	Juergen Gross <jgross@suse.com>
 R:	Julien Grall <julien@xen.org>
 S:	Supported
@@ -682,7 +675,6 @@ M:	George Dunlap <george.dunlap@citrix.com>
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Julien Grall <julien@xen.org>
 M:	Stefano Stabellini <sstabellini@kernel.org>
-M:	Wei Liu <wl@xen.org>
 L:	xen-devel@lists.xenproject.org
 S:	Supported
 F:	*
-- 
2.43.0


