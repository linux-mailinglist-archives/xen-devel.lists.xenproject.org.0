Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB53369C3E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 23:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116602.222515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1la3hu-00024F-P6; Fri, 23 Apr 2021 21:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116602.222515; Fri, 23 Apr 2021 21:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1la3hu-00023k-Lu; Fri, 23 Apr 2021 21:51:26 +0000
Received: by outflank-mailman (input) for mailman id 116602;
 Fri, 23 Apr 2021 21:51:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1la3hu-00023c-0o; Fri, 23 Apr 2021 21:51:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1la3ht-0006U5-S1; Fri, 23 Apr 2021 21:51:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1la3ht-0006aH-J5; Fri, 23 Apr 2021 21:51:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1la3ht-0006Pt-If; Fri, 23 Apr 2021 21:51:25 +0000
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
	bh=EpDyBOW/at/1guHY38NBBaU0ncioEhtSZMqpafcmHrU=; b=AXmPI6dJz1GdK0+W4G9ptd4q8W
	GagOxyFteQY1iksJ3byDEAt5TJv7+ecBORBBm3PaFiCLVNkkfYdgTbAH2Mt4rPETRmxBmOhi/6Hp6
	br3Avr6AyJgpkaGeXaMhwEXE5dm815Itqia3BeZZPbvaJXU9fMfmn/tjuNl9rHIezeCQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161406-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161406: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=61680cac5e435053be89a4fc6b945466f2c7bac6
X-Osstest-Versions-That:
    ovmf=d3b0d007a135284981fa750612a47234b83976f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Apr 2021 21:51:25 +0000

flight 161406 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161406/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 61680cac5e435053be89a4fc6b945466f2c7bac6
baseline version:
 ovmf                 d3b0d007a135284981fa750612a47234b83976f9

Last test of basis   161326  2021-04-20 12:41:12 Z    3 days
Testing same since   161406  2021-04-23 11:41:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Erdem Aktas <erdemaktas@google.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Min M Xu <min.m.xu@intel.com>

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
   d3b0d007a1..61680cac5e  61680cac5e435053be89a4fc6b945466f2c7bac6 -> xen-tested-master

