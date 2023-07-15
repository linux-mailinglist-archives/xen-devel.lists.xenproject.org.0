Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E00754A06
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jul 2023 18:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563977.881357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKhqH-0006pk-VT; Sat, 15 Jul 2023 16:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563977.881357; Sat, 15 Jul 2023 16:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKhqH-0006nh-RY; Sat, 15 Jul 2023 16:09:57 +0000
Received: by outflank-mailman (input) for mailman id 563977;
 Sat, 15 Jul 2023 16:09:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKhqG-0006nX-C6; Sat, 15 Jul 2023 16:09:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKhqG-00078o-0u; Sat, 15 Jul 2023 16:09:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qKhqF-0004mK-Jx; Sat, 15 Jul 2023 16:09:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qKhqF-0008TE-JR; Sat, 15 Jul 2023 16:09:55 +0000
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
	bh=wbJYu/3xm+WJVcSHBIM8QS+1yg06+fC8rVHJ2WIPoWk=; b=dIG9TtlWwNz9PHU7f58AWaPNy6
	mZJHHAvAtMBVGU/hL9m47LY2S1aWr5r0b53o9apKl8oAXNYYrZYIiXhL3irHk0J31aZy6mOAs37++
	RUahP3BFugsa6GCEPLc9v5ZxzQOOxGmVFn9boU/pYllu6xLewhe3Xk9TEfaAlORSHYHU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181824-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181824: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f220dcbba86bfc1222180c61bbd31dd6023433db
X-Osstest-Versions-That:
    ovmf=e674096accc8e57cd0dd84679905e1222423251e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jul 2023 16:09:55 +0000

flight 181824 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181824/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f220dcbba86bfc1222180c61bbd31dd6023433db
baseline version:
 ovmf                 e674096accc8e57cd0dd84679905e1222423251e

Last test of basis   181806  2023-07-15 01:50:22 Z    0 days
Testing same since   181824  2023-07-15 14:12:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tuan Phan <tphan@ventanamicro.com>

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
   e674096acc..f220dcbba8  f220dcbba86bfc1222180c61bbd31dd6023433db -> xen-tested-master

