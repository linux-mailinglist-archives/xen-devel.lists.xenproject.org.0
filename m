Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8190E76F415
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 22:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576605.902929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRf68-0005yT-1O; Thu, 03 Aug 2023 20:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576605.902929; Thu, 03 Aug 2023 20:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRf67-0005vv-UQ; Thu, 03 Aug 2023 20:39:03 +0000
Received: by outflank-mailman (input) for mailman id 576605;
 Thu, 03 Aug 2023 20:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRf66-0005vj-Ce
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 20:39:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c66d36a7-323d-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 22:39:00 +0200 (CEST)
Received: from DB8PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:100::22)
 by DB3PR08MB8986.eurprd08.prod.outlook.com (2603:10a6:10:42b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:38:46 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::5f) by DB8PR06CA0009.outlook.office365.com
 (2603:10a6:10:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Thu, 3 Aug 2023 20:38:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 20:38:45 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Thu, 03 Aug 2023 20:38:45 +0000
Received: from c926f84c38a8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B88C7538-4AA4-41D3-AECA-6C69ACA10D10.1; 
 Thu, 03 Aug 2023 20:37:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c926f84c38a8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 20:37:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10257.eurprd08.prod.outlook.com (2603:10a6:102:367::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:37:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 20:37:40 +0000
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
X-Inumbo-ID: c66d36a7-323d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcgjQduBKAKOmnCmHicghrNByM6XK2eP+K7MyTSqdMY=;
 b=5KWC2vtp/TSSxqUvC09hLd73bV0FE7tpthwamV4Lywsr54npJk2hBvJrwnnmr6XggV0k2QqHK8rlL93iCEklroycHDc6S8UoRbqUAsyhTUnVcK3F9/u8z9/i0CwMCtQKHK/MYvLkO55GAXVZHxKxRMb1JZYHg7SRBHgaGp9AY+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca4d64224fff281f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcdNyv+N0qIm2d/1e8K99eto+vODSu12mYZDthIbpY4S5xoWSr+5td37sx4iBdKOVg71lctFe/g+Kp+NLnNaeNBfRUMM+JLgGFHPe2UTnCg3/Xj6fGxqj/zhsVziEe5tHkcUqVHj/pIQhoZyUzaKQJ6qgnLk328nedcHYLJljegM41m8bWTXp4zzKMBjKPWalPcXR8MCSOqJCdf94oJBZLRzCCQlqqpYZzr1gY5DiE/r566FlZIKkUJeY1Tt7JJT27gz5kaxRPTQlkLQ/NOsNGy2fQ1wp1RhVXiHZ7U4zTOvSQz5CSmq3pQuBj8mrX2Bb3PXGCuQqFRtZ6DE67NlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcgjQduBKAKOmnCmHicghrNByM6XK2eP+K7MyTSqdMY=;
 b=NQxMImSIf1O4E1Ws9Tbr4gXTTP4U9+298Q73CXVlI5n3xIOPTOQAgKv6iOfSnqnqbGtKEcxcM7/PRWZOy9O4izzuUpwCQgzs16SKrNW+le4YzmReIKWV1H/1oJoBr6TGMdjKW5gTvl+9fp3QCJdpyVdPXKTTJAwlmm4HvWffs694BRBDnZsa0eTqhfp0yOne4wmJkRk7izH9QwRuutUpPVqu62YvEuwKfbiyvna5WtjVOjFe0LUV6kOvvqxtGQPN7D1p7PUB9yrG/k4a9f3JbWlzQf5w88HIvaM8DvkAsWddJwYoux0fXWsD3hwlgrG3Ge3LQC3mgkChmOjhNl+jWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcgjQduBKAKOmnCmHicghrNByM6XK2eP+K7MyTSqdMY=;
 b=5KWC2vtp/TSSxqUvC09hLd73bV0FE7tpthwamV4Lywsr54npJk2hBvJrwnnmr6XggV0k2QqHK8rlL93iCEklroycHDc6S8UoRbqUAsyhTUnVcK3F9/u8z9/i0CwMCtQKHK/MYvLkO55GAXVZHxKxRMb1JZYHg7SRBHgaGp9AY+4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Index: AQHZxfetD3iMBVO78kiKHyDm3xOwK6/Y3kwAgAAfToCAAAsagA==
Date: Thu, 3 Aug 2023 20:37:40 +0000
Message-ID: <2E1A5918-A475-4055-A5A5-DE0CE30C061A@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
 <CA8E22A7-D7E4-43E8-BE4E-D2C2B41D921C@arm.com>
 <8a51be9e-0131-0590-9aea-bbec146ce239@apertussolutions.com>
In-Reply-To: <8a51be9e-0131-0590-9aea-bbec146ce239@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10257:EE_|DBAEUR03FT055:EE_|DB3PR08MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee6900a-d821-4f3a-f7d5-08db9461a231
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aA5ssTbqylqxvQJnr2wlEMk0X8ajjNtL5ZucjEiYqBUMesvC+pVUacalG9DqoKgp22D4krNgpqzyfEDXrmjMy2xxgfn5onCsnYkZp58rf+BeuYlJ+dxk1XpY4U027EDVC6OZGAxtPIJJg7MOpdXMsD0zenx6PDQdL+Y3KJzRgp5JpukSPr4eXDKfFa4CNo4DPcZoA4/+akLmCdAw/OFCVIllno01jIs6tx1u4QLwQkZeeOa7a39C0hhnjKhiL5JO776mE9NgoNu07ShCLO2rVtN03qOxcWF3cV7XyPvGUd1sKa5XvQ7pMaockCZVRH0hByPeMM590nb/LLY5qLNAN9Zku3mONTrTNvGsDTUUTIjB4iIz+SKeNtg9G3/6zZjissUEsHdWe8zIAPP93w3rZmOchxTluZj32wTrBkK5RVoeZWD/0wCEwSA2Y7NlrvABI6AAzjOHbfsGSa3PGQ1zT7d/6fPv4AEU0wQfUp39qfoA8Cf1um0J7yMvfwOA41gboQ0JxLc7ezYwq9+u0eqnIFVCz4BTO5KTgCZTsNGGpUyctYGU1TUS0m8joXA84wxvFbbxNhNaP9pbVt7WSb/xeU/lvIijOIIYOZ2/N6cz+vnp8er5zh5RG7qGsOVM5RFyit1lFROLpsirSklTBsLaUQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(2616005)(6506007)(186003)(8676002)(26005)(66476007)(2906002)(316002)(66556008)(91956017)(4326008)(66946007)(5660300002)(64756008)(6916009)(76116006)(66446008)(8936002)(41300700001)(6486002)(71200400001)(6512007)(54906003)(478600001)(38100700002)(122000001)(33656002)(36756003)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFA380C05614CE49B803445A9010A845@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10257
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4f7cd30-7e34-4409-295b-08db94617b37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P6CiFLNBsNqLqF2m4Ikf1N6koK2wbqCsJg9iFqZ2AYpjWaRvraVmSznUftNu/OIF70Tsl3ZsbJjnifAjvnQ5cGsb4tLr8/s5btT3+aVxNs1miS2tysDzSJSdmTEDboNRbGsnfcYUqzyEVkqtfNYHQNV9Tz8gl0hH1ebsTDxeybVMNHsm0vuoJNkQfzzs5VNe6a+hDhnDCVprYvQ3+3z+UUFRWv05tnSKt0wcX+mMqG7d6GtENy2CbPUOnF6hlBICO7yxemDdAujygr+IpheRtWv45S1DKUyMnd2URlDBscLRb8194ANMursMO9nTETb7QLWn3LvcYJXo99tWfhtZyV+8agQEh9rf+x+wgk25kcR7PBMehkWMFl2McNiaM6ZM+SlF5Ek8IlQPUH8XfNY4wQfeR2o1o7EaD+IA3OCPe8VW7fv/3qHp6arwbYGEyGy9eQUI3gCaZT6QcUQVbEkxbw/7bZoAsZoK/71n69M1z8m5L40puUz38OOxL83fAPq+N51Fups+7wNJvVpvp+I5qzUqup5lMqvS0EOXySp4X68q5KBjckfJbtYHAaf1jBu/bLcM0QXMoDnWyG4WSJtGFcBjbztXc/q6vPUxT10gSTSlVRJoRW2elmH6TGaFc2sQjKTC1NvpIYLs22TeKTxwBdRGEIHH/GD5mtNH6yEB9SLQaq6lUroJhzGTMQRVMYz7Mrzv9QitEgyZGOsEExx7t4Awo2RQ8yHO4YnVuRkBbiDw0AQZuWRpH+e6t1K6uktR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(6506007)(336012)(186003)(26005)(47076005)(8676002)(316002)(36860700001)(2906002)(4326008)(70206006)(5660300002)(70586007)(41300700001)(6862004)(8936002)(6486002)(6512007)(54906003)(478600001)(40480700001)(356005)(81166007)(33656002)(86362001)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 20:38:45.6979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee6900a-d821-4f3a-f7d5-08db9461a231
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8986

DQo+IA0KPj4gUmVnYXJkaW5nIHRoZSBjb2Rpbmcgc3R5bGUsIEkgdGhpbmsgaXTigJlzIGJldHRl
ciB0byBrZWVwIHRoZSBzdHlsZSB5b3XigJl2ZSBmb3VuZCBpbiB0aGUgb3JpZ2luYWwgZmlsZSwN
Cj4+IGFuZCBjaGFuZ2Ugb25seSBzb21lIGJpdHMgd2hlbiB0aGUgY29kZSBpcyBub3QgZm9sbG93
aW5nIGl0Lg0KPj4gSSBrbm93IHRoZXJlIGlzIG5vdGhpbmcgZW5mb3JjaW5nIHBhcmFtZXRlcnMg
b24gdGhlIHNhbWUgbGluZSBvZiB0aGUgZnVuY3Rpb24gZGVmaW5pdGlvbiBhdCB0aGUNCj4+IG1v
bWVudCwgYnV0IGl0IGlzIGhvdyBpdOKAmXMgZG9uZSBmcm9tIHRoZSBvcmlnaW5hbCBmaWxlIHNv
IEkgd291bGQgc3RpY2sgd2l0aCBpdC4NCj4+IFJlZ2FyZGluZyB0aGUgdTMyL3U2NCB0eXBlcywg
bWF5YmUgc2luY2UgeW91IGFyZSBtb3ZpbmcgdGhlIGNvZGUgaXQgY2FuIGJlIHRoZSBvY2Nhc2lv
biB0bw0KPj4gY29udmVydCB0aGVtLCBidXQgY2hlY2sgd2l0aCB0aGUgbWFpbnRhaW5lciBiZWZv
cmUuDQo+IA0KPiBJIGNhbiBsZWF2ZSB0aGUgbWFpbiBjb2RlIGFzIGlzLCBidXQgSSBkbyB0aGlu
ayBoZWFkZXIgZGVjbCdzIHNob3VsZCBiZSBzdHlsZWQgY29ycmVjdGx5IGFzIHRoZXJlIGlzIG5v
IG5lZWQgdG8gaGF2ZSB0aGVtIGNodXJuIGluIHRoZSBmdXR1cmUgb3ZlciBwdXJlbHkgc3R5bGUg
Y2hhbmdlcy4NCg0KVWhtLCB3aGVuIHlvdSBzYXkg4oCcc3R5bGVkIGNvcnJlY3RseeKAnSBkbyB5
b3UgbWVhbiBhcyBiZWxvdz8NCg0KDQo+Pj4gK2Jvb2wgX19pbml0IGRldmljZV90cmVlX25vZGVf
bWF0Y2hlcygNCj4+PiArICAgIGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsIGNvbnN0IGNoYXIg
Km1hdGNoKQ0KPj4+ICt7DQoNCg0KSWYgdGhhdOKAmXMgdGhlIGNhc2UsIGl0IHNlZW1zIHRvIG1l
IHRoYXQgdGhlcmUgaXMgbm90aGluZyBsaWtlIHRoYXQgaW4gdGhlIGNvZGViYXNlLA0KaW4gbXkg
d29yayB3aXRoIGNsYW5nLWZvcm1hdCBJ4oCZdmUgY29uZmlndXJlZCBpdCB0byBtYXRjaCBhcyBt
dWNoIGFzIEkgY2FuIHRoZQ0KWGVuIHN0eWxlIGFuZCB0aGlzIGZ1bmN0aW9uIHdvdWxkIGJlIGZv
cm1hdHRlZCBhcyB0aGUgb2xkIHN0eWxlIHRoYXQgaXQgaGFkLg0KDQpDYW4gSSBhc2sgeW91IHdo
ZXJlIGRpZCB5b3UgZmluZCBpbnN0cnVjdGlvbiB0byBzdHlsZSBpbiB0aGF0IHdheT8NCg0K

