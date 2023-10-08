Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0B7BCE6F
	for <lists+xen-devel@lfdr.de>; Sun,  8 Oct 2023 15:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614036.954891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpTRx-0005ts-Ax; Sun, 08 Oct 2023 13:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614036.954891; Sun, 08 Oct 2023 13:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpTRx-0005sv-8B; Sun, 08 Oct 2023 13:04:01 +0000
Received: by outflank-mailman (input) for mailman id 614036;
 Sun, 08 Oct 2023 13:03:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qpTRv-0005sl-SX; Sun, 08 Oct 2023 13:03:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qpTRv-00010H-Kp; Sun, 08 Oct 2023 13:03:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qpTRv-0000yo-93; Sun, 08 Oct 2023 13:03:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qpTRv-00075J-8Z; Sun, 08 Oct 2023 13:03:59 +0000
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
	bh=loYvgBetNKUQDZBaYKYL3sAZG8a7jnf6KOtnsLs/ZHw=; b=2F6+SbRmOkmcoWsyeLwUUAcj4F
	3HelCPDsw95ULncPmpKjz7wNfrLcq1fOCX2P4qSYxUapAhFCqn/EgrXKsBNNQ6SxFwCZAn7e+zGVi
	9gbyoIgCG8+rK8ZKA3nSNRt2s05feWv8XHjbOHofEyRBst3N7WLyjOZHbxJhrv1qFq0A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183320-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183320: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4ddd8ac3a29d9c5974a19f36c1dc5896d813dc6e
X-Osstest-Versions-That:
    ovmf=5087a07736452518a508a7776002afbce360128b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Oct 2023 13:03:59 +0000

flight 183320 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183320/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4ddd8ac3a29d9c5974a19f36c1dc5896d813dc6e
baseline version:
 ovmf                 5087a07736452518a508a7776002afbce360128b

Last test of basis   183315  2023-10-07 14:12:49 Z    0 days
Testing same since   183320  2023-10-08 11:13:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
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
   5087a07736..4ddd8ac3a2  4ddd8ac3a29d9c5974a19f36c1dc5896d813dc6e -> xen-tested-master

