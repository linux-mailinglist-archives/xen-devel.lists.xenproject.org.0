Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485653C8A1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 12:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341426.566649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx4We-0007qP-TG; Fri, 03 Jun 2022 10:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341426.566649; Fri, 03 Jun 2022 10:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx4We-0007oG-PJ; Fri, 03 Jun 2022 10:27:28 +0000
Received: by outflank-mailman (input) for mailman id 341426;
 Fri, 03 Jun 2022 10:27:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx4Wd-0007o6-Pd; Fri, 03 Jun 2022 10:27:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx4Wd-0001cF-NA; Fri, 03 Jun 2022 10:27:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx4Wd-0007db-7r; Fri, 03 Jun 2022 10:27:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nx4Wd-00017S-7R; Fri, 03 Jun 2022 10:27:27 +0000
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
	bh=yrYH2rmLQbQCQWJTfAX6bvDmigxlffm4Yltu4REm6XU=; b=alr0qZxJcIx24fQDPBv0lAZ7AA
	nmykZB5nbFiSdVtnFeol5jXHfcg6WP28HUYQ/dx9Owj8RT0N3EaqNQKCKogXHSa/jjI9sGItqk5Px
	wLPjpaGBaMpnWfNgsG8FLLIDLL0nmcBp9d7qmq8YmddAxxuPzfnh4glrJWWvPOsQbj90=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170816-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170816: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0223898f3e45e8c7e9d8ba01aea5f95a282f420b
X-Osstest-Versions-That:
    ovmf=64706ef761273ba403f9cb3b7a986bfb804c0a87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jun 2022 10:27:27 +0000

flight 170816 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170816/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0223898f3e45e8c7e9d8ba01aea5f95a282f420b
baseline version:
 ovmf                 64706ef761273ba403f9cb3b7a986bfb804c0a87

Last test of basis   170807  2022-06-02 09:13:22 Z    1 days
Testing same since   170816  2022-06-03 08:41:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dov Murik <dovmurik@linux.ibm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>

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
   64706ef761..0223898f3e  0223898f3e45e8c7e9d8ba01aea5f95a282f420b -> xen-tested-master

