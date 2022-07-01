Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D413D5627CA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 02:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358801.588165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74i4-0001aF-5J; Fri, 01 Jul 2022 00:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358801.588165; Fri, 01 Jul 2022 00:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74i4-0001YL-2O; Fri, 01 Jul 2022 00:40:36 +0000
Received: by outflank-mailman (input) for mailman id 358801;
 Fri, 01 Jul 2022 00:40:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o74i3-0001YB-Bz; Fri, 01 Jul 2022 00:40:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o74i3-00010y-9V; Fri, 01 Jul 2022 00:40:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o74i2-0000Ci-RX; Fri, 01 Jul 2022 00:40:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o74i2-00066h-R6; Fri, 01 Jul 2022 00:40:34 +0000
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
	bh=lri39shIRWHCfwqEGaA9/VWIKg6HQMAqZ54PaOaRD90=; b=5Ync2AwAVPN337XAGGtkOMwiyT
	1PcoboePaCxBbhkHMp25vvArwoXD2tlQwszxMVJc2slxu3IndcDKRlqrn5BEnDBSB8uB8lChnlX7h
	xX1JUMT4Aa50jFPMeige77xu7S6W/nFDOjbSE1jeQa46kM5xeORWSPaFK7+uiDAy8jQA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171430-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171430: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ee11f092b515bf3c926eaad053d12d3f2b6e593e
X-Osstest-Versions-That:
    xen=60d1adfa18793f4ddb70c8e901562d8d3e9be3dc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Jul 2022 00:40:34 +0000

flight 171430 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171430/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ee11f092b515bf3c926eaad053d12d3f2b6e593e
baseline version:
 xen                  60d1adfa18793f4ddb70c8e901562d8d3e9be3dc

Last test of basis   171428  2022-06-30 18:01:44 Z    0 days
Testing same since   171430  2022-06-30 21:01:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dmytro Semenets <dmytro_semenets@epam.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   60d1adfa18..ee11f092b5  ee11f092b515bf3c926eaad053d12d3f2b6e593e -> smoke

