Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE048D72BB
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 01:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734358.1140556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDY7p-0006kH-Fi; Sat, 01 Jun 2024 23:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734358.1140556; Sat, 01 Jun 2024 23:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDY7p-0006hr-CG; Sat, 01 Jun 2024 23:27:01 +0000
Received: by outflank-mailman (input) for mailman id 734358;
 Sat, 01 Jun 2024 23:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YPgr=ND=treblig.org=linux@srs-se1.protection.inumbo.net>)
 id 1sDY73-0006gd-Hc
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 23:26:13 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 543cfa5e-206e-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 01:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1sDY6v-003lo2-2B;
 Sat, 01 Jun 2024 23:26:06 +0000
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
X-Inumbo-ID: 543cfa5e-206e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=y3toXmjpE9FC/9nFEs8AsST4kK6tsu5EB+9tVoO4zzI=; b=Y2zUpNiB/hULCH7b
	PXwi63YHwj1Acizrz4gbxnX5hrKfgMbb8s4PFq+HSb8ewOzVTPwYwIo0t/XILqn8m+qA6dG3WNMis
	AeuSTyYsJbMXeMy9OA3whhJUgCtC7bwRtlBbQePV/k/eUjZDyn60ftXbTGoMsEeIg6XW3bOZUJuiv
	u4ejGw/Cb/2V3xoYjYUcD0blOwmNR4Sth7N6JFkfwOMeQocujlODvEzNbkd0APlz9q7vwvdd8gXDL
	nfuj0jZmnD/HO/aY4QY/h4ST+cvZFCJWt3DeYlW671WqjjLiKLpBDrd2sLcZ/QuMszUjQ49rCy902
	ZssT6wp4lyFN/gEjsg==;
From: linux@treblig.org
To: oleksandr_andrushchenko@epam.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: xen-front: remove unused struct 'alsa_sndif_hw_param'
Date: Sun,  2 Jun 2024 00:26:04 +0100
Message-ID: <20240601232604.198662-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'alsa_sndif_hw_param' has been unused since the original
commit 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound
driver").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/xen/xen_snd_front_alsa.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index 31b5dc0f34d2..b229eb6f7057 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -69,11 +69,6 @@ struct alsa_sndif_sample_format {
 	snd_pcm_format_t alsa;
 };
 
-struct alsa_sndif_hw_param {
-	u8 sndif;
-	snd_pcm_hw_param_t alsa;
-};
-
 static const struct alsa_sndif_sample_format ALSA_SNDIF_FORMATS[] = {
 	{
 		.sndif = XENSND_PCM_FORMAT_U8,
-- 
2.45.1


