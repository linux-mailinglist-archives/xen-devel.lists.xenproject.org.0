Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F264860D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 16:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458054.715938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3fmL-0003H8-HX; Fri, 09 Dec 2022 15:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458054.715938; Fri, 09 Dec 2022 15:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3fmL-0003Dj-E2; Fri, 09 Dec 2022 15:59:13 +0000
Received: by outflank-mailman (input) for mailman id 458054;
 Fri, 09 Dec 2022 15:59:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3fmJ-0003DZ-UO; Fri, 09 Dec 2022 15:59:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3fmJ-0005ZC-Rt; Fri, 09 Dec 2022 15:59:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3fmJ-0007gE-Ew; Fri, 09 Dec 2022 15:59:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3fmJ-0006dm-EV; Fri, 09 Dec 2022 15:59:11 +0000
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
	bh=aB6I3Wrd/4OouQWjhdEi5vnG2sroMjPOj/TwKfsPy7Y=; b=UMz0WKeOQEIvSzFQ0W5ZPYFd+V
	/I6eRCNZEyr9BmkdwGeejaiJXjU6cejKOHgCEwZQNYKrBQyVbiYk04cxdl8JAv3/pblAu+dx2iCNT
	VekoD9hYBwYhehAeSeqpP7eWTB4dydXYCQp76w/e2f2SfLa10FHqjlH19qned339Hvtk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175124-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175124: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1ef86f12014c19e7bd6b2f008e868c61b5c71878
X-Osstest-Versions-That:
    ovmf=127e2c531556b968a51e8e2191d6e4580281856a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Dec 2022 15:59:11 +0000

flight 175124 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175124/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1ef86f12014c19e7bd6b2f008e868c61b5c71878
baseline version:
 ovmf                 127e2c531556b968a51e8e2191d6e4580281856a

Last test of basis   175119  2022-12-09 07:10:49 Z    0 days
Testing same since   175124  2022-12-09 14:10:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   127e2c5315..1ef86f1201  1ef86f12014c19e7bd6b2f008e868c61b5c71878 -> xen-tested-master

