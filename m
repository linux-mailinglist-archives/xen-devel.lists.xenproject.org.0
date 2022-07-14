Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447A575695
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 22:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367804.598934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC5lb-0005uu-E7; Thu, 14 Jul 2022 20:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367804.598934; Thu, 14 Jul 2022 20:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC5lb-0005rw-BI; Thu, 14 Jul 2022 20:48:59 +0000
Received: by outflank-mailman (input) for mailman id 367804;
 Thu, 14 Jul 2022 20:48:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oC5la-0005rm-5N; Thu, 14 Jul 2022 20:48:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oC5la-0004Q4-3N; Thu, 14 Jul 2022 20:48:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oC5lZ-0002r2-N2; Thu, 14 Jul 2022 20:48:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oC5lZ-0003t9-MY; Thu, 14 Jul 2022 20:48:57 +0000
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
	bh=o9FrviQGTQ0MlYlQCxQp9YKckQJodJ9oerW8x6WwAFY=; b=whajZKIGeMtLCX8xD8SviMD1rL
	pBGpwp/yph+Pb0b9eNnH9Sekgh8tugE8Wie/6yv7TZtuKNUCpUhC55nkBovA8EQCJlUwHo4WFtunB
	honGAd3NqeR9ewnf/6M97Y1RLt2Xg6+fnemGmmuKyRgywUusxlfAaq+o/gDDSB84AJPA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171633-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171633: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=470206ba7f118aaa1153d66689cf3ee4d17051b7
X-Osstest-Versions-That:
    ovmf=12dd064a1804536518eb12229836fa572c232502
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Jul 2022 20:48:57 +0000

flight 171633 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171633/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 470206ba7f118aaa1153d66689cf3ee4d17051b7
baseline version:
 ovmf                 12dd064a1804536518eb12229836fa572c232502

Last test of basis   171581  2022-07-11 08:42:58 Z    3 days
Testing same since   171633  2022-07-14 18:41:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kuo, Ted <ted.kuo@intel.com>
  Ted Kuo <ted.kuo@intel.com>

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
   12dd064a18..470206ba7f  470206ba7f118aaa1153d66689cf3ee4d17051b7 -> xen-tested-master

