Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C2303ACB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 11:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74820.134511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4LxO-0008D3-H0; Tue, 26 Jan 2021 10:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74820.134511; Tue, 26 Jan 2021 10:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4LxO-0008CR-CR; Tue, 26 Jan 2021 10:52:22 +0000
Received: by outflank-mailman (input) for mailman id 74820;
 Tue, 26 Jan 2021 10:52:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4LxM-0008C8-Vj; Tue, 26 Jan 2021 10:52:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4LxM-00043u-Ky; Tue, 26 Jan 2021 10:52:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l4LxM-0005kE-9P; Tue, 26 Jan 2021 10:52:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l4LxM-0006Dj-8x; Tue, 26 Jan 2021 10:52:20 +0000
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
	bh=p1+bR92X2RVKpEEVTJxcAuBwPbrl7LJ+8QPg+aMeIEU=; b=lveT609pnLpURqhAOtnkUtH5Pe
	28j0zJrjZcH2CtzZ5/wasVkROod8jEjInEp+LtTafVWX7q7zKYEtUFovDuH6YtUdL/DoU40wtvOiD
	Iwz06p6BSozugWrthHsYka2wmDokxSN77CwuwB1rUupTGUHFwISPyy2t1onMD2/VuMQE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158620-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158620: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3a3501862f73095059bb05cc28147c8e899488f2
X-Osstest-Versions-That:
    ovmf=96a9acfc527964dc5ab7298862a0cd8aa5fffc6a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Jan 2021 10:52:20 +0000

flight 158620 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158620/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3a3501862f73095059bb05cc28147c8e899488f2
baseline version:
 ovmf                 96a9acfc527964dc5ab7298862a0cd8aa5fffc6a

Last test of basis   158608  2021-01-25 02:39:45 Z    1 days
Testing same since   158620  2021-01-26 00:41:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tom Lendacky <thomas.lendacky@amd.com>

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
   96a9acfc52..3a3501862f  3a3501862f73095059bb05cc28147c8e899488f2 -> xen-tested-master

