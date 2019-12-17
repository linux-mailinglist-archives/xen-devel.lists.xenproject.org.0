Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA67122E4E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:16:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDbV-0001tB-Db; Tue, 17 Dec 2019 14:13:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7KW0=2H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihDbT-0001t2-79
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:13:35 +0000
X-Inumbo-ID: 68504348-20d7-11ea-8ed5-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68504348-20d7-11ea-8ed5-12813bfff9fa;
 Tue, 17 Dec 2019 14:13:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so3347331wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 06:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t/snZToAYNOciMWE78YlpTmSP3BDI3TbmUHhUCTr3PI=;
 b=aGQ5JlSeXrNXCE7D/I7h+yI2xIalue/xG8akonBX2PgAYFt3+7XnggizHvFFcp3CwC
 DDht/fp2OByI5XKWYqEWPReH9MpLEpYqUNwWXGeI3PsSlwOQOWz+fvzBXEES/kiGEDfg
 cBsARIRLbMnYIiZvaS4rSvb41dLllyQKYYP/MezYmOnP2OBfGzhcyuf5nNzbKoDMg4o9
 S2TSEK0/T03ig7lu0vYji4ioUlOcNd80GcdC7Gz0CcMe+qbseXY+CVk9rgUCimE+y2UC
 56VPNsGQca/yc2LvUrXUior5p/JoU10GJObArLGdhJXWYxElZz/sfsi7HYj1jL/LHaYH
 pwRQ==
X-Gm-Message-State: APjAAAX6nTQbrO+1ZS0JOU5bakDw++HHz1Jf+orWzubRv9bV5sEsYcTE
 0E1ry9IvqfwauDAppjjsCzQ=
X-Google-Smtp-Source: APXvYqyak6HTtkf6C07cFEeggr8ZbHxslbd1VbEBIK+CuXlRM/9OQXamaSCu4SAp9OAMP3ckpUatOw==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr5877966wma.62.1576592012545;
 Tue, 17 Dec 2019 06:13:32 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id w13sm25764785wru.38.2019.12.17.06.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:13:32 -0800 (PST)
Date: Tue, 17 Dec 2019 14:13:30 +0000
From: Wei Liu <wl@xen.org>
To: Steven Haigh <netwiz@crc.id.au>
Message-ID: <20191217141330.etqf332fddplsbb4@debian>
References: <cover.1576209614.git.netwiz@crc.id.au>
 <aa2b7e60d0e20ffe1e83b10f327efbb6dacd3358.1576209614.git.netwiz@crc.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa2b7e60d0e20ffe1e83b10f327efbb6dacd3358.1576209614.git.netwiz@crc.id.au>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/2] Tidy up whitespace and formatting in
 file to be consistent.
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

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDM6MDg6MzRQTSArMTEwMCwgU3RldmVuIEhhaWdoIHdy
b3RlOgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4KCkFj
a2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKSSB3aWxsIG5lZWQgdG8gYWRkIHRvb2xzL2hv
dHBsdWcgdG8gdGhlIHN1YmplY3QgbGluZSBhbmQgdGhlIGZvbGxvd2luZwpjb21taXQgbWVzc2Fn
ZToKCiAgIFVzZSA0IHNwYWNlcyBmb3IgaW5kZW50YXRpb24gdGhyb3VnaG91dCB0aGUgZmlsZS4g
Tm8gZnVuY3Rpb25hbAogICBjaGFuZ2UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
