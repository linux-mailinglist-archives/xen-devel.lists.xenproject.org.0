Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4811CCCB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:07:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNC0-0005FQ-Dw; Thu, 12 Dec 2019 12:03:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rxjx=2C=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ifNBz-0005FL-2O
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:03:39 +0000
X-Inumbo-ID: 698148a6-1cd7-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f41.google.com (unknown [209.85.221.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 698148a6-1cd7-11ea-a1e1-bc764e2007e4;
 Thu, 12 Dec 2019 12:03:30 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z7so2406531wrl.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 04:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AlCHktzmSQA2jjSUrDfscLCUJ24fvoYt1sD4DpBF7t8=;
 b=QVFgvkinxNU82oGxkasszda1xxegsaPY7J71MofTsIrZT/UlEOUvxcfQ2PZJW8rfit
 SfNjeLo9QXJBI7/K6jAqNPkE4qExxewKxi1tnNYd0Y0NL2Xkignpx1OMyO7V3H1Uhy1c
 y9hz5faWOgnxSBDGVOu+ek/7wURcnYrtviNH9EoNv0Sb69j8Be9nkle427bPUzgOZmHv
 YaksAF+dFq2F0w1LCm7xj+XvUbmcHy1ACKtKIwe7FjzQmJhz8V4bFgpzbcuq2oaCZZ0S
 s7fDQfT9exPxTqRpvJK4BFEVahR3Xy6XKBcsDxyiMqCoBch9XWcRsPebkJuoFHJxLwJk
 9eqA==
X-Gm-Message-State: APjAAAWJYXbuavZQAora5T7/wPA3pI/MvXuKT4qhMBNjhMVr3qPdLZNB
 S53Xk+ZgvwXGHPNoZKh1plA=
X-Google-Smtp-Source: APXvYqx+0/Ln0aQKCVqTAP0jEQkRsg3e4a+GuIbekJxUNSamN+Hu5iRwVHtssLk/8nSfhLNdRM4plw==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr5868222wrq.43.1576152209869; 
 Thu, 12 Dec 2019 04:03:29 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id r6sm5764515wrq.92.2019.12.12.04.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 04:03:29 -0800 (PST)
Date: Thu, 12 Dec 2019 12:03:27 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191212120327.2xyfwslhipxvacpe@debian>
References: <20191211165659.29939-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211165659.29939-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH-for-4.13] build: fix tools/configure in case
 only python3 exists
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDU6NTY6NTlQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBDYWxsaW5nIC4vY29uZmlndXJlIHdpdGggcHl0aG9uMyBiZWluZyB0aGVyZSBidXQg
bm8gcHl0aG9uLAo+IHRvb2xzL2NvbmZpZ3VyZSB3aWxsIGZhaWwuIEZpeCB0aGF0IGJ5IGRlZmF1
bHRpbmcgdG8gcHl0aG9uIGFuZAo+IGZhbGxpbmcgYmFjayB0byBweXRob24zIG9yIHB5dGhvbjIu
Cj4gCj4gV2hpbGUgYXQgaXQgZml4IHRoZSB1c2Ugb2Ygbm9uIHBvcnRhYmxlICJ0eXBlIC1wIiBi
eSByZXBsYWNpbmcgaXQgYnkKPiBBQ19QQVRIX1BST0coKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
