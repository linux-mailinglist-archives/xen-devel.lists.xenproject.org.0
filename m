Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A631AB4C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 13:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84575.158651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAty0-0004bi-89; Sat, 13 Feb 2021 12:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84575.158651; Sat, 13 Feb 2021 12:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAty0-0004bJ-4g; Sat, 13 Feb 2021 12:24:04 +0000
Received: by outflank-mailman (input) for mailman id 84575;
 Sat, 13 Feb 2021 12:24:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAtxy-0004bB-VD; Sat, 13 Feb 2021 12:24:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAtxy-0008GP-N6; Sat, 13 Feb 2021 12:24:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lAtxy-0006rF-GO; Sat, 13 Feb 2021 12:24:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lAtxy-0005bP-Fq; Sat, 13 Feb 2021 12:24:02 +0000
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
	bh=tUglYL5CalXB/0+Da2uri6+y2VhUCHB4UYYkjA/0l1s=; b=T/Kl7rEGgyzirShlv4I6ouC2wg
	H7czpkt4CyEYJllkwDZddlx8G92Swq+EbyBoGtFlGj9FgvTBhZQNoEn+WPaieXe4Pd80k7A1fo4Ys
	w7QVKnFrgKfbX46eIHp3NhNfI+viLcRfBPAs3WbSBhfTZ25hvOg6mXm1OdYu/DF7T4LM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159300-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159300: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2e1e8c35f3178df95d79da81ac6deec242da74c2
X-Osstest-Versions-That:
    ovmf=1d27e58e401faea284309039f3962cb3cb4549fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Feb 2021 12:24:02 +0000

flight 159300 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159300/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2e1e8c35f3178df95d79da81ac6deec242da74c2
baseline version:
 ovmf                 1d27e58e401faea284309039f3962cb3cb4549fc

Last test of basis   159248  2021-02-11 10:27:56 Z    2 days
Testing same since   159300  2021-02-12 14:25:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  Joey Gouly <joey.gouly@arm.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Tim Crawford <tcrawford@system76.com>

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
   1d27e58e40..2e1e8c35f3  2e1e8c35f3178df95d79da81ac6deec242da74c2 -> xen-tested-master

