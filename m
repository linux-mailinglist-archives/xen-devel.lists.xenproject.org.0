Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB6A011AE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864878.1276163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtTM-000302-4k; Sat, 04 Jan 2025 02:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864878.1276163; Sat, 04 Jan 2025 02:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtTM-0002vL-0p; Sat, 04 Jan 2025 02:01:04 +0000
Received: by outflank-mailman (input) for mailman id 864878;
 Sat, 04 Jan 2025 02:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQu-0005Ax-T7
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ee09da4-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0898E5C6411;
 Sat,  4 Jan 2025 01:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E314C4CEE4;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 16F74E77188;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
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
X-Inumbo-ID: 5ee09da4-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955896;
	bh=C4I0w8+5EC1wc6Fr7dK8Qf/iMDwJkx3ZOmN4HyH2Ud0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QJCbct/KweF+9rRQW1qw0dCoTySabWk30VD93NOmGRcJwjxOs/qU3zDrrI5flFa8Y
	 Mz1yRRiByk6k8UEepfCk2mtYwrCdkTBl/+XWqMulhJJG1SRjz/JE1xZo6t40bg6ieS
	 H/Kq+OVSlY1B/Kx579lbK2SNFu/1KVUVpYe6DePm4lgkx3xbsGXs1I8+ywepXNJ3L1
	 9k9EDZ4sTu/+x/vpKaw/UW2jpGC4krcycctf/ZEXwqzqK/pSbWGsgz/YGuc8DMYx6v
	 efXgKkn7P0Onq9JciB8/ijAsIs6rLSTGIprOCKN+JG0eMN7BkVvUNFhnzSnKdwdOy6
	 H9p+9Z/fl0m+g==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:29 -0800
Subject: [PATCH v3 23/24] docs/misc: update console documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-23-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=5686;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=APQcmog0xQYM3EBoFVE5ETu0ersksioDS4x/FBTt9bk=;
 b=oqKShhLqX/avc2rWyyCrDQH9JFfddXKvzHL7pbNhO2CYyq/vCCa+kigFa1VIsi9tjZPicHGI0
 qLaOcxQIb1yCMyyC3wkHVL1ZUfcbYFYPKIe6Rd7bLRYo4ErAcm2Phtz
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



