Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75C37994E
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 23:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125552.236309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgDbm-0004LN-4q; Mon, 10 May 2021 21:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125552.236309; Mon, 10 May 2021 21:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgDbm-0004IR-1J; Mon, 10 May 2021 21:38:34 +0000
Received: by outflank-mailman (input) for mailman id 125552;
 Mon, 10 May 2021 21:38:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgDbk-0004IG-Qg; Mon, 10 May 2021 21:38:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgDbk-0006b4-MC; Mon, 10 May 2021 21:38:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgDbk-0007rM-BZ; Mon, 10 May 2021 21:38:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lgDbk-0005MB-B4; Mon, 10 May 2021 21:38:32 +0000
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
	bh=bVO9kqv0Epb0jyv3ivyeAPG6SSiYaJwxrBA4n4RU6v0=; b=byzgdFw4iUwCgBN1tZXdfTqJPr
	5ssTtjJWDmebcNtQULZyQ6e+MMW/PUAL5L21NtyZPDVvKM5LT2zn0kOTdRTDJKHoGW+4Ql/FkROrj
	/TaAbz77fQDhNYJfAzpmuU5adOKFOZMz309ynDiV5XdQ+vMysuezwin/Gmvr+hXcVcio=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161895-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161895: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=375f2d8e684dce2ab6f375382f35e546c7ab62ee
X-Osstest-Versions-That:
    ovmf=f297b7f20010711e36e981fe45645302cc9d109d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 May 2021 21:38:32 +0000

flight 161895 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161895/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 375f2d8e684dce2ab6f375382f35e546c7ab62ee
baseline version:
 ovmf                 f297b7f20010711e36e981fe45645302cc9d109d

Last test of basis   161726  2021-05-04 06:28:31 Z    6 days
Testing same since   161895  2021-05-10 16:10:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nicola Mazzucato <nicola.mazzucato@arm.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   f297b7f200..375f2d8e68  375f2d8e684dce2ab6f375382f35e546c7ab62ee -> xen-tested-master

