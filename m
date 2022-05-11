Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61A5234E0
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326899.549565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomsX-0005ul-TZ; Wed, 11 May 2022 13:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326899.549565; Wed, 11 May 2022 13:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomsX-0005rj-PZ; Wed, 11 May 2022 13:59:49 +0000
Received: by outflank-mailman (input) for mailman id 326899;
 Wed, 11 May 2022 13:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7Fu=VT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nomsX-0005rd-1y
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 13:59:49 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d40c74b-d132-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 15:59:47 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F3B80320096F;
 Wed, 11 May 2022 09:59:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 11 May 2022 09:59:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 09:59:41 -0400 (EDT)
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
X-Inumbo-ID: 9d40c74b-d132-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1652277583; x=1652363983; bh=Lexwo3wAboDXzqe+46X7nnMk4/mtVtLozIW
	S6x7/VRo=; b=WLHZwkFadLKiZX167D+7OwsLV5K5hv4LjBYyFqyfLsOhhrc9czw
	0QD7U6oGOzNaTOZSMOgWPGTeTtNU+NNK5UrLpNCx91OEotqyawBDPi6sRaklL92W
	Slj6S4S5Lw2n644xEsry82kk3dYNdbhUdAlvn9w+s8UgutmWJNVjejwfgX0g+nfk
	ouaRVBnJEoerD/ed1gEh41jhP5qHo5ZcRhGzt3AnB0Fc2VC1Ijhx+mFNUCXA0X/V
	ovsqpC2W3c9LHrd82cWYXePjjRBOdsw/K6frzRp3ZY811vMuJY2c8IQVrjm8VOlL
	ika9XVu+/AR4I5NI+GVm9DgVWmidvIlAWJg==
X-ME-Sender: <xms:T8F7Ym0T96u_rtXkBENwtAocUZgYkqCa7-B8kJrpvOGuWDLBwF271w>
    <xme:T8F7YpFPGerXCs51BDGNLEjh1OwzEwACGsSjCtUf50X65VHZYVoWvYG2_y0w9pjIG
    CeNGSGocI2rRQ>
X-ME-Received: <xmr:T8F7Yu5-T3kIsbifpur6OGHDNjsTX-r-_KJ6RG8ZBJ5oHD14yq6Q-SM3u8Wfsef1kiw8xyI8R0Q24ONLP6sAFte2RhxT3j8Oyw4bloT8p8OCFt4FOWY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:T8F7Yn1LLr_sS1kDZQQsJVJHJ9lGJIDdHt2kQskQTvFZwDWFyJ-DBA>
    <xmx:T8F7YpE2CDhDvkrvKHfgMJvN5sb85BoMjmVTtkEVQzkmNz9FlgXG-g>
    <xmx:T8F7Yg8eGMlnu3Xhi22PcrHPgaHEg4NraFJfjOL5hHM-0u2b6C7wnQ>
    <xmx:T8F7YiN0IQpg3_qfwgK0w_VheikZZ1LfPtqEHW9QbD6j3H5boXnx-A>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Date: Wed, 11 May 2022 15:59:28 +0200
Message-Id: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
by the PCI Local Bus Specification Revision 3.0 (from 2004) as
"unknown"/"no connection". Fallback to poll mode in this case.
The 0xff handling is x86-specific, the surrounding code is guarded with
CONFIG_X86 anyway.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v4:
 - adjust log message, change it from WARNING to INFO
 - re-add x86 reference in the commit message
Changes in v3:
 - change back to checking 0xff explicitly
 - adjust commit message, include spec reference
 - change warning to match the above
Changes in v2:
 - add log message
 - extend commit message
 - code style fix
---
 xen/drivers/char/ns16550.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index fb75cee4a13a..c0d65cff62fe 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                             pci_conf_read8(PCI_SBDF(0, b, d, f),
                                            PCI_INTERRUPT_LINE) : 0;
 
+                if ( uart->irq == 0xff )
+                    uart->irq = 0;
+                if ( !uart->irq )
+                    printk(XENLOG_INFO
+                           "ns16550: %pp no legacy IRQ %d, using poll mode\n",
+                           &PCI_SBDF(0, b, d, f), uart->irq);
+
                 return 0;
             }
         }
-- 
2.35.1


