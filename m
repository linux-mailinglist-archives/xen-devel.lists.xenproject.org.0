Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E310800F
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 19:48:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYaR5-0002Pq-5r; Sat, 23 Nov 2019 18:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYaR4-0002Pk-EV
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 18:47:10 +0000
X-Inumbo-ID: a40fbc6a-0e21-11ea-a37e-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a40fbc6a-0e21-11ea-a37e-12813bfff9fa;
 Sat, 23 Nov 2019 18:47:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n188so9424028wme.1
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 10:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HXN8PznJubtDPB5aK3ND3FXJkRGZjFgA+hO25ts+oRE=;
 b=P3IxFgiWpkOye/zeEHTg+qkIE6BaG6kvOyHbwk1yvgOPrbCXdjvowO5KhO7E8ju3tZ
 ptK2k61O9sRHyUXz3EcEoya5SaG5OOSoUX5+Ahjh636bwarJtJ7Hdtf2Tk8ML+gOvvAh
 MH36aUWBDegMroKAV7wUFue7rJXZ2wtUFfS97iQKc+TClPmFLsDRZ2Ou21ixC+EZLE1/
 aWvFSBUDHHBb5Uj2jJppnrmOJ9I6Xc4EkBtaanJOX+Ykk3+hjVzIJe/zLlD+DQp5imME
 DCSFNO5pLJ5Q2ziqvnRG+1THGaYN+jsSwTSau08YGe085mF0lCbXoNfBsqCSWYDvB5U6
 fqVA==
X-Gm-Message-State: APjAAAX5G89EVfRrRYUcHKuxtc8fdWdVnrgeon9Gltkz4G0y/elNbPbt
 Vh0+tAo2yZHMSSmODufl7/U=
X-Google-Smtp-Source: APXvYqwJ30a9y9rbSuMJoW/HfknanTUvcevRUcXOzB7OfZ1cgtWddQHv55V9mEd3AZaBa0Ok4acpmw==
X-Received: by 2002:a1c:2dd0:: with SMTP id t199mr21582544wmt.58.1574534823469; 
 Sat, 23 Nov 2019 10:47:03 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id j3sm3082707wrs.70.2019.11.23.10.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 10:47:02 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115200115.44890-3-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <42a703e4-e864-ea52-14e7-2e8d96aa324d@xen.org>
Date: Sat, 23 Nov 2019 18:47:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115200115.44890-3-stewart.hildebrand@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 02/11] xen: arm: fix typo in the
 description of struct pending_irq->desc
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
Cc: Julien Grall <julien.grall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Campbell <ian.campbell@citrix.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjAxLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gRnJv
bTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KPiAKPiBzL2l0L2lmLyBt
YWtlcyBtb3JlIHNlbnNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBDYW1wYmVsbCA8aWFuLmNh
bXBiZWxsQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGNpdHJpeC5jb20+IFsxXQo+IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZh
bm8uc3RhYmVsbGluaUBldS5jaXRyaXguY29tPiBbMl0KClNpbWlsYXIgcmVtYXJrIHRvIHRoZSBw
cmV2aW91cyBwYXRjaC4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
