Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F286218A
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 02:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684908.1065332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYN-0005hA-NG; Sat, 24 Feb 2024 01:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684908.1065332; Sat, 24 Feb 2024 01:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYN-0005eY-IR; Sat, 24 Feb 2024 01:10:11 +0000
Received: by outflank-mailman (input) for mailman id 684908;
 Fri, 23 Feb 2024 16:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Fpr=KA=thalesgroup.com=francois.gourlot@srs-se1.protection.inumbo.net>)
 id 1rdXyQ-0004dh-0M
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 16:00:30 +0000
Received: from esa.hc1631-21.eu.iphmx.com (esa.hc1631-21.eu.iphmx.com
 [23.90.123.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e37864-d264-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 17:00:28 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a8e37864-d264-11ee-8a57-1f161083a0e0
X-CSE-ConnectionGUID: ns9mFFqhT8efsREh8IYF0A==
X-CSE-MsgGUID: akeB61nrR06bBgRBcUwKNA==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="10596996"
X-IronPort-AV: E=Sophos;i="6.06,180,1705359600"; 
   d="png'150?scan'150,208,217,150";a="10596996"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1708704026;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=HIH+zALnBEStBj4jTN0n0a9LiBx35tTeOyR+6u0KA6M=;
  b=uHwVve4K7HesYakkllLUouQj39amCtpjmot6/rh9bnUOFaVW94C5n5Rp
   jQPksz8mvkGPxh+tZNh23LTaq4z1ZYuLBQo1N/3n5qMoDy1IU2mMrMN0W
   nwfe2ENd2E5p7M0r+NzWaNzO116GhWNV6+dt6TlE+fS8t2BWbyu3X9KeY
   QnBfl0Vph+GtKHrzQ4qiCVS2idx4A/LytGoiUr5srLDR3g13OMQZBARPp
   zerEgDmO+MAJVcRb92o3TB1QAuT9jr8PtX+gc7e0jEMvyxELy12dONrP7
   z1jz4diqPvrpE4LcrQ7yy8sGinwImIvoy7A/LduXWTavwYJAd59jwQvUv
   g==;
X-CSE-ConnectionGUID: WduDQ+O/S+atuga8foMxZQ==
X-CSE-MsgGUID: h9z/sXUhQTabfJYcWFx/WQ==
X-CSE-ConnectionGUID: b3aEZtJ9Q1qoDqsXTBngcw==
X-CSE-MsgGUID: ZIthwiM0Qu6IIVWfBkuCfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="18692764"
X-IronPort-AV: E=Sophos;i="6.06,180,1705359600"; 
   d="png'150?scan'150,208,217,150";a="18692764"
From: GOURLOT Francois <francois.gourlot@thalesgroup.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Kelly Choi <kelly.choi@cloud.com>
Subject: IMPORTANT - : Need help on USB port virtualization with Xen
 hypervisor
Thread-Topic: IMPORTANT - : Need help on USB port virtualization with Xen
 hypervisor
Thread-Index: AdpmcWIlf+ro0u5NSE2ZDRGqfQbNXA==
Sensitivity: company-confidential
Date: Fri, 23 Feb 2024 16:00:24 +0000
Message-ID: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-exchange-nodisclaimer: 0
Content-Type: multipart/related;
	boundary="_004_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_";
	type="multipart/alternative"
MIME-Version: 1.0

--_004_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_
Content-Type: multipart/alternative;
	boundary="_000_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_"

--_000_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBBbGwsDQoNCldlIHNlbmQgeW91IGEgbWVzc2FnZSBmZXcgZGF5cyBhZ28uDQoNCldlIGhh
dmUgbWFqb3IgcGVyZm9ybWFuY2Ugd2l0aCBYRU4gVVNCIERyaXZlcnMuIFdlIHVzZSB5b3VyIGRy
aXZlciB0byBsb2FkIGRhdGEgaW4gYSBkZXZpY2UgYW5kIHdlIG5lZWQgVVNCMyBIaWdoIFNwZWVk
IFVTQiBwcm90b2NvbGUNCg0KRG8geW91IGhhdmUgYSBuZXcgaXNzdWUgb2YgdGhlIEhDSSBhbmQg
TkVDIFVTQiBYZW4gRHJpdmVyID8NCg0KV2UgaG9wZSB5b3Ugd2lsbCBjb250YWN0IHVzIHF1aWNr
bHkuDQoNCkJlc3QgcmVnYXJkcw0KDQpQcm9ncmFtIE1hbmFnZXINCg0KVGhhbGVzIFNJWCBHVFMg
RnJhbmNlDQoNClQ6ICszMygwKSAxIDQxIDMwIDI2IDY3DQpNOiArMzMgKDApIDYgODUgMjMgMTIg
MzANCg0KNCBBdmVudWUgZGVzIExvdXZyZXNzZXMNCjkyNjIyIEdlbm5ldmlsbGllcnMNCkZyYW5j
ZQ0KDQoNCg0KDQoNCg0KRGUgOiBMQVJSSUVVIERvbWluaXF1ZSA8ZG9taW5pcXVlLmxhcnJpZXVA
dGhhbGVzZ3JvdXAuY29tPg0KRW52b3nDqSA6IGpldWRpIDIyIGbDqXZyaWVyIDIwMjQgMTM6NTgN
CsOAIDogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQpDYyA6IFdJTExFTVMgTG91aXMg
PGxvdWlzLndpbGxlbXNAdGhhbGVzZ3JvdXAuY29tPjsgR1JVTyBOaWNvbGFzIDxuaWNvbGFzLW4u
Z3J1b0B0aGFsZXNncm91cC5jb20+OyBHT1VSTE9UIEZyYW5jb2lzIDxmcmFuY29pcy5nb3VybG90
QHRoYWxlc2dyb3VwLmNvbT47IEtlbGx5IENob2kgPGtlbGx5LmNob2lAY2xvdWQuY29tPg0KT2Jq
ZXQgOiBOZWVkIGhlbHAgb24gVVNCIHBvcnQgdmlydHVhbGl6YXRpb24gd2l0aCBYZW4gaHlwZXJ2
aXNvcg0KQ3JpdMOocmUgZGUgZGlmZnVzaW9uIDogQ29uZmlkZW50aWVsDQoNCkRlYXIgYWxsLA0K
DQpXZSBhcmUgZGV0ZWN0aW5nIHNldmVyYWwgaXNzdWVzIHdpdGggVVNCIHBvcnQgdmlydHVhbGl6
YXRpb24gd2l0aCB0aGUgWGVuIGh5cGVydmlzb3IuDQotIFdlIGNhbm5vdCBkbyBQQ0kgcGFzc3Ro
cm91Z2ggb2YgdGhlIFBDSSB1c2IgYnVzIG9uIGEgV2luZG93cyAxMCAxNjA3IDY0LWJpdCB2aXJ0
dWFsIG1hY2hpbmUuIFRoZSBiYWQgcmVzdWx0IGlzIGEgV2luZG93cyBibHVlIHNjcmVlbi4NCi0g
V2hlbiB3ZSB1c2UgdGhlIHBhc3N0aHJvdWdoIGZ1bmN0aW9uYWxpdHkgb24gYSBXaW5kb3dzIDIx
SDIgdmlydHVhbCBtYWNoaW5lLCB3ZSBub3RpY2UgdGhhdCB0aGUgc3BlZWQgb2YgdGhlIFVTQiBw
b3J0IGlzIG5vdCBoaWdoIHNwZWVkIGJ1dCBmdWxsIHNwZWVkIG9uIGEgVVNCIDMuMCBwb3J0DQot
IFdlIG5vdGljZSBpbnN0YWJpbGl0aWVzIHdoZW4gdXNpbmcgdGhlIG5lYy11c2IteGhjaSBkcml2
ZXIsICBVU0IgMi4wIGtleXMgYXJlIG5vdCByZWNvZ25pemVkIGJ5IHRoZSBXaW5kb3dzIHZpcnR1
YWwgbWFjaGluZSAoaW5jb3JyZWN0IGRlc2NyaXB0b3IpDQoNCldlIG5lZWQgeW91ciBoZWxwIHRv
IGZpbmQgYSBzb2x1dGlvbiBmb3IgdGhlc2UgcHJvYmxlbXMuDQoNClRoZSBTb2Z0d2FyZSB1c2Vk
IGFyZSA6DQoNCi0gICAgICAgIERlYmlhbiAxMSB2ZXJzaW9uIDUuMTAuMC0yMA0KDQotICAgICAg
ICBYZW4gdmVyc2lvbiA0LjE0DQoNCi0gICAgICAgIFdpbmRvd3MgMTAgMTYwNyBhbmQgMjFIMiBm
b3IgdmlydHVhbCBtYWNoaW5lcy4gVmlydHVhbCBNYWNoaW5lIEhWTQ0KDQpUaGFua3MgaW4gYWR2
YW5jZSBmb3IgeW91ciBoZWxwLg0KDQpCZXN0IHJlZ2FyZHMsDQoNCg0KDQoNCkRvbWluaXF1ZSBM
QVJSSUVVDQoNCkN5YmVyIFByb2plY3QgTWFuYWdlcg0KDQpUaGFsZXMNCg0KDQo0LCBhdmVudWUg
ZGVzIExvdXZyZXNzZXMNCjkyMjMwIEdlbm5ldmlsbGllcnMsIEZyYW5jZQ0KDQpbY2lkOmltYWdl
MDAxLnBuZ0AwMUQ3RTFERS43Nzg2MkJCMF0NCg0KUmV0cm91dmV6IFRoYWxlcyBzdXIgbGVzIHLD
qXNlYXV4IHNvY2lhdXggZXQgc3VyIHd3dy50aGFsZXNncm91cC5jb208aHR0cHM6Ly93d3cudGhh
bGVzZ3JvdXAuY29tLz4NCg0KDQoNCg0KDQoNCg==

--_000_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPCEtLVtp
ZiAhbXNvXT48c3R5bGU+dlw6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kb1w6KiB7
YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kd1w6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0
I1ZNTCk7fQ0KLnNoYXBlIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9DQo8L3N0eWxlPjwh
W2VuZGlmXS0tPjxzdHlsZT48IS0tDQovKiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNl
DQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYg
MyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIg
MTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1h
bCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowY207DQoJbWFyZ2luLWJv
dHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IlRpbWVzIE5l
dyBSb21hbiIsc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUt
cHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30N
CmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28tc3R5bGUtcHJpb3Jp
dHk6OTk7DQoJY29sb3I6cHVycGxlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5t
c29ub3JtYWwwLCBsaS5tc29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFt
ZTptc29ub3JtYWw7DQoJbXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBj
bTsNCgltc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowY207DQoJZm9u
dC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9DQpw
LmdtYWlsLXAxLCBsaS5nbWFpbC1wMSwgZGl2LmdtYWlsLXAxDQoJe21zby1zdHlsZS1uYW1lOmdt
YWlsLXAxOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowY207DQoJ
bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGNtOw0KCWZvbnQtc2l6
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IlRpbWVzIE5ldyBSb21hbiIsc2VyaWY7fQ0KcC5tMzg2
MzUwMjE2NDQyOTQ5MTA2bXNvbGlzdHBhcmFncmFwaCwgbGkubTM4NjM1MDIxNjQ0Mjk0OTEwNm1z
b2xpc3RwYXJhZ3JhcGgsIGRpdi5tMzg2MzUwMjE2NDQyOTQ5MTA2bXNvbGlzdHBhcmFncmFwaA0K
CXttc28tc3R5bGUtbmFtZTptXzM4NjM1MDIxNjQ0Mjk0OTEwNm1zb2xpc3RwYXJhZ3JhcGg7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBjbTsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowY207DQoJZm9udC1zaXplOjEyLjBwdDsN
Cglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUy
MA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fu
cy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCnNwYW4uRW1haWxTdHlsZTIxDQoJe21zby1zdHls
ZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
Ow0KCWNvbG9yOiMxRjQ5N0Q7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhw
b3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6
ZTo2MTIuMHB0IDc5Mi4wcHQ7DQoJbWFyZ2luOjcwLjg1cHQgNzAuODVwdCA3MC44NXB0IDcwLjg1
cHQ7fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxl
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIg
c3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48
eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQi
IGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+
DQo8Ym9keSBsYW5nPSJGUiIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNz
PSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMi
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDss
c2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEO21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj5EZWFy
IEFsbCw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBs
YW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2Fs
aWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6
RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTom
cXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RDttc28tZmFyZWFzdC1s
YW5ndWFnZTpFTi1VUyI+V2Ugc2VuZCB5b3UgYSBtZXNzYWdlIGZldyBkYXlzIGFnby48bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIg
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90Oyxz
YW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9
IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJp
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1V
UyI+V2UgaGF2ZSBtYWpvciBwZXJmb3JtYW5jZSB3aXRoIFhFTiBVU0IgRHJpdmVycy4gV2UgdXNl
IHlvdXIgZHJpdmVyIHRvIGxvYWQgZGF0YSBpbiBhIGRldmljZSBhbmQgd2UgbmVlZCBVU0IzIEhp
Z2ggU3BlZWQNCiBVU0IgcHJvdG9jb2xlPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2Zv
bnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEO21z
by1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMx
RjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPkRvIHlvdSBoYXZlIGEgbmV3IGlzc3Vl
IG9mIHRoZSBIQ0kgYW5kIE5FQyBVU0IgWGVuIERyaXZlciA/PG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xv
cjojMUY0OTdEO21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmO2NvbG9yOiMxRjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPldlIGhvcGUgeW91
IHdpbGwgY29udGFjdCB1cyBxdWlja2x5LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RDtt
c28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjoj
MUY0OTdEO21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj5CZXN0IHJlZ2FyZHM8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5z
LXNlcmlmO2NvbG9yOiMxRjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9zcGFuPjwvcD4NCjx0YWJsZSBjbGFzcz0iTXNvTm9ybWFsVGFibGUiIGJvcmRl
cj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIiBzdHlsZT0iYm9yZGVyLWNvbGxh
cHNlOmNvbGxhcHNlIj4NCjx0Ym9keT4NCjx0cj4NCjx0ZCB3aWR0aD0iNDcyIiB2YWxpZ249InRv
cCIgc3R5bGU9IndpZHRoOjM2MC4wcHQ7cGFkZGluZzozLjBwdCAwY20gMS41cHQgMGNtIj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQt
ZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izc5Nzk3OSI+UHJvZ3Jh
bSBNYW5hZ2VyPG86cD48L286cD48L3NwYW4+PC9iPjwvcD4NCjwvdGQ+DQo8L3RyPg0KPHRyPg0K
PHRkIHdpZHRoPSI0NzIiIHZhbGlnbj0idG9wIiBzdHlsZT0id2lkdGg6MzYwLjBwdDtwYWRkaW5n
Oi43NXB0IDBjbSAuNzVwdCAwY20iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1z
ZXJpZjtjb2xvcjojNzk3OTc5Ij5UaGFsZXMgU0lYIEdUUyBGcmFuY2U8bzpwPjwvbzpwPjwvc3Bh
bj48L2I+PC9wPg0KPC90ZD4NCjwvdHI+DQo8dHIgc3R5bGU9ImhlaWdodDoyLjVwdCI+DQo8dGQg
d2lkdGg9IjQ3MiIgdmFsaWduPSJ0b3AiIHN0eWxlPSJ3aWR0aDozNjAuMHB0O3BhZGRpbmc6Ljc1
cHQgMGNtIDcuNXB0IDBjbTtoZWlnaHQ6Mi41cHQiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDss
c2Fucy1zZXJpZjtjb2xvcjojNzk3OTc5Ij5UOiAmIzQzOzMzKDApIDEgNDEgMzAgMjYgNjc8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2Nv
bG9yOiM3OTc5NzkiPk06ICYjNDM7MzMgKDApIDYgODUgMjMgMTIgMzA8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8L3RkPg0KPC90cj4NCjx0ciBzdHlsZT0iaGVpZ2h0OjMuMHB0Ij4NCjx0ZCB3aWR0
aD0iNDcyIiB2YWxpZ249InRvcCIgc3R5bGU9IndpZHRoOjM2MC4wcHQ7Ym9yZGVyOm5vbmU7Ym9y
ZGVyLXRvcDpzb2xpZCAjMDBCQkREIDIuMjVwdDtwYWRkaW5nOjcuNXB0IDBjbSAzLjc1cHQgMGNt
O2hlaWdodDozLjBwdCI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9y
OiM3OTc5NzkiPjQgQXZlbnVlIGRlcyBMb3V2cmVzc2VzPG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojNzk3OTc5Ij45MjYyMiBH
ZW5uZXZpbGxpZXJzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVv
dDssc2Fucy1zZXJpZjtjb2xvcjojNzk3OTc5Ij5GcmFuY2U8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L3RkPg0KPC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZx
dW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDss
c2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEO21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6IzFGNDk3RDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlm
O2NvbG9yOiMxRjQ5N0Q7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xv
cjojMUY0OTdEO21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RDtt
c28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0K
PGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAx
LjBwdDtwYWRkaW5nOjMuMHB0IDBjbSAwY20gMGNtIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkm
cXVvdDssc2Fucy1zZXJpZiI+RGUmbmJzcDs6PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPiBM
QVJSSUVVIERvbWluaXF1ZSAmbHQ7ZG9taW5pcXVlLmxhcnJpZXVAdGhhbGVzZ3JvdXAuY29tJmd0
Ow0KPGJyPg0KPGI+RW52b3nDqSZuYnNwOzo8L2I+IGpldWRpIDIyIGbDqXZyaWVyIDIwMjQgMTM6
NTg8YnI+DQo8Yj7DgCZuYnNwOzo8L2I+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzxi
cj4NCjxiPkNjJm5ic3A7OjwvYj4gV0lMTEVNUyBMb3VpcyAmbHQ7bG91aXMud2lsbGVtc0B0aGFs
ZXNncm91cC5jb20mZ3Q7OyBHUlVPIE5pY29sYXMgJmx0O25pY29sYXMtbi5ncnVvQHRoYWxlc2dy
b3VwLmNvbSZndDs7IEdPVVJMT1QgRnJhbmNvaXMgJmx0O2ZyYW5jb2lzLmdvdXJsb3RAdGhhbGVz
Z3JvdXAuY29tJmd0OzsgS2VsbHkgQ2hvaSAmbHQ7a2VsbHkuY2hvaUBjbG91ZC5jb20mZ3Q7PGJy
Pg0KPGI+T2JqZXQmbmJzcDs6PC9iPiBOZWVkIGhlbHAgb24gVVNCIHBvcnQgdmlydHVhbGl6YXRp
b24gd2l0aCBYZW4gaHlwZXJ2aXNvcjxicj4NCjxiPkNyaXTDqHJlIGRlIGRpZmZ1c2lvbiZuYnNw
Ozo8L2I+IENvbmZpZGVudGllbDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9kaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8Ymxv
Y2txdW90ZSBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBw
dDtwYWRkaW5nOjBjbSAwY20gMGNtIDYuMHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi10b3A6
NS4wcHQ7bWFyZ2luLXJpZ2h0OjBjbTttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxkaXY+DQo8ZGl2
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6
YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gc3R5bGU9ImNvbG9yOiMxRjQ5
N0QiPkRlYXIgYWxsLDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
IHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0
byI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10
b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIGxhbmc9IkVOLVVT
IiBzdHlsZT0iY29sb3I6IzJGNTQ5NiI+V2UgYXJlIGRldGVjdGluZzwvc3Bhbj48c3BhbiBsYW5n
PSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMwMEIwNTAiPg0KPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVT
IiBzdHlsZT0iY29sb3I6IzJGNTQ5NiI+c2V2ZXJhbCBpc3N1ZXMgd2l0aCBVU0IgcG9ydCB2aXJ0
dWFsaXphdGlvbiB3aXRoDQo8L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjoj
MUY0OTdEIj50aGUgWGVuIGh5cGVydmlzb3I8L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxl
PSJjb2xvcjojMkY1NDk2Ij4uPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFs
dDphdXRvO21hcmdpbi1sZWZ0OjM1LjRwdCI+DQo8c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImNv
bG9yOiMyRjU0OTYiPi0gV2UgY2Fubm90IGRvIFBDSSBwYXNzdGhyb3VnaCBvZiB0aGUgUENJIHVz
YiBidXMgb24gYSBXaW5kb3dzIDEwIDE2MDcgNjQtYml0IHZpcnR1YWwgbWFjaGluZTwvc3Bhbj48
c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPi4NCjwvc3Bhbj48c3BhbiBs
YW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMyRjU0OTYiPlRoZSBiYWQgcmVzdWx0IGlzIGEgV2lu
ZG93cyBibHVlIHNjcmVlbi48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0
OmF1dG87bWFyZ2luLWxlZnQ6MzUuNHB0Ij4NCjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iY29s
b3I6IzJGNTQ5NiI+LSBXaGVuIHdlIHVzZSB0aGUgcGFzc3Rocm91Z2ggZnVuY3Rpb25hbGl0eSBv
biBhIFdpbmRvd3MgMjFIMiB2aXJ0dWFsIG1hY2hpbmUsIHdlIG5vdGljZSB0aGF0PC9zcGFuPjxz
cGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iY29sb3I6IzAwQjA1MCI+DQo8L3NwYW4+PHNwYW4gbGFu
Zz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMkY1NDk2Ij50aGUgc3BlZWQgb2YgdGhlIFVTQiBwb3J0
IGlzIG5vdCBoaWdoIHNwZWVkIGJ1dCBmdWxsIHNwZWVkIG9uIGEgVVNCIDMuMCBwb3J0PC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4t
dG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvO21hcmdpbi1sZWZ0OjM1LjRw
dCI+DQo8c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMyRjU0OTYiPi0gV2Ugbm90aWNl
IGluc3RhYmlsaXRpZXMgd2hlbiB1c2luZyB0aGUgbmVjLXVzYi14aGNpIGRyaXZlciwgJm5ic3A7
VVNCIDIuMCBrZXlzIGFyZSBub3QgcmVjb2duaXplZCBieSB0aGUgV2luZG93cyB2aXJ0dWFsIG1h
Y2hpbmUgKGluY29ycmVjdCBkZXNjcmlwdG9yKTwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMUY0OTdE
Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxz
cGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iY29sb3I6IzJGNTQ5NiI+V2UNCjwvc3Bhbj48c3BhbiBs
YW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPm5lZWQ8L3NwYW4+PHNwYW4gbGFuZz0i
RU4tVVMiIHN0eWxlPSJjb2xvcjojMDBCMDUwIj4NCjwvc3Bhbj48c3BhbiBsYW5nPSJFTi1VUyIg
c3R5bGU9ImNvbG9yOiMyRjU0OTYiPnlvdXIgPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHls
ZT0iY29sb3I6IzFGNDk3RCI+aGVscDwvc3Bhbj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImNv
bG9yOiMyRjU0OTYiPiB0byBmaW5kIGEgc29sdXRpb24gZm9yIHRoZXNlIHByb2JsZW1zLjwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2lu
LXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gbGFuZz0iRU4t
VVMiIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1h
cmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iY29sb3I6IzFG
NDk3RCI+VGhlIFNvZnR3YXJlIHVzZWQgYXJlIDoNCjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJtMzg2MzUwMjE2NDQyOTQ5MTA2bXNvbGlzdHBhcmFncmFwaCI+PHNwYW4gbGFuZz0i
RU4tVVMiIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4tPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVTIiBz
dHlsZT0iZm9udC1zaXplOjcuMHB0O2NvbG9yOiMxRjQ5N0QiPiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOw0KPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0i
Y29sb3I6IzJGNTQ5NiI+RGViaTwvc3Bhbj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9y
OiMxRjQ5N0QiPmE8L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMkY1NDk2
Ij5uIDExIHZlcnNpb248L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMUY0
OTdEIj4NCjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+NS4xMC4wLTIwPC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Im0zODYzNTAyMTY0NDI5NDkxMDZtc29saXN0cGFy
YWdyYXBoIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPi08L3NwYW4+
PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6Ny4wcHQ7Y29sb3I6IzFGNDk3RCI+
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7DQo8L3NwYW4+PHNwYW4g
bGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMkY1NDk2Ij5YZW4gdmVyc2lvbjwvc3Bhbj48c3Bh
biBsYW5nPSJFTi1VUyIgc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPg0KPC9zcGFuPjxzcGFuIHN0eWxl
PSJjb2xvcjojMUY0OTdEIj40LjE0PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Im0z
ODYzNTAyMTY0NDI5NDkxMDZtc29saXN0cGFyYWdyYXBoIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5
bGU9ImNvbG9yOiMxRjQ5N0QiPi08L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250
LXNpemU6Ny4wcHQ7Y29sb3I6IzFGNDk3RCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7DQo8L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMkY1
NDk2Ij5XaW5kb3dzIDEwIDE2MDcgYW5kIDIxSDIgZm9yIHZpcnR1YWwgbWFjaGluZXMuIFZpcnR1
YWwgTWFjaGluZSBIVk08L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG8iPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+Jm5ic3A7PC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4t
dG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48c3BhbiBsYW5nPSJFTi1V
UyIgc3R5bGU9ImNvbG9yOiMyRjU0OTYiPlRoYW5rcyBpbiBhZHZhbmNlPC9zcGFuPjxzcGFuIGxh
bmc9IkVOLVVTIiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+IGZvciB5b3VyIGhlbHAuPC9zcGFuPjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9w
LWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48c3BhbiBsYW5nPSJFTi1VUyIg
c3R5bGU9ImNvbG9yOiMxRjQ5N0QiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJjb2xvcjojMUY0OTdE
Ij5CZXN0IHJlZ2FyZHMsPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHRhYmxlIGNsYXNzPSJNc29O
b3JtYWxUYWJsZSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiIHN0
eWxlPSJib3JkZXItY29sbGFwc2U6Y29sbGFwc2UiPg0KPHRib2R5Pg0KPHRyPg0KPHRkIHdpZHRo
PSI0NjMiIHZhbGlnbj0idG9wIiBzdHlsZT0id2lkdGg6MzYwLjBwdDtib3JkZXI6bm9uZTtib3Jk
ZXItYm90dG9tOnNvbGlkICNCRkJGQkYgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMS41cHQgMGNt
Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bztt
c28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4w
cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMjQyQTc1
Ij4mbmJzcDs8L3NwYW4+PC9iPjxvOnA+PC9vOnA+PC9wPg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8
dGQgd2lkdGg9IjQ2MyIgdmFsaWduPSJ0b3AiIHN0eWxlPSJ3aWR0aDozNjAuMHB0O3BhZGRpbmc6
My4wcHQgMGNtIDEuNXB0IDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1h
cmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6IzI0MkE3NSI+Jm5ic3A7PC9zcGFuPjwvYj48bzpwPjwvbzpwPjwvcD4NCjwv
dGQ+DQo8L3RyPg0KPHRyPg0KPHRkIHdpZHRoPSI0NjMiIHZhbGlnbj0idG9wIiBzdHlsZT0id2lk
dGg6MzYwLjBwdDtwYWRkaW5nOjMuMHB0IDBjbSAxLjVwdCAwY20iPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFs
dDphdXRvIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtmb250LWZhbWlseTomcXVv
dDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMyNDJBNzUiPkRvbWluaXF1ZSBMQVJSSUVV
DQo8L3NwYW4+PC9iPjxvOnA+PC9vOnA+PC9wPg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgd2lk
dGg9IjQ2MyIgdmFsaWduPSJ0b3AiIHN0eWxlPSJ3aWR0aDozNjAuMHB0O3BhZGRpbmc6Ljc1cHQg
MGNtIC43NXB0IDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10
b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7
Y29sb3I6Izc5Nzk3OSI+Q3liZXIgUHJvamVjdCBNYW5hZ2VyPC9zcGFuPjwvYj48bzpwPjwvbzpw
PjwvcD4NCjwvdGQ+DQo8L3RyPg0KPHRyIHN0eWxlPSJoZWlnaHQ6MTcuNTVwdCI+DQo8dGQgd2lk
dGg9IjQ2MyIgdmFsaWduPSJ0b3AiIHN0eWxlPSJ3aWR0aDozNjAuMHB0O3BhZGRpbmc6Ljc1cHQg
MGNtIDcuNXB0IDBjbTtoZWlnaHQ6MTcuNTVwdCI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1
b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izc5Nzk3OSI+VGhhbGVzPC9zcGFuPjwvYj48bzpwPjwvbzpw
PjwvcD4NCjwvdGQ+DQo8L3RyPg0KPHRyIHN0eWxlPSJoZWlnaHQ6Ljg1cHQiPg0KPHRkIHdpZHRo
PSI0NjMiIHZhbGlnbj0idG9wIiBzdHlsZT0id2lkdGg6MzYwLjBwdDtib3JkZXI6bm9uZTtib3Jk
ZXItdG9wOnNvbGlkICMwMEJCREQgMi4yNXB0O3BhZGRpbmc6Ny41cHQgMGNtIDMuNzVwdCAwY207
aGVpZ2h0Oi44NXB0Ij4NCjwvdGQ+DQo8L3RyPg0KPHRyIHN0eWxlPSJoZWlnaHQ6My4wcHQiPg0K
PHRkIHdpZHRoPSI0NjMiIHZhbGlnbj0idG9wIiBzdHlsZT0id2lkdGg6MzYwLjBwdDtwYWRkaW5n
OjMuNzVwdCAwY20gNy41cHQgMGNtO2hlaWdodDozLjBwdCI+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFs
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izc5Nzk3OSI+NCwgYXZlbnVlIGRlcyBMb3V2cmVzc2Vz
DQo8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNv
LW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6Izc5Nzk3OSI+OTIyMzAgR2VubmV2aWxsaWVycywgRnJhbmNlPC9zcGFuPjxv
OnA+PC9vOnA+PC9wPg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgd2lkdGg9IjQ2MyIgdmFsaWdu
PSJ0b3AiIHN0eWxlPSJ3aWR0aDozNjAuMHB0O2JvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQg
IzAwQkJERCAyLjI1cHQ7cGFkZGluZzoxMS4yNXB0IDBjbSAzLjBwdCAwY20iPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90
dG9tLWFsdDphdXRvIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtmb250LWZhbWlseTom
cXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM3OTc2NzYiPjxpbWcgd2lkdGg9IjE2
MCIgaGVpZ2h0PSIzNiIgc3R5bGU9IndpZHRoOjEuNjY2NmluO2hlaWdodDouMzc1aW4iIGlkPSJt
XzM4NjM1MDIxNjQ0Mjk0OTEwNkltYWdlX3gwMDIwXzEiIHNyYz0iY2lkOmltYWdlMDAxLnBuZ0Aw
MURBNjY3OS41ODQ0QTJBMCIgYWx0PSJjaWQ6aW1hZ2UwMDEucG5nQDAxRDdFMURFLjc3ODYyQkIw
Ij48L3NwYW4+PG86cD48L286cD48L3A+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCB3aWR0aD0i
NDYzIiB2YWxpZ249InRvcCIgc3R5bGU9IndpZHRoOjM2MC4wcHQ7cGFkZGluZzo1LjI1cHQgMGNt
IDUuMjVwdCAwY20iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9w
LWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48Yj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjkuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29s
b3I6Izc5NzY3NiI+UmV0cm91dmV6IFRoYWxlcyBzdXIgbGVzIHLDqXNlYXV4IHNvY2lhdXggZXQg
c3VyDQo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OS4wcHQ7Zm9udC1mYW1pbHk6
JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojNzk3Njc2Ij48YSBocmVmPSJodHRw
czovL3d3dy50aGFsZXNncm91cC5jb20vIiB0YXJnZXQ9Il9ibGFuayI+d3d3LnRoYWxlc2dyb3Vw
LmNvbTwvYT48L3NwYW4+PG86cD48L286cD48L3A+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCB3
aWR0aD0iNDYzIiB2YWxpZ249InRvcCIgc3R5bGU9IndpZHRoOjM2MC4wcHQ7cGFkZGluZzo1LjI1
cHQgMGNtIDUuMjVwdCAwY20iPg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgd2lkdGg9IjQ2MyIg
dmFsaWduPSJ0b3AiIHN0eWxlPSJ3aWR0aDozNjAuMHB0O3BhZGRpbmc6MTAuNXB0IDBjbSAxMC41
cHQgMGNtIj4NCjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4NCjwvdGFibGU+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20t
YWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0
OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0
OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBz
dHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8i
PjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjwvZGl2Pg0K
PC9ib2R5Pg0KPC9odG1sPg0K

--_000_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_--

--_004_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=3376;
	creation-date="Fri, 23 Feb 2024 16:00:24 GMT";
	modification-date="Fri, 23 Feb 2024 16:00:24 GMT"
Content-ID: <image001.png@01DA6679.5844A2A0>
Content-Transfer-Encoding: base64

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
VgAAAABJRU5ErkJggg==

--_004_d2de4ae9ecb34efc962dea7f8b4e7cbdthalesgroupcom_--

