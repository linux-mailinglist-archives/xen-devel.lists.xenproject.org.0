Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F170F38B
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538943.839348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lDd-0003SP-8L; Wed, 24 May 2023 09:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538943.839348; Wed, 24 May 2023 09:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lDd-0003QH-5R; Wed, 24 May 2023 09:55:45 +0000
Received: by outflank-mailman (input) for mailman id 538943;
 Wed, 24 May 2023 09:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1lDb-0003QB-Jq
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:55:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251a6721-fa19-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 11:55:42 +0200 (CEST)
Received: from AM6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::48)
 by VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:55:35 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::7c) by AM6P191CA0071.outlook.office365.com
 (2603:10a6:209:7f::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 09:55:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:55:35 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Wed, 24 May 2023 09:55:34 +0000
Received: from d004075b34eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD959967-991B-4D2F-8CB8-82012011B982.1; 
 Wed, 24 May 2023 09:55:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d004075b34eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:55:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6367.eurprd08.prod.outlook.com (2603:10a6:102:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:55:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:55:26 +0000
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
X-Inumbo-ID: 251a6721-fa19-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdIMhJvgEpp6Wnqo5bm/izItqJv5GWw+D3KZTD9sCOY=;
 b=6m0fKCf4EC53ruq0ZU+VLxAIek3gcM+DiPFPCctSeJ02kHgwyHyHHdiasu6DmAp4h3qvXOgKOIs/yXUdYetFe9E9u2O3cTpPRwSo9fn6/T4GBaGdAkOTAv22vykBKMGP5E+UvV0y5R/ZLT3wR3kfdNWmmp9WR12Pvt3iOS8X3aQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86aa1d088ec21d86
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNMKRELRADKQke19diys4E8zzIVqhX2puUTY4tjsOzKAR8Y5hbs2YscEV5qovzRLw+SGvt92dBlVUvQ1F6MSXwYop0BGpZdbR0pr+OGEJ8VSuj9S9xLO6Kd8mexDvEvE5acvD28yh1rkQBmY61krSKHHY4ym9hSQv2IUm2F1MdMtEUGd2FhSbxxLWsXiXPm02S+4BEWiM0sHyW5ufTjqElSilC0k5slF8AnF3W2o8D5VhUpqtNDNfGLKYg42rTzY6ev7pjpQD7VSERm17JU001XnaNDQnZwdDsN9Cn9Km7B0wEDg2h5hrDUBHwdY0iNzVC6Rw8ztLZnu2Ah21D3UXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdIMhJvgEpp6Wnqo5bm/izItqJv5GWw+D3KZTD9sCOY=;
 b=QCwCgv0S85eh7vkodW4wU5htKYDuO3fS4ZoA1MUJOmqSlZmC3UJT7FJTnt+Thx7yvThGyTTIZxSVGwfhs0Y0dbRbgLFmvP96ra/4MhxpUlT4nKfdLtRBTz0r3omH9eaGOKdP3Z43b77jEu8BzzgZ+dGavD8vcAoZV1xAE925X67YX/CksGEKEGiH5Ymfqf8Z7HlIkmEydAvJrhwktdpoYFoyPqcMSC48jZaEPxoaISkP7n09C720+klzovJMRr1VIEBQ67fq1OsKMvCRU+ri7fikOuBlyGULw45wzLrDthhOo0b2CnEJoTttWeTccerHKHsFUOfRRtdYv9t0VDpojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdIMhJvgEpp6Wnqo5bm/izItqJv5GWw+D3KZTD9sCOY=;
 b=6m0fKCf4EC53ruq0ZU+VLxAIek3gcM+DiPFPCctSeJ02kHgwyHyHHdiasu6DmAp4h3qvXOgKOIs/yXUdYetFe9E9u2O3cTpPRwSo9fn6/T4GBaGdAkOTAv22vykBKMGP5E+UvV0y5R/ZLT3wR3kfdNWmmp9WR12Pvt3iOS8X3aQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZjUpcuuLAh7YurESbASUYh0J8dK9pLuqAgAACLoA=
Date: Wed, 24 May 2023 09:55:26 +0000
Message-ID: <32B75BC9-2687-4D34-89D2-CD014BCA4FB5@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-6-luca.fancellu@arm.com>
 <04720B92-03CF-464A-8FE7-F90B527F3E7B@arm.com>
In-Reply-To: <04720B92-03CF-464A-8FE7-F90B527F3E7B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6367:EE_|AM7EUR03FT031:EE_|VE1PR08MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a056dc-d8e4-4e56-39bb-08db5c3d052b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mspeCavwfovsBvnVEgz1VFQ5FCJD7PVMCIVabWF5IdEqRB5wDHuHz3wwRbCpDMSqDtEr0K/ODo1XcNMiMkXaKaSIHM5yd19aLapKTofORdN1kIIgPaF48Hwj7YDvRmwYGHdwYv3Vgy8MIOEfR0mbxe2BS1tG0JN1lX/cGwCS66QvkLSxSQMgNtNv6XV8ma2V8AfDZt3Z2deNQPTCUSxtKfs8lbkeKF+t0PQjy7VGodo3PDlv9XjjiQ9+LE/vX5f6yV/VbhYd5w9dCoQDk6UhSMk7CdxIOyrG4wOcDmjfY5uHbl4bKMGTQAuZp8sVVwAWnkgSVpKfS0hC2Y3X8dfZKB6xr0Tk9/gsN863cA/C7DYgxE9WDsHBU3udPl6KdAu0cR3bbgAwXpzsF5EBxorwmwrK5DocSLVnBjQo6UJ8kh755YHxAxdMu4Wq7pSfDFy+oSJhrRiKuM4IZH+UYic1JvpYAjGmnhGzp/sLgVAy9sfKgTqFDZgEVEto9cn6EcBcAITQs9fUkbTwgfTrMp+SQd0Yx7SdxUv6Lzw+s/MVh9MoYpVYS4zQ+daP/INKVSlucb9GDziTStlUA9TJ9uXCe+vnQ6okLWJ7rH9Br6AOxm3KXVUDiGyRqQDiI2aolUpcKVAHwZ/1PXq+LE2c01+DQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(8676002)(5660300002)(2906002)(8936002)(316002)(66946007)(4326008)(6636002)(64756008)(66446008)(91956017)(66556008)(66476007)(76116006)(54906003)(37006003)(478600001)(33656002)(2616005)(83380400001)(71200400001)(53546011)(186003)(6512007)(36756003)(26005)(6506007)(41300700001)(6862004)(38100700002)(86362001)(38070700005)(122000001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF2092347A77614FAE5736EEE35CD0C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad96fb38-b23d-443c-f8aa-08db5c3d0012
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MX/ZStrSi+V6/uCvJDTm2fb/niyzS5YuvW97/LWCaxZuqktr3NFztzia1BvDBIThpraC1M2LZLO/XLaYB4XgA7cNNhOeVHIOeDDoguivDu/37WyYpcS62KELh6FF6sCbPMC6b+q2fRy6Y62vq4eKcsk4Z8nxvaPddq7WxTwpLQoAh0Ob0+xEjx+uV+0ADzlDuhJ+1CiVuQ+OKTOWJvVI1OTnn68dR2wGY2Y0pQSFHydjcrasya9HFsGjQetL8W4z4gDh5JvPwymcG/uyPP+8atwG+eAU/OEDxLgswP81h7L5tSELHotzFpB7IhNXE2lWq3Uxn8tTvwQOb/Cp4DwqRHbkZ/3LY9hgQ7XMk1KCN1Vnd/9fY4RDdac+R0B3DUSst28sKO+AOEJJySTAz4V0OTZkfD8EXuFzAnlwm9MWWCGh5pV68+GeF35URPYGVaYX2CiO/dDk8l4PasjIv/tR2AHdNGvQmUdhtdBFPRYQT191Oa2ohygma9THvLIhgTtxF1I13Eoj3zWR++EXCPIh2+yW3hpxMjmUPt7xfFoCS7oHhunM8YvwpGs6USi2R9jNS4ar2Tkdp/hwm4GBHjAGFs25fQ7TOMKtfL8HDumC0FYrE8Gt3xCqXp2vwDcXc6isnH9a9jF4fWbMQ7FfBfNA0yXHUSzT/FUF+rJHxN+CJHyfK9SvmqJRjuMnzN3HihM7uRbFZG5eBsP0d8euTcZx0BPu7S/TxXNZOMuIxf5da7+xpNRZEvMj7IIDbr9QudzW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(336012)(47076005)(83380400001)(6636002)(4326008)(70206006)(70586007)(107886003)(6486002)(2616005)(54906003)(37006003)(6506007)(26005)(6512007)(53546011)(478600001)(186003)(2906002)(8936002)(6862004)(86362001)(8676002)(5660300002)(36756003)(33656002)(316002)(40460700003)(356005)(82740400003)(81166007)(40480700001)(41300700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:55:35.1911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a056dc-d8e4-4e56-39bb-08db5c3d052b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616

DQoNCj4gT24gMjQgTWF5IDIwMjMsIGF0IDEwOjQ3LCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+PiBPbiAyMyBN
YXkgMjAyMywgYXQgMDk6NDMsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2VsbHVAYXJtLmNvbT4g
d3JvdGU6DQo+PiANCj4+IFNhdmUvcmVzdG9yZSBjb250ZXh0IHN3aXRjaCBmb3IgU1ZFLCBhbGxv
Y2F0ZSBtZW1vcnkgdG8gY29udGFpbg0KPj4gdGhlIFowLTMxIHJlZ2lzdGVycyB3aG9zZSBsZW5n
dGggaXMgbWF4aW11bSAyMDQ4IGJpdHMgZWFjaCBhbmQNCj4+IEZGUiB3aG8gY2FuIGJlIG1heGlt
dW0gMjU2IGJpdHMsIHRoZSBhbGxvY2F0ZWQgbWVtb3J5IGRlcGVuZHMgb24NCj4+IGhvdyBtYW55
IGJpdHMgaXMgdGhlIHZlY3RvciBsZW5ndGggZm9yIHRoZSBkb21haW4gYW5kIGhvdyBtYW55IGJp
dHMNCj4+IGFyZSBzdXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtLg0KPj4gDQo+PiBTYXZlIFAwLTE1
IHdob3NlIGxlbmd0aCBpcyBtYXhpbXVtIDI1NiBiaXRzIGVhY2gsIGluIHRoaXMgY2FzZSB0aGUN
Cj4+IG1lbW9yeSB1c2VkIGlzIGZyb20gdGhlIGZwcmVncyBmaWVsZCBpbiBzdHJ1Y3QgdmZwX3N0
YXRlLA0KPj4gYmVjYXVzZSBWMC0zMSBhcmUgcGFydCBvZiBaMC0zMSBhbmQgdGhpcyBzcGFjZSB3
b3VsZCBoYXZlIGJlZW4NCj4+IHVudXNlZCBmb3IgU1ZFIGRvbWFpbiBvdGhlcndpc2UuDQo+PiAN
Cj4+IENyZWF0ZSB6Y3JfZWx7MSwyfSBmaWVsZHMgaW4gYXJjaF92Y3B1LCBpbml0aWFsaXNlIHpj
cl9lbDIgb24gdmNwdQ0KPj4gY3JlYXRpb24gZ2l2ZW4gdGhlIHJlcXVlc3RlZCB2ZWN0b3IgbGVu
Z3RoIGFuZCByZXN0b3JlIGl0IG9uDQo+PiBjb250ZXh0IHN3aXRjaCwgc2F2ZS9yZXN0b3JlIFpD
Ul9FTDEgdmFsdWUgYXMgd2VsbC4NCj4+IA0KPj4gTGlzdCBpbXBvcnQgbWFjcm9zIGZyb20gTGlu
dXggaW4gUkVBRE1FLkxpbnV4UHJpbWl0aXZlcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiBSZXZpZXdlZC1ieTogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiANCj4gSnVzdCAuLi4NCj4g
DQo+PiAtLS0NCj4+IENoYW5nZXMgZnJvbSB2NjoNCj4+IC0gQWRkIGNvbW1lbnQgZm9yIGV4cGxh
aW4gd2h5IHN2ZV9zYXZlL3N2ZV9sb2FkIGFyZSBkaWZmZXJlbnQgZnJvbQ0KPj4gIExpbnV4LCBh
ZGQgbWFjcm9zIGluIHhlbi9hcmNoL2FybS9SRUFETUUuTGludXhQcmltaXRpdmVzIChKdWxpZW4p
DQo+PiAtIEFkZCBjb21tZW50cyBpbiBzdmVfY29udGV4dF9pbml0IGFuZCBzdmVfY29udGV4dF9m
cmVlLCBoYW5kbGUgdGhlDQo+PiAgY2FzZSB3aGVyZSBzdmVfenJlZ19jdHhfZW5kIGlzIE5VTEws
IG1vdmUgc2V0dGluZyBvZiB2LT5hcmNoLnpjcl9lbDINCj4+ICBpbiBzdmVfY29udGV4dF9pbml0
IChKdWxpZW4pDQo+PiAtIHJlbW92ZSBzdHVicyBmb3Igc3ZlX2NvbnRleHRfKiBhbmQgc3ZlX3Nh
dmVfKiBhbmQgcmVseSBvbiBjb21waWxlcg0KPj4gIERDRSAoSmFuKQ0KPj4gLSBBZGQgY29tbWVu
dHMgZm9yIHN2ZV9zYXZlX2N0eC9zdmVfbG9hZF9jdHggKEp1bGllbikNCj4+IENoYW5nZXMgZnJv
bSB2NToNCj4+IC0gdXNlIFhGUkVFIGluc3RlYWQgb2YgeGZyZWUsIGtlZXAgdGhlIGhlYWRlcnMg
KEp1bGllbikNCj4+IC0gQXZvaWQgbWF0aCBjb21wdXRhdGlvbiBmb3IgZXZlcnkgc2F2ZS9yZXN0
b3JlLCBzdG9yZSB0aGUgY29tcHV0YXRpb24NCj4+ICBpbiBzdHJ1Y3QgdmZwX3N0YXRlIG9uY2Ug
KEJlcnRyYW5kKQ0KPj4gLSBwcm90ZWN0IGFjY2VzcyB0byB2LT5kb21haW4tPmFyY2guc3ZlX3Zs
IGluc2lkZSBhcmNoX3ZjcHVfY3JlYXRlIG5vdw0KPj4gIHRoYXQgc3ZlX3ZsIGlzIGF2YWlsYWJs
ZSBvbmx5IG9uIGFybTY0DQo+PiBDaGFuZ2VzIGZyb20gdjQ6DQo+PiAtIE5vIGNoYW5nZXMNCj4+
IENoYW5nZXMgZnJvbSB2MzoNCj4+IC0gZG9uJ3QgdXNlIGZpeGVkIGxlbiB0eXBlcyB3aGVuIG5v
dCBuZWVkZWQgKEphbikNCj4+IC0gbm93IFZMIGlzIGFuIGVuY29kZWQgdmFsdWUsIGRlY29kZSBp
dCBiZWZvcmUgdXNpbmcuDQo+PiBDaGFuZ2VzIGZyb20gdjI6DQo+PiAtIE5vIGNoYW5nZXMNCj4+
IENoYW5nZXMgZnJvbSB2MToNCj4+IC0gTm8gY2hhbmdlcw0KPj4gQ2hhbmdlcyBmcm9tIFJGQzoN
Cj4+IC0gTW92ZWQgemNyX2VsMiBmaWVsZCBpbnRyb2R1Y3Rpb24gaW4gdGhpcyBwYXRjaCwgcmVz
dG9yZSBpdHMNCj4+ICBjb250ZW50IGluc2lkZSBzdmVfcmVzdG9yZV9zdGF0ZSBmdW5jdGlvbi4g
KEp1bGllbikNCj4+IA0KPj4gZml4IHBhdGNoIDUNCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gQ2hhbmdlLUlkOiBJZWY2NWIy
ZmYxNGZkNTc5YWZhNGZkMTEwY2UwOGExOTk4MGU2NGZhOQ0KPiANCj4gWW91IGhhdmUgYSBzaWdu
ZWQgb2ZmIGFuZCBhIGNoYW5nZS1pZCB0aGF0IHNob3VsZCBub3QgYmUgaGVyZS4NCj4gVGhleSBh
cmUgaW4gdGhlIGNvbW1lbnQgc2VjdGlvbiBzbyBzaG91bGQgYmUgcmVtb3ZlZCBkdXJpbmcgcHVz
aCBzbyBtaWdodCBiZSBvayA6LSkNCg0KT2hoIHllYWggSSBtaXNzZWQgdGhhdCwgcHJvYmFibHkg
aXTigJlzIGZyb20gYSBzcXVhc2ghIA0KDQo+IA0KPiBDaGVlcnMNCj4gQmVydHJhbmQNCg0KDQo=

