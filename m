Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70A60DB90
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 08:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430355.681968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onaCP-0000xS-PM; Wed, 26 Oct 2022 06:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430355.681968; Wed, 26 Oct 2022 06:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onaCP-0000vC-Lr; Wed, 26 Oct 2022 06:47:37 +0000
Received: by outflank-mailman (input) for mailman id 430355;
 Wed, 26 Oct 2022 06:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onaCN-0000PX-KY
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 06:47:35 +0000
Received: from sonic311-25.consmr.mail.gq1.yahoo.com
 (sonic311-25.consmr.mail.gq1.yahoo.com [98.137.65.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11444c48-54fa-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 08:47:34 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 06:47:31 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 636de0ff1881defd5f865b248e2c93fc; 
 Wed, 26 Oct 2022 06:47:30 +0000 (UTC)
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
X-Inumbo-ID: 11444c48-54fa-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666766851; bh=ONSTUnovoeWnNbxOoaE6+yTq1iUkTDrGtK1eMs5++KM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=E4HBLAir0tWYpE8ai6J/4DOiDiyAdbLIlzjdErYl3dVJCLYfXKfNyZAk3//Cdk4zgo9/thT7YJjSPmtXzjvOM91CcxbMozlD8hx0eB5DZxDCNw2g1HCaJLq5L0UInsHc9bQN6tuFeHjRK/tcHqh2hRXPCgwbuA4HRBkcNyJ5FcBBS6StTcD9zhuu+dMRwOM9Q4uhBNXq9pEdV+qGaR55Dt4OKiOcv9WEleP+1ww+U3tbTjcIaaNjfruJY4qQlKfFckzCLbpdr9+dmx4fV/TVibjGJtgGbPTf358/lp2+CgDOdVyKLpcGoq/WH39T8mdbGPSV18pcA/aklVYeQBWBPg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666766851; bh=0mP3iOtuO/3KQ2/gcn+xJtP3dsmvYPLDaFVZasLlgZf=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=GSxpk23VfNm/WgShvNeaEn9AGw9bADjpdnDmJh3iAQ3CvugLpmOnyqz4PdIyi7a+bwTuorwvrlIQM6lRZ71V2uX2PlGNR5zLXDm9ZdI5UHd7qU6tvUU98GIYnWpVk3f8ok750pNLlewk3XMVOraBDcRIx66q/1CRB/yt2d/AXiBvLT7Xuk2YdJz1yyslbEmRvNaZB3Mu+6q8PYF9WsE+VWvyb1gqwa9G0JY+0ClMeO8ygDbIGS9gy2EUT1X1iC8a8h+x9/AVepATSZW6K6sy+z8H7UxbCTPAeJpcveyrRFW0dVAaw/g+GNLXySQubYeqWJoE3lEu+6ghDLJMeBg2dw==
X-YMail-OSG: qM3XLeAVM1llGWhcZRaWVdk290YNclP8zFuMfQHHT5FUWJLlQOsQqpkYLL3s07d
 qp3woHC8gEdqLmGzzIU2Puf8IAkjVBOFLbFHuaiB_VJWrhgodNsc2jsa0ajXl5ApT4DltBFxSCm7
 _isb00P.ki04vCEYsIWrlRge3gmqp1vea4Y7M.42lnY4AedkLGbRXt6HgwbjOfm.RzV6NiZNi9mt
 P5kk14m1lwXtHQAVdhqeQhwSYK.HYtVxKQtNcToR34ZxndBnyqBfw0eSSSsUjbU65GlZQkfC546E
 _fjs57KrZa1rzJ4uNHu009qOddlXXepgd4.IXP_y1s6tBztiPbch.6MR1hUgSyMYRThnf3HwBjhV
 PtJ0DYS5GV9r3OagzC3zDQR_rk_tSyy9mi9IU9P1wHSBCjIZf9CCle1Ae2k0vXdMddarW_Vx9Tkx
 ick7Pg4IGgTXCZzoxX6TMEoKz88sJHZFhv8nPFzyTKBKxSGgMK76mVhif3LkhkyCPQsRztrHLeGC
 khYYQiIvKNu.Jx.fJF8aqKYpr.89z3RFwdzM5u6cnSI3OYgwWQYUpjeRKOZp_tuEOt5tWQutsNex
 _cPXavsEBZ3MyGAPI.hfUUSY6ghe54tZ7tboBXAW8Fpik6NBNvkeTUcV87oCYgqiHekvnkDNrZBv
 DNFvMHuz9WtoIG4e4UD3ZFyTFKmF3hvFk8sAMLngqF_AKLtqAOgPYHpRPO3QS94QrnUooIIQnCNK
 J51KNLA.1QAWPcuh58oGgEoQ0HIDf2ZthVyt6bZHG8K4nxGcroczLzZhSkEDS_2QLlZ6du25c_Mn
 cTYaMEo_3Ja3.h559sNxtiSgaPJVDB3okWBlZkaJUHFIaMd9EhR6B2bFpDv3_IEATIJUhWacGXPu
 7SKbg.6O3I.as06RoFeyRmJ3zbXkIl0soqXvBkJl5Be38Draq1e6xU9Qb1o.lQxrh7A6xw8k0eAe
 6SoxtB1HaHI5Cyb6eOftREVSZdrPspEFo5b3mPvw5zKRbPZbD.lyTb3x2ON0D8WxZK9BjTIJoRDJ
 DvqAwjPlChjINfqOA6uZZtU1OaFzgMB2Vq6Fk0lTmnKLlXbILj.tfcn4Y2AT7BTFVhQPZ1wFfsxM
 zShU7SIhWbAkJkJkEjX.OOgaSjQWspcaJky7FuhXEFG9478UNgNBYAsSRgItAak8DQneUv87Rl0f
 CsDTGFUkUazNqvOt0o4x3_9k9QAXns1IeKA1BMuh5QCrnanXP6WMHq2O_83hOby0TToqXUz6DaM4
 XPnnFtWOG1w5qgk9NoXIkLYpOjQOk.hWwqDpD73KEuwJGkCFJqJiKxi8OnFzSBkWcFSTxENF3_O1
 A79BCEOLLfKsSL74EkH.q7dqm1KEP3nQqtafR_OPAKyfVu8nVdhveUoJjwB4T9o_M6psHQqIgs_q
 qmzk.epIRWrrpKf5_gbGNfKATxQf43U9Ws9YcmzmBwl2mCQW45sbdOOoeKuNh8fatVkVmmCCXwFk
 vxNIsjvgRoj9mykP8FQA3zdEKmv8AZfyw.aXFfhEwdRyMx9LR7yXaY2T1QSmoHE.TTo00bGwnGDK
 FrmMEAMB8iU.peYrvLrvVZmPdpb4Tw40gh8licK1wSv_ze33aktdxVYUPnFyldhx_uRSi_57aQlE
 Qn4GM44NulurGr0n4BQX_pdalFeFkF74Ab7EOxtaKiR5T1tFGcDioUERpKNE0XTb3x0ptnRotfos
 ISKhHtAmSZPBgzB35vPHEyJUUGfkQaqv9vKtNg9I2SMATkLAzFze46EJmxeFBs87gApnx.pcnjZu
 hL4zY4QbcXLLpIQf8SkgMtMMwEmRPX6QXsKxUT5eyGClhMXdemCStlLXytsTrCZkiiYxYVzoBvp_
 wHEvZ.XM6jXvAwcUHUjQc46DuVSv_QTkWfSAbseQWF.ZtsaDcabEvS0J47To9yET.sLBqsAIuxRv
 dDtJwQ5Xe68v41Z5VF4rLdiMFY.NeoSIuDOdpgqOwfOLP2LbmWRzsl4GbZPqCzs9dllE9mWaQYLM
 cB9swMSKjbMbL9hoONz9apmzPAAsIE2Jzm1ZdvR5e44oNnp.mUvppR.Gt82RueY_4YlrDWhU0wSy
 y4IbsghVeFS7zIFM3.ciaAbwbZ29jpPeK2zYRcgdzmWgPxixvxByFeXECFtJoZYjhuZShkPshsAu
 _ZjXGD.8tR4xj8UwJH2Dh.VA8bRlfU.z7GjTeg4.baOadCKQj.ElrMJuNbeH7i5fHSq3wUC8L0Fw
 dMoz1A8uDWbSO
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Chuck Zmudzinski <brchuckz@netscape.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Wed, 26 Oct 2022 02:47:08 -0400
Message-Id: <1b98334dd30af4a467170237c8a31c1824ee9c37.1666764146.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666764146.git.brchuckz@netscape.net>
References: <cover.1666764146.git.brchuckz@netscape.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Zmudzinski <brchuckz@netscape.net>

Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
as noted in docs/igd-assign.txt in the Qemu source code.

Currently, when the xl toolstack is used to configure a Xen HVM guest with
Intel IGD passthrough to the guest with the Qemu upstream device model,
a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
a different slot. This problem often prevents the guest from booting.

The only available workaround is not good: Configure Xen HVM guests to use
the old and no longer maintained Qemu traditional device model available
from xenbits.xen.org which does reserve slot 2 for the Intel IGD.

To implement this feature in the Qemu upstream device model for Xen HVM
guests, introduce the following new class, functions, types, and macros:

* XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
* XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
* typedef XenPTQdevRealize function pointer
* XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
* xen_igd_reserve_slot and xen_igd_clear_slot functions

The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
the xl toolstack with the gfx_passthru option enabled, which sets the
igd-passthru=on option to Qemu for the Xen HVM machine type.

The new xen_igd_reserve_slot function also needs to be implemented in
hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
in which case it does nothing.

The new xen_igd_clear_slot function overrides qdev->realize of the parent
PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
created in hw/i386/pc_piix.c for the case when igd-passthru=on.

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
---
Notes that might be helpful to reviewers of patched code in hw/xen:

The new functions and types are based on recommendations from Qemu docs:
https://qemu.readthedocs.io/en/latest/devel/qom.html

Notes that might be helpful to reviewers of patched code in hw/i386:

The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
not affect builds that do not have CONFIG_XEN defined.

xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
existing function that is only true when Qemu is built with
xen-pci-passthrough enabled and the administrator has configured the Xen
HVM guest with Qemu's igd-passthru=on option.

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0b1a79c0fa..a0f04ad62e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -402,6 +402,9 @@ static void pc_xen_hvm_init(MachineState *machine)
     }
 
     pc_xen_hvm_init_pci(machine);
+    if (xen_igd_gfx_pt_enabled()) {
+        xen_igd_reserve_slot(pcms->bus);
+    }
     pci_create_simple(pcms->bus, -1, "xen-platform");
 }
 #endif
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0ec7e52183..ec42f47fac 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -950,11 +950,35 @@ static void xen_pci_passthrough_instance_init(Object *obj)
     PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
+    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+}
+
+static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
+{
+    PCIDevice *pci_dev = (PCIDevice *)qdev;
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
+    XenPTDeviceClass *xptc = XEN_PT_DEVICE_GET_CLASS(s);
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    if (is_igd_vga_passthrough(&s->real_device) &&
+        (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
+        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
+    }
+    xptc->pci_qdev_realize(qdev, errp);
+}
+
 static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    XenPTDeviceClass *xptc = XEN_PT_DEVICE_CLASS(klass);
+    xptc->pci_qdev_realize = dc->realize;
+    dc->realize = xen_igd_clear_slot;
     k->realize = xen_pt_realize;
     k->exit = xen_pt_unregister_device;
     k->config_read = xen_pt_pci_read_config;
@@ -977,6 +1001,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_size = sizeof(XenPCIPassthroughState),
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
+    .class_size = sizeof(XenPTDeviceClass),
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index e7c4316a7d..40b31b5263 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -3,6 +3,7 @@
 
 #include "hw/xen/xen_common.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
@@ -41,7 +42,20 @@ typedef struct XenPTReg XenPTReg;
 #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
 OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
+#define XEN_PT_DEVICE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
+#define XEN_PT_DEVICE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
+
+typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
+
+typedef struct XenPTDeviceClass {
+    PCIDeviceClass parent_class;
+    XenPTQdevRealize pci_qdev_realize;
+} XenPTDeviceClass;
+
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
+void xen_igd_reserve_slot(PCIBus *pci_bus);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
                                            XenHostPCIDevice *dev);
@@ -76,6 +90,8 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
+
 typedef enum {
     XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
     XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
index 2d8cac8d54..5c108446a8 100644
--- a/hw/xen/xen_pt_stub.c
+++ b/hw/xen/xen_pt_stub.c
@@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
         error_setg(errp, "Xen PCI passthrough support not built in");
     }
 }
+
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+}
-- 
2.37.2


