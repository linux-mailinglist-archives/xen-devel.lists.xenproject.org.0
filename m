Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B12DF0AB
	for <lists+xen-devel@lfdr.de>; Sat, 19 Dec 2020 18:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56957.99642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqfvG-0006tW-Mm; Sat, 19 Dec 2020 17:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56957.99642; Sat, 19 Dec 2020 17:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqfvG-0006tA-JV; Sat, 19 Dec 2020 17:21:38 +0000
Received: by outflank-mailman (input) for mailman id 56957;
 Sat, 19 Dec 2020 17:21:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqfvF-0006t1-Tg; Sat, 19 Dec 2020 17:21:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqfvF-000326-Q6; Sat, 19 Dec 2020 17:21:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kqfvF-0008Rz-IE; Sat, 19 Dec 2020 17:21:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kqfvF-0005H9-Hl; Sat, 19 Dec 2020 17:21:37 +0000
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
	bh=c39ERMJg27at1TNLWsQAbbQCeDiN5USe8+BylwQG9k8=; b=ZqgAhL6IhcCv6TsbO4HAWCaY+H
	Hb4xeheUAZ25AfGEC5AGxrcGwyOxb6tpaA6N+XT7podS84eDnjMrqbqWJ7M7tIR4wunSIKSdw7HMs
	fDp+Jn8zo2nEnUltow/zleumk4lBmfmt34rosPwsTIVpUESKfV4OrrJSFuCx951i1nuU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157708-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157708: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1159fc3230aee02acc60aa245ce047217fd8b87e
X-Osstest-Versions-That:
    ovmf=f95e80d832e923046c92cd6f0b8208cec147138e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Dec 2020 17:21:37 +0000

flight 157708 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157708/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1159fc3230aee02acc60aa245ce047217fd8b87e
baseline version:
 ovmf                 f95e80d832e923046c92cd6f0b8208cec147138e

Last test of basis   157345  2020-12-09 12:40:46 Z   10 days
Failing since        157348  2020-12-09 15:39:39 Z   10 days   54 attempts
Testing same since   157708  2020-12-18 22:09:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Baraneedharan Anbazhagan <anbazhagan@hp.com>
  Baraneedharan Anbazhagan <anbazhgan@hp.com>
  Borghorst, Hendrik via groups.io <hborghor=amazon.de@groups.io>
  Bret Barkelew <Bret.Barkelew@microsoft.com>
  Chen, Christine <Yuwei.Chen@intel.com>
  Fan Wang <fan.wang@intel.com>
  Hendrik Borghorst <hborghor@amazon.de>
  James Bottomley <James.Bottomley@HansenPartnership.com>
  James Bottomley <jejb@linux.ibm.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Marc Moisson-Franckhauser <marc.moisson-franckhauser@arm.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
  Quan Nguyen <quan@os.amperecomputing.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sheng Wei <w.sheng@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>
  Star Zeng <star.zeng@intel.com>
  Ting Ye <ting.ye@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   f95e80d832..1159fc3230  1159fc3230aee02acc60aa245ce047217fd8b87e -> xen-tested-master

