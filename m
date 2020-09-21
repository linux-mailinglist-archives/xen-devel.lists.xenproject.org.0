Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFCE271F69
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 11:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKIYr-0006qq-Q3; Mon, 21 Sep 2020 09:56:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qZJ=C6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kKIYq-0006qU-Lh
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 09:56:40 +0000
X-Inumbo-ID: bb422a83-6076-4c45-8f56-10035fad8c44
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb422a83-6076-4c45-8f56-10035fad8c44;
 Mon, 21 Sep 2020 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=LbZCtoPsIAq5CuqMBRnysf5RiRc2LMOhNeD6ISQ0D88=; b=ieImbf0Oupx13VoB41m33LALEp
 /6NXXp61tmUTxmccSeWdy9d/2ghme1m1tU4zP122Xcz5H0n/iN0G/w2I3L0AqnNiSgbArfMk6MoMA
 AbO58ctxHy1Qn40W19OLw2j01GhqUWdxtx1YhGC+lGjXLqV2Exf/N1zlJx5kFsSVwpM0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kKIYk-0005Ww-6Q; Mon, 21 Sep 2020 09:56:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kKIYj-0000XN-SD; Mon, 21 Sep 2020 09:56:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kKIYj-00035I-Re; Mon, 21 Sep 2020 09:56:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154558-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154558: all pass - PUSHED
X-Osstest-Versions-This: ovmf=ea9af51479fe04955443f0d366376a1008f07c94
X-Osstest-Versions-That: ovmf=7faece69854cbcc593643182581b5d7f99b7dab6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Sep 2020 09:56:33 +0000
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

flight 154558 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154558/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ea9af51479fe04955443f0d366376a1008f07c94
baseline version:
 ovmf                 7faece69854cbcc593643182581b5d7f99b7dab6

Last test of basis   154468  2020-09-18 12:10:39 Z    2 days
Testing same since   154558  2020-09-21 03:10:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Divneil Rai Wadhawan <divneil.r.wadhawan@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   7faece6985..ea9af51479  ea9af51479fe04955443f0d366376a1008f07c94 -> xen-tested-master

