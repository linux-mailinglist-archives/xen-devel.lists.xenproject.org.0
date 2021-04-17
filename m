Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A94362E33
	for <lists+xen-devel@lfdr.de>; Sat, 17 Apr 2021 08:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112023.214200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXeu3-0007Al-5x; Sat, 17 Apr 2021 06:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112023.214200; Sat, 17 Apr 2021 06:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXeu3-0007AJ-0z; Sat, 17 Apr 2021 06:58:03 +0000
Received: by outflank-mailman (input) for mailman id 112023;
 Sat, 17 Apr 2021 06:58:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXeu1-0007AB-LT; Sat, 17 Apr 2021 06:58:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXeu1-0006F0-EE; Sat, 17 Apr 2021 06:58:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXeu1-0001WK-64; Sat, 17 Apr 2021 06:58:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lXeu1-0001Ha-5Y; Sat, 17 Apr 2021 06:58:01 +0000
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
	bh=EFaZDaHr4hJDOKPQ3kN/zsWXF6bbZknVtVbaCHvA1TA=; b=OoEeUkBsuxxo/egjuhBMpt/e7b
	Z9dBv8lkyQpKpk/fE12nnCobk7tvzQHnOzMEtlJ/tN9wxElYSVIM15cewO/7xP6HfxeHol+B0Giv4
	4mzA3e+ZqOF7niwq9zeKkYuWIpMjt5jDfjJ8wOdzwkv968CnEIrPlW2/22VVMokQZTtA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161204-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161204: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=99e7e48cc7117c37fc1c08a741872d0875595796
X-Osstest-Versions-That:
    ovmf=96479947bcd7b425e4f2196b06701fd8ec3da595
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Apr 2021 06:58:01 +0000

flight 161204 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161204/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 99e7e48cc7117c37fc1c08a741872d0875595796
baseline version:
 ovmf                 96479947bcd7b425e4f2196b06701fd8ec3da595

Last test of basis   161187  2021-04-16 00:11:21 Z    1 days
Testing same since   161204  2021-04-16 12:04:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Wenyi Xie <xiewenyi2@huawei.com>

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
   96479947bc..99e7e48cc7  99e7e48cc7117c37fc1c08a741872d0875595796 -> xen-tested-master

