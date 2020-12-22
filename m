Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3852E0B0D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 14:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57864.101442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kri0r-0003jh-Mw; Tue, 22 Dec 2020 13:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57864.101442; Tue, 22 Dec 2020 13:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kri0r-0003jG-IS; Tue, 22 Dec 2020 13:47:41 +0000
Received: by outflank-mailman (input) for mailman id 57864;
 Tue, 22 Dec 2020 13:47:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kri0q-0003j8-68; Tue, 22 Dec 2020 13:47:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kri0p-0008Gx-Va; Tue, 22 Dec 2020 13:47:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kri0p-00021D-OR; Tue, 22 Dec 2020 13:47:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kri0p-0003yO-Nv; Tue, 22 Dec 2020 13:47:39 +0000
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
	bh=BINYNGEuUkFPAcTRJBxm50T1vKjInzrKK46/6eOdcrs=; b=UsWMdnfRj/uikk6MgFfahCwvDJ
	8KZhlGoPWdknYqSkEisN4+urZ4AXya71QO6Zi1gnL+zhlJizwidIqx2TbQ+qiwGJ+c9nDC2rpxYiD
	Uj9KdJ90oz/vUFxQ3xFXTOBdDrIM8mGdqkyEtwCaddXUEYaaSSlsKUELZCPgC7oMNBc4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157787-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157787: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d4945b102730a54f58be6bda3369c6844565b7ee
X-Osstest-Versions-That:
    ovmf=35ed29f207fd9c3683cfee5492c5c4e96ee0a0eb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Dec 2020 13:47:39 +0000

flight 157787 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157787/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d4945b102730a54f58be6bda3369c6844565b7ee
baseline version:
 ovmf                 35ed29f207fd9c3683cfee5492c5c4e96ee0a0eb

Last test of basis   157778  2020-12-21 22:42:56 Z    0 days
Testing same since   157787  2020-12-22 09:58:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ming Tan <ming.tan@intel.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Tan, Ming <ming.tan@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   35ed29f207..d4945b1027  d4945b102730a54f58be6bda3369c6844565b7ee -> xen-tested-master

