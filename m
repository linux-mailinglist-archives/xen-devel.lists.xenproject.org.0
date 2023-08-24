Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7D78785B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 21:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590263.922411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZFhJ-0002sd-FP; Thu, 24 Aug 2023 19:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590263.922411; Thu, 24 Aug 2023 19:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZFhJ-0002qy-CJ; Thu, 24 Aug 2023 19:08:49 +0000
Received: by outflank-mailman (input) for mailman id 590263;
 Thu, 24 Aug 2023 19:08:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZFhH-0002qV-Qj; Thu, 24 Aug 2023 19:08:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZFhH-0006ee-Cy; Thu, 24 Aug 2023 19:08:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZFhH-0006Or-0V; Thu, 24 Aug 2023 19:08:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qZFhG-0002I1-Vz; Thu, 24 Aug 2023 19:08:46 +0000
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
	bh=i1aySqmLw+oBelCEFm9p8Sqeiz5G9EeFjHOcGShoPHQ=; b=5AtemqNV2Rj1AM5N2mxdNaxFVs
	8qp05mPlgNZqEAaWlOTzg8Csj/WbyDcKuwvfkA06HRnpQLIdtbQF8SI5r8RV1wWow4iAjfNGV8Ws7
	Wg6hxrdbreQri2vRWk+aNwun83JNwX+OLL/2l9qdAfkv03V4hnRMxJa5ZXU8yn0OUZCQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182507-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 182507: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=7a4003be25eae462f3c3d8aad96b57e34dc0c2b8
X-Osstest-Versions-That:
    seabios=774a823a966cdc5d31ddc11af2b7b4f2c250ffdd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Aug 2023 19:08:46 +0000

flight 182507 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182507/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182501
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182501
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182501
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182501
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182501
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              7a4003be25eae462f3c3d8aad96b57e34dc0c2b8
baseline version:
 seabios              774a823a966cdc5d31ddc11af2b7b4f2c250ffdd

Last test of basis   182501  2023-08-24 08:42:05 Z    0 days
Testing same since   182507  2023-08-24 13:12:45 Z    0 days    1 attempts

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
   774a823..7a4003b  7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 -> xen-tested-master

