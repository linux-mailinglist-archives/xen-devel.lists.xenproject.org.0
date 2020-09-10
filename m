Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E1D2645C9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 14:13:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGLSF-0007zD-5y; Thu, 10 Sep 2020 12:13:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGLSE-0007yw-1j
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 12:13:30 +0000
X-Inumbo-ID: 6df7733a-b87c-4852-948b-09198f5641d2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6df7733a-b87c-4852-948b-09198f5641d2;
 Thu, 10 Sep 2020 12:13:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E369AFC8;
 Thu, 10 Sep 2020 12:13:44 +0000 (UTC)
Subject: [PATCH 6/6] tools/include: drop remaining -f from ln invocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Message-ID: <291403bb-11a5-f585-024e-0ab873d18fce@suse.com>
Date: Thu, 10 Sep 2020 14:13:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is once again to allow noticing name collisions right away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -18,8 +18,8 @@ xen-dir:
 	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/
-	ln -sf ../xen-sys/$(XEN_OS) xen/sys
-	ln -sf $(addprefix $(XEN_ROOT)/xen/include/xen/,libelf.h elfstructs.h) xen/libelf/
+	ln -s ../xen-sys/$(XEN_OS) xen/sys
+	ln -s $(addprefix $(XEN_ROOT)/xen/include/xen/,libelf.h elfstructs.h) xen/libelf/
 	ln -s ../xen-foreign xen/foreign
 	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
 	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/


