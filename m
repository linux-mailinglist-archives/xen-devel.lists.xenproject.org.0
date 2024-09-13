Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC62977CCC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 12:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798097.1208244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp36x-0007f1-Cy; Fri, 13 Sep 2024 10:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798097.1208244; Fri, 13 Sep 2024 10:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp36x-0007ci-A8; Fri, 13 Sep 2024 10:01:07 +0000
Received: by outflank-mailman (input) for mailman id 798097;
 Fri, 13 Sep 2024 10:01:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sp36v-0007cY-LD; Fri, 13 Sep 2024 10:01:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sp36v-0003Wb-Gl; Fri, 13 Sep 2024 10:01:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sp36v-0004ed-1e; Fri, 13 Sep 2024 10:01:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sp36v-0002T7-19; Fri, 13 Sep 2024 10:01:05 +0000
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
	bh=0lx8k/cY2rowqQpBrwD8ZY04tMenDkJwg+8fMWyEodA=; b=mcaN9ty3rTxvHslBTx+8hibQ4F
	t7j1k4s2dx+AJ7hg88PSIiHXXdhCwDdNchAJ/W/EBAvW+DV52W8Oeo37gvQ1zqYy4Jy7eBcYga75L
	DVFX4AX9Woq1edoVWYhP/bjEguMNL8rKo/29IK6aHQyYg2lXfsI7ImnJiYdHk5FW3DAk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187688-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187688: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=964c22b8ea3b1c497fed0547f29e8338be26040a
X-Osstest-Versions-That:
    ovmf=a9b38305b64ef5997d0ba5f7d2797a75edd1f9ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 10:01:05 +0000

flight 187688 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187688/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 964c22b8ea3b1c497fed0547f29e8338be26040a
baseline version:
 ovmf                 a9b38305b64ef5997d0ba5f7d2797a75edd1f9ef

Last test of basis   187685  2024-09-13 04:15:10 Z    0 days
Testing same since   187688  2024-09-13 08:11:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ken Lautner <kenlautner3@gmail.com>
  Kenneth Lautner <kenlautner3@gmail.com>

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
   a9b38305b6..964c22b8ea  964c22b8ea3b1c497fed0547f29e8338be26040a -> xen-tested-master

