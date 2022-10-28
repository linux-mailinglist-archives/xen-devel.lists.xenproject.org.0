Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B764610F66
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431921.684582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNDL-0000Mj-Ps; Fri, 28 Oct 2022 11:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431921.684582; Fri, 28 Oct 2022 11:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNDL-0000K8-NA; Fri, 28 Oct 2022 11:07:51 +0000
Received: by outflank-mailman (input) for mailman id 431921;
 Fri, 28 Oct 2022 11:07:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooNDK-0000Jy-LG; Fri, 28 Oct 2022 11:07:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooNDK-0001GO-J1; Fri, 28 Oct 2022 11:07:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooNDJ-0002cZ-SM; Fri, 28 Oct 2022 11:07:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ooNDJ-0003Sw-Ru; Fri, 28 Oct 2022 11:07:49 +0000
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
	bh=bmszWbCS3gbI4Phgdz3sNskoqjs9uOTi27GEZwXaCTI=; b=jbbJxseaOwGuTXK4ilWmT2IYcO
	6sdrKjI/1kc4neGxDF0vSPtF3kN7ifyK+j5gam61wNsAxeyFtGxL+TqlZn9/4RTn3G1q2G5Hqv9i9
	fT9vK7jhKikzeqqTKcS9na4p7X0te8vanU2pWYrxlQ+OLFpLFR8oYnK2hnDwtHbVhHcg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174528-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174528: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d98efb468211ab508710eac91761238e1f5c1d51
X-Osstest-Versions-That:
    ovmf=99338ef81ed6e48be57f71c01af85fbbdd7030ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Oct 2022 11:07:49 +0000

flight 174528 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174528/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d98efb468211ab508710eac91761238e1f5c1d51
baseline version:
 ovmf                 99338ef81ed6e48be57f71c01af85fbbdd7030ed

Last test of basis   174512  2022-10-27 17:10:28 Z    0 days
Testing same since   174528  2022-10-28 09:11:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Tan, Dun <dun.tan@intel.com>

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
   99338ef81e..d98efb4682  d98efb468211ab508710eac91761238e1f5c1d51 -> xen-tested-master

