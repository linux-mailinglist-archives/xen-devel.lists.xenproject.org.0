Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6CFE048
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:40:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcjY-0006SG-5k; Fri, 15 Nov 2019 14:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVcjW-0006SB-BG
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:37:58 +0000
X-Inumbo-ID: 83ebf4ca-07b5-11ea-9631-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83ebf4ca-07b5-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 14:37:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f2so11229665wrs.11
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 06:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KenmwKEz8okOtpdm3Bp9npiQMK8InCMEIjnbe1csif4=;
 b=cPDpiTxwuXBIitVyeVrSscxeqJKObJ4CGTl8ccMWLg8a5jN0myX9pcZwHAgtsQ59yq
 16AxKMxuMQF92yPgBXJB61LdKAx8XpM6Z4s3QUO5zK74u/HAYECaZIfXvafh7g4T4T48
 a8VVonFYun3OjrD2tw2bGbT5dFd6fvqvb0wj+c5VkAePw6tvOoTooPeqkRE07KBcexSn
 KTAEiMRd8O7CNp0kVeeMfTmsVhwVcX7+jttxyvLJqhjwtDfyRoM4C9/EB5oWkBQqFl2l
 fgC5S3yKNvUUAGOqMnaWwK8A3Ac8lTCQKZRNb27yF0D40Ne9quWASdUZH6iv8ZtsqrtF
 iktQ==
X-Gm-Message-State: APjAAAWQ28VvlBhrVhFh2nHMEmMh7Nrc7OjVpXgmSuSq96dsoCEoZnRP
 ivzDMaTavWZmiVpUwjAWtLQ=
X-Google-Smtp-Source: APXvYqyjnCPMgKbuLcktrhcvI7KINK8Cwgs8pyQrPo0AZcF8QVe6MWESZBmPnI8DWGP9Py/zrfPfYQ==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr5399446wro.253.1573828676939; 
 Fri, 15 Nov 2019 06:37:56 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id p15sm9307951wmb.10.2019.11.15.06.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 06:37:56 -0800 (PST)
Date: Fri, 15 Nov 2019 14:37:54 +0000
From: Wei Liu <wl@xen.org>
To: Julian Tuminaro <julian.tuminaro@gmail.com>
Message-ID: <20191115143754.h4o25eqk6h6kdl5o@debian>
References: <20191114045543.6759-1-julian.tuminaro@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114045543.6759-1-julian.tuminaro@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH V2] kdd.c: Add support for initial handshake
 in KD protocol for Win 7, 8 and 10 (64 bit)
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jenish Rakholiya <rjenish@cmu.edu>,
 Tim Deegan <tim@xen.org>, Julian Tuminaro <jtuminar@andrew.cmu.edu>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWFuIGFuZCBKZW5pc2gKCkkgaGF2ZSBxdWV1ZWQgdGhpcyBwYXRjaCB0byBteSBmb3It
bmV4dCBicmFuY2ggYmFzZWQgb24gUGF1bCBhbmQgVGltJ3MKcmV2aWV3LgoKTm90ZSB0aGF0IFhl
biBpcyBjdXJyZW50bHkgZnJvemVuLiBUaGlzIHBhdGNoIHdpbGwgZ2V0IGNvbW1pdHRlZCBvbmNl
CnRoZSB0cmVlIGlzIG9wZW4gZm9yIG5ldyBmZWF0dXJlcy4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
