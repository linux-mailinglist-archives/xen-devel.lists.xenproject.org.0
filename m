Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9A24FB8F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 12:34:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA9ni-0001cC-FE; Mon, 24 Aug 2020 10:34:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3v4v=CC=3mdeb.com=norbert.kaminski@srs-us1.protection.inumbo.net>)
 id 1kA9nh-0001c7-0Y
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 10:34:05 +0000
X-Inumbo-ID: 6eb443e7-0a0d-435e-828c-26cfd491347f
Received: from 4.mo178.mail-out.ovh.net (unknown [46.105.49.171])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6eb443e7-0a0d-435e-828c-26cfd491347f;
 Mon, 24 Aug 2020 10:34:00 +0000 (UTC)
Received: from player730.ha.ovh.net (unknown [10.108.54.87])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id DB3E1ADA7B
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 12:33:59 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
 (Authenticated sender: norbert.kaminski@3mdeb.com)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 8F74C155050EB;
 Mon, 24 Aug 2020 10:33:53 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c254b791-6a50-433b-b21f-3ea38b74bd89,
 A7873582E0D946BF63F2D7AE2A93EBA73D5A595B) smtp.auth=norbert.kaminski@3mdeb.com
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, insurgo@riseup.net,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: Qubes OS 4.1 under the Heads
Message-ID: <76d823d0-03cc-d628-6507-1f300e13b5b2@3mdeb.com>
Date: Mon, 24 Aug 2020 12:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Ovh-Tracer-Id: 10923199423067560396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddukedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvuffkffgfgggtgfesthekredttdefjeenucfhrhhomheppfhorhgsvghrthcumfgrmhhinhhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevjeeffeehjeethfejgeeliefhveeiveegfeefgeefjeevhfekteethfegkeehtdenucffohhmrghinhepohhsrhgvshgvrghrtghhrdhnvghtpdhgihhthhhusgdrtghomhdpuddurdhsohdpfehmuggvsgdrtghomhenucfkpheptddrtddrtddrtddpkeehrddvvddvrdduudejrddvvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeftddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

I'm trying to boot Qubes 4.1 under the Heads (http://osresearch.net/).
The Heads uses kexec to run the Xen 4.13 with Qubes kernel. During the
boot process on the screen appear colorful artifacts, which are shown in
this issue:

https://github.com/osresearch/heads/issues/789

The installation media booted properly when I replaced the hypervisor to
the stable-4.11. So I've bisected Xen from the 4.11 to 4.13 version and
I found out that problems start with:

https://github.com/xen-project/xen/commit/dcf4179

This is the first commit where Qubes OS doesn't boot properly. The Qubes
kernel cannot find the LUKS UUID and boot ends in the emergency mode.
The colorful artifacts appear in this commit:

https://github.com/xen-project/xen/commit/07c181c

Here is the dump of the DMAR table:

DMAR @ 0x0000000000000000
   0000: 44 4D 41 52 A8 00 00 00 01 E8 43 4F 52 45 20 20 DMAR......CORE
   0010: 43 4F 52 45 42 4F 4F 54 00 00 00 00 43 4F 52 45 COREBOOT....CORE
   0020: 00 00 00 00 23 01 00 00 00 00 00 00 00 00 00 00 ....#...........
   0030: 00 00 20 00 00 00 00 00 00 00 D9 FE 00 00 00 00 .. .............
   0040: 01 08 00 00 00 00 02 00 01 08 00 00 00 00 02 01 ................
   0050: 00 00 58 00 01 00 00 00 00 10 D9 FE 00 00 00 00 ..X.............
   0060: 03 08 00 00 02 FA 1F 00 04 08 00 00 00 FA 0F 00 ................
   0070: 04 08 00 00 00 FA 0F 01 04 08 00 00 00 FA 0F 02 ................
   0080: 04 08 00 00 00 FA 0F 03 04 08 00 00 00 FA 0F 04 ................
   0090: 04 08 00 00 00 FA 0F 05 04 08 00 00 00 FA 0F 06 ................
   00A0: 04 08 00 00 00 FA 0F 07                         ........

I wasn't able to dump the Xen dmesg due to a mismatch between
xen-tools (4.13) and hypervisor (4.12).

I'd appreciate any help on this subject.

---
Best Regards,
Norbert Kamiński
Embedded Systems Engineer
GPG key ID: 9E9F90AFE10F466A
3mdeb.com

