Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5CB997242
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814993.1228708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZs7-0003aB-D4; Wed, 09 Oct 2024 16:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814993.1228708; Wed, 09 Oct 2024 16:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZs7-0003XA-9g; Wed, 09 Oct 2024 16:49:11 +0000
Received: by outflank-mailman (input) for mailman id 814993;
 Wed, 09 Oct 2024 16:49:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syZs5-0003Ww-Ro; Wed, 09 Oct 2024 16:49:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syZs5-0005ty-PN; Wed, 09 Oct 2024 16:49:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syZs5-0006tY-F5; Wed, 09 Oct 2024 16:49:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syZs5-0003bd-ET; Wed, 09 Oct 2024 16:49:09 +0000
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
	bh=YsbYNyYpWH6c1JwVNXWcKrQrKtlflJw08aHTBwBdwkk=; b=AORXW3arZCFgSFe+b/SpVUWh2K
	5q27SziQe9/FgDzqUX+eFx18Epu3tldLXaNpx9d0p1sj6kUKjyqVgLwcl/87vLfp3W19OlrxRLKbj
	Q6ZuxblvcXsjuhUo7YakXGI59oMaRnWrP3mPTLb5iUnNc3oN99rUOGptFisgX5JVQgnk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188030-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 188030: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3b79d825b5719f6654e4c95cdc17d65bb204213a
X-Osstest-Versions-That:
    xen=c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Oct 2024 16:49:09 +0000

flight 188030 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188030/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3b79d825b5719f6654e4c95cdc17d65bb204213a
baseline version:
 xen                  c95cd5f9c5a8c1c6ab1b0b366d829fa8561958fd

Last test of basis   188015  2024-10-08 16:00:24 Z    1 days
Testing same since   188024  2024-10-09 08:02:21 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Matthew Barnes <matthew.barnes@cloud.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
   c95cd5f9c5..3b79d825b5  3b79d825b5719f6654e4c95cdc17d65bb204213a -> smoke

