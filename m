Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLbGCkXBs2lQagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F227EF55
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253348.1549634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFg-000422-3K; Fri, 13 Mar 2026 07:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253348.1549634; Fri, 13 Mar 2026 07:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFg-0003ye-0D; Fri, 13 Mar 2026 07:48:08 +0000
Received: by outflank-mailman (input) for mailman id 1253348;
 Fri, 13 Mar 2026 07:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFe-0003h2-MZ
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7db8808-1eb0-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:48:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 922454E3F0;
 Fri, 13 Mar 2026 07:48:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B0DF403F6;
 Fri, 13 Mar 2026 07:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jIcPFTTBs2mtGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:04 +0000
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
X-Inumbo-ID: f7db8808-1eb0-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/8] docs: clarify Xenstore watch depth feature
Date: Fri, 13 Mar 2026 08:47:45 +0100
Message-ID: <20260313074751.2904215-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: C18F227EF55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make it explicit that for watching the @releaseDomain/<domid> special
node, the XENSTORE_SERVER_FEATURE_WATCHDEPTH is needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 8a2c19d116..dba6471387 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -266,7 +266,8 @@ WATCH			<wpath>|<token>|[<depth>|]?
 	decimal value of 0 or larger): it denotes the directory levels
 	below <wpath> to consider for a match ("0" would not match for
 	a child of <wpath>, "1" would match only for a direct child,
-	etc.).
+	etc.).  The depth specification is possible only, if the
+	XENSTORE_SERVER_FEATURE_WATCHDEPTH feature is available.
 
 	<wpath> can be a <path> to watch or @<wspecial>.  In the
 	latter case <wspecial> may have any syntax but it matches
@@ -284,6 +285,8 @@ WATCH			<wpath>|<token>|[<depth>|]?
 	values are not supported.
 	For @releaseDomain it is possible to watch only for a specific
 	domain by specifying @releaseDomain/<domid> for the path.
+	This requires the XENSTORE_SERVER_FEATURE_WATCHDEPTH to be
+	available.
 
 	When a watch is first set up it is triggered once straight
 	away, with <path> equal to <wpath>.  Watches may be triggered
-- 
2.53.0


