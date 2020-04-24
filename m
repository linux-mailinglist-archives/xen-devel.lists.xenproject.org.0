Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048FB1B6BB5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 05:05:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRoex-0001lB-IJ; Fri, 24 Apr 2020 03:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uIs=6I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRoew-0001l3-Ib
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 03:05:46 +0000
X-Inumbo-ID: 7de48924-85d8-11ea-9e09-bc764e2007e4
Received: from mail-qt1-x834.google.com (unknown [2607:f8b0:4864:20::834])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7de48924-85d8-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 03:05:46 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id e17so3419973qtp.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 20:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1GC8OpGDdaEyCldFE9DhepD3xfjV6bKCiEK8/G0OGK4=;
 b=HMfIoNC2l38T0SAX9R0cS84u60KGe/t+zedGop8KXGbBjLa+3VNEZFHYHsycgS1laS
 M5xYlQqQlBuTuvuHC4OUyM+ojo+tuNvmfO0JnlKZmADRQJeeqtvfYLvf4JPmObjuhzLl
 ZCUeVzrskFsbdbl5DbDxH3RvCTY05v/SPTUgQm/Zk4Em8bampUO6/4YA2VeAUG6KMRNt
 MEXEvx0lM5gYMR1p+oi2/XZHLmSnqEssgMO9RE6RqZQyx7UQz9mrKtPEjwmXgdNUvEg7
 R3vZf8yX3SRunSSFC/NLGASDWOtho2LnjXSMoXIl3INz/dOda2zumfDeb5BFNhXUoGrs
 KBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1GC8OpGDdaEyCldFE9DhepD3xfjV6bKCiEK8/G0OGK4=;
 b=gaAqKErb5rjY9u6tck19Z6C1hOwTAGmcC4fC0ET7RT40v6wI1zzJjGyuAel4DPHJ+b
 LRV2GN+Xz2qCyp2BRFlEHqYew84J/GaS9w3Ih7foIh16cw7YcVaqXNi1z9D/KpQuSXqr
 /PvpqDwxpR8ASo8r/p4F/Sx1YfDvqB5IvDc37UZQG4/OkBcrPjaoO5qux8ixUaTjUwFZ
 IXenY9jPV2SNjYdOv1kV4Vppsrb/91498e7UhcsnjvBzwbZBptCpS4UR43YgMOuaHDaT
 INKLxB1IFTyB1gEK2iCptjOlQcrDvwJItvZumdJqnVUrim9qAy9okBuzvLcTNgPjzI1f
 yV9A==
X-Gm-Message-State: AGi0PuZNUkUR6QuV0v3WAeu4wJGr/xyNES3ZHowAh8KwjFTK0CT+6BiE
 C6u0at47J1cY68lALKZlvCLETWLY2fI=
X-Google-Smtp-Source: APiQypIXrM4vSkQoaLm+FP0k52fsmBKgVynGBDep44q/Z2OwAoZ6oYG2Z4KfCS+lPeb8thBqhrWZhw==
X-Received: by 2002:aed:3e22:: with SMTP id l31mr7388976qtf.290.1587697545315; 
 Thu, 23 Apr 2020 20:05:45 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id p10sm2949820qtu.14.2020.04.23.20.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 20:05:44 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] build golang tools
Date: Thu, 23 Apr 2020 23:05:39 -0400
Message-Id: <cover.1587695896.git.rosbrookn@ainfosec.com>
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

The behavior of configure with respect to the make variable,
CONFIG_GOLANG is copied from other components, such as the Ocaml
tools. Namely, build the tools by default if the go compiler is found.

Changes in v2:
 - Change make variable to CONFIG_GOLANG, and use `golang` rather
   than golang_tools to avoid mixing underscores and hyphens in 
   configure flags.

Nick Rosbrook (2):
  tools: build golang tools if go compiler is present
  golang/xenlight: stop tracking generated files

 .gitignore                           |    3 +
 .hgignore                            |    2 +
 config/Tools.mk.in                   |    1 +
 m4/golang.m4                         |    4 +
 tools/Rules.mk                       |    2 -
 tools/configure                      |  138 +
 tools/configure.ac                   |   12 +
 tools/golang/xenlight/Makefile       |    1 +
 tools/golang/xenlight/helpers.gen.go | 4722 --------------------------
 tools/golang/xenlight/types.gen.go   | 1225 -------
 10 files changed, 161 insertions(+), 5949 deletions(-)
 create mode 100644 m4/golang.m4
 delete mode 100644 tools/golang/xenlight/helpers.gen.go
 delete mode 100644 tools/golang/xenlight/types.gen.go

-- 
2.17.1


