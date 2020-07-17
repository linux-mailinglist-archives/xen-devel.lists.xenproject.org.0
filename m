Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9EE2232D6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 07:19:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwIlZ-0006nj-Rp; Fri, 17 Jul 2020 05:18:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKPa=A4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jwIlY-0006ne-J8
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 05:18:36 +0000
X-Inumbo-ID: f4f5151e-c7ec-11ea-958a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4f5151e-c7ec-11ea-958a-12813bfff9fa;
 Fri, 17 Jul 2020 05:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ii/Oogwn5FuGGClEL/50opsfGSsDdd55F54LSvsadhM=; b=GHGubMQKqvv/c7SGbCzTnAcX+
 dVrwatiPdiGDDBwnrHdFE0msXn2pQZHL+9dhhwbz0NJDv4UYEhRP8k1agTIw0GKj7H1uOTySkVwgl
 9mlkyk9xmoIhJHSvQh7QMvHvsqsWvelLN1HjmSXTf84IDRq2glL3m7b8iRcZfMIn/0WfI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwIlT-0004HU-Ro; Fri, 17 Jul 2020 05:18:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwIlT-0002u3-IN; Fri, 17 Jul 2020 05:18:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jwIlT-0005uL-Hf; Fri, 17 Jul 2020 05:18:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151946: all pass
X-Osstest-Versions-This: ovmf=21a23e6966c2eb597a8db98d6837a4c01b3cad4a
X-Osstest-Versions-That: ovmf=d9269d69138860edb1ec9796ed48549dc6ba5735
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Jul 2020 05:18:31 +0000
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

flight 151946 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151946/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21a23e6966c2eb597a8db98d6837a4c01b3cad4a
baseline version:
 ovmf                 d9269d69138860edb1ec9796ed48549dc6ba5735

Last test of basis   151937  2020-07-16 04:25:27 Z    1 days
Testing same since   151946  2020-07-16 17:27:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dandan Bi <dandan.bi@intel.com>
  Vin Xue <vinxue@outlook.com>

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
 ! [rejected]              21a23e6966c2eb597a8db98d6837a4c01b3cad4a -> xen-tested-master (needs force)
error: failed to push some refs to 'osstest@xenbits.xen.org:/home/xen/git/osstest/ovmf.git'
hint: You cannot update a remote ref that points at a non-commit object,
hint: or update a remote ref to make it point at a non-commit object,
hint: without using the '--force' option.
------------------------------------------------------------
commit 21a23e6966c2eb597a8db98d6837a4c01b3cad4a
Author: Vin Xue <vinxue@outlook.com>
Date:   Tue Jul 14 10:09:35 2020 +0800

    SignedCapsulePkg: Address NULL pointer dereference case.
    
    Original code GetFmpImageDescriptors for OriginalFmpImageInfoBuf
    pointer, if failed, return a NULL pointer. The OriginalFmpImageInfoBuf
    should not be NULL and the NULL pointer dereference case
    should be false positive.
    
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Chao Zhang <chao.b.zhang@intel.com>
    Signed-off-by: Vin Xue <vinxue@outlook.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 1da651cdb77f42787e55da5a8f85e61d5258824f
Author: Dandan Bi <dandan.bi@intel.com>
Date:   Fri Nov 1 14:41:23 2019 +0800

    MdeModulePkg/DisplayEngine: Add Debug message to show mismatch menu info
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2326
    
    Currently when meet mismatch case for one-of and ordered-list
    menu, just show a popup window to indicate mismatch, no more
    info for debugging. This patch is to add more debug message
    about mismatch menu info which is helpful to debug.
    
    Cc: Liming Gao <liming.gao@intel.com>
    Cc: Eric Dong <eric.dong@intel.com>
    Cc: Laszlo Ersek <lersek@redhat.com>
    Signed-off-by: Dandan Bi <dandan.bi@intel.com>
    Reviewed-by: Eric Dong <eric.dong@intel.com>

