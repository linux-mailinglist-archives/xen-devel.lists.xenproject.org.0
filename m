Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8236BC9D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 02:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117944.223867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBVq-0007n8-LO; Tue, 27 Apr 2021 00:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117944.223867; Tue, 27 Apr 2021 00:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBVq-0007mj-IE; Tue, 27 Apr 2021 00:23:38 +0000
Received: by outflank-mailman (input) for mailman id 117944;
 Tue, 27 Apr 2021 00:23:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jew=JY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lbBVo-0007mO-NU
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 00:23:36 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cfe31a5-7ee7-4350-b395-082a8645ab5d;
 Tue, 27 Apr 2021 00:23:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C94975C0185;
 Mon, 26 Apr 2021 20:23:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 26 Apr 2021 20:23:35 -0400
Received: from localhost.localdomain (ip5b434f04.dynamic.kabel-deutschland.de
 [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE1C11080066;
 Mon, 26 Apr 2021 20:23:34 -0400 (EDT)
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
X-Inumbo-ID: 5cfe31a5-7ee7-4350-b395-082a8645ab5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9JA14x
	ievcjIUIwWayy4OYytev3Y9fSXpEqU52FkmQk=; b=W8w0PEipskmQ1hyE4Z6w60
	DtvGC1V2p44UmGSWjkTZ3EkGk6zcqAr15mzIAXDpb5EuDV6uBPG3rvKWI8YOAjGx
	bVsLEIfG17sL529hx3xcD/TXMYGyPgBR3pS5JoV8j9EXtjVLB+9e/VmnvsCfPZ0/
	x75xs3A1bmJVtMppKA5k2qhM/GR2H8sUXp3O4jpviQnP3+QaWfFFvw+NjdZW+jEH
	zZgGNfv/ij+80vwcK74uij7sOVDeTZpD6nXGMfQ+mtcWJi2oeQaZuOTZm/anXcxV
	Grj0EoI6IESEqpKUbqXkM8c/Fu/Xbb+zhJqQrk/YKXRVjrzjI7Rbm96r98KjHxVQ
	==
X-ME-Sender: <xms:h1mHYKOKWyKxNG5FRFigk1C-zodKMFnyRio7_7KVhYCB96WYDcXkzA>
    <xme:h1mHYKUQ52kKLhFIbiVday7keWcFcgwhUzVM2zOzcC8LJjUjvTCi9hIzOlwXxR3Ay
    DpmC579CKqBOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdevvdev
    ffetffevhfevhffhteefffdvheelleffjeelhfefgfeljeejffekueefnecuffhomhgrih
    hnpehpohgurdhinhenucfkphepledurdeijedrjeelrdegnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:h1mHYKgTKbquht3y9I6IlNcuZKcQcNycLlUxelelSKt5GHvk_CbL0w>
    <xmx:h1mHYC8F_f39II1hyJDw_ZbM7Yg2yY5srlcctuutjHBN8ucaSBYxig>
    <xmx:h1mHYJR4XRZrf73cPf3BjvMgvYHqt_ZyTiuf4APE8twx8N6CnBEVuw>
    <xmx:h1mHYGT7Jc1cDcW62WLLuyyHHV-aoCwGizZ0Zln1Ck-4k65uLZwR2g>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH 0/2] libxl: support common cases without block script
Date: Tue, 27 Apr 2021 02:22:30 +0200
Message-Id: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series in an attempt to speed up the domain start by removing slow block
script from the picture. The current RFC covers the simplest possible case only
- target being a block device directly. This case does not require locking at
all. Further version will cover also setting up a loop device.

This, compared to the default block script, saves about 0.5s of domain start
time, per disk. Similar speedup can be achieved with a trivial lock-less script
too. But for file-based disks, it won't be that simple with a script - setting
up a loop device lock-less is tricky and ability to keep an FD open and call
different ioctls on it greatly helps. Furthermore reusing the same loop device
for the same file can be done significantly better with a cache (which can be
stored in the libxl hosting process - like xl devd, or libvirt).

This surely isn't the only option to improve disk setup time, but is a very
atractive one. Few questions:
1. Is it acceptable approach at all?
2. Is empty 'script' parameter value going to fly? Unfortunately, NULL is
   already taken as "use default".

Marek Marczykowski-Górecki (2):
  libxl: rename 'error' label to 'out' as it is used for success too
  libxl: allow to skip block script completely

 docs/man/xl-disk-configuration.5.pod.in |  4 ++-
 tools/libs/light/libxl_disk.c           |  7 ++-
 tools/libs/light/libxl_linux.c          | 68 ++++++++++++++++++++++++--
 3 files changed, 74 insertions(+), 5 deletions(-)

base-commit: bea65a212c0581520203b6ad0d07615693f42f73
-- 
git-series 0.9.1

