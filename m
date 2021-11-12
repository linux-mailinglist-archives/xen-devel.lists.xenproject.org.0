Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D20244E986
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 16:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225288.389055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlY7D-0003PR-TF; Fri, 12 Nov 2021 15:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225288.389055; Fri, 12 Nov 2021 15:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlY7D-0003NS-Nn; Fri, 12 Nov 2021 15:05:19 +0000
Received: by outflank-mailman (input) for mailman id 225288;
 Fri, 12 Nov 2021 15:05:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlY7B-0003NG-Ss; Fri, 12 Nov 2021 15:05:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlY7B-0002Qj-KP; Fri, 12 Nov 2021 15:05:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mlY7B-0000SA-DF; Fri, 12 Nov 2021 15:05:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mlY7B-0005TI-Cg; Fri, 12 Nov 2021 15:05:17 +0000
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
	bh=1oAfRePKrsNJAxlBI5OQA2d7vQnja5oGpHsVYQ8mwEY=; b=X5btywkjat3JGNDDZn060qkwNS
	GafIV31/4ODe4dicvwvb1wYxdv0aDjsh7WzL0kxu2GBjO8pE9wPkJbcPU/0qq5r3IoQlUY6/tliKC
	gzADUMnu7SZyf6BA/RXTzu0J79+uvLoEqjc+08eZ23CqnjItZUK6E7fn06u16LWqO0is=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166126-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166126: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=466ebdd2e0919c1538d03cd59833704bd5e1c028
X-Osstest-Versions-That:
    ovmf=4c495e5e3d387b26e1f22d708ff707eee6898c17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Nov 2021 15:05:17 +0000

flight 166126 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166126/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 466ebdd2e0919c1538d03cd59833704bd5e1c028
baseline version:
 ovmf                 4c495e5e3d387b26e1f22d708ff707eee6898c17

Last test of basis   166123  2021-11-12 07:27:21 Z    0 days
Testing same since   166126  2021-11-12 10:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dandan Bi <dandan.bi@intel.com>

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
   4c495e5e3d..466ebdd2e0  466ebdd2e0919c1538d03cd59833704bd5e1c028 -> xen-tested-master

