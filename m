Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612434F83B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 07:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103720.197855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRTGm-0005bv-Va; Wed, 31 Mar 2021 05:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103720.197855; Wed, 31 Mar 2021 05:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRTGm-0005bS-Rl; Wed, 31 Mar 2021 05:19:56 +0000
Received: by outflank-mailman (input) for mailman id 103720;
 Wed, 31 Mar 2021 05:19:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRTGl-0005bE-4s; Wed, 31 Mar 2021 05:19:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRTGk-00032f-QG; Wed, 31 Mar 2021 05:19:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRTGk-0002U5-IF; Wed, 31 Mar 2021 05:19:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lRTGk-0001aU-Hi; Wed, 31 Mar 2021 05:19:54 +0000
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
	bh=Gk3w/KXvSzB65QdvsDiNlHL0gOQ/Q9WK4+YN5qj4YAI=; b=v2uHhqcJFtND7lhRxFLMyFACzP
	nPx6/RYdf2QssBC3/hKs1fRHl+aPcYP2ykhJUl50NUNZtBcTOgPXfC2T2v36dn8VIzqME61aTkUug
	IURPu8aLtDZm7ZrAc5yyx2puYO+ubJuM3RHT29lSjIdqj45nNQGNBWmbyStfwxCew0fY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160560-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160560: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=98ff7e3c6373d3e0590f953459b6234ab12edce6
X-Osstest-Versions-That:
    ovmf=b33cf5bfcb4c941370739dfbbe1532ff508fd29d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Mar 2021 05:19:54 +0000

flight 160560 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160560/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 98ff7e3c6373d3e0590f953459b6234ab12edce6
baseline version:
 ovmf                 b33cf5bfcb4c941370739dfbbe1532ff508fd29d

Last test of basis   160456  2021-03-26 20:57:11 Z    4 days
Testing same since   160560  2021-03-30 13:10:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Dandan Bi <dandan.bi@intel.com>

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
   b33cf5bfcb..98ff7e3c63  98ff7e3c6373d3e0590f953459b6234ab12edce6 -> xen-tested-master

