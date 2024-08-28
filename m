Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D5A962A3A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784899.1194311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJeb-00064w-A0; Wed, 28 Aug 2024 14:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784899.1194311; Wed, 28 Aug 2024 14:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJeb-00062T-7P; Wed, 28 Aug 2024 14:28:09 +0000
Received: by outflank-mailman (input) for mailman id 784899;
 Wed, 28 Aug 2024 14:28:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjJeZ-00062C-9D; Wed, 28 Aug 2024 14:28:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjJeZ-0001la-3k; Wed, 28 Aug 2024 14:28:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjJeY-0001Qx-LL; Wed, 28 Aug 2024 14:28:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjJeY-0006Yj-Ki; Wed, 28 Aug 2024 14:28:06 +0000
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
	bh=+yiTx1I+hdMlRCl2nC92YTQ1wCKl9eXezEJ+hnaNxFU=; b=6YzTz+N4pHni4cgVV+86eYndCY
	ILF8pD4FETI5oThCVjI/JOpu7Kz07yV9rMLgeHKQ8TnpdEy+WUYxJtwmttWcQBoHbw7HR/La+ua7z
	zYaH/n6hiRBA3KxQpRHkGqScS1z0K1/U4LxQIlaMOgRZ9FShMEMNk/JppEmPHbBfhzWg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187382-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187382: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a0ac7cf67afd382b4bd13a402bb6100a435b5b7b
X-Osstest-Versions-That:
    ovmf=90d0ec17e7074905de347ccf2accdd6b8e8ee968
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 14:28:06 +0000

flight 187382 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187382/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a0ac7cf67afd382b4bd13a402bb6100a435b5b7b
baseline version:
 ovmf                 90d0ec17e7074905de347ccf2accdd6b8e8ee968

Last test of basis   187380  2024-08-28 10:11:30 Z    0 days
Testing same since   187382  2024-08-28 12:45:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Liu <linus.liu@intel.com>

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
   90d0ec17e7..a0ac7cf67a  a0ac7cf67afd382b4bd13a402bb6100a435b5b7b -> xen-tested-master

