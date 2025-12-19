Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C1CCE1D3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 02:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190364.1510849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWOu1-0008S4-JG; Fri, 19 Dec 2025 01:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190364.1510849; Fri, 19 Dec 2025 01:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWOu1-0008PT-G7; Fri, 19 Dec 2025 01:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1190364;
 Fri, 19 Dec 2025 01:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1E9q=6Z=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1vWOtz-0008NX-EZ
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 01:03:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8294ef24-dc76-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 02:03:21 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 5BJ13D6h004871
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 20:03:19 -0500 (EST)
 (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 5BJ13D8o004870
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:03:13 -0800 (PST)
 (envelope-from ehem)
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
X-Inumbo-ID: 8294ef24-dc76-11f0-9cce-f158ae23cfc8
Date: Thu, 18 Dec 2025 17:03:13 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Subject: PV Mode support broken after 6.17
Message-ID: <aUSkUbjgRtWf2Tf0@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

Alpine Linux tends to have very current kernels which means seeing very
current bugs.

Sometime before 6.17.12 (therefore also effecting 6.18.x) Xen PV mode
got broken.  Until PCI passthrough for PVH gets into most distributions
PV mode is going to continue being important.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



