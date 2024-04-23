Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84588AFC7F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 01:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710981.1110585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzPPY-0005H0-Rn; Tue, 23 Apr 2024 23:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710981.1110585; Tue, 23 Apr 2024 23:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzPPY-0005FT-OO; Tue, 23 Apr 2024 23:18:52 +0000
Received: by outflank-mailman (input) for mailman id 710981;
 Tue, 23 Apr 2024 23:18:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzPPX-0005FJ-Ca; Tue, 23 Apr 2024 23:18:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzPPW-0002yB-P8; Tue, 23 Apr 2024 23:18:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzPPW-0002Vu-B4; Tue, 23 Apr 2024 23:18:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzPPW-0000U9-Ad; Tue, 23 Apr 2024 23:18:50 +0000
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
	bh=9ED+pNd1dkoCFDrS7bf4UmL8q6dvZMmyrwzFw9570uk=; b=T9RFHkbUiltPncozd1gc30mZnz
	FCZ36TiJNBc/FR2+BoYIyryqNY/YpVXj/yU0npmqXNtOxW47ebLky+sRJC0+d4tysqdw11mvyiDB4
	hVFL4bGejrW/cfaH+wMJdc6xqPkbfK6aziZKCp/PowVM/beW2BablEEHgbSFqWooN9NA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185776-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185776: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d97f964f7ce063f9861f4d21cc6352f6861f95a8
X-Osstest-Versions-That:
    ovmf=e3fa6986ae8521275fc6ca161f7394a3809f8723
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Apr 2024 23:18:50 +0000

flight 185776 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185776/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d97f964f7ce063f9861f4d21cc6352f6861f95a8
baseline version:
 ovmf                 e3fa6986ae8521275fc6ca161f7394a3809f8723

Last test of basis   185773  2024-04-23 17:41:11 Z    0 days
Testing same since   185776  2024-04-23 21:41:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   e3fa6986ae..d97f964f7c  d97f964f7ce063f9861f4d21cc6352f6861f95a8 -> xen-tested-master

