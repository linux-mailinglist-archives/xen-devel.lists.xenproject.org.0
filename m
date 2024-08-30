Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A02966342
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 15:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786459.1196049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk1u1-0005lx-Ju; Fri, 30 Aug 2024 13:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786459.1196049; Fri, 30 Aug 2024 13:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk1u1-0005jh-Fa; Fri, 30 Aug 2024 13:43:01 +0000
Received: by outflank-mailman (input) for mailman id 786459;
 Fri, 30 Aug 2024 13:42:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk1tz-0005jX-JF; Fri, 30 Aug 2024 13:42:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk1tz-0005oY-C5; Fri, 30 Aug 2024 13:42:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk1tz-0001zW-3i; Fri, 30 Aug 2024 13:42:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sk1tz-0002h3-3J; Fri, 30 Aug 2024 13:42:59 +0000
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
	bh=4psqGSEK+5RxWSoCbvsOvj8QaZFjvkI4NpDb3u8zQ9M=; b=x0Kn2yadYCX3JdqbajesOs5cyO
	9RSTwSwlWEMSVJtk/s/euZxqo3bF4vDuw6ZWACSznMiRft5r7rvhhsuHsiatlj+qbiLYjfXr0VUk4
	wDUmhb/fJDMpDItWOL1ygvqhJTyoWIu9AxfNagiSkfdRwDtPF18D4ouhAYjYg6VVG7s0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187420-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187420: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f31aa47deea9239d61b41fda8d445ecf607fcef9
X-Osstest-Versions-That:
    ovmf=a63a7dbf85963d0c11617173b117ca9edb645875
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 13:42:59 +0000

flight 187420 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187420/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f31aa47deea9239d61b41fda8d445ecf607fcef9
baseline version:
 ovmf                 a63a7dbf85963d0c11617173b117ca9edb645875

Last test of basis   187419  2024-08-30 10:15:25 Z    0 days
Testing same since   187420  2024-08-30 12:14:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Fish <afish@apple.com>
  Xiaoqiang Zhang <xiaoqiang.zhang@intel.com>

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
   a63a7dbf85..f31aa47dee  f31aa47deea9239d61b41fda8d445ecf607fcef9 -> xen-tested-master

