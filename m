Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8596A8743
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 17:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505273.777946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXm4s-0006UQ-No; Thu, 02 Mar 2023 16:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505273.777946; Thu, 02 Mar 2023 16:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXm4s-0006Rn-K8; Thu, 02 Mar 2023 16:46:46 +0000
Received: by outflank-mailman (input) for mailman id 505273;
 Thu, 02 Mar 2023 16:46:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXm4q-0006Rd-RX; Thu, 02 Mar 2023 16:46:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXm4q-0006rj-OY; Thu, 02 Mar 2023 16:46:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXm4q-0008DS-E4; Thu, 02 Mar 2023 16:46:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pXm4q-0000M6-DX; Thu, 02 Mar 2023 16:46:44 +0000
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
	bh=N3Dh6cVPVX145KJpJ6KUT10B8SejSP5VeWahBvrw8T4=; b=xOl7408woZYMN7lA/mM8w0dlM4
	FXOu4PAbEPBQCnQgUBIcE1o8yOAfQdaQ6PKuJqExD3tEzQnT6uAjxGwpWMjRIgTgHT3/T6IHK/ad2
	bEZXULAP7ZrcRbuW4I3KiRWkItggwT4cPy4Ii+WTbCGeb08Mq0zbQHVWC1djBMWpdh9w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178990-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 178990: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=380a8c0c65bfb84dab54ab4641cca1387cc41edb
X-Osstest-Versions-That:
    xen=b84fdf521b306cce64388fe57ee6c7c00f9d3e76
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Mar 2023 16:46:44 +0000

flight 178990 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178990/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  380a8c0c65bfb84dab54ab4641cca1387cc41edb
baseline version:
 xen                  b84fdf521b306cce64388fe57ee6c7c00f9d3e76

Last test of basis   178802  2023-02-28 20:01:47 Z    1 days
Testing same since   178990  2023-03-02 15:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
   b84fdf521b..380a8c0c65  380a8c0c65bfb84dab54ab4641cca1387cc41edb -> smoke

