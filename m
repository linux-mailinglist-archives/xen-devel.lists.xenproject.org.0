Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F3933ECE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 16:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760014.1169732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU5un-0002hS-W4; Wed, 17 Jul 2024 14:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760014.1169732; Wed, 17 Jul 2024 14:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU5un-0002et-Sl; Wed, 17 Jul 2024 14:45:57 +0000
Received: by outflank-mailman (input) for mailman id 760014;
 Wed, 17 Jul 2024 14:45:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU5um-0002ei-6Z; Wed, 17 Jul 2024 14:45:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU5um-0002jQ-5c; Wed, 17 Jul 2024 14:45:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sU5ul-0001mA-Ok; Wed, 17 Jul 2024 14:45:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sU5ul-0007da-OF; Wed, 17 Jul 2024 14:45:55 +0000
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
	bh=kHuHWjGtyXFjiV7/HpCJ42AE5SWXby7VL0zKlM66tVI=; b=THiGEqjKs7uQUyJaaP0tnZ9pVT
	bkPY/IWs1y8092tx3RrNR0Eta5PyQNuZQDy97Zo0foKXUPWXeCGf1HfedMePjCVHSCaNmECraO0oN
	/cCOKOr/baKWy767Rh80dYPLGPLKjqCdLecSrxGwlpTWwRTaVzZ8L5YVerLT+odczu4w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186841-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186841: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dd58d1227c102ad4a799002f16b3a8c796d7d7cc
X-Osstest-Versions-That:
    ovmf=e32d24ef8c8211e76c020fa7a395328cd176190c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jul 2024 14:45:55 +0000

flight 186841 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186841/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dd58d1227c102ad4a799002f16b3a8c796d7d7cc
baseline version:
 ovmf                 e32d24ef8c8211e76c020fa7a395328cd176190c

Last test of basis   186839  2024-07-17 08:45:10 Z    0 days
Testing same since   186841  2024-07-17 13:11:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shenbagadevi R <shenbagadevir@ami.com>

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
   e32d24ef8c..dd58d1227c  dd58d1227c102ad4a799002f16b3a8c796d7d7cc -> xen-tested-master

