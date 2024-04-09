Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696C89E5A9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 00:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702854.1098482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruK3l-0000dG-GL; Tue, 09 Apr 2024 22:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702854.1098482; Tue, 09 Apr 2024 22:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruK3l-0000a1-Cf; Tue, 09 Apr 2024 22:35:21 +0000
Received: by outflank-mailman (input) for mailman id 702854;
 Tue, 09 Apr 2024 22:35:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruK3j-0000Yq-OC; Tue, 09 Apr 2024 22:35:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruK3j-0002hm-IV; Tue, 09 Apr 2024 22:35:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruK3j-00005c-6N; Tue, 09 Apr 2024 22:35:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ruK3j-0008Lu-5q; Tue, 09 Apr 2024 22:35:19 +0000
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
	bh=8l6N96cRrZY8T21AZhL9iqrjDcsU09M3Mi68Vua4q20=; b=3wuAO8C9Et/ISDj0Vf5yWXyuXQ
	rH9jCuHtEIkNuVFrScfQweVjE8ymncB0kpb0RTHu+OC1L798Q7aPlqOGW/7y0jD9/f/ll6qLrl2k0
	1FUIHwK6JJtasvWp5nRGSJBYDQpFov99khEK+dIE7hsUe5hb7EcXcRfJoDXUhbhTGkao=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185288-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185288: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=665789b61bc39de67d3f17288bacb4662434e251
X-Osstest-Versions-That:
    ovmf=932db9df0caa26daca4edf133fb2aed7b4a9193e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2024 22:35:19 +0000

flight 185288 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185288/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 665789b61bc39de67d3f17288bacb4662434e251
baseline version:
 ovmf                 932db9df0caa26daca4edf133fb2aed7b4a9193e

Last test of basis   185280  2024-04-09 07:11:25 Z    0 days
Testing same since   185288  2024-04-09 17:45:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Duggapu Chinni B <chinni.b.duggapu@intel.com>

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
   932db9df0c..665789b61b  665789b61bc39de67d3f17288bacb4662434e251 -> xen-tested-master

