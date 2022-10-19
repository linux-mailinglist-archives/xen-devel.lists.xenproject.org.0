Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F86048DE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 16:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425817.673870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol9oL-0002jJ-Qu; Wed, 19 Oct 2022 14:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425817.673870; Wed, 19 Oct 2022 14:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol9oL-0002fx-NX; Wed, 19 Oct 2022 14:12:45 +0000
Received: by outflank-mailman (input) for mailman id 425817;
 Wed, 19 Oct 2022 14:12:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol9oJ-0002fn-N2; Wed, 19 Oct 2022 14:12:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol9oJ-0005ES-KZ; Wed, 19 Oct 2022 14:12:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ol9oJ-0005s3-CM; Wed, 19 Oct 2022 14:12:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ol9oJ-0005U4-Bp; Wed, 19 Oct 2022 14:12:43 +0000
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
	bh=X7+qJC0jhFrQ6GQm3QAsXgcU7ERX8/IR0SPzNzRh3gs=; b=eyXuz328rkZjI4Jtbs6XnPcAue
	0W1x+22/owuEDZHCcMZVWLCJZYCqvyshb0Yw2YbrXGt9Y+bk98pickQWOBks1Z4Cqdi1HukgJk3ys
	8LOCQBId/zKbf8xrj2O4DthXQq5+iwjlmS4QSrIhC51xlafzvjuAvwZ3bj+WHhrS9g18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174092-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174092: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=31b16384688df9ce0e8f59021fd667e47d7d3972
X-Osstest-Versions-That:
    ovmf=0f6eccdbf75885631221388d362417eb7b873ce0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Oct 2022 14:12:43 +0000

flight 174092 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174092/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 31b16384688df9ce0e8f59021fd667e47d7d3972
baseline version:
 ovmf                 0f6eccdbf75885631221388d362417eb7b873ce0

Last test of basis   174081  2022-10-19 08:11:59 Z    0 days
Testing same since   174092  2022-10-19 12:10:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   0f6eccdbf7..31b1638468  31b16384688df9ce0e8f59021fd667e47d7d3972 -> xen-tested-master

