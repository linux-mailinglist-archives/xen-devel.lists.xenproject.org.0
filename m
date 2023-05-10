Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4C6FDFED
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532846.829181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgU-0005N2-1o; Wed, 10 May 2023 14:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532846.829181; Wed, 10 May 2023 14:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgT-0005IK-Ue; Wed, 10 May 2023 14:20:49 +0000
Received: by outflank-mailman (input) for mailman id 532846;
 Wed, 10 May 2023 14:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Youv=A7=bounce.vates.fr=bounce-md_30504962.645ba83d.v1-744e931c24524562bfbf8de669d17973@srs-se1.protection.inumbo.net>)
 id 1pwkgS-0004iD-EI
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:20:48 +0000
Received: from mail145-2.atl61.mandrillapp.com
 (mail145-2.atl61.mandrillapp.com [198.2.145.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dad8aec9-ef3d-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 16:20:47 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-2.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4QGcd956WjzQXlPFg
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 14:20:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 744e931c24524562bfbf8de669d17973; Wed, 10 May 2023 14:20:45 +0000
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
X-Inumbo-ID: dad8aec9-ef3d-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683728445; x=1683988945; i=yann.dirson@vates.fr;
	bh=zAC0Ae3ADV1q0oYr8YU1ywFE0/ZKiWQ1G1f22odEco4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Kj1Ho4iXXfCMhGxo3aF+cXoQGKCGeR4P19lSWLIjUBbPsKvH7Q2NL8HrUw0HJcvk4
	 oCN4Bgp1w6Fc1dR1z9hn5kxP14MUlcMCBXMp+vaXMJmNuEmsfNdim7RBIZezTMffjJ
	 3vXWtT9qGf1zd2fQenvD2Xwm3SWwSkuKtBG6GEk4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683728445; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=zAC0Ae3ADV1q0oYr8YU1ywFE0/ZKiWQ1G1f22odEco4=; 
 b=VsFXzHXGU9IlXJo58FzA8k4ETK4yIM/0qkcbYa2wEMjImyq0KBQTrHwN11Qk0uplLjex3o
 lcCboXhNDg01TfOaBoa+MBvTawS3o4Df3M3T2A6F46OGV6LygGFFLbqkGP9QirohernNbc63
 asF5ammT7nJKv5uPMtX0nx9vvEQyo=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH=201/3]=20docs:=20fix=20complex-and-wrong=20xenstore-path=20wording?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683728439569
To: xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com, Yann Dirson <yann.dirson@vates.fr>
Message-Id: <20230510142011.1120417-2-yann.dirson@vates.fr>
In-Reply-To: <20230510142011.1120417-1-yann.dirson@vates.fr>
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.744e931c24524562bfbf8de669d17973?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230510:md
Date: Wed, 10 May 2023 14:20:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

"0 or 1 ... to indicate whether it is capable or incapable, respectively"
is luckily just swapped words.  Making this shorter will
make the reading easier.

Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
---
 docs/misc/xenstore-paths.pandoc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index f07ef90f63..a604f6b1c6 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -454,9 +454,8 @@ The precise protocol is not yet documented.
 #### ~/control/feature-suspend = (""|"0"|"1") [w]
 
 These may be initialized to "" by the toolstack and may then be set
-to 0 or 1 by a guest to indicate whether it is capable or incapable,
-respectively, of responding to the corresponding command when written
-to ~/control/shutdown.
+to 0 or 1 by a guest to indicate whether it is capable of responding
+to the corresponding command when written to ~/control/shutdown.
 A toolstack may then sample the feature- value at the point of issuing
 a PV control command and respond accordingly:
 
@@ -507,9 +506,8 @@ string back to the control node.
 #### ~/control/feature-laptop-slate-mode = (""|"0"|"1") [w]
 
 This may be initialized to "" by the toolstack and may then be set
-to 0 or 1 by a guest to indicate whether it is capable or incapable,
-respectively, of responding to a mode value written to
-~/control/laptop-slate-mode.
+to 0 or 1 by a guest to indicate whether it is capable of responding
+to a mode value written to ~/control/laptop-slate-mode.
 
 ### Domain Controlled Paths
 
-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

