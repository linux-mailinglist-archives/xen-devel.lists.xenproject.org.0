Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AE7BB41B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613418.953912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogz9-0007pO-Go; Fri, 06 Oct 2023 09:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613418.953912; Fri, 06 Oct 2023 09:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogz9-0007md-D9; Fri, 06 Oct 2023 09:19:03 +0000
Received: by outflank-mailman (input) for mailman id 613418;
 Fri, 06 Oct 2023 09:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qogz7-0007VY-Uu
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:19:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623d5370-6429-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 11:19:00 +0200 (CEST)
Received: from AS9PR06CA0487.eurprd06.prod.outlook.com (2603:10a6:20b:49b::12)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Fri, 6 Oct
 2023 09:18:56 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::b5) by AS9PR06CA0487.outlook.office365.com
 (2603:10a6:20b:49b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 09:18:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Fri, 6 Oct 2023 09:18:55 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Fri, 06 Oct 2023 09:18:55 +0000
Received: from 54655a6981a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE39E684-4229-4289-ABFD-E25CA113499C.1; 
 Fri, 06 Oct 2023 09:18:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 54655a6981a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 09:18:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 09:18:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 09:18:47 +0000
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
X-Inumbo-ID: 623d5370-6429-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL9gcAKY1em9Es0EhOy3NxTPCDcl1plYEh3AZ5s5OL0=;
 b=wN0YIqUVPc1+P8LMZMWU6BJj5bl2eD1HudYc4te2uWHFFlrZ119Jrm8fXxxJfd+QIdSclLNnXmJP2hjOx9gmDXlPS+ABCv6wOtVBjzypw2ZArPA0jcyawhyhRxVba1gq900E7xIOB8uCIRsg2b8fJN3/BVURcqJ4AH8fMrbuiqY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b12a8031ac03f2e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+AIK1dSSda45BdG4bVxNCxd/j1vclVpQT6CJGtddWpZjVb/EWufjhZHvOqsi7AdsIbvWz25Qn2O/21ydrL1K5/dLnpLUpNV+w0XSfPP56EM6CVebsawDMnhjNpC+ZcuUrOEjsUWn/bHPlvT4cFZmYnhd7mrZ/5RZ5roEMVW7oHIURz7W10yzGkk7yfJMz4RJM7iyaLx8bRE29iy9F8mEHPnSRQNM0q7A4TaoleNUCWLABOHrGdvqI8PiAGmgR44bwRErRMWvEVkFsBztdKiaCDlCEhsEW1Rgcso+ht2+H09bVHvymEPw+HfngCC7oUTzS6Mr6z+2Hus7uCAa7uICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL9gcAKY1em9Es0EhOy3NxTPCDcl1plYEh3AZ5s5OL0=;
 b=QEueCl3W9R9l050NgxqzRNQm7B9wJPLsuj0zOwZgdX8U5qACR4Hd2HwrnNsVvQpShWs57tqGdY8zmpGepmGvZTUfzO3VyZPqgWcy7H1sA3QuatYA0OkVKCrST2ceXvmWCEW4xmHoKwzCIrEOVK7+Ou+MvSk6j0+6g4xo6537y6YqTjqyBS2XqWEkKlAteCTjWB8Ck42W5CVDp/SaRkBWVjemV+e+Z9N+o6fP7K5Lb+rKNv0iu3yHhOGd4DnN080rXuiTCUJ1MtC7iFWr+zPqSlC2l08DHeqceSgFiFWhIj4omYpKjjyT7kLXtEpuSTvNiIDfQ0tp9eT9xWzs5ZtK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL9gcAKY1em9Es0EhOy3NxTPCDcl1plYEh3AZ5s5OL0=;
 b=wN0YIqUVPc1+P8LMZMWU6BJj5bl2eD1HudYc4te2uWHFFlrZ119Jrm8fXxxJfd+QIdSclLNnXmJP2hjOx9gmDXlPS+ABCv6wOtVBjzypw2ZArPA0jcyawhyhRxVba1gq900E7xIOB8uCIRsg2b8fJN3/BVURcqJ4AH8fMrbuiqY=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] domain: expose newly introduced hypercalls as XENFEAT
Thread-Topic: [PATCH 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Thread-Index: AQHZ+DXk0ok5Q7WKoEy0uLdjQOLR7rA8e78A
Date: Fri, 6 Oct 2023 09:18:47 +0000
Message-ID: <56400C5F-5528-40BB-A741-BA2C555EBC8C@arm.com>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-3-roger.pau@citrix.com>
In-Reply-To: <20231006091353.96367-3-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB8791:EE_|AM7EUR03FT027:EE_|DBAPR08MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b569a27-e56b-4b07-b9fb-08dbc64d4416
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K210gn4o4c2aUt9uxEt9IAdnOF0WEriC3fLTG4wjMG9bDO8o79P4+Yg0KVseI/rTzl2upls1RpsQpMhENSUJeyB0Kz85AbxZp+UpFWnkkjznfU5ajUAtZLE3ZiE1oefLYLs1JtrvpRhP4kzUwemCoTKB0BJMNaX33h6eap4s2z4j458gvqeOmxV4rlwyk8ypMaCWYYDqS2bXo9iXAdJrU9IR7N1hZ+L5IwNj2Xvi40rfLwcI1xh+elBZGYqsD9Mzx/N87yOu/0ik8Z+/X83QMj4djZbBlUhlU8X9TUyb/JTJp626Xx2ItBfFG7zS/GElVnrXvYzGhy2YpF4j1FkWZ2Oi7uHpA0QbpsO5z1l+DF8l9X4rZtg/1x00JquvkPnm3TmpV46IxGfQx4Rw1Axzmb1XII2ZUclpOINWRJVFRlYQH/hsLHz3JHKOY5Ug7uCJ+jzCnbsewsZmO2IxBYiwM7O0PS2Hb4T1jnS3MkffmdgIamfCrFro62Y3PiFPSuxK2iIuEHAk5up7UjU/jjPKyZdQB6wE/qo9JICneLIwbWplYG5DQjzSj1F95X3NzmWamxNDreBHGsOK4ZejbryIQQX4/1DP2ULoODXYOXiRpTjAl6/ku9m1CcQum7IMkWJ+aAi+DAffThZuiezA7ZXOMA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(6506007)(71200400001)(478600001)(6486002)(6512007)(2616005)(83380400001)(26005)(2906002)(316002)(41300700001)(54906003)(6916009)(76116006)(91956017)(66446008)(66476007)(66556008)(66946007)(64756008)(5660300002)(8676002)(8936002)(4326008)(36756003)(33656002)(38100700002)(38070700005)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D7D3982EF29C645AC04E51C443AE242@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a718b004-9650-4e32-287d-08dbc64d3f0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a8eUX9LZ4NYmBCfKeTtOvJduygZrSmENhOdzidbO5P8KL51XPckACAko1+e4MEpzU+wtm2fcKdG27kiQHLS4S6fdhotwm1vvqr/rq8biUsduTzSraUnt0ws3TG7sCdleqAjI7/PjzrdPf5U5fyzeSWLxxcogz9cAOEusEpIqz7Z0ME4V2Mn8Ixg/+lj4tXNRr8u+2ouB1wiJUQbb8p/Hd/HuYNuJqVtUQIWueEjuaay3VHBAS1qoiqcrBwY9gUdcvOvpzNgahG/TQ6/J4ld5y6PabkVmJEkY7OZmPIBp9dsy25iog3tCZUOG7gwpYC8GoCzufbADMjhqMN2KEWGJGdYg4Gt73RFez8J2n9MYJB6MKKO0JV4MDO40UvlD3u4m8gldsLLxAGSzQ2tmHiLCzmHo1S1LDiGrqUZZ4caJ43OTKHJY1W5u77G4pWZnGdT/EYwPCNT6ZjuIQyD46SWsoAAoXFv+1h7xt8l6LBez6DXIFfbpghRPXzzs6dm8ozSv2sXJw+bR7kUmyueCNgLjkNnZLY5m0s47W0Q3vbsEdKQwNzGaOUqbKuQyvph3eyGSoMXTH/mz5eUR4Cn/7LtDJK0DPRS26feoQ843po2m9ePDtaVr/PZv8ZQZDI4LNqswrgFlKLfTg2KXQ++Tp8LJbHbUbb9DGMjjE4Egk8cF6PP/KTlJrvgcfWcPgrJW7WCC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39850400004)(396003)(376002)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799009)(36840700001)(46966006)(5660300002)(41300700001)(33656002)(40480700001)(2906002)(8936002)(6862004)(4326008)(8676002)(36756003)(478600001)(47076005)(6486002)(53546011)(6512007)(6506007)(83380400001)(336012)(36860700001)(82740400003)(2616005)(70586007)(81166007)(54906003)(356005)(86362001)(26005)(316002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:18:55.9553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b569a27-e56b-4b07-b9fb-08dbc64d4416
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573

SGkgUm9nZXIsDQoNCj4gT24gT2N0IDYsIDIwMjMsIGF0IDE3OjEzLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFhFTkZFQVRfcnVuc3RhdGVfcGh5
c19hcmVhIGlzIGV4cG9zZWQgdG8gYWxsIGFyY2hpdGVjdHVyZXMsIHdoaWxlDQo+IFhFTkZFQVRf
dmNwdV90aW1lX3BoeXNfYXJlYSBpcyBjdXJybmVsdHkgb25seSBpbXBsZW1lbnRlZCBmb3IgeDg2
LCBhbmQgaGVuY2UNCj4gdGhlIGZlYXR1cmUgZmxhZyBpcyBhbHNvIG9ubHkgZXhwb3NlZCBvbiB4
ODYuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0u
Y29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IC0tLQ0KPiBDSEFOR0VMT0cubWQgICAg
ICAgICAgICAgICAgICB8IDIgKysNCj4geGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgICAgICAgfCA2
ICsrKysrLQ0KPiB4ZW4vaW5jbHVkZS9wdWJsaWMvZmVhdHVyZXMuaCB8IDkgKysrKysrKysrDQo+
IDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL0NIQU5HRUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0KPiBpbmRleCBlMzNjZjRl
MWIxMTMuLjQxZGE3MTA0MjZmNiAxMDA2NDQNCj4gLS0tIGEvQ0hBTkdFTE9HLm1kDQo+ICsrKyBi
L0NIQU5HRUxPRy5tZA0KPiBAQCAtMzEsNiArMzEsOCBAQCBUaGUgZm9ybWF0IGlzIGJhc2VkIG9u
IFtLZWVwIGEgQ2hhbmdlbG9nXShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8p
DQo+ICAtIEFkZCBJbnRlbCBIYXJkd2FyZSBQLVN0YXRlcyAoSFdQKSBjcHVmcmVxIGRyaXZlci4N
Cj4gIC0gT24gQXJtLCBleHBlcmltZW50YWwgc3VwcG9ydCBmb3IgZHluYW1pYyBhZGRpdGlvbi9y
ZW1vdmFsIG9mIFhlbiBkZXZpY2UgdHJlZQ0KPiAgICBub2RlcyB1c2luZyBhIGRldmljZSB0cmVl
IG92ZXJsYXkgYmluYXJ5ICguZHRibykuDQo+ICsgLSBJbnRyb2R1Y2UgdHdvIG5ldyBoeXBlcmNh
bGxzIHRvIG1hcCB0aGUgdkNQVSBydW5zdGF0ZSBhbmQgdGltZSBhcmVhcyBieQ0KPiArICAgcGh5
c2ljYWwgcmF0aGVyIHRoYW4gbGluZWFyIGFkZHJlc3Nlcy4NCj4gDQo+ICMjIyBSZW1vdmVkDQo+
ICAtIE9uIHg4NiwgdGhlICJwa3UiIGNvbW1hbmQgbGluZSBvcHRpb24gaGFzIGJlZW4gcmVtb3Zl
ZC4gIEl0IGhhcyBuZXZlcg0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9rZXJuZWwuYyBiL3hl
bi9jb21tb24va2VybmVsLmMNCj4gaW5kZXggNTJhYTI4NzYyNzgyLi5iNjMwMmU0NGIzNGUgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9jb21tb24va2VybmVsLmMNCj4gKysrIGIveGVuL2NvbW1vbi9rZXJu
ZWwuYw0KPiBAQCAtNjA3LDcgKzYwNywxMSBAQCBsb25nIGRvX3hlbl92ZXJzaW9uKGludCBjbWQs
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPiAgICAgICAgIHN3aXRjaCAoIGZp
LnN1Ym1hcF9pZHggKQ0KPiAgICAgICAgIHsNCj4gICAgICAgICBjYXNlIDA6DQo+IC0gICAgICAg
ICAgICBmaS5zdWJtYXAgPSAoMVUgPDwgWEVORkVBVF9tZW1vcnlfb3Bfdm5vZGVfc3VwcG9ydGVk
KTsNCj4gKyAgICAgICAgICAgIGZpLnN1Ym1hcCA9ICgxVSA8PCBYRU5GRUFUX21lbW9yeV9vcF92
bm9kZV9zdXBwb3J0ZWQpIHwNCj4gKyNpZmRlZiBDT05GSUdfWDg2DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAoMVUgPDwgWEVORkVBVF92Y3B1X3RpbWVfcGh5c19hcmVhKSB8DQo+ICsjZW5k
aWYNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICgxVSA8PCBYRU5GRUFUX3J1bnN0YXRlX3Bo
eXNfYXJlYSk7DQo+ICAgICAgICAgICAgIGlmICggVk1fQVNTSVNUKGQsIHBhZV9leHRlbmRlZF9j
cjMpICkNCj4gICAgICAgICAgICAgICAgIGZpLnN1Ym1hcCB8PSAoMVUgPDwgWEVORkVBVF9wYWVf
cGdkaXJfYWJvdmVfNGdiKTsNCj4gICAgICAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xh
dGUoZCkgKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2ZlYXR1cmVzLmggYi94
ZW4vaW5jbHVkZS9wdWJsaWMvZmVhdHVyZXMuaA0KPiBpbmRleCBkMmE5MTc1YWFlNjcuLmNmZmIy
ZjE0YTU2MiAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2ZlYXR1cmVzLmgNCj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2ZlYXR1cmVzLmgNCj4gQEAgLTExMSw2ICsxMTEsMTUg
QEANCj4gI2RlZmluZSBYRU5GRUFUX25vdF9kaXJlY3RfbWFwcGVkICAgICAgICAgMTYNCj4gI2Rl
ZmluZSBYRU5GRUFUX2RpcmVjdF9tYXBwZWQgICAgICAgICAgICAgMTcNCj4gDQo+ICsvKg0KPiAr
ICogU2lnbmFsIHdoZXRoZXIgdGhlIGh5cGVydmlzb3IgaW1wbGVtZW50cyB0aGUgZm9sbG93aW5n
IGh5cGVyY2FsbHM6DQo+ICsgKg0KPiArICogVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX3BoeXNf
YXJlYQ0KPiArICogVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfdGltZV9waHlzX2FyZWENCj4gKyAqLw0K
PiArI2RlZmluZSBYRU5GRUFUX3J1bnN0YXRlX3BoeXNfYXJlYSAgMTgNCj4gKyNkZWZpbmUgWEVO
RkVBVF92Y3B1X3RpbWVfcGh5c19hcmVhICAxOQ0KPiArDQo+ICNkZWZpbmUgWEVORkVBVF9OUl9T
VUJNQVBTIDENCj4gDQo+ICNlbmRpZiAvKiBfX1hFTl9QVUJMSUNfRkVBVFVSRVNfSF9fICovDQo+
IC0tIA0KPiAyLjQyLjANCj4gDQoNCg==

