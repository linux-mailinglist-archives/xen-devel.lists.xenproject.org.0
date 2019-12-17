Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F812303C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:26:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEh0-0001N4-R1; Tue, 17 Dec 2019 15:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J1Kd=2H=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1ihEgz-0001Mm-9W
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:23:21 +0000
X-Inumbo-ID: 23812994-20e1-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23812994-20e1-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 15:23:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so11771947wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 07:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4jMnvXlfIXqQVWBPxG/mv/FYRxV3EXzFNkPvP/otuwo=;
 b=BPaYVKNCUjf/icayiOi+rjKGs7cGFf/uEqZT3sk4qOkMne4klzoqrpTxa0OOb9JmFT
 vuq7AOQWO4hDTC0Rbg9hV8KApPRJy6X4CLzWjyzNS31dk6cCbXXSUC0TMfzoI4WlUJh5
 q8hHcsWf21xWCR0xbcD7R/JoEZNfox/GR9UJIyzDH95VVkKahDoIKLkl2xLCcdScgRRj
 EfKkLy4PKu0EDAhk/QtBXgRwnbG3ExDf6F/YHopwvHnviFgXStnkQkpiu/hTPkhf+vRp
 N6OC4BW/1RiVVy1qMBFgKLj9rS5rvxgvs6L2bwLy7RVXkQBDv3oaEKqHMRQZ4fHh2d/m
 lpcA==
X-Gm-Message-State: APjAAAVoLk00VXNQLs3M0B6mHrPghhRPGex/uXufUTqswKkCIAqEiWRe
 2oqZRv5Zfc2QsbPr6+F3KFc=
X-Google-Smtp-Source: APXvYqxLCJoIoEP3yDRqDS5GKQ5fAd8g8r5iVYPeQXUur37Rc/QTN29MW8nDmGk2hEaRP6pH4/wVzw==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr36621601wrt.70.1576596192107; 
 Tue, 17 Dec 2019 07:23:12 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id m126sm3338168wmf.7.2019.12.17.07.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 07:23:11 -0800 (PST)
Date: Tue, 17 Dec 2019 15:23:09 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191217152309.inhyugu2fymmnvus@debian>
References: <20191217133218.27085-1-pdurrant@amazon.com>
 <20191217133218.27085-2-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217133218.27085-2-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH net-next 1/3] xen-netback: move
 netback_probe() and netback_remove() to the end...
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
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDE6MzI6MTZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLm9mIHhlbmJ1cy5jCj4gCj4gVGhpcyBpcyBhIGNvc21ldGljIGZ1bmN0aW9uIHJl
LW9yZGVyaW5nIHRvIHJlZHVjZSBjaHVybiBpbiBhIHN1YnNlcXVlbnQKPiBwYXRjaC4gU29tZSBz
dHlsZSBmaXgtdXAgd2FzIGRvbmUgdG8gbWFrZSBjaGVja3BhdGNoLnBsIGhhcHBpZXIuCj4gCj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
