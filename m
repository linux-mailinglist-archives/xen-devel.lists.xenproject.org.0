Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B788426E29
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 17:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204806.359981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYsC2-0006oR-94; Fri, 08 Oct 2021 15:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204806.359981; Fri, 08 Oct 2021 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYsC2-0006lx-5b; Fri, 08 Oct 2021 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 204806;
 Fri, 08 Oct 2021 15:53:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mYsC0-0006lm-JR; Fri, 08 Oct 2021 15:53:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mYsC0-0006jy-9l; Fri, 08 Oct 2021 15:53:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mYsBz-0007Dr-Uy; Fri, 08 Oct 2021 15:53:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mYsBz-0005WY-UR; Fri, 08 Oct 2021 15:53:51 +0000
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
	bh=Mdx73NdlYfSrAlh5KGXEqPwLUENJSZsgFsy78HEjaIo=; b=EROUw9NSf3YI1OtAALgIjXI+0e
	U8u7Xs4JK1sBDbwqeuB3beOfwGqydEoyZfA9NICE2ElBqa8SNr9ii5ZChK2B7bc2eF5eDpO7XTK3S
	u7+yPhbDHgZszS82Iy6Zqaoe20eUiktGyga7+U/d8u5ujIENpvnSxQFHb2/HUBVuy/F0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165425-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165425: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5ece2ad36caa7ddc62d4954559b2cdd0d8a40a14
X-Osstest-Versions-That:
    ovmf=b4da6c29f1d36031e04212f53277ce0dcba309f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Oct 2021 15:53:51 +0000

flight 165425 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165425/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5ece2ad36caa7ddc62d4954559b2cdd0d8a40a14
baseline version:
 ovmf                 b4da6c29f1d36031e04212f53277ce0dcba309f1

Last test of basis   165398  2021-10-06 11:41:16 Z    2 days
Testing same since   165425  2021-10-08 07:12:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hua Ma <hua.ma@intel.com>

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
   b4da6c29f1..5ece2ad36c  5ece2ad36caa7ddc62d4954559b2cdd0d8a40a14 -> xen-tested-master

