Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88F737FB8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 12:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552650.862840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBvRS-0007XY-4P; Wed, 21 Jun 2023 10:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552650.862840; Wed, 21 Jun 2023 10:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBvRS-0007Uq-0t; Wed, 21 Jun 2023 10:52:02 +0000
Received: by outflank-mailman (input) for mailman id 552650;
 Wed, 21 Jun 2023 10:52:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBvRQ-0007Ug-Jw; Wed, 21 Jun 2023 10:52:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBvRQ-0004Sg-7P; Wed, 21 Jun 2023 10:52:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qBvRP-0000KZ-V2; Wed, 21 Jun 2023 10:52:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qBvRP-0002ue-UX; Wed, 21 Jun 2023 10:51:59 +0000
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
	bh=Qw0euqqTlxNp3MvGlIS4vC08bJ1g7jBHK8CxnAdF+WE=; b=ZqR4OTvE5668KlohninVNMwDxY
	0lr3aP5y5o9xLcyYG7OKYvYXDluLNsjfMaatFPO2nN4fVe9/Fj9vw9J2kssDAooxdxQYgZVXeS8qR
	bFhA9KCsRfNOtl/UJy1qSqbRCjP9ENyfAKv8Z/0W3Qo10bvz3ip35N/BXqiX61zO1ux4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181531-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181531: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4a0642ad27bfb566835ae86aedae0e18f9735cc2
X-Osstest-Versions-That:
    ovmf=ea55bd8f66eeca5f4e80c3679bcf1b1007286b8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Jun 2023 10:51:59 +0000

flight 181531 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181531/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4a0642ad27bfb566835ae86aedae0e18f9735cc2
baseline version:
 ovmf                 ea55bd8f66eeca5f4e80c3679bcf1b1007286b8a

Last test of basis   181438  2023-06-15 05:42:42 Z    6 days
Testing same since   181531  2023-06-21 03:42:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jian J Wang <jian.j.wang@intel.com>

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
   ea55bd8f66..4a0642ad27  4a0642ad27bfb566835ae86aedae0e18f9735cc2 -> xen-tested-master

