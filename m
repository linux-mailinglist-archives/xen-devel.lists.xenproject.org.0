Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED364164B
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 12:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452480.710234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1QNY-0000uy-J3; Sat, 03 Dec 2022 11:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452480.710234; Sat, 03 Dec 2022 11:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1QNY-0000ri-GC; Sat, 03 Dec 2022 11:08:20 +0000
Received: by outflank-mailman (input) for mailman id 452480;
 Sat, 03 Dec 2022 11:08:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p1QNX-0000rY-He; Sat, 03 Dec 2022 11:08:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p1QNX-0006ur-CC; Sat, 03 Dec 2022 11:08:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p1QNW-0002Fi-Rm; Sat, 03 Dec 2022 11:08:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p1QNW-0007t4-RG; Sat, 03 Dec 2022 11:08:18 +0000
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
	bh=/6oqywsgoFo15IMhKUY0GDk+9gcYhCokjP4PTJgFGZA=; b=u9a0+0SUajfAN2UvezUIkMS568
	4kEe6I3G8r5Om1DuU8V1sOQ21OzXMjOfsDdgx6PgefuIJ/hIpxb3VlW+FxiksZ6g7kQSnqFDW6Whs
	1eyKQeR+0AsTnoniUd4vXyf25X4eN4dBzuFION9FTAUAxSO/eaKIFltcrrlxQDtnFyYo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175033-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175033: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7de1c71dd2f4e04bd832fc7b92c8255161705393
X-Osstest-Versions-That:
    ovmf=5d5be45bd11117c1e479863125e7d772e54772c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Dec 2022 11:08:18 +0000

flight 175033 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175033/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7de1c71dd2f4e04bd832fc7b92c8255161705393
baseline version:
 ovmf                 5d5be45bd11117c1e479863125e7d772e54772c9

Last test of basis   175026  2022-12-02 14:40:46 Z    0 days
Testing same since   175033  2022-12-03 09:12:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zihong Yi <yizihong@huawei.com>

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
   5d5be45bd1..7de1c71dd2  7de1c71dd2f4e04bd832fc7b92c8255161705393 -> xen-tested-master

