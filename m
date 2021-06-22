Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A863AFF08
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 10:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145756.268070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvbc0-0007oH-7A; Tue, 22 Jun 2021 08:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145756.268070; Tue, 22 Jun 2021 08:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvbc0-0007mN-3K; Tue, 22 Jun 2021 08:18:24 +0000
Received: by outflank-mailman (input) for mailman id 145756;
 Tue, 22 Jun 2021 08:18:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvbby-0007mD-K9; Tue, 22 Jun 2021 08:18:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvbby-0006fG-F0; Tue, 22 Jun 2021 08:18:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lvbby-0007tk-7A; Tue, 22 Jun 2021 08:18:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lvbby-0005VA-6f; Tue, 22 Jun 2021 08:18:22 +0000
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
	bh=M7HtYhDPIavdQF283i5H4cCsRtQvgcRnv6L2/bqCuPg=; b=qW5P9rTTgkT9le7S+bA3/kLbys
	WTQy2lzltmzcFOSYAGvi6xBu+ge3w4KX/uxjGMXQ0y436Zvud/PbZnZ/H+9EQtJ5YZGY1W7QdIj6E
	rgXjtQU+WHjmGyt5pPQEDaOjqmWHRebwj2Z2iPrbjCqnK0+OEBwnfPceni0NGq/ExcOM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162960-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 162960: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:<job status>:broken:regression
    xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable-smoke:build-amd64:host-install(4):broken:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c9b59f9032d41be8bade8a25d9148cf6ed203704
X-Osstest-Versions-That:
    xen=8af4b47f061edf6450f2b0a0a8134fdf1c13b3e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Jun 2021 08:18:22 +0000

flight 162960 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162960/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 162880
 build-amd64                   4 host-install(4)        broken REGR. vs. 162880

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c9b59f9032d41be8bade8a25d9148cf6ed203704
baseline version:
 xen                  8af4b47f061edf6450f2b0a0a8134fdf1c13b3e5

Last test of basis   162880  2021-06-17 17:00:36 Z    4 days
Testing same since   162942  2021-06-21 16:00:26 Z    0 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@citrix.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>

jobs:
 build-arm64-xsm                                              broken  
 build-amd64                                                  broken  
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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

broken-job build-amd64 broken
broken-job build-arm64-xsm broken
broken-step build-arm64-xsm host-install(4)
broken-step build-amd64 host-install(4)

Not pushing.

------------------------------------------------------------
commit c9b59f9032d41be8bade8a25d9148cf6ed203704
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:52 2021 -0400

    golang/xenlight: do not negate ret when converting to Error
    
    Commit 871e51d2d4 changed the sign on the xenlight error types (making
    the values negative, same as the C-generated constants), but failed to
    remove the code changing the sign before casting to Error().  This
    results in error strings like "libxl error: <x>", rather than the
    correct message. Fix all occurrances of this by running:
    
      gofmt -w -r 'Error(-ret) -> Error(ret)' xenlight.go
    
    from tools/golang/xenlight.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>

commit 1d95fd75df18bf25cb445feb47caf62da25c00e8
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:51 2021 -0400

    golang/xenlight: add SendTrigger wrapper
    
    Add a warpper around libxl_send_trigger.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit 9b6d865e0af56e376740ba03b1ccdf316362a71e
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:50 2021 -0400

    golang/xenlight: add DomainDestroy wrapper
    
    Add a wrapper around libxl_domain_destroy.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit c089de0e2fa56d846cfb658b7b5efc3426895973
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:47 2021 -0400

    golang/xenlight: rename Ctx receivers to ctx
    
    As a matter of style, it is strange to see capitalized receiver names,
    due to the significance of capitalized symbols in Go (although there is
    in fact nothing special about a capitalized receiver name). Fix this in
    xenlight.go by running:
    
      gofmt -w -r 'Ctx -> ctx' xenlight.go
    
    from tools/golang/xenlight. There is no functional change.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit 1997940ad25e3566d1ab38496b8c7b07a086695a
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:46 2021 -0400

    golang/xenlight: use struct pointers in keyed union fields
    
    Currently, when marshalig Go types with keyed union fields, we assign the
    value of the struct (e.g. DomainBuildInfoTypeUnionHvm) which implements the
    interface of the keyed union field (e.g. DomainBuildInfoTypeUnion).
    As-is, this means that if a populated DomainBuildInfo is marshaled to
    e.g. JSON, unmarshaling back to DomainBuildInfo will fail.
    
    When the encoding/json is unmarshaling data into a Go type, and
    encounters a JSON object, it basically can either marshal the data into
    an empty interface, a map, or a struct. It cannot, however, marshal data
    into an interface with at least one method defined on it (e.g.
    DomainBuildInfoTypeUnion). Before this check is done, however, the
    decoder will check if the Go type is a pointer, and dereference it if
    so. It will then use the type of this value as the "target" type.
    
    This means that if the TypeUnion field is populated with a
    DomainBuildInfoTypeUnion, the decoder will see a non-empty interface and
    fail. If the TypeUnion field is populated with a
    *DomainBuildInfoTypeUnionHvm, it dereferences the pointer and sees a
    struct instead, allowing decoding to continue normally.
    
    Since there does not appear to be a strict need for NOT using pointers
    in these fields, update code generation to set keyed union fields to
    pointers of their implementing structs.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit bc9f632e31ee66be3f1860fc7303fe91a42e56a6
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:45 2021 -0400

    golang/xenlight: export keyed union interface types
    
    For structs that have a keyed union, e.g. DomainBuildInfo, the TypeUnion
    field must be exported so that package users can get/set the fields
    within. This means that users are aware of the existence of the
    interface type used in those fields (see [1]), so it is awkward that the
    interface itself is not exported. However, the single method within the
    interface must remain unexported so that users cannot mistakenly "implement"
    those interfaces.
    
    Since there seems to be no reason to do otherwise, export the keyed
    union interface types.
    
    [1] https://pkg.go.dev/xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight?tab=doc#DeviceUsbdev
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit 1422d8db1b3dfdf7d9179944e594876e5e356a4b
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:43 2021 -0400

    golang/xenlight: fix StringList toC conversion
    
    The current implementation of StringList.toC does not correctly account
    for how libxl_string_list is expected to be laid out in C, which is clear
    when one looks at libxl_string_list_length in libxl.c. In particular,
    StringList.toC does not account for the extra memory that should be
    allocated for the "sentinel" entry. And, when using the "slice trick" to
    create a slice that can address C memory, the unsafe.Pointer conversion
    should be on a C.libxl_string_list, not *C.libxl_string_list.
    
    Fix these problems by (1) allocating an extra slot in the slice used to
    address the C memory, and explicity set the last entry to nil so the C
    memory will be zeroed out, and (2) dereferencing csl in the
    unsafe.Pointer conversion.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>

commit b291ce703b9cebef0800267446334e867588354a
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon May 24 16:36:42 2021 -0400

    golang/xenlight: update generated code
    
    Re-generate code to reflect changes to libxl_types.idl from the
    following commits:
    
    0570d7f276 x86/msr: introduce an option for compatible MSR behavior selection
    7e5cffcd1e viridian: allow vCPU hotplug for Windows VMs
    9835246710 viridian: remove implicit limit of 64 VPs per partition
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
(qemu changes not included)

