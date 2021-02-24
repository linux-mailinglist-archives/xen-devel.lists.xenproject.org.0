Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA332426C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 17:48:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89442.168475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExL5-0006ZA-UQ; Wed, 24 Feb 2021 16:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89442.168475; Wed, 24 Feb 2021 16:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExL5-0006Yg-QG; Wed, 24 Feb 2021 16:48:39 +0000
Received: by outflank-mailman (input) for mailman id 89442;
 Wed, 24 Feb 2021 16:48:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lExL4-0006YX-7K; Wed, 24 Feb 2021 16:48:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lExL3-0001y9-Vz; Wed, 24 Feb 2021 16:48:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lExL3-0003hM-Pb; Wed, 24 Feb 2021 16:48:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lExL3-0003RM-P8; Wed, 24 Feb 2021 16:48:37 +0000
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
	bh=MueLEIlKg/cESsUxTR/Z4XyeRP+lIpU4YRSTDEnXn+4=; b=mBA2N1iOgHew0E+dGAe9VIuLyr
	J9lG0O04bU2Zd+jY/HbnG9bijBQIDaCzGXwIfpRkQGlZzdHkmY5viW3062D2AiQ+T1JwIHHw4pnUQ
	PKdNMeVtazBNTJhJ7FrvhGGELYUDES6MTrxJ9+5aMNTwaCdWRV5UWhH+YWJq/W7l1InY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159619-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159619: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=739a506b18c4f694b8d5d2f3424a329c45d737ba
X-Osstest-Versions-That:
    ovmf=68e5ecc4d208fe900530fdbe6b44dfc85bef60a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Feb 2021 16:48:37 +0000

flight 159619 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159619/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 739a506b18c4f694b8d5d2f3424a329c45d737ba
baseline version:
 ovmf                 68e5ecc4d208fe900530fdbe6b44dfc85bef60a8

Last test of basis   159598  2021-02-23 19:09:45 Z    0 days
Testing same since   159619  2021-02-24 08:09:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Leif Lindholm <leif@nuviainc.com>

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
   68e5ecc4d2..739a506b18  739a506b18c4f694b8d5d2f3424a329c45d737ba -> xen-tested-master

