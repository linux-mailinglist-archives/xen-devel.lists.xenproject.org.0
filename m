Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE6B0D35D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052043.1420569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7Ym-000858-0N; Tue, 22 Jul 2025 07:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052043.1420569; Tue, 22 Jul 2025 07:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7Yl-00082W-Sx; Tue, 22 Jul 2025 07:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1052043;
 Tue, 22 Jul 2025 07:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YR2v=2D=uniontech.com=wangyuli@srs-se1.protection.inumbo.net>)
 id 1ue7Yk-0005s5-Tj
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:37:10 +0000
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa7bc29c-66ce-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 09:37:08 +0200 (CEST)
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:35:33 +0800 (CST)
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
X-Inumbo-ID: aa7bc29c-66ce-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753169797;
	bh=Ln6z5UMdHfy09BVb3ISvR9kteELxlxv1r4Jb0WU5wac=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HqdsA6lurvDL0BN2pocw0QqQp9+aGe9jikD27j0oyb4hk3oU8jfBKUI2UATKWcgVw
	 0joLp5ZvfAoYKmtHvd9MsqX2YthMCEHV6g/xHDyBVBTcH3hgS/nLk8UBOj9E1Y5ixK
	 70uoqWAcPf3R6uGe7zIOn+1TcwKgpQTMuzjbvWj8=
X-QQ-mid: zesmtpip2t1753169738t55bf3778
X-QQ-Originating-IP: KSjByG7dJMLO7TG5I1iv5PR6js3yTNO4FTwwtL4j6qI=
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10523341223142092495
EX-QQ-RecipientCnt: 64
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com,
	akpm@linux-foundation.org,
	alison.schofield@intel.com,
	andrew+netdev@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	arend.vanspriel@broadcom.com,
	bp@alien8.de,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	colin.i.king@gmail.com,
	cvam0000@gmail.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	davem@davemloft.net,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	guanwentao@uniontech.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com,
	j@jannau.net,
	jeff.johnson@oss.qualcomm.com,
	jgross@suse.com,
	jirislaby@kernel.org,
	johannes.berg@intel.com,
	jonathan.cameron@huawei.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	kvm@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux@treblig.org,
	lucas.demarchi@intel.com,
	marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com,
	mingo@kernel.org,
	mingo@redhat.com,
	netdev@vger.kernel.org,
	niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com,
	pabeni@redhat.com,
	pbonzini@redhat.com,
	quic_ramess@quicinc.com,
	ragazenta@gmail.com,
	rodrigo.vivi@intel.com,
	seanjc@google.com,
	shenlichuan@vivo.com,
	simona@ffwll.ch,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com,
	vishal.l.verma@intel.com,
	wangyuli@deepin.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com
Subject: [PATCH v3 8/8] scripts/spelling.txt: Add notifer||notifier to spelling.txt
Date: Tue, 22 Jul 2025 15:34:31 +0800
Message-ID: <02153C05ED7B49B7+20250722073431.21983-8-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NpSWo64krennrayvYca9TiASTtSK2LQJ3tk09IAkmeR25Z5bUOproBXL
	5lg/koGe6F8MW1CkY3ORVzaoTNKDWtDz03ArrIakXQhzHtkdJ//H5DMd/oPETQCMe3XjUsC
	oAGNXqhgpp5Cy4bK7xFWQFtgxeznuQxdU2si+nj0KdoIeW3kuA48Auw/begSwXYn2AYfOdT
	13z7u3GqHsmpmuTV9ymzbSl8e76KmNFOwvYf4GkoOCi4zj34HhatzlbA8fC+DGPv4aDd/uO
	CZu3I3dpS0a6/7cnN0mUNOEo0pAIX99IR06/F8rSitli3qnXBKoV4FpZMkC9lrM49xWFDYd
	1TDCAFcWSeb6Nh0j9a088R1aHzN0/ucV9MoSA8LPZQbKAYKFuYkhfbIlHUbr4v9wBqSJeVO
	DRrvtw9tzFsrq8x+C9+0bPQYHY0EBVlGSSb+9vPKFwo16eAIclFRFHeFsFr3V7PBFF/qGYH
	pmjY4yoIBM3q+ocB1OTsC6xPRJbOPG3nvcdsXo8K4z8njFsZudPQwK6EBDPXHF27tKP5RV5
	PXGCoSAuwsDLAwrNinj7ZLhgdQrq9wJ2t6ydU8Mj+A0jCq0hg1Rq8e9lXK7G9y49tCVEHEf
	Fm3cM25NaAuWL7MaaDqcYnF9IfIFTB/OAlPwmZ4NSZGp74L+wJ8m4mJuoK+f2UZlWumZuNH
	fRLIFWoXWQ+Jfkp4yLY6U59oVWqfLN4UXpb7Y/iHKZMRa0IhtlYUbDYnwMzniS64hjm+yUu
	0U8iMDxjSLyHKmuANPmpIQAY4Rzd7iQoqMwja0SbTqowMquTvPMQMBvCHHpyMWIo9Cpn4XB
	rTdQZqqVSG5mFn77EAg5sbx/qFUYo0ZrHhC8KK63A67Aaxa+AdbcOalX5e+q6shoggUYS3s
	NctPUeAdhww4muZ1tjoXpQhXwc4ew4bIzFNks8F3sorE2hb1GpV8ZM8IWvSb4C6y4X8bn9/
	ALl61rhfN8pkXa7VfZNJp6crpP1T3xIhB/kbw66mA1GoMsLGvUk0FaAOewjn/avKIogDu9P
	/LnQSCxldbkBn8Ft5fxJIHpblyZEgaTu9x7f4MVJLvpv9ejnrGHlwpzjiVbynJq4Se4lmhe
	G/ucfPQ76j1Lg0Dto40L7R1fC+CZCelPPhLsHnIWdYika1BZ6psDu0=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/spelling.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index c9a6df5be281..d824c4b17390 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1099,6 +1099,7 @@ notication||notification
 notications||notifications
 notifcations||notifications
 notifed||notified
+notifer||notifier
 notity||notify
 notfify||notify
 nubmer||number
-- 
2.50.0


