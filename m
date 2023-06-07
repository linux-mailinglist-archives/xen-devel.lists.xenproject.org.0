Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BF726791
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 19:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544949.851074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6x7v-0001lg-SO; Wed, 07 Jun 2023 17:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544949.851074; Wed, 07 Jun 2023 17:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6x7v-0001jy-P2; Wed, 07 Jun 2023 17:39:19 +0000
Received: by outflank-mailman (input) for mailman id 544949;
 Wed, 07 Jun 2023 17:39:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6x7u-0001jo-25; Wed, 07 Jun 2023 17:39:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6x7t-0002S0-Qo; Wed, 07 Jun 2023 17:39:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6x7t-0003Yq-Jh; Wed, 07 Jun 2023 17:39:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6x7t-0002Eh-HC; Wed, 07 Jun 2023 17:39:17 +0000
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
	bh=XzSjRwd6ounjcAcT0VrIZvMP/1aS/f0X377+E8FF9PQ=; b=sOLUoRvMNBenW6/L4sn/OOlklS
	FzYUHUinsd/0G0F7meAwspRN4v5jX6tWzr1qiEmjyjJB0ypb4+HrfGcVS8sVH4I3EpIN/Sb13LtCk
	vT9+B4O6CCobu6btvo+uy6YoG+WkwIw/9fU1TldRprQIPDZE0yj2OPu5qtiPgvt5YMwc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181257-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181257: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8d238f1433397397b4d05b38cb2460929429241f
X-Osstest-Versions-That:
    ovmf=c082da89cfb2dd9640272741b7f176ede3cc41bb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jun 2023 17:39:17 +0000

flight 181257 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181257/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8d238f1433397397b4d05b38cb2460929429241f
baseline version:
 ovmf                 c082da89cfb2dd9640272741b7f176ede3cc41bb

Last test of basis   181245  2023-06-07 09:11:19 Z    0 days
Testing same since   181257  2023-06-07 15:40:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ni, Ray <ray.ni@intel.com>
  Ray Ni <ray.ni@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   c082da89cf..8d238f1433  8d238f1433397397b4d05b38cb2460929429241f -> xen-tested-master

