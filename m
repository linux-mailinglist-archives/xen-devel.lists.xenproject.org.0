Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D56977C0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 09:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495746.766156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSCkg-0007GV-2G; Wed, 15 Feb 2023 08:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495746.766156; Wed, 15 Feb 2023 08:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSCkf-0007De-Ut; Wed, 15 Feb 2023 08:02:53 +0000
Received: by outflank-mailman (input) for mailman id 495746;
 Wed, 15 Feb 2023 08:02:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSCke-0007DU-JN; Wed, 15 Feb 2023 08:02:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSCke-0003HD-Gb; Wed, 15 Feb 2023 08:02:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSCke-0001yh-4i; Wed, 15 Feb 2023 08:02:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pSCke-00021o-4E; Wed, 15 Feb 2023 08:02:52 +0000
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
	bh=CDtwL6ec7zRpyIo8m42dTuTgKlRN3he0o4CjB9sCd3k=; b=FnNKMJrhCRyIdWKzSQY4CyGH5L
	6tpJNtv5b6+9zNmCdBGkUmvVZVVFCXTxZ8VcGerIQpT4jn/WkAUjGrXflUbeyxbhXj7vlZdzIMuX7
	nV5p7m4QTjneKxR6p7GYkYjWHprm6r/aqapOIu2FelxpkwfWN+Dl925D/hkp1tH5+wlc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177356-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177356: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=68c1bedbf297b57a336a2edc046f1f9874ba69fa
X-Osstest-Versions-That:
    ovmf=090642db7ac124c336da72e1954e1fb09e816fb0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Feb 2023 08:02:52 +0000

flight 177356 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177356/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 68c1bedbf297b57a336a2edc046f1f9874ba69fa
baseline version:
 ovmf                 090642db7ac124c336da72e1954e1fb09e816fb0

Last test of basis   177343  2023-02-15 03:35:26 Z    0 days
Testing same since   177356  2023-02-15 06:13:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Stuart Yoder <stuart.yoder@arm.com>

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
   090642db7a..68c1bedbf2  68c1bedbf297b57a336a2edc046f1f9874ba69fa -> xen-tested-master

