Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9789E1AC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 19:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702781.1098321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruFNz-0002B2-NQ; Tue, 09 Apr 2024 17:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702781.1098321; Tue, 09 Apr 2024 17:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruFNz-00029X-KN; Tue, 09 Apr 2024 17:35:55 +0000
Received: by outflank-mailman (input) for mailman id 702781;
 Tue, 09 Apr 2024 17:35:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruFNy-00029M-7V; Tue, 09 Apr 2024 17:35:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruFNy-00061B-6Y; Tue, 09 Apr 2024 17:35:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruFNx-0008So-So; Tue, 09 Apr 2024 17:35:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ruFNx-0004zB-SD; Tue, 09 Apr 2024 17:35:53 +0000
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
	bh=FS/EOS8bVevw+dzeR03OJJLdKq0go2cb4jOTF382P1o=; b=cCXncQMRKqN1RGilJG9/jslcF1
	jSNVnPqsqs1MDMfsTgw8XyXlGSqZ40vrQtvUho2XSZpFjmZdUde4dJm0eIiiPNQyl9pb04iSy9ZhA
	r9sizLyHCaMQnpMCRZ82RHPahX6US8SOfngQnJqmkopRDrXf1EfH431E/kwKM1fFwHCk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185286: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9926e692c4afc40bcd66f8416ff6a1e93ce402f6
X-Osstest-Versions-That:
    xen=672b26b66ebb5ff3d28c573a6545a08020b27495
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2024 17:35:53 +0000

flight 185286 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185286/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9926e692c4afc40bcd66f8416ff6a1e93ce402f6
baseline version:
 xen                  672b26b66ebb5ff3d28c573a6545a08020b27495

Last test of basis   185276  2024-04-09 01:02:07 Z    0 days
Testing same since   185286  2024-04-09 13:02:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bjoern Doebel <doebel@amazon.de>
  Jan Beulich <jbeulich@suse.com>

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
   672b26b66e..9926e692c4  9926e692c4afc40bcd66f8416ff6a1e93ce402f6 -> smoke

