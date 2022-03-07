Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5D14CFF3F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 13:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286001.485315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCtZ-00023o-TS; Mon, 07 Mar 2022 12:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286001.485315; Mon, 07 Mar 2022 12:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCtZ-00021V-QR; Mon, 07 Mar 2022 12:55:25 +0000
Received: by outflank-mailman (input) for mailman id 286001;
 Mon, 07 Mar 2022 12:55:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nRCtX-00021D-Th; Mon, 07 Mar 2022 12:55:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nRCtX-0004Iq-RX; Mon, 07 Mar 2022 12:55:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nRCtX-0002Bx-GY; Mon, 07 Mar 2022 12:55:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nRCtX-00054i-G4; Mon, 07 Mar 2022 12:55:23 +0000
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
	bh=t9Gm7sIXKgpiXVXtBWB6DpC1qMhcMT7nNfH8KYnhBCU=; b=uXMDRH328xIdFtTH1J4SSTazGL
	MZa9GNehj8zudlomVEy4B/TTtJlVKG5BcxZh/nyigv3XNQxJPdEiooU0yowjydXHqms8EP+ySmHfe
	src/3ffjuu5lNYE7tOm3ILanCsQI1PPoL4nx2YEFXU/zSCzUBYzig2F5uVe0ZhK1OKHE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168454-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 168454: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4cb8d7a06752b368a365e30117f535a2fdad3963
X-Osstest-Versions-That:
    xen=1145d94c738ea13e0d2ceedb97a4cfe46292b08e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Mar 2022 12:55:23 +0000

flight 168454 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168454/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  4cb8d7a06752b368a365e30117f535a2fdad3963
baseline version:
 xen                  1145d94c738ea13e0d2ceedb97a4cfe46292b08e

Last test of basis   168399  2022-03-04 14:03:05 Z    2 days
Testing same since   168454  2022-03-07 09:01:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Morton <akpm@linux-foundation.org>
  Daniel Walker <danielwa@cisco.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Jan Beulich <jbeulich@suse.com>
  Jiri Kosina <jkosina@suse.cz>
  Lasse Collin <lasse.collin@tukaani.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Zhen Lei <thunder.leizhen@huawei.com>

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
   1145d94c73..4cb8d7a067  4cb8d7a06752b368a365e30117f535a2fdad3963 -> smoke

