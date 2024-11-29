Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B409E9DBE4D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845636.1260994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGpNA-0005zu-BS; Fri, 29 Nov 2024 01:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845636.1260994; Fri, 29 Nov 2024 01:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGpNA-0005uF-71; Fri, 29 Nov 2024 01:00:40 +0000
Received: by outflank-mailman (input) for mailman id 845636;
 Fri, 29 Nov 2024 01:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qpb5=SY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tGpN8-000583-AC
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:00:38 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555410a7-aded-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 02:00:33 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9D372254015E;
 Thu, 28 Nov 2024 20:00:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 28 Nov 2024 20:00:31 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Nov 2024 20:00:30 -0500 (EST)
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
X-Inumbo-ID: 555410a7-aded-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTU0IiwiaGVsbyI6ImZoaWdoLWIzLXNtdHAubWVzc2FnaW5nZW5naW5lLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU1NTQxMGE3LWFkZWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODQyMDMzLjQ4NzU5NCwic2VuZGVyIjoibWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1732842031; x=1732928431; bh=9g9PHEErO+Bl0K7DKsHdjAw8hGQNDZ/B
	Veh9x4/vszY=; b=m8jkhTCxXU7QZnB43sl2BCWkAPca6RgQ6/4DLkIJSZ33eB87
	b7UXKmIU2W1aLwo5GeYUjWpy0pg2b1tEI8GLJbe/Qu19ggS5Tm3CKnf0/EpQDIMG
	1i/2SuMlD7vnrvAFAim4/M39SUJrbEk1BbaDJ1RN8Ivc3KPuquxyObRLDZXOP1JC
	EwwD2GwWmkQogRywjC63HgDzRDdgbEz3IrJWbo5LRjBL/u0nSrH5Ur3W/HFIQwUh
	dwZJGcnBpZYKKqp45lTZcutXT4StdUNAgt0MzP8u80CHYJU4s6o2U9akkdV6gouF
	V0t+ATFYwsHe9XOnLcJfRudYqqurz6+1sYFCKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1732842031; x=1732928431; bh=9g9PHEErO+Bl0K7DKsHdjAw8hGQN
	DZ/BVeh9x4/vszY=; b=PevqJ+Iom8By1/9fV9HSAY0UPsv3JJZivGMyBjkcrjyN
	Ujacg3GRNtlSWqaaAws7fVbEy82tsw6gTFesbSXwnBvYDfRRg+nNO3b+5G17TpQp
	0HMpvAjVc5zwBCTUOxcz7v5PfgDt3i1ShnaaoMO0+Ifjzn9IvaQozcW3fEZou+HU
	Lx7r9IB9VSS+zan89xCVaKCnEWn4mkMh6EBASSJlcEfsvi0LaK9lYTvhcMDg447a
	95TljB8dgrBXVJ6Rd1LHJdKHkgjIhIkCO+DukI+A2TJe2rI4Fmh0Er/LOMGV0n3J
	FLEv7msOBfAlu/Z9Q6CpL4VPq1/ipt/0SJPNbmvFhA==
X-ME-Sender: <xms:LhJJZ8D_kJy-CLlDsuj2wSw077ijlMDNOrZgBH3DFUSQE0j9c4bZTQ>
    <xme:LhJJZ-iAeXyjK8bIZtYCMVIyC2MXEsT81cQIpXlq6iLjOsUgJyVt6wTbks9vwWueY
    BLu7LTNuptSbA>
X-ME-Received: <xmr:LhJJZ_mqzCZJSFJ_kLU6w8zEKRCxA1xjII3QiAuXWkrvOHGJQOUD_hkkVFFJ0ayz4Y_vQ-3V-P47YMlCmnm7Atfq66QMCBJ3IK406WpZRAT-h5U7mGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedvgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfh
    rhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrh
    hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgr
    thhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheelgfegkeelgeehhf
    dthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspg
    hrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggv
    vhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrh
    hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthho
    pegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepjh
    hgrhhoshhssehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:LxJJZyzuLzcocO_G3KD7ZMCsHP61jNJq6j1aroOjXtjB3gmkSvAXzA>
    <xmx:LxJJZxS1N4ThSIo0uP6mu3Z7kGHUIZ_0L3poPSD9wRNkJJ0Gwh8DQA>
    <xmx:LxJJZ9atvh9nmL5b0kSdZKAVwMLggvdQbGs7JTMJsCKX9dmKJb1jmA>
    <xmx:LxJJZ6TZQxyZGEQOvxsUEm4JCBuH3HA58aG5GBzYsb6HMPkiGc9yfw>
    <xmx:LxJJZze4InUO3il_hni9_4g987r3mgq4IiXYDn5xpVrBC83XyYrhU_ee>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: extend IGD check
Date: Fri, 29 Nov 2024 02:00:10 +0100
Message-ID: <20241129010026.2869818-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consider also "Display controller" an IGD, not only "VGA compatible
controller". Specifically, IGD on Raptor Lake has 0x038000 class, not
0x030000.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 35e3e1360423..5be9b8239567 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -635,7 +635,7 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
 
         if (sysfs_dev_get_class(gc, pci, &class))
             continue;
-        if (class == 0x030000)
+        if (class == 0x030000 || class == 0x038000)
             return true;
     }
 
-- 
2.46.0


