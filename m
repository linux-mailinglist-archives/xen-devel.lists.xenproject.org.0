Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287519BB47
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 07:23:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJsGb-0000Qy-31; Thu, 02 Apr 2020 05:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9JfQ=5S=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jJsGZ-0000QE-Sa
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 05:19:47 +0000
X-Inumbo-ID: 9183dafe-74a1-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9183dafe-74a1-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 05:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zvTLZVxy9OnRbN3WHpzrPG//XoYAqIlWEeJbqz4AIpM=; b=1IHQHPqxvMrM+71axni8WoXOx
 94uiIKHRGL1xYkFsQ0Ok8LKNyg+nBhTS8aG1et3H2gxzgdgbi2+oDVK/VVc4VkxCbI29Ku0vk6RXo
 xJjQ+ErjtUpJi+g6oQm6GFofLwm0oWJ+HpQBofBVOmnlNbmdMIAU5g4ccP3rB+4SHxC0M=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJsGY-0004o0-I7; Thu, 02 Apr 2020 05:19:46 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJsGY-0004We-8Z; Thu, 02 Apr 2020 05:19:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jJsGY-00039a-7z; Thu, 02 Apr 2020 05:19:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149292-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149292: all pass - PUSHED
X-Osstest-Versions-This: ovmf=e210fc130e5c9738909dca432bbf8bf277ba6e37
X-Osstest-Versions-That: ovmf=dd7523b5b123de6f0730f2f2abb207f2a5c1ccd4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Apr 2020 05:19:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149292 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149292/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e210fc130e5c9738909dca432bbf8bf277ba6e37
baseline version:
 ovmf                 dd7523b5b123de6f0730f2f2abb207f2a5c1ccd4

Last test of basis   149262  2020-04-01 00:39:27 Z    1 days
Testing same since   149292  2020-04-01 15:23:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Liran Alon <liran.alon@oracle.com>
  Maciej Rabeda <maciej.rabeda@linux.intel.com>
  Vitaly Cheptsov <cheptsov@ispras.ru>
  Vitaly Cheptsov <vit9696@protonmail.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   dd7523b5b1..e210fc130e  e210fc130e5c9738909dca432bbf8bf277ba6e37 -> xen-tested-master

