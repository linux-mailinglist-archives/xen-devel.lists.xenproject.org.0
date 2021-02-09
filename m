Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B7E31592D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 23:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83444.155341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9bG4-0008Cy-SZ; Tue, 09 Feb 2021 22:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83444.155341; Tue, 09 Feb 2021 22:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9bG4-0008Cb-Oa; Tue, 09 Feb 2021 22:13:20 +0000
Received: by outflank-mailman (input) for mailman id 83444;
 Tue, 09 Feb 2021 22:13:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9bG3-0008CR-H7; Tue, 09 Feb 2021 22:13:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9bG3-0008Mv-B1; Tue, 09 Feb 2021 22:13:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9bG2-00054l-Vs; Tue, 09 Feb 2021 22:13:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9bG2-0004L5-VM; Tue, 09 Feb 2021 22:13:18 +0000
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
	bh=R/Y/WL0H/1HEPq0FxFXxseKL5jpZIDulg/xBv26pxCQ=; b=YGYPO+1jJJUOFeOlGn8zpa92HX
	zAvSqhLkHtQQFv7A5KBo8F0CAJ+JfToNrWJMqX6iq6XfqKlaX35wtNPsNd/TuYmOtcD6nC6VcRxes
	kyidSLtE+pp4HQiRNA3zf4O+7BWyasmTbHPFu/DEII7ZgFzKiExYujwPlHb7jNWEkq5E=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159184-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 159184: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=687121f8a0e7c1ea1c4fa3d056637e5819342f14
X-Osstest-Versions-That:
    xen=f18309eb06efd1db5a2ab9903a1c246b6299951a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Feb 2021 22:13:18 +0000

flight 159184 xen-unstable-smoke real [real]
flight 159188 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/159184/
http://logs.test-lab.xenproject.org/osstest/logs/159188/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm     18 guest-start/debian.repeat fail REGR. vs. 159146

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  687121f8a0e7c1ea1c4fa3d056637e5819342f14
baseline version:
 xen                  f18309eb06efd1db5a2ab9903a1c246b6299951a

Last test of basis   159146  2021-02-08 19:00:27 Z    1 days
Testing same since   159184  2021-02-09 18:01:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Olaf Hering <olaf@aepfle.de>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
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


Not pushing.

------------------------------------------------------------
commit 687121f8a0e7c1ea1c4fa3d056637e5819342f14
Author: Olaf Hering <olaf@aepfle.de>
Date:   Tue Feb 9 16:45:35 2021 +0100

    xl: optionally print timestamps when running xl commands
    
    Add a global option "-T" to xl to enable timestamps in the output from
    libxl and libxc. This is most useful with long running commands such
    as "migrate".
    
    During 'xl -v.. migrate domU host' a large amount of debug is generated.
    It is difficult to map each line to the sending and receiving side.
    Also the time spent for migration is not reported.
    
    With 'xl -T migrate domU host' both sides will print timestamps and
    also the pid of the invoked xl process to make it more obvious which
    side produced a given log line.
    
    Note: depending on the command, xl itself also produces other output
    which does not go through libxentoollog. As a result such output will
    not have timestamps prepended.
    
    This change adds also the missing "-t" flag to "xl help" output.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>

commit 7a321c3676250aac5bacb1ae8d7dd22bfe8b1448
Author: Olaf Hering <olaf@aepfle.de>
Date:   Tue Feb 9 16:45:34 2021 +0100

    tools: add with-xen-scriptdir configure option
    
    Some distros plan for fresh installations will have an empty /etc,
    whose content will not be controlled by the package manager anymore.
    
    To make this possible, add a knob to configure to allow storing the
    hotplug scripts to libexec instead of /etc/xen/scripts.
    
    The current default remains unchanged, which is /etc/xen/scripts.
    
    [autoconf rerun -iwj]
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>

commit fe9ba142c03a2046def52cfd5864f5a89172bf5c
Author: Olaf Hering <olaf@aepfle.de>
Date:   Tue Feb 9 16:45:33 2021 +0100

    tools: move CONFIG_DIR and XEN_CONFIG_DIR in paths.m4
    
    Upcoming changes need to reuse XEN_CONFIG_DIR.
    
    In its current location the assignment happens too late. Move it up
    in the file, along with CONFIG_DIR. Their only dependency is
    sysconfdir, which may also be adjusted in this file.
    
    No functional change intended.
    
    [autoconf rerun -iwj]
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 548ba7c85c6d80a671c2abb8681c29bc85c616f3
Author: Ian Jackson <iwj@xenproject.org>
Date:   Tue Feb 9 17:05:54 2021 +0000

    tools: Regenerate autoconf
    
    This seems to have been omitted in many recent commits.  The earliest
    of which are, according to git-bisect:
      154137dfdba3  stubdom/configure      stubdom: add xenstore pvh stubdom
      cc83ee4c6c37  all configure scripts  NetBSD: Fix lock directory path
    but it seems that this is true of several later commits too.
    
    Release status: I consider this discrepancy a release critical bug.
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>
    Release-acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

