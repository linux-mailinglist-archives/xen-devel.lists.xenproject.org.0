Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DD28F573
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7462.19503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4lh-0000lz-Kt; Thu, 15 Oct 2020 15:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7462.19503; Thu, 15 Oct 2020 15:02:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4lh-0000lc-H8; Thu, 15 Oct 2020 15:02:13 +0000
Received: by outflank-mailman (input) for mailman id 7462;
 Thu, 15 Oct 2020 15:02:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kT4lf-0000lX-O8
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:02:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e95a8884-7c50-489d-880d-aeb685c9c06f;
 Thu, 15 Oct 2020 15:02:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT4le-00075M-0d; Thu, 15 Oct 2020 15:02:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT4ld-0006Eh-RS; Thu, 15 Oct 2020 15:02:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kT4ld-00044P-Qx; Thu, 15 Oct 2020 15:02:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kT4lf-0000lX-O8
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:02:11 +0000
X-Inumbo-ID: e95a8884-7c50-489d-880d-aeb685c9c06f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e95a8884-7c50-489d-880d-aeb685c9c06f;
	Thu, 15 Oct 2020 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=r5BMwGfG0lbeS4mprBv5xIF5Y8QSFwrVoZSMDWk0O+o=; b=5TJtqgKYKT4UTWkvTRmSvlOQC6
	gPygZUPeJ1DCiMpP3wPomaDIVaPESj0nD63G1gVqm2GQFOohC756/1bqsJEsjnj9cegn3OhbI9I7b
	e0GOfp+tXoJRA7DaR430jiY5+TvN8Igt2Dbmlqzfq2v+gulceuBqHB5O+TBQhFZiZr2E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT4le-00075M-0d; Thu, 15 Oct 2020 15:02:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT4ld-0006Eh-RS; Thu, 15 Oct 2020 15:02:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT4ld-00044P-Qx; Thu, 15 Oct 2020 15:02:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155839-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 155839: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This:
    seabios=58a44be024f69d2e4d2b58553529230abdd3935e
X-Osstest-Versions-That:
    seabios=c685fe3ff2d402caefc1487d99bb486c4a510b8b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Oct 2020 15:02:09 +0000

flight 155839 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155839/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 155770
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 155770
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 155770
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 155770
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 seabios              58a44be024f69d2e4d2b58553529230abdd3935e
baseline version:
 seabios              c685fe3ff2d402caefc1487d99bb486c4a510b8b

Last test of basis   155770  2020-10-13 09:10:37 Z    2 days
Testing same since   155839  2020-10-15 09:39:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   c685fe3..58a44be  58a44be024f69d2e4d2b58553529230abdd3935e -> xen-tested-master

