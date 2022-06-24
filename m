Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED1D55A21B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355891.583851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4pMc-0003pq-Fx; Fri, 24 Jun 2022 19:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355891.583851; Fri, 24 Jun 2022 19:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4pMc-0003nR-CG; Fri, 24 Jun 2022 19:53:10 +0000
Received: by outflank-mailman (input) for mailman id 355891;
 Fri, 24 Jun 2022 19:53:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4pMa-0003mu-SW; Fri, 24 Jun 2022 19:53:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4pMa-0006ch-Ri; Fri, 24 Jun 2022 19:53:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4pMa-0007NV-Ee; Fri, 24 Jun 2022 19:53:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o4pMa-0005lI-EE; Fri, 24 Jun 2022 19:53:08 +0000
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
	bh=lJA6zVmbx6cgQG0FurtmGLsNx/Kh1lC7WWzOE7VC0Is=; b=TI0Wvuaxoksnn0HAOEK847FGSX
	XM05MO6BRi/u2HKqp3Tngzy17Pd11ut0L4tPSgSq5Uc8t/7VF9/S/7Y8XqHDl5F3Y4EsYtCehghjV
	Xzh40cB1NOftYiiFVS8J46BwiKhqKoVkKJ1U8msE5PR+C6vDlpr9vAbFdDuC7qqdWCN8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171345-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171345: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=15b25045e6db2c82bc12973ed1629bbaeb3c0a57
X-Osstest-Versions-That:
    ovmf=2aee08c0b6bfb32d36bda17ab24645205a74df65
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Jun 2022 19:53:08 +0000

flight 171345 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171345/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 15b25045e6db2c82bc12973ed1629bbaeb3c0a57
baseline version:
 ovmf                 2aee08c0b6bfb32d36bda17ab24645205a74df65

Last test of basis   171343  2022-06-24 13:11:49 Z    0 days
Testing same since   171345  2022-06-24 18:13:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nicolas Ojeda Leon <ncoleon@amazon.com>

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
   2aee08c0b6..15b25045e6  15b25045e6db2c82bc12973ed1629bbaeb3c0a57 -> xen-tested-master

