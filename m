Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB388586BF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 21:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682347.1061504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb4qH-0006Ny-6S; Fri, 16 Feb 2024 20:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682347.1061504; Fri, 16 Feb 2024 20:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb4qH-0006Lg-37; Fri, 16 Feb 2024 20:29:53 +0000
Received: by outflank-mailman (input) for mailman id 682347;
 Fri, 16 Feb 2024 20:29:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rb4qF-0006LW-KY; Fri, 16 Feb 2024 20:29:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rb4qF-0002Yg-9Q; Fri, 16 Feb 2024 20:29:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rb4qE-0007Xq-VR; Fri, 16 Feb 2024 20:29:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rb4qE-0004Lt-Uh; Fri, 16 Feb 2024 20:29:50 +0000
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
	bh=oPxart4rlBINOteIeN+UJDz6gbHcHBnSqZZBiAryCTg=; b=BIH8zU/owddHvEi+vaw0aE5sfI
	0ODF406vPhCIy8P9Y7x63h/gtOvN4voT9FOxtNVF6T4+wse2ee++zTGZCjw9pZFaeMqwJ+WHHrxQ0
	WlVgE/HvZqbERtvdUisil2Mws0xE9NNFnubpW6SbNjWo81RiuiwbeTx8esO+KnJndz6c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184685-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184685: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0441c3acc7e9e72e984ce49d32e61827894ae4a3
X-Osstest-Versions-That:
    xen=78398afae10bfb4ab94e8af17b7ed58510a57d96
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Feb 2024 20:29:50 +0000

flight 184685 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184685/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0441c3acc7e9e72e984ce49d32e61827894ae4a3
baseline version:
 xen                  78398afae10bfb4ab94e8af17b7ed58510a57d96

Last test of basis   184678  2024-02-15 18:02:04 Z    1 days
Testing same since   184685  2024-02-16 18:03:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Elias El Yandouzi <eliasely@amazon.com>
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
   78398afae1..0441c3acc7  0441c3acc7e9e72e984ce49d32e61827894ae4a3 -> smoke

