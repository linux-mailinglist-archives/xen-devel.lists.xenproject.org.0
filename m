Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF941C017
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198731.352404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUIa-0006Ov-Az; Wed, 29 Sep 2021 07:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198731.352404; Wed, 29 Sep 2021 07:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUIa-0006Lm-5d; Wed, 29 Sep 2021 07:46:40 +0000
Received: by outflank-mailman (input) for mailman id 198731;
 Wed, 29 Sep 2021 07:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVUIZ-0005MR-4k
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:46:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 575f9921-20f9-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 07:46:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A43DB202F7;
 Wed, 29 Sep 2021 07:46:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CA9D13A81;
 Wed, 29 Sep 2021 07:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mNlYIc4ZVGFRdwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Sep 2021 07:46:22 +0000
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
X-Inumbo-ID: 575f9921-20f9-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632901582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U60TGLLCuRAteDFsQE6aIpjaYyccPZyDPUn8cXp1mP4=;
	b=KnE/iJi48/IW9TXMt/sZTLIPKEK60yyhqJ7GZ/YYpfp3DXKJWvyjQd8GAu01TYbBn1u9iz
	G6qBn6QHfVQ6XY8fPBz5Svb2Dob0J8aONL9nTVm31HeNut0wGDrTEDX86efCW5+K5YvTgo
	PNz1EBtGky5nVuggn2xCGSmRU/TzCxw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/3] include/public: fix style of usbif.h
Date: Wed, 29 Sep 2021 09:46:20 +0200
Message-Id: <20210929074620.28495-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929074620.28495-1-jgross@suse.com>
References: <20210929074620.28495-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbif.h is violating the Xen hypervisor coding style. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch (Jan Beulich)
---
 xen/include/public/io/usbif.h | 196 +++++++++++++++++-----------------
 1 file changed, 98 insertions(+), 98 deletions(-)

diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
index dd378bcba5..c0a552e195 100644
--- a/xen/include/public/io/usbif.h
+++ b/xen/include/public/io/usbif.h
@@ -266,134 +266,134 @@
  */
 
 enum usb_spec_version {
-	USB_VER_UNKNOWN = 0,
-	USB_VER_USB11,
-	USB_VER_USB20,
-	USB_VER_USB30,	/* not supported yet */
+    USB_VER_UNKNOWN = 0,
+    USB_VER_USB11,
+    USB_VER_USB20,
+    USB_VER_USB30,    /* not supported yet */
 };
 
 /*
  *  USB pipe in usbif_request
  *
- *  - port number:	bits 0-4
- *				(USB_MAXCHILDREN is 31)
+ *  - port number:      bits 0-4
+ *                              (USB_MAXCHILDREN is 31)
  *
- *  - operation flag:	bit 5
- *				(0 = submit urb,
- *				 1 = unlink urb)
+ *  - operation flag:   bit 5
+ *                              (0 = submit urb,
+ *                               1 = unlink urb)
  *
- *  - direction:		bit 7
- *				(0 = Host-to-Device [Out]
- *				 1 = Device-to-Host [In])
+ *  - direction:        bit 7
+ *                              (0 = Host-to-Device [Out]
+ *                               1 = Device-to-Host [In])
  *
- *  - device address:	bits 8-14
+ *  - device address:   bits 8-14
  *
- *  - endpoint:		bits 15-18
+ *  - endpoint:         bits 15-18
  *
- *  - pipe type:	bits 30-31
- *				(00 = isochronous, 01 = interrupt,
- *				 10 = control, 11 = bulk)
+ *  - pipe type:        bits 30-31
+ *                              (00 = isochronous, 01 = interrupt,
+ *                               10 = control, 11 = bulk)
  */
 
-#define USBIF_PIPE_PORT_MASK	0x0000001f
-#define USBIF_PIPE_UNLINK	0x00000020
-#define USBIF_PIPE_DIR		0x00000080
-#define USBIF_PIPE_DEV_MASK	0x0000007f
-#define USBIF_PIPE_DEV_SHIFT	8
-#define USBIF_PIPE_EP_MASK	0x0000000f
-#define USBIF_PIPE_EP_SHIFT	15
-#define USBIF_PIPE_TYPE_MASK	0x00000003
-#define USBIF_PIPE_TYPE_SHIFT	30
-#define USBIF_PIPE_TYPE_ISOC	0
-#define USBIF_PIPE_TYPE_INT	1
-#define USBIF_PIPE_TYPE_CTRL	2
-#define USBIF_PIPE_TYPE_BULK	3
+#define USBIF_PIPE_PORT_MASK    0x0000001f
+#define USBIF_PIPE_UNLINK       0x00000020
+#define USBIF_PIPE_DIR          0x00000080
+#define USBIF_PIPE_DEV_MASK     0x0000007f
+#define USBIF_PIPE_DEV_SHIFT    8
+#define USBIF_PIPE_EP_MASK      0x0000000f
+#define USBIF_PIPE_EP_SHIFT     15
+#define USBIF_PIPE_TYPE_MASK    0x00000003
+#define USBIF_PIPE_TYPE_SHIFT   30
+#define USBIF_PIPE_TYPE_ISOC    0
+#define USBIF_PIPE_TYPE_INT     1
+#define USBIF_PIPE_TYPE_CTRL    2
+#define USBIF_PIPE_TYPE_BULK    3
 
-#define usbif_pipeportnum(pipe)			((pipe) & USBIF_PIPE_PORT_MASK)
-#define usbif_setportnum_pipe(pipe, portnum)	((pipe) | (portnum))
+#define usbif_pipeportnum(pipe)                 ((pipe) & USBIF_PIPE_PORT_MASK)
+#define usbif_setportnum_pipe(pipe, portnum)    ((pipe) | (portnum))
 
-#define usbif_pipeunlink(pipe)			((pipe) & USBIF_PIPE_UNLINK)
-#define usbif_pipesubmit(pipe)			(!usbif_pipeunlink(pipe))
-#define usbif_setunlink_pipe(pipe)		((pipe) | USBIF_PIPE_UNLINK)
+#define usbif_pipeunlink(pipe)                  ((pipe) & USBIF_PIPE_UNLINK)
+#define usbif_pipesubmit(pipe)                  (!usbif_pipeunlink(pipe))
+#define usbif_setunlink_pipe(pipe)              ((pipe) | USBIF_PIPE_UNLINK)
 
-#define usbif_pipein(pipe)			((pipe) & USBIF_PIPE_DIR)
-#define usbif_pipeout(pipe)			(!usbif_pipein(pipe))
+#define usbif_pipein(pipe)                      ((pipe) & USBIF_PIPE_DIR)
+#define usbif_pipeout(pipe)                     (!usbif_pipein(pipe))
 
-#define usbif_pipedevice(pipe)			\
-		(((pipe) >> USBIF_PIPE_DEV_SHIFT) & USBIF_PIPE_DEV_MASK)
+#define usbif_pipedevice(pipe)                  \
+        (((pipe) >> USBIF_PIPE_DEV_SHIFT) & USBIF_PIPE_DEV_MASK)
 
-#define usbif_pipeendpoint(pipe)		\
-		(((pipe) >> USBIF_PIPE_EP_SHIFT) & USBIF_PIPE_EP_MASK)
+#define usbif_pipeendpoint(pipe)                \
+        (((pipe) >> USBIF_PIPE_EP_SHIFT) & USBIF_PIPE_EP_MASK)
 
-#define usbif_pipetype(pipe)			\
-		(((pipe) >> USBIF_PIPE_TYPE_SHIFT) & USBIF_PIPE_TYPE_MASK)
-#define usbif_pipeisoc(pipe)	(usbif_pipetype(pipe) == USBIF_PIPE_TYPE_ISOC)
-#define usbif_pipeint(pipe)	(usbif_pipetype(pipe) == USBIF_PIPE_TYPE_INT)
-#define usbif_pipectrl(pipe)	(usbif_pipetype(pipe) == USBIF_PIPE_TYPE_CTRL)
-#define usbif_pipebulk(pipe)	(usbif_pipetype(pipe) == USBIF_PIPE_TYPE_BULK)
+#define usbif_pipetype(pipe)                    \
+        (((pipe) >> USBIF_PIPE_TYPE_SHIFT) & USBIF_PIPE_TYPE_MASK)
+#define usbif_pipeisoc(pipe)    (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_ISOC)
+#define usbif_pipeint(pipe)     (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_INT)
+#define usbif_pipectrl(pipe)    (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_CTRL)
+#define usbif_pipebulk(pipe)    (usbif_pipetype(pipe) == USBIF_PIPE_TYPE_BULK)
 
 #define USBIF_MAX_SEGMENTS_PER_REQUEST (16)
-#define USBIF_MAX_PORTNR	31
-#define USBIF_RING_SIZE	4096
+#define USBIF_MAX_PORTNR        31
+#define USBIF_RING_SIZE         4096
 
 /*
  * RING for transferring urbs.
  */
 struct usbif_request_segment {
-	grant_ref_t gref;
-	uint16_t offset;
-	uint16_t length;
+    grant_ref_t gref;
+    uint16_t offset;
+    uint16_t length;
 };
 
 struct usbif_urb_request {
-	uint16_t id; /* request id */
-	uint16_t nr_buffer_segs; /* number of urb->transfer_buffer segments */
+    uint16_t id;                  /* request id */
+    uint16_t nr_buffer_segs;      /* number of urb->transfer_buffer segments */
 
-	/* basic urb parameter */
-	uint32_t pipe;
-	uint16_t transfer_flags;
-#define USBIF_SHORT_NOT_OK	0x0001
-	uint16_t buffer_length;
-	union {
-		uint8_t ctrl[8]; /* setup_packet (Ctrl) */
+    /* basic urb parameter */
+    uint32_t pipe;
+    uint16_t transfer_flags;
+#define USBIF_SHORT_NOT_OK      0x0001
+    uint16_t buffer_length;
+    union {
+        uint8_t ctrl[8];                 /* setup_packet (Ctrl) */
 
-		struct {
-			uint16_t interval; /* maximum (1024*8) in usb core */
-			uint16_t start_frame; /* start frame */
-			uint16_t number_of_packets; /* number of ISO packet */
-			uint16_t nr_frame_desc_segs; /* number of iso_frame_desc segments */
-		} isoc;
+        struct {
+            uint16_t interval;           /* maximum (1024*8) in usb core */
+            uint16_t start_frame;        /* start frame */
+            uint16_t number_of_packets;  /* number of ISO packet */
+            uint16_t nr_frame_desc_segs; /* number of iso_frame_desc segments */
+        } isoc;
 
-		struct {
-			uint16_t interval; /* maximum (1024*8) in usb core */
-			uint16_t pad[3];
-		} intr;
+        struct {
+            uint16_t interval;           /* maximum (1024*8) in usb core */
+            uint16_t pad[3];
+        } intr;
 
-		struct {
-			uint16_t unlink_id; /* unlink request id */
-			uint16_t pad[3];
-		} unlink;
+        struct {
+            uint16_t unlink_id;          /* unlink request id */
+            uint16_t pad[3];
+        } unlink;
 
-	} u;
+    } u;
 
-	/* urb data segments */
-	struct usbif_request_segment seg[USBIF_MAX_SEGMENTS_PER_REQUEST];
+    /* urb data segments */
+    struct usbif_request_segment seg[USBIF_MAX_SEGMENTS_PER_REQUEST];
 };
 typedef struct usbif_urb_request usbif_urb_request_t;
 
 struct usbif_urb_response {
-	uint16_t id; /* request id */
-	uint16_t start_frame;  /* start frame (ISO) */
-	int32_t status; /* status (non-ISO) */
-#define USBIF_STATUS_OK		0
-#define USBIF_STATUS_NODEV	(-19)
-#define USBIF_STATUS_INVAL	(-22)
-#define USBIF_STATUS_STALL	(-32)
-#define USBIF_STATUS_IOERROR	(-71)
-#define USBIF_STATUS_BABBLE	(-75)
-#define USBIF_STATUS_SHUTDOWN	(-108)
-	int32_t actual_length; /* actual transfer length */
-	int32_t error_count; /* number of ISO errors */
+    uint16_t id;           /* request id */
+    uint16_t start_frame;  /* start frame (ISO) */
+    int32_t status;        /* status (non-ISO) */
+#define USBIF_STATUS_OK         0
+#define USBIF_STATUS_NODEV      (-19)
+#define USBIF_STATUS_INVAL      (-22)
+#define USBIF_STATUS_STALL      (-32)
+#define USBIF_STATUS_IOERROR    (-71)
+#define USBIF_STATUS_BABBLE     (-75)
+#define USBIF_STATUS_SHUTDOWN   (-108)
+    int32_t actual_length; /* actual transfer length */
+    int32_t error_count;   /* number of ISO errors */
 };
 typedef struct usbif_urb_response usbif_urb_response_t;
 
@@ -404,18 +404,18 @@ DEFINE_RING_TYPES(usbif_urb, struct usbif_urb_request, struct usbif_urb_response
  * RING for notifying connect/disconnect events to frontend
  */
 struct usbif_conn_request {
-	uint16_t id;
+    uint16_t id;
 };
 typedef struct usbif_conn_request usbif_conn_request_t;
 
 struct usbif_conn_response {
-	uint16_t id; /* request id */
-	uint8_t portnum; /* port number */
-	uint8_t speed; /* usb_device_speed */
-#define USBIF_SPEED_NONE	0
-#define USBIF_SPEED_LOW		1
-#define USBIF_SPEED_FULL	2
-#define USBIF_SPEED_HIGH	3
+    uint16_t id;           /* request id */
+    uint8_t portnum;       /* port number */
+    uint8_t speed;         /* usb_device_speed */
+#define USBIF_SPEED_NONE        0
+#define USBIF_SPEED_LOW         1
+#define USBIF_SPEED_FULL        2
+#define USBIF_SPEED_HIGH        3
 };
 typedef struct usbif_conn_response usbif_conn_response_t;
 
-- 
2.26.2


