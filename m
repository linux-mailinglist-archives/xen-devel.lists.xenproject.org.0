Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A430E5ADE46
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 06:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399325.640479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVPlu-0006iy-K6; Tue, 06 Sep 2022 04:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399325.640479; Tue, 06 Sep 2022 04:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVPlu-0006gd-HH; Tue, 06 Sep 2022 04:01:10 +0000
Received: by outflank-mailman (input) for mailman id 399325;
 Tue, 06 Sep 2022 02:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQFw=ZJ=163.com=13667453960@srs-se1.protection.inumbo.net>)
 id 1oVNyN-0002mt-W3
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 02:05:56 +0000
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6eea892e-2d88-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 04:05:53 +0200 (CEST)
Received: from localhost.localdomain (unknown [116.128.244.169])
 by smtp2 (Coremail) with SMTP id GtxpCgA3NAfcqhZjHAaSbA--.23398S2;
 Tue, 06 Sep 2022 10:05:17 +0800 (CST)
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
X-Inumbo-ID: 6eea892e-2d88-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xmN1F
	CoHwFFxWoZVNoofoQFdyf4htAgoTRMoCaG/1Y8=; b=Gt9504JVSfg9QvkZhZylc
	Vs8Rqa6YklAvZg6PXYtEq7Mbn166EYDn1rP6JKYkqdwmYM8WD5jfy5QyVS9X8R8u
	8J1nziqGh+SuuZnl2/hyoG03Zyi/GnB24+RatxYf3q8NXzlOJ4hpFZhHDPZyF7cb
	z0gRQ3ILZQ9rcPSENNqFPs=
From: Jiangshan Yi <13667453960@163.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] xen-blkback/common.h: fix spelling typo in comment
Date: Tue,  6 Sep 2022 10:05:14 +0800
Message-Id: <20220906020514.4169975-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GtxpCgA3NAfcqhZjHAaSbA--.23398S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5Jw4rXFyUtrb_yoWDtFXEkr
	1UZanrXrWFyF4Sv3WjkF4Sqry2934UuFWkCFnaqa9agayUGa17X34qyr1fGFnxGrW8tw13
	C3ZxJrWUtF48JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU88sqJUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbiyB10+1p7HnJeYwAAsq

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/block/xen-blkback/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index a28473470e66..4223995642f4 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -132,7 +132,7 @@ struct blkif_x86_32_request {
 struct blkif_x86_64_request_rw {
 	uint8_t        nr_segments;  /* number of segments                   */
 	blkif_vdev_t   handle;       /* only for read/write requests         */
-	uint32_t       _pad1;        /* offsetof(blkif_reqest..,u.rw.id)==8  */
+	uint32_t       _pad1;        /* offsetof(blkif_request..,u.rw.id)==8  */
 	uint64_t       id;
 	blkif_sector_t sector_number;/* start sector idx on disk (r/w only)  */
 	struct blkif_request_segment seg[BLKIF_MAX_SEGMENTS_PER_REQUEST];
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus


