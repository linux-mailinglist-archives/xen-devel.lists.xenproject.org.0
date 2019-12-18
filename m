Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277CD1244F6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:46:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWp4-0005Ct-Bo; Wed, 18 Dec 2019 10:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihWp3-0005Ck-GC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:44:53 +0000
X-Inumbo-ID: 6c1a38ce-2183-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c1a38ce-2183-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576665894; x=1608201894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+VnO6drUSeisUZRUWMUBisA9nUpj40JofIdvVB89+ew=;
 b=s2bp3PHzcTj+O51tHb6aGjon6PR+LK0RtNOk+J0mQce89RJHYH0Sa48P
 YluEXsXo2fAk6dX9oniwYDZPkNusKJJNdqab4p+JquJIMKRI1aTXhaJbX
 3lWnYvycJJMRYpdligd5P19SV+g6OmTr3vqXdGQFJD39y7Z9lXVtl24mp 8=;
IronPort-SDR: sF7Akgc90xIs+vuPB4sZ2HTXRVEHfSttfSZlXVmAMYnNjviNiDPqc4NcM+T2sc+OjxEHJ8dTF0
 Ri83ZiZ3dP3A==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; d="scan'208";a="14228863"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 18 Dec 2019 10:44:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id C13A8A2020; Wed, 18 Dec 2019 10:44:51 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 10:44:51 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.83) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 10:44:46 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Wed, 18 Dec 2019 11:44:28 +0100
Message-ID: <20191218104428.10069-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218104232.9606-1-sjpark@amazon.com>
References: <20191218104232.9606-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.162.83]
X-ClientProxiedBy: EX13D35UWC001.ant.amazon.com (10.43.162.197) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v12 5/5] xen/blkback: Consistently insert one
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
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
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
LmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCmluZGV4IDIwMDQ1ODI3YTM5
MS4uNDUzZjk3ZGQ1MzNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKQEAgLTQzMiw3
ICs0MzIsNiBAQCBzdGF0aWMgdm9pZCB4ZW52YmRfc3lzZnNfZGVsaWYoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKmRldikKIAlkZXZpY2VfcmVtb3ZlX2ZpbGUoJmRldi0+ZGV2LCAmZGV2X2F0dHJfcGh5
c2ljYWxfZGV2aWNlKTsKIH0KIAotCiBzdGF0aWMgdm9pZCB4ZW5fdmJkX2ZyZWUoc3RydWN0IHhl
bl92YmQgKnZiZCkKIHsKIAlpZiAodmJkLT5iZGV2KQpAQCAtNDg5LDYgKzQ4OCw3IEBAIHN0YXRp
YyBpbnQgeGVuX3ZiZF9jcmVhdGUoc3RydWN0IHhlbl9ibGtpZiAqYmxraWYsIGJsa2lmX3ZkZXZf
dCBoYW5kbGUsCiAJCWhhbmRsZSwgYmxraWYtPmRvbWlkKTsKIAlyZXR1cm4gMDsKIH0KKwogc3Rh
dGljIGludCB4ZW5fYmxrYmtfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCiB7CiAJ
c3RydWN0IGJhY2tlbmRfaW5mbyAqYmUgPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsKQEAg
LTU3NSw2ICs1NzUsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxrYmtfZGlzY2FyZChzdHJ1Y3QgeGVu
YnVzX3RyYW5zYWN0aW9uIHhidCwgc3RydWN0IGJhY2tlbmRfaW5mbwogCWlmIChlcnIpCiAJCWRl
dl93YXJuKCZkZXYtPmRldiwgIndyaXRpbmcgZmVhdHVyZS1kaXNjYXJkICglZCkiLCBlcnIpOwog
fQorCiBpbnQgeGVuX2Jsa2JrX2JhcnJpZXIoc3RydWN0IHhlbmJ1c190cmFuc2FjdGlvbiB4YnQs
CiAJCSAgICAgIHN0cnVjdCBiYWNrZW5kX2luZm8gKmJlLCBpbnQgc3RhdGUpCiB7CkBAIC02NjMs
NyArNjY0LDYgQEAgc3RhdGljIGludCB4ZW5fYmxrYmtfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZp
Y2UgKmRldiwKIAlyZXR1cm4gZXJyOwogfQogCi0KIC8qCiAgKiBDYWxsYmFjayByZWNlaXZlZCB3
aGVuIHRoZSBob3RwbHVnIHNjcmlwdHMgaGF2ZSBwbGFjZWQgdGhlIHBoeXNpY2FsLWRldmljZQog
ICogbm9kZS4gIFJlYWQgaXQgYW5kIHRoZSBtb2RlIG5vZGUsIGFuZCBjcmVhdGUgYSB2YmQuICBJ
ZiB0aGUgZnJvbnRlbmQgaXMKQEAgLTc1NSw3ICs3NTUsNiBAQCBzdGF0aWMgdm9pZCBiYWNrZW5k
X2NoYW5nZWQoc3RydWN0IHhlbmJ1c193YXRjaCAqd2F0Y2gsCiAJfQogfQogCi0KIC8qCiAgKiBD
YWxsYmFjayByZWNlaXZlZCB3aGVuIHRoZSBmcm9udGVuZCdzIHN0YXRlIGNoYW5nZXMuCiAgKi8K
QEAgLTgzMCw3ICs4MjksNiBAQCBzdGF0aWMgdm9pZCBmcm9udGVuZF9jaGFuZ2VkKHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYsCiAJfQogfQogCi0KIC8qIE9uY2UgYSBtZW1vcnkgcHJlc3N1cmUg
aXMgZGV0ZWN0ZWQsIHNxdWVlemUgZnJlZSBwYWdlIHBvb2xzIGZvciBhIHdoaWxlLiAqLwogc3Rh
dGljIHVuc2lnbmVkIGludCBidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcyA9IDEwOwogbW9kdWxl
X3BhcmFtX25hbWVkKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLApAQCAtODU1LDcgKzg1Myw2
IEBAIHN0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYp
CiAKIC8qICoqIENvbm5lY3Rpb24gKiogKi8KIAotCiAvKgogICogV3JpdGUgdGhlIHBoeXNpY2Fs
IGRldGFpbHMgcmVnYXJkaW5nIHRoZSBibG9jayBkZXZpY2UgdG8gdGhlIHN0b3JlLCBhbmQKICAq
IHN3aXRjaCB0byBDb25uZWN0ZWQgc3RhdGUuCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
