Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1D584969
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 03:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377269.610403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHF3x-0002ME-Ex; Fri, 29 Jul 2022 01:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377269.610403; Fri, 29 Jul 2022 01:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHF3x-0002KD-Bi; Fri, 29 Jul 2022 01:45:13 +0000
Received: by outflank-mailman (input) for mailman id 377269;
 Fri, 29 Jul 2022 01:45:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHF3v-0002K3-Mv; Fri, 29 Jul 2022 01:45:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHF3v-0005oX-KK; Fri, 29 Jul 2022 01:45:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHF3v-0005kL-8I; Fri, 29 Jul 2022 01:45:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oHF3v-0003pU-7v; Fri, 29 Jul 2022 01:45:11 +0000
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
	bh=vMbUIXh68L/aFD4a60CqhrzUAJmu4mHnXZQ8tFkspHo=; b=fSUh9FVW4XyWSAUfJcqABL+UEj
	eRVU8eiKoHPerBBFKH6A5eGpkIfNe79lDXXKf1zxpdz41ABon+XHn9HxlmuJ2RBIWfu8YNrONJIRs
	HWNCs9+YGR9D4iadhSkZuj49tSur1jf2dpGva0tRpFw6tRiweGsLhbkyyWnXQxxm1/Zw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171903-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171903: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ca45d3cb4586372909f350e54482246f994e1bc7
X-Osstest-Versions-That:
    xen=f732240fd3bac25116151db5ddeb7203b62e85ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Jul 2022 01:45:11 +0000

flight 171903 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171903/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 171884

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ca45d3cb4586372909f350e54482246f994e1bc7
baseline version:
 xen                  f732240fd3bac25116151db5ddeb7203b62e85ce

Last test of basis   171884  2022-07-27 12:03:31 Z    1 days
Testing same since   171899  2022-07-28 19:01:47 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Dunlap <george.dunlap@citrix.com>
  Jiamei Xie <jiamei.xie@arm.com>
  Julien Grall <julien.grall@arm.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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
commit ca45d3cb4586372909f350e54482246f994e1bc7
Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date:   Fri Jul 15 22:20:26 2022 +0300

    libxl/arm: Create specific IOMMU node to be referred by virtio-mmio device
    
    Reuse generic IOMMU device tree bindings to communicate Xen specific
    information for the virtio devices for which the restricted memory
    access using Xen grant mappings need to be enabled.
    
    Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
    compatible to all virtio devices which backends are going to run in
    non-hardware domains (which are non-trusted by default).
    
    Based on device-tree binding from Linux:
    Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
    
    The example of generated nodes:
    
    xen_iommu {
        compatible = "xen,grant-dma";
        #iommu-cells = <0x01>;
        phandle = <0xfde9>;
    };
    
    virtio@2000000 {
        compatible = "virtio,mmio";
        reg = <0x00 0x2000000 0x00 0x200>;
        interrupts = <0x00 0x01 0xf01>;
        interrupt-parent = <0xfde8>;
        dma-coherent;
        iommus = <0xfde9 0x01>;
    };
    
    virtio@2000200 {
        compatible = "virtio,mmio";
        reg = <0x00 0x2000200 0x00 0x200>;
        interrupts = <0x00 0x02 0xf01>;
        interrupt-parent = <0xfde8>;
        dma-coherent;
        iommus = <0xfde9 0x01>;
    };
    
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 2128143c114c52c7536e37c32935fdd77f23edc1
Author: Julien Grall <julien.grall@arm.com>
Date:   Fri Jul 15 22:20:25 2022 +0300

    libxl: Introduce basic virtio-mmio support on Arm
    
    This patch introduces helpers to allocate Virtio MMIO params
    (IRQ and memory region) and create specific device node in
    the Guest device-tree with allocated params. In order to deal
    with multiple Virtio devices, reserve corresponding ranges.
    For now, we reserve 1MB for memory regions and 10 SPIs.
    
    As these helpers should be used for every Virtio device attached
    to the Guest, call them for Virtio disk(s).
    
    Please note, with statically allocated Virtio IRQs there is
    a risk of a clash with a physical IRQs of passthrough devices.
    For the first version, it's fine, but we should consider allocating
    the Virtio IRQs automatically. Thankfully, we know in advance which
    IRQs will be used for passthrough to be able to choose non-clashed
    ones.
    
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date:   Fri Jul 15 22:20:24 2022 +0300

    libxl: Add support for Virtio disk configuration
    
    This patch adds basic support for configuring and assisting virtio-mmio
    based virtio-disk backend (emulator) which is intended to run out of
    Qemu and could be run in any domain.
    Although the Virtio block device is quite different from traditional
    Xen PV block device (vbd) from the toolstack's point of view:
     - as the frontend is virtio-blk which is not a Xenbus driver, nothing
       written to Xenstore are fetched by the frontend currently ("vdev"
       is not passed to the frontend). But this might need to be revised
       in future, so frontend data might be written to Xenstore in order to
       support hotplugging virtio devices or passing the backend domain id
       on arch where the device-tree is not available.
     - the ring-ref/event-channel are not used for the backend<->frontend
       communication, the proposed IPC for Virtio is IOREQ/DM
    it is still a "block device" and ought to be integrated in existing
    "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
    logic to deal with Virtio devices as well.
    
    For the immediate purpose and an ability to extend that support for
    other use-cases in future (Qemu, virtio-pci, etc) perform the following
    actions:
    - Add new disk backend type (LIBXL_DISK_BACKEND_STANDALONE) and reflect
      that in the configuration
    - Introduce new disk "specification" and "transport" fields to struct
      libxl_device_disk. Both are written to the Xenstore. The transport
      field is only used for the specification "virtio" and it assumes
      only "mmio" value for now.
    - Introduce new "specification" option with "xen" communication
      protocol being default value.
    - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
      one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
    
    An example of domain configuration for Virtio disk:
    disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=standalone, specification=virtio']
    
    Nothing has changed for default Xen disk configuration.
    
    Please note, this patch is not enough for virtio-disk to work
    on Xen (Arm), as for every Virtio device (including disk) we need
    to allocate Virtio MMIO params (IRQ and memory region) and pass
    them to the backend, also update Guest device-tree. The subsequent
    patch will add these missing bits. For the current patch,
    the default "irq" and "base" are just written to the Xenstore.
    This is not an ideal splitting, but this way we avoid breaking
    the bisectability.
    
    Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Tested-by: Jiamei Xie <jiamei.xie@arm.com>
(qemu changes not included)

