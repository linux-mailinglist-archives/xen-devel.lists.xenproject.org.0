Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C201E4B327C
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 02:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270704.465033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIhUg-0000hS-Oi; Sat, 12 Feb 2022 01:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270704.465033; Sat, 12 Feb 2022 01:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIhUg-0000g9-Kd; Sat, 12 Feb 2022 01:46:34 +0000
Received: by outflank-mailman (input) for mailman id 270704;
 Sat, 12 Feb 2022 01:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1S/=S3=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nIhUf-0000g3-0u
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 01:46:33 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99de8542-8ba5-11ec-b215-9bbe72dcb22c;
 Sat, 12 Feb 2022 02:46:31 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 21C1kMhe027027
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Fri, 11 Feb 2022 20:46:28 -0500 (EST)
 (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 21C1kMN0027026
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 17:46:22 -0800 (PST)
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
X-Inumbo-ID: 99de8542-8ba5-11ec-b215-9bbe72dcb22c
Date: Fri, 11 Feb 2022 17:46:22 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Subject: Development Issue of Concern
Message-ID: <YgcRbq4yJlKSonzj@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

The tradition has been to name the active development branch in GIT has
been named "master".  Quite a number of people object to the name due to
its history.

In light of such concerns, perhaps the Xen Project should join with other
similar projects and move to have the active development branch renamed
"main"?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



