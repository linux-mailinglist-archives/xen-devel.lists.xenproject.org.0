Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738281DBE69
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 21:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbUky-0005BC-R6; Wed, 20 May 2020 19:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfT1=7C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbUkw-0005B7-R1
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 19:51:58 +0000
X-Inumbo-ID: 59dbbca4-9ad3-11ea-aa85-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59dbbca4-9ad3-11ea-aa85-12813bfff9fa;
 Wed, 20 May 2020 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AG4rOfxxnQToOdQUY/WXCChcFE1WfCX5Sod8W/RkDWk=; b=qAlM5U+PuJDaipZabi92YBsmq
 KKtZzwHGeUCpNOJGVyQFGS1gE6UIFx4kBKSoGifslVarE7wPDDR/kcoOdOs34iaWbGANOqxHBmtdA
 eePwDwXZH0tDyNbY5/SpFADBoIn/mk7GcwIrlWHDOJSZIlz/aDxNHyIEKV7/Sb655Wdts=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbUkp-0002Xj-Pf; Wed, 20 May 2020 19:51:51 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbUkp-0001Bc-Da; Wed, 20 May 2020 19:51:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbUkp-0004u4-Cs; Wed, 20 May 2020 19:51:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150278-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150278: all pass
X-Osstest-Versions-This: ovmf=d3733188a2162abf72dd08c0cedd1119b5cfe6c4
X-Osstest-Versions-That: ovmf=7b6327ff03bb4436261ffad246ba3a14de10391f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 May 2020 19:51:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150278 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150278/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d3733188a2162abf72dd08c0cedd1119b5cfe6c4
baseline version:
 ovmf                 7b6327ff03bb4436261ffad246ba3a14de10391f

Last test of basis   150232  2020-05-18 16:09:20 Z    2 days
Testing same since   150278  2020-05-20 13:10:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shenglei Zhang <shenglei.zhang@intel.com>
  Zhang, Shenglei <shenglei.zhang@intel.com>

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

ssh: Could not resolve hostname xenbits.xen.org: Temporary failure in name resolution
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
------------------------------------------------------------
commit d3733188a2162abf72dd08c0cedd1119b5cfe6c4
Author: Zhang, Shenglei <shenglei.zhang@intel.com>
Date:   Wed May 20 11:08:47 2020 +0800

    NetworkPkg/DxeNetLib: Change the order of conditions in IF statement
    
    The condition, NET_HEADSPACE(&(Nbuf->BlockOp[Index])) < Len, is
    meaningless if Index = 0. So checking 'Index != 0' should be
    performed first in the if statement.
    
    Cc: Maciej Rabeda <maciej.rabeda@linux.intel.com>
    Cc: Siyuan Fu <siyuan.fu@intel.com>
    Cc: Jiaxin Wu <jiaxin.wu@intel.com>
    Signed-off-by: Shenglei Zhang <shenglei.zhang@intel.com>
    Reviewed-by: Maciej Rabeda <maciej.rabeda@linux.intel.com>
    Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>

