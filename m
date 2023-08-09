Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF377661F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 19:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581246.909860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTmd1-0004Lq-Lv; Wed, 09 Aug 2023 17:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581246.909860; Wed, 09 Aug 2023 17:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTmd1-0004JW-Ij; Wed, 09 Aug 2023 17:05:47 +0000
Received: by outflank-mailman (input) for mailman id 581246;
 Wed, 09 Aug 2023 17:05:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTmcz-0004JM-Kx; Wed, 09 Aug 2023 17:05:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTmcz-0006jG-GR; Wed, 09 Aug 2023 17:05:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTmcz-0001Ar-6y; Wed, 09 Aug 2023 17:05:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qTmcz-0004WL-6Z; Wed, 09 Aug 2023 17:05:45 +0000
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
	bh=r4DQ8tZvMHFPFVOjgBK48g9Luxe6F5vdK6bPR3Yr5N0=; b=Yt09+zCObIHEJHByZFGRlCODmb
	xLi09hSymQV6eeQAdWhGj+yVP+JMB/VmwlF26xEl+3j60ehSJG3YxGcQ6c0Y6UZGP6j4PVDNHrqEz
	nSg7OXrBUgu1Qlpxnm2ljZG1I4SVEn0zRcMYXw3djRISnR3Mfl/Q495HII58X+cXKJgE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182249: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=991515a0583f65a64b3a6fa354409c64e670a762
X-Osstest-Versions-That:
    ovmf=136931c4dbf532ec913b68673c91b4285e63464b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Aug 2023 17:05:45 +0000

flight 182249 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182249/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 991515a0583f65a64b3a6fa354409c64e670a762
baseline version:
 ovmf                 136931c4dbf532ec913b68673c91b4285e63464b

Last test of basis   182245  2023-08-09 06:10:51 Z    0 days
Testing same since   182249  2023-08-09 15:12:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Brian J. Johnson <brian.johnson@hpe.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Kenneth Lautner <klautner@microsoft.com>
  Yi Li <yi1.li@intel.com>

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
   136931c4db..991515a058  991515a0583f65a64b3a6fa354409c64e670a762 -> xen-tested-master

