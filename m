Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D627AFFA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 16:28:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMu8L-0002iS-92; Mon, 28 Sep 2020 14:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymH5=DF=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kMu8K-0002iN-5V
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 14:28:04 +0000
X-Inumbo-ID: 05cf1b2f-0e01-439a-badc-df3897cb1464
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05cf1b2f-0e01-439a-badc-df3897cb1464;
 Mon, 28 Sep 2020 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601303282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AzYH+r7Nb2YA5veowUz88+4SyTqWkYjLvEdZaIAZ9zM=;
 b=NE17V+fzxE/5cSYk7cisJQPDjmvqf0Fc5lWdE6QgKT2NYC5+mQNFWzX3
 wACTs41VuR7MqjndMLPJywItGdPEGKBjaTOtUzWM+Y9BtFXyQF2O8iTRS
 2ioRnTzkAMRX2x1m4YwZGRjicrnqjNy3rMI3F8+3+H+ROysvcJffLMZWt I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pK4Ac5EFsMkfuFIBNX6f+3amQKPh3gW4zqIb4TUwev4WCJugBt++jIarIaoky4qmDYumylYIPU
 U/ilDUaQXGTPZx9ID4Y8fGEnTOEuE0FkoRXS0A9clNli3ny01pdO521N2hWRywJ7sJ0Ij5nksB
 rdpp44qb9WjmR7nXKgetL/QO+rRAwRoAxbQXoN6SkzBfBasJgU3gqcIkOYxMv4ZAkc9UKJVV+A
 CPijcVkHIzlgwB6sGvVSi/dChgaztgTCGdm0FB6PgthV2ATzvb/XnFpojfv2WlE0X4JBy2frvG
 QQ4=
X-SBRS: None
X-MesageID: 28039618
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208,223";a="28039618"
Date: Mon, 28 Sep 2020 15:27:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <paul@xen.org>
CC: 'Brian Marcotte' <marcotte@panix.com>, 'Paul Durrant'
 <xadimgnik@gmail.com>, 'Jules' <jules@ispire.me>,
 <xen-devel@lists.xenproject.org>, <oleksandr_grytsov@epam.com>, <wl@xen.org>
Subject: Re: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
Message-ID: <20200928142757.GA2006946@perard.uk.xensource.com>
References: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
 <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
 <20200715191705.GA20643@panix.com> <000b01d65b40$ab7fead0$027fc070$@xen.org>
 <20200716202331.GA9471@panix.com> <003401d65c0e$995bb4f0$cc131ed0$@xen.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <003401d65c0e$995bb4f0$cc131ed0$@xen.org>
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

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 17, 2020 at 08:48:01AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Brian Marcotte <marcotte@panix.com>
> > Sent: 16 July 2020 21:24
> > To: Paul Durrant <xadimgnik@gmail.com>
> > Cc: paul@xen.org; 'Jules' <jules@ispire.me>; xen-devel@lists.xenproject.org;
> > oleksandr_grytsov@epam.com; wl@xen.org
> > Subject: Re: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
> > 
> > > Your issue stems from the auto-creation code in xen-block:
> > >
> > > The "aio:rbd:rbd/machine.disk0" string is generated by libxl and does
> > > look a little odd and will fool the parser there, but the error you see
> > > after modifying the string appears to be because QEMU's QMP block
> > > device instantiation code is objecting to a missing parameter. Older
> > > QEMUs circumvented that code which is almost certainly why you don't
> > > see the issue with versions 2 or 3.
> > 
> > Xen 4.13 and 4.14 includes QEMU 4 and 5. They don't work with Ceph/RBD.
> > 
> > Are you saying that xl/libxl is doing the right thing and the problem
> > needs to be fixed in QEMU?
> 
> Unfortunately, from what you describe, it sounds like there is a problem in both. To get something going, you could bring a domain
> up paused and then try manually adding your rbd device using the QMP shell.
> 
> It would be useful if a toolstack maintainer could take a look at this issue in the near future.
> 

Hi,

I did start working on a solution some time ago and produced a patch for
QEMU (attached) which would allow QEMU to parse the aio:rdb:... string
from xenstore.

But I ran into an other issue when I tried with nbd (Network Block
Device), QEMU would connect twice to the NBD server and the server I had
didn't like it. Maybe Ceph would allow two connections to the same disk?

The two connections issue is less likely to happen on older QEMU because
it would delay the second connection until the guest connect to the PV
backend, so after the emulated disk has been unplugged (and thus the
first connection disconnected).

Anyway, it would be better to upgrade libxl to be able to create a QEMU
PV backend via QMP or qemu's command line rather than via xenstore, but
I don't think I have time to work on it just yet. But I feel like we are
going to have the same issue that QEMU will try to connect twice to the
Ceph server where this wasn't likely to happen before.

Jules, Brian, could you maybe try the attach QEMU patch and see if that
works?

Cheers,

-- 
Anthony PERARD

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="0001-xen-block-Fix-parsing-of-legacy-options.patch"

From 1b8d700007f1f8709a6ef1960111ea022cfb6d74 Mon Sep 17 00:00:00 2001
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 17 Jan 2020 12:05:09 +0000
Subject: [PATCH] xen-block: Fix parsing of legacy options

Even though the xen-disk PV backend can be instantiated via QMP, we
still need to handle the case where the backend is created via
xenstore. This means that we need to be able to parse legacy disk
options such as "aio:nbd://host:1234/disk".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 block.c                        |  6 ++++++
 hw/block/xen-block.c           | 25 +++++++++++++++++++++----
 include/sysemu/block-backend.h |  3 +++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index ecd09dbbfd89..13b8690e5006 100644
--- a/block.c
+++ b/block.c
@@ -1705,6 +1705,12 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 
     return 0;
 }
+int bdrv_fill_options_legacy(QDict **options, const char *filename,
+                             int *flags, Error **errp)
+{
+    return bdrv_fill_options(options, filename, flags, errp);
+}
+
 
 static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
                                  uint64_t perm, uint64_t shared,
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 879fc310a4c5..1cc97a001e1f 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -28,6 +28,7 @@
 #include "sysemu/iothread.h"
 #include "dataplane/xen-block.h"
 #include "trace.h"
+#include "include/block/qdict.h"
 
 static char *xen_block_get_name(XenDevice *xendev, Error **errp)
 {
@@ -687,7 +688,12 @@ static char *xen_block_blockdev_add(const char *id, QDict *qdict,
 
     trace_xen_block_blockdev_add(node_name);
 
-    v = qobject_input_visitor_new(QOBJECT(qdict));
+    qdict_flatten(qdict);
+    v = qobject_input_visitor_new_flat_confused(qdict, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto fail;
+    }
     visit_type_BlockdevOptions(v, NULL, &options, &local_err);
     visit_free(v);
 
@@ -782,8 +788,14 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     file_layer = qdict_new();
     driver_layer = qdict_new();
 
-    qdict_put_str(file_layer, "driver", "file");
-    qdict_put_str(file_layer, "filename", filename);
+    int flags = BDRV_O_PROTOCOL | BDRV_O_RDWR;
+    if (mode && *mode != 'w') {
+        flags &= ~BDRV_O_RDWR;
+    }
+    bdrv_fill_options_legacy(&file_layer, filename, &flags, &local_err);
+    if (local_err)
+        goto done;
+
     g_free(filename);
 
     if (mode && *mode != 'w') {
@@ -816,7 +828,12 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
      * It is necessary to turn file locking off as an emulated device
      * may have already opened the same image file.
      */
-    qdict_put_str(file_layer, "locking", "off");
+    const char *file_driver = qdict_get_str(file_layer, "driver");
+    if (!strcmp("file", file_driver) ||
+        !strcmp("host_device", file_driver) ||
+        !strcmp("host_cdrom", file_driver)
+        )
+        qdict_put_str(file_layer, "locking", "off");
 
     qdict_put_str(driver_layer, "driver", driver);
     g_free(driver);
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index b198deca0b24..93efded0ab61 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -98,6 +98,9 @@ void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
+/* deprecated, not to be used for new backends */
+int bdrv_fill_options_legacy(QDict **options, const char *filename,
+                             int *flags, Error **errp);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
                  Error **errp);
 void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm);
-- 
Anthony PERARD


--Q68bSM7Ycu6FN28Q--

