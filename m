Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293277BE93
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 19:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583764.914068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVawb-00068I-67; Mon, 14 Aug 2023 17:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583764.914068; Mon, 14 Aug 2023 17:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVawb-00066C-2T; Mon, 14 Aug 2023 17:01:29 +0000
Received: by outflank-mailman (input) for mailman id 583764;
 Mon, 14 Aug 2023 17:01:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qVawZ-000662-IT; Mon, 14 Aug 2023 17:01:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qVawZ-0004jI-Gi; Mon, 14 Aug 2023 17:01:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qVawZ-0000Ge-4j; Mon, 14 Aug 2023 17:01:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qVawZ-0007TD-4N; Mon, 14 Aug 2023 17:01:27 +0000
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
	bh=Ot7dwBiU7yvkyYZvIxbGOSrJafv/9EupBAVBWlXUbGA=; b=NeNpMw805mLfUXnrT42iIppzYE
	bzuFNOpxQ8SwGQmO0uarcXTsavnzL4LCvBXKaHUColn/QOjloTLm1NGsW2mWp5zM9i5wR31oFZr94
	AAvFrtGkRjY6BWuFIALHpiq1c/65GHhjg7VhkbUEb1Uaf582jL/ukMsKF1oLVfN5q2DI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182331-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182331: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=eaffa1d7ff915d5af484e5e230a4dde41e4b9a00
X-Osstest-Versions-That:
    ovmf=991515a0583f65a64b3a6fa354409c64e670a762
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Aug 2023 17:01:27 +0000

flight 182331 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182331/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 eaffa1d7ff915d5af484e5e230a4dde41e4b9a00
baseline version:
 ovmf                 991515a0583f65a64b3a6fa354409c64e670a762

Last test of basis   182249  2023-08-09 15:12:45 Z    5 days
Testing same since   182331  2023-08-14 15:12:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
  YuanhaoXie <yuanhao.xie@intel.com>

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
   991515a058..eaffa1d7ff  eaffa1d7ff915d5af484e5e230a4dde41e4b9a00 -> xen-tested-master

