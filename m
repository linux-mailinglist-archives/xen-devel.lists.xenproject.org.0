Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB49212671
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 16:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr0MM-0002Lo-P0; Thu, 02 Jul 2020 14:38:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CtVa=AN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jr0ML-0002LO-4B
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 14:38:41 +0000
X-Inumbo-ID: b4dec546-bc71-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4dec546-bc71-11ea-b7bb-bc764e2007e4;
 Thu, 02 Jul 2020 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYysRHyAwfsQQI78BNdSSq7J8mQ+itkWnO7ZPFc2Nv4=; b=2KXbG2h0XmWGoXRDioizc4t+L
 q+wsBbwWvOeyVLuh4czVB/xnEXKHYbT9Yx/uN7429SSkX+HjpmHrvUT0692AQfzKQSgPpfauKWOpb
 zuPyukZbzZCTrM9FqnhyrR3jHnt9e9dRinpOmhqzhbqy1XTfFLq4Sa5CMZTRY+acbVgBo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jr0MD-0003OC-HR; Thu, 02 Jul 2020 14:38:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jr0MD-0005SF-4b; Thu, 02 Jul 2020 14:38:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jr0MD-0003Kq-3z; Thu, 02 Jul 2020 14:38:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151527-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 151527: regressions - FAIL
X-Osstest-Failures: libvirt:test-amd64-amd64-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
 libvirt:test-amd64-i386-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
 libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
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
X-Osstest-Versions-This: libvirt=7fa7f7eeb6e969e002845928e155914da2fc8cd0
X-Osstest-Versions-That: libvirt=e7998ebeaf15e4e8825be0dd97aa1316f194f00d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Jul 2020 14:38:33 +0000
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

flight 151527 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151527/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair 22 guest-migrate/src_host/dst_host fail REGR. vs. 151496
 test-amd64-i386-libvirt-pair 22 guest-migrate/src_host/dst_host fail REGR. vs. 151496

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151496
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151496
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
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
 libvirt              7fa7f7eeb6e969e002845928e155914da2fc8cd0
baseline version:
 libvirt              e7998ebeaf15e4e8825be0dd97aa1316f194f00d

Last test of basis   151496  2020-07-01 04:23:43 Z    1 days
Testing same since   151527  2020-07-02 04:29:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>

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

