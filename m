Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8B5F097F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414132.658248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDqx-0002a2-LZ; Fri, 30 Sep 2022 11:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414132.658248; Fri, 30 Sep 2022 11:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDqx-0002XP-I3; Fri, 30 Sep 2022 11:06:47 +0000
Received: by outflank-mailman (input) for mailman id 414132;
 Fri, 30 Sep 2022 11:06:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeDqw-0002XF-GL; Fri, 30 Sep 2022 11:06:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeDqw-0007Jx-CK; Fri, 30 Sep 2022 11:06:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeDqw-00058A-0D; Fri, 30 Sep 2022 11:06:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeDqv-0006tB-W0; Fri, 30 Sep 2022 11:06:45 +0000
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
	bh=LsmFiGXrInE/IxJGjJIaJPIX6pXEgVfbbJm22TpXlEU=; b=GdNoJ6VsC1duHv8Hqys3FQvzGo
	lajjvJUzB4+tkaevOkiZABbVkAJy+dCCO91A9hPXH32Yq+zTBx2O0PAX11+S7ofNB/Ynf9GoKhXTW
	TyTZBHXs+NBqyTxJe/7LslFtbKABylJHqnDehvRA6jI4kEklenEwxzTaeOGfIet2wy7A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173384-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173384: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=38e1276db4c5457cd6e7811b4e168aa85c8a0b06
X-Osstest-Versions-That:
    xen=211d8419ef8d8a237ff914fd8304b8fefc3ff2cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Sep 2022 11:06:45 +0000

flight 173384 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173384/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail like 173342
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  38e1276db4c5457cd6e7811b4e168aa85c8a0b06
baseline version:
 xen                  211d8419ef8d8a237ff914fd8304b8fefc3ff2cc

Last test of basis   173347  2022-09-28 05:07:54 Z    2 days
Failing since        173362  2022-09-29 13:03:03 Z    0 days    7 attempts
Testing same since   173384  2022-09-30 08:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Dmytro Semenets <dmytro_semenets@epam.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Nathan Studer <nathan.studer@dornerworks.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
   211d8419ef..38e1276db4  38e1276db4c5457cd6e7811b4e168aa85c8a0b06 -> smoke

