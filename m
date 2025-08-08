Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA1B1EACF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074665.1437177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVu-0000YV-G7; Fri, 08 Aug 2025 14:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074665.1437177; Fri, 08 Aug 2025 14:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVu-0000Wz-Af; Fri, 08 Aug 2025 14:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1074665;
 Fri, 08 Aug 2025 14:56:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVs-0008JK-GM
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVs-007zrL-0o;
 Fri, 08 Aug 2025 14:56:08 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVr-009BYT-38;
 Fri, 08 Aug 2025 14:56:08 +0000
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
	bh=CCPKtC0shQwlH1BCzBftuuKxzSUgHWgFXX9AJ0JhOKY=; b=i8CX6XAz3rZHc+IEL4zubcuVDm
	KlQMZusduGAEouJznIY0K//WwqePAsfA39EaQm+L6DXMf7jgI/bzqwu6IZmwGNqmVQkv3kNNnAgMN
	CfKdAPI69q+A833Lx2OOWwCJsmiLg7AAjPgp9ISCa6lokj8kTx7u9HiEo5WTgq1jpvuI=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 03/11] libxl: remove duplicated libxl__yajl_gen_asciiz() prototype
Date: Fri,  8 Aug 2025 16:55:54 +0200
Message-Id: <20250808145602.41716-4-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_internal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 2a5b233caa..4b6587a27a 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1993,8 +1993,6 @@ _hidden char *libxl__cpupoolid_to_name(libxl__gc *gc, uint32_t poolid);
 _hidden int libxl__enum_from_string(const libxl_enum_string_table *t,
                                     const char *s, int *e) NN(2);
 
-_hidden yajl_gen_status libxl__yajl_gen_asciiz(yajl_gen hand, const char *str);
-
 _hidden yajl_gen_status libxl__string_gen_json(yajl_gen hand, const char *p);
 
 typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
-- 
Anthony PERARD


