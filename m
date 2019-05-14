Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849161CBE0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 17:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQZKK-000581-P4; Tue, 14 May 2019 15:26:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8fNp=TO=de.ibm.com=borntraeger@srs-us1.protection.inumbo.net>)
 id 1hQZKJ-00057w-5y
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:26:47 +0000
X-Inumbo-ID: aebdcdca-765c-11e9-8980-bc764e045a96
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.158.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aebdcdca-765c-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 15:26:45 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EFHxiS025208
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 11:26:44 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfy7u3akv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 11:26:43 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <borntraeger@de.ibm.com>;
 Tue, 14 May 2019 16:26:41 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 16:26:38 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4EFQbpo37224662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 15:26:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4309AA405D;
 Tue, 14 May 2019 15:26:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7558A4053;
 Tue, 14 May 2019 15:26:36 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.148.90])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 15:26:36 +0000 (GMT)
To: Filippo Sironi <sironi@amazon.de>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, boris.ostrovsky@oracle.com, cohuck@redhat.com,
 konrad.wilk@oracle.com, xen-devel@lists.xenproject.org,
 vasu.srinivasan@oracle.com
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 syiRa+UVlsKmx1hsEg==
Date: Tue, 14 May 2019 17:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557847002-23519-2-git-send-email-sironi@amazon.de>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051415-0016-0000-0000-0000027B9D62
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051415-0017-0000-0000-000032D868EB
Message-Id: <d03f6be5-d8dc-4389-e14c-295f36a68827@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140108
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNS4xOSAxNzoxNiwgRmlsaXBwbyBTaXJvbmkgd3JvdGU6Cj4gU3RhcnQgcG9wdWxh
dGluZyAvc3lzL2h5cGVydmlzb3Igd2l0aCBLVk0gZW50cmllcyB3aGVuIHdlJ3JlIHJ1bm5pbmcg
b24KPiBLVk0uIFRoaXMgaXMgdG8gcmVwbGljYXRlIGZ1bmN0aW9uYWxpdHkgdGhhdCdzIGF2YWls
YWJsZSB3aGVuIHdlJ3JlCj4gcnVubmluZyBvbiBYZW4uCj4gCj4gU3RhcnQgd2l0aCAvc3lzL2h5
cGVydmlzb3IvdXVpZCwgd2hpY2ggdXNlcnMgcHJlZmVyIG92ZXIKPiAvc3lzL2RldmljZXMvdmly
dHVhbC9kbWkvaWQvcHJvZHVjdF91dWlkIGFzIGEgd2F5IHRvIHJlY29nbml6ZSBhIHZpcnR1YWwK
PiBtYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28gYXZhaWxhYmxlIHdoZW4gcnVubmluZyBvbiBYZW4g
SFZNIGFuZCBvbiBYZW4gUFYKPiBhbmQsIG9uIHRvcCBvZiB0aGF0IGRvZXNuJ3QgcmVxdWlyZSBy
b290IHByaXZpbGVnZXMgYnkgZGVmYXVsdC4KPiBMZXQncyBjcmVhdGUgYXJjaC1zcGVjaWZpYyBo
b29rcyBzbyB0aGF0IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzIGNhbgo+IHByb3ZpZGUgZGlmZmVy
ZW50IGltcGxlbWVudGF0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGaWxpcHBvIFNpcm9uaSA8
c2lyb25pQGFtYXpvbi5kZT4KPiAtLS0KPiB2MjoKPiAqIG1vdmUgdGhlIHJldHJpZXZhbCBvZiB0
aGUgVk0gVVVJRCBvdXQgb2YgdXVpZF9zaG93IGFuZCBpbnRvCj4gICBrdm1fcGFyYV9nZXRfdXVp
ZCwgd2hpY2ggaXMgYSB3ZWFrIGZ1bmN0aW9uIHRoYXQgY2FuIGJlIG92ZXJ3cml0dGVuCj4gCj4g
IGRyaXZlcnMvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMiArKwo+ICBkcml2ZXJzL01ha2VmaWxl
ICAgICAgICAgICAgIHwgIDIgKysKPiAgZHJpdmVycy9rdm0vS2NvbmZpZyAgICAgICAgICB8IDE0
ICsrKysrKysrKysrKysrCj4gIGRyaXZlcnMva3ZtL01ha2VmaWxlICAgICAgICAgfCAgMSArCj4g
IGRyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29yLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9LY29uZmlnCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2t2bS9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9rdm0vc3lzLWh5
cGVydmlzb3IuYwo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL0tjb25maWcgYi9kcml2ZXJzL0tj
b25maWcKPiBpbmRleCA0NWY5ZGVjYjk4NDguLjkwZWI4MzVmZTk1MSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL0tjb25maWcKPiArKysgYi9kcml2ZXJzL0tjb25maWcKPiBAQCAtMTQ2LDYgKzE0Niw4
IEBAIHNvdXJjZSAiZHJpdmVycy9odi9LY29uZmlnIgo+ICAKPiAgc291cmNlICJkcml2ZXJzL3hl
bi9LY29uZmlnIgo+ICAKPiArc291cmNlICJkcml2ZXJzL2t2bS9LY29uZmlnIgo+ICsKPiAgc291
cmNlICJkcml2ZXJzL3N0YWdpbmcvS2NvbmZpZyIKPiAgCj4gIHNvdXJjZSAiZHJpdmVycy9wbGF0
Zm9ybS9LY29uZmlnIgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL01ha2VmaWxlIGIvZHJpdmVycy9N
YWtlZmlsZQo+IGluZGV4IGM2MWNkZTU1NDM0MC4uNzljYzkyYTNmNmJmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL01ha2VmaWxlCj4gQEAgLTQ0LDYgKzQ0
LDggQEAgb2JqLXkJCQkJKz0gc29jLwo+ICBvYmotJChDT05GSUdfVklSVElPKQkJKz0gdmlydGlv
Lwo+ICBvYmotJChDT05GSUdfWEVOKQkJKz0geGVuLwo+ICAKPiArb2JqLSQoQ09ORklHX0tWTV9H
VUVTVCkJCSs9IGt2bS8KPiArCj4gICMgcmVndWxhdG9ycyBlYXJseSwgc2luY2Ugc29tZSBzdWJz
eXN0ZW1zIHJlbHkgb24gdGhlbSB0byBpbml0aWFsaXplCj4gIG9iai0kKENPTkZJR19SRUdVTEFU
T1IpCQkrPSByZWd1bGF0b3IvCj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2t2bS9LY29uZmln
IGIvZHJpdmVycy9rdm0vS2NvbmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMDAwLi4zZmMwNDFkZjdjMTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9r
dm0vS2NvbmZpZwo+IEBAIC0wLDAgKzEsMTQgQEAKPiArbWVudSAiS1ZNIGRyaXZlciBzdXBwb3J0
Igo+ICsgICAgICAgIGRlcGVuZHMgb24gS1ZNX0dVRVNUCj4gKwo+ICtjb25maWcgS1ZNX1NZU19I
WVBFUlZJU09SCj4gKyAgICAgICAgYm9vbCAiQ3JlYXRlIEtWTSBlbnRyaWVzIHVuZGVyIC9zeXMv
aHlwZXJ2aXNvciIKPiArICAgICAgICBkZXBlbmRzIG9uIFNZU0ZTCj4gKyAgICAgICAgc2VsZWN0
IFNZU19IWVBFUlZJU09SCj4gKyAgICAgICAgZGVmYXVsdCB5Cj4gKyAgICAgICAgaGVscAo+ICsg
ICAgICAgICAgQ3JlYXRlIEtWTSBlbnRyaWVzIHVuZGVyIC9zeXMvaHlwZXJ2aXNvciAoZS5nLiwg
dXVpZCkuIFdoZW4gcnVubmluZwo+ICsgICAgICAgICAgbmF0aXZlIG9yIG9uIGFub3RoZXIgaHlw
ZXJ2aXNvciwgL3N5cy9oeXBlcnZpc29yIG1heSBzdGlsbCBiZQo+ICsgICAgICAgICAgcHJlc2Vu
dCwgYnV0IGl0IHdpbGwgaGF2ZSBubyBLVk0gZW50cmllcy4KPiArCj4gK2VuZG1lbnUKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9rdm0vTWFrZWZpbGUgYi9kcml2ZXJzL2t2bS9NYWtlZmlsZQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43M2E0M2ZjOTk0YjkKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9rdm0vTWFrZWZpbGUKPiBAQCAtMCwwICsxIEBA
Cj4gK29iai0kKENPTkZJR19LVk1fU1lTX0hZUEVSVklTT1IpICs9IHN5cy1oeXBlcnZpc29yLm8K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYyBiL2RyaXZlcnMva3Zt
L3N5cy1oeXBlcnZpc29yLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uNDNiMWQxYTA5ODA3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMva3ZtL3N5
cy1oeXBlcnZpc29yLmMKPiBAQCAtMCwwICsxLDMwIEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wICovCj4gKwo+ICsjaW5jbHVkZSA8YXNtL2t2bV9wYXJhLmg+Cj4gKwo+
ICsjaW5jbHVkZSA8bGludXgva29iamVjdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4K
PiArCj4gK19fd2VhayBjb25zdCBjaGFyICprdm1fcGFyYV9nZXRfdXVpZCh2b2lkKQo+ICt7Cj4g
KwlyZXR1cm4gTlVMTDsKPiArfQo+ICsKPiArc3RhdGljIHNzaXplX3QgdXVpZF9zaG93KHN0cnVj
dCBrb2JqZWN0ICpvYmosCj4gKwkJCSBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgKmF0dHIsCj4gKwkJ
CSBjaGFyICpidWYpCj4gK3sKPiArCWNvbnN0IGNoYXIgKnV1aWQgPSBrdm1fcGFyYV9nZXRfdXVp
ZCgpOwoKSSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSBrdm1fcGFyYV9nZXRfdXVpZCByZXR1cm4gYSB1
dWlkX3QKYnV0IGNoYXIgKiB3aWxsIHByb2JhYmx5IHdvcmsgb3V0IGFzIHdlbGwuCgoKPiArCXJl
dHVybiBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCB1dWlkKTsKPiArfQo+ICsKPiArc3RhdGljIHN0cnVj
dCBrb2JqX2F0dHJpYnV0ZSB1dWlkID0gX19BVFRSX1JPKHV1aWQpOwo+ICsKPiArc3RhdGljIGlu
dCBfX2luaXQgdXVpZF9pbml0KHZvaWQpCj4gK3sKPiArCWlmICgha3ZtX3BhcmFfYXZhaWxhYmxl
KCkpCgpJc250IGt2bV9wYXJhX2F2YWlsYWJsZSBhIGZ1bmN0aW9uIHRoYXQgaXMgZGVmaW5lZCBp
biB0aGUgY29udGV4dCBvZiB0aGUgSE9TVAphbmQgbm90IG9mIHRoZSBndWVzdD8KCj4gKwkJcmV0
dXJuIDA7Cj4gKwlyZXR1cm4gc3lzZnNfY3JlYXRlX2ZpbGUoaHlwZXJ2aXNvcl9rb2JqLCAmdXVp
ZC5hdHRyKTsKPiArfQo+ICsKPiArZGV2aWNlX2luaXRjYWxsKHV1aWRfaW5pdCk7Cj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
