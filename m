Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB071D609E
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 13:56:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZvOw-0007GH-5d; Sat, 16 May 2020 11:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puAY=66=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jZvOu-0007GC-I0
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 11:54:44 +0000
X-Inumbo-ID: 0751fdb4-976c-11ea-a648-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0751fdb4-976c-11ea-a648-12813bfff9fa;
 Sat, 16 May 2020 11:54:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f13so4712350wmc.5
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 04:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fF7M1/yKhrVf0CfvlpiRjCy6G705JL2S0jhVuRGaFL0=;
 b=ubp8aiKl2TPCWvq0Cw7r2br6q6Ah6kowzcZGy2/7BPXaXaxtkVX9cjB0NfRjsPHtwS
 c9IBPNX+HXVReJ3dNqDuI6+/jJ1urr+6CNj1uJPdA4QmLukN9xVNc28I+6HcdhWAjbKQ
 TJH6R8D3WG77+Yr/YCHZsmQRCW4NBw/EL7LP6U/U+5hjPLe/jn8bDOJxWK7VmdAAyQ3p
 yeO8sYjxa0sVKwu6xv3OKc1G4iGkiXp+RUtucREmDxIDyQLIvthi6MzVIR1zbYtoKIHX
 IL5RR5q1AbmknmgwZQ43RUsTOOMAYxIAa1P2mGZ3DtNol27MuKiKLjWEgEciT9NcZNSv
 S1jA==
X-Gm-Message-State: AOAM532sh3Z7rlOXYztSa4YLj8iFfMmRS2BB5ElBQpuUqkMlrNSSOMpM
 PZsxyAP6cw67sIFYSgp9eG/mVBcGh7w=
X-Google-Smtp-Source: ABdhPJzDlwTQoynpjiGk336W+qNXwlLBEAc6U/nouNw6HUvSRHwMJ9+QNwXvTMJOKejEW5c2toyeUQ==
X-Received: by 2002:a1c:1c6:: with SMTP id 189mr8730207wmb.47.1589630081811;
 Sat, 16 May 2020 04:54:41 -0700 (PDT)
Received: from localhost.localdomain (96.142.6.51.dyn.plus.net. [51.6.142.96])
 by smtp.gmail.com with ESMTPSA id
 c16sm7538150wrv.62.2020.05.16.04.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 04:54:41 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH] CHANGELOG: add hypervisor framework and Hyper-V support
Date: Sat, 16 May 2020 12:54:38 +0100
Message-Id: <20200516115438.1740-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Community Manager <community.manager@xenproject.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Wei Liu <wl@xen.org>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 554eeb6a1216..ccb5055c87b7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    the Xen hypercall interface or the viridian one.
  - Assorted pvshim performance and scalability improvements plus some bug
    fixes.
+ - Hypervisor framework to ease porting Xen to run on hypervisors.
+ - Initial support to run on Hyper-V.
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.20.1


