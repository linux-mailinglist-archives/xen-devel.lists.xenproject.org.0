Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D7965DA2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786351.1195965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyLm-0003dq-JQ; Fri, 30 Aug 2024 09:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786351.1195965; Fri, 30 Aug 2024 09:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyLm-0003bn-Ga; Fri, 30 Aug 2024 09:55:26 +0000
Received: by outflank-mailman (input) for mailman id 786351;
 Fri, 30 Aug 2024 09:55:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjyLk-0003bd-E3; Fri, 30 Aug 2024 09:55:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjyLk-0001rs-8d; Fri, 30 Aug 2024 09:55:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjyLj-0004pu-R7; Fri, 30 Aug 2024 09:55:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjyLj-00087T-Qa; Fri, 30 Aug 2024 09:55:23 +0000
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
	bh=lUnYh23p5Vc4IVYFWuKENiucKRQTJydCX9W9rVYZbBM=; b=hJ+cwwpWF3gMi1CCaixgKwFJ9s
	pWOO5mD2ksm1wx1nPv8O4WrBsYaXtgzyDrwso6F4ZgwvsSAvOmnTj1aFJWJ4MRkH5zInolmuFteos
	Gx3J50kbLjnb2PV+Ft27Z12Q/LW2FdSDjAOeT17vJ4JLIPEWw3nhaB4BtjmESrq64QOo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187418-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187418: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0a6d41ba0a080ff40620ff304fa9c99bb2874570
X-Osstest-Versions-That:
    ovmf=391666da2c1dc5671bbb3393079d86f46e3435af
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 09:55:23 +0000

flight 187418 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187418/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0a6d41ba0a080ff40620ff304fa9c99bb2874570
baseline version:
 ovmf                 391666da2c1dc5671bbb3393079d86f46e3435af

Last test of basis   187416  2024-08-30 05:41:39 Z    0 days
Testing same since   187418  2024-08-30 08:13:30 Z    0 days    1 attempts

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
   391666da2c..0a6d41ba0a  0a6d41ba0a080ff40620ff304fa9c99bb2874570 -> xen-tested-master

