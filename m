Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6064D95C3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 08:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290662.493041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU23D-0000Ee-Lt; Tue, 15 Mar 2022 07:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290662.493041; Tue, 15 Mar 2022 07:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU23D-0000CZ-Io; Tue, 15 Mar 2022 07:57:03 +0000
Received: by outflank-mailman (input) for mailman id 290662;
 Tue, 15 Mar 2022 07:57:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nU23C-0000CP-KJ; Tue, 15 Mar 2022 07:57:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nU23C-00062r-H2; Tue, 15 Mar 2022 07:57:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nU23C-0000YO-68; Tue, 15 Mar 2022 07:57:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nU23C-0008FT-5e; Tue, 15 Mar 2022 07:57:02 +0000
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
	bh=Qu9OKtcihT6gDitNuiiKuwYfWm9sOqGClirSicR6mbo=; b=NqiTywVOVYxtPqDjP+TfUv0NYe
	GIp/vxNRNpmlrP8XcarD9spVeJJ7zJ7bF/Eokqf2qoq93RNvhDN6EDkP5C+MPPbL/xfjhuvh5tICR
	fCRHhvgev9cbN8VZzk7MGm64QdaABdwinGAhSVHfxHuTQHeeYHD5JxY9iD66nTngVZl8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168607-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 168607: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=07aebcd55fd2f7997e9fe50a6c849c8a12ec2e68
X-Osstest-Versions-That:
    xen=dedb0aa42c6d1ee31805dfc61630db2c41117330
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Mar 2022 07:57:02 +0000

flight 168607 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168607/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  07aebcd55fd2f7997e9fe50a6c849c8a12ec2e68
baseline version:
 xen                  dedb0aa42c6d1ee31805dfc61630db2c41117330

Last test of basis   168580  2022-03-14 10:01:40 Z    0 days
Failing since        168589  2022-03-14 19:00:27 Z    0 days    3 attempts
Testing same since   168607  2022-03-15 03:02:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
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
   dedb0aa42c..07aebcd55f  07aebcd55fd2f7997e9fe50a6c849c8a12ec2e68 -> smoke

