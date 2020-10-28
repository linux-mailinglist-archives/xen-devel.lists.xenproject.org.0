Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2BF29D15E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 18:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13806.34524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXpUc-0001pg-Ca; Wed, 28 Oct 2020 17:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13806.34524; Wed, 28 Oct 2020 17:44:14 +0000
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
	id 1kXpUc-0001pH-8k; Wed, 28 Oct 2020 17:44:14 +0000
Received: by outflank-mailman (input) for mailman id 13806;
 Wed, 28 Oct 2020 17:44:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Ob=ED=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kXpUa-0001pC-Ur
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 17:44:13 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10680334-cc58-45a8-af22-9be9db772c0d;
 Wed, 28 Oct 2020 17:44:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m13so2361383wrj.7
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 10:44:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm438798wrp.12.2020.10.28.10.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 10:44:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5827D1FF7E;
 Wed, 28 Oct 2020 17:44:08 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=i5Ob=ED=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kXpUa-0001pC-Ur
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 17:44:13 +0000
X-Inumbo-ID: 10680334-cc58-45a8-af22-9be9db772c0d
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 10680334-cc58-45a8-af22-9be9db772c0d;
	Wed, 28 Oct 2020 17:44:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m13so2361383wrj.7
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YAl0tecVsURCuewdLjQ48RaCrF96ohlsENSIUfpsU+w=;
        b=zeafB7Z4qJnIB81bJuKqrWyMO9ds5lDP45CKMEw/pVonwKm9jJoDyipd2H3Vc+mIDd
         2TKaS8P/pMN1ta1Letyd3LaSmJzn9UmePXvDdcM9gP7wyfaCO0OoNAqNi7MhEYY2hvlE
         wn2dugs4oD/TNrUzhgBHo79XxSxR+3Fme57x5yWtFr3WksdfLEeu3SK5r6xrVaUnA+Ij
         rXw2stqIYJj813rwwTXgDnkGdUyC2/vQFSSecLN2D6JQwTuhLJDvU7/T0PwbBnDpaz5x
         FdHjmjsQkKB3lBqpPZJz4p3gQXTawl7x3qiYhlwGLR031uQS5i3qtFFCh8LpzPDPpwoy
         JPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YAl0tecVsURCuewdLjQ48RaCrF96ohlsENSIUfpsU+w=;
        b=PVeu1RrS5wsW6RsRE//yy/wabhRCm9xHXkCXSilM/pxVVspNw2uJJrtImkmFaVkeHh
         AbMakfFctuwdA732ltM6VKzVJQmPoqz3AfHrJNLaWJhb1sWRK4pjEsYBmYq445kFFcqX
         a6As7FEr1tQVLZ7YocbNYTH1o4vlCgdiBFXMbdiuRvVmgy2Mc1+Ifh59LFtl8M83h/OC
         a59uQRckqpC6xEI3S6VbWmiL5btBks3qk91AEqiYuv6tbCRAyizxdnT3zPNOVaCEfpFk
         kzJVlxoqkclVWUJRkGfLd8fRTALS1zSv3qR9wT9Sr6c+vc80c05IV1zBI7afSc8s2JWH
         FS1A==
X-Gm-Message-State: AOAM532EwLrGjRjih1PS0N58ZN603iFN5Gsp68oJiW4SiBN9cu0UOzQo
	jQ1rHfvXWcaWCwDh8HwzDC3h8Q==
X-Google-Smtp-Source: ABdhPJxtamYIDVXm4aGyKgQ9cjhesv/FKnN4U2mpSB4roy/h9H0baZIpnVLxCyBEEchu2j6Kvww+UA==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr531965wrp.24.1603907050586;
        Wed, 28 Oct 2020 10:44:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f13sm438798wrp.12.2020.10.28.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 10:44:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5827D1FF7E;
	Wed, 28 Oct 2020 17:44:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] meson.build: fix building of Xen support for aarch64
Date: Wed, 28 Oct 2020 17:44:06 +0000
Message-Id: <20201028174406.23424-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen is supported on aarch64 although weirdly using the i386-softmmu
model. Checking based on the host CPU meant we never enabled Xen
support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
make it not seem weird but that will require further build surgery.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 835424999d..f1fcbfed4c 100644
--- a/meson.build
+++ b/meson.build
@@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
   }
+elif cpu in [ 'arm', 'aarch64' ]
+  accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'] }
 endif
 
 ##################
-- 
2.20.1


