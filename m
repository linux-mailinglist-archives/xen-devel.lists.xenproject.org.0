Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E1B20EFD0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 09:47:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqAz0-0007nY-Fb; Tue, 30 Jun 2020 07:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JP6j=AL=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jqAyy-0007nA-4u
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 07:47:08 +0000
X-Inumbo-ID: df882274-baa5-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df882274-baa5-11ea-8496-bc764e2007e4;
 Tue, 30 Jun 2020 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Reply-To:Message-Id:Date:Subject:To:From:Sender:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lJNTlZjxIYh1xD/yBA//CRnxEGYheSdh39GysEDIMuk=; b=2wF5GDm/oNQ6PsGEJgc3VHl4d8
 tqpk+UPTCbBwHBMEhUZ+pbQ3tkBS/3V4V1DkqsH/rjdFI90Ift3QBvaEnIhiN2iC8ceQ73L7s5aX4
 AhioMzlKWqy1WfCLRWmv36qLPXy2IoSW0z9449OEldqwN+1HsQ5ZHWX4EzbrmnIZPV4Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jqAyn-0002O4-0R; Tue, 30 Jun 2020 07:46:57 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=CBG-R90WXYV0.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jqAym-0007Sl-Lz; Tue, 30 Jun 2020 07:46:56 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org
Subject: Xen 4.14 RC4
Date: Tue, 30 Jun 2020 08:46:55 +0100
Message-Id: <20200630074655.252-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

Xen 4.14 RC4 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.14.0-rc4

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.14.0-rc4/xen-4.14.0-rc4.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.14.0-rc4/xen-4.14.0-rc4.tar.gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me (paul@xen.org).

As a reminder, there will be a Xen Test Day. Please see the test day schedule at
https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.

  Paul Durrant


