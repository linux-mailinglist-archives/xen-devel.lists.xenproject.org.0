Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6C79CF37
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 13:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600403.936046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg1DY-0004Jn-Pq; Tue, 12 Sep 2023 11:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600403.936046; Tue, 12 Sep 2023 11:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg1DY-0004Gc-Lv; Tue, 12 Sep 2023 11:06:04 +0000
Received: by outflank-mailman (input) for mailman id 600403;
 Tue, 12 Sep 2023 11:06:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg1DX-0004GS-Hb; Tue, 12 Sep 2023 11:06:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg1DX-00043a-7x; Tue, 12 Sep 2023 11:06:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg1DW-0005FY-SX; Tue, 12 Sep 2023 11:06:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qg1DW-00088o-S3; Tue, 12 Sep 2023 11:06:02 +0000
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
	bh=A/dcy7qsnFkO9sMqSMUmRNvDzjH2EcmgrehrRs1KUNI=; b=3LAT7IBnfSD3nR/5ku5ri4pYrr
	3XtSCCR0q60PpA8HQj/UGzSaW9rKzY2BtGrceOihFqQw32tn19SysSP95j0Qjtl9aY10OC8Ka96i9
	jNl05CSQ4JWb7arhgZdW+sQRetRGcNqy6dKtQT8msj9bFtvougcZs4quIfaCTIXo6L6c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182961-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182961: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b7a48bed16dd75ce6a864540ab7dc38d8f1f657b
X-Osstest-Versions-That:
    ovmf=e880c307c5808a9a972e5bf3b859396610edd67b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Sep 2023 11:06:02 +0000

flight 182961 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182961/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b7a48bed16dd75ce6a864540ab7dc38d8f1f657b
baseline version:
 ovmf                 e880c307c5808a9a972e5bf3b859396610edd67b

Last test of basis   182956  2023-09-12 03:10:46 Z    0 days
Testing same since   182961  2023-09-12 07:44:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>

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
   e880c307c5..b7a48bed16  b7a48bed16dd75ce6a864540ab7dc38d8f1f657b -> xen-tested-master

