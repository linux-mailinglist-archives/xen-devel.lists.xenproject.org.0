Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41A963070
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 20:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785072.1194482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjNiZ-0003HJ-N5; Wed, 28 Aug 2024 18:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785072.1194482; Wed, 28 Aug 2024 18:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjNiZ-0003E8-KD; Wed, 28 Aug 2024 18:48:31 +0000
Received: by outflank-mailman (input) for mailman id 785072;
 Wed, 28 Aug 2024 18:48:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjNiX-0003Dy-Ra; Wed, 28 Aug 2024 18:48:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjNiX-0007MY-EY; Wed, 28 Aug 2024 18:48:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjNiW-0008Sw-UR; Wed, 28 Aug 2024 18:48:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjNiW-0006Ie-Tz; Wed, 28 Aug 2024 18:48:28 +0000
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
	bh=VMev+3TKusRlWBly/H6pr3Tr/ZN5uq6Lla4SsaWEMf8=; b=fNmR0tLZaUTDUBsIPiknNoh6nQ
	W1o2uPMwSe01kn7EMNDonOtEcJRE+8qqmRzpkNOlbXXaKyQCBD+03MU++D8STL4mUpiqCvxlJs672
	y01WkxhQxtHagAdBMaXOCv/faeyWmWrY7gCNcKlf0Y9XGSCUeG+Hu3X4O490UVp0a3TE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187384-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187384: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=84e7b74c8c643c59ee32d4da769f48a3c8c277a4
X-Osstest-Versions-That:
    ovmf=1fd2f9ec8f16cc8efb949888db94eb42006f77c6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 18:48:28 +0000

flight 187384 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187384/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 84e7b74c8c643c59ee32d4da769f48a3c8c277a4
baseline version:
 ovmf                 1fd2f9ec8f16cc8efb949888db94eb42006f77c6

Last test of basis   187383  2024-08-28 14:45:07 Z    0 days
Testing same since   187384  2024-08-28 16:41:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Hongbin1 Zhang <hongbin1.zhang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Wei6 Xu <wei6.xu@intel.com>
  xieyuanh <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>
  Zhang Hongbin <hongbin1.zhang@intel.com>

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
   1fd2f9ec8f..84e7b74c8c  84e7b74c8c643c59ee32d4da769f48a3c8c277a4 -> xen-tested-master

