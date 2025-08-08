Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B6CB1EAD3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074664.1437159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVt-0008Vf-7Q; Fri, 08 Aug 2025 14:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074664.1437159; Fri, 08 Aug 2025 14:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVt-0008PH-2m; Fri, 08 Aug 2025 14:56:09 +0000
Received: by outflank-mailman (input) for mailman id 1074664;
 Fri, 08 Aug 2025 14:56:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVr-0008J1-Ka
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVr-007zrE-1I;
 Fri, 08 Aug 2025 14:56:07 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVr-009BYT-0R;
 Fri, 08 Aug 2025 14:56:07 +0000
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
	bh=k+bhmnBEE95exmmfH0gnf9+dEFpUHSD0leW6AxF9H9o=; b=K/G9SAdrcZ6aFpedRTh0sPWLD3
	dn5YzTV26u8XzxR23nEvgofIeasByb9DlHcGRYPBKm72LHTQqyw3b2zJGDa1ESbDn54UdK+ABJK4q
	T5EqYyUD0LNXtxpW0Xwc/lsIjJi0AEI4vkDqEBg2z86HtPl8yQl6wXtKfJ0j85P0JAao=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 02/11] libxl: Remove duplicate libxl_domain_config_gen_json prototype
Date: Fri,  8 Aug 2025 16:55:53 +0200
Message-Id: <20250808145602.41716-3-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Since f9e681d3d1b8, the prototype of libxl_domain_config_gen_json is
generated from IDL in _libxl_types_json.h.

Fixes: f9e681d3d1b8 ("libxl: move definition of libxl_domain_config into the IDL")
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/include/libxl_json.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
index 260783bfde..3f97267eae 100644
--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -90,7 +90,4 @@ static inline yajl_gen libxl_yajl_gen_alloc(const yajl_alloc_funcs *allocFuncs)
 
 #endif /* !HAVE_YAJL_V2 */
 
-yajl_gen_status libxl_domain_config_gen_json(yajl_gen hand,
-                                             libxl_domain_config *p);
-
 #endif /* LIBXL_JSON_H */
-- 
Anthony PERARD


