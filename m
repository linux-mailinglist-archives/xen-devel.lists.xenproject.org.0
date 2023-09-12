Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F779D9BB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 21:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600782.936563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg9J7-0003zf-FQ; Tue, 12 Sep 2023 19:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600782.936563; Tue, 12 Sep 2023 19:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg9J7-0003xt-CL; Tue, 12 Sep 2023 19:44:21 +0000
Received: by outflank-mailman (input) for mailman id 600782;
 Tue, 12 Sep 2023 19:44:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg9J5-0003xj-TV; Tue, 12 Sep 2023 19:44:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg9J5-0007dN-SN; Tue, 12 Sep 2023 19:44:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qg9J5-0000mo-LO; Tue, 12 Sep 2023 19:44:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qg9J5-0006LA-Kr; Tue, 12 Sep 2023 19:44:19 +0000
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
	bh=M6s91KVpI4KU2CFi3qpTmhLSSk4nKENlgeuoon0IeJM=; b=WQQH+k2CwEaXSBrGgtYNvpimMG
	EYAf50/t/5y+1f8B0bjYefrCbmQUKm8s5lc7wBQtxCYa02LI9GuQz4Rf2s6DFkCzeng2/cDzjrkGB
	2ENxZ9Pi2vioB0LdjRTY6Es0Ubm/+U5czFpI8FLxosx9cPimNt/uGGpUcoWoeFm5ro4I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182974-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182974: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=7f1a8cad9945674f068ff5e98a533280a7f0efb1
X-Osstest-Versions-That:
    ovmf=4f4a2c3b0768cd389c8f27ec77871887ba89e6f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Sep 2023 19:44:19 +0000

flight 182974 ovmf real [real]
flight 182980 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182974/
http://logs.test-lab.xenproject.org/osstest/logs/182980/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 182980-retest

version targeted for testing:
 ovmf                 7f1a8cad9945674f068ff5e98a533280a7f0efb1
baseline version:
 ovmf                 4f4a2c3b0768cd389c8f27ec77871887ba89e6f5

Last test of basis   182964  2023-09-12 11:12:21 Z    0 days
Testing same since   182974  2023-09-12 16:12:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Laszlo Ersek <lersek@redhat.com>
  Sunil V L <sunilvl@ventanamicro.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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
   4f4a2c3b07..7f1a8cad99  7f1a8cad9945674f068ff5e98a533280a7f0efb1 -> xen-tested-master

