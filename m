Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A36E9F3D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 00:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524386.815280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppd2d-00024t-Bl; Thu, 20 Apr 2023 22:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524386.815280; Thu, 20 Apr 2023 22:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppd2d-00022F-8g; Thu, 20 Apr 2023 22:46:15 +0000
Received: by outflank-mailman (input) for mailman id 524386;
 Thu, 20 Apr 2023 22:46:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppd2b-000225-JG; Thu, 20 Apr 2023 22:46:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppd2b-0002wa-DE; Thu, 20 Apr 2023 22:46:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppd2a-0006SB-OV; Thu, 20 Apr 2023 22:46:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppd2a-0003ZR-O0; Thu, 20 Apr 2023 22:46:12 +0000
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
	bh=pWNlw9r9n1MUT4iJt1TufPIgBVuzPhY5172a75ktsH8=; b=u/URXNTRjVMmhQNqAN7Ls0h9VN
	Wwg6U/S6RqyiB3Zt9cXHwH62pbiypGNV3ZQlqxEixzgm7lNS3ziehDMZxSn2WbCw1JhTykfhHCmGV
	4HXTDsNjs5YGeKXbWjEFGNdOg0+K1yMMxyfVoNRU3FR3Zc6tZFRMR7t3V+/CvtJx6QRw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180328-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 180328: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    libvirt:build-armhf:<job status>:broken:regression
    libvirt:build-armhf:hosts-allocate:broken:regression
    libvirt:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    libvirt:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=0d0604a51a5674e432335d201418cbba80899b73
X-Osstest-Versions-That:
    libvirt=b486430db34d0db1dcbf39b0d9840d03cd57f615
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Apr 2023 22:46:12 +0000

flight 180328 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180328/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   2 hosts-allocate         broken REGR. vs. 180308
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 180308
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 180308

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              0d0604a51a5674e432335d201418cbba80899b73
baseline version:
 libvirt              b486430db34d0db1dcbf39b0d9840d03cd57f615

Last test of basis   180308  2023-04-19 04:18:48 Z    1 days
Testing same since   180328  2023-04-20 04:18:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Privoznik <mprivozn@redhat.com>
  Pavel Borecki <pavel.borecki@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 fail    


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

broken-job build-armhf broken
broken-step build-armhf hosts-allocate

Not pushing.

------------------------------------------------------------
commit 0d0604a51a5674e432335d201418cbba80899b73
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Apr 17 10:10:15 2023 +0200

    networkRefreshDhcpDaemon: Get dnsmasq's PID once
    
    This is a relic of commit v3.7.0-rc1~132 when getter/setter APIs
    for dnsmasq's PID were introduced. Previously, obj->dnsmasqPid
    was accessed directly. But the aforementioned commit introduced
    two calls to virNetworkObjGetDnsmasqPid() even though the result
    of the first call is stored in a variable.
    
    Remove the second call as it's unnecessary.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 004d5141c59b08904396d53efe64ebe15f30c7b6
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Apr 17 10:10:04 2023 +0200

    conf: Initialize _virNetworkObj::dnsmasqPid to -1 in virNetworkObjNew()
    
    Throughout all of our network driver code we assume that
    dnsmasqPid of value -1 means the network has no dnsmasq process
    running. There are plenty of calls to:
    
      virNetworkObjSetDnsmasqPid(obj, -1);
    
    or:
    
      pid_t dnsmasqPid = virNetworkObjGetDnsmasqPid(obj);
      if (dnsmasqPid > 0) ...;
    
    Now, a virNetworkObj is created via virNetworkObjNew() which
    might as well set this de-facto default value.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 212dfa94eeec88eb1a0bcf0c935a0ce17984306a
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Apr 17 10:09:51 2023 +0200

    networkUpdateState: do not assume dnsmasq_caps
    
    Assume there's a dnsmasq running (because there's an active
    virtual network that spawned it). Now, shut down the daemon,
    remove the dnsmasq binary and start the daemon again. At this
    point, networkUpdateState() is called, but dnsmasq_caps is NULL
    (because networkStateInitialize() called earlier failed to set
    them, rightfully though).
    
    Now, the networkUpdateState() tries to read the dnsmasq's PID
    file using virPidFileReadIfAlive() which takes a path to the
    corresponding binary as one of its arguments. To provide that
    path, dnsmasqCapsGetBinaryPath() is called, but since
    dnsmasq_caps is NULL, it dereferences it and thus causes a crash.
    
    It's true that virPidFileReadIfAlive() can deal with a removed
    binary (well virPidFileReadPathIfAlive() which it calls can), but
    iff the binary path is provided in its absolute form. Otherwise,
    virFileResolveAllLinks() fails to canonicalize the path
    (expected, the path doesn't exist anyway).
    
    Therefore, reading dnsmasq's PID file didn't work before
    v8.1.0-rc1~401 which introduced this crash. It was always set to
    -1. But passing NULL as binary path instead, makes
    virPidFileReadIfAlive() return early, right after the PID file is
    read and it's confirmed the PID exists.
    
    Yes, this may yield wrong results, as the PID might be of a
    completely different binary. But this problem is preexistent and
    until we start locking PID files, there's nothing we can do about
    it. IOW, it would require rework of dnsmasq PID file handling.
    
    Fixes: 4b68c982e283471575bacbf87302495864da46fe
    Resolves: https://gitlab.com/libvirt/libvirt/-/issues/456
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 03094f8c65f71b8cc55b73d1c2af575b0e84a23d
Author: Pavel Borecki <pavel.borecki@gmail.com>
Date:   Wed Apr 19 07:48:48 2023 +0200

    Translated using Weblate (Czech)
    
    Currently translated at 97.9% (10191 of 10400 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/cs/
    
    Translated using Weblate (Czech)
    
    Currently translated at 97.9% (10189 of 10400 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/cs/
    
    Co-authored-by: Pavel Borecki <pavel.borecki@gmail.com>
    Signed-off-by: Pavel Borecki <pavel.borecki@gmail.com>

