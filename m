Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40329F90E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 00:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15326.38266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYHGs-00035c-R1; Thu, 29 Oct 2020 23:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15326.38266; Thu, 29 Oct 2020 23:23:54 +0000
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
	id 1kYHGs-00035D-Nt; Thu, 29 Oct 2020 23:23:54 +0000
Received: by outflank-mailman (input) for mailman id 15326;
 Thu, 29 Oct 2020 23:23:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9Pg=EE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kYHGr-000358-Gp
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 23:23:53 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6579e11-f112-4c13-99db-9d901749ad73;
 Thu, 29 Oct 2020 23:23:52 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYHGp-0002Nk-QP; Thu, 29 Oct 2020 23:23:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYHGp-0002Fu-Hw; Thu, 29 Oct 2020 23:23:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kYHGp-0007LJ-HP; Thu, 29 Oct 2020 23:23:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m9Pg=EE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kYHGr-000358-Gp
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 23:23:53 +0000
X-Inumbo-ID: c6579e11-f112-4c13-99db-9d901749ad73
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c6579e11-f112-4c13-99db-9d901749ad73;
	Thu, 29 Oct 2020 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=3hpYVFaL/uBAiN1sPhin0tPao7xldNcifXXjUSCKBSw=; b=IdfS0bDfwwA3SqYscYqMiX0VvS
	YLqcsZ5kne8jvNtl9CnIUudLKB7VEUJfT/piqmOhJolc/T03u77c/fj44sx/xaltH+kHlHBTACzEx
	i8mx6bbCV3GBw8LLNQMJzCVXOMbazmLRp4h5YetLXQL5xIFlR2jxNPO7qKBba9jqjMDs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYHGp-0002Nk-QP; Thu, 29 Oct 2020 23:23:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYHGp-0002Fu-Hw; Thu, 29 Oct 2020 23:23:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYHGp-0007LJ-HP; Thu, 29 Oct 2020 23:23:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156304-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156304: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=26a8fa494f2f323622b6928bd15921b41818f180
X-Osstest-Versions-That:
    xen=1fd1d4bafdf6f9f8fe5ca9b947f016a7aae92a74
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Oct 2020 23:23:51 +0000

flight 156304 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156304/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  26a8fa494f2f323622b6928bd15921b41818f180
baseline version:
 xen                  1fd1d4bafdf6f9f8fe5ca9b947f016a7aae92a74

Last test of basis   156297  2020-10-29 14:01:23 Z    0 days
Testing same since   156304  2020-10-29 20:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
   1fd1d4bafd..26a8fa494f  26a8fa494f2f323622b6928bd15921b41818f180 -> smoke

