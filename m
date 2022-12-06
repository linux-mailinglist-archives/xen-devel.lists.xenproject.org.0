Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C7644E92
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455654.713192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gYw-0003LC-1D; Tue, 06 Dec 2022 22:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455654.713192; Tue, 06 Dec 2022 22:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gYv-0003Ip-Tc; Tue, 06 Dec 2022 22:37:17 +0000
Received: by outflank-mailman (input) for mailman id 455654;
 Tue, 06 Dec 2022 22:37:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2gYt-0003Ic-JD; Tue, 06 Dec 2022 22:37:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2gYt-0004Tw-Gj; Tue, 06 Dec 2022 22:37:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2gYt-00059P-5x; Tue, 06 Dec 2022 22:37:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p2gYt-0007cW-5S; Tue, 06 Dec 2022 22:37:15 +0000
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
	bh=jVFGlRCHQQjcx7RlfrMkmkvX+MW+dS4+9oQ41329fu4=; b=V00szKfWDAoiGR8TDfeV3Xb0/0
	mXfrX1x7KLiMBfFA89l/XPB3SrOfBEin+bGByV8LthKzQuCzKlqAEGXJGJgpFuJSLOXKPrtPdj4t5
	cyAWFsb06uEOqn0xkN4cvBKyInI9gJb+9VmppVriLb5IEX1lmmemvR7E97Y7o/u6W+O0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175064-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175064: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ca33daafc630a7952de482813dccd5202f005dbf
X-Osstest-Versions-That:
    ovmf=a639248bd0dd1f1ea0b020dd16aab8a7bb76ddd2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Dec 2022 22:37:15 +0000

flight 175064 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175064/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ca33daafc630a7952de482813dccd5202f005dbf
baseline version:
 ovmf                 a639248bd0dd1f1ea0b020dd16aab8a7bb76ddd2

Last test of basis   175059  2022-12-06 10:43:56 Z    0 days
Testing same since   175064  2022-12-06 20:42:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   a639248bd0..ca33daafc6  ca33daafc630a7952de482813dccd5202f005dbf -> xen-tested-master

