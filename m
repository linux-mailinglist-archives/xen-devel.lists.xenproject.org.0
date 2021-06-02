Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB3397F92
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 05:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135413.251546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loHcD-00081G-1x; Wed, 02 Jun 2021 03:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135413.251546; Wed, 02 Jun 2021 03:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loHcC-0007zP-VG; Wed, 02 Jun 2021 03:32:20 +0000
Received: by outflank-mailman (input) for mailman id 135413;
 Wed, 02 Jun 2021 03:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMiO=K4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1loHcB-0007zJ-5e
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 03:32:19 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17626843-21af-4aeb-8a31-52243b95928c;
 Wed, 02 Jun 2021 03:32:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C5FD65C0182;
 Tue,  1 Jun 2021 23:32:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 01 Jun 2021 23:32:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 23:32:15 -0400 (EDT)
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
X-Inumbo-ID: 17626843-21af-4aeb-8a31-52243b95928c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JAel1Y
	62j7V265HvG19jOnr5m/PUQDTrK9g934SuVcg=; b=QkXfu7vMoI4hol3jr7cBzk
	+c5KS4BFTB6D+9JN2V1cxVcz3bOnKy/giPr6e3wWwtqLTQ+e+VS0JKy91X/lNZy+
	FObXdAMxl8ahldESq3MEcpaxrajjXmAMXqXz3vJ73rKQvmWnR5dTiT52hnXd9OCa
	TfPajsfmeFEvU4xCakhJoehi8ECsV28EtFZmN11F5ZZgI3p3adGXTp8niAX7mQGD
	2Rr4tgksioZK/dNi2s13wXF7r/SkQ4b9Thf8NDAnhUCKeJJNJrEF8gPplhTfQsne
	kjk5Sl0babZ4KhtOGu83yjRRc4nAn4w/1+ISa+5Nhr24PYcyaPpnoTULZfXDWH2w
	==
X-ME-Sender: <xms:wPu2YEZlV6VZe1psP8aa1QG6OR2QUPHfKnXNny5Idj0p7bgN4D6pKg>
    <xme:wPu2YPYesUOy11eSdNdWgZiRkrC4wG6qSB9R6GAD36uoywSTMveZfsxy_ukL8k6_o
    q7cjpLx-_ycew>
X-ME-Received: <xmr:wPu2YO-KY8pzGUZq9SFz1apqy88sHG4YZDaFXndT_UiqtVYLrE7h5ZzDwhe5FFiP1E9Fv0hWAB3vqfxmPQb3wX7M_wPj6XGfgUn8wt-cHCgxE5OIgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeliedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
    keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wPu2YOpNbDYRY9B_HqKhihaRuhdtLLwhWJLHCz1llIT25UDQFp5_pw>
    <xmx:wPu2YPosGXYX64TaPGMwpgkkRb9DSEMojZifrQhfBUuHf52ANcX6Ow>
    <xmx:wPu2YMRef6r_5X4Y5FQtnSDQi1LvJ7brCGNR4qlmNpHuyInnk7yUwg>
    <xmx:wPu2YIBsg_x0k1AXPmwM6ZJ8v5iV4AqNLaqJVoY-89bEhMbTNAmBtg>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] autoconf: fix handling absolute $PYTHON path
Date: Wed,  2 Jun 2021 05:32:06 +0200
Message-Id: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

Don't strip full path from $PYTHON variable. This is especially
relevant, if it points outside of $PATH. This is the case
for RPM build on CentOS 8 (%{python3} macro points at
/usr/libexec/platform-python).

For this reason, adjust also python-config handling - AC_PATH_PROG
doesn't work on already absolute path, so make it conditional.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 m4/python_devel.m4 | 6 +++++-
 tools/configure.ac | 1 -
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
index bbf1e0354b2b..676489b8e978 100644
--- a/m4/python_devel.m4
+++ b/m4/python_devel.m4
@@ -2,7 +2,11 @@ AC_DEFUN([AX_CHECK_PYTHON_DEVEL], [
 ac_previous_cppflags=$CPPFLAGS
 ac_previous_ldflags=$LDFLAGS
 ac_previous_libs=$LIBS
-AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
+AS_IF([echo "$PYTHON" | grep -q "^/"], [
+    pyconfig="$PYTHON-config"
+], [
+    AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
+])
 AS_IF([test x"$pyconfig" = x"no"], [
     dnl For those that don't have python-config
     CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
diff --git a/tools/configure.ac b/tools/configure.ac
index 6414fcbb445e..ebf1265643b3 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -368,7 +368,6 @@ AS_IF([test -z "$PYTHON"], [AC_CHECK_PROGS([PYTHON], [python3 python python2], e
 AS_IF([test "$PYTHON" = "err"], [AC_MSG_ERROR([No python interpreter found])])
 AS_IF([echo "$PYTHON" | grep -q "^/"], [], [AC_PATH_PROG([PYTHON], [$PYTHON])])
 PYTHONPATH=$PYTHON
-PYTHON=`basename $PYTHONPATH`
 
 AX_PATH_PROG_OR_FAIL([PYTHONPATH], [$PYTHON])
 AX_CHECK_PYTHON_VERSION([2], [6])
-- 
2.26.3


