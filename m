Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F521B6BAF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 05:03:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRobl-0001We-SD; Fri, 24 Apr 2020 03:02:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uIs=6I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRobl-0001WZ-3g
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 03:02:29 +0000
X-Inumbo-ID: 07f2cf00-85d8-11ea-9e09-bc764e2007e4
Received: from mail-qv1-xf2b.google.com (unknown [2607:f8b0:4864:20::f2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f2cf00-85d8-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 03:02:28 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id p13so4005201qvt.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xZ2OA7DktmSMaGfct2/b8NA4AgSxD4oCg90AQoIQp9s=;
 b=CjZ8G/IKIEWMOSQmgERHzYuZ6kf/eRuZ3gRiCjYiGUezDUr9EpgvU10Uo62IgZox6O
 c93ouVU0E+wBPzkGrLmDhmkps6boiDJjlrnF/q4+kYLD/AVzunh3/IPMfi2um+coBSIY
 NA6BzFPN8Zkz8nCPSocviuahympddv2GjWsENs2KXQQ+Eu6qTKOamD7cSfdA4p7bDnTS
 9OTElbCCrlYkvg3PAUaw/eFtaqAb//LEyIZTGAKtmOlEy7iNCkcmtjIqlJYXLXQbmIZ1
 ChNj4e4i+OeVL17LEiGehot1NjHkcRgeCRjLg43/135ag3+R8x+kokW7hFEzppfn9X6D
 r+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xZ2OA7DktmSMaGfct2/b8NA4AgSxD4oCg90AQoIQp9s=;
 b=D6nMFnN1pOShCvcpOR/MRHwUVMI3GTidRzjVP49niHATZzncSoyZ3oYthXw3NG+4fO
 /Q2QsMF5CJIodqYSMCz4SvdGvc6fUvuzEt61JT3i2Odl1bOKns9W+7Va1Ehzc76q23iL
 yW6Fg6xscGnUKGeiYFIl52PExCWnY5gNfVvrT6fCjoVtjJUZkOHuxZ3Hsek4gYh2p1RB
 EnlrzIAbp+t7MvsKKqjn4HiE6xQOqz5fKNz9Nr5BRkWMpnIpBHsuD9gAIZ3oSVcY3EAk
 C6ed/qOB22NReSvlojqq/B4/CJnHi7kY3/4Uql0ObS+uBXpEIfUE8z85//YB4M+K4kU6
 TcQg==
X-Gm-Message-State: AGi0PuZW2MXdKWUbFBtGFdHsOcJa8ziqd7thpv2CfQbOP3jqotOnF1Nh
 9yJ5+09BdnAoLtS/jx7tAZtnBEdQR0M=
X-Google-Smtp-Source: APiQypLYW71MCL9L8HcoLA8c7pYm8nWtXQ7/TOANIMZmJzuw5hCone8QjG4n+HV2TZMT1YVSbjlqpQ==
X-Received: by 2002:a05:6214:593:: with SMTP id
 bx19mr7422167qvb.238.1587697347359; 
 Thu, 23 Apr 2020 20:02:27 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id i6sm2836197qkk.123.2020.04.23.20.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 20:02:26 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/1] More wrappers for xenlight Go package
Date: Thu, 23 Apr 2020 23:02:23 -0400
Message-Id: <cover.1587682041.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series adds wrappers to the xenlight package for various libxl
functions, which are now trivial to add with the generated types and 
marshaling helpers. In particular, these are functions that would allow
redctl to begin making the transition to using the xenlight package. For 
reference, I have started an experimental branch where I am using these
functions in redctl [1].

[1] https://gitlab.com/enr0n/redctl/-/blob/1bdf7b515654cc030e095f3a630a24530f930c00/internal/server/xenlight_xen_driver.go

Changes in v2:
 - Define constant DomidInvalid in first patch for use in NameToDomid
 - Add more detail to function comments

Nick Rosbrook (1):
  golang/xenlight: add NameToDomid and DomidToName util functions

 tools/golang/xenlight/xenlight.go | 38 ++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

-- 
2.17.1


