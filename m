Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2616FB97
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:06:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6tXt-00014N-98; Wed, 26 Feb 2020 10:04:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6tXr-000147-1T
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:03:59 +0000
X-Inumbo-ID: 4e0dba80-587f-11ea-8fc3-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e0dba80-587f-11ea-8fc3-bc764e2007e4;
 Wed, 26 Feb 2020 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582711438; x=1614247438;
 h=from:to:cc:subject:date:message-id:mime-version:reply-to:
 content-transfer-encoding;
 bh=SoEjX4/WTw8kYYcpDM5QOwpLqvhoaDth9iFtWXfyrDI=;
 b=JftYBkjxiGUlWy7BidIFdlotW8BSgZfIl1QXGbqaeSvH3AD1+C23JV81
 g83F2stu4ek55t6fUtleYmdzKJ7NXid/vArDVY+psV06bIEj9+I2eUj8m
 owCHZ9sJkH6OIJAGtlrfQHUfV/0uRwRXxUFSrxTFchJ09PLjMFkipQ4N/ k=;
IronPort-SDR: nAXt9mzWF7MUNV546aRmqGzIJ/E2g1025JAI9u8ScmNG3u96x9ZXyHCZZPUlJtOHyqxzk1SwRi
 MwfMnJgjEYng==
X-IronPort-AV: E=Sophos;i="5.70,487,1574121600"; d="scan'208";a="27571290"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Feb 2020 10:03:56 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1A38BA2C28; Wed, 26 Feb 2020 10:03:53 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 10:03:53 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 26 Feb 2020 10:03:53 +0000
Received: from CBG-R90WXYV0.cbg10.amazon.com (10.55.230.140) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 10:03:51 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 10:03:51 +0000
Message-ID: <20200226100351.219-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: xen-devel@lists.xenproject.org, pdurrant@amazon.com
Cc: jgross@suse.com, andrew.cooper3@citrix.com, pdurrant@amazon.com,
 marmarek@invisiblethingslab.com, hongyxia@amazon.com, jbeulich@suse.com,
 tamas.k.lengyel@gmail.com, roger.pau@citrix.com, dwmw@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNl
IHJlcGx5IGZvciBpdGVtcwp5b3Ugd291bGQgbGlrZSB0byBzZWUgaW4gNC4xNCBzbyB0aGF0IHBl
b3BsZSBoYXZlIGFuIGlkZWEgd2hhdAppcyBnb2luZyBvbiBhbmQgcHJpb3JpdGlzZSBhY2NvcmRp
bmdseS4KCllvdSdyZSB3ZWxjb21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNl
cyBvZiB0aGUgZmVhdHVyZSB5b3UncmUKd29ya2luZyBvbi4KCj0gVGltZWxpbmUgPQoKV2Ugbm93
IGFkb3B0IGEgZml4ZWQgY3V0LW9mZiBkYXRlIHNjaGVtZS4gV2Ugd2lsbCByZWxlYXNlIGFib3V0
IGV2ZXJ5IDgKIG1vbnRocy4KVGhlIGNyaXRpY2FsIGRhdGVzIGZvciBYZW4gNC4xNCBhcmUgYXMg
Zm9sbG93czoKCi0tLT4gV2UgYXJlIGhlcmUKKiBMYXN0IHBvc3RpbmcgZGF0ZTogTWF5IDFzdCwg
MjAyMAoqIEhhcmQgY29kZSBmcmVlemU6IE1heSAyMm5kLCAyMDIwCiogUmVsZWFzZTogSnVuZSAy
NnRoLCAyMDIwCgpOb3RlIHRoYXQgd2UgZG9uJ3QgaGF2ZSBhIGZyZWV6ZSBleGNlcHRpb24gc2No
ZW1lIGFueW1vcmUuIEFsbCBwYXRjaGVzCnRoYXQgd2lzaCB0byBnbyBpbnRvIDQuMTQgbXVzdCBi
ZSBwb3N0ZWQgaW5pdGlhbGx5IG5vIGxhdGVyIHRoYW4gdGhlCmxhc3QgcG9zdGluZyBkYXRlIGFu
ZCBmaW5hbGx5IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuCkFsbCBwYXRjaGVz
IHBvc3RlZCBhZnRlciB0aGF0IGRhdGUgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHF1ZXVlZCBpbnRv
IG5leHQKcmVsZWFzZS4KClJDcyB3aWxsIGJlIGFycmFuZ2VkIGltbWVkaWF0ZWx5IGFmdGVyIGZy
ZWV6ZS4KClRoZXJlIGlzIGFsc28gYSBqaXJhIGluc3RhbmNlIHRvIHRyYWNrIGFsbCB0aGUgdGFz
a3MgKG5vdCBvbmx5IGJpZykKZm9yIHRoZSBwcm9qZWN0LiBTZWU6IGh0dHBzOi8veGVucHJvamVj
dC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9pc3N1ZXMuCgpTb21lIG9mIHRoZSB0YXNrcyB0
cmFja2VkIGJ5IHRoaXMgZS1tYWlsIGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRpbmcgamlyYSB0YXNr
CnJlZmVycmVkIGJ5IFhFTi1OLgoKVGhlcmUgaXMgYSB2ZXJzaW9uIG51bWJlciBmb3IgcGF0Y2gg
c2VyaWVzIGFzc29jaWF0ZWQgdG8gZWFjaCBmZWF0dXJlLgpDYW4gZWFjaCBvd25lciBzZW5kIGFu
IHVwZGF0ZSBnaXZpbmcgdGhlIGxhdGVzdCB2ZXJzaW9uIG51bWJlciBpZiB0aGUKc2VyaWVzIGhh
cyBiZWVuIHJlLXBvc3RlZD8gQWxzbywgY2FuIHRoZSBvd25lcnMgb2YgYW55IGNvbXBsZXRlZCBp
dGVtcwpwbGVhc2UgcmVzcG9uZCBzbyB0aGF0IHRoZSBpdGVtIGNhbiBiZSBtb3ZlZCBpbnRvIHRo
ZSAnQ29tcGxldGVkJyBzZWN0aW9uLgoKPSBQcm9qZWN0cyA9Cgo9PSBIeXBlcnZpc29yID09IAoK
KiAgTGl2ZS1VcGRhdGluZyBYZW4gKFJGQyB2MikKICAtICBEYXZpZCBXb29kaG91c2UKICAtICBU
aGUgbGF0ZXN0IGNvZGUgaXMgYXZhaWxhYmxlIGF0IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1wZW9wbGUvZHdtdzIveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9sdS1t
YXN0ZXIKICAtICBQcm9qZWN0IHdpa2kgcGFnZSBhdCBodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9MaXZlLVVwZGF0aW5nX1hlbgoKKiAgTm9uLUNvb3BlcmF0aXZlIExpdmUgTWlncmF0
aW9uCiAgLSAgUGF1bCBEdXJyYW50CgoqICBTZWNyZXQgSGlkaW5nICh2NSkKICAtICBIb25neWFu
IFhpYQoKKiAgSHlwZXJ2aXNvciBmaWxlIHN5c3RlbSAodjMpCiAgLSAgSnVlcmdlbiBHcm9zcwoK
PT09IHg4NiA9PT0gCgoqICBMaW51eCBzdHViIGRvbWFpbnMgKHY0KQogIC0gIE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraQoKKiAgVmlydHVhbGlzZSBNU1JfQVJDSF9DQVBTIGZvciBndWVzdHMK
ICAtICBBbmRyZXcgQ29vcGVyCgoqICBBTUQgaGFyZHdhcmUgbWl0aWdhdGlvbnMgKFJvbWUpCiAg
LSAgQW5kcmV3IENvb3BlcgoKKiAgWGVuIGlvcmVxIHNlcnZlciAodjMpCiAgLSAgUm9nZXIgUGF1
IE1vbm5lCgoqICBNZW1vcnkgcmVhZCBjYWNoaW5nIGluIGVtdWxhdGlvbiAodjQpCiAgLSAgSmFu
IEJldWxpY2gKCiogIEluc3RydWN0aW9uIGVtdWxhdG9yIGltcHJvdmVtZW50cwogIC0gIEphbiBC
ZXVsaWNoCgoqICBWTSBmb3JraW5nICh2MTApCiAgLSAgVGFtYXMgSyBMZW5neWVsCgo9PT0gQVJN
ID09PSAKCj09IENvbXBsZXRlZCA9PSAKCgpQYXVsIER1cnJhbnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
