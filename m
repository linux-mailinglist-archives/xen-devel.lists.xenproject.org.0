Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7FE29670B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 00:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10653.28427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kViwF-0007RO-S3; Thu, 22 Oct 2020 22:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10653.28427; Thu, 22 Oct 2020 22:20:03 +0000
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
	id 1kViwF-0007Qz-OV; Thu, 22 Oct 2020 22:20:03 +0000
Received: by outflank-mailman (input) for mailman id 10653;
 Thu, 22 Oct 2020 22:20:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kViwD-0007Cn-KY
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 22:20:01 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f4efc31-ef90-4e2c-ba00-790d42fdab8a;
 Thu, 22 Oct 2020 22:19:53 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kViw5-000447-0k; Thu, 22 Oct 2020 22:19:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kViw4-00023v-NU; Thu, 22 Oct 2020 22:19:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kViw4-0005LV-Mw; Thu, 22 Oct 2020 22:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kViwD-0007Cn-KY
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 22:20:01 +0000
X-Inumbo-ID: 4f4efc31-ef90-4e2c-ba00-790d42fdab8a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4f4efc31-ef90-4e2c-ba00-790d42fdab8a;
	Thu, 22 Oct 2020 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=mRJ5no7t8344JIo3JvCWfylGgDoQhwMO69tXyneu2T0=; b=NZxOC8LQFPgUZmBzN+NAK6elAS
	e0Y4K7aCTAEKSMlfOkduvgJCNKIGFL53GmCHbeLsChRasgI6NghpwRP4mTVz1cuhr/YwARCSCRJ/Z
	CHwHTryht4+gIl+Rukg3WrOvky4fFPXZXrRn4IcsRofmcMgpHvrxoeDjJJAHa7ODHBYA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kViw5-000447-0k; Thu, 22 Oct 2020 22:19:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kViw4-00023v-NU; Thu, 22 Oct 2020 22:19:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kViw4-0005LV-Mw; Thu, 22 Oct 2020 22:19:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156108-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156108: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=861f0c110976fa8879b7bf63d9478b6be83d4ab6
X-Osstest-Versions-That:
    xen=3b49791e4cc2f38dd84bf331b75217adaef636e3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Oct 2020 22:19:52 +0000

flight 156108 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156108/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  861f0c110976fa8879b7bf63d9478b6be83d4ab6
baseline version:
 xen                  3b49791e4cc2f38dd84bf331b75217adaef636e3

Last test of basis   156047  2020-10-20 21:00:31 Z    2 days
Testing same since   156108  2020-10-22 19:02:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Elliott Mitchell <ehem+xen@m5p.com>
  Julien Grall <jgrall@amazon.com>

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
   3b49791e4c..861f0c1109  861f0c110976fa8879b7bf63d9478b6be83d4ab6 -> smoke

