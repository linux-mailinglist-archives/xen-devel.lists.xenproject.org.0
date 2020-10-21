Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC6294AA8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 11:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9899.26152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAYY-00085U-Vv; Wed, 21 Oct 2020 09:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9899.26152; Wed, 21 Oct 2020 09:37:18 +0000
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
	id 1kVAYY-000855-Rp; Wed, 21 Oct 2020 09:37:18 +0000
Received: by outflank-mailman (input) for mailman id 9899;
 Wed, 21 Oct 2020 09:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbQ=D4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVAYX-000850-Oa
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:37:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b23a8bb0-1801-4741-8058-7ddfed32ab05;
 Wed, 21 Oct 2020 09:37:12 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVAYS-0001Jz-3r; Wed, 21 Oct 2020 09:37:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVAYR-0007QP-Sw; Wed, 21 Oct 2020 09:37:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVAYR-0003Cy-Qc; Wed, 21 Oct 2020 09:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CZbQ=D4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVAYX-000850-Oa
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:37:17 +0000
X-Inumbo-ID: b23a8bb0-1801-4741-8058-7ddfed32ab05
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b23a8bb0-1801-4741-8058-7ddfed32ab05;
	Wed, 21 Oct 2020 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=T+aFEAdx3/x9IwAjDKKFO1h3hka7HV4HWa4N4q2PUt0=; b=4rm21rYI1Gpqwi61bDfM6k03pr
	UzD3prnik+FHog0qlFO+f7dF3lAhiHxbmRP01GpYLrmb6EfUda4HqC58ZpPjUUy+fOIJtwfxS0Awb
	J5snPewPV8yHIccxcKmtgFHfCSU2ubrln7AxrkhVT6qPz6K4ntgYwmJVSsIOuLQ7eg3s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVAYS-0001Jz-3r; Wed, 21 Oct 2020 09:37:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVAYR-0007QP-Sw; Wed, 21 Oct 2020 09:37:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVAYR-0003Cy-Qc; Wed, 21 Oct 2020 09:37:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete build-armhf
Message-Id: <E1kVAYR-0003Cy-Qc@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Oct 2020 09:37:11 +0000

branch xen-unstable
xenbranch xen-unstable
job build-armhf
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  782d7b30dd8e27ba24346e7c411b476db88b59e7
  Bug not present: e12ce85b2c79d83a340953291912875c30b3af06
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156066/


  commit 782d7b30dd8e27ba24346e7c411b476db88b59e7
  Merge: e12ce85b2c c47110d90f
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Sat Oct 17 20:52:55 2020 +0100
  
      Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging
      
      * Drop ninjatool and just require ninja (Paolo)
      * Fix docs build under msys2 (Yonggang)
      * HAX snafu fix (Claudio)
      * Disable signal handlers during fuzzing (Alex)
      * Miscellaneous fixes (Bruce, Greg)
      
      # gpg: Signature made Sat 17 Oct 2020 15:45:56 BST
      # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
      # gpg:                issuer "pbonzini@redhat.com"
      # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
      # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
      # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
      #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
      
      * remotes/bonzini-gitlab/tags/for-upstream: (22 commits)
        ci: include configure and meson logs in all jobs if configure fails
        hax: unbreak accelerator cpu code after cpus.c split
        fuzz: Disable QEMU's SIG{INT,HUP,TERM} handlers
        cirrus: Enable doc build on msys2/mingw
        meson: Move the detection logic for sphinx to meson
        meson: move SPHINX_ARGS references within "if build_docs"
        docs: Fix Sphinx configuration for msys2/mingw
        meson: Only install icons and qemu.desktop if have_system
        configure: fix handling of --docdir parameter
        meson: cleanup curses/iconv test
        meson.build: don't condition iconv detection on library detection
        build: add --enable/--disable-libudev
        build: replace ninjatool with ninja
        build: cleanups to Makefile
        add ninja to dockerfiles, CI configurations and test VMs
        dockerfiles: enable Centos 8 PowerTools
        configure: move QEMU_INCLUDES to meson
        tests: add missing generated sources to testqapi
        make: run shell with pipefail
        tests/Makefile.include: unbreak non-tcg builds
        ...
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit c47110d90fa5401bcc42c17f8ae0724a1c96599a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Oct 16 05:49:28 2020 -0400
  
      ci: include configure and meson logs in all jobs if configure fails
      
      Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit a1b0e4613006704fb02209df548ce9fde62232e0
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Fri Oct 16 10:00:32 2020 +0200
  
      hax: unbreak accelerator cpu code after cpus.c split
      
      during my split of cpus.c, code line
      "current_cpu = cpu"
      was removed by mistake, causing hax to break.
      
      This commit fixes the situation restoring it.
      
      Reported-by: Volker Rümelin <vr_qemu@t-online.de>
      Fixes: e92558e4bf8059ce4f0b310afe218802b72766bc
      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Message-Id: <20201016080032.13914-1-cfontana@suse.de>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fc69fa216cf52709b1279a592364e50c674db6ff
  Author: Alexander Bulekov <alxndr@bu.edu>
  Date:   Wed Oct 14 10:21:57 2020 -0400
  
      fuzz: Disable QEMU's SIG{INT,HUP,TERM} handlers
      
      Prior to this patch, the only way I found to terminate the fuzzer was
      either to:
       1. Explicitly specify the number of fuzzer runs with the -runs= flag
       2. SIGKILL the process with "pkill -9 qemu-fuzz-*" or similar
      
      In addition to being annoying to deal with, SIGKILLing the process skips
      over any exit handlers(e.g. registered with atexit()). This is bad,
      since some fuzzers might create temporary files that should ideally be
      removed on exit using an exit handler. The only way to achieve a clean
      exit now is to specify -runs=N , but the desired "N" is tricky to
      identify prior to fuzzing.
      
      Why doesn't the process exit with standard SIGINT,SIGHUP,SIGTERM
      signals? QEMU installs its own handlers for these signals in
      os-posix.c:os_setup_signal_handling, which notify the main loop that an
      exit was requested. The fuzzer, however, does not run qemu_main_loop,
      which performs the main_loop_should_exit() check.  This means that the
      fuzzer effectively ignores these signals. As we don't really care about
      cleanly stopping the disposable fuzzer "VM", this patch uninstalls
      QEMU's signal handlers. Thus, we can stop the fuzzer with
      SIG{INT,HUP,TERM} and the fuzzing code can optionally use atexit() to
      clean up temporary files/resources.
      
      Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
      Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
      Message-Id: <20201014142157.46028-1-alxndr@bu.edu>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 5bfb4f52fe897f5594a0089891e19c78d3ecd672
  Author: Yonggang Luo <luoyonggang@gmail.com>
  Date:   Fri Oct 16 06:06:26 2020 +0800
  
      cirrus: Enable doc build on msys2/mingw
      
      Currently rST depends on old version sphinx-2.x.
      Install it by downloading it.
      Remove the need of university mirror, the main repo are recovered.
      
      Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201015220626.418-5-luoyonggang@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e36676604683c1ee12963d83eaaf3d3c2a1790ce
  Author: Yonggang Luo <luoyonggang@gmail.com>
  Date:   Fri Oct 16 06:06:25 2020 +0800
  
      meson: Move the detection logic for sphinx to meson
      
      Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201015220626.418-4-luoyonggang@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9dc6ee3fd78a478935eecf936cddd575c6dfb20a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Oct 16 04:05:26 2020 -0400
  
      meson: move SPHINX_ARGS references within "if build_docs"
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit a94a689cc5c5b2a1fbba4dd418e456a14e6e12e5
  Author: Yonggang Luo <luoyonggang@gmail.com>
  Date:   Fri Oct 16 06:06:23 2020 +0800
  
      docs: Fix Sphinx configuration for msys2/mingw
      
      Python doesn't support running ../scripts/kernel-doc directly.
      
      Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201015220626.418-2-luoyonggang@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3856873ee404c028a47115147f21cdc4b0d25566
  Author: Bruce Rogers <brogers@suse.com>
  Date:   Thu Oct 15 14:18:40 2020 -0600
  
      meson: Only install icons and qemu.desktop if have_system
      
      These files are not needed for a linux-user only install.
      
      Signed-off-by: Bruce Rogers <brogers@suse.com>
      Message-Id: <20201015201840.282956-1-brogers@suse.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c6502638075557ff38fbb874af32f91186b667eb
  Author: Bruce Rogers <brogers@suse.com>
  Date:   Thu Oct 15 13:07:42 2020 -0600
  
      configure: fix handling of --docdir parameter
      
      Commit ca8c0909f01 changed qemu_docdir to be docdir, then later uses the
      qemu_docdir name in the final assignment. Unfortunately, one instance of
      qemu_docdir was missed: the one which comes from the --docdir parameter.
      This patch restores the proper handling of the --docdir parameter.
      
      Fixes: ca8c0909f01 ("configure: build docdir like other suffixed
      directories")
      
      Signed-off-by: Bruce Rogers <brogers@suse.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Message-Id: <20201015190742.270629-1-brogers@suse.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 30fe76b17cc5aad395eb8a8a3da59e377a0b3d8e
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 13:26:50 2020 -0400
  
      meson: cleanup curses/iconv test
      
      Skip the test if it is system emulation is not requested, and
      differentiate errors for lack of iconv and lack of curses.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ac0c8351abf79f3b65105ea27bd0491387d804f6
  Author: Bruce Rogers <brogers@suse.com>
  Date:   Wed Oct 14 16:19:39 2020 -0600
  
      meson.build: don't condition iconv detection on library detection
      
      It isn't necessarily the case that use of iconv requires an additional
      library. For that reason we shouldn't conditionalize iconv detection on
      libiconv.found.
      
      Fixes: 5285e593c33 (configure: Fixes ncursesw detection under msys2/mingw by convert them to meson)
      
      Signed-off-by: Bruce Rogers <brogers@suse.com>
      Reviewed-by: Yonggang Luo<l <brogers@suse.com>uoyonggang@gmail.com>
      Reviewed-by:Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201014221939.196958-1-brogers@suse.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 5c53015a480b3fe137ebd8b3b584a595c65e8f21
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 06:09:27 2020 -0400
  
      build: add --enable/--disable-libudev
      
      Initially, libudev detection was bundled with --enable-mpath because
      qemu-pr-helper was the only user of libudev.  Recently however the USB
      U2F emulation has also started using libudev, so add a separate
      option.  This also allows 1) disabling libudev if desired for static
      builds and 2) for non-static builds, requiring libudev even if
      multipath support is undesirable.
      
      The multipath test is adjusted, because it is now possible to enter it
      with configurations that should fail, such as --static --enable-mpath
      --disable-libudev.
      
      Reported-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 09e93326e448ab43fa26a9e2d9cc20ecf951f32b
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Aug 13 09:28:11 2020 -0400
  
      build: replace ninjatool with ninja
      
      Now that the build is done entirely by Meson, there is no need
      to keep the Makefile conversion.  Instead, we can ask Ninja about
      the targets it exposes and forward them.
      
      The main advantages are, from smallest to largest:
      
      - reducing the possible namespace pollution within the Makefile
      
      - removal of a relatively large Python program
      
      - faster build because parsing Makefile.ninja is slower than
      parsing build.ninja; and faster build after Meson runs because
      we do not have to generate Makefile.ninja.
      
      - tracking of command lines, which provides more accurate rebuilds
      
      In addition the change removes the requirement for GNU make 3.82, which
      was annoying on Mac, and avoids bugs on Windows due to ninjatool not
      knowing how to convert Windows escapes to POSIX escapes.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 2b8575bd5fbc8a8880e9ecfb1c7e7990feb1fea6
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 12:20:02 2020 -0400
  
      build: cleanups to Makefile
      
      Group similar rules, add comments to "else" and "endif" lines,
      detect too-old config-host.mak before messing things up.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 345d7053ca4a39b0496366f3c953ae2681570ce3
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Aug 13 09:58:50 2020 -0400
  
      add ninja to dockerfiles, CI configurations and test VMs
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Acked-by: Alex Bennée <alex.bennee@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f2f984a3b3bc8322df2efa3937bf11e8ea2bcaa5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 07:12:37 2020 -0400
  
      dockerfiles: enable Centos 8 PowerTools
      
      ninja is included in the CentOS PowerTools repository.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 1e6e616dc21a8117cbe36a7e9026221b566cdf56
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 08:45:42 2020 -0400
  
      configure: move QEMU_INCLUDES to meson
      
      Confusingly, QEMU_INCLUDES is not used by configure tests.  Moving
      it to meson.build ensures that Windows paths are specified instead of
      the msys paths like /c/Users/...
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 97d6efd0a3f3a08942de6c2aee5d2983c54ca84c
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 07:20:17 2020 -0400
  
      tests: add missing generated sources to testqapi
      
      Ninja notices them due to a different order in visiting the graph.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3bf4583580ab705de1beff6222e934239c3a0356
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 07:35:13 2020 -0400
  
      make: run shell with pipefail
      
      Without pipefail, it is possible to miss failures if the recipes
      include pipes.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 88da4b043b4f91a265947149b1cd6758c046a4bd
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Oct 13 21:21:21 2020 +0200
  
      tests/Makefile.include: unbreak non-tcg builds
      
      Remove from check-block the requirement that all TARGET_DIRS are built.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e90df5eada4e6047548203d781bd61ddcc45d7b4
  Author: Greg Kurz <groug@kaod.org>
  Date:   Thu Oct 15 16:49:06 2020 +0200
  
      Makefile: Ensure cscope.out/tags/TAGS are generated in the source tree
      
      Tools usually expect the index files to be in the source tree, eg. emacs.
      This is already the case when doing out-of-tree builds, but with in-tree
      builds they end up in the build directory.
      
      Force cscope, ctags and etags to put them in the source tree.
      
      Signed-off-by: Greg Kurz <groug@kaod.org>
      Message-Id: <160277334665.1754102.10921580280105870386.stgit@bahia.lan>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6ebd89cf9ca3f5a6948542c4522b9380b1e9539f
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 03:20:45 2020 -0400
  
      submodules: bump meson to 0.55.3
      
      This adds some bugfixes, and allows MSYS2 to configure
      without "--ninja=ninja".
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf.xen-build --summary-out=tmp/156066.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline build-armhf xen-build
Searching for failure / basis pass:
 156040 fail [host=cubietruck-picasso] / 155971 ok.
Failure / basis pass flights: 156040 / 155971
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f82b827c92f77eac8debdce6ef9689d156771871 4c41341af76cfc85b5a6c0f87de4838672ab9f89 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
Basis pass 73e3cb6c7eea4f5db81c87574dcefe1282de4772 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#73e3cb6c7eea4f5db81c87574dcefe1282de4772-f82b827c92f77eac8debdce6ef9689d156771871 git://git.qemu.org/qemu.git#e12ce85b2c79d83a340953291912875c30b3af06-4c41341af76cfc85b5a6c0f87de4838672ab9f89 git://xenbits.xen.org/osstest/seabios.git#58a44be024f69d2e4d2b58553529230abdd3935e-58a44be024f69d2e4d2b58553529230abdd3935e git://xenbits.xen.org/xen.git#0dfddb2116e3757f77a691a3fe335173088d69dc-0dfddb2116e3757f77a6\
 91a3fe335173088d69dc
Loaded 34884 nodes in revision graph
Searching for test results:
 155953 [host=cubietruck-gleizes]
 155971 pass 73e3cb6c7eea4f5db81c87574dcefe1282de4772 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 155979 [host=cubietruck-braque]
 156006 [host=cubietruck-braque]
 155994 [host=cubietruck-gleizes]
 156007 [host=cubietruck-braque]
 156008 [host=cubietruck-gleizes]
 156009 [host=cubietruck-gleizes]
 156011 [host=cubietruck-braque]
 156014 [host=cubietruck-gleizes]
 156015 [host=cubietruck-gleizes]
 156016 [host=cubietruck-braque]
 156019 [host=cubietruck-braque]
 156021 [host=cubietruck-gleizes]
 156022 [host=cubietruck-gleizes]
 156023 [host=cubietruck-braque]
 156024 [host=cubietruck-gleizes]
 156025 [host=cubietruck-gleizes]
 156026 [host=cubietruck-gleizes]
 156032 [host=cubietruck-gleizes]
 156028 fail f82b827c92f77eac8debdce6ef9689d156771871 4c41341af76cfc85b5a6c0f87de4838672ab9f89 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156036 [host=cubietruck-gleizes]
 156043 pass 73e3cb6c7eea4f5db81c87574dcefe1282de4772 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156044 fail f82b827c92f77eac8debdce6ef9689d156771871 4c41341af76cfc85b5a6c0f87de4838672ab9f89 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156045 fail 92e9c44f205a876556abe1a1addea5c40e4f3ccf 000f5b8f46f9a9f0a0d5304b605d89808ad92d4e 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156046 pass 92e9c44f205a876556abe1a1addea5c40e4f3ccf 3e7e134d827790c3714cae1d5b8aff8612000116 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156051 pass 92e9c44f205a876556abe1a1addea5c40e4f3ccf bb997e5c967b3b6f19f1461811df6317ed37c5ff 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156055 fail 92e9c44f205a876556abe1a1addea5c40e4f3ccf 782d7b30dd8e27ba24346e7c411b476db88b59e7 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156040 fail f82b827c92f77eac8debdce6ef9689d156771871 4c41341af76cfc85b5a6c0f87de4838672ab9f89 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156056 fail 73e3cb6c7eea4f5db81c87574dcefe1282de4772 782d7b30dd8e27ba24346e7c411b476db88b59e7 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156058 pass 73e3cb6c7eea4f5db81c87574dcefe1282de4772 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156060 fail 73e3cb6c7eea4f5db81c87574dcefe1282de4772 782d7b30dd8e27ba24346e7c411b476db88b59e7 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156061 pass 73e3cb6c7eea4f5db81c87574dcefe1282de4772 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
 156066 fail 73e3cb6c7eea4f5db81c87574dcefe1282de4772 782d7b30dd8e27ba24346e7c411b476db88b59e7 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
Searching for interesting versions
 Result found: flight 155971 (pass), for basis pass
 Result found: flight 156028 (fail), for basis failure
 Repro found: flight 156043 (pass), for basis pass
 Repro found: flight 156044 (fail), for basis failure
 0 revisions at 73e3cb6c7eea4f5db81c87574dcefe1282de4772 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 0dfddb2116e3757f77a691a3fe335173088d69dc
No revisions left to test, checking graph state.
 Result found: flight 155971 (pass), for last pass
 Result found: flight 156056 (fail), for first failure
 Repro found: flight 156058 (pass), for last pass
 Repro found: flight 156060 (fail), for first failure
 Repro found: flight 156061 (pass), for last pass
 Repro found: flight 156066 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  782d7b30dd8e27ba24346e7c411b476db88b59e7
  Bug not present: e12ce85b2c79d83a340953291912875c30b3af06
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156066/


  commit 782d7b30dd8e27ba24346e7c411b476db88b59e7
  Merge: e12ce85b2c c47110d90f
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Sat Oct 17 20:52:55 2020 +0100
  
      Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging
      
      * Drop ninjatool and just require ninja (Paolo)
      * Fix docs build under msys2 (Yonggang)
      * HAX snafu fix (Claudio)
      * Disable signal handlers during fuzzing (Alex)
      * Miscellaneous fixes (Bruce, Greg)
      
      # gpg: Signature made Sat 17 Oct 2020 15:45:56 BST
      # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
      # gpg:                issuer "pbonzini@redhat.com"
      # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
      # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
      # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
      #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
      
      * remotes/bonzini-gitlab/tags/for-upstream: (22 commits)
        ci: include configure and meson logs in all jobs if configure fails
        hax: unbreak accelerator cpu code after cpus.c split
        fuzz: Disable QEMU's SIG{INT,HUP,TERM} handlers
        cirrus: Enable doc build on msys2/mingw
        meson: Move the detection logic for sphinx to meson
        meson: move SPHINX_ARGS references within "if build_docs"
        docs: Fix Sphinx configuration for msys2/mingw
        meson: Only install icons and qemu.desktop if have_system
        configure: fix handling of --docdir parameter
        meson: cleanup curses/iconv test
        meson.build: don't condition iconv detection on library detection
        build: add --enable/--disable-libudev
        build: replace ninjatool with ninja
        build: cleanups to Makefile
        add ninja to dockerfiles, CI configurations and test VMs
        dockerfiles: enable Centos 8 PowerTools
        configure: move QEMU_INCLUDES to meson
        tests: add missing generated sources to testqapi
        make: run shell with pipefail
        tests/Makefile.include: unbreak non-tcg builds
        ...
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit c47110d90fa5401bcc42c17f8ae0724a1c96599a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Oct 16 05:49:28 2020 -0400
  
      ci: include configure and meson logs in all jobs if configure fails
      
      Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit a1b0e4613006704fb02209df548ce9fde62232e0
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Fri Oct 16 10:00:32 2020 +0200
  
      hax: unbreak accelerator cpu code after cpus.c split
      
      during my split of cpus.c, code line
      "current_cpu = cpu"
      was removed by mistake, causing hax to break.
      
      This commit fixes the situation restoring it.
      
      Reported-by: Volker Rümelin <vr_qemu@t-online.de>
      Fixes: e92558e4bf8059ce4f0b310afe218802b72766bc
      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Message-Id: <20201016080032.13914-1-cfontana@suse.de>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fc69fa216cf52709b1279a592364e50c674db6ff
  Author: Alexander Bulekov <alxndr@bu.edu>
  Date:   Wed Oct 14 10:21:57 2020 -0400
  
      fuzz: Disable QEMU's SIG{INT,HUP,TERM} handlers
      
      Prior to this patch, the only way I found to terminate the fuzzer was
      either to:
       1. Explicitly specify the number of fuzzer runs with the -runs= flag
       2. SIGKILL the process with "pkill -9 qemu-fuzz-*" or similar
      
      In addition to being annoying to deal with, SIGKILLing the process skips
      over any exit handlers(e.g. registered with atexit()). This is bad,
      since some fuzzers might create temporary files that should ideally be
      removed on exit using an exit handler. The only way to achieve a clean
      exit now is to specify -runs=N , but the desired "N" is tricky to
      identify prior to fuzzing.
      
      Why doesn't the process exit with standard SIGINT,SIGHUP,SIGTERM
      signals? QEMU installs its own handlers for these signals in
      os-posix.c:os_setup_signal_handling, which notify the main loop that an
      exit was requested. The fuzzer, however, does not run qemu_main_loop,
      which performs the main_loop_should_exit() check.  This means that the
      fuzzer effectively ignores these signals. As we don't really care about
      cleanly stopping the disposable fuzzer "VM", this patch uninstalls
      QEMU's signal handlers. Thus, we can stop the fuzzer with
      SIG{INT,HUP,TERM} and the fuzzing code can optionally use atexit() to
      clean up temporary files/resources.
      
      Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
      Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
      Message-Id: <20201014142157.46028-1-alxndr@bu.edu>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 5bfb4f52fe897f5594a0089891e19c78d3ecd672
  Author: Yonggang Luo <luoyonggang@gmail.com>
  Date:   Fri Oct 16 06:06:26 2020 +0800
  
      cirrus: Enable doc build on msys2/mingw
      
      Currently rST depends on old version sphinx-2.x.
      Install it by downloading it.
      Remove the need of university mirror, the main repo are recovered.
      
      Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201015220626.418-5-luoyonggang@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e36676604683c1ee12963d83eaaf3d3c2a1790ce
  Author: Yonggang Luo <luoyonggang@gmail.com>
  Date:   Fri Oct 16 06:06:25 2020 +0800
  
      meson: Move the detection logic for sphinx to meson
      
      Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201015220626.418-4-luoyonggang@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9dc6ee3fd78a478935eecf936cddd575c6dfb20a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Oct 16 04:05:26 2020 -0400
  
      meson: move SPHINX_ARGS references within "if build_docs"
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit a94a689cc5c5b2a1fbba4dd418e456a14e6e12e5
  Author: Yonggang Luo <luoyonggang@gmail.com>
  Date:   Fri Oct 16 06:06:23 2020 +0800
  
      docs: Fix Sphinx configuration for msys2/mingw
      
      Python doesn't support running ../scripts/kernel-doc directly.
      
      Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201015220626.418-2-luoyonggang@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3856873ee404c028a47115147f21cdc4b0d25566
  Author: Bruce Rogers <brogers@suse.com>
  Date:   Thu Oct 15 14:18:40 2020 -0600
  
      meson: Only install icons and qemu.desktop if have_system
      
      These files are not needed for a linux-user only install.
      
      Signed-off-by: Bruce Rogers <brogers@suse.com>
      Message-Id: <20201015201840.282956-1-brogers@suse.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c6502638075557ff38fbb874af32f91186b667eb
  Author: Bruce Rogers <brogers@suse.com>
  Date:   Thu Oct 15 13:07:42 2020 -0600
  
      configure: fix handling of --docdir parameter
      
      Commit ca8c0909f01 changed qemu_docdir to be docdir, then later uses the
      qemu_docdir name in the final assignment. Unfortunately, one instance of
      qemu_docdir was missed: the one which comes from the --docdir parameter.
      This patch restores the proper handling of the --docdir parameter.
      
      Fixes: ca8c0909f01 ("configure: build docdir like other suffixed
      directories")
      
      Signed-off-by: Bruce Rogers <brogers@suse.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Message-Id: <20201015190742.270629-1-brogers@suse.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 30fe76b17cc5aad395eb8a8a3da59e377a0b3d8e
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 13:26:50 2020 -0400
  
      meson: cleanup curses/iconv test
      
      Skip the test if it is system emulation is not requested, and
      differentiate errors for lack of iconv and lack of curses.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ac0c8351abf79f3b65105ea27bd0491387d804f6
  Author: Bruce Rogers <brogers@suse.com>
  Date:   Wed Oct 14 16:19:39 2020 -0600
  
      meson.build: don't condition iconv detection on library detection
      
      It isn't necessarily the case that use of iconv requires an additional
      library. For that reason we shouldn't conditionalize iconv detection on
      libiconv.found.
      
      Fixes: 5285e593c33 (configure: Fixes ncursesw detection under msys2/mingw by convert them to meson)
      
      Signed-off-by: Bruce Rogers <brogers@suse.com>
      Reviewed-by: Yonggang Luo<l <brogers@suse.com>uoyonggang@gmail.com>
      Reviewed-by:Yonggang Luo <luoyonggang@gmail.com>
      Message-Id: <20201014221939.196958-1-brogers@suse.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 5c53015a480b3fe137ebd8b3b584a595c65e8f21
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 06:09:27 2020 -0400
  
      build: add --enable/--disable-libudev
      
      Initially, libudev detection was bundled with --enable-mpath because
      qemu-pr-helper was the only user of libudev.  Recently however the USB
      U2F emulation has also started using libudev, so add a separate
      option.  This also allows 1) disabling libudev if desired for static
      builds and 2) for non-static builds, requiring libudev even if
      multipath support is undesirable.
      
      The multipath test is adjusted, because it is now possible to enter it
      with configurations that should fail, such as --static --enable-mpath
      --disable-libudev.
      
      Reported-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 09e93326e448ab43fa26a9e2d9cc20ecf951f32b
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Aug 13 09:28:11 2020 -0400
  
      build: replace ninjatool with ninja
      
      Now that the build is done entirely by Meson, there is no need
      to keep the Makefile conversion.  Instead, we can ask Ninja about
      the targets it exposes and forward them.
      
      The main advantages are, from smallest to largest:
      
      - reducing the possible namespace pollution within the Makefile
      
      - removal of a relatively large Python program
      
      - faster build because parsing Makefile.ninja is slower than
      parsing build.ninja; and faster build after Meson runs because
      we do not have to generate Makefile.ninja.
      
      - tracking of command lines, which provides more accurate rebuilds
      
      In addition the change removes the requirement for GNU make 3.82, which
      was annoying on Mac, and avoids bugs on Windows due to ninjatool not
      knowing how to convert Windows escapes to POSIX escapes.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 2b8575bd5fbc8a8880e9ecfb1c7e7990feb1fea6
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 12:20:02 2020 -0400
  
      build: cleanups to Makefile
      
      Group similar rules, add comments to "else" and "endif" lines,
      detect too-old config-host.mak before messing things up.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 345d7053ca4a39b0496366f3c953ae2681570ce3
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Aug 13 09:58:50 2020 -0400
  
      add ninja to dockerfiles, CI configurations and test VMs
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Acked-by: Alex Bennée <alex.bennee@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f2f984a3b3bc8322df2efa3937bf11e8ea2bcaa5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 07:12:37 2020 -0400
  
      dockerfiles: enable Centos 8 PowerTools
      
      ninja is included in the CentOS PowerTools repository.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 1e6e616dc21a8117cbe36a7e9026221b566cdf56
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 08:45:42 2020 -0400
  
      configure: move QEMU_INCLUDES to meson
      
      Confusingly, QEMU_INCLUDES is not used by configure tests.  Moving
      it to meson.build ensures that Windows paths are specified instead of
      the msys paths like /c/Users/...
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 97d6efd0a3f3a08942de6c2aee5d2983c54ca84c
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 07:20:17 2020 -0400
  
      tests: add missing generated sources to testqapi
      
      Ninja notices them due to a different order in visiting the graph.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3bf4583580ab705de1beff6222e934239c3a0356
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 14 07:35:13 2020 -0400
  
      make: run shell with pipefail
      
      Without pipefail, it is possible to miss failures if the recipes
      include pipes.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 88da4b043b4f91a265947149b1cd6758c046a4bd
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Oct 13 21:21:21 2020 +0200
  
      tests/Makefile.include: unbreak non-tcg builds
      
      Remove from check-block the requirement that all TARGET_DIRS are built.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e90df5eada4e6047548203d781bd61ddcc45d7b4
  Author: Greg Kurz <groug@kaod.org>
  Date:   Thu Oct 15 16:49:06 2020 +0200
  
      Makefile: Ensure cscope.out/tags/TAGS are generated in the source tree
      
      Tools usually expect the index files to be in the source tree, eg. emacs.
      This is already the case when doing out-of-tree builds, but with in-tree
      builds they end up in the build directory.
      
      Force cscope, ctags and etags to put them in the source tree.
      
      Signed-off-by: Greg Kurz <groug@kaod.org>
      Message-Id: <160277334665.1754102.10921580280105870386.stgit@bahia.lan>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6ebd89cf9ca3f5a6948542c4522b9380b1e9539f
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 15 03:20:45 2020 -0400
  
      submodules: bump meson to 0.55.3
      
      This adds some bugfixes, and allows MSYS2 to configure
      without "--ninja=ninja".
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
156066: tolerable ALL FAIL

flight 156066 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156066/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf                   6 xen-build               fail baseline untested


jobs:
 build-armhf                                                  fail    


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


