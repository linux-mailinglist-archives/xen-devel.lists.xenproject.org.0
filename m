Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2E7B6E03
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 18:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612287.952146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnhvY-0006R9-HU; Tue, 03 Oct 2023 16:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612287.952146; Tue, 03 Oct 2023 16:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnhvY-0006Ob-Ed; Tue, 03 Oct 2023 16:07:16 +0000
Received: by outflank-mailman (input) for mailman id 612287;
 Tue, 03 Oct 2023 16:07:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnhvW-0006OR-V7; Tue, 03 Oct 2023 16:07:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnhvW-00058e-Kt; Tue, 03 Oct 2023 16:07:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qnhvW-0004RF-EG; Tue, 03 Oct 2023 16:07:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qnhvW-0008NP-Dc; Tue, 03 Oct 2023 16:07:14 +0000
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
	bh=TQdos7Tmmarx8cqn1BW1cqkvN64EoC5TO/s2yOOQJ5s=; b=ZuGKDeLVJPtXCrusIM+q2/tfY5
	lgmk24sn3CSmf2sbuf6WaV6HIw4G0aAIaOTwfv9++UytYVsLRb3qwUxBjujg/qajXHcw6nUFHv1rt
	8t7Xwg4nq0LhWGSnryfoW90teBkA7gaqfruRfsIGm9S6rN45y3qczy9l+iFojzushBOk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183250-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183250: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1497c4b074946f3ad9d46ddbb6d655c951e23ae8
X-Osstest-Versions-That:
    ovmf=1a66bd51ca21f341281d8e3157d3d3f4a94fd26c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Oct 2023 16:07:14 +0000

flight 183250 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183250/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1497c4b074946f3ad9d46ddbb6d655c951e23ae8
baseline version:
 ovmf                 1a66bd51ca21f341281d8e3157d3d3f4a94fd26c

Last test of basis   183239  2023-10-02 16:12:16 Z    0 days
Testing same since   183250  2023-10-03 12:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   1a66bd51ca..1497c4b074  1497c4b074946f3ad9d46ddbb6d655c951e23ae8 -> xen-tested-master

