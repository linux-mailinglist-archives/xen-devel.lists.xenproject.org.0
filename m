Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CE286663
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3606.10323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDju-0003re-Fo; Wed, 07 Oct 2020 18:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3606.10323; Wed, 07 Oct 2020 18:00:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDju-0003rE-C9; Wed, 07 Oct 2020 18:00:34 +0000
Received: by outflank-mailman (input) for mailman id 3606;
 Wed, 07 Oct 2020 18:00:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDjs-0003r9-UP
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:32 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 448c5e57-dc0a-4919-8ba5-1571f167b3f5;
 Wed, 07 Oct 2020 18:00:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjq-0007CF-Ff; Wed, 07 Oct 2020 19:00:30 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDjs-0003r9-UP
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:32 +0000
X-Inumbo-ID: 448c5e57-dc0a-4919-8ba5-1571f167b3f5
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 448c5e57-dc0a-4919-8ba5-1571f167b3f5;
	Wed, 07 Oct 2020 18:00:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjq-0007CF-Ff; Wed, 07 Oct 2020 19:00:30 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 00/82] Reuse test hosts
Date: Wed,  7 Oct 2020 18:59:02 +0100
Message-Id: <20201007180024.7932-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series arranges to save on host setup by reusing a test host, if
the previous test passed.  Care is taken to make sure that a host is
only reused in this way if the new test would have set it up
identically.

I have had this branch in preparation since November 2017...

-- 
2.20.1


