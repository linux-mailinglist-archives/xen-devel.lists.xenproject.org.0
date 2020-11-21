Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1772BBE2B
	for <lists+xen-devel@lfdr.de>; Sat, 21 Nov 2020 10:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32811.63946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgOt3-0000WI-U5; Sat, 21 Nov 2020 09:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32811.63946; Sat, 21 Nov 2020 09:08:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgOt3-0000Vs-Qh; Sat, 21 Nov 2020 09:08:53 +0000
Received: by outflank-mailman (input) for mailman id 32811;
 Sat, 21 Nov 2020 09:08:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kgOt2-0000Vk-EG; Sat, 21 Nov 2020 09:08:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kgOt2-0004W0-8X; Sat, 21 Nov 2020 09:08:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kgOt1-0006yC-Vk; Sat, 21 Nov 2020 09:08:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kgOt1-0002tc-VB; Sat, 21 Nov 2020 09:08:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kgOt2-0000Vk-EG; Sat, 21 Nov 2020 09:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=7WPsz5hJi3Bv+7K63Le79Zw3CrpzfmADrzvbUUZXkPE=; b=7PJTminrhzYoIO4EDGQwJczsWi
	Po/Q8xLlu3/izXASEb80a6jIQ3ZuDS6vkp7imcVKRZD5Dw9GHS7rsPlhnaEI3/NQLp0nKpoV6BPOd
	5Bde/9MXuFjO0ikKyuuhjDeFpm+Hv6DRMFj2BiqqhzrWc/DSKdH90ymYBucOEA6/YY+I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kgOt2-0004W0-8X; Sat, 21 Nov 2020 09:08:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kgOt1-0006yC-Vk; Sat, 21 Nov 2020 09:08:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kgOt1-0002tc-VB; Sat, 21 Nov 2020 09:08:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156913-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156913: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=47343af30435302c087027177613412a1a83e919
X-Osstest-Versions-That:
    ovmf=6c8dd15c4ae42501438a525ec41299f365f223cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 21 Nov 2020 09:08:51 +0000

flight 156913 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156913/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 47343af30435302c087027177613412a1a83e919
baseline version:
 ovmf                 6c8dd15c4ae42501438a525ec41299f365f223cb

Last test of basis   156879  2020-11-19 11:39:56 Z    1 days
Testing same since   156913  2020-11-21 01:54:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   6c8dd15c4a..47343af304  47343af30435302c087027177613412a1a83e919 -> xen-tested-master

