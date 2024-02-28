Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B418D86AAA9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 10:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686424.1068426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFoy-0004KM-1k; Wed, 28 Feb 2024 09:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686424.1068426; Wed, 28 Feb 2024 09:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFox-0004Ha-Uj; Wed, 28 Feb 2024 09:01:47 +0000
Received: by outflank-mailman (input) for mailman id 686424;
 Wed, 28 Feb 2024 09:01:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfFow-0004HO-RA; Wed, 28 Feb 2024 09:01:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfFow-0006St-P4; Wed, 28 Feb 2024 09:01:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfFow-0005GJ-HV; Wed, 28 Feb 2024 09:01:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rfFow-0003aN-H1; Wed, 28 Feb 2024 09:01:46 +0000
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
	bh=ntbnRwuIT13mG6Ba1lQWj6DSx2Hvot2BPv5ZevvbGTc=; b=IVzPMDjt77X0FmRvdRGCeMX67P
	88f09jat/BDkWKn15gyKfPa7wJvDvyV1vzQqaqYAgWxjI+FhOnF7RTV+U1TRF4IZR9KZkFcI6U81w
	PBJUzTA9lWc9Xk/sjXsklXdlcjr8L3O9UIY4DkL/nDC6cOL9gkUK9W3DFxh2KWs7WnMk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184803-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184803: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3e91e421365027ee3e655feab33c67a4f544c777
X-Osstest-Versions-That:
    ovmf=aceb3490a2a350b128156fd4e36e53fc19739e4e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Feb 2024 09:01:46 +0000

flight 184803 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184803/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3e91e421365027ee3e655feab33c67a4f544c777
baseline version:
 ovmf                 aceb3490a2a350b128156fd4e36e53fc19739e4e

Last test of basis   184790  2024-02-27 15:45:00 Z    0 days
Testing same since   184803  2024-02-28 03:46:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jayaprakash N <n.jayaprakash@intel.com>
  Jayaprakash, N <n.jayaprakash@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Rebecca Cran <rebecca@os.amperecomputing.com>

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
   aceb3490a2..3e91e42136  3e91e421365027ee3e655feab33c67a4f544c777 -> xen-tested-master

