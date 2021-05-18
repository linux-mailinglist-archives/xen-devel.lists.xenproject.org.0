Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBED3880C1
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 21:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129675.243270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj5ii-0005fS-1v; Tue, 18 May 2021 19:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129675.243270; Tue, 18 May 2021 19:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj5ih-0005cl-UO; Tue, 18 May 2021 19:49:35 +0000
Received: by outflank-mailman (input) for mailman id 129675;
 Tue, 18 May 2021 19:49:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5ig-0005cb-IP; Tue, 18 May 2021 19:49:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5ig-0002Dy-DR; Tue, 18 May 2021 19:49:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5ig-0006ci-5M; Tue, 18 May 2021 19:49:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5ig-0003Wr-4d; Tue, 18 May 2021 19:49:34 +0000
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
	bh=JZtH0e8Rw4RZKB0Ws14E1rcVROtNfae3zs+fJUPtzGk=; b=3HXDr6CghLZSvlV3SbLJRQ2amN
	Qs1UOA2OJpEM3HK0ZgCKvEpgArONaEjfltsKgo7Y/bUW+xqoNIIxcIjlm53CBywrAQl+EnNtpPkLl
	pUuqj0JndY/qxWX2kztVI9aNkp4QOKilTQVB1z0XM0uwkuNZsxUS6yCtUw0Sx8LbSaI0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162046-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162046: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=42ec0a315b8a2f445b7a7d74b8d78965f1dff8f6
X-Osstest-Versions-That:
    ovmf=29e300ff815283259e81822ed3cb926bb9ad6460
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 May 2021 19:49:34 +0000

flight 162046 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162046/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 42ec0a315b8a2f445b7a7d74b8d78965f1dff8f6
baseline version:
 ovmf                 29e300ff815283259e81822ed3cb926bb9ad6460

Last test of basis   162002  2021-05-18 08:10:25 Z    0 days
Testing same since   162046  2021-05-18 17:10:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   29e300ff81..42ec0a315b  42ec0a315b8a2f445b7a7d74b8d78965f1dff8f6 -> xen-tested-master

