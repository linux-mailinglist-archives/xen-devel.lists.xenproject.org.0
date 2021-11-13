Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5816144F0AE
	for <lists+xen-devel@lfdr.de>; Sat, 13 Nov 2021 02:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225492.389408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mliAp-0003OA-Jd; Sat, 13 Nov 2021 01:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225492.389408; Sat, 13 Nov 2021 01:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mliAp-0003L5-D2; Sat, 13 Nov 2021 01:49:43 +0000
Received: by outflank-mailman (input) for mailman id 225492;
 Sat, 13 Nov 2021 01:49:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mliAo-0003Kv-0Z; Sat, 13 Nov 2021 01:49:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mliAn-0007Q0-NF; Sat, 13 Nov 2021 01:49:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mliAn-00067Q-EZ; Sat, 13 Nov 2021 01:49:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mliAn-0007Vm-Dy; Sat, 13 Nov 2021 01:49:41 +0000
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
	bh=dCQINsiIBBJy+j6zcmztunaYkeJeoRzdgjOha4tI4sQ=; b=jyCNh1E86cMdACnBWGhGfOKa5x
	O7Gmqkw1kMCjU1knXAnV7Tj+6F9dJ9GTeYf2tL+cycn+TRmnrVA1kHUj0ePCIA5eOTKyqehX43lMm
	R7OAtBqDqitZFzGNTvVcreYK8TnNMLvXy9QsxhTyxY0kJ6vtCt9FTdwk0pYLW9rEnuZE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166133-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166133: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e1e7306b54147e65cb7347b060e94f336d4a82d2
X-Osstest-Versions-That:
    ovmf=455b0347a7c55d3842e87b20259659a22f7e62a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Nov 2021 01:49:41 +0000

flight 166133 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166133/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e1e7306b54147e65cb7347b060e94f336d4a82d2
baseline version:
 ovmf                 455b0347a7c55d3842e87b20259659a22f7e62a5

Last test of basis   166130  2021-11-12 15:12:41 Z    0 days
Testing same since   166133  2021-11-13 00:11:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   455b0347a7..e1e7306b54  e1e7306b54147e65cb7347b060e94f336d4a82d2 -> xen-tested-master

