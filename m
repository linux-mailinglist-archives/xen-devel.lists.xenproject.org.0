Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AF3DB140
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 04:40:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162257.297630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9IQL-0002gf-T2; Fri, 30 Jul 2021 02:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162257.297630; Fri, 30 Jul 2021 02:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9IQL-0002f3-N1; Fri, 30 Jul 2021 02:38:57 +0000
Received: by outflank-mailman (input) for mailman id 162257;
 Fri, 30 Jul 2021 02:38:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m9IQJ-0002et-Nl; Fri, 30 Jul 2021 02:38:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m9IQJ-000121-JT; Fri, 30 Jul 2021 02:38:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m9IQJ-0000Lk-A6; Fri, 30 Jul 2021 02:38:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m9IQJ-0002vO-9X; Fri, 30 Jul 2021 02:38:55 +0000
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
	bh=9h4RvQztMvxUW9xl79NkIoLUCNMJLW4eNY9fWVqMrwc=; b=k39SXccpGb7hvyUPqV1ZbUR7/7
	STheNjs9VP2Y58VOPu1H2FMWsoUfb1KMnGZTGWl2wjmGbv1w0QT5gRfvHgidcipHj4EUXK2bPN2Tz
	LfocEAeoNSTjR9p5cPPE+stdJy+xB/UVZf24sRpl2QdBGjjnZKtJ1cgQ4pGMXcrk2PV4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164047-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164047: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=610bcc69ed3d1e8c016332a1862465d41d95dd6c
X-Osstest-Versions-That:
    ovmf=514b3aa08ece52140b769a8676595655691c7cb3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Jul 2021 02:38:55 +0000

flight 164047 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164047/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 610bcc69ed3d1e8c016332a1862465d41d95dd6c
baseline version:
 ovmf                 514b3aa08ece52140b769a8676595655691c7cb3

Last test of basis   164039  2021-07-29 10:10:10 Z    0 days
Testing same since   164047  2021-07-29 23:10:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pete Batard <pete@akeo.ie>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Sunny Wang <sunny.wang@arm.com>

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
   514b3aa08e..610bcc69ed  610bcc69ed3d1e8c016332a1862465d41d95dd6c -> xen-tested-master

