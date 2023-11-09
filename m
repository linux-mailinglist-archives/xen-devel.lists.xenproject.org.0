Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4387E7556
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 00:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629841.982336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1EqJ-0007m8-3X; Thu, 09 Nov 2023 23:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629841.982336; Thu, 09 Nov 2023 23:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1EqI-0007k3-VS; Thu, 09 Nov 2023 23:53:46 +0000
Received: by outflank-mailman (input) for mailman id 629841;
 Thu, 09 Nov 2023 23:53:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1EqI-0007jt-0D; Thu, 09 Nov 2023 23:53:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1EqH-0003rD-R1; Thu, 09 Nov 2023 23:53:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r1EqH-0007RE-Dt; Thu, 09 Nov 2023 23:53:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r1EqH-0001Zp-DN; Thu, 09 Nov 2023 23:53:45 +0000
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
	bh=U5KtOCAJc1h1lro3YHg16DvhaL5t9XiM30a1cZvTrvg=; b=f8eyX+519LmJsEuh06lNxC/8Ib
	cz6bgYc6XdHPLwTbZEPHAefzudkvqpFYybzAcd9C5jSLazmNLRK+2JsEvZeSeLi0YfkC6X53kU/0l
	0dmsajaUCuBJeOfO0z/yQNRlyf2p59LQEdGkzq9SIEyms4Ih9DxSnlnTj4+lV0czyY5c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183724-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183724: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=35c0c63edbab6a37d6c019d613a4b06529941a80
X-Osstest-Versions-That:
    ovmf=e077ccff6d0f2e8c3fc44b3e2ab71aff66927c3b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Nov 2023 23:53:45 +0000

flight 183724 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183724/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 35c0c63edbab6a37d6c019d613a4b06529941a80
baseline version:
 ovmf                 e077ccff6d0f2e8c3fc44b3e2ab71aff66927c3b

Last test of basis   183722  2023-11-09 19:41:01 Z    0 days
Testing same since   183724  2023-11-09 22:14:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>
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
   e077ccff6d..35c0c63edb  35c0c63edbab6a37d6c019d613a4b06529941a80 -> xen-tested-master

