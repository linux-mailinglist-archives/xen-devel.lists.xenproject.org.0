Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472221D0414
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 02:56:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYfgj-00063y-E5; Wed, 13 May 2020 00:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYfgh-000637-ET
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 00:55:55 +0000
X-Inumbo-ID: 7fd151e6-94b4-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fd151e6-94b4-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 00:55:54 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id p12so12825238qtn.13
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 17:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EMqMHiDg6gKs8OQ+tw4WAiOg/f7/en1mPF/tDzR7hOE=;
 b=dJYOWESkROg0U5+eZsfHG8Ydy4j1f2bOnzQ0NIislyQIWJCCqMs8OZO185Q22TSWVZ
 mZiQBhe9SShl8/qBIcexNLhUO3b3Eqm5BNArlQ7EFYsXv+cVh/C57dbUMC8QspkTWnTx
 9h3avkzMwHHB+I3OyzzQ7tV5d11SCD0HhohHUw49bd0TXWgq4kD+6u83hWGJBI2OP3Ck
 rEAzNRxzShU1ukriU1Mu+fGCPPiHA8sf7bplW5D0AQmdNsainhTXYZ/zpzn3Kp7qjjQb
 9Nj97d3uLESPlLxEMVXM9pUXYpjKGnoJJTc6AAZwEomGC6lATm5A4YBM9ytIZYk3Av0d
 zGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EMqMHiDg6gKs8OQ+tw4WAiOg/f7/en1mPF/tDzR7hOE=;
 b=OCPOeefxUqfZCSrMqTOHci45eIvMdGZdaBnkdiTVSwYg50WKJp2+9G0wGyRMXMogtC
 +hQKV2HuoB9y4XepJSo+HKOZFXM9y5WLYPAUrjC0fqRj2KLunpLqnyu5pQc/z5VLEthw
 pLCEEzss4CcA2x41uPiz6th2zuG0VSo3UWJL9k0HLkfzxfIXRv4THSoHJ9oWQhg9KNiu
 O9MVCoqaYcKAF6pEPf+wOrYWAezk+mgMaG1O+ktqtAtDHDKGGPV3ydBEq6qxINotzL15
 OWdkWAJfdPnktNR+Ma8cT6+6PnKgzUoX/sc5qltM6pqZGK9O2YaP+OPfEVyOjnnMsAYn
 8t/g==
X-Gm-Message-State: AGi0PuaSvCIIkWFFmKMHzi3AkCNeYbazNU4ot3LeFnL4PDWO5TOYQfuk
 lIOd7ebzEOJrDdbebK95bHPKH/eccFc=
X-Google-Smtp-Source: APiQypLZrSd1jBf6vjCZ/Iqv8pToJSWHu2/t9eUwUf47AIwgkw4AxwzKB+ETw0D4ubAoaW2Gmo8Rug==
X-Received: by 2002:aed:3949:: with SMTP id l67mr13125456qte.313.1589331353911; 
 Tue, 12 May 2020 17:55:53 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id y28sm8388602qtc.62.2020.05.12.17.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 17:55:53 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/1] More wrappers for xenlight Go package
Date: Tue, 12 May 2020 20:55:49 -0400
Message-Id: <cover.1589321804.git.rosbrookn@ainfosec.com>
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

Changes in v3:
 - Define INVALID_DOMID_TYPED in C preamble so that the Go const
   DomidInvalid is always in-sync with the libxl definition.

Nick Rosbrook (1):
  golang/xenlight: add NameToDomid and DomidToName util functions

 tools/golang/xenlight/xenlight.go | 40 ++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

-- 
2.17.1


