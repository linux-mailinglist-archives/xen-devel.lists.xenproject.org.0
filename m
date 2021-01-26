Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4A3049F4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 21:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75473.135918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Upz-00048E-Iq; Tue, 26 Jan 2021 20:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75473.135918; Tue, 26 Jan 2021 20:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Upz-00047i-Ey; Tue, 26 Jan 2021 20:21:19 +0000
Received: by outflank-mailman (input) for mailman id 75473;
 Tue, 26 Jan 2021 20:21:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4Upy-00047a-Qd; Tue, 26 Jan 2021 20:21:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4Upy-00066e-Kc; Tue, 26 Jan 2021 20:21:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4Upy-0005IY-Cy; Tue, 26 Jan 2021 20:21:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l4Upy-0003Mj-CU; Tue, 26 Jan 2021 20:21:18 +0000
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
	bh=M5yi/N1YXCGnB4k+uEirDFQTkoYTHaWAiWuNFMBpKzY=; b=B0ajrggg4h2jIT7CsiYr4hW18Z
	95i6KFAMX4QO2YJ01i7HM7dBZNaMcw0yukuFgo+603k0Q/xdjhf9tysjg1UtzEYkZ/r4b7nqHug4E
	q+HVannlgWG3sLODweYutj9gO9eYOqKv/iYPI4vY6q0QVfpFOkhhbqLbSZBZ4thO9oRY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158626-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158626: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2d6fc9d36fd5ff15972bedab919f37bb4ee951d0
X-Osstest-Versions-That:
    ovmf=3a3501862f73095059bb05cc28147c8e899488f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Jan 2021 20:21:18 +0000

flight 158626 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158626/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2d6fc9d36fd5ff15972bedab919f37bb4ee951d0
baseline version:
 ovmf                 3a3501862f73095059bb05cc28147c8e899488f2

Last test of basis   158620  2021-01-26 00:41:48 Z    0 days
Testing same since   158626  2021-01-26 10:52:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>
  Lou, Yun <Yun.Lou@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   3a3501862f..2d6fc9d36f  2d6fc9d36fd5ff15972bedab919f37bb4ee951d0 -> xen-tested-master

