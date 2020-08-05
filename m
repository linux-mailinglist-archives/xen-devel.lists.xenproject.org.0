Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30923C9F0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 12:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3GnP-0007yW-Rb; Wed, 05 Aug 2020 10:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8x8=BP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k3GnO-0007yC-O2
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 10:37:18 +0000
X-Inumbo-ID: 819afbe8-de10-4f5c-b525-d092565a1635
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 819afbe8-de10-4f5c-b525-d092565a1635;
 Wed, 05 Aug 2020 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PvXYfQiV658z27YKhv9WPmac6pVamZ2UOuRIgaTayoY=; b=u5xrT0gcG3ZO4hNUPgD14cyDF
 J5H0/LXeImd8LcN+hfmW47z+BEdL+XUUNpdHYwfEsuQXdXMJ9U3z6CCc3gxBHZpKURzUR9IEH4XHZ
 R+CGGimwLzeXmQX9QPtMFsYhTWjEy5DCVMzT5J6mG3xjJfZj1VUaI1DZzzIm6dtiwN8tA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3GnH-0001pE-8o; Wed, 05 Aug 2020 10:37:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3GnG-0001SK-TH; Wed, 05 Aug 2020 10:37:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k3GnG-00086Z-Sc; Wed, 05 Aug 2020 10:37:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152488-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152488: all pass - PUSHED
X-Osstest-Versions-This: xen=c9f9a7258dc07735e2da2b6d0b51a0218c76a51f
X-Osstest-Versions-That: xen=81fd0d3ca4b2cd309403c6e8da662c325dd35750
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Aug 2020 10:37:10 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152488 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152488/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  c9f9a7258dc07735e2da2b6d0b51a0218c76a51f
baseline version:
 xen                  81fd0d3ca4b2cd309403c6e8da662c325dd35750

Last test of basis   152385  2020-08-02 09:18:50 Z    3 days
Testing same since   152488  2020-08-05 09:18:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   81fd0d3ca4..c9f9a7258d  c9f9a7258dc07735e2da2b6d0b51a0218c76a51f -> coverity-tested/smoke

