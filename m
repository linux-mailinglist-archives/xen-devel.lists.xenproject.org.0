Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8B249EF96
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 01:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261797.453545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDF6E-0003RL-Er; Fri, 28 Jan 2022 00:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261797.453545; Fri, 28 Jan 2022 00:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDF6E-0003Oe-BY; Fri, 28 Jan 2022 00:26:46 +0000
Received: by outflank-mailman (input) for mailman id 261797;
 Fri, 28 Jan 2022 00:26:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDF6C-0003OT-ND; Fri, 28 Jan 2022 00:26:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDF6C-0005Nx-Kk; Fri, 28 Jan 2022 00:26:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDF6C-0001DO-5l; Fri, 28 Jan 2022 00:26:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nDF6C-00052w-5J; Fri, 28 Jan 2022 00:26:44 +0000
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
	bh=mAxfCmqzu36n1FWJNeYzxTNZz1jBLMRma3LnJXFGRqQ=; b=bQNwnfccBEczzKav7U6JXbiRfU
	VFY0QpyDIm8HyI8hSaG4vbSgflJ6RUujjAFQ2dxjw9LJwxAfycqcWfX8phuf+PL54cVY/2EUnBuLm
	+2VEy/B17dwVP7g88HSdqd+P0Wo/Uj8+qS7/XHt//P6Xw92HLy4mCoBNLvBzhe6cfo4M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167920-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 167920: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=dc776a2d9ca9e1b857e880ff682668871369b4c3
X-Osstest-Versions-That:
    seabios=e4f02c12518c0fe8154950b2e34c56a92721626e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Jan 2022 00:26:44 +0000

flight 167920 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167920/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167788
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167788
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167788
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 167788
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 167788
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              dc776a2d9ca9e1b857e880ff682668871369b4c3
baseline version:
 seabios              e4f02c12518c0fe8154950b2e34c56a92721626e

Last test of basis   167788  2022-01-21 16:10:27 Z    6 days
Testing same since   167920  2022-01-27 16:42:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Graf <graf@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Jan Beulich via SeaBIOS <seabios@seabios.org>
  Kevin O'Connor <kevin@koconnor.net>
  Volker Rümelin <vr_qemu@t-online.de>

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
   e4f02c1..dc776a2  dc776a2d9ca9e1b857e880ff682668871369b4c3 -> xen-tested-master

