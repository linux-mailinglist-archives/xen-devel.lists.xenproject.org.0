Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028712A86CF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 20:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20106.45750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakes-0000rS-Lm; Thu, 05 Nov 2020 19:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20106.45750; Thu, 05 Nov 2020 19:10:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakes-0000r3-IU; Thu, 05 Nov 2020 19:10:54 +0000
Received: by outflank-mailman (input) for mailman id 20106;
 Thu, 05 Nov 2020 19:10:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kaker-0000qV-03
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 19:10:53 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 211ec027-b043-4ba8-8a07-e9cb82129c92;
 Thu, 05 Nov 2020 19:10:45 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kakej-00084L-K7; Thu, 05 Nov 2020 19:10:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kakej-0005KT-CI; Thu, 05 Nov 2020 19:10:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kakej-0001HK-Bl; Thu, 05 Nov 2020 19:10:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NZd0=EL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kaker-0000qV-03
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 19:10:53 +0000
X-Inumbo-ID: 211ec027-b043-4ba8-8a07-e9cb82129c92
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 211ec027-b043-4ba8-8a07-e9cb82129c92;
	Thu, 05 Nov 2020 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=FDosYbVsN85y4et6g/oPjgXaW9KO+u7Vcu/jcy1ZXds=; b=JHcl3XW5OqyAOBZoPE+djW6bIe
	JooYZbzjVYuqmrMex6l4pqERJC7CblUthATGHFZfyRh4fJQjawksd+w5UuuQOp4p9Y1eHXzbHMlDi
	7XP8ZWYN+XRuxxPnQEhRCqByY1ca9TCYfihfG9IYnZMN7j9XjfHEwO1rDm2+mf/NTqWs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kakej-00084L-K7; Thu, 05 Nov 2020 19:10:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kakej-0005KT-CI; Thu, 05 Nov 2020 19:10:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kakej-0001HK-Bl; Thu, 05 Nov 2020 19:10:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156407-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156407: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-xsm:xen-build:fail:regression
X-Osstest-Versions-This:
    ovmf=09af9bd9be2d3e31bba979f8cf6446017b0b863e
X-Osstest-Versions-That:
    ovmf=8d5708833509ece6ac63084dc07c8ac53c4d4c1a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 Nov 2020 19:10:45 +0000

flight 156407 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156407/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 156400

version targeted for testing:
 ovmf                 09af9bd9be2d3e31bba979f8cf6446017b0b863e
baseline version:
 ovmf                 8d5708833509ece6ac63084dc07c8ac53c4d4c1a

Last test of basis   156400  2020-11-04 12:10:58 Z    1 days
Testing same since   156407  2020-11-05 09:30:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Liming Gao <gaoliming@byosoft.com.cn>

jobs:
 build-amd64-xsm                                              fail    
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


Not pushing.

------------------------------------------------------------
commit 09af9bd9be2d3e31bba979f8cf6446017b0b863e
Author: Bob Feng <bob.c.feng@intel.com>
Date:   Wed Nov 4 11:01:39 2020 +0800

    BaseTools: Enable Module Scope Structure Pcd
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2648
    
    This patch is to enable the Module scoped Structure Pcd usage.
    User can set structure pcd field value in module scope. For example,
    under the [components] section of a dsc file, user can override some
    field value for a specific module.
    
      Package/Module.inf{
          <PcdsFixedAtBuild>
          gUefiTokenSpaceGuid.StructurePcdModule.FieldName | 5
      }
    
    Signed-off-by: Bob Feng <bob.c.feng@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Yuwei Chen <yuwei.chen@intel.com>
    
    Tested-by: Liming Gao <gaoliming@byosoft.com.cn>
    Acked-by: Liming Gao <gaoliming@byosoft.com.cn>

commit 978b9d511f5b9cb7bc5b09749f86c39bec51525d
Author: Jeff Brasen <jbrasen@nvidia.com>
Date:   Thu Oct 29 01:35:02 2020 +0800

    MdeModulePkg/Gcd: Check memory allocation when initializing memory
    
    CoreInitializeMemoryServices was not checking for any existing memory
    allocation created in the HOB producer phase. If there are memory
    allocations outside of the region covered by the HOB List then Gcd could
    select that region for memory which can result in the memory allocation
    to not be handled and memory overwrites.
    
    Signed-off-by: Jeff Brasen <jbrasen@nvidia.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
    Regression-tested-by: Laszlo Ersek <lersek@redhat.com>

