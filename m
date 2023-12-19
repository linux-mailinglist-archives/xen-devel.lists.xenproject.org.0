Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15219819105
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657140.1025873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFg2e-00009N-PH; Tue, 19 Dec 2023 19:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657140.1025873; Tue, 19 Dec 2023 19:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFg2e-00007s-Mf; Tue, 19 Dec 2023 19:46:12 +0000
Received: by outflank-mailman (input) for mailman id 657140;
 Tue, 19 Dec 2023 19:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFg2d-00007i-EE; Tue, 19 Dec 2023 19:46:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFg2d-0001Kr-90; Tue, 19 Dec 2023 19:46:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFg2c-0003Ir-Qw; Tue, 19 Dec 2023 19:46:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFg2c-0007jw-QR; Tue, 19 Dec 2023 19:46:10 +0000
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
	bh=azKmmoQwPcwr5V6Sob3eeKkXanW7nF9qNpXpM4THRQA=; b=qI1l7nvaLsHWm5l3tPTPKkUTX8
	SQxu9THRLP0JWd6YpE7otOOQ/1yMVp21Rne8pPAm9WNdEqqCyG1p9+o+Ig2e9xcETVLvUxU5j7mJ5
	FncE3GfY5OJchuR6A8yWMEkdISdTN0Z+6M+tn7f6YOzVh5GobHut/cGyOlkU7dUXXSxM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184177-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184177: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c1e9f9c6fa7b5137003b0cfa6d54a6bada16d8e
X-Osstest-Versions-That:
    ovmf=b1f33cbf8113bb07526c9f6946c250c7d9db44f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Dec 2023 19:46:10 +0000

flight 184177 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184177/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c1e9f9c6fa7b5137003b0cfa6d54a6bada16d8e
baseline version:
 ovmf                 b1f33cbf8113bb07526c9f6946c250c7d9db44f9

Last test of basis   184175  2023-12-19 13:11:00 Z    0 days
Testing same since   184177  2023-12-19 15:41:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Neal Gompa <ngompa@fedoraproject.org>

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
   b1f33cbf81..8c1e9f9c6f  8c1e9f9c6fa7b5137003b0cfa6d54a6bada16d8e -> xen-tested-master

