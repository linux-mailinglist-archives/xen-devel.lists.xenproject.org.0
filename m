Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156A7A035C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 14:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602229.938665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgl7t-0001uL-9k; Thu, 14 Sep 2023 12:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602229.938665; Thu, 14 Sep 2023 12:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgl7t-0001rP-6Z; Thu, 14 Sep 2023 12:07:17 +0000
Received: by outflank-mailman (input) for mailman id 602229;
 Thu, 14 Sep 2023 12:07:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgl7s-0001rF-38; Thu, 14 Sep 2023 12:07:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgl7s-0006uj-1Z; Thu, 14 Sep 2023 12:07:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgl7r-0006T8-HX; Thu, 14 Sep 2023 12:07:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qgl7r-00010h-H7; Thu, 14 Sep 2023 12:07:15 +0000
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
	bh=1VxC6s7KN8xhmUIIq+9ixei+UqeaFUuOwJeeEgWDFWo=; b=T+9QUcDz7WY73qYIubW+C6aWyn
	tb8T900NCMexJopkyEHp75kIOi2rD04WQoxH5ttjSVvPYtigIJ6dqZh9atHDa2o2Zf4Etjxr/Jkdh
	zX57ovLarhTRb9dRIzaXnAYSWDKaZlndtK5NE06ucRICcdzkV2pW+hf03j0OSinuNZvg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183003-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183003: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=29cce3356aec6db878ad318c4abeb63aa9e845aa
X-Osstest-Versions-That:
    ovmf=cdfe4310dda2a30b0ca05c8ede6896edce37a656
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Sep 2023 12:07:15 +0000

flight 183003 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183003/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 29cce3356aec6db878ad318c4abeb63aa9e845aa
baseline version:
 ovmf                 cdfe4310dda2a30b0ca05c8ede6896edce37a656

Last test of basis   182996  2023-09-13 11:12:12 Z    1 days
Testing same since   183003  2023-09-14 10:12:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>

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
   cdfe4310dd..29cce3356a  29cce3356aec6db878ad318c4abeb63aa9e845aa -> xen-tested-master

