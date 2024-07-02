Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D224791EE54
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 07:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751911.1160053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOW76-00052r-Fr; Tue, 02 Jul 2024 05:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751911.1160053; Tue, 02 Jul 2024 05:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOW76-0004zy-CG; Tue, 02 Jul 2024 05:31:36 +0000
Received: by outflank-mailman (input) for mailman id 751911;
 Tue, 02 Jul 2024 03:11:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5wZ1=OC=iscas.ac.cn=nichen@srs-se1.protection.inumbo.net>)
 id 1sOTvX-0002ES-IS
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 03:11:31 +0000
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c170c4a2-3820-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 05:11:25 +0200 (CEST)
Received: from localhost (unknown [124.16.138.129])
 by APP-03 (Coremail) with SMTP id rQCowAAXHZnIb4NmPq6XEw--.36219S2;
 Tue, 02 Jul 2024 11:11:04 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c170c4a2-3820-11ef-a59d-41c015c667e1
From: Chen Ni <nichen@iscas.ac.cn>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jbeulich@suse.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] x86/xen: Convert comma to semicolon
Date: Tue,  2 Jul 2024 11:10:10 +0800
Message-Id: <20240702031010.1411875-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXHZnIb4NmPq6XEw--.36219S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jw4UZF1rGF4UKF1UuF18Grg_yoW8JrWUpF
	12kwnxCrykWrWqg3ZxG3WYgr13Cwn5KryrAFZ7Wa42y3ZxXryIkrW8Ka1Utr1UJa13ZF45
	Ja9Yq3WrK3y3tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfU8gAwDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Fixes: 8310b77b48c5 ("Xen/gnttab: handle p2m update errors on a per-slot basis")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 arch/x86/xen/p2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 99918beccd80..6bcbdf3b7999 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -730,7 +730,7 @@ int set_foreign_p2m_mapping(struct gnttab_map_grant_ref *map_ops,
 		 * immediate unmapping.
 		 */
 		map_ops[i].status = GNTST_general_error;
-		unmap[0].host_addr = map_ops[i].host_addr,
+		unmap[0].host_addr = map_ops[i].host_addr;
 		unmap[0].handle = map_ops[i].handle;
 		map_ops[i].handle = INVALID_GRANT_HANDLE;
 		if (map_ops[i].flags & GNTMAP_device_map)
@@ -740,7 +740,7 @@ int set_foreign_p2m_mapping(struct gnttab_map_grant_ref *map_ops,
 
 		if (kmap_ops) {
 			kmap_ops[i].status = GNTST_general_error;
-			unmap[1].host_addr = kmap_ops[i].host_addr,
+			unmap[1].host_addr = kmap_ops[i].host_addr;
 			unmap[1].handle = kmap_ops[i].handle;
 			kmap_ops[i].handle = INVALID_GRANT_HANDLE;
 			if (kmap_ops[i].flags & GNTMAP_device_map)
-- 
2.25.1


