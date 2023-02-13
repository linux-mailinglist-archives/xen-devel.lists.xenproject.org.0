Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D276946F6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494496.764579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYr2-0000Jo-5h; Mon, 13 Feb 2023 13:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494496.764579; Mon, 13 Feb 2023 13:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYr2-0000Gk-1P; Mon, 13 Feb 2023 13:26:48 +0000
Received: by outflank-mailman (input) for mailman id 494496;
 Mon, 13 Feb 2023 13:26:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRYr0-0000Ga-V4; Mon, 13 Feb 2023 13:26:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRYr0-0006Lo-Rb; Mon, 13 Feb 2023 13:26:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pRYr0-0007EX-Ep; Mon, 13 Feb 2023 13:26:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pRYr0-0003Dc-EP; Mon, 13 Feb 2023 13:26:46 +0000
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
	bh=FHWfpRxTuaoesYqtfq1iYaa7md4wBfKCZMm0WsbvTRo=; b=awW6WjuKfyvfhBOhTkg9G38uFW
	xX5wDJqXS1cX9/LAzHDnKbVDfl5zAXmBQZAfQSFAe27MnV7C3gLvPybokutA8LyeNRayvcui9qaOL
	ylTQI4PVkwjenSHabYwaiAFZzFNWvLSUgQ+ufxRZpxurMJPeqLN5Ok+seksyGXHL6C7Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177133-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 177133: regressions - trouble: broken/fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-start/freebsd.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=ceaa837f96adb69c0df0397937cd74991d5d821a
X-Osstest-Versions-That:
    linux=711e9a4d52bf4e477e51c7135e1e6188c42018d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Feb 2023 13:26:46 +0000

flight 177133 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177133/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 177104
 test-amd64-amd64-freebsd11-amd64 21 guest-start/freebsd.repeat fail REGR. vs. 177104

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 177104
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 177104
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 177104
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 177104
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 177104
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                ceaa837f96adb69c0df0397937cd74991d5d821a
baseline version:
 linux                711e9a4d52bf4e477e51c7135e1e6188c42018d0

Last test of basis   177104  2023-02-12 20:42:38 Z    0 days
Testing same since   177133  2023-02-13 03:40:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Geert Uytterhoeven <geert+renesas@glider.be>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Linus Torvalds <torvalds@linux-foundation.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Yafang Shao <laoar.shao@gmail.com>
  Yoshinori Sato <ysato@users.sourceforge.jp>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 


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

broken-job test-amd64-amd64-libvirt-pair broken
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)

Not pushing.

------------------------------------------------------------
commit ceaa837f96adb69c0df0397937cd74991d5d821a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 12 14:10:17 2023 -0800

    Linux 6.2-rc8

commit 80510b63f7b6bdd30e07b3a42115d0a324e20cd6
Author: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Date:   Tue Feb 7 17:57:15 2023 +0100

    MAINTAINERS: Add myself as maintainer for arch/sh (SUPERH)
    
    Both Rich Felker and Yoshinori Sato haven't done any work on arch/sh
    for a while. As I have been maintaining Debian's sh4 port since 2014,
    I am interested to keep the architecture alive.
    
    Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
    Acked-by: Yoshinori Sato <ysato@users.sourceforge.jp>
    Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 5e98e916f95bdc50e90f3199d7f3d74b94fa5976
Merge: 711e9a4d52bf b6c7abd1c28a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 12 13:52:17 2023 -0800

    Merge tag 'trace-v6.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
    
    Pull tracing fix from Steven Rostedt:
     "Fix showing of TASK_COMM_LEN instead of its value
    
      The TASK_COMM_LEN was converted from a macro into an enum so that BTF
      would have access to it. But this unfortunately caused TASK_COMM_LEN
      to display in the format fields of trace events, as they are created
      by the TRACE_EVENT() macro and such, macros convert to their values,
      where as enums do not.
    
      To handle this, instead of using the field itself to be display, save
      the value of the array size as another field in the trace_event_fields
      structure, and use that instead.
    
      Not only does this fix the issue, but also converts the other trace
      events that have this same problem (but were not breaking tooling).
    
      With this change, the original work around b3bc8547d3be6 ("tracing:
      Have TRACE_DEFINE_ENUM affect trace event types as well") could be
      reverted (but that should be done in the merge window)"
    
    * tag 'trace-v6.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace:
      tracing: Fix TASK_COMM_LEN in trace event format file

commit b6c7abd1c28a63ad633433d037ee15a1bc3023ba
Author: Yafang Shao <laoar.shao@gmail.com>
Date:   Sun Feb 12 15:13:03 2023 +0000

    tracing: Fix TASK_COMM_LEN in trace event format file
    
    After commit 3087c61ed2c4 ("tools/testing/selftests/bpf: replace open-coded 16 with TASK_COMM_LEN"),
    the content of the format file under
    /sys/kernel/tracing/events/task/task_newtask was changed from
      field:char comm[16];    offset:12;    size:16;    signed:0;
    to
      field:char comm[TASK_COMM_LEN];    offset:12;    size:16;    signed:0;
    
    John reported that this change breaks older versions of perfetto.
    Then Mathieu pointed out that this behavioral change was caused by the
    use of __stringify(_len), which happens to work on macros, but not on enum
    labels. And he also gave the suggestion on how to fix it:
      :One possible solution to make this more robust would be to extend
      :struct trace_event_fields with one more field that indicates the length
      :of an array as an actual integer, without storing it in its stringified
      :form in the type, and do the formatting in f_show where it belongs.
    
    The result as follows after this change,
    $ cat /sys/kernel/tracing/events/task/task_newtask/format
            field:char comm[16];    offset:12;      size:16;        signed:0;
    
    Link: https://lore.kernel.org/lkml/Y+QaZtz55LIirsUO@google.com/
    Link: https://lore.kernel.org/linux-trace-kernel/20230210155921.4610-1-laoar.shao@gmail.com/
    Link: https://lore.kernel.org/linux-trace-kernel/20230212151303.12353-1-laoar.shao@gmail.com
    
    Cc: stable@vger.kernel.org
    Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>
    Cc: Kajetan Puchalski <kajetan.puchalski@arm.com>
    CC: Qais Yousef <qyousef@layalina.io>
    Fixes: 3087c61ed2c4 ("tools/testing/selftests/bpf: replace open-coded 16 with TASK_COMM_LEN")
    Reported-by: John Stultz <jstultz@google.com>
    Debugged-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Suggested-by: Steven Rostedt <rostedt@goodmis.org>
    Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
    Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

