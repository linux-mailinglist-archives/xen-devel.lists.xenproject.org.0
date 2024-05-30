Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340048D45BB
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 09:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732482.1138469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCZpt-0006gS-FC; Thu, 30 May 2024 07:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732482.1138469; Thu, 30 May 2024 07:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCZpt-0006dr-Be; Thu, 30 May 2024 07:04:29 +0000
Received: by outflank-mailman (input) for mailman id 732482;
 Thu, 30 May 2024 07:04:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCZpr-0006dh-Sd; Thu, 30 May 2024 07:04:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCZpr-00017j-Qk; Thu, 30 May 2024 07:04:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCZpr-0001Dc-AO; Thu, 30 May 2024 07:04:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCZpr-0000Ys-9t; Thu, 30 May 2024 07:04:27 +0000
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
	bh=NzT/L3YNx7mJPsPSPoclm3ulW4yQgJh/3hS9Akuglf8=; b=bGqpKwy7lzbNLqsLyFNxz3TI/R
	VSlssCAguHuY+U5hRHrjVthDWUQTUkf+DVw9BAEOJiqyayuoJQzXhDfA5xGn7E6h2x7Ru2F9JRWV1
	ZuXOYCQkmDwcEix7Cm9atnI4IZAkmbjiBQpRehfoYACp4OUaZQvLcwH61GJshkcM8vP8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186191-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186191: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=843f2d0964bd0444fa6bdbb1ee79dc838cfa4452
X-Osstest-Versions-That:
    ovmf=30b6d08e27c767ba9756a244099d73c826abcc8d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 07:04:27 +0000

flight 186191 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186191/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 843f2d0964bd0444fa6bdbb1ee79dc838cfa4452
baseline version:
 ovmf                 30b6d08e27c767ba9756a244099d73c826abcc8d

Last test of basis   186188  2024-05-30 02:30:18 Z    0 days
Testing same since   186191  2024-05-30 04:41:08 Z    0 days    1 attempts

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
   30b6d08e27..843f2d0964  843f2d0964bd0444fa6bdbb1ee79dc838cfa4452 -> xen-tested-master

