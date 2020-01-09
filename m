Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F5135424
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 09:13:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipSsY-0004zY-1y; Thu, 09 Jan 2020 08:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BCbV=26=neclab.eu=felipe.huici@srs-us1.protection.inumbo.net>)
 id 1ipSsW-0004zT-16
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 08:09:16 +0000
X-Inumbo-ID: 4a5122f8-32b7-11ea-8599-bc764e2007e4
Received: from mailer1.neclab.eu (unknown [195.37.70.40])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a5122f8-32b7-11ea-8599-bc764e2007e4;
 Thu, 09 Jan 2020 08:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mailer1.neclab.eu (Postfix) with ESMTP id 3A80C1039F8;
 Thu,  9 Jan 2020 09:08:59 +0100 (CET)
X-Virus-Scanned: Amavisd on Debian GNU/Linux (atlas-a.office.hd)
Received: from mailer1.neclab.eu ([127.0.0.1])
 by localhost (atlas-a.office.hd [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbSa85FcbKto; Thu,  9 Jan 2020 09:08:59 +0100 (CET)
X-ENC: Last-Hop-TLS-encrypted
X-ENC: Last-Hop-TLS-encrypted
Received: from puck.office.hd (puck.office.hd [192.168.24.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailer1.neclab.eu (Postfix) with ESMTPS id 0EFA2FFB3E;
 Thu,  9 Jan 2020 09:08:59 +0100 (CET)
Received: from oberon.office.hd (192.168.24.90) by puck.office.hd
 (192.168.24.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 Jan 2020
 09:08:58 +0100
Received: from oberon.office.hd ([192.168.126.11]) by Oberon.office.hd
 ([192.168.126.11]) with mapi id 15.01.1713.009; Thu, 9 Jan 2020 09:08:58
 +0100
From: Felipe Huici <Felipe.Huici@neclab.eu>
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, "minios-devel@lists.xenproject.org"
 <minios-devel@lists.xenproject.org>
Thread-Topic: [Minios-devel] Updating
 https://wiki.xenproject.org/wiki/Outreach_Program_Projects
Thread-Index: AQHVxsQLBt/M0WpXcke0PWUWPyd9tg==
Date: Thu, 9 Jan 2020 08:08:58 +0000
Message-ID: <9ECE2B01-ABB0-478F-A308-549DC6C598B3@neclab.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-originating-ip: [192.168.24.96]
Content-ID: <101BF6F8643A414B87A2026DC10F5993@office.hd>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Minios-devel] Updating
 https://wiki.xenproject.org/wiki/Outreach_Program_Projects
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Anthony
 Perard <anthony.perard@citrix.com>, Simon Kuenzer <simon.kuenzer@neclab.eu>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywgSSd2ZSBqdXN0IHVwZGF0ZWQgdGhlIGxpc3QsIHBsZWFzZSBsZXQgbWUga25vdyBp
ZiB5b3UgaGF2ZSBhbnkgY29tbWVudHMuDQoNCi0tIEZlbGlwZQ0KDQo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCkRyLiBGZWxpcGUg
SHVpY2kNCkNoaWVmIFJlc2VhcmNoZXIsIFN5c3RlbXMgYW5kIE1hY2hpbmUgTGVhcm5pbmcgR3Jv
dXANCk5FQyBMYWJvcmF0b3JpZXMgRXVyb3BlIEdtYkgNCkt1cmZ1ZXJzdGVuYW5sYWdlIDM2LCBE
LTY5MTE1IEhlaWRlbGJlcmcNClRlbC4gICs0OQ0KKDApNjIyMSA0MzQyLTI0MQ0KRmF4OiAgKzQ5
DQooMCk2MjIxIDQzNDItMTU1DQogDQplLW1haWw6DQpmZWxpcGUuaHVpY2lAbmVjbGFiLmV1DQo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NClJlZ2lzdGVyZWQgYXQgQW10c2dlcmljaHQgTWFubmhlaW0sIEdlcm1hbnksIEhSQjcyODU1
OA0KDQrvu79PbiAwOC4wMS4yMCwgMTg6NDYsICJNaW5pb3MtZGV2ZWwgb24gYmVoYWxmIG9mIExh
cnMgS3VydGgiIDxtaW5pb3MtZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZyBvbiBi
ZWhhbGYgb2YgbGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCg0KICAgIEhpIGFsbCwNCiAg
ICANCiAgICB0aGUgZGVhZGxpbmUgZm9yIEdTb0MgbWVudG9yaW5nIG9yZ3MgaXMgYXBwcm9hY2hp
bmcgYWdhaW4gYW5kIEkgdGhpbmsgdGhlcmUgaXMgYSBnb29kIGNoYW5jZSB3ZSBtaWdodCBnZXQg
aW4gKHVzdWFsbHkgd2UgZ2V0IGluIGV2ZXJ5IDMgeWVhcnMgYW5kIHRoZSBsYXN0IHRpbWUgd2Ug
Z290IGluIGluIDIwMjApLiBXZSBkbyBob3dldmVyIG5lZWQgdG8gZ2V0IGh0dHBzOi8vd2lraS54
ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMgaW50byBhIGRlY2Vu
dCBzdGF0ZSBQUklPUiB0byB0aGUgYXBwbGljYXRpb24gZGVhZGxpbmUgYXJvdW5kIEZlYiA1dGgN
CiAgICANCiAgICBBbmQgdGhpcyB5ZWFyIHRoZSBsaXN0IGlzIHBvdGVudGlhbGx5IGluIGEgd29y
c2UgdGhhbiBpbiBpdHMgdXN1YWwgc3RhdGUgYXQgbGVhc3QgaW4gdGVybXMgb2YgZS1tYWlsIGFk
ZHJlc3NlcyB0aGF0IG1heSBiZSB3cm9uZywgZXRjLiANCiAgICANCiAgICBUbyBtYWtlIHRoaW5n
cyBhIGxpdHRsZSBlYXNpZXIgbG9vayBvdXQgZm9yIHlvdXIgbmFtZSBiZWxvdw0KICAgIA0KICAg
IEBHZW9yZ2U6IGlzIHRoZSBwcm9qZWN0IGJlbG93IHN0aWxsIGFwcGxpY2FibGUgLSBJIHNhdyBx
dWl0ZSBhIGxvdCBvZiBhY3Rpdml0eSBhcm91bmQgdGhpcyBpbmRpY2F0aW5nIHRoYXQgbWF5YmUg
dGhlIHByb2plY3QgaXMgZG9uZSBvciBzaG91bGQgYmUgY2hhbmdlZA0KICAgIGh0dHBzOi8vd2lr
aS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjZ29sYW5nX2Jp
bmRpbmdzX2Zvcl9saWJ4bA0KICAgIEBHZW9yZ2U6IGFub3RoZXIgb25lIGFnYWluc3QgeW91DQog
ICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9q
ZWN0cyNBZGRfQ2VudG9zX1ZpcnRfU0lHX1hlbl9wYWNrYWdlc190ZXN0X3RvX3RoZV9DZW50T1Nf
Q0lfbG9vcA0KICAgIA0KICAgIEBQYXVsOiBUaGlzIGlzIGFnYWluc3QgeW91ciBDaXRyaXggYWRk
cmVzcyAtIHdvdWxkIHlvdSBzdGlsbCBzdXBwb3J0IHRoaXMgcHJvamVjdCBmcm9tIHdpdGhpbiBB
V1MuIFRoZXJlIHdhcyBhbHNvIHNvbWUgd29yayBmcm9tIHBvc3RncmFkcyBhcyBmYXIgYXMgSSBy
ZWNhbGwNCiAgICBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9n
cmFtX1Byb2plY3RzI0tERF8uMjhXaW5kb3dzX0RlYnVnZ2VyX1N0dWIuMjlfZW5oYW5jZW1lbnRz
IA0KICAgIA0KICAgIEBTdGVmYW5vLCBASnVsaWVuOiB0aGUgNSBwcm9qZWN0cyBiZWxvdyBhcmUg
YWdhaW5zdCB5b3UgLSBhcmUgdGhlc2Ugc3RpbGwgdmFsaWQ/DQogICAgQEp1bGllbjogdGhlc2Ug
YXJlIGFnYWluc3QgeW91ciBBcm0gYWRkcmVzcw0KICAgIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0
Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjWGVuX0h5cGVydmlzb3INCiAgICAt
IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVj
dHMjWGVuX29uX0FSTTpfVHJhcF8uMjZfc2FuaXRpemVfSURfcmVnaXN0ZXJzXy4yOElEX1BGUjAu
MkNfSURfREZSMC4yQ19ldGMuMjkNCiAgICAtIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93
aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjWGVuX29uX0FSTS4yQ19kb20wbGVzczpfY29u
ZmlndXJhYmxlX21lbW9yeV9sYXlvdXRfZm9yX2d1ZXN0cw0KICAgIC0gaHR0cHM6Ly93aWtpLnhl
bnByb2plY3Qub3JnL3dpa2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNBUk12OC4xX2F0b21p
Y3MNCiAgICAtIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dy
YW1fUHJvamVjdHMjWGVuX29uX0FSTTpfZHluYW1pY192aXJ0dWFsX21lbW9yeV9sYXlvdXQNCiAg
ICAtIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJv
amVjdHMjWGVuX29uX0FSTTpfUGVyZm9ybWFuY2VfQ291bnRlcnNfVmlydHVhbGl6YXRpb24NCiAg
ICANCiAgICBAU2ltb24sIEBGZWxpcGU6IHRoZSA0IHByb2plY3RzIGJlbG93IGFyZSBhZ2FpbnN0
IHlvdSAtIGFyZSB0aGVzZSBzdGlsbCB2YWxpZD8gT3IgaGF2ZSB0aGV5IGJlZW4gaW1wbGVtZW50
ZWQ/DQogICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvT3V0cmVhY2hfUHJvZ3Jh
bV9Qcm9qZWN0cyNVbmlrcmFmdA0KICAgIC0gaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dp
a2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNOZXdfUGxhdGZvcm1fU3VwcG9ydA0KICAgIC0g
aHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0
cyNGcmVlQlNELjI3c19OZXR3b3JrX1N0YWNrX1BvcnQNCiAgICAtIGh0dHBzOi8vd2lraS54ZW5w
cm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjR29fTGFuZ3VhZ2VfU3Vw
cG9ydA0KICAgIC0gaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvT3V0cmVhY2hfUHJv
Z3JhbV9Qcm9qZWN0cyNFbmhhbmNlZF9Qcm9maWxpbmdfYW5kX1RyYWNpbmdfU3VwcG9ydA0KICAg
IA0KICAgIEBSb2dlcjogaXMgdGhpcyBzdGlsbCB2YWxpZD8NCiAgICBodHRwczovL3dpa2kueGVu
cHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9ncmFtX1Byb2plY3RzI0FkZF9tb3JlX0ZyZWVC
U0RfdGVzdGluZ190b19vc3N0ZXN0DQogICAgDQogICAgUmVnYXJkcw0KICAgIExhcnMNCiAgICAN
CiAgICANCiAgICANCiAgICBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KICAgIE1pbmlvcy1kZXZlbCBtYWlsaW5nIGxpc3QNCiAgICBNaW5pb3MtZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCiAgICBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vbWluaW9zLWRldmVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
