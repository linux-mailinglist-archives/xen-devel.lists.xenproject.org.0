Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE82443E2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 05:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Q73-0001y8-Kp; Fri, 14 Aug 2020 03:10:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c45b=BY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k6Q72-0001y3-El
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 03:10:36 +0000
X-Inumbo-ID: 7af528bd-8b19-4c0a-9d9c-4ca50200f182
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7af528bd-8b19-4c0a-9d9c-4ca50200f182;
 Fri, 14 Aug 2020 03:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=VQJhZ9zvD3L/+7maf+RDcfqH/xw7OE5WOzve+zM01u8=; b=fWGlU+0o/Hl/mA9XkRM285F0BX
 NOCNWotLfKaQqJmJNc3rS21O6xRzyzwt/+8rK3dL3D8OcNzrf4vlczG1GWEpFRlEPemyz53EEYG1R
 baZb7oGS3yds5O6KgblC1YJ3lZdGylwV/rL9BIHChjv9mRpG37XK2zF205jjQY6txxwg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k6Q70-00008d-C5; Fri, 14 Aug 2020 03:10:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k6Q6z-0008BW-V0; Fri, 14 Aug 2020 03:10:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k6Q6z-0001jj-Tr; Fri, 14 Aug 2020 03:10:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152587-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152587: all pass - PUSHED
X-Osstest-Versions-This: ovmf=3633d5309f67550e2369776b37220674ad1b623c
X-Osstest-Versions-That: ovmf=e6042aec1bc2bf3a2eaf4f2d3bfe9b90ef95948e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Aug 2020 03:10:33 +0000
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

flight 152587 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152587/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3633d5309f67550e2369776b37220674ad1b623c
baseline version:
 ovmf                 e6042aec1bc2bf3a2eaf4f2d3bfe9b90ef95948e

Last test of basis   152568  2020-08-12 04:10:50 Z    1 days
Testing same since   152587  2020-08-13 07:51:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Gary Lin <glin@suse.com>
  Liming Gao <liming.gao@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Ming Shao <ming.shao@intel.com>
  Ray Ni <ray.ni@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   e6042aec1b..3633d5309f  3633d5309f67550e2369776b37220674ad1b623c -> xen-tested-master

