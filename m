Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD366B7120
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509142.784390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdUu-0004qv-IT; Mon, 13 Mar 2023 08:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509142.784390; Mon, 13 Mar 2023 08:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdUu-0004pG-Ff; Mon, 13 Mar 2023 08:25:36 +0000
Received: by outflank-mailman (input) for mailman id 509142;
 Mon, 13 Mar 2023 08:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zj8d=7F=bu.edu=alxndr@srs-se1.protection.inumbo.net>)
 id 1pbdUs-0004pA-Tc
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:25:35 +0000
Received: from esa15.hc2706-39.iphmx.com (esa15.hc2706-39.iphmx.com
 [216.71.140.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e2a9675-c178-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:25:32 +0100 (CET)
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:25:24 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 e11-20020ad4536b000000b005a9292e8c2bso627646qvv.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 01:25:24 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 u11-20020ac8050b000000b003bfc0cca1b7sm5160090qtg.49.2023.03.13.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:25:20 -0700 (PDT)
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
X-Inumbo-ID: 9e2a9675-c178-11ed-87f5-c1b5be75604c
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 261668084
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5DmNs6C830h3chVW/23iw5YqxClBgxIJ4kV8jS/XYbTApDsh0zUPm
 jBLDzyFaffZZTbweot/YdixpB8Hv8SGzIdrTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0i1aYDkpOs/jY8Eg256yo0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPU5dN+XE8nEbcx1cB5IGNX+
 cA7JQ8CO0Xra+KemNpXS8Fpj8UnadD1ZcYR5CAmwjbeAvIrB5vERs0m5/cChGZ21p0IR6+PI
 ZRIAdZsRE2ojxlnM1MHDp4ktO21wHTzblW0rXrP+/NpvTiLnFAZPL7FHsPsRfakGedvuF+op
 WPZxEPmIzo4DYnKodaC2jf27gPVpgvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0i8nrKx37VLyC9ejDlu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:ulM0c6n7SoNMtKofUF7BdtSlSRnpDfL63DAbv31ZSRFFG/FwWf
 re+MjzsiWE9Ar5PUtLpTnuAtjnfZqxz+8W3WBVB8bYYOCEghrUEGgd1/qa/9SIIUSXnZ8/6U
 4jSdkFNDSZNzhHZK3BkW6F+rgbsby62ZHtr8vli1lWcSFWR5dJ0zpZYzzrbXGehzMrOXP6Lv
 ehDwZ8yQZIAU5nFvhTz0NrPtT+mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bu.edu; s=s1gsbu; t=1678695921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGGhlsD60scV1DpZM62YCeIeSkP8wBKOkjv1wo9iGSA=;
        b=IWUm5wXTEs8fJGzUTNiEGJ5W93UijudeQX3SIPonXyQiCWRasT4uyZAKEpss9x6G32
         XgC5kgTgLIWb37KqJuhSfQ2msj0imck9h4gHrwB3SbvVbyz1EvxJXlfuQyAd0F/vUQen
         eywymP2TPoklZQsPnCopQkUBPrEK7voEx/zXLcYqVhlKpAMnyfvaFbUDh+HCnxuhlC8B
         05NyIHbIKoZ8+E/PSdDfbm68VlF2RklsMQwFKoAFyM3gshdTdh1AEliEWAMpjmf8FAXV
         TTZwiOA/0t9NYTz+UailYlyCXxB7wCYYFOySGEBwYhjx/TTFyUHXnFD4kKUbT/gr+iFb
         jbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678695921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGGhlsD60scV1DpZM62YCeIeSkP8wBKOkjv1wo9iGSA=;
        b=WmGqQvW4qZWKLf4WW/hTbsvD5u8IKS5vxbjiOQqJLdQPhQtIEQ1B/vkhlfpxOsZjXR
         fT4RhWsdg2B4bLBb4eMQW5Ivxy0wtwacdi2ifBaxSXBXdexvdbRLpwFeFtB0NSRtW1vC
         VSY5CrwToYWElwyV9yjS2DwDOCHwUx5isudj62j0Iculx4RZwJFMhTZDBslQEP10gnx8
         39XDVQpYbcdWKyVjnMtJoCqzyJmxyDqYuqW2+BM15IVW64uls4N1dODruScjuIq92MAB
         6bATfod/NUBmT7R8antZirQoY6ZVh/C3V6bGLkRxQzffmcXz4i6T0O/0qmC2BigaGeg5
         9c9A==
X-Gm-Message-State: AO0yUKUiYyyAEp4EmzQkpnOd7p0y+1XCp150Bfx111TGWNmkWDbojivF
	tgbhJU3cAd5ItNnHUtnZoPe5Uik4la7A6xC+bLcG7OHEqpQRiPqOc1AO8zeguqZcrVb+9sr4d2S
	3jhP10wgWnsG/2KSE8XIBz/U8WWX/N1eRbDRlpVhXSw==
X-Received: by 2002:a05:622a:14c6:b0:3bf:c04a:8d47 with SMTP id u6-20020a05622a14c600b003bfc04a8d47mr20368021qtx.18.1678695921459;
        Mon, 13 Mar 2023 01:25:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set9WmFLO8g9mUwVjLP+1U83rvhdZrkH/htF6D/TW6/NS3x0U2pQaejLpTuNznnAPXF4HlUfYTw==
X-Received: by 2002:a05:622a:14c6:b0:3bf:c04a:8d47 with SMTP id u6-20020a05622a14c600b003bfc04a8d47mr20367996qtx.18.1678695921164;
        Mon, 13 Mar 2023 01:25:21 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mauro Matteo Cascella <mcascell@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jon Maloy <jmaloy@redhat.com>,
	Siqi Chen <coc.cyqh@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Amit Shah <amit@kernel.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Fam Zheng <fam@euphon.net>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
	qemu-block@nongnu.org (open list:virtio-blk),
	qemu-arm@nongnu.org (open list:i.MX31 (kzm)),
	qemu-ppc@nongnu.org (open list:New World (mac99))
Subject: [PATCH v7 4/6] hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
Date: Mon, 13 Mar 2023 04:24:15 -0400
Message-Id: <20230313082417.827484-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8

This protects devices from bh->mmio reentrancy issues.

Thanks: Thomas Huth <thuth@redhat.com> for diagnosing OS X test failure.
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/9pfs/xen-9p-backend.c        | 5 ++++-
 hw/block/dataplane/virtio-blk.c | 3 ++-
 hw/block/dataplane/xen-block.c  | 5 +++--
 hw/char/virtio-serial-bus.c     | 3 ++-
 hw/display/qxl.c                | 9 ++++++---
 hw/display/virtio-gpu.c         | 6 ++++--
 hw/ide/ahci.c                   | 3 ++-
 hw/ide/ahci_internal.h          | 1 +
 hw/ide/core.c                   | 4 +++-
 hw/misc/imx_rngc.c              | 6 ++++--
 hw/misc/macio/mac_dbdma.c       | 2 +-
 hw/net/virtio-net.c             | 3 ++-
 hw/nvme/ctrl.c                  | 6 ++++--
 hw/scsi/mptsas.c                | 3 ++-
 hw/scsi/scsi-bus.c              | 3 ++-
 hw/scsi/vmw_pvscsi.c            | 3 ++-
 hw/usb/dev-uas.c                | 3 ++-
 hw/usb/hcd-dwc2.c               | 3 ++-
 hw/usb/hcd-ehci.c               | 3 ++-
 hw/usb/hcd-uhci.c               | 2 +-
 hw/usb/host-libusb.c            | 6 ++++--
 hw/usb/redirect.c               | 6 ++++--
 hw/usb/xen-usb.c                | 3 ++-
 hw/virtio/virtio-balloon.c      | 5 +++--
 hw/virtio/virtio-crypto.c       | 3 ++-
 25 files changed, 66 insertions(+), 33 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 74f3a05f88..0e266c552b 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -61,6 +61,7 @@ typedef struct Xen9pfsDev {
 
     int num_rings;
     Xen9pfsRing *rings;
+    MemReentrancyGuard mem_reentrancy_guard;
 } Xen9pfsDev;
 
 static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev);
@@ -443,7 +444,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
         xen_9pdev->rings[i].ring.out = xen_9pdev->rings[i].data +
                                        XEN_FLEX_RING_SIZE(ring_order);
 
-        xen_9pdev->rings[i].bh = qemu_bh_new(xen_9pfs_bh, &xen_9pdev->rings[i]);
+        xen_9pdev->rings[i].bh = qemu_bh_new_guarded(xen_9pfs_bh,
+                                                     &xen_9pdev->rings[i],
+                                                     &xen_9pdev->mem_reentrancy_guard);
         xen_9pdev->rings[i].out_cons = 0;
         xen_9pdev->rings[i].out_size = 0;
         xen_9pdev->rings[i].inprogress = false;
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index b28d81737e..a6202997ee 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -127,7 +127,8 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
     } else {
         s->ctx = qemu_get_aio_context();
     }
-    s->bh = aio_bh_new(s->ctx, notify_guest_bh, s);
+    s->bh = aio_bh_new_guarded(s->ctx, notify_guest_bh, s,
+                               &DEVICE(vdev)->mem_reentrancy_guard);
     s->batch_notify_vqs = bitmap_new(conf->num_queues);
 
     *dataplane = s;
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 734da42ea7..d8bc39d359 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -633,8 +633,9 @@ XenBlockDataPlane *xen_block_dataplane_create(XenDevice *xendev,
     } else {
         dataplane->ctx = qemu_get_aio_context();
     }
-    dataplane->bh = aio_bh_new(dataplane->ctx, xen_block_dataplane_bh,
-                               dataplane);
+    dataplane->bh = aio_bh_new_guarded(dataplane->ctx, xen_block_dataplane_bh,
+                                       dataplane,
+                                       &DEVICE(xendev)->mem_reentrancy_guard);
 
     return dataplane;
 }
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 7d4601cb5d..dd619f0731 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -985,7 +985,8 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    port->bh = qemu_bh_new(flush_queued_data_bh, port);
+    port->bh = qemu_bh_new_guarded(flush_queued_data_bh, port,
+                                   &dev->mem_reentrancy_guard);
     port->elem = NULL;
 }
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index ec712d3ca2..c0460c4ef1 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2201,11 +2201,14 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
 
     qemu_add_vm_change_state_handler(qxl_vm_change_state_handler, qxl);
 
-    qxl->update_irq = qemu_bh_new(qxl_update_irq_bh, qxl);
+    qxl->update_irq = qemu_bh_new_guarded(qxl_update_irq_bh, qxl,
+                                          &DEVICE(qxl)->mem_reentrancy_guard);
     qxl_reset_state(qxl);
 
-    qxl->update_area_bh = qemu_bh_new(qxl_render_update_area_bh, qxl);
-    qxl->ssd.cursor_bh = qemu_bh_new(qemu_spice_cursor_refresh_bh, &qxl->ssd);
+    qxl->update_area_bh = qemu_bh_new_guarded(qxl_render_update_area_bh, qxl,
+                                              &DEVICE(qxl)->mem_reentrancy_guard);
+    qxl->ssd.cursor_bh = qemu_bh_new_guarded(qemu_spice_cursor_refresh_bh, &qxl->ssd,
+                                             &DEVICE(qxl)->mem_reentrancy_guard);
 }
 
 static void qxl_realize_primary(PCIDevice *dev, Error **errp)
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5e15c79b94..66ac9b6cc5 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1339,8 +1339,10 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 
     g->ctrl_vq = virtio_get_queue(vdev, 0);
     g->cursor_vq = virtio_get_queue(vdev, 1);
-    g->ctrl_bh = qemu_bh_new(virtio_gpu_ctrl_bh, g);
-    g->cursor_bh = qemu_bh_new(virtio_gpu_cursor_bh, g);
+    g->ctrl_bh = qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
+                                     &qdev->mem_reentrancy_guard);
+    g->cursor_bh = qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
+                                       &qdev->mem_reentrancy_guard);
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 55902e1df7..4e76d6b191 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1509,7 +1509,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
     ahci_write_fis_d2h(ad);
 
     if (ad->port_regs.cmd_issue && !ad->check_bh) {
-        ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
+        ad->check_bh = qemu_bh_new_guarded(ahci_check_cmd_bh, ad,
+                                           &ad->mem_reentrancy_guard);
         qemu_bh_schedule(ad->check_bh);
     }
 }
diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 303fcd7235..2480455372 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -321,6 +321,7 @@ struct AHCIDevice {
     bool init_d2h_sent;
     AHCICmdHdr *cur_cmd;
     NCQTransferState ncq_tfs[AHCI_MAX_CMDS];
+    MemReentrancyGuard mem_reentrancy_guard;
 };
 
 struct AHCIPCIState {
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 2d034731cf..50c8935366 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -513,6 +513,7 @@ BlockAIOCB *ide_issue_trim(
         BlockCompletionFunc *cb, void *cb_opaque, void *opaque)
 {
     IDEState *s = opaque;
+    IDEDevice *dev = s->unit ? s->bus->slave : s->bus->master;
     TrimAIOCB *iocb;
 
     /* Paired with a decrement in ide_trim_bh_cb() */
@@ -520,7 +521,8 @@ BlockAIOCB *ide_issue_trim(
 
     iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
     iocb->s = s;
-    iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
+    iocb->bh = qemu_bh_new_guarded(ide_trim_bh_cb, iocb,
+                                   &DEVICE(dev)->mem_reentrancy_guard);
     iocb->ret = 0;
     iocb->qiov = qiov;
     iocb->i = -1;
diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
index 632c03779c..082c6980ad 100644
--- a/hw/misc/imx_rngc.c
+++ b/hw/misc/imx_rngc.c
@@ -228,8 +228,10 @@ static void imx_rngc_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 
     sysbus_init_irq(sbd, &s->irq);
-    s->self_test_bh = qemu_bh_new(imx_rngc_self_test, s);
-    s->seed_bh = qemu_bh_new(imx_rngc_seed, s);
+    s->self_test_bh = qemu_bh_new_guarded(imx_rngc_self_test, s,
+                                          &dev->mem_reentrancy_guard);
+    s->seed_bh = qemu_bh_new_guarded(imx_rngc_seed, s,
+                                     &dev->mem_reentrancy_guard);
 }
 
 static void imx_rngc_reset(DeviceState *dev)
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index 43bb1f56ba..80a789f32b 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -914,7 +914,7 @@ static void mac_dbdma_realize(DeviceState *dev, Error **errp)
 {
     DBDMAState *s = MAC_DBDMA(dev);
 
-    s->bh = qemu_bh_new(DBDMA_run_bh, s);
+    s->bh = qemu_bh_new_guarded(DBDMA_run_bh, s, &dev->mem_reentrancy_guard);
 }
 
 static void mac_dbdma_class_init(ObjectClass *oc, void *data)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c32643..447f669921 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2917,7 +2917,8 @@ static void virtio_net_add_queue(VirtIONet *n, int index)
         n->vqs[index].tx_vq =
             virtio_add_queue(vdev, n->net_conf.tx_queue_size,
                              virtio_net_handle_tx_bh);
-        n->vqs[index].tx_bh = qemu_bh_new(virtio_net_tx_bh, &n->vqs[index]);
+        n->vqs[index].tx_bh = qemu_bh_new_guarded(virtio_net_tx_bh, &n->vqs[index],
+                                                  &DEVICE(vdev)->mem_reentrancy_guard);
     }
 
     n->vqs[index].tx_waiting = 0;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 49c1210fce..62e4a1d7d9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4604,7 +4604,8 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
     }
 
-    sq->bh = qemu_bh_new(nvme_process_sq, sq);
+    sq->bh = qemu_bh_new_guarded(nvme_process_sq, sq,
+                                 &DEVICE(sq->ctrl)->mem_reentrancy_guard);
 
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
@@ -5250,7 +5251,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
         }
     }
     n->cq[cqid] = cq;
-    cq->bh = qemu_bh_new(nvme_post_cqes, cq);
+    cq->bh = qemu_bh_new_guarded(nvme_post_cqes, cq,
+                                 &DEVICE(cq->ctrl)->mem_reentrancy_guard);
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index c485da792c..3de288b454 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1322,7 +1322,8 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
     }
     s->max_devices = MPTSAS_NUM_PORTS;
 
-    s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
+    s->request_bh = qemu_bh_new_guarded(mptsas_fetch_requests, s,
+                                        &DEVICE(dev)->mem_reentrancy_guard);
 
     scsi_bus_init(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info);
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..e5c9f7a53d 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -193,7 +193,8 @@ static void scsi_dma_restart_cb(void *opaque, bool running, RunState state)
         AioContext *ctx = blk_get_aio_context(s->conf.blk);
         /* The reference is dropped in scsi_dma_restart_bh.*/
         object_ref(OBJECT(s));
-        s->bh = aio_bh_new(ctx, scsi_dma_restart_bh, s);
+        s->bh = aio_bh_new_guarded(ctx, scsi_dma_restart_bh, s,
+                                   &DEVICE(s)->mem_reentrancy_guard);
         qemu_bh_schedule(s->bh);
     }
 }
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index fa76696855..4de34536e9 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -1184,7 +1184,8 @@ pvscsi_realizefn(PCIDevice *pci_dev, Error **errp)
         pcie_endpoint_cap_init(pci_dev, PVSCSI_EXP_EP_OFFSET);
     }
 
-    s->completion_worker = qemu_bh_new(pvscsi_process_completion_queue, s);
+    s->completion_worker = qemu_bh_new_guarded(pvscsi_process_completion_queue, s,
+                                               &DEVICE(pci_dev)->mem_reentrancy_guard);
 
     scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev), &pvscsi_scsi_info);
     /* override default SCSI bus hotplug-handler, with pvscsi's one */
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 88f99c05d5..f013ded91e 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -937,7 +937,8 @@ static void usb_uas_realize(USBDevice *dev, Error **errp)
 
     QTAILQ_INIT(&uas->results);
     QTAILQ_INIT(&uas->requests);
-    uas->status_bh = qemu_bh_new(usb_uas_send_status_bh, uas);
+    uas->status_bh = qemu_bh_new_guarded(usb_uas_send_status_bh, uas,
+                                         &d->mem_reentrancy_guard);
 
     dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
     scsi_bus_init(&uas->bus, sizeof(uas->bus), DEVICE(dev), &usb_uas_scsi_info);
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 8755e9cbb0..a0c4e782b2 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -1364,7 +1364,8 @@ static void dwc2_realize(DeviceState *dev, Error **errp)
     s->fi = USB_FRMINTVL - 1;
     s->eof_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_frame_boundary, s);
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_work_timer, s);
-    s->async_bh = qemu_bh_new(dwc2_work_bh, s);
+    s->async_bh = qemu_bh_new_guarded(dwc2_work_bh, s,
+                                      &dev->mem_reentrancy_guard);
 
     sysbus_init_irq(sbd, &s->irq);
 }
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index d4da8dcb8d..c930c60921 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2533,7 +2533,8 @@ void usb_ehci_realize(EHCIState *s, DeviceState *dev, Error **errp)
     }
 
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ehci_work_timer, s);
-    s->async_bh = qemu_bh_new(ehci_work_bh, s);
+    s->async_bh = qemu_bh_new_guarded(ehci_work_bh, s,
+                                      &dev->mem_reentrancy_guard);
     s->device = dev;
 
     s->vmstate = qemu_add_vm_change_state_handler(usb_ehci_vm_state_change, s);
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 8ac1175ad2..77baaa7a6b 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1190,7 +1190,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
                               USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL);
         }
     }
-    s->bh = qemu_bh_new(uhci_bh, s);
+    s->bh = qemu_bh_new_guarded(uhci_bh, s, &DEVICE(dev)->mem_reentrancy_guard);
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, uhci_frame_timer, s);
     s->num_ports_vmstate = NB_PORTS;
     QTAILQ_INIT(&s->queues);
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 176868d345..f500db85ab 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1141,7 +1141,8 @@ static void usb_host_nodev_bh(void *opaque)
 static void usb_host_nodev(USBHostDevice *s)
 {
     if (!s->bh_nodev) {
-        s->bh_nodev = qemu_bh_new(usb_host_nodev_bh, s);
+        s->bh_nodev = qemu_bh_new_guarded(usb_host_nodev_bh, s,
+                                          &DEVICE(s)->mem_reentrancy_guard);
     }
     qemu_bh_schedule(s->bh_nodev);
 }
@@ -1739,7 +1740,8 @@ static int usb_host_post_load(void *opaque, int version_id)
     USBHostDevice *dev = opaque;
 
     if (!dev->bh_postld) {
-        dev->bh_postld = qemu_bh_new(usb_host_post_load_bh, dev);
+        dev->bh_postld = qemu_bh_new_guarded(usb_host_post_load_bh, dev,
+                                             &DEVICE(dev)->mem_reentrancy_guard);
     }
     qemu_bh_schedule(dev->bh_postld);
     dev->bh_postld_pending = true;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index fd7df599bc..39fbaaab16 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1441,8 +1441,10 @@ static void usbredir_realize(USBDevice *udev, Error **errp)
         }
     }
 
-    dev->chardev_close_bh = qemu_bh_new(usbredir_chardev_close_bh, dev);
-    dev->device_reject_bh = qemu_bh_new(usbredir_device_reject_bh, dev);
+    dev->chardev_close_bh = qemu_bh_new_guarded(usbredir_chardev_close_bh, dev,
+                                                &DEVICE(dev)->mem_reentrancy_guard);
+    dev->device_reject_bh = qemu_bh_new_guarded(usbredir_device_reject_bh, dev,
+                                                &DEVICE(dev)->mem_reentrancy_guard);
     dev->attach_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, usbredir_do_attach, dev);
 
     packet_id_queue_init(&dev->cancelled, dev, "cancelled");
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 66cb3f7c24..38ee660a30 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -1032,7 +1032,8 @@ static void usbback_alloc(struct XenLegacyDevice *xendev)
 
     QTAILQ_INIT(&usbif->req_free_q);
     QSIMPLEQ_INIT(&usbif->hotplug_q);
-    usbif->bh = qemu_bh_new(usbback_bh, usbif);
+    usbif->bh = qemu_bh_new_guarded(usbback_bh, usbif,
+                                    &DEVICE(xendev)->mem_reentrancy_guard);
 }
 
 static int usbback_free(struct XenLegacyDevice *xendev)
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 746f07c4d2..d60dd1f61e 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -908,8 +908,9 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
         precopy_add_notifier(&s->free_page_hint_notify);
 
         object_ref(OBJECT(s->iothread));
-        s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
-                                     virtio_ballloon_get_free_page_hints, s);
+        s->free_page_bh = aio_bh_new_guarded(iothread_get_aio_context(s->iothread),
+                                             virtio_ballloon_get_free_page_hints, s,
+                                             &dev->mem_reentrancy_guard);
     }
 
     if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_REPORTING)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 802e1b9659..2fe804510f 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -1074,7 +1074,8 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         vcrypto->vqs[i].dataq =
                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_dataq_bh);
         vcrypto->vqs[i].dataq_bh =
-                 qemu_bh_new(virtio_crypto_dataq_bh, &vcrypto->vqs[i]);
+                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->vqs[i],
+                                     &dev->mem_reentrancy_guard);
         vcrypto->vqs[i].vcrypto = vcrypto;
     }
 
-- 
2.39.0


