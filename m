Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D541227686E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 07:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLJuN-0002sD-BJ; Thu, 24 Sep 2020 05:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUiC=DB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kLJuL-0002rs-St
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 05:35:05 +0000
X-Inumbo-ID: e30ec0d1-f57d-40d7-b5aa-693f3e6b2988
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e30ec0d1-f57d-40d7-b5aa-693f3e6b2988;
 Thu, 24 Sep 2020 05:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=dL42nVSFGQ8kf6vYJ7HAROGeUEOCEgd3I+bZhqozJDo=; b=1MZjetL0fe3ZFUCMRltrkD2ykJ
 V5xGxWix7tnJbRrOh19o/qYRT6KH9shXOPTpAuhGzQfCfIyOmyirdS1bIL3q9Tn7qQJP7Dl7CzUL9
 S9VkZo9YGydJ6vG/C2XL/b/JMCc0q1lkoZcTeHg8DduyrfaiALQpcAOe/k8DjTb7JtQQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLJuF-0004mu-Eb; Thu, 24 Sep 2020 05:34:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLJuF-0000j2-7U; Thu, 24 Sep 2020 05:34:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kLJuF-0000qf-72; Thu, 24 Sep 2020 05:34:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154633-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 154633: all pass - PUSHED
X-Osstest-Versions-This: ovmf=dd5c7e3c5282b084daa5bbf0ec229cec699b2c17
X-Osstest-Versions-That: ovmf=fb97626fe04747ec89599dce0992def9a36e2f6b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Sep 2020 05:34:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154633 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154633/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17
baseline version:
 ovmf                 fb97626fe04747ec89599dce0992def9a36e2f6b

Last test of basis   154616  2020-09-22 14:09:46 Z    1 days
Testing same since   154633  2020-09-23 05:49:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>

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
   fb97626fe0..dd5c7e3c52  dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 -> xen-tested-master

