Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83FA74E17E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 00:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561428.877888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIzXM-0002wD-CH; Mon, 10 Jul 2023 22:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561428.877888; Mon, 10 Jul 2023 22:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIzXM-0002uS-9V; Mon, 10 Jul 2023 22:39:20 +0000
Received: by outflank-mailman (input) for mailman id 561428;
 Mon, 10 Jul 2023 22:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wLvp=C4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qIzXL-0002uM-9T
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 22:39:19 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98fbbfad-1f72-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 00:39:16 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36AMd52c082631
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 10 Jul 2023 18:39:10 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36AMd4o5082630;
 Mon, 10 Jul 2023 15:39:04 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 98fbbfad-1f72-11ee-8611-37d641c3527e
Date: Mon, 10 Jul 2023 15:39:04 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Subject: Branch name transition plan?
Message-ID: <ZKyIiFPTKKIK4c8Z@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Is there any sort of plan to move to an alternative name for the "master"
branch?

I am not personally offended, but enough people are that this really
should get some attention.  I am concerned about potential for
reputational harm from associating with a project which has been sluggish
in moving away from the "master" naming.

Though when it comes down to it, "main" has overwhelmingly taken over to
a point where switching back to "master" is causing enough dissonance to
slow down development.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



