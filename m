Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC6337689
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 16:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96654.183106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMvv-0002C3-Bl; Thu, 11 Mar 2021 15:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96654.183106; Thu, 11 Mar 2021 15:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMvv-0002Bc-7Q; Thu, 11 Mar 2021 15:09:03 +0000
Received: by outflank-mailman (input) for mailman id 96654;
 Thu, 11 Mar 2021 15:09:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lKMvt-0002BU-Cx; Thu, 11 Mar 2021 15:09:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lKMvt-0007bz-6V; Thu, 11 Mar 2021 15:09:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lKMvs-0000kG-VD; Thu, 11 Mar 2021 15:09:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lKMvs-0007L1-US; Thu, 11 Mar 2021 15:09:00 +0000
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
	bh=KoVPa2J+Q3DvYyzrHFIz8T+edcQUYfm2aNKEA/TBFxE=; b=G5Ke7QTcPa67dQIx9ovfrQTpCo
	BIfkLZVI2DhpXI1lOepB73LyPSNFvNb3kSuxfRXGJWBFmusJlBA/3v+1SNrlnojt1W3/oL8LK2qgs
	IjUCMemUTUcJsu53lA3YOlKSwfND+gDBAXLOLvjuEtBZuX5Bk1Pa2xLE9Akpa7liR1a8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159932-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159932: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4751a48aeb2ab828b0a5cbdc585fd3642967cda1
X-Osstest-Versions-That:
    ovmf=54ba08c6b66090bdc03186110149bfe4b0f75208
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Mar 2021 15:09:00 +0000

flight 159932 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159932/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4751a48aeb2ab828b0a5cbdc585fd3642967cda1
baseline version:
 ovmf                 54ba08c6b66090bdc03186110149bfe4b0f75208

Last test of basis   159924  2021-03-11 01:54:43 Z    0 days
Testing same since   159932  2021-03-11 09:09:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Fan Wang <fan.wang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Ting Ye <ting.ye@intel.com>

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
   54ba08c6b6..4751a48aeb  4751a48aeb2ab828b0a5cbdc585fd3642967cda1 -> xen-tested-master

