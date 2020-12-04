Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF002CE6F8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 05:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44049.78987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl2UI-0001ps-51; Fri, 04 Dec 2020 04:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44049.78987; Fri, 04 Dec 2020 04:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl2UH-0001pH-US; Fri, 04 Dec 2020 04:14:29 +0000
Received: by outflank-mailman (input) for mailman id 44049;
 Fri, 04 Dec 2020 04:14:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kl2UG-0001p9-TE; Fri, 04 Dec 2020 04:14:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kl2UG-00051e-MO; Fri, 04 Dec 2020 04:14:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kl2UG-0002Z0-CG; Fri, 04 Dec 2020 04:14:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kl2UG-0000ZJ-Bn; Fri, 04 Dec 2020 04:14:28 +0000
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
	bh=NgjS20NBDt3BVqJ27dza1RwLQ+ZldJdz3R/PC1cUXlE=; b=PpwpTCKiD+xRw7Em4yBZ79/Pfs
	g9bt+HL0yfDqKLxwuaL1WcUJkCJ9K8/rY966/p3clXvN3J+VdhvVV0kPm506bJMmpc5olrBWTbOBA
	+DaK3NOpMkozHfXwtFDESUlPUmb6p1vF2tYRuqjKK+yIc/hMSF9PdXXl2NedHwzwrZWc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157191-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157191: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6af76adbbfccd31f4f8753fb0ddbbd9f4372f572
X-Osstest-Versions-That:
    ovmf=126115a9fb3f89f8609336c87aa82fe7da19a9aa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Dec 2020 04:14:28 +0000

flight 157191 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157191/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6af76adbbfccd31f4f8753fb0ddbbd9f4372f572
baseline version:
 ovmf                 126115a9fb3f89f8609336c87aa82fe7da19a9aa

Last test of basis   157184  2020-12-03 17:09:49 Z    0 days
Testing same since   157191  2020-12-04 01:39:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Ray Ni <ray.ni@intel.com>

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
   126115a9fb..6af76adbbf  6af76adbbfccd31f4f8753fb0ddbbd9f4372f572 -> xen-tested-master

