Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A58288204
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 08:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4692.12411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQlgd-0005a5-Ed; Fri, 09 Oct 2020 06:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4692.12411; Fri, 09 Oct 2020 06:15:27 +0000
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
	id 1kQlgd-0005Zg-B2; Fri, 09 Oct 2020 06:15:27 +0000
Received: by outflank-mailman (input) for mailman id 4692;
 Fri, 09 Oct 2020 06:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNj9=DQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQlgb-0005ZD-Gj
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 06:15:25 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2dbfc26-4891-440a-b1d5-a88261b7ac3f;
 Fri, 09 Oct 2020 06:15:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQlgU-0003J3-Sc; Fri, 09 Oct 2020 06:15:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQlgU-0001bo-Ki; Fri, 09 Oct 2020 06:15:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQlgU-0008Or-KI; Fri, 09 Oct 2020 06:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VNj9=DQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQlgb-0005ZD-Gj
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 06:15:25 +0000
X-Inumbo-ID: d2dbfc26-4891-440a-b1d5-a88261b7ac3f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d2dbfc26-4891-440a-b1d5-a88261b7ac3f;
	Fri, 09 Oct 2020 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=0urk0LNanaARlS2RMas+KYpkMNRYxByzjr/AzQ+GSNQ=; b=zP4Hd05ZQTFF8Sg48ki5la2aW+
	PRZQCYIWKz+iQvRAnO5Ce1E4Dw3sluV9O3YyOWW3FNCKBnmtr0HfTj8R6LWv42JxJK5ajjra/7U3k
	FeSjmwgrKQKN6hA0OwxpNI7rSTmqBiDaAH9QjPcO6HT+dtnXFm4R+VvaQZYTauBPaPfI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQlgU-0003J3-Sc; Fri, 09 Oct 2020 06:15:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQlgU-0001bo-Ki; Fri, 09 Oct 2020 06:15:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQlgU-0008Or-KI; Fri, 09 Oct 2020 06:15:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155584-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155584: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
X-Osstest-Versions-That:
    xen=0241809bf838875615797f52af34222e5ab8e98f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Oct 2020 06:15:18 +0000

flight 155584 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155584/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
baseline version:
 xen                  0241809bf838875615797f52af34222e5ab8e98f

Last test of basis   155547  2020-10-08 13:01:25 Z    0 days
Testing same since   155584  2020-10-09 02:01:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Roman Shaposhnik <roman@zededa.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   0241809bf8..25849c8b16  25849c8b16f2a5b7fcd0a823e80a5f1b590291f9 -> smoke

