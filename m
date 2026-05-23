Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMlxBFrHEWpApwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 17:27:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE85BFA70
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 17:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317825.1586492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQoF3-0008W2-12; Sat, 23 May 2026 15:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317825.1586492; Sat, 23 May 2026 15:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQoF2-0008TS-TQ; Sat, 23 May 2026 15:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1317825;
 Sat, 23 May 2026 14:08:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <len.bao@gmx.us>) id 1wQn1w-0005lQ-Q3
 for xen-devel@lists.xenproject.org; Sat, 23 May 2026 14:08:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQn1v-009dTY-A1
 for xen-devel@lists.xenproject.org; Sat, 23 May 2026 16:08:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <len.bao@gmx.us>)
 id 6a11b4b7-e002-0a2a0a5209dd-0a2a4507d9b8-36
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 16:08:43 +0200
Received: from [212.227.15.18] (helo=mout.gmx.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <len.bao@gmx.us>)
 id 6a11b4eb-229c-0a2a45070019-d4e30f12ab07-3
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 16:08:43 +0200
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MtOKi-1xLNBw0one-014WEc; Sat, 23
 May 2026 16:08:39 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=s31663417 header.d=gmx.us header.i="len.bao@gmx.us" header.h="X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1779545319; x=1780150119; i=len.bao@gmx.us;
	bh=m/6wiRh+45iMuWPmZC1T+2IYsPa5iUhtnezi3ElcXcE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BNbDc6kbHoJ7We1V48eQraXYmlC19YQIQXduTDc79On37IYuIYKIjm9Xcp+yD8KF
	 8KtHfEcKbiSDjRghIz1B4hLAsKhiOczuGsD0Q05TScThXv97PdHBuLYAb8mTWzjMM
	 fmZEx+DhjJKKyAuD68v8HJjInXb2PTanu2Ssmpbf9QaS0XlXtsyPGFU+2kRaphpJO
	 7r0dbxtU+86Yl7gIsRlfpAlMmQVOMCeXZ4AiFDbNH18oEwVny5TYBJTimWbPsHw0f
	 UOkVaGVHcY6pU4AK1LOd0sgilecVFMzHY6bg5FHw2kuZpK9rwIDHBknICTMbynnm0
	 VImMI+fX3guvCVsF9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
From: Len Bao <len.bao@gmx.us>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Len Bao <len.bao@gmx.us>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: constify xsd_errors array
Date: Sat, 23 May 2026 14:08:07 +0000
Message-ID: <20260523140809.30915-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:veW5s2xvNnaG6CW9XpsLHY7YkjT32wLfhJM8LfU/Nf1dR0rKOxB
 /WpWnPyXGDqcll+i8J2ql0FEkI7lhiLuaOFvXcBh0Am/F+SXtVr9G0nDH0GCrYWI3O37JHF
 6aCsRQGu/0nYd7NCY/DXO7uT0RWsXKC+d5TW/9zS9GBaqtnMa9UgGz5/tYj/J5DodY8cu6f
 9AlhcKpDtiXyX28n2xy3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R/rCFw9OtSQ=;uvNMoV54j5fqSJzLCaROBQzWX6z
 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
 CFgIiw==
X-purgate-ID: tlsNG-ef75cf/1779545323-09D6FC48-9DBFD5FA/0/0
X-purgate-type: clean
X-purgate-size: 916
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.us,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmx.us:s=s31663417];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.us,lists.xenproject.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.us];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:len.bao@gmx.us,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[len.bao@gmx.us,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmx.us:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.us:email,gmx.us:mid,gmx.us:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[len.bao@gmx.us,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B0FE85BFA70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 'xsd_errors' array is initialized in the declaration and never
changed. So, constify it to reduce the attack surface.

At the same time, use the preferred '__maybe_unused' form over the
'__attribute__((unused))' form.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 include/xen/interface/io/xs_wire.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/interface/io/xs_wire.h b/include/xen/interface/io=
/xs_wire.h
index b62365478..29d0394b8 100644
=2D-- a/include/xen/interface/io/xs_wire.h
+++ b/include/xen/interface/io/xs_wire.h
@@ -51,7 +51,7 @@ struct xsd_errors
     const char *errstring;
 };
 #define XSD_ERROR(x) { x, #x }
-static struct xsd_errors xsd_errors[] __attribute__((unused)) =3D {
+static const struct xsd_errors xsd_errors[] __maybe_unused =3D {
     XSD_ERROR(EINVAL),
     XSD_ERROR(EACCES),
     XSD_ERROR(EEXIST),
=2D-=20
2.43.0


