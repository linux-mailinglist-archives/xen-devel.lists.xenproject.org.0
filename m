Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C731349C5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:49:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFPm-0005rI-7B; Wed, 08 Jan 2020 17:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RL5r=25=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ipFPk-0005rA-H2
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:46:40 +0000
X-Inumbo-ID: cea5320d-323e-11ea-b868-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cea5320d-323e-11ea-b868-12813bfff9fa;
 Wed, 08 Jan 2020 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578505594;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=ZUPOQz2Tzoa+8cVsyRWTBFnu1TtCJajvAdYhI8fwyZc=;
 b=PwoY0fd3AHGjyAB3gY8PPOn+6Irnx+coNST4qqNh55xljWpNIgczB9AP
 xj5SXxbe/ZS0zVYmya8yfIQI05nZv8Vkf8IauqS56dvukfemEBW7UbAGM
 qlBA0U7uJEKA6dpS2ezFuPz65mDyTjyFpOL0+yi286KvFA89+YDLVrb48 o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KefRyjyTC5PYY9bUc9zAVJZLHcw5cIg9Dyf+U6wTeHMGQys3tGmQJ2WFPHGrviRh9sKqjztEWF
 Xkm4pSyPPo1YFn+GhOJu6IxwKRjC6cSGdJYT9vBYtKzIcB0g/KN5+2sZeMGRXz1QoFfuNdogFQ
 VMkeR5e/nA4s9VlpaGuBW9znppUsAX4BttJ/HSwIy1rtDamlZSLunOk4TuWE2EXnKOHXGCrm45
 nFwb9bkldakxw8Gkd2KPHdyDOEVdQRzzvrys4g5w/IHaCHzJfHVTjuj4lDWLnKVDfd8KdrFRm7
 AHg=
X-SBRS: 2.7
X-MesageID: 10627672
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10627672"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>
Thread-Topic: Updating
 https://wiki.xenproject.org/wiki/Outreach_Program_Projects
Thread-Index: AQHVxkuOHjkEkxzNlE2hJeyXl8QgQA==
Date: Wed, 8 Jan 2020 17:46:29 +0000
Message-ID: <2BEABB31-EC08-4E37-A1CE-A26743837A87@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <9880B8F573B5944F842B8C069870F4C9@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Updating
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
Cc: Felipe Huici <felipe.huici@neclab.eu>, Stefano
 Stabellini <sstabellini@kernel.org>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQp0aGUgZGVhZGxpbmUgZm9yIEdTb0MgbWVudG9yaW5nIG9yZ3MgaXMgYXBwcm9h
Y2hpbmcgYWdhaW4gYW5kIEkgdGhpbmsgdGhlcmUgaXMgYSBnb29kIGNoYW5jZSB3ZSBtaWdodCBn
ZXQgaW4gKHVzdWFsbHkgd2UgZ2V0IGluIGV2ZXJ5IDMgeWVhcnMgYW5kIHRoZSBsYXN0IHRpbWUg
d2UgZ290IGluIGluIDIwMjApLiBXZSBkbyBob3dldmVyIG5lZWQgdG8gZ2V0IGh0dHBzOi8vd2lr
aS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMgaW50byBhIGRl
Y2VudCBzdGF0ZSBQUklPUiB0byB0aGUgYXBwbGljYXRpb24gZGVhZGxpbmUgYXJvdW5kIEZlYiA1
dGgNCg0KQW5kIHRoaXMgeWVhciB0aGUgbGlzdCBpcyBwb3RlbnRpYWxseSBpbiBhIHdvcnNlIHRo
YW4gaW4gaXRzIHVzdWFsIHN0YXRlIGF0IGxlYXN0IGluIHRlcm1zIG9mIGUtbWFpbCBhZGRyZXNz
ZXMgdGhhdCBtYXkgYmUgd3JvbmcsIGV0Yy4gDQoNClRvIG1ha2UgdGhpbmdzIGEgbGl0dGxlIGVh
c2llciBsb29rIG91dCBmb3IgeW91ciBuYW1lIGJlbG93DQoNCkBHZW9yZ2U6IGlzIHRoZSBwcm9q
ZWN0IGJlbG93IHN0aWxsIGFwcGxpY2FibGUgLSBJIHNhdyBxdWl0ZSBhIGxvdCBvZiBhY3Rpdml0
eSBhcm91bmQgdGhpcyBpbmRpY2F0aW5nIHRoYXQgbWF5YmUgdGhlIHByb2plY3QgaXMgZG9uZSBv
ciBzaG91bGQgYmUgY2hhbmdlZA0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvT3V0
cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNnb2xhbmdfYmluZGluZ3NfZm9yX2xpYnhsDQpAR2Vvcmdl
OiBhbm90aGVyIG9uZSBhZ2FpbnN0IHlvdQ0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dp
a2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNBZGRfQ2VudG9zX1ZpcnRfU0lHX1hlbl9wYWNr
YWdlc190ZXN0X3RvX3RoZV9DZW50T1NfQ0lfbG9vcA0KDQpAUGF1bDogVGhpcyBpcyBhZ2FpbnN0
IHlvdXIgQ2l0cml4IGFkZHJlc3MgLSB3b3VsZCB5b3Ugc3RpbGwgc3VwcG9ydCB0aGlzIHByb2pl
Y3QgZnJvbSB3aXRoaW4gQVdTLiBUaGVyZSB3YXMgYWxzbyBzb21lIHdvcmsgZnJvbSBwb3N0Z3Jh
ZHMgYXMgZmFyIGFzIEkgcmVjYWxsDQpodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9P
dXRyZWFjaF9Qcm9ncmFtX1Byb2plY3RzI0tERF8uMjhXaW5kb3dzX0RlYnVnZ2VyX1N0dWIuMjlf
ZW5oYW5jZW1lbnRzIA0KDQpAU3RlZmFubywgQEp1bGllbjogdGhlIDUgcHJvamVjdHMgYmVsb3cg
YXJlIGFnYWluc3QgeW91IC0gYXJlIHRoZXNlIHN0aWxsIHZhbGlkPw0KQEp1bGllbjogdGhlc2Ug
YXJlIGFnYWluc3QgeW91ciBBcm0gYWRkcmVzcw0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNYZW5fSHlwZXJ2aXNvcg0KLSBodHRwczov
L3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9ncmFtX1Byb2plY3RzI1hlbl9v
bl9BUk06X1RyYXBfLjI2X3Nhbml0aXplX0lEX3JlZ2lzdGVyc18uMjhJRF9QRlIwLjJDX0lEX0RG
UjAuMkNfZXRjLjI5DQotIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNo
X1Byb2dyYW1fUHJvamVjdHMjWGVuX29uX0FSTS4yQ19kb20wbGVzczpfY29uZmlndXJhYmxlX21l
bW9yeV9sYXlvdXRfZm9yX2d1ZXN0cw0KLSBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lr
aS9PdXRyZWFjaF9Qcm9ncmFtX1Byb2plY3RzI0FSTXY4LjFfYXRvbWljcw0KLSBodHRwczovL3dp
a2kueGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9ncmFtX1Byb2plY3RzI1hlbl9vbl9B
Uk06X2R5bmFtaWNfdmlydHVhbF9tZW1vcnlfbGF5b3V0DQotIGh0dHBzOi8vd2lraS54ZW5wcm9q
ZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjWGVuX29uX0FSTTpfUGVyZm9y
bWFuY2VfQ291bnRlcnNfVmlydHVhbGl6YXRpb24NCg0KQFNpbW9uLCBARmVsaXBlOiB0aGUgNCBw
cm9qZWN0cyBiZWxvdyBhcmUgYWdhaW5zdCB5b3UgLSBhcmUgdGhlc2Ugc3RpbGwgdmFsaWQ/IE9y
IGhhdmUgdGhleSBiZWVuIGltcGxlbWVudGVkPw0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNVbmlrcmFmdA0KLSBodHRwczovL3dpa2ku
eGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFjaF9Qcm9ncmFtX1Byb2plY3RzI05ld19QbGF0Zm9y
bV9TdXBwb3J0DQotIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1By
b2dyYW1fUHJvamVjdHMjRnJlZUJTRC4yN3NfTmV0d29ya19TdGFja19Qb3J0DQotIGh0dHBzOi8v
d2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjR29fTGFu
Z3VhZ2VfU3VwcG9ydA0KLSBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9PdXRyZWFj
aF9Qcm9ncmFtX1Byb2plY3RzI0VuaGFuY2VkX1Byb2ZpbGluZ19hbmRfVHJhY2luZ19TdXBwb3J0
DQoNCkBSb2dlcjogaXMgdGhpcyBzdGlsbCB2YWxpZD8NCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0
Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjQWRkX21vcmVfRnJlZUJTRF90ZXN0
aW5nX3RvX29zc3Rlc3QNCg0KUmVnYXJkcw0KTGFycw0KDQoNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
