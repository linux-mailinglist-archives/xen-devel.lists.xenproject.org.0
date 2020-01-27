Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66AB149FD7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 09:25:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivzdF-0002PE-MK; Mon, 27 Jan 2020 08:20:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y5+q=3Q=amazon.com=prvs=288afea8f=sjpark@srs-us1.protection.inumbo.net>)
 id 1ivzdE-0002P4-7M
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 08:20:28 +0000
X-Inumbo-ID: db33ec68-40dd-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db33ec68-40dd-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580113220; x=1611649220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I0bGMY0UnkD1SQDKudWK+VHlWYQo9kxn8xvkLvZ6+gw=;
 b=HSWJjL3qZflBjg3HZ0LsIxgvkt4awx+NFDm2/U2UIxmjPWlrrcpE9WW4
 NTX43GtRXtGQUrmrJvoeLi8KjxFsvNJo7AcfjhdTFS4wYHwiYnUBprd+r
 A7Un1iA0KAAyidTl2bIksrAXoIoMjYsr9pvTKjN38Ze/OVxMjm1vxQgWD I=;
IronPort-SDR: nJ6CGo/h7Rj8evct5993fDuaqqM8Fs4H2y02wDFZ2uT5VCpoe44uYjQlucDgefYn99dFDE3SE8
 G+O8acrjKseA==
X-IronPort-AV: E=Sophos;i="5.70,369,1574121600"; d="scan'208";a="14868091"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Jan 2020 08:20:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2F458C5A7D; Mon, 27 Jan 2020 08:20:16 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 08:20:16 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.78) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 08:20:11 +0000
From: <sjpark@amazon.com>
To: <jgross@suse.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>
Date: Mon, 27 Jan 2020 09:19:57 +0100
Message-ID: <20200127081957.21509-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127081812.21216-1-sjpark@amazon.com>
References: <20200127081812.21216-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.161.78]
X-ClientProxiedBy: EX13D25UWB001.ant.amazon.com (10.43.161.245) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v14 5/5] xen/blkback: Consistently insert one
 empty line between functions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KClRoZSBudW1iZXIgb2YgZW1w
dHkgbGluZXMgYmV0d2VlbiBmdW5jdGlvbnMgaW4gdGhlIHhlbmJ1cy5jIGlzCmluY29uc2lzdGVu
dC4gIFRoaXMgdHJpdmlhbCBzdHlsZSBjbGVhbnVwIGNvbW1pdCBmaXhlcyB0aGUgZmlsZSB0bwpj
b25zaXN0ZW50bHkgcGxhY2Ugb25seSBvbmUgZW1wdHkgbGluZS4KCkFja2VkLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVz
LmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCmluZGV4IDU1OTYwMTkwYjc3
NC4uNDI5NDRkNDFhZWEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKQEAgLTQ2Nyw3
ICs0NjcsNiBAQCBzdGF0aWMgdm9pZCB4ZW52YmRfc3lzZnNfZGVsaWYoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKmRldikKIAlkZXZpY2VfcmVtb3ZlX2ZpbGUoJmRldi0+ZGV2LCAmZGV2X2F0dHJfcGh5
c2ljYWxfZGV2aWNlKTsKIH0KIAotCiBzdGF0aWMgdm9pZCB4ZW5fdmJkX2ZyZWUoc3RydWN0IHhl
bl92YmQgKnZiZCkKIHsKIAlpZiAodmJkLT5iZGV2KQpAQCAtNTI0LDYgKzUyMyw3IEBAIHN0YXRp
YyBpbnQgeGVuX3ZiZF9jcmVhdGUoc3RydWN0IHhlbl9ibGtpZiAqYmxraWYsIGJsa2lmX3ZkZXZf
dCBoYW5kbGUsCiAJCWhhbmRsZSwgYmxraWYtPmRvbWlkKTsKIAlyZXR1cm4gMDsKIH0KKwogc3Rh
dGljIGludCB4ZW5fYmxrYmtfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCiB7CiAJ
c3RydWN0IGJhY2tlbmRfaW5mbyAqYmUgPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsKQEAg
LTYwNyw2ICs2MDcsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxrYmtfZGlzY2FyZChzdHJ1Y3QgeGVu
YnVzX3RyYW5zYWN0aW9uIHhidCwgc3RydWN0IGJhY2tlbmRfaW5mbwogCWlmIChlcnIpCiAJCWRl
dl93YXJuKCZkZXYtPmRldiwgIndyaXRpbmcgZmVhdHVyZS1kaXNjYXJkICglZCkiLCBlcnIpOwog
fQorCiBpbnQgeGVuX2Jsa2JrX2JhcnJpZXIoc3RydWN0IHhlbmJ1c190cmFuc2FjdGlvbiB4YnQs
CiAJCSAgICAgIHN0cnVjdCBiYWNrZW5kX2luZm8gKmJlLCBpbnQgc3RhdGUpCiB7CkBAIC02OTEs
NyArNjkyLDYgQEAgc3RhdGljIGludCB4ZW5fYmxrYmtfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZp
Y2UgKmRldiwKIAlyZXR1cm4gZXJyOwogfQogCi0KIC8qCiAgKiBDYWxsYmFjayByZWNlaXZlZCB3
aGVuIHRoZSBob3RwbHVnIHNjcmlwdHMgaGF2ZSBwbGFjZWQgdGhlIHBoeXNpY2FsLWRldmljZQog
ICogbm9kZS4gIFJlYWQgaXQgYW5kIHRoZSBtb2RlIG5vZGUsIGFuZCBjcmVhdGUgYSB2YmQuICBJ
ZiB0aGUgZnJvbnRlbmQgaXMKQEAgLTc4Myw3ICs3ODMsNiBAQCBzdGF0aWMgdm9pZCBiYWNrZW5k
X2NoYW5nZWQoc3RydWN0IHhlbmJ1c193YXRjaCAqd2F0Y2gsCiAJfQogfQogCi0KIC8qCiAgKiBD
YWxsYmFjayByZWNlaXZlZCB3aGVuIHRoZSBmcm9udGVuZCdzIHN0YXRlIGNoYW5nZXMuCiAgKi8K
QEAgLTg1OCw3ICs4NTcsNiBAQCBzdGF0aWMgdm9pZCBmcm9udGVuZF9jaGFuZ2VkKHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYsCiAJfQogfQogCi0KIC8qIE9uY2UgYSBtZW1vcnkgcHJlc3N1cmUg
aXMgZGV0ZWN0ZWQsIHNxdWVlemUgZnJlZSBwYWdlIHBvb2xzIGZvciBhIHdoaWxlLiAqLwogc3Rh
dGljIHVuc2lnbmVkIGludCBidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcyA9IDEwOwogbW9kdWxl
X3BhcmFtX25hbWVkKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLApAQCAtODgxLDcgKzg3OSw2
IEBAIHN0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYp
CiAKIC8qICoqIENvbm5lY3Rpb24gKiogKi8KIAotCiAvKgogICogV3JpdGUgdGhlIHBoeXNpY2Fs
IGRldGFpbHMgcmVnYXJkaW5nIHRoZSBibG9jayBkZXZpY2UgdG8gdGhlIHN0b3JlLCBhbmQKICAq
IHN3aXRjaCB0byBDb25uZWN0ZWQgc3RhdGUuCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
