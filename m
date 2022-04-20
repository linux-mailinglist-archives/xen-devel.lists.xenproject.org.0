Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4715087E6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 14:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309208.525241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9EB-0006eA-4r; Wed, 20 Apr 2022 12:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309208.525241; Wed, 20 Apr 2022 12:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9EB-0006bG-1n; Wed, 20 Apr 2022 12:14:35 +0000
Received: by outflank-mailman (input) for mailman id 309208;
 Wed, 20 Apr 2022 12:14:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nh9E8-0006b6-WE; Wed, 20 Apr 2022 12:14:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nh9E8-00073e-SA; Wed, 20 Apr 2022 12:14:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nh9E8-0007DA-F1; Wed, 20 Apr 2022 12:14:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nh9E8-00085A-EY; Wed, 20 Apr 2022 12:14:32 +0000
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
	bh=G7khnqOOxbdf9chSRMdw/1qdyVrEaRR5cdmpL+y4hxw=; b=h4DuwZZ3jsOk/eWpr53kY5nqSw
	Iz8Onrn+dmEeD1JbKE1zYw8vRiU9n76ANCzQ4W4TRFU6XZhUxirqf73TTbPtNE8zVamZSvII7Ca1O
	gJ0EK6mlFMbBEGWvp0yXSnJcQUp0fY9/m9ytPFiwF49z4XzxhUCVjDuUk6sVkpU23J58=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169566-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169566: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=78e072bc375043e81691a59454e09f0b38241ddd
X-Osstest-Versions-That:
    xen=e9935146cd695188e70c10a6dda9f24ef9b63e30
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Apr 2022 12:14:32 +0000

flight 169566 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169566/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  78e072bc375043e81691a59454e09f0b38241ddd
baseline version:
 xen                  e9935146cd695188e70c10a6dda9f24ef9b63e30

Last test of basis   169552  2022-04-20 01:01:44 Z    0 days
Testing same since   169566  2022-04-20 09:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Vrabel <dvrabel@amazon.co.uk>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>

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
   e9935146cd..78e072bc37  78e072bc375043e81691a59454e09f0b38241ddd -> smoke

