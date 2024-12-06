Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C115C9E6653
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849419.1264111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA5-00075E-2d; Fri, 06 Dec 2024 04:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849419.1264111; Fri, 06 Dec 2024 04:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA4-0006sO-He; Fri, 06 Dec 2024 04:41:52 +0000
Received: by outflank-mailman (input) for mailman id 849419;
 Fri, 06 Dec 2024 04:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9y-0004Kb-WC
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:47 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e2a800-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3801A43EE9;
 Fri,  6 Dec 2024 04:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FD2BC4CEDD;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 879A7E77179;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 62e2a800-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=C4I0w8+5EC1wc6Fr7dK8Qf/iMDwJkx3ZOmN4HyH2Ud0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qKYFw2l/moSm4D/CiV74R+PyKJbSHn30VRjrCUtepKwzcx8qdNvQpKemQ4AaQtLsv
	 U/E3gB0mr/dPn0WffqoJMTR225fGoZuSl6vnE5nmutU5mKh6pA0lo7eGelK1FArqCu
	 fotwvW5Pt7j809Yw7jNpfbAv1Fhb93HYN8kpKRzkXz2wUTuy+8T3hjPwwPbtXR9xk6
	 goyoI7XfLDcMy9ha4lpxlN3qZ24JA2sV2o5fhiuzB/j6XyEX+05MQ4/h4lNCXj0bx2
	 JhWkcEeGcb1BBWOoyn0KPrCzieXX4Ry1IVRP2BFuWdIkXo6tnVSWgInsY2KZC3B3dp
	 3RHRQnAeaf/Bg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:42:05 -0800
Subject: [PATCH v2 35/35] docs/misc: update console documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-35-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=5686;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=APQcmog0xQYM3EBoFVE5ETu0ersksioDS4x/FBTt9bk=;
 b=fcukqs0MtpzP6GXP1AFPeyDh0mwVyYwNrAX1JE4Iad+84acEb8EnzftsWAW+Z/wvNGcrsuDbD
 /f1msBsXsXIBcTxHGqeGTmkklbg1oCypJQ1P8VwuGv9wF8UtrpSF+ZE
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Minor update related to virtual UART support.

Also:
 s/pv/PV/g
 s/hvm/HVM/g

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 docs/misc/console.txt | 50 ++++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/docs/misc/console.txt b/docs/misc/console.txt
index 4e180f88ba1312d8fcc47d27622ec347d387ce12..7840729b0c95d9c4ea5295f17ce77c04177f48a5 100644
--- a/docs/misc/console.txt
+++ b/docs/misc/console.txt
@@ -4,11 +4,11 @@ Xen PV Console notes
                                         stefano.stabellini@eu.citrix.com
 
 
-Xen traditionally provided a single pv console to pv guests, storing the
+Xen traditionally provided a single PV console to PV guests, storing the
 relevant information in xenstore under /local/domain/$DOMID/console.
 
-Now many years after the introduction of the pv console we have
-multiple pv consoles support for pv and hvm guests; multiple pv
+Now many years after the introduction of the PV console we have
+multiple PV consoles support for PV and HVM guests; multiple PV
 console backends (qemu and xenconsoled, see limitations below) and
 emulated serial cards too.
 
@@ -103,48 +103,50 @@ The supported values are only xenconsoled or ioemu; xenconsoled has
 several limitations: it can only be used for the first PV or virtual UART
 console and it can only connect to a pty.
 
-Emulated serials are provided by qemu-dm only to hvm guests; the number
-of emulated serials depends on how many "-serial" command line options
-are given to qemu. The output of a serial is specified as argument to
-the -serial command line option to qemu. Qemu writes the tty name to
-xenstore in the following path:
+Emulated serials are provided to HVM guests by qemu-dm or in-hypervisor UART
+emulator (Xen needs to be re-compiled).
+
+In qemu-dm case, the number of emulated serials depends on how many "-serial"
+command line options are given to qemu. The output of a serial is specified as
+argument to the -serial command line option to qemu. Qemu writes the tty name
+to xenstore in the following path:
 
 /local/domain/$DOMID/serial/$SERIAL_NUM/tty
 
 xenconsole is the tool to connect to a PV or virtual UART console or an
 emulated serial that has a pty as output. Xenconsole takes a domid as
-parameter plus an optional console type (pv for PV consoles, vuart for
-virtual UART or serial for emulated serials) and console number.
+parameter plus an optional console type ('pv' for PV consoles, 'vuart' for
+virtual UART or 'serial' for emulated serials) and console number.
 Depending on the type and console number, xenconsole will look for the tty
 node in different xenstore paths, as described above.  If the user doesn't
-specify the console type xenconsole will try to guess: if the guest is a pv
-guest it defaults to PV console, if the guest is an hvm guest it defaults to
+specify the console type xenconsole will try to guess: if the guest is a PV
+guest it defaults to PV console, if the guest is an HVM guest it defaults to
 emulated serial.
 
-By default xl creates a pv console for hvm guests, plus an emulated
+By default xl creates a PV console for HVM guests, plus an emulated
 serial if the user specified 'serial = "pty"' in the VM config file.
-Considering that xenconsole defaults to emulated serials for hvm guests,
+Considering that xenconsole defaults to emulated serials for HVM guests,
 executing xl create -c "domain" causes xenconsole to attach to the
 emulated serial tty. This is most probably what the user wanted because
-currently no bootloaders support xen pv consoles so the only way to
+currently no bootloaders support xen PV consoles so the only way to
 interact with a bootloader like grub over a console is to use the
 emulated serial.
-However the pv console is still easy to use with Linux PV on HVM guests:
+However the PV console is still easy to use with Linux PV on HVM guests:
 the user just need to pass "console=hvc0" to the kernel command line and
 then execute "xl console -t pv <domain>" to connect to it.
 
 When using stubdoms the serial cards are still emulated by qemu (this
 time running in the stubdom), the number of serial cards and where the
 output goes is still specified using qemu command line options.
-The difference is that for each emulated serial card there must be a pv
+The difference is that for each emulated serial card there must be a PV
 console connection between the stubdom and dom0 to export the serial
-output from the stubdom to dom0. The pv console backend for stubdom's pv
-consoles is always ioemu because multiple pv consoles support is a
-requirement in this case, considering that minios has its own pv console
-too. In order to simplify the setup when using stubdoms the hvm guest
-can only have one pv console with xenstored as backend (the stubdom
-could provide pv console backends to the hvm guest but then it would
-need another pv console connection for each console backend to export
+output from the stubdom to dom0. The PV console backend for stubdom's PV
+consoles is always ioemu because multiple PV consoles support is a
+requirement in this case, considering that minios has its own PV console
+too. In order to simplify the setup when using stubdoms the HVM guest
+can only have one PV console with xenstored as backend (the stubdom
+could provide PV console backends to the HVM guest but then it would
+need another PV console connection for each console backend to export
 the pty to dom0).
 
 The xenconsole program supports a very simple protocol to notify parent about

-- 
2.34.1



