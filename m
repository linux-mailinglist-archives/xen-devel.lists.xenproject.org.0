Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54551A60CF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 00:03:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNkgi-0003E6-4g; Sun, 12 Apr 2020 22:02:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Dwh=54=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jNkgg-0003E1-Md
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 22:02:46 +0000
X-Inumbo-ID: 571dbffe-7d09-11ea-9e09-bc764e2007e4
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 571dbffe-7d09-11ea-9e09-bc764e2007e4;
 Sun, 12 Apr 2020 22:02:45 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id p19so3623064qve.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=X1ne37QH5/7OmlCnIJ9e1GSI+c/VrIQVzdX6oGyg7XE=;
 b=PcYpRlmrntk2nNpdruBe+8QT6kBRVGy/4f2NtIqN/cE3TnwsXLBz9ueY9MNg1Hq7Gq
 CpEMoxFQ4RzPTsiVx7DtBtl25oXHS5bII+xf6Lwd0gUvMKHoAEQaLqYiKZ4Ns9nIfK3A
 zSZIhDDYBeU7XDUYu6jrZW8XsX67dlYmmdop3VnRRQOaZOP11cV46dzUgCw6fJVMOBb7
 AeQKi7aZHE8TKMWPDUZokOJVAYydt4b8NYsmBgNBTc8dLnSAEKqulEPUEAc7qu9l2hKY
 DA8pCDGeQIju/upJK7VKk5/iNoqMbfFyEXSaBzX2G9ML3b+/TJbmN7lVJ57p7B7/CMtK
 P/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X1ne37QH5/7OmlCnIJ9e1GSI+c/VrIQVzdX6oGyg7XE=;
 b=MiAJ32ARHji8GJ7RnTL3keQsxEPwnrrfuMJT5+djutEd8wogesfnLnhViXUoBVVBXE
 oNHcc9BNyN7wX4RGN61ma8Hk/SaI4r/3yy2sIjkG6W6xdsK7F1gDvvJ9hduAz16fsYiq
 YjeWN8AS8Wd8N+x2mcnvPZxPFcLAVaib66UNsXfLzDPYOW8FrEwng/z2QxkOfPACvj9u
 SZ0LqLJzgqrdP1+jJ01w/+nkrREP33TNVmf1bQs8yI2YiGj24Ly0eMsmJN4w8/yiPaEI
 7ls/bLQekaxQDDuJIdBh3ZjiC/RLqEHI5avZtJ938wyFcCIcWF/pWOoM4d5hx4GC06gp
 Qliw==
X-Gm-Message-State: AGi0PuYTC7QRWu06n6oZ41FdvAe5ZC8zsd9rTwLpnRw53CfdRgwf4kFS
 qH9ZhEmMGd/qW0u8IlFQkhtmbhzx
X-Google-Smtp-Source: APiQypIrmw56dwVAmnbts3VpWk0tDXbp3qfR35plRd9ylvB7nGLIvQSeYtHgdPfqopzFnP9WGHt1IQ==
X-Received: by 2002:ad4:4b62:: with SMTP id m2mr14546040qvx.130.1586728965212; 
 Sun, 12 Apr 2020 15:02:45 -0700 (PDT)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 s14sm3691128qts.70.2020.04.12.15.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:02:44 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/4] More wrappers for xenlight Go package
Date: Sun, 12 Apr 2020 18:02:38 -0400
Message-Id: <cover.1586727061.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Nick Rosbrook (4):
  golang/xenlight: add NameToDomid and DomidToName util functions
  golang/xenlight: add DeviceNicAdd/Remove wrappers
  golang/xenlight: add DevicePciAdd/Remove wrappers
  golang/xenlight: add DeviceUsbdevAdd/Remove wrappers

 tools/golang/xenlight/xenlight.go | 125 ++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

-- 
2.17.1


