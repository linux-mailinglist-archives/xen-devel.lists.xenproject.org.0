Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C026A561
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 14:42:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIAH8-0004pQ-Hq; Tue, 15 Sep 2020 12:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2Gj=CY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kIAH7-0004pL-Dt
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 12:41:33 +0000
X-Inumbo-ID: aeeb3804-0263-4e5f-9355-8b60d4e63419
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aeeb3804-0263-4e5f-9355-8b60d4e63419;
 Tue, 15 Sep 2020 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=i74WJp/hZ6uJAnxLrZ8K0s9W5GHRcJWx1giEmSf/x7k=; b=41QfK0OfMSdwSjlq/dj3fJ0xyM
 F53tT3MXZ0nd9h7g1in/3uE2NVllFT2hf1Nfx/A8xseA5Zajlmd6el6JIpnm8M8vyWcRF92TglsQY
 GyyA2gTuBanypKd7POyAspQYR5qSNSAjpiFKY0upuDtAArIo0aSI6vfK7h+IMVy6ckX4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIAH5-0001tE-R5; Tue, 15 Sep 2020 12:41:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIAH5-0005mA-K9; Tue, 15 Sep 2020 12:41:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kIAH5-0006ga-Je; Tue, 15 Sep 2020 12:41:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154357-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 154357: tolerable all pass - PUSHED
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=39ab598c50a2b539f376adc363d684c2df6c8dd7
X-Osstest-Versions-That: xen=fc4e79c3f77f4360064f3614e32557a105458bae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Sep 2020 12:41:31 +0000
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

flight 154357 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154357/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  39ab598c50a2b539f376adc363d684c2df6c8dd7
baseline version:
 xen                  fc4e79c3f77f4360064f3614e32557a105458bae

Last test of basis   154341  2020-09-14 16:00:26 Z    0 days
Testing same since   154357  2020-09-15 09:01:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Don Slutz <don.slutz@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   fc4e79c3f7..39ab598c50  39ab598c50a2b539f376adc363d684c2df6c8dd7 -> smoke

