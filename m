Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904427250F0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 01:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544262.849912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6gUf-0008H4-5o; Tue, 06 Jun 2023 23:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544262.849912; Tue, 06 Jun 2023 23:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6gUf-0008Eq-2x; Tue, 06 Jun 2023 23:53:41 +0000
Received: by outflank-mailman (input) for mailman id 544262;
 Tue, 06 Jun 2023 23:53:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6gUd-0008Eg-Cb; Tue, 06 Jun 2023 23:53:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6gUd-00027Y-BY; Tue, 06 Jun 2023 23:53:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6gUd-00010v-3P; Tue, 06 Jun 2023 23:53:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6gUd-0003CI-2r; Tue, 06 Jun 2023 23:53:39 +0000
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
	bh=CJPWaa0yKwbMWY9vosroYUIyl/GhYooOA/UQsO3InbQ=; b=M/JBdl2tQwZ3iAvfpGp4u9vCjt
	vH13TRPKx6IbbSEh7HTieWP7zssB3H1ozVZFINvge8yiy1Bsr4/hlLmilufq5ABsDR8rhcOiqvRUc
	hB80ECgcLR8uDEMFOybuJoGjnxVw0UlXwxzkuVxvDft8mmbmguKGOKU3ZYymzmqt14lE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181225-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181225: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ded0b489af09cde5afa05d74acdb12cd4b4f8394
X-Osstest-Versions-That:
    ovmf=cdd20638bc97cef1356a5c687a412f869c637245
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jun 2023 23:53:39 +0000

flight 181225 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181225/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ded0b489af09cde5afa05d74acdb12cd4b4f8394
baseline version:
 ovmf                 cdd20638bc97cef1356a5c687a412f869c637245

Last test of basis   181221  2023-06-06 17:10:53 Z    0 days
Testing same since   181225  2023-06-06 21:54:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aryeh Chen <aryeh.chen@intel.com>
  Yong Li <yong.li@intel.com>

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
   cdd20638bc..ded0b489af  ded0b489af09cde5afa05d74acdb12cd4b4f8394 -> xen-tested-master

