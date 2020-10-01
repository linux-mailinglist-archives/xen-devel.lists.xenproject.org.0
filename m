Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE52027F84D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 06:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017.3427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNpoj-0002Ug-0w; Thu, 01 Oct 2020 04:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017.3427; Thu, 01 Oct 2020 04:03:40 +0000
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
	id 1kNpoi-0002U6-Sq; Thu, 01 Oct 2020 04:03:40 +0000
Received: by outflank-mailman (input) for mailman id 1017;
 Thu, 01 Oct 2020 04:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNpoh-0002Sx-8o
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 04:03:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ccbd59-7826-4c2c-9f2a-00abb79e6caa;
 Thu, 01 Oct 2020 04:03:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNpof-0002Er-PZ; Thu, 01 Oct 2020 04:03:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNpof-0007Yh-Hr; Thu, 01 Oct 2020 04:03:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNpof-00007U-HO; Thu, 01 Oct 2020 04:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNpoh-0002Sx-8o
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 04:03:39 +0000
X-Inumbo-ID: b0ccbd59-7826-4c2c-9f2a-00abb79e6caa
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b0ccbd59-7826-4c2c-9f2a-00abb79e6caa;
	Thu, 01 Oct 2020 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=t/0V5NkaH9qy6UzW6mT9WIyeQppEYzq2x4cUZ9cGK7k=; b=Z31c4OmVP9uEqUVNrIGqewGSPn
	MDhTDEd7ZCsHDXAG4QT7EWBy2dpP7CI/LzDCmdefvtGvHQvVnC8W+ZmbZ9eAxiWVL6o6TdotpJPIA
	HX47nk4VxRELq0MtdoCIZ9UcjxNrTupUpktXzLZtceI/Vtak88er1c15Swr/Bqxfg3T8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNpof-0002Er-PZ; Thu, 01 Oct 2020 04:03:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNpof-0007Yh-Hr; Thu, 01 Oct 2020 04:03:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNpof-00007U-HO; Thu, 01 Oct 2020 04:03:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155121-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155121: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d8ab884fe9b4dd148980bf0d8673187f8fb25887
X-Osstest-Versions-That:
    ovmf=2793a49565488e419d10ba029c838f4b7efdba38
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Oct 2020 04:03:37 +0000

flight 155121 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155121/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d8ab884fe9b4dd148980bf0d8673187f8fb25887
baseline version:
 ovmf                 2793a49565488e419d10ba029c838f4b7efdba38

Last test of basis   155045  2020-09-28 21:39:39 Z    2 days
Testing same since   155121  2020-09-30 03:52:34 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Jian J Wang <jian.j.wang@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Nikita <sh1r4s3@mail.si-head.nl>
  Nikita Ermakov <sh1r4s3@mail.si-head.nl>
  Patrick Henz <patrick.henz@hpe.com>
  Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>
  Wang, Jian J <jian.j.wang@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   2793a49565..d8ab884fe9  d8ab884fe9b4dd148980bf0d8673187f8fb25887 -> xen-tested-master

