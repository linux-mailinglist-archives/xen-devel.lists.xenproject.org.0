Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47966CECF6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 17:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516308.800233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phXmA-0002eI-5i; Wed, 29 Mar 2023 15:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516308.800233; Wed, 29 Mar 2023 15:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phXmA-0002cO-26; Wed, 29 Mar 2023 15:31:50 +0000
Received: by outflank-mailman (input) for mailman id 516308;
 Wed, 29 Mar 2023 15:31:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phXm8-0002cE-RA; Wed, 29 Mar 2023 15:31:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phXm8-00061e-PA; Wed, 29 Mar 2023 15:31:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phXm8-0003Lb-BD; Wed, 29 Mar 2023 15:31:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1phXm8-0002JZ-Ag; Wed, 29 Mar 2023 15:31:48 +0000
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
	bh=J3JtX0DCPwkAKWaXfLEZpLlzpVyF3z8NQCn5gHxLvaY=; b=rprXNRubBwPpVlbbEutqlD8ZWm
	DSyG3PeZvI4oKSPl1XMLIBluW9cu6r7vEuEzOCc8fBgjvKUtp+13MK7hCK39ZvDSs+feeNOb1fEGa
	O4dPFx4T1EGe+isocQc2IyPv8os5nINiUoDjXohhTxwodyPdS0dM3jyrXxA4M1KXnDiU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180053-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180053: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b697a31a8db5f23ed1030f0fea1b56c107ca85a3
X-Osstest-Versions-That:
    ovmf=e3aba976f6d588abd88027fef46999a1d3724576
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Mar 2023 15:31:48 +0000

flight 180053 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180053/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b697a31a8db5f23ed1030f0fea1b56c107ca85a3
baseline version:
 ovmf                 e3aba976f6d588abd88027fef46999a1d3724576

Last test of basis   180050  2023-03-29 09:42:20 Z    0 days
Testing same since   180053  2023-03-29 13:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Rebecca Cran <rebecca@bsdio.com>

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
   e3aba976f6..b697a31a8d  b697a31a8db5f23ed1030f0fea1b56c107ca85a3 -> xen-tested-master

