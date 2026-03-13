Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEFxKJc/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFD2875F0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254160.1550137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fF-0006io-Op; Fri, 13 Mar 2026 16:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254160.1550137; Fri, 13 Mar 2026 16:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fF-0006h8-MB; Fri, 13 Mar 2026 16:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1254160;
 Fri, 13 Mar 2026 16:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiiW=BN=bounce.vates.tech=bounce-md_30504962.69b43f80.v1-f694fcadf41d4c61a465fb8a145c2819@srs-se1.protection.inumbo.net>)
 id 1w15fD-0006dJ-HC
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:47:03 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f69439c-1efc-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:46:57 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVkm1XQTzPm0PqM
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:46:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f694fcadf41d4c61a465fb8a145c2819; Fri, 13 Mar 2026 16:46:56 +0000
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
X-Inumbo-ID: 3f69439c-1efc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773420416; x=1773690416;
	bh=YVESgmaHRMpbf7+5tHUgQMMGFPJarDui+ShzAbAzOzM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=BRC6lsby6gFZ4a8xXvpuYAQHzKvFgNyR/cjJzmjMCocAY17z7n/pqkzpbWmzeY7iT
	 JQKEhIjHDRGLwYUMnVSHlk7Gm9Nu8GE8T7i3M7iRr/1Y2y9jPteuYJizawLBvsvIy2
	 94sMvbB47GELxFL4nGVBpn4KP8gi8lISSlYVIq1JmSr9nYbXVL3RaeY68HR0D5SUH0
	 OPM9Kz74oU4FPAtNlpIlt/zmeGZ/b7FoJ2XmwKAYs3YqJcOPLTfiHHBkMoVM06r953
	 K67YUEG6ACoDpWQ3NhWX8yTgmDIFOEpZ6YkZscJQxyNf9kRko4STGTmKUZy6juUkOo
	 eaWZuGbJcY3rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773420416; x=1773680916; i=thierry.escande@vates.tech;
	bh=YVESgmaHRMpbf7+5tHUgQMMGFPJarDui+ShzAbAzOzM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=IujO/Oye3h8RZR2kw8gwBbwpAYTcodSvj/J5aHf1R0naDYFbLmt+VMbYd+yCen+Nm
	 Xq5QSQwlX9N5U/ubQi+weCDmXgjxBuBHTUv1XE3WsmOe1p8K//Kh+D2Nj0bmuI8LDm
	 zaTIfaqNoKp3GoH+/lW0huJ4x41G4ZeuHDr/2YViOlhIxM0VfOC8goH6BKrgtFtlsA
	 z1tFxMXWTTgYsLQlTNxOaRmxs5nuA9hGxkv5u16HIgLg6dF4MDpKfyzwU5mjP2a1zl
	 DXeXJYX9dDswCum7OJWDn2zw/nk3YsI9BiKudTYoi7YvMu9Vf2JJeiPL9mzgHFaS5O
	 xP4Sjruv0JKWQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/4]=20Xen:=20Add=20Q35=20initial=20support=20for=20HVM=20guests?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773420415146
To: qemu-devel@nongnu.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, "Anthony PERARD" <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Message-Id: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f694fcadf41d4c61a465fb8a145c2819?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:46:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:thierry.escande@vates.tech,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.089];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 79DFD2875F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series introduces Q35 chipset support for Xen HVM guests. This is
based on the work from Alexey Gerasimenko (See patchset [1] for reference).

This series does not implement device passthrough as this will need more work
on the Xen side to support multiple PCI buses. Since Q35 chipset does not
support device hotplugging and with current Xen mechanism for device
passthrough, they have to be plugged to a new PCIe root port, i.e. not the PCI
bus 0.

As a first step for Q35 guests support, this series implements:
- Legacy interrupt routing for the ICH9 LPC bridge (i.e. not IOAPIC)
- Xen HVM machine initialization in pc_q35_init()
- Access to PCIe Extended Config Space
- Fix for incorrect values and usage for PCIEXBAR masks

The corresponding patchset for the Xen Project has been posted at [2].

[1] https://lore.kernel.org/xen-devel/cover.1520867740.git.x1917x@gmail.com/
[2] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.escande@vates.tech/

Alexey Gerasimenko (2):
  pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
  q35: Fix incorrect values for PCIEXBAR masks

Thierry Escande (2):
  q35/xen: Add Xen support for Q35
  xen: Handle PCIe config space size in cpu_ioreq_config()

 hw/i386/pc_piix.c         |  2 --
 hw/i386/pc_q35.c          | 12 +++++++++++-
 hw/i386/xen/xen-hvm.c     | 38 ++++++++++++++++++++++++++++++++++++++
 hw/isa/lpc_ich9.c         | 16 +++++++++++++---
 hw/pci-host/q35.c         |  6 +++---
 hw/xen/xen-hvm-common.c   | 11 +++++++----
 include/hw/pci-host/q35.h |  4 ++--
 include/hw/xen/xen.h      |  5 +++++
 stubs/xen-hw-stub.c       |  4 ++++
 9 files changed, 83 insertions(+), 15 deletions(-)

-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


