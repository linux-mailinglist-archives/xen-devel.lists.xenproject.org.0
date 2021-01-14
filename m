Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE472F5C45
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 09:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66863.118936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzxoz-0005Wo-Vr; Thu, 14 Jan 2021 08:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66863.118936; Thu, 14 Jan 2021 08:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzxoz-0005WM-Ro; Thu, 14 Jan 2021 08:17:33 +0000
Received: by outflank-mailman (input) for mailman id 66863;
 Thu, 14 Jan 2021 08:17:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzxoy-0005WE-Lc; Thu, 14 Jan 2021 08:17:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzxoy-00079h-Fi; Thu, 14 Jan 2021 08:17:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kzxoy-0005JL-8o; Thu, 14 Jan 2021 08:17:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kzxoy-00027g-8L; Thu, 14 Jan 2021 08:17:32 +0000
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
	bh=ryFab1XMYL2zxuw5wcG4moIXzl9Kx0fuXAQXNWhCFTE=; b=7BlUbcRI+xPhiVtmsOlrtz6cbp
	OC8ogGHzLirskuOJjaC6il7wv0kuy1ns07hRgfrW3VYRvxHD7fdQyqEjNpsfKTW4Lm7rWbloH++LP
	DqljSz3Aib8AfEKiijfIprB6HYaHMPN9CiC9jj887ET5MFjrOk48+9cIVOe5OnZ+Rqbk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158414-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158414: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=da45a3608787d77fc55d915bee3903f5119b3ee6
X-Osstest-Versions-That:
    ovmf=ebfe2d3eb5ac7fd92d74011edb31303a181920c7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Jan 2021 08:17:32 +0000

flight 158414 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158414/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 da45a3608787d77fc55d915bee3903f5119b3ee6
baseline version:
 ovmf                 ebfe2d3eb5ac7fd92d74011edb31303a181920c7

Last test of basis   158375  2021-01-12 06:40:48 Z    2 days
Testing same since   158414  2021-01-14 01:40:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hao A Wu <hao.a.wu@intel.com>
  Heng Luo <heng.luo@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Luo, Heng <heng.luo@intel.com>

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
   ebfe2d3eb5..da45a36087  da45a3608787d77fc55d915bee3903f5119b3ee6 -> xen-tested-master

