Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D081650444
	for <lists+xen-devel@lfdr.de>; Sun, 18 Dec 2022 19:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465663.724456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6yIs-00041x-H6; Sun, 18 Dec 2022 18:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465663.724456; Sun, 18 Dec 2022 18:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6yIs-0003yq-Di; Sun, 18 Dec 2022 18:22:26 +0000
Received: by outflank-mailman (input) for mailman id 465663;
 Sun, 18 Dec 2022 18:22:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6yIq-0003yg-U3; Sun, 18 Dec 2022 18:22:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6yIq-0005Yb-Qw; Sun, 18 Dec 2022 18:22:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p6yIq-0000LH-7a; Sun, 18 Dec 2022 18:22:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p6yIq-0005FN-77; Sun, 18 Dec 2022 18:22:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=WlNV0uU1SHTq0pV0GlZ8UHtNJGaBVyCD3sMFHmuoyhg=; b=wbp6jGSlcLue5xcAK3Bn/7g8Pq
	LQ2wNNnZF3GXyOb5s9iUz8JrHGMe35TUq5FQwEuU2deHrjo8UTGzFoHVwAGLfDT7bTaa4oPIoolJB
	5X1e6YqcLIZws5piZ3MqC5z091DNL9kvAMnq8Jl4HknnlrH6VrcHlRkiaXhJotNo2hCs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175393-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175393: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=4dd7b865565aea4d28bea1b8d57d62620f6015a9
X-Osstest-Versions-That:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Dec 2022 18:22:24 +0000

flight 175393 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175393/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202

version targeted for testing:
 ovmf                 4dd7b865565aea4d28bea1b8d57d62620f6015a9
baseline version:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc

Last test of basis   175202  2022-12-14 13:42:59 Z    4 days
Failing since        175214  2022-12-14 18:42:16 Z    3 days   28 attempts
Testing same since   175384  2022-12-18 03:41:23 Z    0 days    7 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Dunlap <acdunlap@google.com>
  Ard Biesheuvel <ardb@kernel.org>
  devel@edk2.groups.io <devel@edk2.groups.io>
  Dov Murik <dovmurik@linux.ibm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Jeshua Smith <jeshuas@nvidia.com>
  Jiaqi Gao <jiaqi.gao@intel.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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

(No revision log; it would be 573 lines long.)

