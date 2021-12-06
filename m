Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D801469651
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238866.413964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDig-000473-JJ; Mon, 06 Dec 2021 13:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238866.413964; Mon, 06 Dec 2021 13:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDig-00043q-FM; Mon, 06 Dec 2021 13:07:50 +0000
Received: by outflank-mailman (input) for mailman id 238866;
 Mon, 06 Dec 2021 13:07:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Xlh=QX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muDie-00043k-Go
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:07:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fbc92bb-5695-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:07:45 +0100 (CET)
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
X-Inumbo-ID: 7fbc92bb-5695-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638796066;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9k71yHsPu4B98K1Cd0X0PtdTYyyopEnc/TMQhN3V4E4=;
  b=hpecua329P+kT93QaCyHXVB0j8IyPbGsORMWbsfZmKlz9Mv59E9B2YYD
   uK2ZNu7uZ2YWXdOUxIA+7fKXRzbyTlhNf8J4YfZypxiiBaIzX5vDRzcMK
   jJ2b3/tECAo4uDqA/0fKzQqAZ7Lhxk1OfGL1phKu4VjxfQYqiX4Aoqw5O
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AStHQWB7mUOo3vhzOP1bLnPKBIANeGZScR24iMq6p1i1b4a66WL1JMglxPRKQPRdJztantguhE
 jXDNTHw32oztN2NwebU+xMiX2IMqLV0x5xwUdoSwNY69eR/z0SxkeLX1vyQgFC5W6bGFF+t82j
 Ra3+X88sFY1Y0Whq1CZjdgyZzNp7Uf5ZbzS7Dl1wRLCIX327/Q8XXIKgJWK2T2Bwof6Kz/8ES6
 A3lixLqa96Z37TRsKOW4C+tztBcgAhcwIyskdoqFRGn5bzgp4QtVWs6OMRVC7oyZLKhxq7ifID
 oApw4GlTnbwEr6HTQjuSQZIF
X-SBRS: None
X-MesageID: 59345909
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/KDOKqA8XAVYQRVW/xXkw5YqxClBgxIJ4kV8jS/XYbTApG4l1jRVn
 TNNWmyDPq2IZmWkLowlOd+/80pQ75aGy4c3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hieFxN9dz
 /B37beqaCcjZ4T9pvkGTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjWxs25EWTJ4yY
 eIIMAtKfhfqXyEVM1NHL6sjsfmXl1PWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHOWskUTd911KbUR8iCtwPP90jiEHXdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4gDGJGT9bxgbQ+0RqmBNzDJrVml
 CJb8/VyFMhUUfmweNWlGY3g3NiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxc2aJdZI2W3P
 x+7VeZtCHl7ZiHCgUhfOd3ZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirV4/s7ikl0z/uVdfDVbLIYo43KymMrpksfja+VqNq
 L6y9aKikn1ibQE3WQGPmaZ7ELzABSJT6Unep5MFe+idDBBhHW19Wfbdzal4I95unrhPl/eO9
 Xa4AxcKxF36jHzBCAOLdnE8N++/Acch9So2bX42IFKl+3k/eoLzvq0RQIQ6IOs8/+t5wP8qE
 /RcI5ecAu5CQyjs8igGacWvt5RrcRmm3FrcPyesbDUlUYRnQgjFpo3tcgf1rXFcBSurr8ou5
 ban01qDE5YEQg1jCufQae6ukAzt7SRMxroqUhKRcNdJeUjq/Ix7EADLj6c6c5MWNBHO5jqGz
 ALKUx0WkvbA/t0u+97TiKHa84rwS7liHlBXFnXw5KqtMXWI5XKqxIJNXbrafT3ZU2+oqqyua
 f8MkqP5OfwD2l1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQf5LdQwrJ5uBetX
 hPd89ZXDryFJcf5HQNDPwEidOmCiakZlzS6AS7Z+6kmCPubJIa6bHg=
IronPort-HdrOrdr: A9a23:pEmcva6nUGfgM7DlkgPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.87,291,1631592000"; 
   d="scan'208";a="59345909"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/build: Move exception tables into __ro_after_init
Date: Mon, 6 Dec 2021 13:07:25 +0000
Message-ID: <20211206130725.13511-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It turns out that we've always been abusing the fact that .rodata is
read/write during early boot, so we can sort the two tables.

Now that we have a real __ro_after_init concept, reposition them to better
match reality.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/xen.lds.S | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 4db5b404e073..ca22e984f807 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -100,6 +100,18 @@ SECTIONS
 
        __ro_after_init_start = .;
        *(.data.ro_after_init)
+
+       . = ALIGN(8);
+       /* Exception table */
+       __start___ex_table = .;
+       *(.ex_table)
+       __stop___ex_table = .;
+
+       /* Pre-exception table */
+       __start___pre_ex_table = .;
+       *(.ex_table.pre)
+       __stop___pre_ex_table = .;
+
        . = ALIGN(PAGE_SIZE);
        __ro_after_init_end = .;
 
@@ -129,17 +141,6 @@ SECTIONS
        *(.note.gnu.build-id)
        __note_gnu_build_id_end = .;
 #endif
-       . = ALIGN(8);
-       /* Exception table */
-       __start___ex_table = .;
-       *(.ex_table)
-       __stop___ex_table = .;
-
-       /* Pre-exception table */
-       __start___pre_ex_table = .;
-       *(.ex_table.pre)
-       __stop___pre_ex_table = .;
-
 #ifdef CONFIG_HAS_VPCI
        . = ALIGN(POINTER_ALIGN);
        __start_vpci_array = .;
-- 
2.11.0


