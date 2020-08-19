Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE82499D6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 12:05:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8KxS-0007hO-Ic; Wed, 19 Aug 2020 10:04:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1c0J=B5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k8KxQ-0007h4-ND
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 10:04:36 +0000
X-Inumbo-ID: 52f9e1d0-4c86-4e64-963f-9d35821bd732
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52f9e1d0-4c86-4e64-963f-9d35821bd732;
 Wed, 19 Aug 2020 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=g2I1/oELVILprT2LZiWVoJdxN8uPYos/t3O+b/VXVEo=; b=QTRShhfpYpJ2b3MgL/WUK4Spnb
 JbHYbEZq0tmRPdzmmbYzZBZW9vsmPHbZWB/kyHb3stcLH37I0ufTkviGelzmHrtAfVrv57VkxtJ6b
 PLfLYY6QjZKJflt6WItdKOBiZMjCkWEZxb1Ft90a+e8Fo2XiPC/pH0/0VMo3VyHDxx+8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k8KxJ-0004j0-Gn; Wed, 19 Aug 2020 10:04:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k8KxJ-00025e-85; Wed, 19 Aug 2020 10:04:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1k8KxJ-0007Ce-67; Wed, 19 Aug 2020 10:04:29 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152618-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152618: all pass - PUSHED
X-Osstest-Versions-This: xen=391a8b6d20b72c4f24f8511f78ef75a6119cbe22
X-Osstest-Versions-That: xen=7a4dd361d10718608ad37f969df0a3cf5bc17b12
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Aug 2020 10:04:29 +0000
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

flight 152618 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152618/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  391a8b6d20b72c4f24f8511f78ef75a6119cbe22
baseline version:
 xen                  7a4dd361d10718608ad37f969df0a3cf5bc17b12

Last test of basis   152570  2020-08-12 09:22:20 Z    7 days
Testing same since   152618  2020-08-19 09:19:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Paul Durrant <pdurrant@amazon.com>
  Trammell hudson <hudson@trmm.net>
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
   7a4dd361d1..391a8b6d20  391a8b6d20b72c4f24f8511f78ef75a6119cbe22 -> coverity-tested/smoke

