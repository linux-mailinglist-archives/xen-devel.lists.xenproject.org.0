Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95086EE25
	for <lists+xen-devel@lfdr.de>; Sat,  2 Mar 2024 03:26:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687836.1071655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgF4M-0001Cz-BI; Sat, 02 Mar 2024 02:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687836.1071655; Sat, 02 Mar 2024 02:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgF4M-0001BF-8f; Sat, 02 Mar 2024 02:25:46 +0000
Received: by outflank-mailman (input) for mailman id 687836;
 Sat, 02 Mar 2024 02:25:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgF4L-0001B5-EX; Sat, 02 Mar 2024 02:25:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgF4L-00076s-Ai; Sat, 02 Mar 2024 02:25:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgF4L-0002W8-1F; Sat, 02 Mar 2024 02:25:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rgF4L-0006Bk-0u; Sat, 02 Mar 2024 02:25:45 +0000
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
	bh=lC9D1ywRGYTodlCZWIooFx7MwXDa0cCsKXbp6Paooq4=; b=yq4JplIeknsvi+by4WzmngmMpy
	YxcMI6nmRvu3+bJmtfmfVVo9/cDABQdN64AV/pX0cnmt8GB3NfNPlFV6D44UFL36WohS1TC0687o0
	6v33CIdV4jXT44WXd+ZB0KGQHf90w1xTpDTFJTwlmEGrWAEbMmsayunfZWo9dvU/WuYs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184836-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184836: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=275d0a39c42ad73a6e4929822f56f5d8c16ede96
X-Osstest-Versions-That:
    ovmf=dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 02 Mar 2024 02:25:45 +0000

flight 184836 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184836/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 275d0a39c42ad73a6e4929822f56f5d8c16ede96
baseline version:
 ovmf                 dc7cfa9bab7487aa0cec02d13aa8c34ff24b37a8

Last test of basis   184818  2024-02-29 10:11:15 Z    1 days
Testing same since   184836  2024-03-01 19:13:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Li, Zhihao <zhihao.li@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>
  Zhihao Li <zhihao.li@intel.com>
  Zhou Jianfeng <jianfeng.zhou@intel.com>

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
   dc7cfa9bab..275d0a39c4  275d0a39c42ad73a6e4929822f56f5d8c16ede96 -> xen-tested-master

