Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B98C204D
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:10:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719609.1122428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MGJ-0006PI-Uw; Fri, 10 May 2024 09:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719609.1122428; Fri, 10 May 2024 09:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MGJ-0006Ni-Rw; Fri, 10 May 2024 09:09:55 +0000
Received: by outflank-mailman (input) for mailman id 719609;
 Fri, 10 May 2024 09:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=McEs=MN=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1s5MGI-0006Nc-DF
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:09:54 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ef2156c-0ead-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 11:09:51 +0200 (CEST)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1s5MGE-00Fd5h-Ia
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:09:51 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 0F2B89D6EDB
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 10:09:51 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHeB11bR55EC for <xen-devel@lists.xenproject.org>;
 Fri, 10 May 2024 10:09:50 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id DDE9A9D6ED8
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 10:09:50 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id D13885AE; Fri, 10 May 2024 10:09:50 +0100 (BST)
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
X-Inumbo-ID: 0ef2156c-0ead-11ef-b4bb-af5377834399
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Fri, 10 May 2024 10:09:50 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: Domain Birth Time
Message-ID: <Zj3kXlHJzlqaFpMw@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

We've added a feature to Xen 4.15 such that `xl uptime -b` reports the birth
time of the domain (i.e. a value preserved across migrations).  If this would
be of wider interest I can try porting this to a more recent release and
submitting it for review.

Regards,
James

