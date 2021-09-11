Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB036407AC0
	for <lists+xen-devel@lfdr.de>; Sun, 12 Sep 2021 01:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185120.333853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPC9B-0001bb-DK; Sat, 11 Sep 2021 23:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185120.333853; Sat, 11 Sep 2021 23:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPC9B-0001Yn-86; Sat, 11 Sep 2021 23:10:57 +0000
Received: by outflank-mailman (input) for mailman id 185120;
 Sat, 11 Sep 2021 23:10:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPC99-0001Ya-8b; Sat, 11 Sep 2021 23:10:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPC98-0001DK-SE; Sat, 11 Sep 2021 23:10:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPC98-0006xa-FL; Sat, 11 Sep 2021 23:10:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mPC98-00041F-En; Sat, 11 Sep 2021 23:10:54 +0000
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
	bh=4CIOr3UD4lCq3jqLET8ODbPRp8QCXYPY9QDTcNKZVmA=; b=HbQLx/gqxfIFeWhwtAJqz9tzDF
	H+bluNY8KL412qCTQD9Q7lpjMX5v38TrRGEOqyGsCgip+sUv6pI13g8OaTNwY2KUamP3guE2xlp08
	tGzzfGmj5ao1fI69+sCZGjfh+3zdwZ+OtNtBI1ox+Pdp8NvPKyS+nHQWMEv0I7Y6L01s=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164946: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dcd3d63f4f77da5540bfe35d8ccb040d70644568
X-Osstest-Versions-That:
    ovmf=cf7c65059202e7858fbc00ce1f163ee243947e08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Sep 2021 23:10:54 +0000

flight 164946 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164946/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dcd3d63f4f77da5540bfe35d8ccb040d70644568
baseline version:
 ovmf                 cf7c65059202e7858fbc00ce1f163ee243947e08

Last test of basis   164937  2021-09-10 05:29:00 Z    1 days
Testing same since   164946  2021-09-11 00:12:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  duntan <dun.tan@intel.com>

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
   cf7c650592..dcd3d63f4f  dcd3d63f4f77da5540bfe35d8ccb040d70644568 -> xen-tested-master

