Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F06647EAB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 08:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457673.715644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3XxS-0004lg-C9; Fri, 09 Dec 2022 07:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457673.715644; Fri, 09 Dec 2022 07:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3XxS-0004j4-8g; Fri, 09 Dec 2022 07:38:10 +0000
Received: by outflank-mailman (input) for mailman id 457673;
 Fri, 09 Dec 2022 07:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PKE6=4H=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p3XxQ-0004iw-Ce
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 07:38:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8de018-7794-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 08:38:05 +0100 (CET)
Received: from DB7PR05CA0061.eurprd05.prod.outlook.com (2603:10a6:10:2e::38)
 by PAWPR08MB9472.eurprd08.prod.outlook.com (2603:10a6:102:2e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Fri, 9 Dec
 2022 07:38:03 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::e) by DB7PR05CA0061.outlook.office365.com
 (2603:10a6:10:2e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 9 Dec 2022 07:38:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.16 via Frontend Transport; Fri, 9 Dec 2022 07:38:02 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 09 Dec 2022 07:38:02 +0000
Received: from b560cc7cd2d4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FEEC6E3-942A-4386-BD18-8A54938A6C33.1; 
 Fri, 09 Dec 2022 07:37:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b560cc7cd2d4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Dec 2022 07:37:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5642.eurprd08.prod.outlook.com (2603:10a6:102:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 07:37:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Fri, 9 Dec 2022
 07:37:53 +0000
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
X-Inumbo-ID: 6a8de018-7794-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVjYN8tterH1LTxqcya6MXtkWpeXISRz6ot/mcGY9Yg=;
 b=crzPo5yffh4VvfZ/TgI3E73RezPd1KgV4IXWxtihMk9afnxd46J78zm1P9AdM//iFmvyUFC+IxCEnvgdU1oKfuHRojSlGpavCzl8ADOnoBMRjS/vCXLNdWV9xz6TFiUns/j1Deq0DBP/RPNAAhrEOcjf+wlr94za1/qoNxge1Eg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqKAFDwFZEI2k3A15ccuEEcX3Lbj5TurZIaTp879jEE22KPyf2N520SxKx8092LY+4GtkMoHFKzcggrh6VIBNZLELtKhhH1wOqOSFevfUl9u3Cw10Cd0Ce1ADHA/5cVtbt7zUNXQ3OouHJKAS/vzV5d3Q+9DeWtmNN5Z13N2yW0QU2aSwIJ1CnZiWJhf1Z/HYqQ+MN3CPSKEbKOCEktlOhs9WiiHHcE7nJpUc37r5STblIGgykAT5arf5pOQUOSBVYpWxPeYTqV/CHHeP0YMAlUUmxEMG2cyoAK/bvxqHJvPTCs6jccPLFDAHADtv+Qf/sSNX7JRrhCqpQM/RF8LCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVjYN8tterH1LTxqcya6MXtkWpeXISRz6ot/mcGY9Yg=;
 b=faxrVgq6NfHuohRB8/hMsfrYY9qz0a90OPxkGUom731LVzFz1tv5tcY6awk3FM3yYzsnuoX2xmCH1j15hQFjrnLGQbkX43VyDg9m1Kvn7SQ/Ab9szsBRz6iIza/jZsv29d1Pwl2CUvK7KTUiZpYhVrGY2JTvl3I1oQyK/fPljJEXBM860SC88zrrhjwEgfreSVhdHU867BLQ2F+yvhp3BF7CY2BR5pP9oGRF9BZ5PEtjdcWMvSpD97DHIUZFy8oqnLqW+PSoYshtWRXlvQr/6+aY5ibKac1FIFJA+EDyEPJ9VkyjY/iDyPGxKIyrAl9rpGXJcx6DzyF+3zQohpnEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVjYN8tterH1LTxqcya6MXtkWpeXISRz6ot/mcGY9Yg=;
 b=crzPo5yffh4VvfZ/TgI3E73RezPd1KgV4IXWxtihMk9afnxd46J78zm1P9AdM//iFmvyUFC+IxCEnvgdU1oKfuHRojSlGpavCzl8ADOnoBMRjS/vCXLNdWV9xz6TFiUns/j1Deq0DBP/RPNAAhrEOcjf+wlr94za1/qoNxge1Eg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Demi Marie
 Obenour <demi@invisiblethingslab.com>
CC: Ard Biesheuval <ardb@kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Thread-Topic: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Thread-Index: AQHZCuISzshQ7NkOqUOBoTPM3AzEWa5jro+ggACa+wCAAOKJ4A==
Date: Fri, 9 Dec 2022 07:37:53 +0000
Message-ID:
 <AS8PR08MB7991A81EEEC33451800CAF97921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
 <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <5ce98ff4-6b7d-2254-d755-a68fc3ac67b4@xen.org>
In-Reply-To: <5ce98ff4-6b7d-2254-d755-a68fc3ac67b4@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 153CFE75BB76524187E7B3AF528F3D4A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5642:EE_|DBAEUR03FT055:EE_|PAWPR08MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 38de5281-3f4f-4a47-8e55-08dad9b84dd8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JbUBMFerWvAfAj5guoGWqw/URzUIrHBAM0ggywZ7cAODvtNK8oHNqL7QKYfvDP0h8UkQsaxxDdGulF3XyVTljQou9EemwBKE8xBFpGvBRLbcbsGCt9XYAbZhl1/Jb566/VaeeElsbv3WfLZA4obZGCF+dvefsSEnwr5o3gK9BwfoiPmebXblH9yi0EE84OvAleMAtyLcDKicPgmcnHXOmhTDMvUZanlBj8uG2T6EiLy+p/EzBaQncyTC4D8VXktNY6q2Rrl3bvqhJN0G7bsYMOlEHUhnI16XzmZLDufo8TDKUZsRdOzx2q/r6uUHREmAuXlK2UrAGbZVZWDxytlmpBL5qAGOYAGbRh3KQZAsgEyEK2Iw+vjtw6oWDqt1Amt4kDqb3n2YJtclO8xN3TO/L+Eu5WRcpdXwB9bXWL5XV2VvSIyb4+v8Gr2AZqxmVuQ0jLbjQLYqJLjit8rQqn3G17Rx0AAbujPo5WNrddoJUa05YHQ6YTtuCL7JUqGf+nnHEukDpSy8noo1B0lCWOZgTUmCPUIrdb6rumnndy1A7/DptK/Ot51/6/C8HX2iqMZ4Rsssv8WmSi9nGYcEJwHHNKmTpmNcqZqa/72fknl+TS10TFQY0I9oAJd9LmWwKrdao0rS60/ywKaR3SUWfWjvRio3nrX9JpYjGOssPdXFBEmvKWDwvX1o6fmZFxiO5z49DhKBxZT6Davt2QZ6j4B38w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(54906003)(55016003)(110136005)(33656002)(316002)(26005)(66476007)(71200400001)(6506007)(38100700002)(66446008)(86362001)(83380400001)(122000001)(66946007)(5660300002)(4326008)(2906002)(8676002)(66556008)(76116006)(9686003)(52536014)(64756008)(38070700005)(8936002)(7696005)(186003)(41300700001)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e334804-e01c-4070-a0d5-08dad9b84872
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXkpPdujkhf4yWtAbiqY4KfcMfTt39jeEa0+q8HZ/gcC5Ohy7h/XhLmvlWYHjFyTaNiu/YPKhXGLJIgIWeD1+ScQYcZ568mmxZLpeZ3tZTRROvug1hm520lKwd5bqNcmd6/htxPCrLFNQ3vJVB5irCkpqmRpwq2FmLVrT7Y/Mr1PP24STFCEoiOn6HRywtN/1lU8FTuNuRvJhvVXZSXJOEQoHG2st5Z5siMiz/b/z3mZXbgTaiIdasc0368r7COgjZ/AbuTaATcICRBbJGo5VkR1SShX/t+6bCHhTV9CTKwKDbwQ7tLVcBZ9pT99zOlac1LhxXC2RmCk2WmNjqJZcsKdIYRoqsaELFQGs5E/Ss7arjYB+WxoUeQIDm0DGsLioJanuwWScDPGBqBsofsZxvdxSgASHDU6csGxBeVItWHz/kxgrlP1KuZkd9tKcodZW3a2y0fHme8vtl8x2R5ZV5iyHWSZv2VprzJ8BM6ojcpqfEeFP6mRfoustHEKKkJFc8mkqSolkPa14yLx3noMNu9nzf7NxjC8WUIOP1g3h+YusEsLvOA8GgLd1xYvtSLSrmgvOfgmPGG4aZrAUvdlQc2HeAKLhb95XVmk5Nw8QVHzPdVxi/9CAa1KvQ9s49qCEdNLa1ZKSQbB2stqvvbfAQe7rqSnegei7mo+b04OIzFlBdnliuw4z3Vj1h5chgt3S8mi3+vC/2MUHi94O0Nmzw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(33656002)(41300700001)(2906002)(82740400003)(8936002)(356005)(82310400005)(5660300002)(47076005)(336012)(186003)(86362001)(36860700001)(83380400001)(54906003)(55016003)(110136005)(52536014)(316002)(40460700003)(9686003)(81166007)(4326008)(70206006)(8676002)(478600001)(6506007)(40480700001)(7696005)(70586007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 07:38:02.9594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38de5281-3f4f-4a47-8e55-08dad9b84dd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9472

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIFVzZSBF
ZmlBQ1BJUmVjbGFpbU1lbW9yeSBmb3IgRVNSVA0KPiANCj4gSGksDQo+IA0KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogRGVtaSBNYXJpZSBPYmVub3VyIDxkZW1pQGludmlzaWJsZXRoaW5nc2xhYi5jb20+
DQo+ID4+DQo+ID4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
ID4+DQo+ID4+PiBTaG91bGQgdGhpcyBiZSBpbmNsdWRlZCBpbiA0LjE3PyAgSXQgaXMgYSBidWcg
Zml4IGZvciBhIGZlYXR1cmUgbmV3IHRvDQo+ID4+PiA0LjE3LCBzbyBJIHN1c3BlY3QgeWVzLCBi
dXQgaXQgaXMgdWx0aW1hdGVseSB1cCB0byBIZW5yeSBXYW5nLiAgVGhlIGNvZGUNCj4gPj4+IGlz
IGlkZW50aWNhbCB0byB2MiwgYnV0IEkgaGF2ZSBpbXByb3ZlZCB0aGUgY29tbWl0IG1lc3NhZ2Uu
DQo+ID4+DQo+ID4+IEl0IG1heSBiZSB0b28gbGF0ZSBub3csIGxvb2tpbmcgYXQgdGhlIHN0YXRl
IG9mIHRoZSB0cmVlLiBIZW5yeSwgSnVsaWVuPw0KPiA+DQo+ID4gTGlrZSBJIHNhaWQgaW4gdjIs
IEkgZG9uJ3Qgb2JqZWN0IHRoZSBjaGFuZ2UgaWYgeW91IHdvdWxkIGxpa2UgdG8gaW5jbHVkZSB0
aGlzDQo+IHBhdGNoDQo+ID4gdG8gNC4xNywgc28gaWYgeW91IGFyZSBzdXJlIHRoaXMgcGF0Y2gg
aXMgc2FmZSBhbmQgd2FudCB0byBjb21taXQgaXQsIGZlZWwgZnJlZQ0KPiB0byBhZGQ6DQo+ID4N
Cj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+
ID4NCj4gPiBTaW5jZSB3ZSBhbHNvIG5lZWQgdG8gY29tbWl0Og0KPiA+ICJbUEFUQ0ggZm9yLTQu
MTddIFNVUFBPUlQubWQ6IERlZmluZSBzdXBwb3J0IGxpZmV0aW1lIiBzbyBmcm9tIG15IHNpZGUN
Cj4gPiBJIGFtIG5vIHByb2JsZW0uIEp1bGllbiBtaWdodCBoYXZlIGRpZmZlcmVudCBvcGluaW9u
IHRob3VnaCwgaWYgSnVsaWVuDQo+IG9iamVjdA0KPiA+IHRoZSBjaGFuZ2UgSSB3b3VsZCBsaWtl
IHRvIHJlc3BlY3QgaGlzIG9waW5pb24gYW5kIGxlYXZlIHRoaXMgcGF0Y2gNCj4gdW5jb21taXR0
ZWQuDQo+IA0KPiBJIGhhdmUgY29tbWl0dGVkIGl0IGFmdGVyIFNVUFBPUlQubWQuIFNvIGlmIGZv
ciBzb21lIHJlYXNvbnMgd2UgYXJlIHNlZW4NCj4gYW55IGlzc3VlcyB3aXRoIE9zc3Rlc3QsIHRo
ZW4gSSBjYW4gdGFnIHRoZSB0cmVlIHdpdGhvdXQgdGhpcyBwYXRjaA0KDQpUaGlzIGlzIGEgZ3Jl
YXQgc29sdXRpb24gOikNCg0KPiAodGhhdCBzYWlkLCBJIHdvdWxkIHJhdGhlciBwcmVmZXIgaWYg
d2UgaGF2ZSBzdGFnaW5nLTQuMTcgPT0gc3RhYmxlLTQuMTcpLg0KDQpMb29rcyBsaWtlIG5vdyBz
dGFnaW5nLTQuMTcgPT0gc3RhYmxlLTQuMTcgbm93LCB3aXRoIHRoaXMgcGF0Y2ggcHVzaGVkLg0K
U28gd2UgYXJlIHJlYWR5IHRvIHRhZy4NCg0KPiANCj4gTXkgcGxhbiBpcyB0byBwcmVwYXJlIHRo
ZSB0YXJiYWxsIHRvbW9ycm93Lg0KDQpUaGFua3MgdmVyeSBtdWNoLg0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

