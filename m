Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130265159A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 23:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466363.725243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Oj4-0005Qx-Nr; Mon, 19 Dec 2022 22:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466363.725243; Mon, 19 Dec 2022 22:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Oj4-0005Od-Kl; Mon, 19 Dec 2022 22:35:14 +0000
Received: by outflank-mailman (input) for mailman id 466363;
 Mon, 19 Dec 2022 22:35:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7Oj3-0005OT-Ky; Mon, 19 Dec 2022 22:35:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7Oj3-0004pa-I9; Mon, 19 Dec 2022 22:35:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7Oj3-0002qE-6l; Mon, 19 Dec 2022 22:35:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7Oj3-0004OL-6F; Mon, 19 Dec 2022 22:35:13 +0000
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
	bh=6S+9P3WuIgAL9uQR0LKWY6k1LcCkiHkW9oBLECeS/IE=; b=B3Y7EBv/2wYd0ZlW4SjgNvbkn3
	F/4oA426OMkqD9vvhF/FPymG8QaU3YHhx0nxdA7mnY+QYGcCvlKdL3a06C0E7I2WJZnd2nPnznTU8
	rfnyVmnL52QtyBuW78T+HvLoiSf1yxh/G8UoCulWbJabvL2qm3Rz86yIm1T0gh8D526s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175413-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175413: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:<job status>:broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:host-install(5):broken:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=01f139215e678c2dc7d4bb3f9f2777069bb1b091
X-Osstest-Versions-That:
    xen=5f05b229319e25aa7f35735bba060ddbeb325872
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Dec 2022 22:35:13 +0000

flight 175413 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175413/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt      5 host-install(5)        broken REGR. vs. 175409

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  01f139215e678c2dc7d4bb3f9f2777069bb1b091
baseline version:
 xen                  5f05b229319e25aa7f35735bba060ddbeb325872

Last test of basis   175409  2022-12-19 16:01:59 Z    0 days
Testing same since   175413  2022-12-19 20:02:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Edwin Török <edwin.torok@cloud.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     broken  


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

broken-job test-amd64-amd64-libvirt broken
broken-step test-amd64-amd64-libvirt host-install(5)

Not pushing.

------------------------------------------------------------
commit 01f139215e678c2dc7d4bb3f9f2777069bb1b091
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:20 2022 +0000

    tools/ocaml/xb: Drop Xs_ring.write
    
    This function is unusued (only Xs_ring.write_substring is used), and the
    bytes/string conversion here is backwards: the C stub implements the bytes
    version and then we use a Bytes.unsafe_of_string to convert a string into
    bytes.
    
    However the operation here really is read-only: we read from the string and
    write it to the ring, so the C stub should implement the read-only string
    version, and if needed we could use Bytes.unsafe_to_string to be able to send
    'bytes'. However that is not necessary as the 'bytes' version is dropped above.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 2e173b8383928e8d98d67ce57ec069eb612def60
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:16 2022 +0000

    tools/ocaml/xenctrl: Fix unused value warning
    
    Fixes: 8b3c06a3e5 ("tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free")
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4a259353238d308a41541370ea7cc222a879ddd3
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:11 2022 +0000

    tools/ocaml/xenstored: Use ocamldep -sort for linking order
    
    The manually established link order is fragile to code changes.  Use ocamldep
    to calculate the appropriate link order.
    
    No functional change.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit d2ccc637111d6dbcf808aaffeec7a46f0b1e1c81
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Fri Dec 16 18:25:10 2022 +0000

    tools/ocaml/xb,mmap: Use Data_abstract_val wrapper
    
    This is not strictly necessary since it is essentially a no-op currently: a
    cast to void * and value *, even in OCaml 5.0.
    
    However it does make it clearer that what we have here is not a regular OCaml
    value, but one allocated with Abstract_tag or Custom_tag, and follows the
    example from the manual more closely:
    https://v2.ocaml.org/manual/intfc.html#ss:c-outside-head
    
    It also makes it clearer that these modules have been reviewed for
    compat with OCaml 5.0.
    
    We cannot use OCaml finalizers here, because we want exact control over when
    to unmap these pages from remote domains.
    
    No functional change.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
(qemu changes not included)

