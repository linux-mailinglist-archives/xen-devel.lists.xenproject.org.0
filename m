Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7C1D0417
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 02:58:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYfiu-0006El-3m; Wed, 13 May 2020 00:58:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYfit-0006Eg-Jh
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 00:58:11 +0000
X-Inumbo-ID: d10f3c08-94b4-11ea-b07b-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d10f3c08-94b4-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 00:58:11 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id y22so3114439qki.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Abb8SF9BVb/yvCQWRsCzpAAii8nwRgH/VtD1d77e7kM=;
 b=VVlIpEw6Q0U6XlZM1WlSNHztNl024vZOo6JuKhbgjVgFRZJh7Q3S36v9QUuivHTmqp
 A20SaZn1c0QitYH2WMN+M+dO/+E1K9hFl8DH6dd7Dl0jyvAHtL+5gLVLpB5PVAs3dJNp
 Uz15Rvdc8tgBSSc3JIyvSOAltHWWOhEjsqHMC+UVTdIFT6zRJrDioI3+ZNzNjiCCb2l3
 Qx/ziEEfEYxG1EczkHL4VOSZzxHSAejpSq6OCNIN/BKBrXJrZYw9MM/oO9kJLq02gGCz
 s216aFSdX3/FAUHJGAnBpxqPkzHCDWS2M0z79Q+IU0oftT3UhF7JlKbG8flg5Fw6/Un9
 NbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Abb8SF9BVb/yvCQWRsCzpAAii8nwRgH/VtD1d77e7kM=;
 b=SKXh4TdtbWp/uQBDVEGlK38o5MKteoTkSQlDGRSomFEhLYMTx6VIprq9tuEmvs1U6H
 4MqdTw9nXliD+2oSV+68C3ViIT8ZGlxiLasbEhCdEzi7gww/KIy+Y5uF2zBDJxc+P2pK
 gmGHg0FY/d0xs9/93s5287usaMkDiYdWYMxjWKv1dvhN2wFFGY3EbBRzgc6tWDpqpu+x
 r19A7qty5i+geKBEO8IPij8YdcbUji9kQ1AUKC5uJfPXJHxexf0Jqe6srptwZFFvQBJC
 nZz2Xe6hjoxnJaHnynmHoGCqita4N/39jidaPSSnQhrbpIHC4k69p7lCtQYxfDeocQ7m
 Gh2w==
X-Gm-Message-State: AGi0PuYgoCLTQe0caRzF2DrCfhr0dovAWmGZ22RRBXIezOv1/0RO8xF/
 wk8Jc4EgY6cIRbFCdK0gzqDloxDfgwY=
X-Google-Smtp-Source: APiQypIOaRVxfIQ+gNYGoQX9nWHQ8ZayFE/yEjmLUnRkfSfUwrq6b0YbC4QRP8JPsMRbJc0awmvOXA==
X-Received: by 2002:a37:97c1:: with SMTP id
 z184mr18043810qkd.249.1589331490249; 
 Tue, 12 May 2020 17:58:10 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id 62sm12400828qkh.113.2020.05.12.17.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 17:58:09 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/3] initialize xenlight go module
Date: Tue, 12 May 2020 20:58:04 -0400
Message-Id: <cover.1589330383.git.rosbrookn@ainfosec.com>
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

These patches setup an initial Go module for the xenlight package. The
go code is tracked again, since the module is defined in xen.git as
xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight. The final patch
adds a README and LICENSE to tools/golang/xenlight so that the package
will show up properly on pkg.go.dev and be available via the module
proxy at proxy.golang.org.

Changes in v2:
 - Use xenproject.org instead of xen.org in module path.
 - Use `go build` instead of `go install` in xenlight Makefile.
 - Use LGPL instead of GPL for xenlight LICENSE.
 - Add entry for xenlight package in SUPPORT.md.
 - Change some wording in the README for clarity. 

Nick Rosbrook (3):
  golang/xenlight: re-track generated go code
  golang/xenlight: init xenlight go module
  golang/xenlight: add necessary module/package documentation

 .gitignore                           |    3 -
 .hgignore                            |    2 -
 SUPPORT.md                           |    6 +
 tools/golang/xenlight/LICENSE        |  198 ++
 tools/golang/xenlight/Makefile       |    3 +-
 tools/golang/xenlight/README.md      |   17 +
 tools/golang/xenlight/go.mod         |    1 +
 tools/golang/xenlight/helpers.gen.go | 4728 ++++++++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 1226 +++++++
 tools/golang/xenlight/xenlight.go    |    2 +
 10 files changed, 6179 insertions(+), 7 deletions(-)
 create mode 100644 tools/golang/xenlight/LICENSE
 create mode 100644 tools/golang/xenlight/README.md
 create mode 100644 tools/golang/xenlight/go.mod
 create mode 100644 tools/golang/xenlight/helpers.gen.go
 create mode 100644 tools/golang/xenlight/types.gen.go

-- 
2.17.1


