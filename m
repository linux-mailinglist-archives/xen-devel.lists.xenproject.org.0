Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5EA255184
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 01:17:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBR8f-0002sy-RL; Thu, 27 Aug 2020 23:17:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz+Y=CF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kBR8e-0002st-6u
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 23:17:00 +0000
X-Inumbo-ID: be4864f1-0cf3-42e7-92fb-4899469c74bd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be4864f1-0cf3-42e7-92fb-4899469c74bd;
 Thu, 27 Aug 2020 23:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=OOpjrc3Q4o0/PWYWBuf/5HvBEpVSv8pOrlg1Plv7ak4=; b=Ywfbs5nJmwbcXiobf6njuVnI33
 XQYQAvCTdVGuwtP7YsXw7U+VCjH6SFkv08ASJZWdjI3qvmN/SZl+zYkkz2BFwvLRW3GMxHm0UVWaY
 SHt4zB+TbgPCcVBsUUXTI2zDXLvr5VTtK6prgCyZ3+N5GWxBxvp0sdhte1A33yB5/aOI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kBR8b-0003TF-Ef; Thu, 27 Aug 2020 23:16:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kBR8b-0005tx-7h; Thu, 27 Aug 2020 23:16:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kBR8b-0007qF-7C; Thu, 27 Aug 2020 23:16:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152926-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 152926: regressions - FAIL
X-Osstest-Failures: xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=0de9cbf9cfeedbd2a2e4719a2faa6084f0fcbb52
X-Osstest-Versions-That: xen=484fca9569f03fbcb0fa5704f59164f95b0a8fcb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Aug 2020 23:16:57 +0000
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

flight 152926 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152926/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 152892

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0de9cbf9cfeedbd2a2e4719a2faa6084f0fcbb52
baseline version:
 xen                  484fca9569f03fbcb0fa5704f59164f95b0a8fcb

Last test of basis   152892  2020-08-27 11:00:25 Z    0 days
Testing same since   152898  2020-08-27 14:01:18 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit 0de9cbf9cfeedbd2a2e4719a2faa6084f0fcbb52
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:12 2020 +0200

    stubdom: simplify building xen libraries for stubdoms
    
    The pattern for building a Xen library with sources under tools/libs
    is always the same. Simplify stubdom/Makefile by defining a callable
    make program for those libraries.
    
    Even if not needed right now add the possibility for defining
    additional dependencies for a library.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

commit ddb2934a914df26762c45f0b114fa358a045e0ee
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:11 2020 +0200

    stubdom: add correct dependencies for Xen libraries
    
    The stubdom Makefile is missing several dependencies between Xen
    libraries. Add them.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

commit ded08cdfa72bb1555a2beb5c4300dedb1f830358
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:11 2020 +0200

    tools: generate most contents of library make variables
    
    Library related make variables (CFLAGS_lib*, SHDEPS_lib*, LDLIBS_lib*
    and SHLIB_lib*) mostly have a common pattern for their values. Generate
    most of this content automatically by adding a new per-library variable
    defining on which other libraries a lib is depending. Those definitions
    are put into an own file in order to make it possible to include it
    from various Makefiles, especially for stubdom.
    
    This in turn makes it possible to drop the USELIB variable from each
    library Makefile.
    
    The LIBNAME variable can be dropped, too, as it can be derived from the
    directory name the library is residing in.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 09bf2917046f78a5f0b42da771602bb4ef5dcc09
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:11 2020 +0200

    tools: define ROUNDUP() in tools/include/xen-tools/libs.h
    
    Today there are multiple copies of the ROUNDUP() macro in various
    sources and headers. Define it once in tools/include/xen-tools/libs.h.
    
    Using xen-tools/libs.h enables removing copies of MIN() and MAX(), too.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 097b6fe1df89a0506a4feb1379ba5d9d14ec3a3b
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:11 2020 +0200

    tools: don't call make recursively from libs.mk
    
    During build of a xen library make is called again via libs.mk. This is
    not necessary as the same can be achieved by a simple dependency.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit bc44e2fb3199ecd8461bbdd093806f76ee61776a
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:11 2020 +0200

    tools: add a copy of library headers in tools/include
    
    The headers.chk target in tools/Rules.mk tries to compile all headers
    stand alone for testing them not to include any internal header.
    
    Unfortunately the headers tested against are not complete, as any
    header for a Xen library is not included in the include path of the
    test compile run, resulting in a failure in case any of the tested
    headers in including an official Xen library header.
    
    Fix that by copying the official headers located in
    tools/libs/*/include to tools/include.
    
    In order to support libraries with header name other than xen<lib>.h
    or with multiple headers add a LIBHEADER make variable a lib specific
    Makefile can set in that case.
    
    Move the headers.chk target from Rules.mk to libs.mk as it is used
    for libraries in tools/libs only.
    
    Add NO_HEADERS_CHK variable to skip checking headers as this will be
    needed e.g. for libxenctrl.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 725ef89164e38349c9e6210f720e0cdc0c52e69e
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:11 2020 +0200

    tools: switch XEN_LIBXEN* make variables to lower case (XEN_libxen*)
    
    In order to harmonize names of library related make variables switch
    XEN_LIBXEN* names to XEN_libxen*, as all other related variables (e.g.
    CFLAGS_libxen*, SHDEPS_libxen*, ...) already use this pattern.
    
    Rename XEN_LIBXC to XEN_libxenctrl, XEN_XENSTORE to XEN_libxenstore,
    XEN_XENLIGHT to XEN_libxenlight, XEN_XLUTIL to XEN_libxlutil, and
    XEN_LIBVCHAN to XEN_libxenvchan for the same reason.
    
    Introduce XEN_libxenguest with the same value as XEN_libxenctrl.
    
    No functional change.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 314d8cc0d87e04dd81eb9970709e71c50fef7b14
Author: Juergen Gross <jgross@suse.com>
Date:   Sun Aug 23 10:00:10 2020 +0200

    stubdom: add stubdom/mini-os.mk for Xen paths used by Mini-OS
    
    stubdom/mini-os.mk should contain paths used by Mini-OS when built as
    stubdom.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

commit e32605b07ef2e01c9d05da9b2d5d7b8f9a5c7c1b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Apr 10 16:25:40 2018 +0100

    x86: Begin to introduce support for MSR_ARCH_CAPS
    
    ... including serialisation/deserialisation logic and unit tests.
    
    There is no current way to configure this MSR correctly for guests.
    The toolstack side this logic needs building, which is far easier to
    do with it in place.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 70c52c46bca89de00f04aa9294e14d11a2adff80
Author: Wei Liu <wl@xen.org>
Date:   Thu Aug 27 10:48:38 2020 +0000

    gitignore: ignore ebmalloc.c soft link
    
    A previous commit split ebmalloc to its own translation unit but forgot
    to modify gitignore.
    
    Fixes: 8856a914bffd ("build: also check for empty .bss.* in .o -> .init.o conversion")
    Signed-off-by: Wei Liu <wl@xen.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

