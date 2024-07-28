Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3756293EA1B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 01:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766227.1176735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYCtH-00021M-Kq; Sun, 28 Jul 2024 23:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766227.1176735; Sun, 28 Jul 2024 23:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYCtH-0001zD-I3; Sun, 28 Jul 2024 23:01:23 +0000
Received: by outflank-mailman (input) for mailman id 766227;
 Sun, 28 Jul 2024 23:01:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYCtG-0001yy-39; Sun, 28 Jul 2024 23:01:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYCtF-0002NJ-R5; Sun, 28 Jul 2024 23:01:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYCtF-0000It-BE; Sun, 28 Jul 2024 23:01:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYCtF-0007m3-Ap; Sun, 28 Jul 2024 23:01:21 +0000
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
	bh=hdHuLKSCLfN294tRZhrDoGimJA7sQK91BT47DcIlBuE=; b=pxSjT+K7Fn3PhYKOcNK84kyi6O
	zTlYAlrL/1mu6YyglZOp0Ap1qTk/bpST8jTjgIvLrjlRZbmVy4E9JSDN7Ahoxki6ztEaoI4ipmCy1
	s4r14dwPeqq99Zn+7sL2Yb/EN9va7vgXi0VEFCUesoLmWMHS03oUMhmq/PR429whtOHk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187035-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187035: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ecb1d67775a6dcaa9a0deb4869ca60e250987e91
X-Osstest-Versions-That:
    ovmf=b7f963d570ec5e27bc04d546372c6fc47e4f3b17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Jul 2024 23:01:21 +0000

flight 187035 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187035/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ecb1d67775a6dcaa9a0deb4869ca60e250987e91
baseline version:
 ovmf                 b7f963d570ec5e27bc04d546372c6fc47e4f3b17

Last test of basis   187030  2024-07-27 23:44:56 Z    0 days
Testing same since   187035  2024-07-28 21:13:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   b7f963d570..ecb1d67775  ecb1d67775a6dcaa9a0deb4869ca60e250987e91 -> xen-tested-master

