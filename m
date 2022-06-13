Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A9C547E40
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 05:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347701.574037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0b69-0002eh-Gg; Mon, 13 Jun 2022 03:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347701.574037; Mon, 13 Jun 2022 03:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0b69-0002c7-DU; Mon, 13 Jun 2022 03:50:41 +0000
Received: by outflank-mailman (input) for mailman id 347701;
 Mon, 13 Jun 2022 03:50:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o0b67-0002bx-MC; Mon, 13 Jun 2022 03:50:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o0b67-00071q-Dj; Mon, 13 Jun 2022 03:50:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o0b66-0004VX-Vn; Mon, 13 Jun 2022 03:50:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o0b66-0004mT-V4; Mon, 13 Jun 2022 03:50:38 +0000
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
	bh=wxWMDLSpHIECUCq2baWJSEVx7d318XhJOjU0q6g82sQ=; b=3TOGplvHVpd5pLo3Z0lWMO+G/R
	NsLC05vMAP1qS/wMy/2xqiUxECh06wIanxSzLwXektJntmNFt0w0hZzQfX+W4YirpPdk+uffEL0Bj
	6ud/sn3yWa782Ihoy2X3zCZF4LhebrwJdLXfmItHjUvQDE+W2fQQwoDL0FcVXvndDV/k=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171150-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171150: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b09ada6edc7f3f28d3b4f2ef09852ebd39f17920
X-Osstest-Versions-That:
    ovmf=f0b97e165e0af79ac9eb3c6ac7697f9183afc7cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 Jun 2022 03:50:38 +0000

flight 171150 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171150/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b09ada6edc7f3f28d3b4f2ef09852ebd39f17920
baseline version:
 ovmf                 f0b97e165e0af79ac9eb3c6ac7697f9183afc7cb

Last test of basis   170964  2022-06-10 20:46:17 Z    2 days
Testing same since   171150  2022-06-13 01:41:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhihao Li <zhihao.li@intel.com>

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
   f0b97e165e..b09ada6edc  b09ada6edc7f3f28d3b4f2ef09852ebd39f17920 -> xen-tested-master

