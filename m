Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A7583455
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 22:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376489.609304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGo87-0004cs-AH; Wed, 27 Jul 2022 20:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376489.609304; Wed, 27 Jul 2022 20:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGo87-0004ZJ-6c; Wed, 27 Jul 2022 20:59:43 +0000
Received: by outflank-mailman (input) for mailman id 376489;
 Wed, 27 Jul 2022 20:59:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGo85-0004Z9-Bw; Wed, 27 Jul 2022 20:59:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGo85-0007RO-A9; Wed, 27 Jul 2022 20:59:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGo85-0003Br-16; Wed, 27 Jul 2022 20:59:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oGo85-0004CM-0g; Wed, 27 Jul 2022 20:59:41 +0000
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
	bh=UPsckrbMvRWa8+uDEt2rJHpe7dJZ/G5QrxE3LPx/30E=; b=O690Hv67cFrt7W/0dKG6pxrivZ
	eJwxCK8bY7wEmQ+xkLVN9bKYfIriTsWTLqeqQWVH5vdRvyxv4RVcCPU65WgMlwPfusLQp+Bz+zC7n
	8/c+maPnOLhhmX3sZ0byCvGjvRGRUO4M2bAKm134qPeG3yTRAl1h/Cir43iIaiZiVaUU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171888-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171888: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2677286307c67b62c198cf6890d62ec540dd8c99
X-Osstest-Versions-That:
    ovmf=e3d468acb9ce26a75fee45d742619ac1c6683280
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Jul 2022 20:59:41 +0000

flight 171888 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171888/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2677286307c67b62c198cf6890d62ec540dd8c99
baseline version:
 ovmf                 e3d468acb9ce26a75fee45d742619ac1c6683280

Last test of basis   171883  2022-07-27 10:10:34 Z    0 days
Testing same since   171888  2022-07-27 17:10:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  James Lu <james.lu@intel.com>

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
   e3d468acb9..2677286307  2677286307c67b62c198cf6890d62ec540dd8c99 -> xen-tested-master

