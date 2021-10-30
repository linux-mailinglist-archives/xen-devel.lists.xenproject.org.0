Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552C440BA3
	for <lists+xen-devel@lfdr.de>; Sat, 30 Oct 2021 22:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218818.379417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mguzf-0006nv-HG; Sat, 30 Oct 2021 20:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218818.379417; Sat, 30 Oct 2021 20:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mguzf-0006kx-D5; Sat, 30 Oct 2021 20:30:23 +0000
Received: by outflank-mailman (input) for mailman id 218818;
 Sat, 30 Oct 2021 20:30:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mguze-0006kn-3l; Sat, 30 Oct 2021 20:30:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mguzd-0005Dk-V0; Sat, 30 Oct 2021 20:30:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mguzd-00014L-Ks; Sat, 30 Oct 2021 20:30:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mguzd-0006NB-KL; Sat, 30 Oct 2021 20:30:21 +0000
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
	bh=zXK67/tijakaXvUDcYFuqnM0w5ISs+n6PQ/7pz8rdIs=; b=vnlmnN+VnAfjaKH5xbXQ3vrSYi
	nmPh7jz1mXJaSPcwcsnGitWTA3RLc4UZ1EoP3C9LfEfVJ59MS4iFMtrFDNYtFB12fjJUuTi+sHtlx
	5myyafFc++aWADKmqJ/B+D+wt69Mw2dp9N9L4mWI58V/T6pklfubXttlnr3FECFukiK4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165948-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165948: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e7663fdd82a2bf934c51b66f4af3e4479b131923
X-Osstest-Versions-That:
    ovmf=1bc232aae32e812341f10c9b938350cd93308eee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 Oct 2021 20:30:21 +0000

flight 165948 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165948/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e7663fdd82a2bf934c51b66f4af3e4479b131923
baseline version:
 ovmf                 1bc232aae32e812341f10c9b938350cd93308eee

Last test of basis   165934  2021-10-29 08:11:27 Z    1 days
Testing same since   165948  2021-10-30 15:11:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>
  Kesavan Balakrishnan, ThiyaguX <thiyagux.kesavan.balakrishnan@intel.com>
  Thiyagu Kesavan Balakrishnan <thiyagux.kesavan.balakrishnan@intel.com>

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
   1bc232aae3..e7663fdd82  e7663fdd82a2bf934c51b66f4af3e4479b131923 -> xen-tested-master

