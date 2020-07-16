Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CED2227F5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 18:01:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw6JY-0004hP-7X; Thu, 16 Jul 2020 16:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5EBU=A3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jw6JW-0004hK-UW
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 16:00:51 +0000
X-Inumbo-ID: 84e4c072-c77d-11ea-b7bb-bc764e2007e4
Received: from mail-il1-x143.google.com (unknown [2607:f8b0:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84e4c072-c77d-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 16:00:50 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id e18so5486972ilr.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=b5g1gVvxaRMqQg8QPF9s+84SQrecniVaDWZJDlYGle0=;
 b=qIXzUNjN0ZuQJGNwKpQsUufEGiDfFMQ/Nam8XMu1xHtFNiPaiS+0VAW2j4BIfhcM2I
 roj80QTRIynf200UBn7UzaSj/2NXeIa5/uKSDExFXtEGWX2d/GZ9o3fX12Z2uJwTZxse
 fOQuwQrD7NATGR6ITiVgkBDQ6SzWc8BLbOu9uXlzRZbjnM7Gzsm9aoD1TMFLcsT8+RFv
 W4UTuRINj9yPG+oDiZJPFJbA7/r0PZXjPZelSSUJ77kzVs1/rOVblKN3Qa6D3PnoDsg6
 rgXRru6F5AQTykY78gFXNJRRjXVOSbBBylAkdK6+kxaxMKW3YEz0or+/HvLtX0h8L8Bb
 D01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b5g1gVvxaRMqQg8QPF9s+84SQrecniVaDWZJDlYGle0=;
 b=KrwZFbE+Oneg/y0ebmbsv5r3nytzvXQSO/M4rhTgADQfABY6t32XvNefJaeRMbcT63
 pkdWBrvqj7SK1skVgEMPgfBijHZreVs7jrzY6d23LYzJBktrxFSxX1apZyXRr/smhS0E
 3yWqIkm9niYDnqtWLYwC411l0SkZBHxUdzPsOhizj0IHM4dkEhybquNzVCoCP/R9zsvp
 pbJ9rwc8SMznNJMD7p9DlEaA6z+Y5qKFwTgIfdajJrG8jiTgBnxQ2MUqQDV31nLvyVyZ
 uq1hqq+gDDAu3Zv4fA3/R1eTjRLDc1bITBLpuwfOe/dGHLuL6HMizJk+ERoRVUGgRcyJ
 ftBw==
X-Gm-Message-State: AOAM532whXbYZZnXZrecQJeBo+k9fKsoVCFUzt3cF5brrPH86+4/Exj9
 XE1XXSPUMw8XI5vixHBsI85SfRMpfA4=
X-Google-Smtp-Source: ABdhPJxBLwSgvW42ygkxFOPYVA8CDh4UgDfOJgGUW4dFbgVgPtdrElnDxY0CCJoBZQhk473hxgLNlQ==
X-Received: by 2002:a92:c792:: with SMTP id c18mr5467150ilk.223.1594915249460; 
 Thu, 16 Jul 2020 09:00:49 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id s12sm2957216ilk.58.2020.07.16.09.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 09:00:48 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] MAINTAINERS: add myself as a golang bindings maintainer
Date: Thu, 16 Jul 2020 12:00:26 -0400
Message-Id: <2e7fd9648245db7918b674953bb9643733259420.1594914981.git.rosbrookn@ainfosec.com>
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

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e374816755..33fe51324e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -298,6 +298,7 @@ F:	tools/debugger/gdbsx/
 
 GOLANG BINDINGS
 M:	George Dunlap <george.dunlap@citrix.com>
+M:     Nick Rosbrook <rosbrookn@ainfosec.com>
 S:	Maintained
 F:	tools/golang
 
-- 
2.17.1


