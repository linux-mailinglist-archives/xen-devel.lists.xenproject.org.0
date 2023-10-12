Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF8A7C67C2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 10:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615744.957149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqrFF-000860-Fd; Thu, 12 Oct 2023 08:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615744.957149; Thu, 12 Oct 2023 08:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqrFF-00085E-Bz; Thu, 12 Oct 2023 08:40:37 +0000
Received: by outflank-mailman (input) for mailman id 615744;
 Thu, 12 Oct 2023 08:40:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqrFE-000854-0m; Thu, 12 Oct 2023 08:40:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqrFD-0000RC-Uz; Thu, 12 Oct 2023 08:40:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqrFD-0005hQ-G0; Thu, 12 Oct 2023 08:40:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qqrFD-0007lO-FX; Thu, 12 Oct 2023 08:40:35 +0000
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
	bh=nTw2BJM/54LDAf7YhTfGW5mnY460jsufAAuzxfYOeJY=; b=SW8q+e9xTriIM30qzdNhFrlR2G
	qen04L9u30wbf4ckjPryViKX+ynKxVjeQ8lrQgOtaLZknHsXXc9Z1cHvrvY0pE633yfb/c0zY/sxu
	L+ItykzkrJxypRsY1dSunJ4/nAiiWM2WcAaYu9CIBFHBFSdXJBNtZ1cCpdToJ2WzDoRU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183352-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183352: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eebd446875a4b1e4879e03764f63c6c358fd64f5
X-Osstest-Versions-That:
    ovmf=95c9f470ca6eab23bfd016bd438f932d7263d395
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Oct 2023 08:40:35 +0000

flight 183352 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183352/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eebd446875a4b1e4879e03764f63c6c358fd64f5
baseline version:
 ovmf                 95c9f470ca6eab23bfd016bd438f932d7263d395

Last test of basis   183339  2023-10-11 05:10:50 Z    1 days
Testing same since   183352  2023-10-12 05:42:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   95c9f470ca..eebd446875  eebd446875a4b1e4879e03764f63c6c358fd64f5 -> xen-tested-master

