Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CC35A5ED
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 20:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107928.206257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUw2C-0008Vh-8H; Fri, 09 Apr 2021 18:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107928.206257; Fri, 09 Apr 2021 18:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUw2C-0008V8-26; Fri, 09 Apr 2021 18:39:12 +0000
Received: by outflank-mailman (input) for mailman id 107928;
 Fri, 09 Apr 2021 18:39:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUw2A-0008V0-Hu; Fri, 09 Apr 2021 18:39:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUw2A-0007wG-Bm; Fri, 09 Apr 2021 18:39:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUw2A-0004p2-3Q; Fri, 09 Apr 2021 18:39:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lUw2A-0006eA-2x; Fri, 09 Apr 2021 18:39:10 +0000
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
	bh=1gNlxXyzQNNcVeLssvHRkOiJU2RIHQ+uVi0a3m8Nshc=; b=GrINAPbl5n+vY8MAfZturTtTVv
	PkD1BIHxmKa5wOJ9hIfTzWtMCXWuVvNGuTrlt6MsqTN+9pXd0dzghrWIbnP7A35rigCa55BVqAtao
	xGRj31XrFFGgvqDr4tBE6rzGEcuYJEUDnhfsxFFitca6lMeMTNiuCttHl3CTYOn35xmM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160859-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160859: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=efa7f4df0f3b9e70d49dc41b397ec8400c1ad374
X-Osstest-Versions-That:
    ovmf=19d5bccc7663399c0726aac800ddd4591be0176a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Apr 2021 18:39:10 +0000

flight 160859 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160859/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 efa7f4df0f3b9e70d49dc41b397ec8400c1ad374
baseline version:
 ovmf                 19d5bccc7663399c0726aac800ddd4591be0176a

Last test of basis   160841  2021-04-09 01:14:33 Z    0 days
Testing same since   160859  2021-04-09 10:33:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Sheng Wei <w.sheng@intel.com>
  Sheng, W <w.sheng@intel.com>

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
   19d5bccc76..efa7f4df0f  efa7f4df0f3b9e70d49dc41b397ec8400c1ad374 -> xen-tested-master

