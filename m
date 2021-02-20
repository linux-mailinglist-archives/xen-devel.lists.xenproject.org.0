Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49232320737
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 22:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87348.164497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDZvV-0003fJ-Qg; Sat, 20 Feb 2021 21:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87348.164497; Sat, 20 Feb 2021 21:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDZvV-0003em-M9; Sat, 20 Feb 2021 21:36:33 +0000
Received: by outflank-mailman (input) for mailman id 87348;
 Sat, 20 Feb 2021 21:36:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDZvU-0003ee-5w; Sat, 20 Feb 2021 21:36:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDZvT-0003Sc-Ty; Sat, 20 Feb 2021 21:36:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lDZvT-00044k-KD; Sat, 20 Feb 2021 21:36:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lDZvT-0002wn-Jg; Sat, 20 Feb 2021 21:36:31 +0000
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
	bh=5JGT0lNgNnNCbb+tkbbSBH8fkYUkp6SxV5MOkzUvVqk=; b=Kx+nr8m6QJkV8/MI3BykKj3z90
	o9uDnYF6rb2h/Htc3Em9mwXUJXKXQuTgmm/N8R2y4cqM90/UXYBXKgt+XPUQPtQA3ZS5RLBtyg2sd
	AOyHMCQqNuXbodSwXLE0Qt11gZT4ZmYd+5GUKVzzZzs2nvWNX9djCrMbbOiCGTVRvX4k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159493-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159493: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=44ae214591e58af468eacb7b873eaa0bc187c4fa
X-Osstest-Versions-That:
    ovmf=4f4d862c1c7232a18347616d94c343c929657fdb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 Feb 2021 21:36:31 +0000

flight 159493 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159493/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 44ae214591e58af468eacb7b873eaa0bc187c4fa
baseline version:
 ovmf                 4f4d862c1c7232a18347616d94c343c929657fdb

Last test of basis   159394  2021-02-15 23:39:45 Z    4 days
Testing same since   159493  2021-02-20 17:09:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>

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
   4f4d862c1c..44ae214591  44ae214591e58af468eacb7b873eaa0bc187c4fa -> xen-tested-master

