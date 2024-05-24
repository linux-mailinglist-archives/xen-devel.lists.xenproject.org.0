Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD908CE869
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 18:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729641.1134852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAXL0-00069h-KI; Fri, 24 May 2024 16:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729641.1134852; Fri, 24 May 2024 16:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAXL0-00067T-GO; Fri, 24 May 2024 16:00:10 +0000
Received: by outflank-mailman (input) for mailman id 729641;
 Fri, 24 May 2024 16:00:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAXKy-00067I-U3; Fri, 24 May 2024 16:00:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAXKy-0005Wu-RL; Fri, 24 May 2024 16:00:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAXKy-0001kz-Ga; Fri, 24 May 2024 16:00:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sAXKy-0005Ym-Fz; Fri, 24 May 2024 16:00:08 +0000
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
	bh=6nbpPd891jysUl7mV3rZhV6UGpUb6cWxlH7BVZjsZDw=; b=DYDWITbNVdtOWoHvzryHa4/i34
	vWX/8UjzdKIkyd/Pl1X0roWn66CcOjP9rMOO1faXC7p0F91BkZjaAiGPi0caeqqO+5V/7IlcAAPpB
	khv6vsflQf+WkvirFONNLxp9ya9gEwP+bN12EnApR6bCl0z2nHLq0QMfGY5iGoSWszi8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186136: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=701190abb3d5873cf77349b3d90bd11ded74871a
X-Osstest-Versions-That:
    xen=2a40b106e92aaa7ce808c8608dd6473edc67f608
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 May 2024 16:00:08 +0000

flight 186136 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186136/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 186117

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  701190abb3d5873cf77349b3d90bd11ded74871a
baseline version:
 xen                  2a40b106e92aaa7ce808c8608dd6473edc67f608

Last test of basis   186117  2024-05-23 17:02:09 Z    0 days
Testing same since   186136  2024-05-24 14:02:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Henry Wang <Henry.Wang@arm.com>
  Henry Wang <xin.wang2@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
commit 701190abb3d5873cf77349b3d90bd11ded74871a
Author: Henry Wang <xin.wang2@amd.com>
Date:   Thu Mar 21 11:57:06 2024 +0800

    xen/arm: Set correct per-cpu cpu_core_mask
    
    In the common sysctl command XEN_SYSCTL_physinfo, the value of
    cores_per_socket is calculated based on the cpu_core_mask of CPU0.
    Currently on Arm this is a fixed value 1 (can be checked via xl info),
    which is not correct. This is because during the Arm CPU online
    process at boot time, setup_cpu_sibling_map() only sets the per-cpu
    cpu_core_mask for itself.
    
    cores_per_socket refers to the number of cores that belong to the same
    socket (NUMA node). Currently Xen on Arm does not support physical
    CPU hotplug and NUMA, also we assume there is no multithread. Therefore
    cores_per_socket means all possible CPUs detected from the device
    tree. Setting the per-cpu cpu_core_mask in setup_cpu_sibling_map()
    accordingly. Modify the in-code comment which seems to be outdated. Add
    a warning to users if Xen is running on processors with multithread
    support.
    
    Signed-off-by: Henry Wang <Henry.Wang@arm.com>
    Signed-off-by: Henry Wang <xin.wang2@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
(qemu changes not included)

