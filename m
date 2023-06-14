Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B8572F1C1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 03:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548418.856370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9FFc-0007nJ-FN; Wed, 14 Jun 2023 01:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548418.856370; Wed, 14 Jun 2023 01:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9FFc-0007le-CY; Wed, 14 Jun 2023 01:24:44 +0000
Received: by outflank-mailman (input) for mailman id 548418;
 Wed, 14 Jun 2023 01:24:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9FFb-0007lU-N7; Wed, 14 Jun 2023 01:24:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9FFb-0001mi-KQ; Wed, 14 Jun 2023 01:24:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9FFb-0005C9-27; Wed, 14 Jun 2023 01:24:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q9FFb-0008Q2-1a; Wed, 14 Jun 2023 01:24:43 +0000
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
	bh=p5870dAvO/cR/m5nSxbCbBM2YsvHR9tM66Cyf2tOvlo=; b=HrxnyAbqs7nNmzyweVsaSVdP3+
	woggJSizJ0a6g0cZfKStUmJeRp4KNLDWXtCmXXmkl6+heGcNSdRfauJ/9iA1ReWM+FS4boUCe55Nd
	RyQ4A/geyVekQRfs6GPsC1ifdgDfHFAqi7cnkGI7UISRqMNWscT1zA1h6XVFQGOl+tM8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181413-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 181413: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=cd933454b5e3e1f86379a44b5ae1852c2a01a485
X-Osstest-Versions-That:
    seabios=be7e899350caa7b74d8271a34264c3b4aef25ab0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Jun 2023 01:24:43 +0000

flight 181413 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181413/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180681
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180681
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180681
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180681
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180681
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              cd933454b5e3e1f86379a44b5ae1852c2a01a485
baseline version:
 seabios              be7e899350caa7b74d8271a34264c3b4aef25ab0

Last test of basis   180681  2023-05-16 11:10:38 Z   28 days
Failing since        181408  2023-06-13 15:12:32 Z    0 days    2 attempts
Testing same since   181413  2023-06-13 20:42:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  José Martínez <xose@google.com>
  Lukas Stockner <lstockner@genesiscloud.com>
  Lukas Stockner via SeaBIOS <seabios@seabios.org>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    


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

To xenbits.xen.org:/home/xen/git/osstest/seabios.git
   be7e899..cd93345  cd933454b5e3e1f86379a44b5ae1852c2a01a485 -> xen-tested-master

