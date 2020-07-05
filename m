Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5E214C80
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 15:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js4GU-0001zO-BJ; Sun, 05 Jul 2020 13:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tmk=AQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1js4GT-0001zH-3v
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 13:01:01 +0000
X-Inumbo-ID: 9233f5a2-bebf-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9233f5a2-bebf-11ea-8496-bc764e2007e4;
 Sun, 05 Jul 2020 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EvwIZRda5zbZ10HnMythaaVsDV0rsVpJM0EYe+3Ja5o=; b=mL5zdp/TGFLU+1rlF7X9o1xnR
 qLpSsy534JkzagYyvNlcLu1KSgDkrY9n+96waLsSG6uMRFuadZuZFuObjWzHpF/ED+vXy17BuACZ1
 4YkFQLQd6YrpUh/vAAYO3RC1IOOYFbieGZxtWaLREn+LCxGYRGFTu4unvkM94OC9Z+WyU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1js4GQ-0000li-HA; Sun, 05 Jul 2020 13:00:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1js4GP-0001cQ-Qw; Sun, 05 Jul 2020 13:00:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1js4GP-0000VN-Pq; Sun, 05 Jul 2020 13:00:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151638-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 151638: regressions - FAIL
X-Osstest-Failures: libvirt:test-amd64-amd64-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
 libvirt:test-amd64-i386-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
 libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: libvirt=ab9fd53823483975adb0cb7d46e03f647c7f3b57
X-Osstest-Versions-That: libvirt=e7998ebeaf15e4e8825be0dd97aa1316f194f00d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Jul 2020 13:00:57 +0000
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

flight 151638 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151638/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair 22 guest-migrate/src_host/dst_host fail REGR. vs. 151496
 test-amd64-i386-libvirt-pair 22 guest-migrate/src_host/dst_host fail REGR. vs. 151496

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151496
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151496
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 12 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 13 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              ab9fd53823483975adb0cb7d46e03f647c7f3b57
baseline version:
 libvirt              e7998ebeaf15e4e8825be0dd97aa1316f194f00d

Last test of basis   151496  2020-07-01 04:23:43 Z    4 days
Failing since        151527  2020-07-02 04:29:15 Z    3 days    4 attempts
Testing same since   151638  2020-07-05 04:25:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniel Veillard <veillard@redhat.com>
  Laine Stump <laine@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Yanqiu Zhang <yanqzhan@redhat.com>

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
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
 test-arm64-arm64-libvirt-qcow2                               pass    
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
commit ab9fd53823483975adb0cb7d46e03f647c7f3b57
Author: Laine Stump <laine@redhat.com>
Date:   Wed Jun 24 13:12:56 2020 -0400

    network: use proper arg type when calling virNetDevSetOnline()
    
    The 2nd arg to this function is a bool, not an int.
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit e95dd7aacd814c5b7d109252f0b68b2ac9cebb9b
Author: Laine Stump <laine@redhat.com>
Date:   Tue Jun 23 22:52:58 2020 -0400

    network: make networkDnsmasqXmlNsDef private to bridge_driver.c
    
    This struct isn't used anywhere else.
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 9ceb3cff8582119d2f907b85655e758068770e83
Author: Laine Stump <laine@redhat.com>
Date:   Fri Jun 19 17:40:17 2020 -0400

    network: fix memory leak in networkBuildDhcpDaemonCommandLine()
    
    hostsfilestr was not being freed. This will be turned into g_autofree
    in an upcoming patch converting a lot more of the same file to using
    g_auto*, but I wanted to make a separate patch for this first so the
    other patch is simpler to review (and to make backporting easier).
    
    The leak was introduced in commit 97a0aa246799c97d0a9ca9ecd6b4fd932ae4756c
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit a726feb693ea5a1b0c90761c35641f0db8fc0619
Author: Laine Stump <laine@redhat.com>
Date:   Thu Jun 18 19:16:33 2020 -0400

    use g_autoptr for all xmlBuffers
    
    AUTOPTR_CLEANUP_FUNC is set to xmlBufferFree() in util/virxml.h (This
    is actually new - added accidentally (but fortunately harmlessly!) in
    commit 257aba2dafe. I had added it along with the hunks in this patch,
    then decided to remove it and submit separately, but missed taking out
    the hunk in virxml.h)
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit b7a92bce070fd57844a59bf8b1c30cb4ef4f3acd
Author: Laine Stump <laine@redhat.com>
Date:   Thu Jun 18 12:49:09 2020 -0400

    conf, vmx: check for OOM after calling xmlBufferCreate()
    
    Although libvirt itself uses g_malloc0() and friends, which exit when
    there isn't enouogh memory, libxml2 uses standard malloc(), which just
    returns NULL on OOM - this means we must check for NULL on return from
    any libxml2 functions that allocate memory.
    
    xmlBufferCreate(), for example, might return NULL, and we don't always
    check for it. This patch adds checks where it isn't already done.
    
    (NB: Although libxml2 has a provision for changing behavior on OOM (by
    calling xmlMemSetup() to change what functions are used to
    allocating/freeing memory), we can't use that, since parts of libvirt
    code end up in libvirt.so, which is linked and called directly by
    applications that may themselves use libxml2 (and may have already set
    their own alternate malloc()), e.g. drivers like esx which live totally
    in the library rather than a separate process.)
    
    Signed-off-by: Laine Stump <laine@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit ad231189ab948f82b8f2288250df088d9718bb7c
Author: Yanqiu Zhang <yanqzhan@redhat.com>
Date:   Thu Jul 2 09:06:46 2020 +0000

    news.html: Add 3 new features
    
    Add 'virtio packed' in 6.3.0, 'virDomainGetHostnameFlags' and
    'Panic Crashloaded event' for 6.1.0.
    
    Signed-off-by: Yanqiu Zhang <yanqzhan@redhat.com>
    Reviewed-by: Andrea Bolognani <abologna@redhat.com>

commit 201f8d1876136b0693505614efa3c9d113aff0bb
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Mon Jun 29 14:55:54 2020 +0200

    virConnectGetAllDomainStats: Document two vcpu stats
    
    When introducing vcpu.<num>.wait (v1.3.2-rc1~301) and
    vcpu.<num>.halted (v2.4.0-rc1~36) the documentation was
    not written.
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

commit c203b8fee1ce15003934c09e811fbd2eaec9f230
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Jul 2 15:02:38 2020 +0200

    docs: Update CI documentation
    
    We're no longer using either Travis CI or the Jenkins-based
    CentOS CI, but we have started using Cirrus CI.
    
    Mention the libvirt-ci subproject as well, as a pointer for those
    who might want to learn more about our CI infrastructure.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit fb912901316dbe7d485551606373bd71d5271601
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Mon Jun 29 19:00:36 2020 +0200

    cirrus: Generate jobs dynamically
    
    Instead of having static job definitions for FreeBSD and macOS,
    use a generic template for both and fill in the details that are
    actually different, such as the list of packages to install, in
    the GitLab CI job, right before calling cirrus-run.
    
    The target-specific information are provided by lcitool, so that
    keeping them up to date is just a matter of running the refresh
    script when necessary.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Erik Skultety <eskultet@redhat.com>

commit 919ee94ca9c7fed77897fa8e3b04952e02780c0c
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Fri Jul 3 09:32:30 2020 +0200

    maint: Post-release version bump to 6.6.0
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

commit d7f935f1f17a3ecf180ddb9600cbef4ba8dc20f4
Author: Daniel Veillard <veillard@redhat.com>
Date:   Fri Jul 3 08:49:25 2020 +0200

    Release of libvirt-6.5.0
    
    * NEWS.rst: updated with date of release
    
    Signed-off-by: Daniel Veillard <veillard@redhat.com>

commit d1d888a69f505922140bec292b8d208b3571f084
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Thu Jul 2 14:41:18 2020 +0200

    NEWS: Update for libvirt 6.5.0
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit 7fa7f7eeb6e969e002845928e155914da2fc8cd0
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed Jul 1 17:36:51 2020 +0100

    util: add access check for hooks to fix running as non-root
    
    Since feb83c1e710b9ea8044a89346f4868d03b31b0f1 libvirtd will abort on
    startup if run as non-root
    
      2020-07-01 16:30:30.738+0000: 1647444: error : virDirOpenInternal:2869 : cannot open directory '/etc/libvirt/hooks/daemon.d': Permission denied
    
    The root cause flaw is that non-root libvirtd is using /etc/libvirt for
    its hooks. Traditionally that has been harmless though since we checked
    whether we could access the hook file and degraded gracefully. We need
    the same access check for iterating over the hook directory.
    
    Long term we should make it possible to have an unprivileged hook dir
    under $HOME.
    
    Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit c3fa17cd9a158f38416a80af3e0f712bf96ebf38
Author: Michal Privoznik <mprivozn@redhat.com>
Date:   Wed Jul 1 09:47:48 2020 +0200

    virnettlshelpers: Update private key
    
    With the recent update of Fedora rawhide I've noticed
    virnettlssessiontest and virnettlscontexttest failing with:
    
      Our own certificate servercertreq-ctx.pem failed validation
      against cacertreq-ctx.pem: The certificate uses an insecure
      algorithm
    
    This is result of Fedora changes to support strong crypto [1]. RSA
    with 1024 bit key is viewed as legacy and thus insecure. Generate
    a new private key then. Moreover, switch to EC which is not only
    shorter but also not deprecated that often as RSA. Generated
    using the following command:
    
      openssl genpkey --outform PEM --out privkey.pem \$
      --algorithm EC --pkeyopt ec_paramgen_curve:P-384 \$
      --pkeyopt ec_param_enc:named_curve
    
    1: https://fedoraproject.org/wiki/Changes/StrongCryptoSettings2
    
    Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

commit d57f361083c5053267e6d9380c1afe2abfcae8ac
Author: Daniel Henrique Barboza <danielhb413@gmail.com>
Date:   Tue Jun 30 16:43:43 2020 -0300

    docs: Fix 'Offline migration' description
    
    'transfers inactive the definition of a domain' seems odd.
    
    Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
    Reviewed-by: Andrea Bolognani <abologna@redhat.com>

