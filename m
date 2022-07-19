Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17157A6B2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 20:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371009.602903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDsGW-0000dI-VU; Tue, 19 Jul 2022 18:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371009.602903; Tue, 19 Jul 2022 18:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDsGW-0000b6-Ss; Tue, 19 Jul 2022 18:48:16 +0000
Received: by outflank-mailman (input) for mailman id 371009;
 Tue, 19 Jul 2022 18:48:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDsGV-0000aw-ID; Tue, 19 Jul 2022 18:48:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDsGV-0006Ou-Gm; Tue, 19 Jul 2022 18:48:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDsGV-0000YO-5W; Tue, 19 Jul 2022 18:48:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oDsGV-0000NI-59; Tue, 19 Jul 2022 18:48:15 +0000
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
	bh=ic8D5H2V3iFO3uNDbxF5x5mEPt1kGlEkTzRDO9+ohGE=; b=2APhhXVXzZAJcC/Wo7nCc1CuwY
	pEwt1NQ/dfi7TQxmkAJrKTik2Q4bBKOz3Vcm7dvYDv5fyUnn/nwQPqUDmION3q+GkMKrarMpbqnEH
	as8RcwYZ9PSilC1kL+cWPRhkv3NRi6R6RS2ideX9m7Ufs5yDVQ4yjR/uR+l0DQtdhzig=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171689-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171689: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=19a87683654a4969a9f86a3d02199c253c789970
X-Osstest-Versions-That:
    ovmf=f0064ac3afa28e1aa3b6b9c22c6cf422a4bb8771
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jul 2022 18:48:15 +0000

flight 171689 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171689/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 19a87683654a4969a9f86a3d02199c253c789970
baseline version:
 ovmf                 f0064ac3afa28e1aa3b6b9c22c6cf422a4bb8771

Last test of basis   171679  2022-07-19 03:13:39 Z    0 days
Testing same since   171689  2022-07-19 16:41:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   f0064ac3af..19a8768365  19a87683654a4969a9f86a3d02199c253c789970 -> xen-tested-master

