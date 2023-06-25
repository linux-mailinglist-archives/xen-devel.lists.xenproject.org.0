Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996C73D6DA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 06:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554863.866953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDdeh-0008Us-KE; Mon, 26 Jun 2023 04:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554863.866953; Mon, 26 Jun 2023 04:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDdeh-0008Ss-Hb; Mon, 26 Jun 2023 04:16:47 +0000
Received: by outflank-mailman (input) for mailman id 554863;
 Sun, 25 Jun 2023 16:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8Ml=CN=foxmail.com=zhang_shurong@srs-se1.protection.inumbo.net>)
 id 1qDSv1-0004AO-CS
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 16:48:55 +0000
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com
 [203.205.221.245]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27ad0021-1378-11ee-b237-6b7b168915f2;
 Sun, 25 Jun 2023 18:48:50 +0200 (CEST)
Received: from localhost.localdomain ([122.14.229.236])
 by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
 id A9A2A055; Mon, 26 Jun 2023 00:42:26 +0800
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
X-Inumbo-ID: 27ad0021-1378-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1687711719;
	bh=ULx3wX+XMVeigercXBoqPiB3jqlbn7oDvMIMzYZ5TSs=;
	h=From:To:Cc:Subject:Date;
	b=lcnKagj/AVLXeiy0XWleoj7AZvTy9LB6XnAkvIv8eHW31xnU2xgQ5tUqChl/nOJMS
	 wSEyVKoZCBX8EHFx8VCPO2ciM6vMaTc9iZ/q7hRS//MigdnjbI0UU+mbaXUYsrMyPI
	 T0WFMEplEUqfFZIK6enDTyF7kKGCsf370cLYCdJg=
X-QQ-mid: xmsmtpt1687711346tg34imyg9
Message-ID: <tencent_15DD79B42AD8A0D64A7CDC24D4FE6C85800A@qq.com>
X-QQ-XMAILINFO: NUoqT9CRNGLktLe03EA26suTrp/6WoKbh3uyq6gI6Laf3iYIlrsVt+j5hNNtSs
	 fLYRD/A6zL8h6i2kOPpD0flQHcJ3x4+RjEmPTOqeGMR4MF7djfr9nTzfyy16d5sITFmOouzOuVdT
	 m5BeNGvLZrTqLTl1rVfMjZQlIJ3YhzNLm/hDWbzLWirEJAIveTRSQy0tMVEDJV4hRdlT/KmZELnc
	 jUGvGqyEN4+q8UUX3pGzFn35Atc+U/I2rFqq1D7h3sPX22e/BXi2FYQCanbwor0ESnL1dDs3s2fU
	 ayeNk4h7cM2xEeeIC95x7cF+S7JX1+IF17gfEFDU+vBEvPi+IouiHT2jqI7rIhS5WNWohdVaqRzf
	 MpyzRW11ay4nC6JvrHAr8p8YlaeeZGr+GxU8RtR2IwwneFejF/EtjnkmTjHTw3Ha/zUge7JnEgWd
	 dPmrzqEBLjNti4CJsm0q2gxmupNN3jNSNJGzrok9k58vjttdeLLSZPkdeALLuvHauydujeeFI7Q6
	 QhIGoB/ZXKfkUBWLy9qfbbKelYm8DIVG/ZtS5iPZfMdbtXjEwIZZ744A9oC4nU2O9og2NxB97cqp
	 addINjibYwepbHwcBsJu/xT1yGXlxb1MEoOtxlLIxVa9MkROjFySkhD3TJSesjfkXdImPOFTWJEr
	 Fq4QJz5x3o11fsbccWPVBqijqjm15K3u7APd5YcvarTD+DMyTBkJ5k7J4qchCQW/OYr1XQinnMPQ
	 wmL/NBImn52FIkeFzE5jtoa43dOOqo80IGAsSAEqRqpyNW2jEADsdWGMvJXy2ORocIIir2Qs9HxE
	 GUeSacyIb7QdAgxh5DZHN18GsO9bId+GnsUEhQcARu5kinI8H7VsbAZlWuuOC3wi6njBJySUlnlM
	 SpN8QltQpHNAa6hHOexNgHacdalcJE2prZkyN0TqE1e58hB+yfbT8i/daQdtA91xsSpSElfpE83g
	 l9ZYvyMQ0swsLePKVdDDJpjZZeKG2o/NzG0mrGAD8nfy/HJsMUFx+lfwfomt+h8HgPQ4WT+I4=
X-QQ-XMRINFO: M0RWTeBkoNRBR1Uh12iQNRvA1CSLhD8+1Q==
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: jgross@suse.com
Cc: gregkh@linuxfoundation.org,
	xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] xen: fix potential shift out-of-bounds in xenhcd_hub_control()
Date: Mon, 26 Jun 2023 00:42:18 +0800
X-OQ-MSGID: <20230625164218.7134-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix potential shift out-of-bounds in xenhcd_hub_control()
ClearPortFeature handling and SetPortFeature handling.

wValue may be greater than 32 which can not be used for shifting.

similar patch:
https://patchwork.kernel.org/patch/12162547

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/usb/host/xen-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 46fdab940092..c0e7207d3857 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -456,6 +456,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd, __u16 typeReq, __u16 wValue,
 			info->ports[wIndex - 1].c_connection = false;
 			fallthrough;
 		default:
+			if (wValue >= 32)
+				goto error;
 			info->ports[wIndex - 1].status &= ~(1 << wValue);
 			break;
 		}
@@ -527,6 +529,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd, __u16 typeReq, __u16 wValue,
 			xenhcd_rhport_suspend(info, wIndex);
 			break;
 		default:
+			if (wValue >= 32)
+				goto error;
 			if (info->ports[wIndex-1].status & USB_PORT_STAT_POWER)
 				info->ports[wIndex-1].status |= (1 << wValue);
 		}
-- 
2.41.0


