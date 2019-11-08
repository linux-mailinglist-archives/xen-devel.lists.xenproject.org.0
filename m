Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EDF4284
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 09:47:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSzti-0003SI-1p; Fri, 08 Nov 2019 08:45:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6MgQ=ZA=amazon.com=prvs=20800e630=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iSztg-0003RY-A2
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 08:45:36 +0000
X-Inumbo-ID: 217fe078-0204-11ea-a1d2-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 217fe078-0204-11ea-a1d2-12813bfff9fa;
 Fri, 08 Nov 2019 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573202737; x=1604738737; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=quM+YupXETv0bdZ65pWR2aFAiaAvEa5faRTt4ihaaEQ=;
 b=lLwI38+RSHer6KC1+a3BzwyXwpPJbeKGp3kpe3nWkJrUScgvBh4XynnH
 3+gq73ongjfwBqm5YEu5WAkLLqZqPRCanzgRmxkYNng7z6PLs9+ZRxQTQ
 ToXEGnkYyqIhS3VfDbjabiXQEBBLaPPXYTrcCT9wQDSMmp1JNWihNYLQL g=;
IronPort-SDR: Jybw+YyU12fzFjcwWRZau44TcEP5VtD0e6J7fkzsgxgjDMiyNSh53qHizL0dMclcgv2fEtunDK
 ZtQiZolT9azw==
X-IronPort-AV: E=Sophos;i="5.68,280,1569283200"; 
   d="scan'208";a="5143155"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 08 Nov 2019 08:45:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7BD91A2F77
 for <xen-devel@lists.xenproject.org>; Fri,  8 Nov 2019 08:45:31 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 08:45:30 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 08:45:30 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 8 Nov 2019 08:45:30 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: max_grant_frames/max_maptrack_frames
Thread-Index: AdWVkZiKYOkzy9UFQkGz/45sYHi0dw==
Date: Fri, 8 Nov 2019 08:45:29 +0000
Message-ID: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.198]
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] max_grant_frames/max_maptrack_frames
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGlja2luZyB1cCB0aGUgZGlzY3Vzc2lvbiBmcm9tIElSQyB0byBtYWtlIGl0IG1vcmUgd2lkZWx5
IHZpc2libGUuLi4KCldoZW4gcGVyLWRvbWFpbiBvcHRpb25zIGZvciBtYXhpbXVtIGdyYW50IGFu
ZCBtYXB0cmFjayBmcmFtZXMgY2FtZSBpbiAoaW4gNC4xMD8pIFhlbidzIGJlaGF2aW91ciB3LnIu
dC4gdG8gdGhlIGdsb2JhbCBjb21tYW5kIGxpbmUgdmFsdWVzIChnbnR0YWJfbWF4X2ZyYW1lcyBh
bmQgZ250dGFiX21heF9tYXB0cmFja19mcmFtZXMgcmVzcGVjdGl2ZWx5KSByZWdyZXNzZWQKCkZv
ciBleGFtcGxlLCBhIGhvc3QgcnVubmluZyBhIHByaW9yIHZlcnNpb24gb2YgWGVuIHdpdGggYSBj
b21tYW5kIGxpbmUgc2V0dGluZyBnbnR0YWJfbWF4X2ZyYW1lcz0xMjggd291bGQgaGF2ZSBhbGwg
b2YgaXRzIGRvbVVzIHJ1bm5pbmcgd2l0aCAxMjggZnJhbWVzLiBIb3dldmVyLCBhZnRlciB1cGRh
dGUgdG8gYSBuZXdlciBYZW4sIHRoZXkgd2lsbCBvbmx5IGdldCAzMiBmcmFtZXMgKHVubGVzcyB0
aGUgaG9zdCBpcyBwYXJ0aWN1bGFybHkgbGFyZ2UsIGluIHdoaWNoIGNhc2UgdGhleSB3aWxsIGdl
dCA2NCkuIFdoeSBpcyB0aGlzPyBJdCdzIGJlY2F1c2UgbmVpdGhlciB4bC5jZmcgZmlsZXMsIG5v
ciB4bC5jb25mLCB3aWxsIHNwZWNpZnkgdmFsdWVzIChiZWNhdXNlIHRoZSBzY2VuYXJpbyBpcyBh
biB1cGRhdGUgZnJvbSBhbiBvbGRlciBpbnN0YWxsYXRpb24pIGFuZCBzbyB0aGUgaGFyZGNvZGVk
IDMyLzY0IGRlZmF1bHQgYXBwbGllcy4gSGVuY2Ugc29tZSBkb21VcyB3aXRoIGxhcmdlIG51bWJl
cnMgb2YgUFYgZGV2aWNlcyBzdGFydCBmYWlsaW5nIChvciBhdCBsZWFzdCBzdWJzdGFudGlhbGx5
IHNsb3cgZG93bikgYW5kIGFkbWlucyBzdGFydCB3b25kZXJpbmcgd2hhdCdzIGdvaW5nIG9uLgoK
U28gaG93IGJlc3QgdG8gZml4IHRoaXM/CgpGb3IgdGhlIHNha2Ugb2YgYSBxdWljayBmaXggZm9y
IHRoZSByZWdyZXNzaW9uLCBhbmQgZWFzZSBvZiBiYWNrLXBvcnRpbmcsIEkgdGhpbmsgaXQgd291
bGQgYmUgYmVzdCB0byBhZGQgYSBjaGVjayBpbiBkb21haW5fY3JlYXRlKCkgYW5kIGNyZWF0ZSB0
aGUgZ3JhbnQgdGFibGUgd2l0aCBwYXJhbWV0ZXJzIHdoaWNoIGFyZSB0aGUgbGFyZ2VyIG9mIHRo
ZSB0b29sc3RhY2sgY29uZmlndXJlZCB2YWx1ZSBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgY29tbWFu
ZCBsaW5lIHZhbHVlLiBUaGlzIGRvZXMsIGhvd2V2ZXIsIGdvIGFnYWluc3QgdGhlIHJlY2VudCBk
aXJlY3Rpb24gb2YgdGhlIHRvb2xzdGFjayBnZXR0aW5nIGV4YWN0bHkgd2hhdCBpdCBhc2tlZCBm
b3IuIFNvIGZvciB0aGUgbG9uZ2VyIHRlcm0gSSBhbSB3b25kZXJpbmcgd2hldGhlciB0aGVyZSBv
dWdodCB0byBiZSBhIHdheSBmb3IgdGhlIHRvb2xzdGFjayB0byBxdWVyeSB0aGUgZ2xvYmFsbHkg
Y29uZmlndXJlZCBncmFudCB0YWJsZSBsaW1pdHMuIEEgR05UVEFCT1Agc2VlbXMgdGhlIHdyb25n
IGNhbmRpZGF0ZSBmb3IgdGhpcywgc2luY2UgR05UVEFCT1BzIGFyZSBwZXItZG9tYWluLCBzbyBJ
J20gd29uZGVyaW5nIGFib3V0IGEgbmV3IHN5c2N0bCB0byByZXR1cm4gdGhlIHZhbHVlIG9mIGEg
bmFtZWQgY29tbWFuZCBsaW5lIHBhcmFtZXRlci4KClRob3VnaHRzPwoKICBQYXVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
