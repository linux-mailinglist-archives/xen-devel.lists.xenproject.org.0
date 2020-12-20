Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6AB2DF4F8
	for <lists+xen-devel@lfdr.de>; Sun, 20 Dec 2020 11:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57107.99907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqvbI-00074b-1H; Sun, 20 Dec 2020 10:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57107.99907; Sun, 20 Dec 2020 10:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqvbH-000748-Ts; Sun, 20 Dec 2020 10:06:03 +0000
Received: by outflank-mailman (input) for mailman id 57107;
 Sun, 20 Dec 2020 10:06:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqvbG-000740-Cv; Sun, 20 Dec 2020 10:06:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqvbG-0003Np-5d; Sun, 20 Dec 2020 10:06:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqvbF-0004Fk-Ol; Sun, 20 Dec 2020 10:06:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kqvbF-0001bM-OH; Sun, 20 Dec 2020 10:06:01 +0000
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
	bh=kHdqVEvDA9Vr7Os6rGjW2550EUHzPVhHIZkoCBYfBnk=; b=oHSbdEBqO7B0Vn0AApfWqn7kLs
	D5NWo61Hc7T+xElRTSc68gdzDd6j6Hp3mhhvC6qu3DmI56hhWRr4KnxfJjydvax2cF9B6P26tRi5j
	upBwj5UrUcpaCmcrOMx3DrXhb4fDDyq90T5l2azEkOryeVXDPXE4VwvfFw78OEwKPW+U=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157738-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157738: all pass - PUSHED
X-Osstest-Versions-This:
    xen=357db96a66e47e609c3b14768f1062e13eedbd93
X-Osstest-Versions-That:
    xen=904148ecb4a59d4c8375d8e8d38117b8605e10ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Dec 2020 10:06:01 +0000

flight 157738 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157738/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  357db96a66e47e609c3b14768f1062e13eedbd93
baseline version:
 xen                  904148ecb4a59d4c8375d8e8d38117b8605e10ac

Last test of basis   157602  2020-12-16 09:18:30 Z    4 days
Testing same since   157738  2020-12-20 09:20:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <pdurrant@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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
   904148ecb4..357db96a66  357db96a66e47e609c3b14768f1062e13eedbd93 -> coverity-tested/smoke

