Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEB8AC6FB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 10:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709800.1108802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryp1Y-0004Cr-J4; Mon, 22 Apr 2024 08:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709800.1108802; Mon, 22 Apr 2024 08:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryp1Y-0004BK-G1; Mon, 22 Apr 2024 08:27:40 +0000
Received: by outflank-mailman (input) for mailman id 709800;
 Mon, 22 Apr 2024 08:27:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryp1X-0004B8-2o; Mon, 22 Apr 2024 08:27:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryp1W-0001Qh-Tg; Mon, 22 Apr 2024 08:27:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryp1W-0008Mz-JN; Mon, 22 Apr 2024 08:27:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ryp1W-00062S-Ij; Mon, 22 Apr 2024 08:27:38 +0000
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
	bh=J76eXUpKVqbIinfr1am+lDqK4Igv4GNZmfBcJtOdwbg=; b=ZCTYZVZm4yt6IeG9gk1w9jsQCG
	8RXCqa6ktCwVUSnS90Z4WkFd1h4lF8xZeung/AC6RTAWr3qnwNqpkksbJy4pFzQ/1rnFT/JApiyZc
	SJltH+yuwVw2LbvfHC7iyKFtQxixl+PUi0vVSiLi30xoLA9d052M7Sap3xOugVFaGVKQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185756-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185756: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=be92e09206c2e4bb388e7c9127f048689841dd01
X-Osstest-Versions-That:
    ovmf=6780b3aba086395341d8476d43bef5e15c662c3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Apr 2024 08:27:38 +0000

flight 185756 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185756/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 be92e09206c2e4bb388e7c9127f048689841dd01
baseline version:
 ovmf                 6780b3aba086395341d8476d43bef5e15c662c3a

Last test of basis   185745  2024-04-20 08:41:14 Z    1 days
Testing same since   185756  2024-04-22 03:19:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   6780b3aba0..be92e09206  be92e09206c2e4bb388e7c9127f048689841dd01 -> xen-tested-master

