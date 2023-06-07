Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFA726013
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 14:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544755.850737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sd2-0000LH-LW; Wed, 07 Jun 2023 12:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544755.850737; Wed, 07 Jun 2023 12:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sd2-0000IE-Hu; Wed, 07 Jun 2023 12:51:08 +0000
Received: by outflank-mailman (input) for mailman id 544755;
 Wed, 07 Jun 2023 12:51:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6sd1-0000I1-1z; Wed, 07 Jun 2023 12:51:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6sd0-0003cW-Qb; Wed, 07 Jun 2023 12:51:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6sd0-0001pi-Bn; Wed, 07 Jun 2023 12:51:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6sd0-0005bS-BQ; Wed, 07 Jun 2023 12:51:06 +0000
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
	bh=b7RW0iIxWO/jNdHS76x99IIrogCzuR05v/U78tks4+Y=; b=vE4ZvL8YIGovxJ2xC17s5Ve2hu
	zyK3ModeQC6PfMVumtRw+8M//wVpI/JRPXc8VkDe9P0KcaavgEWNcspCE8T96yVuX0A1z3GGxn3Cg
	Z8XGltsdXbxzRKNjA+VlGQphBr+8ES4is+AJcjZ1tNpU7ALfx+30xGjiPaY6jXVCetQQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181246-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181246: regressions - trouble: blocked/fail
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=cb8b18d49ad804108ead8667179794b0ead66f2a
X-Osstest-Versions-That:
    xen=64a647f8d817c6989edc000613b5afae19f03f99
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jun 2023 12:51:06 +0000

flight 181246 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181246/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 181233
 build-arm64-xsm               6 xen-build                fail REGR. vs. 181233
 build-armhf                   6 xen-build                fail REGR. vs. 181233

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  cb8b18d49ad804108ead8667179794b0ead66f2a
baseline version:
 xen                  64a647f8d817c6989edc000613b5afae19f03f99

Last test of basis   181233  2023-06-07 02:04:37 Z    0 days
Testing same since   181246  2023-06-07 11:02:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Lindig <christian.lindig@cloud.com>
  George Dunlap <george.dunlap@citrix.com>
  Henry Wang <Henry.Wang@arm.com> # CHANGELOG
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
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


Not pushing.

------------------------------------------------------------
commit cb8b18d49ad804108ead8667179794b0ead66f2a
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:13 2023 +0100

    xen/changelog: Add SVE and "dom0" options to the changelog for Arm
    
    Arm now can use the "dom0=" Xen command line option and the support
    for guests running SVE instructions is added, put entries in the
    changelog.
    
    Mention the "Tech Preview" status and add an entry in SUPPORT.md
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 870394de44766d6d1972c2e27be2f0a289162b04
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:12 2023 +0100

    xen/arm: add sve property for dom0less domUs
    
    Add a device tree property in the dom0less domU configuration
    to enable the guest to use SVE.
    
    Update documentation.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit b46e8207d0aedad7bb23d14c055d95e625d366b0
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:11 2023 +0100

    xen/tools: add sve parameter in XL configuration
    
    Add sve parameter in XL configuration to allow guests to use
    SVE feature.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 56a7aaa16bfe43945a0031319c60c7f323c46254
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:10 2023 +0100

    tools: add physinfo arch_capabilities handling for Arm
    
    On Arm, the SVE vector length is encoded in arch_capabilities field
    of struct xen_sysctl_physinfo, make use of this field in the tools
    when building for arm.
    
    Create header arm-arch-capabilities.h to handle the arch_capabilities
    field of physinfo for Arm.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 9392bf6a3a44978373f2c54a4c69d739f437b3bc
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:09 2023 +0100

    xen/physinfo: encode Arm SVE vector length in arch_capabilities
    
    When the arm platform supports SVE, advertise the feature in the
    field arch_capabilities in struct xen_sysctl_physinfo by encoding
    the SVE vector length in it.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit fd53bc7af0eaa9d37ca3ec8b517190cc3e3df9ed
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:08 2023 +0100

    xen: enable Dom0 to use SVE feature
    
    Add a command line parameter to allow Dom0 the use of SVE resources,
    the command line parameter sve=<integer>, sub argument of dom0=,
    controls the feature on this domain and sets the maximum SVE vector
    length for Dom0.
    
    Add a new function, parse_signed_integer(), to parse an integer
    command line argument.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com> # !arm
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit f2095a51ac53d2da97f724d49ec3aedbb290080e
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:07 2023 +0100

    xen/common: add dom0 xen command line argument for Arm
    
    Currently x86 defines a Xen command line argument dom0=<list> where
    there can be specified dom0 controlling sub-options, to use it also
    on Arm, move the code that loops through the list of arguments from
    x86 to the common code and from there, call architecture specific
    functions to handle the comma separated sub-options.
    
    No functional changes are intended.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit ac5855d5c7ea123be3fb32b17b9cd4ad483b4205
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:06 2023 +0100

    arm/sve: save/restore SVE context switch
    
    Save/restore context switch for SVE, allocate memory to contain
    the Z0-31 registers whose length is maximum 2048 bits each and
    FFR who can be maximum 256 bits, the allocated memory depends on
    how many bits is the vector length for the domain and how many bits
    are supported by the platform.
    
    Save P0-15 whose length is maximum 256 bits each, in this case the
    memory used is from the fpregs field in struct vfp_state,
    because V0-31 are part of Z0-31 and this space would have been
    unused for SVE domain otherwise.
    
    Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
    creation given the requested vector length and restore it on
    context switch, save/restore ZCR_EL1 value as well.
    
    List import macros from Linux in README.LinuxPrimitives.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 3c6e7262410fe95f96aae32765531de41a6f392f
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:05 2023 +0100

    xen/arm: add SVE exception class handling
    
    SVE has a new exception class with code 0x19, introduce the new code
    and handle the exception.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit c5ff38cdd833fcf2cbb8fb49e362eac05888b3d4
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:04 2023 +0100

    xen/arm: Expose SVE feature to the guest
    
    When a guest is allowed to use SVE, expose the SVE features through
    the identification registers.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 8043e80de93a9377454b6186390a3e931cc4b273
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:03 2023 +0100

    xen/arm: add SVE vector length field to the domain
    
    Add sve_vl field to arch_domain and xen_arch_domainconfig struct,
    to allow the domain to have an information about the SVE feature
    and the number of SVE register bits that are allowed for this
    domain.
    
    sve_vl field is the vector length in bits divided by 128, this
    allows to use less space in the structures.
    
    The field is used also to allow or forbid a domain to use SVE,
    because a value equal to zero means the guest is not allowed to
    use the feature.
    
    Check that the requested vector length is lower or equal to the
    platform supported vector length, otherwise fail on domain
    creation.
    
    Check that only 64 bit domains have SVE enabled, otherwise fail.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit ddcbaa42d8515d8e372d10f9a8014b4c5b7cc536
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Wed May 31 08:24:02 2023 +0100

    xen/arm: enable SVE extension for Xen
    
    Enable Xen to handle the SVE extension, add code in cpufeature module
    to handle ZCR SVE register, disable trapping SVE feature on system
    boot only when SVE resources are accessed.
    While there, correct coding style for the comment on coprocessor
    trapping.
    
    Now cptr_el2 is part of the domain context and it will be restored
    on context switch, this is a preparation for saving the SVE context
    which will be part of VFP operations, so restore it before the call
    to save VFP registers.
    To save an additional isb barrier, restore cptr_el2 before an
    existing isb barrier and move the call for saving VFP context after
    that barrier. To keep a (mostly) specularity of ctxt_switch_to()
    and ctxt_switch_from(), move vfp_save_state() up in the function.
    
    Change the KConfig entry to make ARM64_SVE symbol selectable, by
    default it will be not selected.
    
    Create sve module and sve_asm.S that contains assembly routines for
    the SVE feature, this code is inspired from linux and it uses
    instruction encoding to be compatible with compilers that does not
    support SVE, imported instructions are documented in
    README.LinuxPrimitives.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

