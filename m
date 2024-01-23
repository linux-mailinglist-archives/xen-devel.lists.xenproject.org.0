Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5E839A8F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 21:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670598.1043491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSNi6-0007uU-Ml; Tue, 23 Jan 2024 20:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670598.1043491; Tue, 23 Jan 2024 20:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSNi6-0007sC-Jr; Tue, 23 Jan 2024 20:49:30 +0000
Received: by outflank-mailman (input) for mailman id 670598;
 Tue, 23 Jan 2024 20:49:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSNi4-0007s2-RI; Tue, 23 Jan 2024 20:49:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSNi4-0007bv-PR; Tue, 23 Jan 2024 20:49:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSNi4-0001xl-7O; Tue, 23 Jan 2024 20:49:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rSNi4-0008J0-6o; Tue, 23 Jan 2024 20:49:28 +0000
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
	bh=hrZaMBguDiyZFKjCfYLdATtk4qTY51xCvcpw9shODIA=; b=IdYAE0/dnfuvq0BS2kNN2H9+ho
	o1q3LHbGQ6XRwa0jJmXtLUOFGJuCrm2stuWPC50k9Wlpj2HgYt/DZSqiLdXCYhyDH2AOXHPw+p17q
	iyxhkXIF6HJtke6vyioF098tzENOAwXoJZ6XVAMG/tx+3uBPQ1Ff1ISw9L4AqwMi3OFw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184438-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184438: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d97f3a1d80fc4880da9726d9a5d7504d3c31da70
X-Osstest-Versions-That:
    ovmf=313f9f01552227138e08a7a7f44be48e5ba20a99
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jan 2024 20:49:28 +0000

flight 184438 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184438/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d97f3a1d80fc4880da9726d9a5d7504d3c31da70
baseline version:
 ovmf                 313f9f01552227138e08a7a7f44be48e5ba20a99

Last test of basis   184425  2024-01-22 15:42:46 Z    1 days
Testing same since   184438  2024-01-23 16:11:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>

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
   313f9f0155..d97f3a1d80  d97f3a1d80fc4880da9726d9a5d7504d3c31da70 -> xen-tested-master

