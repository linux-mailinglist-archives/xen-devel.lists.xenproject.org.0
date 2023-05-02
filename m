Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81B6F403B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528410.821518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmPC-0004Hv-IT; Tue, 02 May 2023 09:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528410.821518; Tue, 02 May 2023 09:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmPC-0004F1-Eg; Tue, 02 May 2023 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 528410;
 Tue, 02 May 2023 09:34:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ptmPB-0004En-Ug; Tue, 02 May 2023 09:34:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ptmPB-0006bB-L1; Tue, 02 May 2023 09:34:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ptmPB-0000zN-1d; Tue, 02 May 2023 09:34:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ptmPB-0002Hp-15; Tue, 02 May 2023 09:34:41 +0000
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
	bh=+viSyQCA1Z2bF9ETp9Kc8Gi2H5hJICjYKlwNPCv/2m4=; b=grPipTIBjshBhl3v01nHuewxCZ
	Ya6YefIyIjIasOheqmoe2Sgb4Df6lTpruL/2Tv9pMTEHDjpES45/vU1dL/gKfO7nU1HdRP/fyUWyY
	qGZyZyz7EiheC+b3UK6IBOwb7Sbokndx0sBYLsrN+DjbC1KIYGSyakhGaqbWWM462x8o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180502-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180502: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=23c71536efbebed57942947668f470f934324477
X-Osstest-Versions-That:
    ovmf=56e9828380b7425678a080bd3a08e7c741af67ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 May 2023 09:34:41 +0000

flight 180502 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180502/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 23c71536efbebed57942947668f470f934324477
baseline version:
 ovmf                 56e9828380b7425678a080bd3a08e7c741af67ba

Last test of basis   180470  2023-04-28 12:40:43 Z    3 days
Testing same since   180502  2023-05-02 07:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  PaytonX Hsieh <paytonx.hsieh@intel.com>

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
   56e9828380..23c71536ef  23c71536efbebed57942947668f470f934324477 -> xen-tested-master

