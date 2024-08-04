Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60113946EC8
	for <lists+xen-devel@lfdr.de>; Sun,  4 Aug 2024 14:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771645.1182124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saamF-0006Ck-Sq; Sun, 04 Aug 2024 12:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771645.1182124; Sun, 04 Aug 2024 12:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saamF-0006A3-QD; Sun, 04 Aug 2024 12:55:59 +0000
Received: by outflank-mailman (input) for mailman id 771645;
 Sun, 04 Aug 2024 12:55:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1saamE-00069s-HA; Sun, 04 Aug 2024 12:55:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1saamE-0001hW-Aq; Sun, 04 Aug 2024 12:55:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1saamE-0000LC-37; Sun, 04 Aug 2024 12:55:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1saamE-0000dF-2P; Sun, 04 Aug 2024 12:55:58 +0000
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
	bh=KH27cPa20AbXR6ha/9kQuRFKr5r9LgEcIYhOGTm4sy0=; b=HdEE6yK7ugzdXCdQSTvAcCVYdZ
	nWjs935dnoVO5YZKs8r/uybjYF+lJWeZGzI9VxvJYpciT/2h58SuWapimjsaWZcKAin+2yJhqoAMG
	Qsy2dRv8NoPWg+xM0BoXqOR3UGvb6tt9XPp100iUy2eAOwKuJPS8bgSkF3976SClxD9E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187146-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187146: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5ff99e0dabefea14b04e190c1659f4817fcb7bc0
X-Osstest-Versions-That:
    ovmf=159f1aee56d270d2575e50eb2af077abe182fc9b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Aug 2024 12:55:58 +0000

flight 187146 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187146/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5ff99e0dabefea14b04e190c1659f4817fcb7bc0
baseline version:
 ovmf                 159f1aee56d270d2575e50eb2af077abe182fc9b

Last test of basis   187144  2024-08-04 07:41:35 Z    0 days
Testing same since   187146  2024-08-04 11:13:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Pop <aaronpop@microsoft.com>
  joe <37425738+JoeLopez333@users.noreply.github.com>

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
   159f1aee56..5ff99e0dab  5ff99e0dabefea14b04e190c1659f4817fcb7bc0 -> xen-tested-master

