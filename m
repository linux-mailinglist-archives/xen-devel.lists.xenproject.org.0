Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBA287C8F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4621.12212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbkj-0003X9-CX; Thu, 08 Oct 2020 19:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4621.12212; Thu, 08 Oct 2020 19:39:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbkj-0003Wk-9A; Thu, 08 Oct 2020 19:39:01 +0000
Received: by outflank-mailman (input) for mailman id 4621;
 Thu, 08 Oct 2020 19:39:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbkh-0003WY-UA
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:38:59 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5985addb-448f-4222-ac62-91b32dd5759b;
 Thu, 08 Oct 2020 19:38:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkg-0004xY-Nr
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:38:58 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkg-0005M3-Mv
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:38:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN7-0006So-Sq; Thu, 08 Oct 2020 20:14:38 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbkh-0003WY-UA
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:38:59 +0000
X-Inumbo-ID: 5985addb-448f-4222-ac62-91b32dd5759b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5985addb-448f-4222-ac62-91b32dd5759b;
	Thu, 08 Oct 2020 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=uF93lLE6Hujj9HHD1uOcz9Kb2G0DNm7aSbOO3mDjPxk=; b=xBDd+2KoTZzeVdyDtJK+1BjQUi
	dr8sWTB9JIeAhL6rOHCH6UKktPi3aLXocn16x/g9GbaaZi0WrPBYx8i7JIl6eaI7rFtOUiWN41lzz
	a0DLaxtu52DEzY3wR7IWWgYERzOGPQ5laHoxpJGk9TATlh6y1XHhjX5nxbxZHr5MWRTI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkg-0004xY-Nr
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:38:58 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkg-0005M3-Mv
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:38:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN7-0006So-Sq; Thu, 08 Oct 2020 20:14:38 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [OSSTEST PATCH 13/13] cr-daily-branch: Do not do immediate retry of failing xtf flights
Date: Thu,  8 Oct 2020 20:14:22 +0100
Message-Id: <20201008191422.5683-14-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cr-daily-branch b/cr-daily-branch
index 3e58d465..9b1961bd 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -484,6 +484,7 @@ default_immediate_retry=$wantpush
 case "$branch" in
 *smoke*)	default_immediate_retry=false ;;
 osstest)	default_immediate_retry=false ;;
+xtf*)		default_immediate_retry=false ;;
 *)		;;
 esac
 
-- 
2.20.1


