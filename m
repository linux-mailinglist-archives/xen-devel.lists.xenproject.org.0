Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65AD195ED7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 20:33:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHugw-0003e3-Hv; Fri, 27 Mar 2020 19:30:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lxlP=5M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jHugu-0003dv-W9
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 19:30:53 +0000
X-Inumbo-ID: 77976a6e-7061-11ea-8a22-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77976a6e-7061-11ea-8a22-12813bfff9fa;
 Fri, 27 Mar 2020 19:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHfQTYfRy9Cj0O0YAPYdZPT3rHKkdw7xmyqJcQM038M=; b=cTatMdaw4AxvroklLiCsVVups
 o4BFjZkunNgYAnjARQpyQZOCXXUyrdmobIBPrmrzJgm/a2NQ7gEEa1SVSx/oSEgAPURi11BUE+M68
 UlG/3QzGbYdJ10E6xvSqIWZl2izgtB+hUF8MMnsTEnBaffG++gwv2v142bgNUrAgJIN2g=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHugs-0000o9-Ll; Fri, 27 Mar 2020 19:30:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHugs-0004GV-9p; Fri, 27 Mar 2020 19:30:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jHugs-0003Di-98; Fri, 27 Mar 2020 19:30:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149071-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=695d90b9b156573d0dafb20afecea09dc9a914f4
X-Osstest-Versions-That: ovmf=f52b30e73ddee9a3a609a6e5aa87e79cf4f50879
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Mar 2020 19:30:50 +0000
Subject: [Xen-devel] [ovmf test] 149071: all pass - PUSHED
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149071 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149071/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 695d90b9b156573d0dafb20afecea09dc9a914f4
baseline version:
 ovmf                 f52b30e73ddee9a3a609a6e5aa87e79cf4f50879

Last test of basis   149048  2020-03-26 08:15:52 Z    1 days
Testing same since   149071  2020-03-27 01:46:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Ashish Singhal <ashishsingha@nvidia.com>
  Gaurav Jain <gaurav.jain@nxp.com>
  Guomin Jiang <guomin.jiang@intel.com>
  Hao A Wu <hao.a.wu@intel.com>
  Laszlo Ersek <lersek@redhat.com>
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
   f52b30e73d..695d90b9b1  695d90b9b156573d0dafb20afecea09dc9a914f4 -> xen-tested-master

