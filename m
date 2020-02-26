Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857F6170A69
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 22:26:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j749V-0001H0-S3; Wed, 26 Feb 2020 21:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhgo=4O=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1j749U-0001Gv-HA
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 21:23:32 +0000
X-Inumbo-ID: 3cef489a-58de-11ea-a490-bc764e2007e4
Received: from gateway34.websitewelcome.com (unknown [192.185.149.77])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cef489a-58de-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 21:23:31 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 805F2338EAF
 for <xen-devel@lists.xenproject.org>;
 Wed, 26 Feb 2020 15:23:31 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 749TjYtY3RP4z749TjxcVi; Wed, 26 Feb 2020 15:23:31 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=96f8kZdh7WxJBTeep/qoxEO5hEENwT7hPTi1FGgDDyQ=; b=BZl1WCjgZtTNu6aGLvvU4/iPRW
 KLaA1o7tDonP3BUGMMHpFTH76EWmdNlvIEgVkNuMfKiiZDRQe7i00Bf5C2djTnOF+TcPoYjgNKncA
 Rlqx5Ed5Ra7TtDi9045eAvLfhpfmdWkr6BdOj1U1j6rxT+1kY/qpWzi2R72Qh49C2R7mauhdDHCTG
 snYO5LP6796MkyQirOLPQ+m483LtTmhx20oZlAze2cojPgR01142altotg30XfkciRi+LRxCckTCd
 HPHeyB5uYVzEWI5qUaAsA2gTE8sOZ2IFKcI4zv9NnCa5B7N0FTXEmmOKZlauQzSKfqO/Ro6LjxnZ8
 gzd3TRow==;
Received: from [201.162.161.180] (port=47722 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j749R-000nRw-Iy; Wed, 26 Feb 2020 15:23:30 -0600
Date: Wed, 26 Feb 2020 15:26:12 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20200226212612.GA4663@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.161.180
X-Source-L: No
X-Exim-ID: 1j749R-000nRw-Iy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.161.180]:47722
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 20
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Subject: [Xen-devel] [PATCH] xen: Replace zero-length array with
 flexible-array member
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJvLWxlbmd0aCBhcnJheSBs
YW5ndWFnZQpleHRlbnNpb24gdG8gdGhlIEM5MCBzdGFuZGFyZCwgYnV0IHRoZSBwcmVmZXJyZWQg
bWVjaGFuaXNtIHRvIGRlY2xhcmUKdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1Y2ggYXMgdGhlc2Ug
b25lcyBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlclsxXVsyXSwKaW50cm9kdWNlZCBpbiBDOTk6
CgpzdHJ1Y3QgZm9vIHsKICAgICAgICBpbnQgc3R1ZmY7CiAgICAgICAgc3RydWN0IGJvbyBhcnJh
eVtdOwp9OwoKQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNtIGFib3ZlLCB3ZSB3aWxsIGdl
dCBhIGNvbXBpbGVyIHdhcm5pbmcKaW4gY2FzZSB0aGUgZmxleGlibGUgYXJyYXkgZG9lcyBub3Qg
b2NjdXIgbGFzdCBpbiB0aGUgc3RydWN0dXJlLCB3aGljaAp3aWxsIGhlbHAgdXMgcHJldmVudCBz
b21lIGtpbmQgb2YgdW5kZWZpbmVkIGJlaGF2aW9yIGJ1Z3MgZnJvbSBiZWluZwppbmFkdmVydGVu
dGx5IGludHJvZHVjZWRbM10gdG8gdGhlIGNvZGViYXNlIGZyb20gbm93IG9uLgoKQWxzbywgbm90
aWNlIHRoYXQsIGR5bmFtaWMgbWVtb3J5IGFsbG9jYXRpb25zIHdvbid0IGJlIGFmZmVjdGVkIGJ5
CnRoaXMgY2hhbmdlOgoKIkZsZXhpYmxlIGFycmF5IG1lbWJlcnMgaGF2ZSBpbmNvbXBsZXRlIHR5
cGUsIGFuZCBzbyB0aGUgc2l6ZW9mIG9wZXJhdG9yCm1heSBub3QgYmUgYXBwbGllZC4gQXMgYSBx
dWlyayBvZiB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YKemVyby1sZW5ndGggYXJyYXlz
LCBzaXplb2YgZXZhbHVhdGVzIHRvIHplcm8uIlsxXQoKVGhpcyBpc3N1ZSB3YXMgZm91bmQgd2l0
aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlLgoKWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5l
ZG9jcy9nY2MvWmVyby1MZW5ndGguaHRtbApbMl0gaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGlu
dXgvaXNzdWVzLzIxClszXSBjb21taXQgNzY0OTc3MzI5MzJmICgiY3hnYjMvbDJ0OiBGaXggdW5k
ZWZpbmVkIGJlaGF2aW91ciIpCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxn
dXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaWJh
Y2suaCB8IDIgKy0KIGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby90cG1pZi5oICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaWJhY2suaCBiL2RyaXZlcnMveGVuL3hlbi1w
Y2liYWNrL3BjaWJhY2suaAppbmRleCBjZTEwNzdlMzI0NjYuLjdjOTU1MTZhODYwZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpYmFjay5oCisrKyBiL2RyaXZlcnMveGVu
L3hlbi1wY2liYWNrL3BjaWJhY2suaApAQCAtNTIsNyArNTIsNyBAQCBzdHJ1Y3QgeGVuX3BjaWJr
X2Rldl9kYXRhIHsKIAl1bnNpZ25lZCBpbnQgYWNrX2ludHI6MTsgLyogLi4gYW5kIEFDSy1pbmcg
Ki8KIAl1bnNpZ25lZCBsb25nIGhhbmRsZWQ7CiAJdW5zaWduZWQgaW50IGlycTsgLyogU2F2ZWQg
aW4gY2FzZSBkZXZpY2UgdHJhbnNpdGlvbnMgdG8gTVNJL01TSS1YICovCi0JY2hhciBpcnFfbmFt
ZVswXTsgLyogeGVuLXBjaWJrWzAwMDowNDowMC4wXSAqLworCWNoYXIgaXJxX25hbWVbXTsgLyog
eGVuLXBjaWJrWzAwMDowNDowMC4wXSAqLwogfTsKIAogLyogVXNlZCBieSBYZW5CdXMgYW5kIHhl
bl9wY2lia19vcHMuYyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3Rw
bWlmLmggYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vdHBtaWYuaAppbmRleCAyOGU3ZGNkNzVl
ODIuLmY4YWE4YmFjNTE5NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3Rw
bWlmLmgKKysrIGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3RwbWlmLmgKQEAgLTQ2LDcgKzQ2
LDcgQEAgc3RydWN0IHZ0cG1fc2hhcmVkX3BhZ2UgewogCXVpbnQ4X3QgcGFkOwogCiAJdWludDhf
dCBucl9leHRyYV9wYWdlczsgIC8qIGV4dHJhIHBhZ2VzIGZvciBsb25nIHBhY2tldHM7IG1heSBi
ZSB6ZXJvICovCi0JdWludDMyX3QgZXh0cmFfcGFnZXNbMF07IC8qIGdyYW50IElEczsgbGVuZ3Ro
IGluIG5yX2V4dHJhX3BhZ2VzICovCisJdWludDMyX3QgZXh0cmFfcGFnZXNbXTsgLyogZ3JhbnQg
SURzOyBsZW5ndGggaW4gbnJfZXh0cmFfcGFnZXMgKi8KIH07CiAKICNlbmRpZgotLSAKMi4yNS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
