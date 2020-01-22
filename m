Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5C1453D5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 12:30:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuEBo-0007Q6-2g; Wed, 22 Jan 2020 11:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuEBm-0007Q0-Rp
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 11:28:50 +0000
X-Inumbo-ID: 5ceb566a-3d0a-11ea-bc21-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ceb566a-3d0a-11ea-bc21-12813bfff9fa;
 Wed, 22 Jan 2020 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579692531; x=1611228531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d/YModsPhc7Zf54nAbrqKMcqjH9nYb6YvSYnjuy9M84=;
 b=WMc7d6r/cSQqSRg9LWwseiiWdO5vXQ5V/2tp/T29aD12PJgSt21vL9KD
 1BDJzmtPCY0IJLjMhiTsnKuOZ8sQHR7yvJaZGzlJHKYEjWLCzESbxp3EF
 xGHd0qy5qB7CvsoyQlI4wXl9HQb/rKPndRABCDTj2mVU41ijaAvNysMyy s=;
IronPort-SDR: GlPvwjRhpVirXfeMJmofKjlgzBVrEUkLYCaaS3mcD30zSFzCZs5ejgyCocZkOxWHWiVB+PvFfH
 d3PyK2YlPZSA==
X-IronPort-AV: E=Sophos;i="5.70,349,1574121600"; d="scan'208";a="13589009"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 22 Jan 2020 11:28:50 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2DBA2A2E7F; Wed, 22 Jan 2020 11:28:43 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 11:28:43 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 11:28:42 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 22 Jan 2020 11:28:42 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/9] xen: split parameter related definitions in own
 header file
Thread-Index: AQHV0DbnjrrCG2wpY02O+XecvS7rsaf2jYfQ
Date: Wed, 22 Jan 2020 11:28:42 +0000
Message-ID: <8443db3098514936afb828410279c4b7@EX13D32EUC003.ant.amazon.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-3-jgross@suse.com>
In-Reply-To: <20200121084330.18309-3-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/9] xen: split parameter related
 definitions in own header file
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPiBTZW50OiAyMSBKYW51YXJ5IDIwMjAgMDg6NDMKPiBUbzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFZvbG9keW15ciBCYWJjaHVrCj4gPFZvbG9keW15cl9C
YWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47Cj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgSWFuIEph
Y2tzb24KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT47IEtvbnJhZAo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdQo+IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKdW4K
PiBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPjsKPiBMdWthc3ogSGF3cnlsa28gPGx1a2Fzei5oYXdyeWxrb0BsaW51eC5p
bnRlbC5jb20+OyBDaHJpc3RvcGhlciBDbGFyawo+IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWls
LmNvbT47IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Owo+IERhbmllbCBEZSBH
cmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pgo+IFN1YmplY3Q6IFtQQVRDSCB2MyAyLzldIHhl
bjogc3BsaXQgcGFyYW1ldGVyIHJlbGF0ZWQgZGVmaW5pdGlvbnMgaW4gb3duCj4gaGVhZGVyIGZp
bGUKPiAKPiBNb3ZlIHRoZSBwYXJhbWV0ZXIgcmVsYXRlZCBkZWZpbml0aW9ucyBmcm9tIGluaXQu
aCBpbnRvIGEgbmV3IGhlYWRlcgo+IGZpbGUgcGFyYW0uaC4gVGhpcyB3aWxsIGF2b2lkIGluY2x1
ZGUgaGVsbCB3aGVuIG5ldyBkZXBlbmRlbmNpZXMgYXJlCj4gYWRkZWQgdG8gcGFyYW1ldGVyIGRl
ZmluaXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KCkFja2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
