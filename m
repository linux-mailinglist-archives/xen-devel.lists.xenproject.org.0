Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085771587D
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540840.842892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uip-0004I3-PF; Tue, 30 May 2023 08:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540840.842892; Tue, 30 May 2023 08:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uip-0004GG-MD; Tue, 30 May 2023 08:28:51 +0000
Received: by outflank-mailman (input) for mailman id 540840;
 Tue, 30 May 2023 08:28:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3uio-0004G0-FX; Tue, 30 May 2023 08:28:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3uio-0000wn-2r; Tue, 30 May 2023 08:28:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q3uin-0002Fr-Ku; Tue, 30 May 2023 08:28:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q3uin-0006iQ-KT; Tue, 30 May 2023 08:28:49 +0000
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
	bh=iaNPB2YqhCwCWyNr52wK3huKBePSGh2H4Xvoxhn1OzQ=; b=Um5BmEvclRb27KxFEbLvtY2Edi
	/TLjqhk+NkQmJzQr299RF/521WjGJU0fz5kRuEEaHM64Q84vU+ZRqqN309+qyaGuSgGPL5p9sxl6u
	2GeqmP3N1qMGYyKr6U4yyljB0w62Pgjsq7B93ogb/3GyDSDIFHxNxnQnqwLebFUBv9U8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181008-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181008: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=9d9761af50e538d983e00b1cb2d0ffcee261e552
X-Osstest-Versions-That:
    ovmf=1034d223f8cc6bf8b9b86c57e564753cdad46f88
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 May 2023 08:28:49 +0000

flight 181008 ovmf real [real]
flight 181010 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181008/
http://logs.test-lab.xenproject.org/osstest/logs/181010/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail pass in 181010-retest

version targeted for testing:
 ovmf                 9d9761af50e538d983e00b1cb2d0ffcee261e552
baseline version:
 ovmf                 1034d223f8cc6bf8b9b86c57e564753cdad46f88

Last test of basis   181004  2023-05-29 18:15:27 Z    0 days
Testing same since   181008  2023-05-30 03:42:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   1034d223f8..9d9761af50  9d9761af50e538d983e00b1cb2d0ffcee261e552 -> xen-tested-master

