Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA4944DB63
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 18:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224829.388342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKr-0005n6-Ek; Thu, 11 Nov 2021 17:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224829.388342; Thu, 11 Nov 2021 17:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKr-0005kX-Ar; Thu, 11 Nov 2021 17:58:05 +0000
Received: by outflank-mailman (input) for mailman id 224829;
 Thu, 11 Nov 2021 17:58:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOKj=P6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlEKp-0005kR-5A
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 17:58:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e83478eb-4318-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 18:58:01 +0100 (CET)
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
X-Inumbo-ID: e83478eb-4318-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636653481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CXeFV8Xqmdo3yz2//NOSZu7RJ4WSbd7zRTgIylaOvOw=;
  b=LuMpIMBnDZfdtGN4urH92ShVuE5jKi4uBdIkQPRr/rqxnDT/rTPmNXv+
   grhxNFTU1vjdai248yix1jksNE4xj5VbbBcJwIvPzDYgMRJIYuCSC8GA/
   17JOOcDNqM2HfriTzY7i2AMfWaUq3YQgVBdHTTBk3gglNL/zBzA2Zv+vq
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: codMHIFZaRjxz7BqHayLa6IhmuTXM70vyzcqWvu+3nat2xxYf616NZ2HzcV1RQ/mxvnRjG1euK
 d4opZAV13N9LFdUWQjddNjSBmMCaXCqelaZTdHBMaws62FWMX66lyCpRIrxUjCjbaIyiq8tjlL
 agoUmbu1zMCAkNtjuAnTvSq1GNpKeIKDNswgIopjGfsbEKLGXxvUsWlhJ8vMIUkS0br7NnN/FH
 tmMT+hOqSD+nB/558Yd5WZxNwM7yYMzabhMRg5tIe0tQgm9uKWBS3Qi+BafTAMt1XdZQldgwPZ
 XV5G2EKGHlTJHi7sKIowXa2I
X-SBRS: 5.1
X-MesageID: 57653922
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ot6mJa/UsPR6BQ9CkMnVDrUDVHmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 2tNWT/VOqzbZWTzfN0gYY3noRhSv5TVy4drS1Ro+yw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhfx
 +tQrKG8FD0JHafql/wcYgV0FCRHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0RQ6uFN
 pBDAdZpRETtSRB0PQY5Mc4BhM6W3lLdch9ipV3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0ddVuDvQH5Fy36onexQmBB1kYYjlEUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9PABbvzt68owGOlor+p5
 Slsdy+2trBmMH11vHbRKNjh5o2B6fefKyH7ilVyBZQn/DnF0yf9Jt4NvmAhdBo2bZlsldrVj
 Kn74FI5CHh7ZivCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN8tKkWVVOkl4cus+UONm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6etJU+RYc259zI8kJ
 1mxBR1VzkTRn3rCJVnYY3xvcuq3D51+sWg6LWonOlPxgyovZoOm7aE+cZorfOZ4qLw/nKAsF
 /RVKd+dBvlvSyjc/2hPZ5fKs4E/Jg+gghiDPnT5bWFnLYJgXQHA5vTtYhDrqHsVFiOyuMZn+
 ++g2wrXTIAtXQNnCMqKOvujw0no5SoWmf5oXluOKd5WIR2+/I9vIi33r/k2P8BTdkmTmmrEj
 16bWE5Kq/PMrok59MjyqZqF94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrtmkfA+6t/oq+MIxwhoBiyWPVGiC7cmKXiax8hf8KZKw+YB6wexX
 0uO/PhcOKmIZ5y5QAJAelJ9Y7TRz+wQlxnT8e8xcRfz6yJA9baaVVlfYkuXgytHIbopaI4oz
 I/NYiLNB9BTXvbyDuu7sw==
IronPort-HdrOrdr: A9a23:YmBkxq9Bxiv3lbj1Ue9uk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57653922"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86/ioapic: Drop function pointers from __ioapic_{read,write}_entry()
Date: Thu, 11 Nov 2021 17:57:40 +0000
Message-ID: <20211111175740.23480-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211111175740.23480-1-andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Function pointers are expensive, and the raw parameter is a constant from all
callers, meaning that it predicts very well with local branch history.

Furthermore, the knock-on effects are quite impressive.

  $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
  add/remove: 0/4 grow/shrink: 3/9 up/down: 459/-823 (-364)
  Function                                     old     new   delta
  __ioapic_write_entry                          73     286    +213
  __ioapic_read_entry                           75     276    +201
  save_IO_APIC_setup                           182     227     +45
  eoi_IO_APIC_irq                              241     229     -12
  disable_IO_APIC                              296     280     -16
  mask_IO_APIC_setup                           272     240     -32
  __io_apic_write                               46       -     -46
  __io_apic_read                                46       -     -46
  io_apic_set_pci_routing                      985     930     -55
  __io_apic_eoi.part                           223     161     -62
  io_apic_write                                 69       -     -69
  io_apic_read                                  69       -     -69
  restore_IO_APIC_setup                        325     253     -72
  ioapic_guest_write                          1413    1333     -80
  clear_IO_APIC_pin                            447     343    -104
  setup_IO_APIC                               5148    4988    -160

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/io_apic.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c3ad9efac88d..1c49a0fe1478 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -235,11 +235,19 @@ union entry_union {
 struct IO_APIC_route_entry __ioapic_read_entry(
     unsigned int apic, unsigned int pin, bool raw)
 {
-    unsigned int (*read)(unsigned int, unsigned int)
-        = raw ? __io_apic_read : io_apic_read;
     union entry_union eu;
-    eu.w1 = (*read)(apic, 0x10 + 2 * pin);
-    eu.w2 = (*read)(apic, 0x11 + 2 * pin);
+
+    if ( raw )
+    {
+        eu.w1 = __io_apic_read(apic, 0x10 + 2 * pin);
+        eu.w2 = __io_apic_read(apic, 0x11 + 2 * pin);
+    }
+    else
+    {
+        eu.w1 = io_apic_read(apic, 0x10 + 2 * pin);
+        eu.w2 = io_apic_read(apic, 0x11 + 2 * pin);
+    }
+
     return eu.entry;
 }
 
@@ -259,12 +267,18 @@ void __ioapic_write_entry(
     unsigned int apic, unsigned int pin, bool raw,
     struct IO_APIC_route_entry e)
 {
-    void (*write)(unsigned int, unsigned int, unsigned int)
-        = raw ? __io_apic_write : io_apic_write;
     union entry_union eu = { .entry = e };
 
-    (*write)(apic, 0x11 + 2*pin, eu.w2);
-    (*write)(apic, 0x10 + 2*pin, eu.w1);
+    if ( raw )
+    {
+        __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
+        __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+    }
+    else
+    {
+        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
+        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+    }
 }
 
 static void ioapic_write_entry(
-- 
2.11.0


