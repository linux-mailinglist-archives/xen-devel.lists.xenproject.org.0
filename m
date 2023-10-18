Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F17CE7F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 21:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618772.962852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtCQz-0001Tm-32; Wed, 18 Oct 2023 19:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618772.962852; Wed, 18 Oct 2023 19:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtCQy-0001S5-W4; Wed, 18 Oct 2023 19:42:24 +0000
Received: by outflank-mailman (input) for mailman id 618772;
 Wed, 18 Oct 2023 19:42:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtCQx-0001Rv-Ir; Wed, 18 Oct 2023 19:42:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtCQx-0007zf-Fb; Wed, 18 Oct 2023 19:42:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtCQx-0007Ch-49; Wed, 18 Oct 2023 19:42:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qtCQx-0005fv-3e; Wed, 18 Oct 2023 19:42:23 +0000
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
	bh=1LmwyM5MrQRqa8RmiMDjux/9/ntl7klaFYCOlFllLC4=; b=6hTxPu2mtQ7TiyxBUdOt1nc5NF
	ztK9V/Zj+h5fz2mh0zzvl2R2LtY0q3TKaV6IkDqByDctNhKoPIxD5kTkftkyzw9KGcd59C7Ih0EmG
	CV39433OtPbuVErcYPPEsq6laIlJPmrxFXWmXQpqs5hVzmmhDe3p6yb4m7igv5VN4okg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183417-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183417: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7fe49887c4d227e585d5aa5530ee8a8d79d5fa1e
X-Osstest-Versions-That:
    ovmf=747a08eae26bda91c53d232d3bd65946183693d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Oct 2023 19:42:23 +0000

flight 183417 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183417/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7fe49887c4d227e585d5aa5530ee8a8d79d5fa1e
baseline version:
 ovmf                 747a08eae26bda91c53d232d3bd65946183693d0

Last test of basis   183414  2023-10-18 15:13:54 Z    0 days
Testing same since   183417  2023-10-18 17:42:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   747a08eae2..7fe49887c4  7fe49887c4d227e585d5aa5530ee8a8d79d5fa1e -> xen-tested-master

