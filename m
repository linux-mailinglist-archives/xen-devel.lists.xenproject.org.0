Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723475E88A3
	for <lists+xen-devel@lfdr.de>; Sat, 24 Sep 2022 08:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411198.654192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obyDE-0003f2-Jg; Sat, 24 Sep 2022 06:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411198.654192; Sat, 24 Sep 2022 06:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obyDE-0003cL-FQ; Sat, 24 Sep 2022 06:00:28 +0000
Received: by outflank-mailman (input) for mailman id 411198;
 Sat, 24 Sep 2022 06:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obyDD-0003cB-0r; Sat, 24 Sep 2022 06:00:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obyDC-0005bC-Un; Sat, 24 Sep 2022 06:00:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obyDC-000196-KN; Sat, 24 Sep 2022 06:00:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obyDC-00083b-Jr; Sat, 24 Sep 2022 06:00:26 +0000
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
	bh=IqLY+HqYepjsHsqh546eXTfG+9o1mrmI1NyPAMbO5Ek=; b=FHNzQhqMh81gmUEwad5EcQPF2s
	hS29GX9JicnAOwEmv07depLplEekzSFoGIob04TAV9MrZ+Z+N4QpdFHzc0TzFUbar4/ub0CJchcTH
	0V8buCauiofseRtxa36SOtWyR4Vg0OxxxL98wd85ZqWG64MjJVWlEt/PTH8vQob6HPYw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173302-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173302: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=582a7c9995a8fd036a3583ba485467f5a0316cca
X-Osstest-Versions-That:
    ovmf=ef9974b298583037a1686f08ee02798110a20ded
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Sep 2022 06:00:26 +0000

flight 173302 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173302/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 582a7c9995a8fd036a3583ba485467f5a0316cca
baseline version:
 ovmf                 ef9974b298583037a1686f08ee02798110a20ded

Last test of basis   173298  2022-09-23 20:13:06 Z    0 days
Testing same since   173302  2022-09-24 03:12:01 Z    0 days    1 attempts

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
   ef9974b298..582a7c9995  582a7c9995a8fd036a3583ba485467f5a0316cca -> xen-tested-master

