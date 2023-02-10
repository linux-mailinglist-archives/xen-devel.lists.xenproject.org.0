Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10093691CA6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 11:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493239.763079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQQb2-0002ng-Ve; Fri, 10 Feb 2023 10:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493239.763079; Fri, 10 Feb 2023 10:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQQb2-0002lT-Sq; Fri, 10 Feb 2023 10:25:36 +0000
Received: by outflank-mailman (input) for mailman id 493239;
 Fri, 10 Feb 2023 10:25:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQQb0-0002lH-Qp; Fri, 10 Feb 2023 10:25:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQQb0-0002OZ-Q9; Fri, 10 Feb 2023 10:25:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQQb0-0007C5-FD; Fri, 10 Feb 2023 10:25:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQQb0-0003Zz-Ek; Fri, 10 Feb 2023 10:25:34 +0000
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
	bh=+cu/1jRXYzUV7Xa5SkTrOCtx5jv50xihDBhxk619b40=; b=2zy421x/EnrDjj4fdhzBr8QAE6
	U8L2NmNee57VL8mFXwaol3gtXEZ4euWgUtGvVW7Yc3hdV7WWkMJ3t8H7SYggCR+a/nz7EMCtlBfDG
	EgI8b1nS+BrwNRGHOEIDmIZih5SzPAEuMs1hKKQE6ArQRR5seQWKHzwZzhtHNp2O3DIc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176815-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176815: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=93a21b465bda44cecdd6347ad481ca6f55286547
X-Osstest-Versions-That:
    ovmf=39254d922e550ccc9c5ab5639c3c28a4ee4e13fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Feb 2023 10:25:34 +0000

flight 176815 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176815/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 93a21b465bda44cecdd6347ad481ca6f55286547
baseline version:
 ovmf                 39254d922e550ccc9c5ab5639c3c28a4ee4e13fd

Last test of basis   176790  2023-02-09 23:14:11 Z    0 days
Testing same since   176815  2023-02-10 04:16:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Weipu Zhu <weipu.zhu@intel.com>

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
   39254d922e..93a21b465b  93a21b465bda44cecdd6347ad481ca6f55286547 -> xen-tested-master

