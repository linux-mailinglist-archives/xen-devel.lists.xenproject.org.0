Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78513372936
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 12:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122090.230248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsgD-0001ld-AM; Tue, 04 May 2021 10:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122090.230248; Tue, 04 May 2021 10:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsgD-0001lB-6e; Tue, 04 May 2021 10:53:29 +0000
Received: by outflank-mailman (input) for mailman id 122090;
 Tue, 04 May 2021 10:53:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ldsgB-0001l3-N4; Tue, 04 May 2021 10:53:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ldsgB-0000Pw-Fx; Tue, 04 May 2021 10:53:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ldsgB-0008A0-7s; Tue, 04 May 2021 10:53:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ldsgB-0002kJ-7N; Tue, 04 May 2021 10:53:27 +0000
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
	bh=pY5bO1Zb5vhBs+8Hs99oJGmSZZcO2G0WSMxTQbo1wX0=; b=g7FLsItLFsOmJz5qVTR0Q49sja
	6ISrqdht5PniBFtg4/hc2yepCa01W7w6sA23ZCHQu6jpRIn59ZUq2TbJ9S1Ho6gUm1jR60VKq3wTH
	X5LFUJ4iCkVr65ruzTZNm3c0+Ob1ES8lzxwFNXuoqdZ+lsLtF081QsOUnv2q9sgJMCXg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161726-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161726: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f297b7f20010711e36e981fe45645302cc9d109d
X-Osstest-Versions-That:
    ovmf=8c8f49f0dc86e3c58d94766e6b194b83c1bef5c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 May 2021 10:53:27 +0000

flight 161726 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161726/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f297b7f20010711e36e981fe45645302cc9d109d
baseline version:
 ovmf                 8c8f49f0dc86e3c58d94766e6b194b83c1bef5c9

Last test of basis   161629  2021-05-03 18:40:06 Z    0 days
Testing same since   161726  2021-05-04 06:28:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Getnat Ejigu <getnatejigu@gmail.com>

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
   8c8f49f0dc..f297b7f200  f297b7f20010711e36e981fe45645302cc9d109d -> xen-tested-master

