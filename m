Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F181E508A74
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309284.525390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5I-0001Za-6p; Wed, 20 Apr 2022 14:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309284.525390; Wed, 20 Apr 2022 14:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5I-0001XC-31; Wed, 20 Apr 2022 14:13:32 +0000
Received: by outflank-mailman (input) for mailman id 309284;
 Wed, 20 Apr 2022 14:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5G-0001HT-Sl
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0be2b538-c0b4-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 16:13:28 +0200 (CEST)
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
X-Inumbo-ID: 0be2b538-c0b4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6rpyxvnpX51Fwc4NnxSavHiI4jI1PWIWDeeEhjuyTPM=;
  b=J4X0MrkgbbeuhmOy9eFyME3MgFYMBH6RZUzAX5r5HuSkl5TuavXAKUUn
   thBmwuIRC0P3455pxSY5Q7dqt59ZQb2LlsM4TNiQA5vy+DvDYq1izDs+/
   lBWi9ovLyy7LPLA7RH/CuJbcgfumghGlItAUrCQEKgr0cKRa+kUHcoSwr
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69534205
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dHYvx6x9cewgMImUpfR6t+dHxirEfRIJ4+MujC+fZmUNrF6WrkUDy
 moYDzrTbquMajbwKIwlO9618BgDuJHVy4dqSQI4qyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmZWUQlwDJbX1qO0zVgl0Kg5zG4BhweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AN
 pdCNWA3MXwsZTVJYUYlS8pit93zoVzlThICimm1tJUetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8EzzArW4LHM2jaQKG0UYgduZfoLk/ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 1BexaCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I90IvGkkeBg2aJZYEdMMX
 KM1kVoAjHO0FCH0BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3FlrUuOFM+T8vhS+efHDJJjYexdYAXmgyFQxP7snTg5B
 P4GbpXRmkQDCrCmCsQVmKZKRW03wbEALcieg6RqmiSrfmKKxElJ5yft/I4c
IronPort-HdrOrdr: A9a23:jOnAC6DMw5WSRT/lHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69534205"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v5 4/6] x86/gdbstub: Clean up includes
Date: Wed, 20 Apr 2022 15:13:05 +0100
Message-ID: <20220420141307.24153-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420141307.24153-1-andrew.cooper3@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

common/gdbstub.c wants struct gdb_context but only gets it transitively
through asm/debugger.h.  None of */gdbstub.c should include asm/debugger.h so
include xen/gdbstub.h instead.

Forward declare struct cpu_user_regs in xen/gdbstub.h so it doesn't depend on
the include order to compile.

x86/setup.c doesn't need xen/gdbstub.h at all, so drop it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v5:
 * New
---
 xen/arch/x86/gdbstub.c        | 5 ++++-
 xen/arch/x86/setup.c          | 1 -
 xen/arch/x86/x86_64/gdbstub.c | 2 +-
 xen/common/gdbstub.c          | 3 ++-
 xen/include/xen/gdbstub.h     | 2 ++
 5 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/gdbstub.c b/xen/arch/x86/gdbstub.c
index 8f4f49fd3b54..961cae0be74f 100644
--- a/xen/arch/x86/gdbstub.c
+++ b/xen/arch/x86/gdbstub.c
@@ -18,7 +18,10 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#include <asm/debugger.h>
+#include <asm/uaccess.h>
+#include <asm/x86-defns.h>
+
+#include <xen/gdbstub.h>
 
 u16
 gdb_arch_signal_num(struct cpu_user_regs *regs, unsigned long cookie)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f20e178929f..53a73010e029 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -15,7 +15,6 @@
 #include <xen/multiboot.h>
 #include <xen/domain_page.h>
 #include <xen/version.h>
-#include <xen/gdbstub.h>
 #include <xen/hypercall.h>
 #include <xen/keyhandler.h>
 #include <xen/numa.h>
diff --git a/xen/arch/x86/x86_64/gdbstub.c b/xen/arch/x86/x86_64/gdbstub.c
index 2626519c89c7..8287124dfb1d 100644
--- a/xen/arch/x86/x86_64/gdbstub.c
+++ b/xen/arch/x86/x86_64/gdbstub.c
@@ -17,7 +17,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <asm/debugger.h>
+#include <xen/gdbstub.h>
 
 #define GDB_REG64(r) gdb_write_to_packet_hex(r, sizeof(u64), ctx)
 #define GDB_REG32(r)  gdb_write_to_packet_hex(r, sizeof(u32), ctx)
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index d6872721dc0d..df8d122bce8d 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -38,13 +38,14 @@
 #include <xen/serial.h>
 #include <xen/irq.h>
 #include <xen/watchdog.h>
-#include <asm/debugger.h>
 #include <xen/init.h>
 #include <xen/param.h>
 #include <xen/smp.h>
 #include <xen/console.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
+#include <xen/gdbstub.h>
+
 #include <asm/byteorder.h>
 
 /* Printk isn't particularly safe just after we've trapped to the
diff --git a/xen/include/xen/gdbstub.h b/xen/include/xen/gdbstub.h
index 0b2041095d88..18c960969b76 100644
--- a/xen/include/xen/gdbstub.h
+++ b/xen/include/xen/gdbstub.h
@@ -25,6 +25,8 @@
 
 #ifdef CONFIG_CRASH_DEBUG
 
+struct cpu_user_regs;
+
 struct gdb_context {
     int                 serhnd;           /* handle on our serial line */
     int                 console_steal_id; /* handle on stolen console */
-- 
2.11.0


