Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674A569E8FE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 21:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499171.770212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUZE3-0001yr-G9; Tue, 21 Feb 2023 20:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499171.770212; Tue, 21 Feb 2023 20:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUZE3-0001wq-Co; Tue, 21 Feb 2023 20:26:59 +0000
Received: by outflank-mailman (input) for mailman id 499171;
 Tue, 21 Feb 2023 20:26:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pUZE2-0001wg-9W; Tue, 21 Feb 2023 20:26:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pUZE2-0003jX-3S; Tue, 21 Feb 2023 20:26:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pUZE1-0005gv-NA; Tue, 21 Feb 2023 20:26:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pUZE1-0003qC-Mj; Tue, 21 Feb 2023 20:26:57 +0000
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
	bh=knI8V3Vr5+zFguCdIQS9Ky5Qm/z+GDf1SPl6Rhf30Eg=; b=zhHCbfV6aoqkTH4U2CrzKa2K16
	xvhV5jKlYISequPbyJVgOSu4RdgnK7zathY/7o/AkSn5GIHGyHCeQs40V50Gh/MU/3ZLHO3jv42ep
	GvvuZRu5RmvJtk7EATCAeKjOvhlkBqHq01JZB4Vmi3XF4EYBo3wBYT6Qu/180TXA2SiQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178044-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 178044: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=c76e4ff7d531ee2bf37c9d4037c8645f9e586fcd
X-Osstest-Versions-That:
    xen=d58f3941ce3f8943df842fab2d4d761c483af6c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Feb 2023 20:26:57 +0000

flight 178044 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178044/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  c76e4ff7d531ee2bf37c9d4037c8645f9e586fcd
baseline version:
 xen                  d58f3941ce3f8943df842fab2d4d761c483af6c4

Last test of basis   178030  2023-02-21 15:00:25 Z    0 days
Testing same since   178044  2023-02-21 18:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
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
   d58f3941ce..c76e4ff7d5  c76e4ff7d531ee2bf37c9d4037c8645f9e586fcd -> smoke

