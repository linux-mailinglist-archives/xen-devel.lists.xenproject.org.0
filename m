Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD835EE1BE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 18:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413419.657045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odZq1-0001zQ-5T; Wed, 28 Sep 2022 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413419.657045; Wed, 28 Sep 2022 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odZq1-0001xD-2n; Wed, 28 Sep 2022 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 413419;
 Wed, 28 Sep 2022 16:23:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odZq0-0001x3-6l; Wed, 28 Sep 2022 16:23:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odZq0-00024x-5B; Wed, 28 Sep 2022 16:23:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odZpz-0001O7-J5; Wed, 28 Sep 2022 16:23:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1odZpz-0007P2-Ig; Wed, 28 Sep 2022 16:23:07 +0000
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
	bh=DH+y57e2cz9JpVNPbQXIYkmhU/mmEGPa7I3sMGz+QCo=; b=pxCQGHOjFujDULX324xfUmJ4s0
	eX6ycafi2nTIOpNCtYpl00o+dKMZxI0+Eq7plvCqLSrB6Lxy/iTUTgAcp4zWlzTN+hZ8hPVwZN2RC
	k8s/6LICDgnJMJdlRiOhFqN1kPvL3LXVxU3p75sbiiIramiB5x+JVTBtCt3PkCzmMRa8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173356-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173356: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b7213bbd59833fb0786c83a28df5f8244602ab5e
X-Osstest-Versions-That:
    ovmf=3c0d567c3719675b9d8ecf07c31706d96467e31b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Sep 2022 16:23:07 +0000

flight 173356 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173356/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b7213bbd59833fb0786c83a28df5f8244602ab5e
baseline version:
 ovmf                 3c0d567c3719675b9d8ecf07c31706d96467e31b

Last test of basis   173354  2022-09-28 10:12:04 Z    0 days
Testing same since   173356  2022-09-28 14:40:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   3c0d567c37..b7213bbd59  b7213bbd59833fb0786c83a28df5f8244602ab5e -> xen-tested-master

