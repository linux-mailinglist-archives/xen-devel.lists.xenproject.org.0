Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7F4331D1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 11:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212898.370943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcl62-0005Eg-2F; Tue, 19 Oct 2021 09:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212898.370943; Tue, 19 Oct 2021 09:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcl61-0005CR-Tv; Tue, 19 Oct 2021 09:07:45 +0000
Received: by outflank-mailman (input) for mailman id 212898;
 Tue, 19 Oct 2021 09:07:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcl60-0005CH-Pr; Tue, 19 Oct 2021 09:07:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcl60-00067W-KP; Tue, 19 Oct 2021 09:07:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcl60-00055n-AX; Tue, 19 Oct 2021 09:07:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mcl60-0006tR-A3; Tue, 19 Oct 2021 09:07:44 +0000
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
	bh=4dpZSKe6X02JCZkEvTuxCkL7FsZGfCineBexMfQeEl0=; b=piz2EkF2nBUf7HInu+gFqngRCf
	yFwu5gqDjM2uyGXV82qLOTsKqpSsgiuqLfQOujD+TZrjIMR1PURPFEZhFaUPgJudT5i2uAeBz8cSt
	aFSyr5Y7MtQS5UUcFe0dQ7BlY3dqabW5hGQFhpag7pBYDYBrFm9hw6GkL94sp0CnnDsk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165661-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165661: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:leak-check/basis(11):fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:leak-check/basis(11):fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:leak-check/basis(11):fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:leak-check/basis(11):fail:regression
X-Osstest-Versions-This:
    xen=3ae80dea4601764818d1e5b84bd1e4479c0d4790
X-Osstest-Versions-That:
    xen=c11b8d25fbe9c0155e91409594ea6701008409ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Oct 2021 09:07:44 +0000

flight 165661 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165661/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 11 leak-check/basis(11) fail REGR. vs. 165635
 test-amd64-amd64-libvirt     11 leak-check/basis(11)     fail REGR. vs. 165635
 test-arm64-arm64-xl-xsm      11 leak-check/basis(11)     fail REGR. vs. 165635
 test-armhf-armhf-xl          11 leak-check/basis(11)     fail REGR. vs. 165635

version targeted for testing:
 xen                  3ae80dea4601764818d1e5b84bd1e4479c0d4790
baseline version:
 xen                  c11b8d25fbe9c0155e91409594ea6701008409ed

Last test of basis   165635  2021-10-18 13:00:26 Z    0 days
Testing same since   165638  2021-10-18 16:01:36 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Juergen Gross <jgross@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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
commit 3ae80dea4601764818d1e5b84bd1e4479c0d4790
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Sep 10 07:55:17 2021 +0200

    stubdom: disable building pv-grub
    
    The stubdom based pv-grub is using a very outdated version of grub
    (0.97) and should not be used any longer. Mainline grub has support for
    PV guests for a long time now, so that should be used as a boot loader
    of a PV domain.
    
    So disable building pv-grub per default. In case someone really wants
    to continue using it he/she can still use a pv-grub binary from an older
    Xen version or manually enable building it via:
    
      configure --enable-pv-grub
    
    [ This was already disabled in osstest by 8dee6e333622
      "make-flight: Drop pvgrub (pvgrub1) tests" -iwj ]
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
    Acked-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 9cfeb83cbe23a873de512211d7ecd989348b9df0
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Oct 12 15:41:48 2021 +0200

    tools/xenstore: set open file descriptor limit for xenstored
    
    Add a configuration item for the maximum number of open file
    descriptors xenstored should be allowed to have.
    
    The default should be "unlimited" in order not to restrict xenstored
    in the number of domains it can support, but unfortunately the kernel
    is normally limiting the maximum value via /proc/sys/fs/nr_open [1],
    [2]. So check that file to exist and if it does, limit the maximum
    value to the one specified by /proc/sys/fs/nr_open.
    
    As an aid for the admin configuring the value add a comment specifying
    the common needs of xenstored for the different domain types.
    
    [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60fd760fb9ff7034360bab7137c917c0330628c2
    [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2d64fb6cae9aae480f6a46cfe79f8d7d48b59f
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit f282182af32939107d47943aba242d3189ec6f90
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Oct 12 15:41:47 2021 +0200

    tools/xenstore: set oom score for xenstore daemon on Linux
    
    Xenstored is absolutely mandatory for a Xen host and it can't be
    restarted, so being killed by OOM-killer in case of memory shortage is
    to be avoided.
    
    Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
    translates to 50% of dom0 memory size) in order to allow xenstored to
    use large amounts of memory without being killed.
    
    The percentage of dom0 memory above which the oom killer is allowed to
    kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
    xencommons.
    
    Make sure the pid file isn't a left-over from a previous run delete it
    before starting xenstored.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

