Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E51D11B2
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 13:46:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYppb-00040R-42; Wed, 13 May 2020 11:45:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Rkd=63=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jYppZ-00040M-8o
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 11:45:45 +0000
X-Inumbo-ID: 476c26c2-950f-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 476c26c2-950f-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVB4aG5SeqwAAVW50UExMlMg86lcC/eXjRNkFbR/aFg=; b=NiJOZyqI0GXqBJs1h3EgsfuaM
 bQ5WDtharWZGWDLEqwoy7UqnmfrbM9IwyYu+ZG5LR0RNtoBLouQWL0D6lL8Pz2PcJtYhDNyuZ/sRV
 vDoap6AzDUph7QjYEsRRQBEzk0SfXAx+VhqaRv96zjSnLqSLM00FhSpGyXSuSQh9rzfso=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYppY-0005Aq-5d; Wed, 13 May 2020 11:45:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jYppX-00050P-NT; Wed, 13 May 2020 11:45:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jYppX-0007Np-Mq; Wed, 13 May 2020 11:45:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150156-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150156: regressions - FAIL
X-Osstest-Failures: ovmf:build-i386-xsm:xen-build:fail:regression
X-Osstest-Versions-This: ovmf=242ab73d7f255d5d859eaf74a23b9d68c686d177
X-Osstest-Versions-That: ovmf=88899a372cfc44f8612315f4b43a084d1814fe69
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 May 2020 11:45:43 +0000
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

flight 150156 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150156/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 150152

version targeted for testing:
 ovmf                 242ab73d7f255d5d859eaf74a23b9d68c686d177
baseline version:
 ovmf                 88899a372cfc44f8612315f4b43a084d1814fe69

Last test of basis   150152  2020-05-12 19:39:31 Z    0 days
Testing same since   150156  2020-05-13 06:10:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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


Not pushing.

------------------------------------------------------------
commit 242ab73d7f255d5d859eaf74a23b9d68c686d177
Author: Michael Kubacki <michael.kubacki@microsoft.com>
Date:   Sat May 9 10:22:42 2020 +0800

    BaseTools/Ecc: Replace deprecated function time.clock()
    
    REF:https://bugzilla.tianocore.org/show_bug.cgi?id=2707
    
    Ecc fails with Python 3.8 because it uses the deprecated time.clock()
    function - https://docs.python.org/3.7/library/time.html#time.clock
    
    This change updates EccMain.py to use time.perf_counter().
    
    Cc: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <liming.gao@intel.com>
    Signed-off-by: Michael Kubacki <michael.kubacki@microsoft.com>
    Reviewed-by: Bob Feng <bob.c.feng@intel.com>

