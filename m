Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855146A3E2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239728.415717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIa7-0004Fn-4b; Mon, 06 Dec 2021 18:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239728.415717; Mon, 06 Dec 2021 18:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIa6-0004BD-ME; Mon, 06 Dec 2021 18:19:18 +0000
Received: by outflank-mailman (input) for mailman id 239728;
 Mon, 06 Dec 2021 18:19:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIa4-00043g-HX
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIa4-00042t-GY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIa4-0004XO-Fq
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZa-0001ab-IC; Mon, 06 Dec 2021 18:18:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=l2p5B8Z1X/IiNxWnmW87oEopqHbNh5M0axAqa8AjdDo=; b=GjVWN4nCkoIOy58NdCKqouH+Aj
	orPXkU72aXgMQZ1m0ULCyxIn9ULJPeYifv6E+Ilm9KiwZ+/7JT7sWj3zgsw0hNRHXtMGxgTvigHGv
	OkKj5HdvG49FoUWzw8AAWh4NkySkCP2DKa1LhJcFoTVKdlXCZatBhpcP4v5vESBN2TAQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 02/13] ts-memdisk-try-append: Reindent (nfc)
Date: Mon,  6 Dec 2021 18:18:28 +0000
Message-Id: <20211206181839.23463-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 ts-memdisk-try-append | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/ts-memdisk-try-append b/ts-memdisk-try-append
index 4b54eff01..a35751eb3 100755
--- a/ts-memdisk-try-append
+++ b/ts-memdisk-try-append
@@ -19,17 +19,17 @@
 set -xe -o posix
 
 arch=`perl -I. -e '
-                use Osstest;
-                use Osstest::TestSupport;
+    use Osstest;
+    use Osstest::TestSupport;
 
-                tsreadconfig();
+    tsreadconfig();
 
-		our $whhost = pop @ARGV; # arg parsing bodge
-		$whhost ||= "host";
-		our $ho = selecthost($whhost);
+    our $whhost = pop @ARGV; # arg parsing bodge
+    $whhost ||= "host";
+    our $ho = selecthost($whhost);
 
-                print $ho->{Arch} or die $!;
-              ' "$@"`
+    print $ho->{Arch} or die $!;
+    ' "$@"`
 
 case "$arch" in
 amd64)
-- 
2.20.1


