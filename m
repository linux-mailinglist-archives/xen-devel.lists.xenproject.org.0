Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF496E88A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 06:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791519.1201389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smQG0-0007NT-Cc; Fri, 06 Sep 2024 04:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791519.1201389; Fri, 06 Sep 2024 04:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smQG0-0007LR-94; Fri, 06 Sep 2024 04:07:36 +0000
Received: by outflank-mailman (input) for mailman id 791519;
 Fri, 06 Sep 2024 04:07:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smQFy-0007L1-Rt; Fri, 06 Sep 2024 04:07:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smQFy-0000rV-GW; Fri, 06 Sep 2024 04:07:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smQFy-0007d3-0b; Fri, 06 Sep 2024 04:07:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smQFx-00084Q-Vs; Fri, 06 Sep 2024 04:07:34 +0000
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
	bh=v9+hMkpUV7tz09fa/XklooGRVFJjBMfQ6e9XEZTRSvg=; b=3tWmwrg6DJLgBvLq5xygOIjC7h
	Q0rI7nQC58QwnFQ//lqYcmIhxrGzjXwpv9lkTo2UFrzz3ygTqEzl9D7JZ0vywnUcPQViPfRun9fGt
	6j2u+O5Bj8PLc1SVYEHytvBJEztNbUQHcpYWn9De9ORob/cUT1WBSBYA0UiRIy3oJf7c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187512-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187512: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bfb33c0e09b0cf05460168c00ec43817b835f897
X-Osstest-Versions-That:
    ovmf=013d51771a67ff87e6cb17a57e156ef4b6f4ec54
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 04:07:33 +0000

flight 187512 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187512/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bfb33c0e09b0cf05460168c00ec43817b835f897
baseline version:
 ovmf                 013d51771a67ff87e6cb17a57e156ef4b6f4ec54

Last test of basis   187508  2024-09-05 17:14:29 Z    0 days
Testing same since   187512  2024-09-06 01:56:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali <ashraf.ali.s@intel.com>

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
   013d51771a..bfb33c0e09  bfb33c0e09b0cf05460168c00ec43817b835f897 -> xen-tested-master

