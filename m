Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25028AE106B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 02:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020463.1396673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSPk1-0001VV-At; Fri, 20 Jun 2025 00:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020463.1396673; Fri, 20 Jun 2025 00:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSPk1-0001TT-7S; Fri, 20 Jun 2025 00:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1020463;
 Fri, 20 Jun 2025 00:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4/x=ZD=zte.com.cn=jiang.peng9@srs-se1.protection.inumbo.net>)
 id 1uSPjz-0001TN-8e
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 00:36:23 +0000
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92bc29be-4d6e-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 02:36:18 +0200 (CEST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bNdnR5NBzz8RVF5;
 Fri, 20 Jun 2025 08:36:11 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl2.zte.com.cn with SMTP id 55K0ZNLI087195;
 Fri, 20 Jun 2025 08:35:23 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Fri, 20 Jun 2025 08:35:24 +0800 (CST)
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
X-Inumbo-ID: 92bc29be-4d6e-11f0-b894-0df219b8e170
Date: Fri, 20 Jun 2025 08:35:24 +0800 (CST)
X-Zmail-TransId: 2afa6854acccffffffffe61-b190f
X-Mailer: Zmail v1.0
Message-ID: <20250620083524585H-Y-shkbXkJSd-9if1hTB@zte.com.cn>
In-Reply-To: <0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com>
References: 20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn,0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0geGVuL3hlbmJ1czogZml4IFc9MSBidWlsZCB3YXJuaW5nIGluIHhlbmJ1c192YV9kZXZfZXJyb3IgZnVuY3Rpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55K0ZNLI087195
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6854ACFB.003/4bNdnR5NBzz8RVF5

> I'm fine with the changes as such, but please send the patch as a
> plain text email (no HTML). Otherwise I'm not able to apply it.
>
> You should look into Documentation/process/email-clients.rst in the
> kernel source tree.

My sincere apologies for the HTML format issue. Thank you for your patience and for pointing me to the email guidelines  - I truly appreciate the guidance.
I'll resend the patch immediately as a plain text email to ensure it can be properly applied.

Thank you again for your understanding and for taking the time to review this.

Best regards
Peng

