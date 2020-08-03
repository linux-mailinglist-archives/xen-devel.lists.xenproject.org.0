Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10D23A8F3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2brN-0005he-Gy; Mon, 03 Aug 2020 14:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2brM-0005hM-8y
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:54:40 +0000
X-Inumbo-ID: 41141776-d599-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41141776-d599-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:54:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26684AC24;
 Mon,  3 Aug 2020 14:54:54 +0000 (UTC)
Subject: [PATCH 10/10] x86emul: correct AVX512_BF16 insn names in EVEX Disp8
 test
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <917b6766-ad0a-ba05-74bc-2f0ec7ba6157@suse.com>
Date: Mon, 3 Aug 2020 16:54:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The leading 'v' ought to be omitted from the table entries.

Fixes: 7ff66809ccd5 ("x86emul: support AVX512_BF16 insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -551,9 +551,9 @@ static const struct test avx512_4vnniw_5
 };
 
 static const struct test avx512_bf16_all[] = {
-    INSN(vcvtne2ps2bf16, f2, 0f38, 72, vl, d, vl),
-    INSN(vcvtneps2bf16,  f3, 0f38, 72, vl, d, vl),
-    INSN(vdpbf16ps,      f3, 0f38, 52, vl, d, vl),
+    INSN(cvtne2ps2bf16, f2, 0f38, 72, vl, d, vl),
+    INSN(cvtneps2bf16,  f3, 0f38, 72, vl, d, vl),
+    INSN(dpbf16ps,      f3, 0f38, 52, vl, d, vl),
 };
 
 static const struct test avx512_bitalg_all[] = {


