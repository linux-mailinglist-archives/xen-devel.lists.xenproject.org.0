Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E57719CF0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542490.846410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4i1H-00011U-Fg; Thu, 01 Jun 2023 13:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542490.846410; Thu, 01 Jun 2023 13:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4i1H-0000zM-Cm; Thu, 01 Jun 2023 13:07:11 +0000
Received: by outflank-mailman (input) for mailman id 542490;
 Thu, 01 Jun 2023 13:07:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4i1F-0000z4-M2; Thu, 01 Jun 2023 13:07:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4i1F-0001Jk-II; Thu, 01 Jun 2023 13:07:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4i1E-0002RA-F4; Thu, 01 Jun 2023 13:07:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4i1E-00032p-Ea; Thu, 01 Jun 2023 13:07:08 +0000
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
	bh=xEwLbIqsRL8oEYpgsuO9d4aWmeXj3m5G9BOML9tTgw8=; b=Q751KtItUfa7XBC9VCD6JLPj7v
	3/1MIEx/ail20ead7E+y4+PRAJCc8Z0KVgBL6Fm7xlMcOumYd63tCk8eZKsHCKUMPDBWY59jzpvOh
	0/inAVNk9mVedefeJZLf9lzW38JI0t1q+OfxARQmzsTDd7hZxrLdTm7PQXKIfyRahFCw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181076-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181076: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1df6658bcbc4cade29a8763808a9804e5d449046
X-Osstest-Versions-That:
    ovmf=c1e853769046b322690ad336fdb98966757e7414
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jun 2023 13:07:08 +0000

flight 181076 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181076/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1df6658bcbc4cade29a8763808a9804e5d449046
baseline version:
 ovmf                 c1e853769046b322690ad336fdb98966757e7414

Last test of basis   181072  2023-06-01 09:10:44 Z    0 days
Testing same since   181076  2023-06-01 11:12:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Liming Gao <gaoliming@byosoft.com.cn>
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
   c1e8537690..1df6658bcb  1df6658bcbc4cade29a8763808a9804e5d449046 -> xen-tested-master

