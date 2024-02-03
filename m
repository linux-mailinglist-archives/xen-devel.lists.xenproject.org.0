Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B7848890
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 20:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675434.1050834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWLi7-0004e1-Tu; Sat, 03 Feb 2024 19:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675434.1050834; Sat, 03 Feb 2024 19:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWLi7-0004b3-Qx; Sat, 03 Feb 2024 19:29:55 +0000
Received: by outflank-mailman (input) for mailman id 675434;
 Sat, 03 Feb 2024 18:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIqD=JM=gmail.com=rbmarliere@srs-se1.protection.inumbo.net>)
 id 1rWL8c-0000Zl-GX
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 18:53:14 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a9d7eb3-c2c5-11ee-8a45-1f161083a0e0;
 Sat, 03 Feb 2024 19:53:12 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-296043e44caso2556332a91.0
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 10:53:12 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090adf8100b0028df5c748e4sm2119387pjv.44.2024.02.03.10.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:53:10 -0800 (PST)
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
X-Inumbo-ID: 7a9d7eb3-c2c5-11ee-8a45-1f161083a0e0
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706986391; x=1707591191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZiekaIfpVrKOF3qlNauN16zVWw+/1GjqDEklLmvnts=;
        b=kOlYa3fbH+MjFvLmBnPtfcLPgOErXcHEyqa18y3X4o75okE4A5NQkaRku2sRCe3eXD
         xUgxqZNwcttq3DHc0YzKsXoNkmknXV4Bqcrx2xW32xKk7cIoRjA2vAd+CIPlpEcvAm8c
         jdEd75Zec1BAiA2h4SiKPa0OMdIx5UIdOrl3PPkgmXJaMswYPnullBDwp2Q4/mLVUypy
         PtTCWvV1eUJw+k3yCtylFlJXTh+XvT3qI+cxcbgdoDbqcj1Eo+kOEKVdu88H99td+lDB
         x9w1/J/lH2NAnht7pAUINP224r/MqjFthrrvosj4355LuzWl4mHi5hXJ3DUj3tYfqUxb
         r2tg==
X-Gm-Message-State: AOJu0YzHmZWa4mCRSoktqBTT6s3uIZuTh3+CO+Vko7avjoxsqXxZnJO0
	MelshDJ0HkhyHrnn0tkN1qJqVSff+/BM+vQ+vdz21fuURYvtAsngGOjixwgyoO7xPA==
X-Google-Smtp-Source: AGHT+IFqLotwZ+hQeDo37iliFJZepy3q/2BZbRkjOXY4QBZFo73gskAH5bb0qVTSKR5AWfd6OLrGcA==
X-Received: by 2002:a17:90b:1014:b0:295:f310:efd6 with SMTP id gm20-20020a17090b101400b00295f310efd6mr5231697pjb.43.1706986390968;
        Sat, 03 Feb 2024 10:53:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXhGFw3RCfKea7l4V9sFQec+KG8sGmKcqPuZBoeIDD3LDJwGnGU4R7RYN5Ty9EMkdB10ONC6MN4vn6dE9GENBhkKSbja5TqgQNwLqRbuovwYC41AJFpjEarUOVfSNZaGMGrTEHsPSfiFbaxUrXIhPzNO/wa5I8+KJ2frC37FZrZDbHMqgBR0E37giN09AYX0TWxIqzPgBKZYDmiWhfHnVM=
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1706986388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OZiekaIfpVrKOF3qlNauN16zVWw+/1GjqDEklLmvnts=;
	b=H97NBcnpZQ59hIs5U/nx99cmSh4vblAVkS4yZRJavzuz0qX6V6CYy6vn/R7wctxO8ju9Ql
	oQehq2n+r+IAj0PTYhkGn0st5hFzkmrv5k+Obh3VuBq1MEE1iyrDlaIxVgcAb0fX+6d76L
	DkHb9jM4+UCVTT0eisaM1HdwoR0jVdJ2NojvVOHuY2tEI2QwqLwqukxqok841mTfvzs/hF
	Zrt8+rguJ8HF/Q/rhTMpEdybUUuCgS6bZSElhgZEkKcviiQjLJC15yyvLM6qeMZ+ez0gLu
	KajZ6/8MHRGJxrWMg+JbHJKXsLYmz4XP5OGq91WxayeS7VS5L5r6HaybFMs6kw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/2] drivers: xen: struct bus_type cleanup
Date: Sat, 03 Feb 2024 15:53:36 -0300
Message-Id: <20240203-bus_cleanup-xen-v1-0-c2f5fe89ed95@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCLvmUC/x3M0QpAQBBA0V/RPNtasyh+RdJgMKWh3Uht/t3m8
 TzcGyGwFw7QZhE83xLk0IQiz2DaSFc2MicDWiwtWmfGKwzTzqTXaR5WM1NTUY1Yk6sgVafnRZ7
 /2PXv+wGEV5g+YQAAAA==
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=DMQ8P/LGJBRCmHwEmxktQacfWtwbjDULAMo73R7wiAQ=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvoux0PW32SbhsfI597K/NU/w+vQgdmNdCHwJK
 LXOgiyVXqGJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6LsQAKCRDJC4p8Y4ZY
 pgXqD/9Hgb+Kr23vOwiCVsyz6tS8SSlJymR+rzt8b+oFSLBUAHPA02/D+eCzFgN5gzQmavvwB3o
 3xtsKg8AUqbZNmLvQSnO7ahHqeevzhRjG8vqgxwOBemczrTzh3H/WublHvK1ojsd0aTLI0AMrUt
 xChU1a/m82yZHHslgQTThr8jHjPOW4cjzReI9o/Xl2hOLuXK78IE+a51ZnY1SUI0W+tP6cE9LU7
 /gSZwEftp4SuL+R9rJrwSfeWbSc2dLxuvf/yNiYITEswhQZCNTfxd9wU/IK85cv2K22W5AMTbsY
 ObdpjtWaZZjAwZrt+VU8B462reAEZxRDiFI51TsiED8p9274RmMDC6MQFwPxpRThDSoIGqhvTdb
 jejuZVSPrIOfWdVEP/ERXcgVDjb0mDkEmeYqQb/5hYrVK/cCqcEcIVrylekfh1iGzj5xqgtffqq
 A0lXEgMFT7OC6FtqcwHtxs5GXUCqNYqmHRoZoy4knRlYeSbeypMG4gIYb++4vaeXNLdqV22T0Sa
 I57ls3glisePCcjL8vs/TNJs0WxMVsyTJje2NqcyibPhNk3ZQW0a+ET+4Bk1MrPFR0r/teZSuBX
 Yji3PGK+IL1jbILrn6vl5DKiftOPm+dQ5PqK08Z7MhhtnNXnUjB1BKC+Gq5cz4MQb38zA4Wlw7N
 +bdOFgxWnlcea8Q==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]). Specifically, this series is part of the task of
splitting one of his TODOs [2].

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=bus_cleanup&id=26105f537f0c60eacfeb430abd2e05d7ddcdd8aa

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (2):
      xen: pcpu: make xen_pcpu_subsys const
      xen: balloon: make balloon_subsys const

 drivers/xen/pcpu.c        | 2 +-
 drivers/xen/xen-balloon.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 2d2db7d40254d5fb53b11ebd703cd1ed0c5de7a1
change-id: 20240203-bus_cleanup-xen-da95a6226a35

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


