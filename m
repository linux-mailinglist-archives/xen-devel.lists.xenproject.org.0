Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F595E983C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 05:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411370.654278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocehH-0001Wi-H3; Mon, 26 Sep 2022 03:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411370.654278; Mon, 26 Sep 2022 03:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocehH-0001Us-AX; Mon, 26 Sep 2022 03:22:19 +0000
Received: by outflank-mailman (input) for mailman id 411370;
 Mon, 26 Sep 2022 03:22:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ocehF-0001Ui-I6; Mon, 26 Sep 2022 03:22:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ocehF-0005OS-Fj; Mon, 26 Sep 2022 03:22:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ocehE-0000NO-VK; Mon, 26 Sep 2022 03:22:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ocehE-0000bh-Uv; Mon, 26 Sep 2022 03:22:16 +0000
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
	bh=Xp3pVgovdcN8Dic2Yjo727KbQa9UFFxVTB4dhVfU8fA=; b=DtMckj21ws9Y/DZVT080r9q2MG
	Km3ruDqNTDqUsOigDKUX8dOYDKgOAdjw3Yf/uEdbH38302c6CRaTc0ZwaIG2qPwiUr1ok0g4EMG9N
	CieST2m6RZMbSv/YNTnfIJQtlGf93vEa1Uc1m9/avkBi83zywvRkTmzh7TRRWkU3IzL8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173312-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173312: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0e7aa6bf9e0a7a91136353a3d6fe6a90d2047fc0
X-Osstest-Versions-That:
    ovmf=582a7c9995a8fd036a3583ba485467f5a0316cca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Sep 2022 03:22:16 +0000

flight 173312 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173312/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0e7aa6bf9e0a7a91136353a3d6fe6a90d2047fc0
baseline version:
 ovmf                 582a7c9995a8fd036a3583ba485467f5a0316cca

Last test of basis   173302  2022-09-24 03:12:01 Z    2 days
Testing same since   173312  2022-09-26 01:41:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yi Li <yi1.li@intel.com>

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
   582a7c9995..0e7aa6bf9e  0e7aa6bf9e0a7a91136353a3d6fe6a90d2047fc0 -> xen-tested-master

