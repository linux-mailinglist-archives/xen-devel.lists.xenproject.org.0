Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80E199307
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:01:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDeA-0004ou-Mv; Tue, 31 Mar 2020 09:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebgM=5Q=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jJDe9-0004op-5g
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 09:57:25 +0000
X-Inumbo-ID: 0220b60a-7336-11ea-ba08-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0220b60a-7336-11ea-ba08-12813bfff9fa;
 Tue, 31 Mar 2020 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HzZjOyGzJgfS1c1k0r7b4hlb77AloDxc7Hwa2M3+Ajk=; b=ESvsAaoHptzHV0aymybAzcdv7
 H7RC4d1DAJHs8bS74yzDbw97lyj3Q6pAJa7f/4nwfGgo/rCLE14c2kGhbUuS1grozLzTO7t5w3W9c
 lbRdF5OY9LpnjfkiFdZL4LobeTVUND5mLhEeB2ouzLLpKU52lUJs6Qsoljims2zPXIKFM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJDe2-0001Zm-Od; Tue, 31 Mar 2020 09:57:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJDe2-00010T-F0; Tue, 31 Mar 2020 09:57:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jJDe2-0003IG-EL; Tue, 31 Mar 2020 09:57:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149207-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149207: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3000c2963db319d055f474c394b062af910bbb2f
X-Osstest-Versions-That: ovmf=d671d1fa48dbb3f22b68c1d67914c55ba1d58454
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Mar 2020 09:57:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149207 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149207/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3000c2963db319d055f474c394b062af910bbb2f
baseline version:
 ovmf                 d671d1fa48dbb3f22b68c1d67914c55ba1d58454

Last test of basis   149176  2020-03-29 17:13:07 Z    1 days
Testing same since   149207  2020-03-30 12:11:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  GuoMinJ <newexplorerj@gmail.com>
  Hao A Wu <hao.a.wu@intel.com>

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
   d671d1fa48..3000c2963d  3000c2963db319d055f474c394b062af910bbb2f -> xen-tested-master

