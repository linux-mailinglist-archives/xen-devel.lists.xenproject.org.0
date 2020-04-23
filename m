Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3751B513D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 02:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRPgJ-0000ET-Sd; Thu, 23 Apr 2020 00:25:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA1d=6H=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRPgJ-0000EO-1C
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 00:25:31 +0000
X-Inumbo-ID: efea2e74-84f8-11ea-b4f4-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efea2e74-84f8-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 00:25:30 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 71so3432414qtc.12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 17:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=h+pwNdLOWjUpWrGteZatUyi5IhkS2B1ScCjGXT55ZGY=;
 b=UFK3Ras4EkjzXFGBE+kS/Xnk8G3Dxk4K1tE1HQglJcyQ42MI4c8gEMKrvcusC+FYDT
 J+7n7CKrm0lbT6xXauMLygdECmTwAGdi63lB+HiDBNOAC7WQpeNbyfNrucCtGJ5feYTy
 1xUmb9SoqoFdLMuEdmavjJyjCWxmgTKal2b5bkasetfTHo8G6fjm2LQLUZwJWDPDSs4d
 s1/rZ3DQ/M80Qp+5tWeXi2l5IzqF/IhXD94NudcmYYi3M0fiJZE4lVN76tgwc4vUf7qN
 6fLaAwTyvNXkb+mJhtMCKUdv38M8OVNjyppUJArEQKZFGlctO+qjRk8KDCPzaBvjq4Ox
 Xr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h+pwNdLOWjUpWrGteZatUyi5IhkS2B1ScCjGXT55ZGY=;
 b=cCsBoRGoODnfJ+YvkFq0zT9uv4FHjrysulL8DSzG2JgO2xwioxEivyU/04Jo+edzbo
 6EpfZ3WKipQWp/JbZlsYv/9bxu/sUICk3bMz7Rxk7pxDNrxqtm0ap6+NWa1AL+KgltWX
 YlUusLetrYJQ7MdSNUQRK41EUOkK3iwSVLRKEuruWWasw7C2Xmu7nT3rc1LahRGyye0g
 uAbg0VNHp7IY1ycoyQKcQPXtgtgGZ3k5P12P7bKsHNNtFAZz8DZTVguN83jfAEYMSTL9
 gU1a2MaFNigGG3Je/jzcXSrr1EX3tRNGPGvuTmIrxPtQNs6lj6Qk6u/PWOQfOrHdOI/F
 sOmA==
X-Gm-Message-State: AGi0PuY1kQl0VxBdjhEoGDXGK3M6tteUsFG4Y1H+mUm/Z059ajzdg9GI
 LVzeUGLy0IRSrlahfTBIx0hwq3F47iY=
X-Google-Smtp-Source: APiQypIxEsoR1buy6TZrD0ZugfhRB1M0OjMgETCp2UE8/5ffGfdXwwL9zcbptyHlLpNNoxnvznw1wA==
X-Received: by 2002:aed:2765:: with SMTP id n92mr1405454qtd.73.1587601529313; 
 Wed, 22 Apr 2020 17:25:29 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id j90sm669088qte.20.2020.04.22.17.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 17:25:28 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] build golang tools
Date: Wed, 22 Apr 2020 20:25:24 -0400
Message-Id: <cover.1587599094.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These patches add support for the golang tools in the build system.

The behavior of configure with respect to the new variable,
CONFIG_GOLANG_TOOLS is copied from other components, such as the Ocaml
tools. Namely, build the tools by default if the go compiler is found.

Nick Rosbrook (2):
  tools: build golang tools if go compiler is present
  golang/xenlight: stop tracking generated files

 .gitignore                           |    3 +
 .hgignore                            |    2 +
 config/Tools.mk.in                   |    1 +
 m4/golang.m4                         |    4 +
 tools/Makefile                       |    2 +-
 tools/Rules.mk                       |    2 -
 tools/configure                      |  138 +
 tools/configure.ac                   |   12 +
 tools/golang/xenlight/Makefile       |    1 +
 tools/golang/xenlight/helpers.gen.go | 4658 --------------------------
 tools/golang/xenlight/types.gen.go   | 1225 -------
 11 files changed, 162 insertions(+), 5886 deletions(-)
 create mode 100644 m4/golang.m4
 delete mode 100644 tools/golang/xenlight/helpers.gen.go
 delete mode 100644 tools/golang/xenlight/types.gen.go

-- 
2.17.1


