Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D804047D8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182861.330678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGRs-0000zi-NX; Thu, 09 Sep 2021 09:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182861.330678; Thu, 09 Sep 2021 09:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGRs-0000xu-Jr; Thu, 09 Sep 2021 09:34:24 +0000
Received: by outflank-mailman (input) for mailman id 182861;
 Thu, 09 Sep 2021 09:34:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJWR=N7=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOGRq-0000xX-Fa
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:34:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b9d27b6-1151-11ec-b1a8-12813bfff9fa;
 Thu, 09 Sep 2021 09:34:20 +0000 (UTC)
Received: from AM6P193CA0048.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::25)
 by VI1PR0802MB2333.eurprd08.prod.outlook.com (2603:10a6:800:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Thu, 9 Sep
 2021 09:34:17 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::e5) by AM6P193CA0048.outlook.office365.com
 (2603:10a6:209:8e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 09:34:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 9 Sep 2021 09:34:17 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Thu, 09 Sep 2021 09:34:16 +0000
Received: from 07792fdaa4da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DEF0512-3D12-4BB4-9E1D-B7648F044389.1; 
 Thu, 09 Sep 2021 09:34:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07792fdaa4da.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Sep 2021 09:34:06 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB2672.eurprd08.prod.outlook.com (2603:10a6:802:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 09:34:04 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4478.026; Thu, 9 Sep 2021
 09:34:04 +0000
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
X-Inumbo-ID: 1b9d27b6-1151-11ec-b1a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVLiyRJmeubHdsZ4iEmGaXE0d3O/Gu+hmo+4GLSGD0g=;
 b=8nxUEsgresHP2b9vnaqoDDY1rAVHHG8l+jI4PaPW5MXZc1e+q60eQjbY6AD42V/gkfYeIw+PMbMcYMqTiFu4DzhuvUaRXFaNLEgx4X6umHKn/1s/1TH3XbAjmSLSvXKdBELq4C9AxRkZcvl/+cgULlWOg9E3uYuxYrvEpFhyq7E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEWd5ZiraaixogvwoLR5qxYYJUVXsVz71PIiUgIhDcFBeSShgUDtDWS6nYo+dNoQP6vJTncbO4WpT4qBLEj3nDsOy13aB/+xhYEXrbROwQtsWJcpRnHbJfHdSKHr9X/7/cFUMLSHn8mBA9TNRNtVv19PdDzMqiT2yWL6LT9JxE0DVkbi3OSghnc0ORTS5PawOGtUJS+x4mkLhrAhzBJNGnEleX64/gG/vvR8UlI4n1R+/djstjUbcf1rVqDslBdkj1x/g9iM2hXLPpZTNVdJHoAyg0RPn9ct49v077zjYvHi1DfjK7HrVVkrzoUC1IHY4DPGOcKhiOKjPMifRtfJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pVLiyRJmeubHdsZ4iEmGaXE0d3O/Gu+hmo+4GLSGD0g=;
 b=HJzKBDuLPlWFLp+4EHTOq5Gurus4l4l6nrmDUXJN9Ny1yRZylj3WrZNiIvBjMrjysyzfHIhPNQsJ4jvJBaIITOJ1HDFfu1aAbgmmnXOEWjcjulF+Kzs9+PBzbUGAsfNM578CdIhiokGaq7hV43VmBV2O6JMcUaqGGewnOgS3ge3IbKxQkBYNnE7qS56wofNoGuWUAcspjt01F/d7UzbKpD3FyVQEG6X9Lt3h1CvUXD3zGx4k0KXrtf4zzq0xkOzWqYfjZQ89KGwxZf8ZgUMtTMXx5AW/4JpgzzrPJyiDX6alit9x5LMfn8/+DbVuSENS/X04ULMiiYgr08y3ffHy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVLiyRJmeubHdsZ4iEmGaXE0d3O/Gu+hmo+4GLSGD0g=;
 b=8nxUEsgresHP2b9vnaqoDDY1rAVHHG8l+jI4PaPW5MXZc1e+q60eQjbY6AD42V/gkfYeIw+PMbMcYMqTiFu4DzhuvUaRXFaNLEgx4X6umHKn/1s/1TH3XbAjmSLSvXKdBELq4C9AxRkZcvl/+cgULlWOg9E3uYuxYrvEpFhyq7E=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
Thread-Topic: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
Thread-Index: AQHXpVn2rWpL2DewC0y7cp371PcYX6ubbG4Q
Date: Thu, 9 Sep 2021 09:34:04 +0000
Message-ID:
 <VE1PR08MB5215F0A9EAB39A15E15B73F9F7D59@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
 <20210908095248.545981-6-penny.zheng@arm.com>
 <da3dafd3-9e61-a7d5-b5cf-897d73d0fd16@suse.com>
In-Reply-To: <da3dafd3-9e61-a7d5-b5cf-897d73d0fd16@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E4FF70204E49514B90295B8ECEC4633D.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ef253a11-8249-487b-2583-08d97374fe69
x-ms-traffictypediagnostic: VI1PR08MB2672:|VI1PR0802MB2333:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2333559DB933A4A9F5F8A69DF7D59@VI1PR0802MB2333.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TqN+Lslwi+IpA4PxksHGxk2bxMLX3x3RmSk4ZqfoC09JtKH5laD4Thnj56ipZh62Ep+fCKCfRffXaJWBjh5APp3X4+MZruNg+WHHM1s76jN+Nrp8B4s/iwE/MaChIyhz7pthV7ldumGaSpd7ffUWdComQEK/3SIBdHKp64jaLry9Yp/PE4hIgBUHRNGDH8g1yjtqERH638b09XsyqCHkqDI76I8eH8TuV6ZmqncgcY/GTj5A+5ihrXswSoc+e59oM3XUkI2NDnzCANrkX/z5xqcJJZkKOv0YGqop8g488Egy5d01jaqk05h95f8a8wztMAM8RiyeCU9c8OPS6WZsRUDx5zoPXosX/hHO7PlYYDW77QX6mQT8Y45f+cgm96Yqri+9kDTGB+oAP+nj3pLF2XCH0nRFP220lsTNPlxvXZe3wkm66m9Ci2qJsTPKb7dDiy/Sn6TaFYKSqes5Yp9Wj+10POAAcSblpWTFbZ4EOgFOwcg3G7qxlcC8pXUGRfrk7F7jFWRYqsUfRWqxyNbAtbx/+M4R5lmLIgJ1UWYfYUj5B5Uq4If9PtWLiRGRQ1gXJvpjBlVDowjHlZFwdmtXXtca+G0OlAVrgTrPXBfCh4CYVFKynIp6iEa+UAEZ4GoJ5tOHa8kl4PD78r9AUJHpmsyUZMbFk0Nxqcx0AkEcBhIOHiPhRrVfFAaG8u1rfxV4Fua9ti0RV1bN7is6jbgp2A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(86362001)(53546011)(6506007)(71200400001)(38070700005)(186003)(26005)(9686003)(55016002)(33656002)(478600001)(316002)(8676002)(64756008)(76116006)(54906003)(66946007)(66476007)(66556008)(5660300002)(66446008)(4326008)(7696005)(52536014)(83380400001)(8936002)(38100700002)(122000001)(110136005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17c90321-21aa-4146-5349-08d97374f6d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nHUtbYUNZk/wwk21B0JZLPBxFIFEUYt6Um3ApQbLerF7DUUUyR63NqFcxprAP9296a5hVzdCFZlUPxzkhOLUxi+eSQKH/Za/sAEVkwb2y3Ii8bjRtpN5rJmHW7cAtFFSkfbQy6Zi99OWBY4yqfLroeZfpl7ej02FqGjdS5yvGT9dzODM1Z0ePk1yi0FM7NtPyPOM05x+uZinho/XDuQGNhrCkIThHu+ZbemicTvIVNKUfChdfshMVwiiO8S6MBwOe4PsMyTlyBV/lTHjxVhPoM3KCdTdiJvhehtLrAu6eR9m+BScr1tR+wo+Us2pd2QfCmgTRDEIv7R9IyRniuQPvh7IHguMcQgi5KZLLoGXN6t7arNvrN2xxvbcJBBpE77dIc7EMM+PwC4MqIQJRj2rU0cOYFf3vGyLGEMYcmiaB7KQ7e5YeWViafCvnA8gKRImnfAgd8u2Z6oM28w3t8Dyy+KA8da15Henmfi0sV1+BGjgCTnwqVbeid67wSCNhzObBKi4EFd+BM0PuoRJW29hvzBa6hTc4MZINQh5MwD/q+BoJiZczjsmxz/YGFnoLD10SPe07gWRzWhwQh8POi4Z+5JQHy2G1SxARhiTsSITpmKVyX5iIQ26gJxEoVHdqgmL3kexnkcIAWg4iRI3DPza7iShGQN/6TfkhShKOLbZZU+u8H7ULCROKs9w7bdDwNHGk1ftpLYQL7gfLaTEFM0TsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(7696005)(86362001)(54906003)(52536014)(478600001)(81166007)(82740400003)(47076005)(83380400001)(110136005)(6506007)(70206006)(70586007)(82310400003)(53546011)(336012)(26005)(186003)(8936002)(33656002)(4326008)(8676002)(5660300002)(2906002)(316002)(36860700001)(9686003)(55016002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:34:17.0170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef253a11-8249-487b-2583-08d97374fe69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2333

SGkgSmFuIGFuZCBTdGVmYW5vDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDksIDIwMjEgNTowNiBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFy
bS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
OyBXZWkgQ2hlbg0KPiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NiA1LzddIHhlbjogcmUtZGVmaW5lIGFzc2lnbl9wYWdlcyBhbmQg
aW50cm9kdWNlIGEgbmV3DQo+IGZ1bmN0aW9uIGFzc2lnbl9wYWdlDQo+IA0KPiBPbiAwOC4wOS4y
MDIxIDExOjUyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBJbiBvcmRlciB0byBkZWFsIHdpdGgg
dGhlIHRyb3VibGUgb2YgY291bnQtdG8tb3JkZXIgY29udmVyc2lvbiB3aGVuDQo+ID4gcGFnZSBu
dW1iZXIgaXMgbm90IGluIGEgcG93ZXItb2YtdHdvLCB0aGlzIGNvbW1pdCByZS1kZWZpbmUNCj4g
PiBhc3NpZ25fcGFnZXMgZm9yIG5yIHBhZ2VzIGFuZCBpbnRyb2R1Y2VzIGEgbmV3IGhlbHBlciBh
c3NpZ25fcGFnZSBmb3INCj4gb3JpZ2luYWwgcGFnZSB3aXRoIGEgc2luZ2xlIG9yZGVyLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+
IA0KDQpTdGVmYW5vLCBTaW5jZSBJIG5lZWQgdG8gcmUtY29tbWl0IHRoaXMgb25lLCBJJ2xsIGFk
ZC1pbiB5b3VyIE5JVCBzdWdnZXN0aW9uIGluIGNvbW1pdCA3KCINCnhlbi9hcm06IGludHJvZHVj
ZSBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IiksIGFuZCBwdXNoIGEgbmV3IFNlcmllIGFzYXAuIDsp
DQoNCj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIG5vdyB2ZXJ5IHB1enpsZWQ6IEluc3RlYWQg
b2YgcmVzdG9yaW5nIHRoZSBsb25nIGFncmVlZA0KPiB1cG9uIG9yZGVyaW5nIG9mIHBhcmFtZXRl
cnMgKGFuZCB0aGVuIGtlZXBpbmcgbXkgQS1iKSwgeW91J3ZlIGRyb3BwZWQgdGhlDQo+IGFjay4N
Cj4gDQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYw0KPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMNCj4gPiBAQCAtNTY4LDcgKzU2OCw3IEBAIGludCBf
X2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICAgICBl
bHNlDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICB3aGlsZSAoIGNvdW50LS0gKQ0K
PiA+IC0gICAgICAgICAgICAgICAgaWYgKCBhc3NpZ25fcGFnZXMoZCwgbWZuX3RvX3BhZ2UoX21m
bihtZm4rKykpLCAwLCAwKSApDQo+ID4gKyAgICAgICAgICAgICAgICBpZiAoIGFzc2lnbl9wYWdl
cyhkLCBtZm5fdG9fcGFnZShfbWZuKG1mbisrKSksIDEsIDApDQo+ID4gKyApDQo+IA0KPiBUaGlz
IGNoYW5nZSBhbG9uZSBkZW1vbnN0cmF0ZXMgdGhlIHByb2JsZW0gd2hlbiBpdCBjb21lcyB0byBi
YWNrcG9ydGluZw0KPiBmdXR1cmUgY2hhbmdlczogSWYgdGhlIG9yaWdpbmFsIHBhdGNoIGNvbnRh
aW5lZCBhIGNvZGUgYWRkaXRpb24gc2ltaWxhciB0byB3aGF0DQo+IHlvdSBjaGFuZ2UgdG8sIHdp
dGhvdXQgdGhlIHBlcnNvbiBkb2luZyB0aGUgYmFja3BvcnRpbmcgcGF5aW5nIGNsb3NlDQo+IGF0
dGVudGlvbiwgdGhlIHJlc3VsdCB3aWxsIGJlIGFuIG9yZGVyLTEgcmVxdWVzdCB3aGVuIGFuIG9y
ZGVyLTAgb25lIGlzIHdhbnRlZC4NCj4gSXQgd2FzIGV4cGxhaW5lZCB0byB5b3UgdGhhdCBpbiBv
cmRlciB0byBtYWtlIHBlb3BsZSBkb2luZyBiYWNrcG9ydHMgYXdhcmUgb2YNCj4gdGhpcyBzZW1h
bnRpYyBjaGFuZ2UsIHRoZSBvcmRlciBvZiBwYXJhbWV0ZXJzIG9mIHRoZSBmdW5jdGlvbiBvdWdo
dCB0byBiZQ0KPiBhbHRlcmVkLiBUaGF0IHdheSB0aGUgY29tcGlsZXIgd2lsbCBjb21wbGFpbiwg
YW5kIHRoZSBwZXJzb24gd2lsbCBrbm93IHRvIGxvb2sNCj4gY2xvc2VseSB3aGF0IGFkanVzdG1l
bnRzIGFyZSBuZWVkZWQuDQo+IA0KPiBJbiB0aGlzIGNvbnRleHQgSSBmaW5kIGl0IGZ1cnRoZXIg
cHV6emxpbmcgLi4uDQo+IA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oDQo+ID4gKysr
IGIveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPiBAQCAtMTMzLDggKzEzMywxNCBAQCB2b2lkIGhl
YXBfaW5pdF9sYXRlKHZvaWQpOw0KPiA+DQo+ID4gIGludCBhc3NpZ25fcGFnZXMoDQo+ID4gICAg
ICBzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+ID4g
KyAgICB1bnNpZ25lZCBsb25nIG5yLA0KPiA+ICsgICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKTsN
Cj4gPiArDQo+ID4gK2ludCBhc3NpZ25fcGFnZSgNCj4gPiAgICAgIHN0cnVjdCBwYWdlX2luZm8g
KnBnLA0KPiA+ICAgICAgdW5zaWduZWQgaW50IG9yZGVyLA0KPiA+ICsgICAgc3RydWN0IGRvbWFp
biAqZCwNCj4gPiAgICAgIHVuc2lnbmVkIGludCBtZW1mbGFncyk7DQo+IA0KPiAuLi4gdGhhdCB5
b3UgYWxzbyBuZWdsZWN0ZWQgdGhlIHJlcXVlc3QgdG8gaGFybW9uaXplIHRoZSBhcmd1bWVudCBv
cmRlciBvZg0KPiBib3RoIGZ1bmN0aW9ucy4gV2hhdCB3ZSB3YW50IChhbmQgd2hhdCBJIHRob3Vn
aHQgaGFzIGxvbmcgYmVlbiBhZ3JlZWQNCj4gdXBvbikgaXMgZS5nLg0KPiANCj4gaW50IGFzc2ln
bl9wYWdlcygNCj4gICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnLA0KPiAgICAgdW5zaWduZWQgbG9u
ZyBuciwNCj4gICAgIHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICB1bnNpZ25lZCBpbnQgbWVtZmxh
Z3MpOw0KPiANCj4gaW50IGFzc2lnbl9wYWdlKA0KPiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcs
DQo+ICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsDQo+ICAgICBzdHJ1Y3QgZG9tYWluICpkLA0KPiAg
ICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKTsNCj4gDQoNClNvcnJ5LCBteSBmYXVsdCwgSSd2ZSB3
cm9uZ2x5IGludGVycHJldGF0ZSBqdWxpZW4ncyBoYXJtb25pemUgcmVxdWVzdCB0d2ljZS4NCiAN
Cj4gSmFuDQoNCg==

