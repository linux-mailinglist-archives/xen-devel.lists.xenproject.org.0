Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CFB4140CF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 06:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191822.342380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSu8m-0004Vs-Gr; Wed, 22 Sep 2021 04:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191822.342380; Wed, 22 Sep 2021 04:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSu8m-0004T5-Cd; Wed, 22 Sep 2021 04:45:52 +0000
Received: by outflank-mailman (input) for mailman id 191822;
 Tue, 21 Sep 2021 16:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=//zX=OL=stuge.se=peter@srs-us1.protection.inumbo.net>)
 id 1mSiok-0004a6-3w
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 16:40:26 +0000
Received: from foo.stuge.se (unknown [212.116.89.98])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d6ab99b-1afa-11ec-b908-12813bfff9fa;
 Tue, 21 Sep 2021 16:40:23 +0000 (UTC)
Received: (qmail 19290 invoked by uid 1000); 21 Sep 2021 15:40:21 -0000
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
X-Inumbo-ID: 9d6ab99b-1afa-11ec-b908-12813bfff9fa
Message-ID: <20210921154021.19289.qmail@stuge.se>
Date: Tue, 21 Sep 2021 15:40:20 +0000
From: Peter Stuge <peter@stuge.se>
To: Alec Brown <alec.r.brown@oracle.com>,
  Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: "coreboot@coreboot.org" <coreboot@coreboot.org>,
  "grub-devel@gnu.org" <grub-devel@gnu.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>,
  "trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>,
  "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
  "x86@kernel.org" <x86@kernel.org>,
  "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
  Aleksandr Burmashev <alexander.burmashev@oracle.com>,
  "allen.cryptic@gmail.com" <allen.cryptic@gmail.com>,
  "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
  "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
  "ardb@kernel.org" <ardb@kernel.org>,
  "btrotter@gmail.com" <btrotter@gmail.com>,
  Daniel Kiper <daniel.kiper@oracle.com>,
  "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
  Eric DeVolder <eric.devolder@oracle.com>,
  Eric Snowberg <eric.snowberg@oracle.com>,
  "frowand.list@gmail.com" <frowand.list@gmail.com>,
  "hpa@zytor.com" <hpa@zytor.com>,
  "hun@n-dimensional.de" <hun@n-dimensional.de>,
  "james.dutton@gmail.com" <james.dutton@gmail.com>,
  "javierm@redhat.com" <javierm@redhat.com>,
  Joao Martins <joao.m.martins@oracle.com>,
  "jwerner@chromium.org" <jwerner@chromium.org>,
  Kanth Ghatraju <kanth.ghatraju@oracle.com>,
  Konrad Wilk <konrad.wilk@oracle.com>,
  "krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>,
  "leif@nuviainc.co m" <leif@nuviainc.com>,
  "lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>,
  "luto@amacapital.net" <luto@amacapital.net>,
  "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
  "mjg59@google.com" <mjg59@google.com>,
  "mtottenh@akamai.com" <mtottenh@akamai.com>,
  "phcoder@gmail.com" <phcoder@gmail.com>,
  "piotr.krol@3mdeb.com" <piotr.krol@3mdeb.com>,
  "pjones@redhat.com" <pjones@redhat.com>,
  "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
  "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
  "rdunlap@infradead.org" <rdunlap@infradead.org>,
  "roger.pau@citrix.com" <roger.pau@citrix.com>,
  Ross Philipson <ross.philipson@oracle.com>,
  "sjg@chromium.org" <sjg@chromium.org>,
  "trini@konsulko.com" <trini@konsulko.com>,
  "tyhicks@linux.microsoft.com" <tyhicks@linux.microsoft.com>,
  "ulrich.windl@rz.uni-regensburg.de" <ulrich.windl@rz.uni-regensburg.de>,
  "wvervoorn@eltan.com" <wvervoorn@eltan.com>,
  "rharwood@redhat.com" <rharwood@redhat.com>
Subject: Re: [SPECIFICATION RFC v3] The firmware and bootloader log
 specification
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <A7F710D3-5148-4E92-9E3D-5D850AD0245F@gmx.de>
 <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>

Alec Brown wrote:
> Below is how the layout of these logs would store their data.
>=20
> bf_log_header:
>                +-------------------+
> u32            | version           |
> u32            | size              |
> u8[64]         | producer          |
> u8[64]         | log_format        |
> u64            | flags             |
> u64            | next_bflh_addr    |
> u64            | log_addr          |
> u32            | log_size          |
>                +-------------------+

I suggest to include a .magic at least in bf_log_header and an
=2Exor_checksum or .crc32 only in bf_log_header.

=2Emagic doubles as endianess indicator when the structures are
stored on movable media. (Pick an asymmetric magic bit pattern!)

I suggest renaming .next_bflh_addr to .next_log_header and .log_addr
to .log_buffer_addr.

I suggest to remove .size and .log_size:

The rationale for .size is "to allow for backward compatibility" but
that seems redundant thanks to .version.

=2Elog_size can be calculated from the subordinate data and is thus
mostly an unneccessary source of potential inconsistency.


> bf_log_buffer:
>                +-------------------+
> u32            | version           |
> u32            | size              |
> u8[64]         | producer          |
> u32            | next_msg_off      |
> bf_log_msg[l]  | msgs              |
>                +-------------------+

I suggest replacing .size and .next_msg_off with .messages containing l:

=2Esize can then be calculated from .messages; again, reliably avoiding
inconsistency between .size and .next_msg_off.

Allocated size doesn't seem useful if writers must anyway maintain state
containing the starting address. If writers must be allowed to be completely
stateless then maybe at least rename .size to .allocated_size and see below
for discovery.

Having .messages also eliminates the need for an end-of-messages marker
when the allocated space is not yet filled.


> bf_log_msg:
>                +-------------------+
> u32            | size              |
> u64            | ts_nsec           |
> u32            | level             |
> u32            | facility          |
> u32            | msg_off           |
> u8[n]          | type              |
> u8[m]          | msg               |
>                +-------------------+

It seems inconsistent that log_header.size and log_msg.size cover only
the respective struct itself while log_buffer.size also covers all
subordinate messages. Skipping all .size in this version fixes that.

And log_msg.size is not very useful since both .type and .msg have variable
length; it's not possible to access .msg without scanning .type. Please at
a minimum add .type_size but better yet replace .size with .type_size and
=2Emsg_size.


> There is still the outstanding issue of how the logs will be sent to the =
OS. If
> UEFI is used, we can use config tables. If ACPI or Device Tree is used, w=
e can
> use bf_log_header.next_bflh_addr to present the logs. If none of these pl=
atforms
> are used, it becomes a lot trickier to solve this issue.
>=20
> Any suggestions are much appreciated and will be taken into consideration.

Having bf_log_header.magic and some bf_log_header.$checksum, a strict rule
for bf_log_header start address granularity and a strict maximum offset
for the first header from top and/or bottom of memory allows to quickly
discover a log in memory without explicit handover.


> LPC System Boot and Security Micro-conference on the 22nd of September
> at 7:50 AM PDT (14:50 UTC).

Have fun! :)


Heinrich Schuchardt wrote:
> We already the EFI_TCG2_PROTOCOL and RFC 5424 (The syslog protocol).
> Why do we need to start from scratch?

That's a good question. I guess noone wants to settle for a standard
=66rom somewhere else. ;)

I wouldn't mind if log_msg was a syslog transport, but I can understand
if that's rejected because syslog messages require a lot of parsing for
presentation while Alec's proposal seems focused on efficiency and simplici=
ty.

It's also nice to be able to strictly mandate UTF-8 for all fields.
(RFC 5424 allows MSG to be anything.)


Kind regards

//Peter

