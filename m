Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6DF649014
	for <lists+xen-devel@lfdr.de>; Sat, 10 Dec 2022 18:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458590.716406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p447T-0002TN-CC; Sat, 10 Dec 2022 17:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458590.716406; Sat, 10 Dec 2022 17:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p447T-0002R5-9S; Sat, 10 Dec 2022 17:58:39 +0000
Received: by outflank-mailman (input) for mailman id 458590;
 Sat, 10 Dec 2022 17:58:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p447R-0002Qv-JK; Sat, 10 Dec 2022 17:58:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p447R-0008DS-Gy; Sat, 10 Dec 2022 17:58:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p447R-0005mA-5b; Sat, 10 Dec 2022 17:58:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p447R-000564-3a; Sat, 10 Dec 2022 17:58:37 +0000
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
	bh=+U7YSBEuJ1gWaek9CjSGtVY00tKb2nB3z2OAF0kk3CE=; b=08a9oyq8vdbyzE36+BRQnna+vI
	JqK5Zx1uTL+dNJ7nlzkNCSppErdxoYW0EcGYVERIFZzQ6JTrXkeJ98L/QG5kLyINcU9qjs0dUwNaf
	VWJLuQDewu2wPOViy8ppnOVvZLzptsNlALzlsaf8A424/MmrEpnrSdeDUPp69JR09LKw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175142-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175142: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4cb94f20b002c99dd2b4b75f07c5495b81a34ffd
X-Osstest-Versions-That:
    ovmf=1ef86f12014c19e7bd6b2f008e868c61b5c71878
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Dec 2022 17:58:37 +0000

flight 175142 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175142/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4cb94f20b002c99dd2b4b75f07c5495b81a34ffd
baseline version:
 ovmf                 1ef86f12014c19e7bd6b2f008e868c61b5c71878

Last test of basis   175124  2022-12-09 14:10:43 Z    1 days
Testing same since   175142  2022-12-10 16:10:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   1ef86f1201..4cb94f20b0  4cb94f20b002c99dd2b4b75f07c5495b81a34ffd -> xen-tested-master

