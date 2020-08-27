Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1D253C63
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 05:59:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB93R-0000ht-1s; Thu, 27 Aug 2020 03:58:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz+Y=CF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kB93P-0000ho-Bt
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 03:58:23 +0000
X-Inumbo-ID: b46bffc9-e757-46ff-9a5f-52327125aa01
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b46bffc9-e757-46ff-9a5f-52327125aa01;
 Thu, 27 Aug 2020 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=9Vrt9PtJFXiDuJorWXUkU39KIK4rc//WpjF8LrHlUuA=; b=3Xpgrx4ydbWUc0rTGsS6qQhIuE
 4XAGnIwqIHj9ZLE+MVucxElUtSc4m5kFioeIQNMv7DufK7gcHQsrdkxFwoykd3jSQQgnxS+Q4s2HR
 nLCC3w3UXfyMQzikXNh46zh/rlIQdll8mB5d+BiiwzALbqDrf6dlD/fu+JvvyXN+U+Ao=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kB93L-0002iF-QP; Thu, 27 Aug 2020 03:58:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kB93L-000302-JW; Thu, 27 Aug 2020 03:58:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kB93L-0008JD-J2; Thu, 27 Aug 2020 03:58:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152863-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152863: all pass - PUSHED
X-Osstest-Versions-This: ovmf=63d92674d240ab4ecab94f98e1e198842bb7de00
X-Osstest-Versions-That: ovmf=78ab44cb96808bd3ff0edf312599f94a6a92172a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Aug 2020 03:58:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

flight 152863 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152863/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 63d92674d240ab4ecab94f98e1e198842bb7de00
baseline version:
 ovmf                 78ab44cb96808bd3ff0edf312599f94a6a92172a

Last test of basis   152786  2020-08-25 04:47:07 Z    1 days
Testing same since   152863  2020-08-26 16:09:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <jiewen.yao@intel.com>
  Qi Zhang <qi1.zhang@intel.com>

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
   78ab44cb96..63d92674d2  63d92674d240ab4ecab94f98e1e198842bb7de00 -> xen-tested-master

