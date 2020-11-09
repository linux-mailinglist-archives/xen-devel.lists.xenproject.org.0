Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4512ABEF0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 15:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22602.48981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc8Ma-0006u8-H4; Mon, 09 Nov 2020 14:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22602.48981; Mon, 09 Nov 2020 14:41:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc8Ma-0006t5-E1; Mon, 09 Nov 2020 14:41:44 +0000
Received: by outflank-mailman (input) for mailman id 22602;
 Mon, 09 Nov 2020 14:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Ks2=EP=sec.uni-passau.de=hr@srs-us1.protection.inumbo.net>)
 id 1kc8Le-0006r3-JJ
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 14:40:46 +0000
Received: from tom.rz.uni-passau.de (unknown [132.231.51.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 951758a5-3521-4c70-95e7-72cfc1d99a91;
 Mon, 09 Nov 2020 14:40:43 +0000 (UTC)
Received: from puremessage.rz.uni-passau.de (puremessage.rz.uni-passau.de
 [132.231.51.54])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 0657311A6EBCC
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 15:40:42 +0100 (CET)
Received: from puremessage.rz.uni-passau.de (localhost.localdomain [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id E328010709E_FA954E9B
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 14:40:41 +0000 (GMT)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by puremessage.rz.uni-passau.de (Sophos Email Appliance) with ESMTPS id
 DA9A61047DC_FA954E9F
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 14:40:41 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id D4D9B11A6EBC8
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 15:40:41 +0100 (CET)
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.15.1)
 (envelope-from <hr@sec.uni-passau.de>)
 id 5fa954e3-53de-84e733040019-84e70b0d91fc-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 15:40:41 +0100
Received: from smith.sec.uni-passau.de (132.231.11.13) by
 smith.sec.uni-passau.de (132.231.11.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 15:36:12 +0100
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.007; Mon, 9 Nov 2020 15:36:12 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7Ks2=EP=sec.uni-passau.de=hr@srs-us1.protection.inumbo.net>)
	id 1kc8Le-0006r3-JJ
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 14:40:46 +0000
X-Inumbo-ID: 951758a5-3521-4c70-95e7-72cfc1d99a91
Received: from tom.rz.uni-passau.de (unknown [132.231.51.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 951758a5-3521-4c70-95e7-72cfc1d99a91;
	Mon, 09 Nov 2020 14:40:43 +0000 (UTC)
Received: from puremessage.rz.uni-passau.de (puremessage.rz.uni-passau.de [132.231.51.54])
	by tom.rz.uni-passau.de (Postfix) with ESMTP id 0657311A6EBCC
	for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 15:40:42 +0100 (CET)
Received: from puremessage.rz.uni-passau.de (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id E328010709E_FA954E9B
	for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 14:40:41 +0000 (GMT)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by puremessage.rz.uni-passau.de (Sophos Email Appliance) with ESMTPS id DA9A61047DC_FA954E9F
	for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 14:40:41 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by tom.rz.uni-passau.de (Postfix) with ESMTP id D4D9B11A6EBC8
	for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2020 15:40:41 +0100 (CET)
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
	by mail.uni-passau.de with ESMTPS (eXpurgate 4.15.1)
	(envelope-from <hr@sec.uni-passau.de>)
	id 5fa954e3-53de-84e733040019-84e70b0d91fc-3
	for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 15:40:41 +0100
Received: from smith.sec.uni-passau.de (132.231.11.13) by
 smith.sec.uni-passau.de (132.231.11.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 15:36:12 +0100
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.007; Mon, 9 Nov 2020 15:36:12 +0100
From: "Reiser, Hans" <hr@sec.uni-passau.de>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: infinite loop in xenstat_qmp.c
Thread-Topic: infinite loop in xenstat_qmp.c
Thread-Index: AQHWtqWrP5ss4mCWiE+RSioLt66eLw==
Date: Mon, 9 Nov 2020 14:36:11 +0000
Message-ID: <9E9AC979-4A93-4527-B36C-BA96EEF190D1@sec.uni-passau.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [178.27.71.78]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2F081905460E1242B1244DC38F45A0B9@sec.uni-passau.de>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-purgate-ID: 151291::1604932841-000053DE-A95F8489/0/0
X-purgate-type: clean
X-purgate-size: 1483
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

Hi,

I have seen several occasions with "dead" xentop processes consuming 100% C=
PU time, and tracked this down
to the following problem:

When the QEMU process the qmp_read function is communicating with terminate=
s, qmp_read may enter an
infinite loop:  poll signals EOF (POLLIN and POLLHUP set), the subsequent r=
ead() call returns 0, and then the
function calls poll again, which still sees the EOF condition and will retu=
rn again immediately with POLLIN and
POLLHUP set, repeating ad infinitum.

A simple fix is to terminate the loop when read returns 0 (under "normal" i=
nstances, poll will return with POLLIN
set only if there is data to read, so read will always read >0 bytes, excep=
t if the socket has been closed).

Cheers, Hans

diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/xenstat/lib=
xenstat/src/xenstat_qmp.c
index 19b236e7b6..0c5748ba68 100644
--- a/tools/xenstat/libxenstat/src/xenstat_qmp.c
+++ b/tools/xenstat/libxenstat/src/xenstat_qmp.c
@@ -298,7 +298,7 @@ static int qmp_read(int qfd, unsigned char **qstats)
        pfd[0].events =3D POLLIN;
        while ((n =3D poll(pfd, 1, 10)) > 0) {
                if (pfd[0].revents & POLLIN) {
-                       if ((n =3D read(qfd, buf, sizeof(buf))) < 0) {
+                       if ((n =3D read(qfd, buf, sizeof(buf))) <=3D 0) {
                                free(*qstats);
                                return 0;
                        }


