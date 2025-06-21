Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B884AE2799
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 08:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021514.1397492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSrS3-0006uM-8m; Sat, 21 Jun 2025 06:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021514.1397492; Sat, 21 Jun 2025 06:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSrS3-0006ra-62; Sat, 21 Jun 2025 06:11:43 +0000
Received: by outflank-mailman (input) for mailman id 1021514;
 Sat, 21 Jun 2025 06:11:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bRgk=ZE=zte.com.cn=jiang.peng9@srs-se1.protection.inumbo.net>)
 id 1uSrS2-0006rU-0M
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 06:11:42 +0000
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94fd8409-4e66-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 08:11:37 +0200 (CEST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bPP9r0htLz8R044;
 Sat, 21 Jun 2025 14:11:28 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 55L6BE2X044176;
 Sat, 21 Jun 2025 14:11:14 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Sat, 21 Jun 2025 14:11:16 +0800 (CST)
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
X-Inumbo-ID: 94fd8409-4e66-11f0-b894-0df219b8e170
Date: Sat, 21 Jun 2025 14:11:16 +0800 (CST)
X-Zmail-TransId: 2af968564d04ffffffffda0-110f6
X-Mailer: Zmail v1.0
Message-ID: <20250621141116690-r2XBDvxlTEKKmLkptW3g@zte.com.cn>
In-Reply-To: <62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com>
References: 20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn,62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0geGVuL3hlbmJ1czogZml4IFc9MSBidWlsZCB3YXJuaW5nIGluIHhlbmJ1c192YV9kZXZfZXJyb3IgZnVuY3Rpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55L6BE2X044176
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68564D10.000/4bPP9r0htLz8R044

> PS: Next time please don't send another version of a patch as a reply,
>      but as a new email thread.

Got it! New threads for future patches - thanks for the heads up.Sorry for any inconvenience caused, 
and thanks again for your patience with a newcomer like me.

Best regards
Peng

