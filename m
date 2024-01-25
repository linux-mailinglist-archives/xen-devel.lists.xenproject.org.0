Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D030083C7CC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:25:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671631.1045074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2XG-00082l-R2; Thu, 25 Jan 2024 16:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671631.1045074; Thu, 25 Jan 2024 16:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2XG-0007zh-NZ; Thu, 25 Jan 2024 16:25:02 +0000
Received: by outflank-mailman (input) for mailman id 671631;
 Thu, 25 Jan 2024 16:25:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rT2XF-0007zX-8i; Thu, 25 Jan 2024 16:25:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rT2XE-00085Z-OE; Thu, 25 Jan 2024 16:25:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rT2XE-0006B2-GG; Thu, 25 Jan 2024 16:25:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rT2XE-0007Tu-AJ; Thu, 25 Jan 2024 16:25:00 +0000
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
	bh=DUDfe2xk/xratFFTo1nvXQKymZyil81yooEeJo15Eu8=; b=yLiHM7+p81IjP0Epkaxb1kVtgc
	Y/H8GuBH8KJokHhIlF8vhG14IJ1TGB/bb6miaa2pn6KCBsxERuwGbvzEFQk8HHEQXafAPiE9Ch1Ts
	LyV0NUPgeD26nGBfwSXvxnPeJgr6j3642xVMhREYCWaeiHimi45buEQpMAJYloFpFgOM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184461-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 184461: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=3ae8888611e59ad82a59df7bead143662036d946
X-Osstest-Versions-That:
    seabios=a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Jan 2024 16:25:00 +0000

flight 184461 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184461/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183912
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183912
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183912
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183912
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183912
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              3ae8888611e59ad82a59df7bead143662036d946
baseline version:
 seabios              a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8

Last test of basis   183912  2023-11-28 20:11:08 Z   57 days
Testing same since   184461  2024-01-25 09:12:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

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
   a6ed6b7..3ae8888  3ae8888611e59ad82a59df7bead143662036d946 -> xen-tested-master

