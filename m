Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D582036BCAE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 02:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117959.223903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBft-0000bA-8s; Tue, 27 Apr 2021 00:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117959.223903; Tue, 27 Apr 2021 00:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBft-0000ah-4W; Tue, 27 Apr 2021 00:34:01 +0000
Received: by outflank-mailman (input) for mailman id 117959;
 Tue, 27 Apr 2021 00:33:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfr-0000aZ-4X; Tue, 27 Apr 2021 00:33:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfq-00057W-VI; Tue, 27 Apr 2021 00:33:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfq-0007NO-Jw; Tue, 27 Apr 2021 00:33:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lbBfq-0004Jb-JR; Tue, 27 Apr 2021 00:33:58 +0000
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
	bh=sujppvLPlXVgYqdNcrghpU+0IVNlJzynaGEsFG58OVQ=; b=RBpn5kXYQ6PI3VlS/7wVtLiVCP
	0DLc2ka1dBLvONUCDqebzViM7w7xYCW36wnrLFBOq2PI0ajF97r3QlEc2RTGCIqWP7nzU0anqmM35
	TJOZYdi9erXEheF9MrdZ/faxoPQaNQ7OEU0lqljUbhGHAoAagyGAKJ6FYspUuK7N/ZbA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161469-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161469: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5396354b868bd6652600a654bba7df16701ac1cb
X-Osstest-Versions-That:
    ovmf=f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Apr 2021 00:33:58 +0000

flight 161469 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161469/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5396354b868bd6652600a654bba7df16701ac1cb
baseline version:
 ovmf                 f2f4c6be2dba3f8e97ac544b9c3da71e9f81b294

Last test of basis   161417  2021-04-23 22:13:28 Z    3 days
Testing same since   161469  2021-04-26 16:40:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaqi Gao <jiaqi.gao@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>

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
   f2f4c6be2d..5396354b86  5396354b868bd6652600a654bba7df16701ac1cb -> xen-tested-master

