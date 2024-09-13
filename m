Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A6978BFE
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 01:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798506.1208722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spG6l-0007Bw-KX; Fri, 13 Sep 2024 23:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798506.1208722; Fri, 13 Sep 2024 23:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spG6l-00079P-HZ; Fri, 13 Sep 2024 23:53:47 +0000
Received: by outflank-mailman (input) for mailman id 798506;
 Fri, 13 Sep 2024 23:53:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spG6j-00079F-Gt; Fri, 13 Sep 2024 23:53:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spG6j-0001k1-EG; Fri, 13 Sep 2024 23:53:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spG6i-0002Ul-VL; Fri, 13 Sep 2024 23:53:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1spG6i-0002XC-Us; Fri, 13 Sep 2024 23:53:44 +0000
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
	bh=Sv9wqMMO21JFJfcFHwJ8s82TVHqNAoeDhEJS1DO0FT0=; b=Oi8EUHrolLdHdiCMstg6EiR0eY
	E3AmNdFGbo6K9nNgbTFwZdOLgOWkJfyUY4IoNg7dvLHFQPzvaFa1FxPaQwF+DjiOMY2Ly3/XzsJH8
	pw5O6eDNtXBWhrNDagBlWH7zkifuA/bmG2c9eVCzR1bTGgSvNdxdhpTSWQ9eOyv4d+38=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187699-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187699: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=121af960e2ac152be2c441837595a4c6e2a143f5
X-Osstest-Versions-That:
    ovmf=ec18fa81d311663e24e9b9ad61b90b38862a1ea8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 23:53:44 +0000

flight 187699 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187699/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 121af960e2ac152be2c441837595a4c6e2a143f5
baseline version:
 ovmf                 ec18fa81d311663e24e9b9ad61b90b38862a1ea8

Last test of basis   187697  2024-09-13 19:15:09 Z    0 days
Testing same since   187699  2024-09-13 21:11:48 Z    0 days    1 attempts

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
   ec18fa81d3..121af960e2  121af960e2ac152be2c441837595a4c6e2a143f5 -> xen-tested-master

