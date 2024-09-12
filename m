Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8A975E7B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 03:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796977.1206737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYck-0001Dq-FN; Thu, 12 Sep 2024 01:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796977.1206737; Thu, 12 Sep 2024 01:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYck-0001Bq-Ce; Thu, 12 Sep 2024 01:27:54 +0000
Received: by outflank-mailman (input) for mailman id 796977;
 Thu, 12 Sep 2024 01:27:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soYcj-0001Bg-3o; Thu, 12 Sep 2024 01:27:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soYcj-0007rG-16; Thu, 12 Sep 2024 01:27:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soYci-0000Hq-GV; Thu, 12 Sep 2024 01:27:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soYci-0008GA-Fu; Thu, 12 Sep 2024 01:27:52 +0000
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
	bh=/1Ep2Y0PRe5IXDEE1IKWRAyxVQMjogxfSTfHRApvx2w=; b=5vFT+Qi89a1lJ1x+OUHFh7Gac6
	jEZh3LCX2NcPD9bVSIyydZTbmISesvrU86RtW1A2EHA+4tw7MZ4RNehduZDx2EU6DtSGaPNAcuDUO
	9sMhcWLiKvQPl6rs4h7fK+YihdmLu8dmfP7drCjnKCUH0az3PsQrlqfgFpacAQuGzP34=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187665-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187665: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e41e728c1640d5f3c5c24c31e088bf34f2fde197
X-Osstest-Versions-That:
    ovmf=03c8ec6ce29e47abca2b598bba9a05ddd87afc17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2024 01:27:52 +0000

flight 187665 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187665/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e41e728c1640d5f3c5c24c31e088bf34f2fde197
baseline version:
 ovmf                 03c8ec6ce29e47abca2b598bba9a05ddd87afc17

Last test of basis   187664  2024-09-11 21:41:37 Z    0 days
Testing same since   187665  2024-09-11 23:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali <ashraf.ali.s@intel.com>

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
   03c8ec6ce2..e41e728c16  e41e728c1640d5f3c5c24c31e088bf34f2fde197 -> xen-tested-master

