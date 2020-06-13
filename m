Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B21F8524
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 22:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkCou-0007hr-HD; Sat, 13 Jun 2020 20:32:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdXd=72=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jkCot-0007hm-19
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 20:32:03 +0000
X-Inumbo-ID: efa610d8-adb4-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa610d8-adb4-11ea-b7bb-bc764e2007e4;
 Sat, 13 Jun 2020 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MjHQblp3XHh3JO14df6l7OePanGzuffS3w1NvDHcnuE=; b=H6PqqapWnQlbJz8nobexrr83H
 bRCy/pxeVH8zg4xGhfMUODHtMj+OKc78jvU+tMyCJRCr4UavsZhbXhgWOg+VIvA03850JObWDDB+x
 FV5kP6jjNOaaHlNABYdr8X3XBlPr+0u38tVT28D7hKKn5lyEajFE+DieYwFlqhGpnOnRM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkCoq-0006zz-Vb; Sat, 13 Jun 2020 20:32:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jkCoq-000128-N5; Sat, 13 Jun 2020 20:32:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jkCoq-0002yo-MT; Sat, 13 Jun 2020 20:32:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151062-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 151062: regressions - FAIL
X-Osstest-Failures: libvirt:test-arm64-arm64-libvirt-qcow2:debian-di-install:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=63d08bec0b2dace2fcefffb23a1fa5b14c473d67
X-Osstest-Versions-That: libvirt=0d009ca646a4e7438952f6d2739ab7f48ef533ab
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Jun 2020 20:32:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151062 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151062/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-qcow2 10 debian-di-install      fail REGR. vs. 151040

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151040
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151040
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              63d08bec0b2dace2fcefffb23a1fa5b14c473d67
baseline version:
 libvirt              0d009ca646a4e7438952f6d2739ab7f48ef533ab

Last test of basis   151040  2020-06-11 04:19:36 Z    2 days
Testing same since   151062  2020-06-12 12:50:09 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Yi Li <yili@winhong.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
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
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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


Not pushing.

------------------------------------------------------------
commit 63d08bec0b2dace2fcefffb23a1fa5b14c473d67
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Jun 11 20:06:02 2020 +0200

    ci: Swap mipsel and ppc64le builds
    
    Debian sid is currently broken on mipsel, so use Debian 10 for
    that architecture; at the same time, move the ppc64le build from
    Debian 10 to Debian sid to keep things balanced.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>

commit 2250a0b56f12e30d67210fd49d2123014bc73d2c
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Jun 2 17:28:58 2020 +0200

    ci: Update build system integration
    
    The ci-* targets need to know where our container images are stored
    and how they are called to work, so now that we use the GitLab
    container registry instead of Quay some changes are necessary.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 95abbdc432133b9ae4a76d15251d64b5893717e6
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Jun 2 17:28:57 2020 +0200

    ci: Use GitLab container registry
    
    Instead of using pre-built containers hosted on Quay, build
    containers as part of the GitLab CI pipeline and upload them to the
    GitLab container registry for later use.
    
    This will not significantly slow down builds, because containers are
    only rebuilt when the corresponding Dockerfile has been modified.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 7ef13242847405328836a38e445aa2894c0ebab9
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Jun 2 17:28:55 2020 +0200

    ci: Use variables to build image names
    
    This removes a lot of repetition and makes the configuration much
    easier to read.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 9170b0ee6f867d2be1165e83c80910b0e0ac952d
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Wed Jun 10 18:11:04 2020 +0200

    docs: Document CIRRUS_GITHUB_REPO variable
    
    This needs to be set for every repository for Cirrus CI integration
    to work.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 414aee194aed23370df87f5cde28dce1d1492235
Author: Yi Li <yili@winhong.com>
Date:   Thu Jun 11 11:26:29 2020 +0800

    conf: snapshot: Drop unused variable 'creation'
    
    Signed-off-by: Yi Li <yili@winhong.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

