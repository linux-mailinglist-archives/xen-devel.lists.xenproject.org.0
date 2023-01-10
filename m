Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D8664D88
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 21:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474952.736414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFLIs-0003hn-0s; Tue, 10 Jan 2023 20:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474952.736414; Tue, 10 Jan 2023 20:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFLIr-0003fI-Tg; Tue, 10 Jan 2023 20:33:01 +0000
Received: by outflank-mailman (input) for mailman id 474952;
 Tue, 10 Jan 2023 20:33:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFLIq-0003f8-57; Tue, 10 Jan 2023 20:33:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFLIq-0000oz-2T; Tue, 10 Jan 2023 20:33:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFLIp-0006GR-KT; Tue, 10 Jan 2023 20:32:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pFLIp-0003vE-K0; Tue, 10 Jan 2023 20:32:59 +0000
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
	bh=WxNBTje/r+ocUZcBF/5/vf8Es6YebQKTgco6/Jra55s=; b=xOqF/RqylTnRjCwYdXjjYlcPVJ
	Q82aJ0G6cqNgjIyuTKEc7/in1kS+z3jCOkvQgGIuPd7clQjLc0ERE7yO0QbG2sG2KuD8xgRXmYNKn
	EsRQDOBrLZJEuxpHk9tlHwa+PMDpZjtPMWgQKB3vaIp/cQSUCyvkHeFLSyplvK5LtD7Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175707-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175707: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ec54ce1f1ab41b92782b37ae59e752fff0ef9c41
X-Osstest-Versions-That:
    ovmf=717f35a9f2d883a74998f7deb3d2cdf95bddf039
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Jan 2023 20:32:59 +0000

flight 175707 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175707/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ec54ce1f1ab41b92782b37ae59e752fff0ef9c41
baseline version:
 ovmf                 717f35a9f2d883a74998f7deb3d2cdf95bddf039

Last test of basis   175702  2023-01-10 14:40:41 Z    0 days
Testing same since   175707  2023-01-10 17:40:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  dann frazier <dann.frazier@canonical.com>
  Laszlo Ersek <lersek@redhat.com>

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
   717f35a9f2..ec54ce1f1a  ec54ce1f1ab41b92782b37ae59e752fff0ef9c41 -> xen-tested-master

