Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424B181AA1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:00:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC1rg-0006ir-MY; Wed, 11 Mar 2020 13:57:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEBi=44=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jC1rg-0006im-25
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 13:57:40 +0000
X-Inumbo-ID: 44d7a5f8-63a0-11ea-afa3-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44d7a5f8-63a0-11ea-afa3-12813bfff9fa;
 Wed, 11 Mar 2020 13:57:39 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a20so3006324edj.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2020 06:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5KrJ/dbuiva/Fq/4fPE8jDI381MJu1O87xHsMVJSrCM=;
 b=bZXdWJU6MVdsYTp12noC7sqSeE1xpV8YsA8emEQHU+9zR9dNbBIjInRgc5EpOGoOlS
 wFwuiiIQ/jEMQNF8Ak7Pxl8rX6lzepveCrjCchcxuGmhlTzA1v88GC7cddUkxbViH9z4
 ARckW0vOvvOdLBe2GLURGXbmMUSNr+SrK/h0uN4XmQ4P0YMy1nvRnzCUE5zFxl3n1ZvM
 aJEn2yMHY7SSJXau9vkGorRfgEqsK6wld9hiqH1NwuU6m2ZJjPug/aDi2H9t5CvGKqcp
 JXyI9cfuxPrOKdccxE3QIqLhI6iIOA8q2k3oLK53LzKZsGACsSP6I8Xl7soTEhJjG1GW
 XSMg==
X-Gm-Message-State: ANhLgQ3NEjZ/gCRSzGKk2dYwr0dt3chnHJ8FNAyFGmIcX/XlnGmFbIXv
 o5SX3Qe4FE2SLKS7zGyFhu4=
X-Google-Smtp-Source: ADFU+vtqL84MGoBCEyPkIIOzHm+SPXtFg8nu399M/xAfLb/YvJZ3sJWvjYB599wPVYM3uWssOiX+mQ==
X-Received: by 2002:a17:906:fcd7:: with SMTP id
 qx23mr2430895ejb.254.1583935058567; 
 Wed, 11 Mar 2020 06:57:38 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id n16sm4106024edt.35.2020.03.11.06.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 06:57:38 -0700 (PDT)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-2-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4f26f2b9-b011-9533-60ce-05dd6c101827@xen.org>
Date: Wed, 11 Mar 2020 13:57:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309174505.594607-2-anthony.perard@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 1/2] xen/arm: Rename all early printk
 macro
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCk9uIDA5LzAzLzIwMjAgMTc6NDUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUwo+IGluZGV4IGU5ZDM1NmYwNWMyYi4uMmI1OTNjNWVmOTlhIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCj4gQEAgLTM2LDggKzM2LDggQEAKPiAgICNkZWZpbmUgWEVOX0ZJUlNUX1NMT1QgICAg
ICBmaXJzdF90YWJsZV9vZmZzZXQoWEVOX1ZJUlRfU1RBUlQpCj4gICAjZGVmaW5lIFhFTl9TRUNP
TkRfU0xPVCAgICAgc2Vjb25kX3RhYmxlX29mZnNldChYRU5fVklSVF9TVEFSVCkKPiAgIAo+IC0j
aWYgKGRlZmluZWQgKENPTkZJR19FQVJMWV9QUklOVEspKSAmJiAoZGVmaW5lZCAoRUFSTFlfUFJJ
TlRLX0lOQykpCj4gLSNpbmNsdWRlIEVBUkxZX1BSSU5US19JTkMKPiArI2lmIChkZWZpbmVkIChD
T05GSUdfRUFSTFlfUFJJTlRLKSkgJiYgKGRlZmluZWQgKENPTkZJR19FQVJMWV9QUklOVEtfSU5D
KSkKCk5JVDogSSB3b3VsZCBhbHNvIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGNsZWFuLXVwIHRo
ZSBsaW5lIGJ5IHJlbW92ZSAKdGhlIGV4dHJhICgpIGFuZCB0aGUgc3BhY2UgYmVmb3JlICguIFNv
bWV0aGluZyBsaWtlOgoKI2lmIGRlZmluZShDT05GSUdfRUFSTFlfUFJJTlRLKSAmJiBkZWZpbmVk
KENPTkZJR19FQVJMWV9QUklOVEtfSU5DKQoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggZTUw
MTVmOTNhMmQ4Li40ZDQ1ZWEzZGFjM2MgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtNDUsOCArNDUs
OCBAQAo+ICAgI2RlZmluZSBfX0hFQURfRkxBR1MgICAgICAgICAgICAoKF9fSEVBRF9GTEFHX1BB
R0VfU0laRSA8PCAxKSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChf
X0hFQURfRkxBR19QSFlTX0JBU0UgPDwgMykpCj4gICAKPiAtI2lmIChkZWZpbmVkIChDT05GSUdf
RUFSTFlfUFJJTlRLKSkgJiYgKGRlZmluZWQgKEVBUkxZX1BSSU5US19JTkMpKQo+IC0jaW5jbHVk
ZSBFQVJMWV9QUklOVEtfSU5DCj4gKyNpZiAoZGVmaW5lZCAoQ09ORklHX0VBUkxZX1BSSU5USykp
ICYmIChkZWZpbmVkIChDT05GSUdfRUFSTFlfUFJJTlRLX0lOQykpCgpTYW1lIGhlcmUuCgpJIGFt
IGhhcHB5IHRvIGZpeCBib3RoIGNhc2VzIG9uIGNvbW1pdDoKCkFja2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
