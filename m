Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429C975A72
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 20:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796815.1206528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soSEg-0003z5-2v; Wed, 11 Sep 2024 18:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796815.1206528; Wed, 11 Sep 2024 18:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soSEf-0003wc-W9; Wed, 11 Sep 2024 18:38:37 +0000
Received: by outflank-mailman (input) for mailman id 796815;
 Wed, 11 Sep 2024 18:38:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soSEe-0003wS-Vv; Wed, 11 Sep 2024 18:38:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soSEe-0001DE-Ty; Wed, 11 Sep 2024 18:38:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soSEe-00087R-HN; Wed, 11 Sep 2024 18:38:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soSEe-0007hv-Gu; Wed, 11 Sep 2024 18:38:36 +0000
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
	bh=IY/7ax+NFuWCz31h7mXNB5FeZQ2+SATtj1u54cjcR6A=; b=rpP4ynpOncoE84DZnQHfVcK1Hg
	mD37aVf543Ri7zLQwnZht/eQ+cpI9S5yVrkKCtFK36uLcljcLy4xHMO/Q0dA72TuzEG8NDStfwnw/
	FpqUtOelqGKwLyQ8i2TCzzy11DRmqxBO5yI7soIxSmvhKWzPysuTTYHrMEHUP5YlMZtE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187660-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187660: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=589304e67fbfcbb7c250d1a3031ef23c4fb8a41b
X-Osstest-Versions-That:
    ovmf=58b4bf7b7e526cec295bfbc6caa4a5cf223a1c53
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Sep 2024 18:38:36 +0000

flight 187660 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187660/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 589304e67fbfcbb7c250d1a3031ef23c4fb8a41b
baseline version:
 ovmf                 58b4bf7b7e526cec295bfbc6caa4a5cf223a1c53

Last test of basis   187655  2024-09-11 08:45:18 Z    0 days
Testing same since   187660  2024-09-11 16:45:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ethan Hsu <Eathonhsu@gmail.com>
  yhsu3 <yhsu3@lenovo.com>

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
   58b4bf7b7e..589304e67f  589304e67fbfcbb7c250d1a3031ef23c4fb8a41b -> xen-tested-master

