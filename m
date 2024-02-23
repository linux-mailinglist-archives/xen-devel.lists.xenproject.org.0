Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586486201F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 23:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684967.1065280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeTU-0002pg-K2; Fri, 23 Feb 2024 22:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684967.1065280; Fri, 23 Feb 2024 22:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeTU-0002n4-Gc; Fri, 23 Feb 2024 22:57:00 +0000
Received: by outflank-mailman (input) for mailman id 684967;
 Fri, 23 Feb 2024 22:56:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdeTS-0002m9-Nz; Fri, 23 Feb 2024 22:56:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdeTS-00068Q-MC; Fri, 23 Feb 2024 22:56:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdeTS-0008Rk-C9; Fri, 23 Feb 2024 22:56:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rdeTS-0004YO-Bl; Fri, 23 Feb 2024 22:56:58 +0000
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
	bh=IktdaiOBHhc26/mQrXqv1NOE3cu7yoFbVy7R26MpJcM=; b=C30ihgACwD5fGut3duHcI0Lo0L
	DPMr5BzhZyYvxDYhFOXlkUJnHX4ZgiqV+AeQeMrALdsLwCAmNYkkX8ieuldNpxQxvQFfbEAL6l+Km
	pjOg7M7NdAr8762uW9yg/Hm00E8cuzegZfSzbfTCT7tqhpNpDQhAFw81oSo0y65FuPOU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184739-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184739: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f5e1c527d0a0d09ca0cb1dcd8d4ab4a1a5261e91
X-Osstest-Versions-That:
    xen=812bdc99f4c5d05d20b6fac03b90920c0dbf9a2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Feb 2024 22:56:58 +0000

flight 184739 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184739/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f5e1c527d0a0d09ca0cb1dcd8d4ab4a1a5261e91
baseline version:
 xen                  812bdc99f4c5d05d20b6fac03b90920c0dbf9a2b

Last test of basis   184730  2024-02-22 17:02:09 Z    1 days
Testing same since   184739  2024-02-23 18:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@cloud.com>
  Edwin Török <edwin.torok@cloud.com>
  George Dunlap <george.dunlap@cloud.com> # Golang bits
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Petr Beneš <w1benny@gmail.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   812bdc99f4..f5e1c527d0  f5e1c527d0a0d09ca0cb1dcd8d4ab4a1a5261e91 -> smoke

