Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A575A7D9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566390.885154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMO7T-0003t3-58; Thu, 20 Jul 2023 07:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566390.885154; Thu, 20 Jul 2023 07:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMO7T-0003qc-1u; Thu, 20 Jul 2023 07:30:39 +0000
Received: by outflank-mailman (input) for mailman id 566390;
 Thu, 20 Jul 2023 07:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g0r7=DG=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qMO7R-0003qW-D9
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:30:37 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50cf516c-26cf-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 09:30:35 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.4 AUTH)
 with ESMTPSA id m4dd28z6K7U787t
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 20 Jul 2023 09:30:07 +0200 (CEST)
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
X-Inumbo-ID: 50cf516c-26cf-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1689838208; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nt++gSxgDWjDASW5mySw0msxmOyJhB94ESyZz0s+G+0wn36MBPl1KahtSAsuqP1LpQ
    zlBaKgmSxfQrOQT2iNzOm/tbYXnafVaKU/pFVoAnhJnZyReosysoSVI6kGX/rp/ltB0N
    n1j3IEUzg9V9udc1hv3mPlvQ3g426ZKbDoDp5RHWpDQNfGGcCfPBdox6xsTFmIYpDIOU
    OiX0NE3zei7k7s/DH8jyGjyqe/cij2QC+KUEtq4jg1OhQl83czWWvv7FjpC1zlaaiM9j
    4NEF+NffHQrFEC6ODWwnCRagcj9VVLfyzeT2IbZB4Lm52Bq4Id5g7HnQjfaJmjREf+vX
    yL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1689838208;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=s6JOIe6z0BGLizUkWvs50G1BxwJlwHY/usYL8TDGJJQ=;
    b=tkPOSQ+XGulCL7l9K5Y0Dj5foshApchvDzcawRfRn5xVYz2feIgCS132sO8jkWsn3U
    k/RUMfIWgMfLnaso/R55MJBagC7oMaL2mMjwU/FJhTn8XtYmLd4bh9juRjyrYTMdcJn0
    eMwjVE3hITcYH1BMcFb+UyPjU5mOOPEzEkGJ2aeHdwXXU5FPj+vX6YIbza0DqxPWhpD/
    lE9iqnSjtlkP7CbVuIIenvRVMks9ay79+AvGixTJTGTrG/GKrCDNeb3SCMBOuyTmfkVU
    k70HSXkWXbczh9G2kbxU23XFOuE2XyKSA5I1yJo6wIJsJAL7mn9+4N4p7t5AFj45Vge+
    R7EA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689838208;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=s6JOIe6z0BGLizUkWvs50G1BxwJlwHY/usYL8TDGJJQ=;
    b=Pg7dl3uOyiwb2WHUo+moHH8AJJcRqvG9mps45rimReWmosvCr9pZ+D9EebcxPx01Ol
    Jm5mfVu7p1WRrhgCmXs32f8LnTI2Q03s3iAX91gNq3s6tXrDQp5L8FzVta50unLx5O9w
    4mw8IFmGaAfzqSIZvQpfbdveXIpBeZ0a79zyke6ycv0pYqDp5SZ7nV+Aw0HwBQkjbXDD
    pnHs2JuGj0BrMoV/AU0BXpv0q0c+hYGPosmNnYJpUrh/IDR2Py4uz0HuziSStfxUQwcI
    P9d7iqMJUFEAQSRUQ/ReJMS87zYIGd29GZlEG7WEa65uJdeG9JdPyuAVzEB5whdqTYHd
    8oeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689838208;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=s6JOIe6z0BGLizUkWvs50G1BxwJlwHY/usYL8TDGJJQ=;
    b=kuvg1FQIiKO2T3hQYBSyRc34OLOFcuLX7vZClxpNLskQOgIeBhhw7/heBXSLDwd9OS
    rakpphXSHdyjVlmcZvCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4x/Q77Ep0tacRDpd3C7x0fRU/XAhBUWjct55BrKA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v1] xen-platform: do full PCI reset during unplug of IDE devices
Date: Thu, 20 Jul 2023 09:29:50 +0200
Message-Id: <20230720072950.20198-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The IDE unplug function needs to reset the entire PCI device, to make
sure all state is initialized to defaults. This is done by calling
pci_device_reset, which resets not only the chip specific registers, but
also all PCI state. This fixes "unplug" in a Xen HVM domU with the
modular legacy xenlinux PV drivers.

Commit ee358e919e38 ("hw/ide/piix: Convert reset handler to
DeviceReset") changed the way how the the disks are unplugged. Prior
this commit the PCI device remained unchanged. After this change,
piix_ide_reset is exercised after the "unplug" command, which was not
the case prior that commit. This function resets the command register.
As a result the ata_piix driver inside the domU will see a disabled PCI
device. The generic PCI code will reenable the PCI device. On the qemu
side, this runs pci_default_write_config/pci_update_mappings. Here a
changed address is returned by pci_bar_address, this is the address
which was truncated in piix_ide_reset. In case of a Xen HVM domU, the
address changes from 0xc120 to 0xc100. This truncation was a bug in
piix_ide_reset, which was fixed in commit 230dfd9257 ("hw/ide/piix:
properly initialize the BMIBA register"). If pci_xen_ide_unplug had used
pci_device_reset, the PCI registers would have been properly reset, and
commit ee358e919e38 would have not introduced a regression for this
specific domU environment.

While the unplug is supposed to hide the IDE disks, the changed BMIBA
address broke the UHCI device. In case the domU has an USB tablet
configured, to recive absolute pointer coordinates for the GUI, it will
cause a hang during device discovery of the partly discovered USB hid
device. Reading the USBSTS word size register will fail. The access ends
up in the QEMU piix-bmdma device, instead of the expected uhci device.
Here a byte size request is expected, and a value of ~0 is returned. As
a result the UCHI driver sees an error state in the register, and turns
off the UHCI controller.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 hw/i386/xen/xen_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 57f1d742c1..17457ff3de 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -164,8 +164,9 @@ static void pci_unplug_nics(PCIBus *bus)
  *
  * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
  */
-static void pci_xen_ide_unplug(DeviceState *dev, bool aux)
+static void pci_xen_ide_unplug(PCIDevice *d, bool aux)
 {
+    DeviceState *dev = DEVICE(d);
     PCIIDEState *pci_ide;
     int i;
     IDEDevice *idedev;
@@ -195,7 +196,7 @@ static void pci_xen_ide_unplug(DeviceState *dev, bool aux)
             blk_unref(blk);
         }
     }
-    device_cold_reset(dev);
+    pci_device_reset(d);
 }
 
 static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
@@ -210,7 +211,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-        pci_xen_ide_unplug(DEVICE(d), aux);
+        pci_xen_ide_unplug(d, aux);
         break;
 
     case PCI_CLASS_STORAGE_SCSI:


