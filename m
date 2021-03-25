Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6534890B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 07:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101256.193525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPJOG-0004vY-GN; Thu, 25 Mar 2021 06:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101256.193525; Thu, 25 Mar 2021 06:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPJOG-0004v9-Cx; Thu, 25 Mar 2021 06:22:44 +0000
Received: by outflank-mailman (input) for mailman id 101256;
 Thu, 25 Mar 2021 06:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r9n1=IX=vivo.com=wanjiabing@srs-us1.protection.inumbo.net>)
 id 1lPJMe-0004tn-R6
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 06:21:04 +0000
Received: from mail-m17637.qiye.163.com (unknown [59.111.176.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88feda81-6889-46e5-86dc-7e4def9d2976;
 Thu, 25 Mar 2021 06:20:57 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 5360C980378;
 Thu, 25 Mar 2021 14:20:41 +0800 (CST)
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
X-Inumbo-ID: 88feda81-6889-46e5-86dc-7e4def9d2976
From: Wan Jiabing <wanjiabing@vivo.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net,
	Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared twice
Date: Thu, 25 Mar 2021 14:19:01 +0800
Message-Id: <20210325061901.851273-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZTR4fTE1IQkofTk8fVkpNSk1NTkhJT0pOTk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
	FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhA6Hgw6LD8OGj4eLUMtGTIL
	HTQaFBxVSlVKTUpNTU5ISU9JT0tMVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
	TVVKTklVSk9OVUpDSVlXWQgBWUFKTE1INwY+
X-HM-Tid: 0a78680acc88d992kuws5360c980378

struct xen_drm_front_drm_info has been declared. 
Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
index 3adacba9a23b..e5f4314899ee 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
+++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
@@ -16,7 +16,6 @@
 struct drm_connector;
 struct xen_drm_front_drm_info;
 
-struct xen_drm_front_drm_info;
 
 int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
 			    struct drm_connector *connector);
-- 
2.25.1


