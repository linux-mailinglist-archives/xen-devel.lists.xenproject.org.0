Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFF6BE101
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 07:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510901.789459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd3FB-0007hr-0C; Fri, 17 Mar 2023 06:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510901.789459; Fri, 17 Mar 2023 06:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd3FA-0007fE-TC; Fri, 17 Mar 2023 06:07:12 +0000
Received: by outflank-mailman (input) for mailman id 510901;
 Fri, 17 Mar 2023 06:07:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pd3F9-0007f4-3I; Fri, 17 Mar 2023 06:07:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pd3F9-0006ek-1z; Fri, 17 Mar 2023 06:07:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pd3F8-00080o-Kk; Fri, 17 Mar 2023 06:07:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pd3F8-00053I-KJ; Fri, 17 Mar 2023 06:07:10 +0000
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
	bh=bKQsiHpS2xE7sbCOLv3T3x/1WxEcDEeNB9LqgKbGu4g=; b=kPntdg+y5Vz0gf7ao19xw5NMsc
	ZUzhy4ODfRXTrFXwym6zlyNFA6K2vmo4AaRgEH2mx1xY3IwzuICAq9qAV02JhuEkd10ca5dbEq+Ti
	la16wx7LnTq8Dd/fDHhmr2fNAUL8l5TRbq3erfXtbVpdkA75DTac7VEOWU5rHVqPp/rA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179705-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179705: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0e5717009779ec6c1e35f979426a2cd407b3e73a
X-Osstest-Versions-That:
    ovmf=16e0969ef775b898ac700f3261d76030b8ab9ef0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Mar 2023 06:07:10 +0000

flight 179705 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179705/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0e5717009779ec6c1e35f979426a2cd407b3e73a
baseline version:
 ovmf                 16e0969ef775b898ac700f3261d76030b8ab9ef0

Last test of basis   179698  2023-03-16 21:45:32 Z    0 days
Testing same since   179705  2023-03-17 04:10:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Matt DeVillier <matt.devillier@gmail.com>

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
   16e0969ef7..0e57170097  0e5717009779ec6c1e35f979426a2cd407b3e73a -> xen-tested-master

