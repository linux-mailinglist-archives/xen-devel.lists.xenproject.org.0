Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D75422014
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 10:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202082.356752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfQM-0002mp-SS; Tue, 05 Oct 2021 08:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202082.356752; Tue, 05 Oct 2021 08:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfQM-0002kq-P4; Tue, 05 Oct 2021 08:03:42 +0000
Received: by outflank-mailman (input) for mailman id 202082;
 Tue, 05 Oct 2021 08:03:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXfQL-0002kf-4H; Tue, 05 Oct 2021 08:03:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXfQK-00079V-U9; Tue, 05 Oct 2021 08:03:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXfQK-0005LF-FN; Tue, 05 Oct 2021 08:03:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mXfQK-0000uI-CR; Tue, 05 Oct 2021 08:03:40 +0000
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
	bh=kOQssv/EZopwyK61CLY2VnM4w4ORRyKgl8NPPBU0ToE=; b=Pf7+/vKtz+ewiPkThULqv3PkZ6
	IaMxZk1TF/iklqEi6bRzgrGrGcY0duUMzL9c8vWryaM86WABhMnerPI/CL1/xpgj7XhW+8rbGrOcu
	QVc4jcJI963IV9AFmARtp1ynO+DeTn39cmEzcDXT95iKo68KcOijg8j+jrCjfv+b26p0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165347-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165347: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4cc1458dbe004b1d70534caa55f475f6d19fe14a
X-Osstest-Versions-That:
    ovmf=442e46d3b6c1931b54111c92e0efb5a797bc622b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Oct 2021 08:03:40 +0000

flight 165347 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165347/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4cc1458dbe004b1d70534caa55f475f6d19fe14a
baseline version:
 ovmf                 442e46d3b6c1931b54111c92e0efb5a797bc622b

Last test of basis   165321  2021-09-29 20:41:38 Z    5 days
Testing same since   165347  2021-10-04 12:43:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>
  Guo Dong <guo.dong@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Kun Qin <kuqin12@gmail.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>

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
   442e46d3b6..4cc1458dbe  4cc1458dbe004b1d70534caa55f475f6d19fe14a -> xen-tested-master

