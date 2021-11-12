Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060644E124
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 05:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224954.388511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlOAc-0003W6-6X; Fri, 12 Nov 2021 04:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224954.388511; Fri, 12 Nov 2021 04:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlOAb-0003UM-V9; Fri, 12 Nov 2021 04:28:09 +0000
Received: by outflank-mailman (input) for mailman id 224954;
 Fri, 12 Nov 2021 04:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cipi=P7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mlOAa-0003UG-Cm
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 04:28:08 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed78dfc1-4370-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 05:28:05 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1AC4RrFC074434
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 11 Nov 2021 23:27:58 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1AC4RqJK074433;
 Thu, 11 Nov 2021 20:27:52 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: ed78dfc1-4370-11ec-9787-a32c541c8605
Date: Thu, 11 Nov 2021 20:27:52 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org
Subject: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

I've been busy with another part of this project, so I've lost track of
progress on ACPI/UEFI support on ARM.

Last I'd read full support for ACPI/UEFI seemed a ways off.  Using a stub
domain to constrain ACPI table parsing seemed the favored approach.  I
was under the impression that would take some time.

What is the status?  Do the Xen/ARM leads have any guesses for when full
ACPI/UEFI support might reach completion?

I noticed Linux made full ACPI/UEFI support mandatory for ARM64 before
3.19, so Xen's seems far behind the curve here.

While incidents of garbled ACPI tables are notorious, those are notable
due to being rare.  Whereas I've had terrible luck with device-trees.
The instances of any given OS *not* breaking device-trees with even
patch-level changes are rare.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



