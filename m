Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E687CED1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 15:29:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693891.1082544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8XN-0001IR-B1; Fri, 15 Mar 2024 14:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693891.1082544; Fri, 15 Mar 2024 14:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8XN-0001Gd-7k; Fri, 15 Mar 2024 14:27:57 +0000
Received: by outflank-mailman (input) for mailman id 693891;
 Fri, 15 Mar 2024 14:27:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rl8XM-0001GT-5j; Fri, 15 Mar 2024 14:27:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rl8XL-0003sI-Tv; Fri, 15 Mar 2024 14:27:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rl8XL-0002OC-J1; Fri, 15 Mar 2024 14:27:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rl8XL-0001D9-Ih; Fri, 15 Mar 2024 14:27:55 +0000
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
	bh=jigkvZ2WWAncg2z3mz1A15Yyc65W3oXzR6d035AaN/8=; b=EFqN3FsvwSzKyMK4IshNqYry5F
	yOH2EJHBUD+7c6iXlyQ6AI59rhUtjvQY+uOLx98o174WzjI4ileS93Iual9h1IlzAU0iE0Xtg1wng
	dEaCF5T91IikQaoPzQWejSNuHOp0lUVjV1gKftscvkNRh4mnzuS7cykbLw+MwiPbMX6g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185049-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185049: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3840c35e34d1c992268092b6366e26f2acc55a75
X-Osstest-Versions-That:
    ovmf=ccbbc2a5c84a0330b28b726ef0936fc16937005a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Mar 2024 14:27:55 +0000

flight 185049 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185049/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3840c35e34d1c992268092b6366e26f2acc55a75
baseline version:
 ovmf                 ccbbc2a5c84a0330b28b726ef0936fc16937005a

Last test of basis   185047  2024-03-15 09:11:16 Z    0 days
Testing same since   185049  2024-03-15 12:41:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Du Lin <du.lin@intel.com>

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
   ccbbc2a5c8..3840c35e34  3840c35e34d1c992268092b6366e26f2acc55a75 -> xen-tested-master

