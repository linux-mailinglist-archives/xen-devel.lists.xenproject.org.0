Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF933F9E2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 21:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98791.187625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMccI-000346-Vd; Wed, 17 Mar 2021 20:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98791.187625; Wed, 17 Mar 2021 20:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMccI-00033c-Rn; Wed, 17 Mar 2021 20:18:06 +0000
Received: by outflank-mailman (input) for mailman id 98791;
 Wed, 17 Mar 2021 20:18:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMccH-00033B-Pc; Wed, 17 Mar 2021 20:18:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMccH-0005lB-Hp; Wed, 17 Mar 2021 20:18:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMccH-0000sx-9Y; Wed, 17 Mar 2021 20:18:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMccH-0005WN-95; Wed, 17 Mar 2021 20:18:05 +0000
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
	bh=bCx+8gkA5FJcKZxM1irBIzX0WiMv4/RPZvBENqPo5pQ=; b=fW4QQAbSTJZPqcxCzoGrr/5x1a
	ih1T5W2vd2KAvIb7pbkLq4CSbQDZsgDRRb4VZwAtMgzzfLJcrPSXKfmL2R/uHXe41J8xah0U+W46h
	+Gy4VGydn3xXDLMp66rXckUadp6m9Zf4s4kZ1VMYrhixcvYQLPeqiWLZVTbyqBE5diik=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e4ff3773b711527ff46759759f34ea1cb9ff2a45
X-Osstest-Versions-That:
    ovmf=2e51b27fed31eb7b2a2cb4245806c8c7859207f7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Mar 2021 20:18:05 +0000

flight 160114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e4ff3773b711527ff46759759f34ea1cb9ff2a45
baseline version:
 ovmf                 2e51b27fed31eb7b2a2cb4245806c8c7859207f7

Last test of basis   160106  2021-03-17 04:11:49 Z    0 days
Testing same since   160114  2021-03-17 11:39:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>
  Lou, Yun <Yun.Lou@intel.com>

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
   2e51b27fed..e4ff3773b7  e4ff3773b711527ff46759759f34ea1cb9ff2a45 -> xen-tested-master

