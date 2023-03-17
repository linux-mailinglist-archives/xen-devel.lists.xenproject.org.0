Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ECE6BF24C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 21:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511228.790221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdGYv-0005vj-VT; Fri, 17 Mar 2023 20:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511228.790221; Fri, 17 Mar 2023 20:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdGYv-0005tJ-Sb; Fri, 17 Mar 2023 20:20:29 +0000
Received: by outflank-mailman (input) for mailman id 511228;
 Fri, 17 Mar 2023 20:20:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FDdY=7J=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pdGYu-0005tD-AK
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 20:20:28 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25c8c66b-c501-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 21:20:25 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32HKK1S4065890
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 17 Mar 2023 16:20:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32HKK1p9065889;
 Fri, 17 Mar 2023 13:20:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 25c8c66b-c501-11ed-b464-930f4c7d94ae
Message-Id: <cover.1679084101.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Fri, 17 Mar 2023 13:15:01 -0700
Subject: [PATCH v2 0/2] Fixing error_interrupt()'s messages v2
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Using a somewhat distinct strategy with the printk().  This is two
patches, since nominally the first can work with other strategies.  I
could see them being squashed during commit to the main repository.

Elliott Mitchell (2):
  x86/APIC: include full string with error_interrupt() error messages
  x86/APIC: modify error_interrupt() to output using single printk()

 xen/arch/x86/apic.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@drgnwing.com PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




