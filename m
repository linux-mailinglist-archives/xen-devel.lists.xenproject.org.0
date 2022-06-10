Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D3546FE1
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 01:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346804.572738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nznqH-0006vw-WD; Fri, 10 Jun 2022 23:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346804.572738; Fri, 10 Jun 2022 23:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nznqH-0006tQ-Sb; Fri, 10 Jun 2022 23:15:01 +0000
Received: by outflank-mailman (input) for mailman id 346804;
 Fri, 10 Jun 2022 23:15:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nznqG-0006tE-Bi; Fri, 10 Jun 2022 23:15:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nznqG-00039M-Ap; Fri, 10 Jun 2022 23:15:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nznqF-0006Mn-UE; Fri, 10 Jun 2022 23:15:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nznqF-0001ZF-Tl; Fri, 10 Jun 2022 23:14:59 +0000
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
	bh=MTQ6DKka5zfJc5HVJ1eWcOOwIRxe+EX9RoJzrYQnRt4=; b=Ub6d5scYNShEdY3jd89uw0uEPt
	NIX+PkZAe57/TLyxZ3nQtHZXmDkWjIddaHyrJvsUejKhqjD1Lc098rBub0AcYE/xkt7WCvzEgggzd
	+aQKbbH9WDKTmWdP/2gqpeeiyNpk3tNLw8+hB16U7IasyRDgjdkw0D996n2XKlbWBpgk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170964-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170964: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f0b97e165e0af79ac9eb3c6ac7697f9183afc7cb
X-Osstest-Versions-That:
    ovmf=ccc269756f773d35aab67ccb935fa9548f30cff3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 23:14:59 +0000

flight 170964 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170964/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f0b97e165e0af79ac9eb3c6ac7697f9183afc7cb
baseline version:
 ovmf                 ccc269756f773d35aab67ccb935fa9548f30cff3

Last test of basis   170935  2022-06-10 12:40:30 Z    0 days
Testing same since   170964  2022-06-10 20:46:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   ccc269756f..f0b97e165e  f0b97e165e0af79ac9eb3c6ac7697f9183afc7cb -> xen-tested-master

