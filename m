Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710440253A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180621.327358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWba-0008AF-RH; Tue, 07 Sep 2021 08:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180621.327358; Tue, 07 Sep 2021 08:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWba-00088J-NX; Tue, 07 Sep 2021 08:37:22 +0000
Received: by outflank-mailman (input) for mailman id 180621;
 Tue, 07 Sep 2021 08:37:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNWbZ-000889-Pj; Tue, 07 Sep 2021 08:37:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNWbZ-00081q-L0; Tue, 07 Sep 2021 08:37:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNWbZ-0002pt-By; Tue, 07 Sep 2021 08:37:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mNWbZ-0001cQ-BS; Tue, 07 Sep 2021 08:37:21 +0000
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
	bh=GpezyJmmiaztqkYLkEph0l5QPZZXhnLxPiQKIpkd1fM=; b=lwh5daN8GfWxPj0ZjrOENzMH+3
	A4MRCG5iFU0b/H0RXmohO7CliwmucvYGoArO/xUzrxvJrYgcQSZOuuJoe/rJU2j/CcyKuhh3V1R9W
	ewDzoTL6Rkmp+k+Ix+Ldj7gGX1ZLr1haOAgM9uFmF0AF4tPNzhhIC74tDpOxgsCOAVNo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164869-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164869: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0
X-Osstest-Versions-That:
    ovmf=4473834e7d49c555eca81f96383a1d6d6f5f4bb2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Sep 2021 08:37:21 +0000

flight 164869 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164869/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0
baseline version:
 ovmf                 4473834e7d49c555eca81f96383a1d6d6f5f4bb2

Last test of basis   164862  2021-09-06 15:10:03 Z    0 days
Testing same since   164869  2021-09-07 04:11:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Cheng Zhou <zhoucheng@phytium.com.cn>

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
   4473834e7d..a7cf2c5664  a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0 -> xen-tested-master

