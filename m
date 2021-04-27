Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0735336BC9C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 02:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117946.223891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBW0-0007rW-8r; Tue, 27 Apr 2021 00:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117946.223891; Tue, 27 Apr 2021 00:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBW0-0007qw-5E; Tue, 27 Apr 2021 00:23:48 +0000
Received: by outflank-mailman (input) for mailman id 117946;
 Tue, 27 Apr 2021 00:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jew=JY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lbBVy-0007mO-IG
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 00:23:46 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e946aa0-51b7-41c1-ac44-77d88261096f;
 Tue, 27 Apr 2021 00:23:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 798F45C017C;
 Mon, 26 Apr 2021 20:23:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 26 Apr 2021 20:23:37 -0400
Received: from localhost.localdomain (ip5b434f04.dynamic.kabel-deutschland.de
 [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id BAAD6108005F;
 Mon, 26 Apr 2021 20:23:36 -0400 (EDT)
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
X-Inumbo-ID: 8e946aa0-51b7-41c1-ac44-77d88261096f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=c2QDLs+tJ379utFzbl/w+Nqe4CBOem8f00hNMpbEn
	bU=; b=AJXJHgSOQcqW0r01N3LcHa4VJa1gE4dtvghNkuJbrgkVZiecPzGKXSY/+
	oCNM8kkzWcyyRfLg6xU7BUvLVZrWanIVNnXR4XPhT9Ospu+xOaxLE0CaYQHiKVGF
	hUjwR1ZcqKitWWxdKH5DmpViUCzinSivzI4K88vfsz/85YYJ3j2gD/hiC3s6EqPV
	Bv2510pdw0ap/aYRyFEmNrIYGMF6zWoPBCOl9bQWX5soNNDcGCtfESP9Z1iDaAF+
	ygYtINZ68CNlibKCL0f2WLklhkO+4n1eijQ7bQznq7d5NLa9Rkx//vK4iRw/NNLQ
	wrvMBLtvjneE/ZSCoXbO2yuU40VRA==
X-ME-Sender: <xms:iVmHYLES6LrHJBbVSoVJsGIFYyRl1csw2XT7lNU26KP4tJqFIq3cvg>
    <xme:iVmHYEPOq8UfXT6iFemZw3ORNfLb7VwG_soJLGoQj_zqRybKJFrdDW2XHgY1YgRLD
    GZNLTH41ASclw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfei
    ueethfeivdetffetueeftdeileeiteeiudefveeugedvfeeggeeiudekteeunecuffhomh
    grihhnpehpohgurdhinhenucfkphepledurdeijedrjeelrdegnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:iVmHYKIfBpX-ZZLYSKL2n0earZEEWS2kQO-24x6U1R89Htb3cEd6Ig>
    <xmx:iVmHYN9ukFa6j4YYTUvOOCbWjtecmAKXbAlMGb0VgLbqQKqthWCA7A>
    <xmx:iVmHYGHIAP-wbZ_zBom0lfp5L6r0pcfGtzavtLcxXV1-ga7tkUtjBA>
    <xmx:iVmHYIwCEvDOaLoJU2mEw_ekMcM_x3QzKF5nmwObnTw4MkrowArQjQ>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH 2/2] libxl: allow to skip block script completely
Date: Tue, 27 Apr 2021 02:22:32 +0200
Message-Id: <25fbb81f8f7805a390613521dadedaeab4cd4563.1619482896.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
References: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Default block script is quite slow and requires global lock which slows
it down even more (for domains with multiple disks). The common case of
a block device-based disk is trivial to handle and does not require
locking. This can be handled directly within libxl, to avoid slow script
execution and waiting for it to finish. This, depending on the hardware,
may save about 0.5s of domain start time per disk.

Allow setting script name to empty string to skip executing the script
at all, and use target name as a block device path directly.

This does skip two functions of the block script:
 - checking if device isn't used anywhere else (including mounted in
   dom0)
 - setting up loop device for a file-based disk

The former is expected to be done by the operator manually (or by a
higher level management stack, that calls into libxl). The later is a
limitation of the current implementation, but should be possible to
extend in the future.

The code to fill 'physical-device' xenstore node is added via
libxl__hotplug_disk() (in libxl_linux.c) intentionally. This code is
called in device backend domain (which may be not dom0), contrary to
device_disk_add() which fills all the other xenstore entries, but is
called always in the toolstack domain (dom0).
libxl__hoplug_disk() is called from libxl__get_hotplug_script_info(),
which may not sound like the most logical place to actually change
some state, but it is called when we need it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/man/xl-disk-configuration.5.pod.in |  4 ++-
 tools/libs/light/libxl_disk.c           |  7 ++-
 tools/libs/light/libxl_linux.c          | 62 ++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index 71d0e86e3d63..3b3b3c329e13 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -261,6 +261,10 @@ information to be interpreted by the executable program I<SCRIPT>,
 
 These scripts are normally called "block-I<SCRIPT>".
 
+Setting empty script avoids calling the hoplug script at all (including
+the default one). It skips device sharing safety check and
+requires the target to point at a block device. Empty script value is supported
+on Linux backend domain only.
 
 =item B<direct-io-safe>
 
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 411ffeaca6ce..4278db449a2f 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -324,8 +324,11 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
                 flexarray_append(back, "params");
                 flexarray_append(back, dev);
 
-                script = libxl__abs_path(gc, disk->script?: "block",
-                                         libxl__xen_script_dir_path());
+                if (disk->script && !disk->script[0])
+                    script = "";
+                else
+                    script = libxl__abs_path(gc, disk->script?: "block",
+                                             libxl__xen_script_dir_path());
                 flexarray_append_pair(back, "script", script);
 
                 assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD);
diff --git a/tools/libs/light/libxl_linux.c b/tools/libs/light/libxl_linux.c
index cc8baf5c3eae..8832f2c6483a 100644
--- a/tools/libs/light/libxl_linux.c
+++ b/tools/libs/light/libxl_linux.c
@@ -160,6 +160,62 @@ out:
     return rc;
 }
 
+static int libxl__hotplug_disk_direct_add(libxl__gc *gc, libxl__device *dev,
+                                      const char *be_path)
+{
+    char *params;
+    xs_transaction_t t = XBT_NULL;
+    struct stat st;
+    int rc = 0;
+    char *xs_kvs[] = { "physical-device", NULL,
+                       "physical-device-path", NULL,
+                       "hotplug-status", "connected",
+                       NULL, NULL, };
+
+    for (;;) {
+        rc = libxl__xs_transaction_start(gc, &t);
+        if (rc) goto error;
+
+        params = libxl__xs_read(gc, t,
+                                GCSPRINTF("%s/%s", be_path, "params"));
+        if (!params) {
+            rc = ERROR_FAIL;
+            goto error;
+        }
+
+        if (stat(params, &st) == -1) {
+            LOGED(ERROR, dev->domid, "failed to stat %s", params);
+            rc = ERROR_FAIL;
+            goto error;
+        }
+
+        if ((st.st_mode & S_IFMT) != S_IFBLK) {
+            LOGD(ERROR, dev->domid, "not a block device: %s", params);
+            rc = ERROR_FAIL;
+            goto error;
+        }
+
+        xs_kvs[1] = GCSPRINTF("%x:%x", major(st.st_rdev), minor(st.st_rdev));
+        xs_kvs[3] = params;
+        rc = libxl__xs_writev(gc, t, be_path, xs_kvs);
+        if (rc) goto error;
+
+        rc = libxl__xs_transaction_commit(gc, &t);
+        if (!rc) break;
+        if (rc < 0) goto error;
+    }
+
+    return 0;
+
+error:
+    libxl__xs_transaction_abort(gc, &t);
+    if (libxl__xs_write_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/%s", be_path, "hotplug-status"),
+                                "error"))
+        LOGD(ERROR, dev->domid, "failed to write 'hotplug-status'");
+    return rc;
+}
+
 static int libxl__hotplug_disk(libxl__gc *gc, libxl__device *dev,
                                char ***args, char ***env,
                                libxl__device_action action)
@@ -177,6 +233,12 @@ static int libxl__hotplug_disk(libxl__gc *gc, libxl__device *dev,
         goto out;
     }
 
+    if (!script[0]) {
+        if (action == LIBXL__DEVICE_ACTION_ADD)
+            rc = libxl__hotplug_disk_direct_add(gc, dev, be_path);
+        goto out;
+    }
+
     *env = get_hotplug_env(gc, script, dev);
     if (!*env) {
         LOGD(ERROR, dev->domid, "Failed to get hotplug environment");
-- 
git-series 0.9.1

