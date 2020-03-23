Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CADF18F5E7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 14:40:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGNHe-0000cb-Ur; Mon, 23 Mar 2020 13:38:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xNlF=5I=amazon.de=prvs=344d8b8e3=nmanthey@srs-us1.protection.inumbo.net>)
 id 1jGNHc-0000cD-Pa
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 13:38:24 +0000
X-Inumbo-ID: 91471062-6d0b-11ea-82d5-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91471062-6d0b-11ea-82d5-12813bfff9fa;
 Mon, 23 Mar 2020 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1584970704; x=1616506704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=z/DoFgB6ZCcaWgWbVny7toMvgGDC5SXUHgrw+cdeKno=;
 b=qpZfeq0nB/hYgLAD7UuBZAMVULcUnKlGgL/vhFqS70daTXgvafyggFZe
 DQcE+kJqwoQA+VkPf8UIvDliczwVVdEUCqeqVckOylkvwP4l549lUEfBq
 jNmsQwooJPX1QL68r/HN0muVVwd3pGAozzClUWjV0bLcCjtoo1OGI7jaZ Q=;
IronPort-SDR: 41ky9xrDQqUFQg0UYXLck/YPsU/jruoM5vqOnjMMom1EQPdEy8f/g8AO1hd8rQ+srvwV6ysPjM
 aaksbrhqtzSQ==
X-IronPort-AV: E=Sophos;i="5.72,296,1580774400"; d="scan'208";a="34295816"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Mar 2020 13:38:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9574DA299B; Mon, 23 Mar 2020 13:38:21 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 23 Mar 2020 13:38:21 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 13:38:19 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.95.138.2) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 23 Mar 2020 13:38:16 +0000
From: Norbert Manthey <nmanthey@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 14:36:58 +0100
Message-ID: <20200323133701.21728-2-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323133701.21728-1-nmanthey@amazon.de>
References: <20200323133701.21728-1-nmanthey@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH XTF benchmark v1 1/4] categories: add benchmark
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Norbert Manthey <nmanthey@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgWFRGIGFsbG93cyB0byB3cml0ZSB0ZXN0cyB0aGF0IGludGVyYWN0IHdpdGggdGhlIGh5cGVy
dmlzb3IsIHdlIHdvdWxkIGxpa2UKdG8gdXNlIHRoaXMgY2FwYWJpbGl0eSB0byBpbXBsZW1lbnQg
bWljcm8gYmVuY2htYXJrcywgc28gdGhhdCB3ZSBjYW4gbWVhc3VyZQp0aGUgcGVyZm9ybWFuY2Ug
aW1wYWN0IG9mIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGh5cGVydmlzb3IuCgpUaGlzIGNoYW5nZSBp
bnRyb2R1Y2VzIGEgY2F0ZWdvcnkgYmVuY2htYXJrLCB3aGljaCBjYW4gYmUgdXNlZCBhcwpjb250
YWluZXIgZm9yIHRlc3RzIG9mIHRoaXMga2luZC4KClNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFu
dGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgoKLS0tCiBidWlsZC9jb21tb24ubWsgfCAyICstCiB4
dGYtcnVubmVyICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9idWlsZC9jb21tb24ubWsgYi9idWlsZC9jb21t
b24ubWsKLS0tIGEvYnVpbGQvY29tbW9uLm1rCisrKyBiL2J1aWxkL2NvbW1vbi5tawpAQCAtMSw0
ICsxLDQgQEAKLUFMTF9DQVRFR09SSUVTICAgICA6PSBzcGVjaWFsIGZ1bmN0aW9uYWwgeHNhIHV0
aWxpdHkgaW4tZGV2ZWxvcG1lbnQKK0FMTF9DQVRFR09SSUVTICAgICA6PSBzcGVjaWFsIGZ1bmN0
aW9uYWwgeHNhIHV0aWxpdHkgaW4tZGV2ZWxvcG1lbnQgYmVuY2htYXJrCiAKIEFMTF9FTlZJUk9O
TUVOVFMgICA6PSBwdjY0IHB2MzJwYWUgaHZtNjQgaHZtMzJwYWUgaHZtMzJwc2UgaHZtMzIKIApk
aWZmIC0tZ2l0IGEveHRmLXJ1bm5lciBiL3h0Zi1ydW5uZXIKLS0tIGEveHRmLXJ1bm5lcgorKysg
Yi94dGYtcnVubmVyCkBAIC00Myw3ICs0Myw3IEBAIGRlZiBleGl0X2NvZGUoc3RhdGUpOgogCiAj
IEFsbCB0ZXN0IGNhdGVnb3JpZXMKIGRlZmF1bHRfY2F0ZWdvcmllcyAgICAgPSBzZXQoKCJmdW5j
dGlvbmFsIiwgInhzYSIpKQotbm9uX2RlZmF1bHRfY2F0ZWdvcmllcyA9IHNldCgoInNwZWNpYWwi
LCAidXRpbGl0eSIsICJpbi1kZXZlbG9wbWVudCIpKQorbm9uX2RlZmF1bHRfY2F0ZWdvcmllcyA9
IHNldCgoInNwZWNpYWwiLCAidXRpbGl0eSIsICJpbi1kZXZlbG9wbWVudCIsICJiZW5jaG1hcmsi
KSkKIGFsbF9jYXRlZ29yaWVzICAgICAgICAgPSBkZWZhdWx0X2NhdGVnb3JpZXMgfCBub25fZGVm
YXVsdF9jYXRlZ29yaWVzCiAKICMgQWxsIHRlc3QgZW52aXJvbm1lbnRzCi0tIAoyLjE3LjEKCgoK
CkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEw
MTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0
aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVy
IEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
