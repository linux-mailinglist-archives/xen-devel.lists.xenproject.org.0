Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0D35C7AC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 15:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109094.208231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwdy-0000Ae-25; Mon, 12 Apr 2021 13:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109094.208231; Mon, 12 Apr 2021 13:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwdx-00009u-Tl; Mon, 12 Apr 2021 13:30:21 +0000
Received: by outflank-mailman (input) for mailman id 109094;
 Mon, 12 Apr 2021 13:30:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvXO=JJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lVwdv-0008Sj-Ih
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 13:30:19 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58a5058b-be7c-4495-acf5-6ea5e8e5f6b3;
 Mon, 12 Apr 2021 13:30:11 +0000 (UTC)
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
X-Inumbo-ID: 58a5058b-be7c-4495-acf5-6ea5e8e5f6b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618234210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bhExrpoXQzqyeVVfKYNOFCo9TmJMG2rk9lhz1ih9ZWg=;
  b=RpfGpQM6So25pEONRH/0HnSCbSSFEKybK85OtPcTGDbl11Fd7Q8R+8Gx
   TCPZLB/Ekb1BGnz96fLtuZKWlEvvbJSksRc043enIMYkMoVW0Up5r2sZE
   0isJ2ZxpBCOhvF1T3IbwaaOxFc1WsJWw6vmtv65sfuhJIRoxhytkgohQO
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lMnJf0wiMDJsUzqBXizAog3gsw6ICUWa8Us3G0VNSDotNoe4NYIDpspzcIPEFqXCSRqjgBQG3P
 rHB6iQTRrNZ3sM1xKhXM325+gAZMFNJnr+js2jCHnCA1rAtHSTGghYZAvdZFR4l4rg4r7pMDJI
 XJ3kRuQEPKXUog9XJ7BJ3+ZNyig2i+gD88h6wZbI75tDPqjsfutRhvkhkHPzGY8rBQ831ZRRG1
 3L5cy+aLDYBuj2qwrTuGGB+o/cllGBm4TZFap5Id+GuN0BF/Azxtm1uHmJ90e9wIXNm+Z6AoKW
 KeI=
X-SBRS: 4.0
X-MesageID: 41386141
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zGM11qPp4RoTocBcTkKjsMiAIKoaSvp033AA/SlKJiB9WMqeis
 yogbAnzhfykjkcQzUNntqHNamGTxrnhPlIyKMWOqqvWxSjhXuwIOhZnPLf6hDpBiGWzI9g/I
 h6dawWMrDNJHh8yf33+QypV+snqeP3kpyAocf74zNTQRpxa6dmhj0JbjqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsNIL+jubGm578bRkNCwRP0njqsRqS5KPnCB/d5x8CUlp0sNEf2F
 LYmA/07LjLiZ+G4yLbvlW+071m3P/oyt5OH6W3+6soFgk=
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41386141"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: Laszlo Ersek <lersek@redhat.com>, Jordan Justen
	<jordan.l.justen@intel.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>, Michael D Kinney <michael.d.kinney@intel.com>,
	Liming Gao <gaoliming@byosoft.com.cn>, Zhiguang Liu <zhiguang.liu@intel.com>,
	Liming Gao <liming.gao@intel.com>
Subject: [PATCH v3 2/7] MdePkg: Allow PcdFSBClock to by Dynamic
Date: Mon, 12 Apr 2021 14:29:58 +0100
Message-ID: <20210412133003.146438-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412133003.146438-1-anthony.perard@citrix.com>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2hhbmdlIHRoZSB2YWx1ZSBvZiBQY2RGU0JDbG9jayBh
dCBydW4gdGltZSBpbgpPdm1mWGVuLCBzbyBtb3ZlIGl0IHRvIHRoZSBQY2RzRHluYW1pYyBzZWN0
aW9uLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lk
PTI0OTAKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpSZXZp
ZXdlZC1ieTogTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Ci0tLQoKTm90ZXM6CiAg
ICBDQzogTWljaGFlbCBEIEtpbm5leSA8bWljaGFlbC5kLmtpbm5leUBpbnRlbC5jb20+CiAgICBD
QzogTGltaW5nIEdhbyA8Z2FvbGltaW5nQGJ5b3NvZnQuY29tLmNuPgogICAgQ0M6IFpoaWd1YW5n
IExpdSA8emhpZ3VhbmcubGl1QGludGVsLmNvbT4KCiBNZGVQa2cvTWRlUGtnLmRlYyB8IDggKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvTWRlUGtnL01kZVBrZy5kZWMgYi9NZGVQa2cvTWRlUGtnLmRlYwppbmRleCBm
NDE1NjkyMGU1OTkuLjg5NjVlOTAzZTA5MyAxMDA2NDQKLS0tIGEvTWRlUGtnL01kZVBrZy5kZWMK
KysrIGIvTWRlUGtnL01kZVBrZy5kZWMKQEAgLTIyNjUsMTAgKzIyNjUsNiBAQCBbUGNkc0ZpeGVk
QXRCdWlsZCxQY2RzUGF0Y2hhYmxlSW5Nb2R1bGVdCiAgICMgQFZhbGlkTGlzdCAgMHg4MDAwMDAw
MSB8IDgsIDE2LCAzMg0KICAgZ0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZFBvcnQ4MERhdGFX
aWR0aHw4fFVJTlQ4fDB4MDAwMDAwMmQNCiANCi0gICMjIFRoaXMgdmFsdWUgaXMgdXNlZCB0byBj
b25maWd1cmUgWDg2IFByb2Nlc3NvciBGU0IgY2xvY2suDQotICAjIEBQcm9tcHQgRlNCIENsb2Nr
Lg0KLSAgZ0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZEZTQkNsb2NrfDIwMDAwMDAwMHxVSU5U
MzJ8MHgwMDAwMDAwYw0KLQ0KICAgIyMgVGhlIG1heGltdW0gcHJpbnRhYmxlIG51bWJlciBvZiBj
aGFyYWN0ZXJzLiBVZWZMaWIgZnVuY3Rpb25zOiBBc2NpaVByaW50KCksIEFzY2lpRXJyb3JQcmlu
dCgpLA0KICAgIyAgUHJpbnRYWSgpLCBBc2NpaVByaW50WFkoKSwgUHJpbnQoKSwgRXJyb3JQcmlu
dCgpIGJhc2Ugb24gdGhpcyBQQ0QgdmFsdWUgdG8gcHJpbnQgY2hhcmFjdGVycy4NCiAgICMgQFBy
b21wdCBNYXhpbXVtIFByaW50YWJsZSBOdW1iZXIgb2YgQ2hhcmFjdGVycy4NCkBAIC0yMzcyLDUg
KzIzNjgsOSBAQCBbUGNkc0ZpeGVkQXRCdWlsZCwgUGNkc1BhdGNoYWJsZUluTW9kdWxlLCBQY2Rz
RHluYW1pYywgUGNkc0R5bmFtaWNFeF0KICAgIyBAUHJvbXB0IEJvb3QgVGltZW91dCAocykNCiAg
IGdFZmlNZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RQbGF0Zm9ybUJvb3RUaW1lT3V0fDB4ZmZmZnxV
SU5UMTZ8MHgwMDAwMDAyYw0KIA0KKyAgIyMgVGhpcyB2YWx1ZSBpcyB1c2VkIHRvIGNvbmZpZ3Vy
ZSBYODYgUHJvY2Vzc29yIEZTQiBjbG9jay4NCisgICMgQFByb21wdCBGU0IgQ2xvY2suDQorICBn
RWZpTWRlUGtnVG9rZW5TcGFjZUd1aWQuUGNkRlNCQ2xvY2t8MjAwMDAwMDAwfFVJTlQzMnwweDAw
MDAwMDBjDQorDQogW1VzZXJFeHRlbnNpb25zLlRpYW5vQ29yZS4iRXh0cmFGaWxlcyJdDQogICBN
ZGVQa2dFeHRyYS51bmkNCi0tIApBbnRob255IFBFUkFSRAoK

