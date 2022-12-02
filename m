Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F008063FD45
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 01:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451336.709029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0uEg-0003Uv-WA; Fri, 02 Dec 2022 00:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451336.709029; Fri, 02 Dec 2022 00:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0uEg-0003S1-Si; Fri, 02 Dec 2022 00:49:02 +0000
Received: by outflank-mailman (input) for mailman id 451336;
 Fri, 02 Dec 2022 00:49:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0uEg-0003Rr-2Z; Fri, 02 Dec 2022 00:49:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0uEg-000129-1g; Fri, 02 Dec 2022 00:49:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p0uEf-0000Lv-Rb; Fri, 02 Dec 2022 00:49:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p0uEf-0003mk-R8; Fri, 02 Dec 2022 00:49:01 +0000
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
	bh=zZn593IqHfUOBnOdvtOkI1CgadrbvV8zk46HgGJJ5YU=; b=HmADGPOjFUyBiojmhuqvbzsnph
	SDsEJwOsOs5Oq/0b+BwFAe0OF7wGWfZvOtnsLPR5XOdqSCqn2MvluXdwX4a7ydgmMGt7XdJy0BAV+
	SC2PgJGurxjihgzhRwGxr04z9DXf3MzBtD+ZMH6VpfUS4TZML4gF3TliyJGgjIWblJ5I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175014-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175014: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a1d57239140f09a8b2cc386f9421f6f4e634435f
X-Osstest-Versions-That:
    ovmf=a8a78ef194f4a6aaf4c178d1c545a372c94e88bb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Dec 2022 00:49:01 +0000

flight 175014 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175014/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a1d57239140f09a8b2cc386f9421f6f4e634435f
baseline version:
 ovmf                 a8a78ef194f4a6aaf4c178d1c545a372c94e88bb

Last test of basis   175003  2022-12-01 09:44:56 Z    0 days
Testing same since   175014  2022-12-01 21:10:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   a8a78ef194..a1d5723914  a1d57239140f09a8b2cc386f9421f6f4e634435f -> xen-tested-master

