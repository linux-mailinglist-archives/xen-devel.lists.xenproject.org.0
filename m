Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F939582ABC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 18:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376344.609059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjp0-0005MX-Ew; Wed, 27 Jul 2022 16:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376344.609059; Wed, 27 Jul 2022 16:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjp0-0005IP-B3; Wed, 27 Jul 2022 16:23:42 +0000
Received: by outflank-mailman (input) for mailman id 376344;
 Wed, 27 Jul 2022 16:23:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGjoy-0005H9-1L; Wed, 27 Jul 2022 16:23:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGjoy-0001io-0A; Wed, 27 Jul 2022 16:23:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGjox-0002fk-F0; Wed, 27 Jul 2022 16:23:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oGjox-0003XM-EV; Wed, 27 Jul 2022 16:23:39 +0000
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
	bh=yb6j3VgW2M85ABnvCLmeInK3H9VPt5HloHYeA+lBps0=; b=KsOY2Qe/AN/dsLyCulhAu49p+w
	5MVpBc2QzOAm3FfNSUh7RufpJiD9spOKEduB3tSrgl1MR/cyPGLCWBFGSBPs2gvxfgsBMKy657MDA
	wvrNXB90h0ZzzgBjTUfTTfX4dG8zF1PA6303CYrl1nOv8uQF+cPVY6AecOt8wDgSZjQs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171883-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171883: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e3d468acb9ce26a75fee45d742619ac1c6683280
X-Osstest-Versions-That:
    ovmf=b68d566439683d0ebe60d52c85ff0e90331db740
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Jul 2022 16:23:39 +0000

flight 171883 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171883/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e3d468acb9ce26a75fee45d742619ac1c6683280
baseline version:
 ovmf                 b68d566439683d0ebe60d52c85ff0e90331db740

Last test of basis   171878  2022-07-27 05:12:12 Z    0 days
Testing same since   171883  2022-07-27 10:10:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Konstantin Aladyshev <aladyshev22@gmail.com>

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
   b68d566439..e3d468acb9  e3d468acb9ce26a75fee45d742619ac1c6683280 -> xen-tested-master

