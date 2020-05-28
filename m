Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C11E6436
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJhz-0006bm-P3; Thu, 28 May 2020 14:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeJhy-0006bh-6W
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:40:34 +0000
X-Inumbo-ID: 2f164236-a0f1-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f164236-a0f1-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 14:40:33 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zOZLCvdBn5STWZEqfyirtPxo/qNWkt5261DA362n/Xlg/i6hH2Kvgsy0jM7Ykg2t1dtPu66/pj
 oWDMByik9nM8LB0tFbGPzk7ZVn3hxPHFTK8jtthhw0PnFqnNlVfn9TPcsLwwXUWHZ4EwCnff50
 iscF7Kjwl2rpUZxkIE3KXmx8VTZ+SuKDFD86Xp8ZIltz8ZeUPU6Rrr9J2ntcfRY0DNr6RPTv/t
 Zwp9HiAMBJ9zSrsxa37u4hC7e/J0SLe4pF1VDkAvrrposZlMgHNSOUAY+tog4kP/JVdMoUmGL4
 7yY=
X-SBRS: 2.7
X-MesageID: 19406324
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="19406324"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/3] Clang/LLVM build fixes
Date: Thu, 28 May 2020 16:40:20 +0200
Message-ID: <20200528144023.10814-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

A couple of build fixes for Clang/LLVM. First patch was already sent,
patches #2 and #3 are new as a result of recent commits.

Thanks, Roger.

Roger Pau Monne (3):
  x86/mm: do not attempt to convert _PAGE_GNTTAB to a boolean
  build32: don't discard .shstrtab in linker script
  clang: don't define nocall

 xen/arch/x86/boot/build32.lds | 5 +++++
 xen/arch/x86/mm.c             | 4 +++-
 xen/include/xen/compiler.h    | 6 +++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.26.2


