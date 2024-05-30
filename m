Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C68D487A
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 11:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732589.1138579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCc6K-0002pu-Ll; Thu, 30 May 2024 09:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732589.1138579; Thu, 30 May 2024 09:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCc6K-0002nz-Iu; Thu, 30 May 2024 09:29:36 +0000
Received: by outflank-mailman (input) for mailman id 732589;
 Thu, 30 May 2024 09:29:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCc6J-0002np-JJ; Thu, 30 May 2024 09:29:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCc6J-000423-ET; Thu, 30 May 2024 09:29:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCc6J-0005cA-7Y; Thu, 30 May 2024 09:29:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCc6J-0002C3-7F; Thu, 30 May 2024 09:29:35 +0000
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
	bh=0ofYnzuvhnSLzV2/s9+A7Og4rysFWZWtQSWU79dp/fs=; b=vdbPjlIR209udAjwf32MJvjU62
	oJYq2f4owA7qUy2s/Nvw1caIUf5fUUCnjNdkDI+N9PMoL0a2xhOrHXSp/XehB9RHPRDlPLdk8vy8q
	uYz+QIeEZfzOsSr4B5wIGoGE9PM66Dc8oSxgoAVSMonOb4prbA/HWvroOOyUtxbhzypU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186193-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186193: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cd4cebabf5834c403c9d9ac4f162e8336024bbcd
X-Osstest-Versions-That:
    ovmf=843f2d0964bd0444fa6bdbb1ee79dc838cfa4452
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 09:29:35 +0000

flight 186193 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186193/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cd4cebabf5834c403c9d9ac4f162e8336024bbcd
baseline version:
 ovmf                 843f2d0964bd0444fa6bdbb1ee79dc838cfa4452

Last test of basis   186191  2024-05-30 04:41:08 Z    0 days
Testing same since   186193  2024-05-30 07:11:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   843f2d0964..cd4cebabf5  cd4cebabf5834c403c9d9ac4f162e8336024bbcd -> xen-tested-master

