Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F96697EC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477305.739952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJhD-0006rV-UO; Fri, 13 Jan 2023 13:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477305.739952; Fri, 13 Jan 2023 13:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJhD-0006oT-Qt; Fri, 13 Jan 2023 13:02:11 +0000
Received: by outflank-mailman (input) for mailman id 477305;
 Fri, 13 Jan 2023 13:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGJhB-0006o4-Fj
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:02:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b81a98d-9342-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 14:02:07 +0100 (CET)
Received: from FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:98::7) by
 AM9PR08MB6641.eurprd08.prod.outlook.com (2603:10a6:20b:306::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12; Fri, 13 Jan 2023 13:01:55 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:98:cafe::b8) by FR2P281CA0146.outlook.office365.com
 (2603:10a6:d10:98::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 13:01:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 13:01:54 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Fri, 13 Jan 2023 13:01:54 +0000
Received: from 29ec6b98b14f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E914AE9-2269-4D47-95D5-EA95F4F28A24.1; 
 Fri, 13 Jan 2023 13:01:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29ec6b98b14f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 13:01:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB7939.eurprd08.prod.outlook.com (2603:10a6:150:8c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 13:01:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 13:01:37 +0000
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
X-Inumbo-ID: 7b81a98d-9342-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YydpJQ5BqAochuT5p5Ad58KsgXhuW3CfYok9+73yKz4=;
 b=yyL4AuS+98Lq2HsLwBEGZh2HeYvLXXcxeNOSdQbe+Zp3BC5sX3mN9nnNpdKkm5Y3oQw9gTxPmzMmipi+cdFAAGWIMOYmpbJvW+Zs0tpQpvE6Al61tbLSygxXHdg/tBg/cFPWgU0oWPuN6xRRCNQ4+lZAE4c09nfN6z66sK9IRIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b5028978a5c9f95
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxYQ65e2ASmXXScWqOMUwdF4sohoJ8U8TACjyraNlxRfhrpG0CmAykbd1cNcb+J9syqZPCykn3WM42+xYmiSMqQLDrNJGeRhXKPYCAB3lzklTLGTSdQ7DO4s8+qBDGK9tOBYAvtz4U1tq7j+PqihHhVFfaRZ0vmqvsks+nTIywB5VMvS5U8VjfX3+dhJGplD/YgkpeT0AcdyWpePqdkmkR/K9K6t8sqpa+zvYeC2jfrKWxgRfj4icaAI0NXHn3u6qNmDNgKC4Jx+k87HXhSNqoW1g/fUcqM9qhlgsvbwvGp1qwwwkerdSl3O/7bOzQxxM7S1gyDabqSdL6Uvwzd3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YydpJQ5BqAochuT5p5Ad58KsgXhuW3CfYok9+73yKz4=;
 b=HT4in+xpV8iEJepsXbnNI4TNc6eUNpXJqGLs2g2PlmQqaeJ/Ovwk7sHG6VC2MArOSU5MxVv67k9MuRSjxwsknBJoysDx1XeRP2Z3ZMhgNNrGmizcBtyIT84YFO/BhArX13BLMCVu0qH2+T2jOjl1H5eCKdZKeTuRlmTn9qgbRfCSMG0ro+lHKlGjyeRI3gC/NZAJS8HtyL7zXHdjDe9VPqjR/EqLNdJktwsrLD5h3ph9bguoYmXwhIDz96X4EQVePusZreDpen8jqM3SDXqMQrc8FS7/TI7W28je1wNQwFsNpGN725yz9sJX54SK3j1HK3On/wnxwmS6Z8BsU21JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YydpJQ5BqAochuT5p5Ad58KsgXhuW3CfYok9+73yKz4=;
 b=yyL4AuS+98Lq2HsLwBEGZh2HeYvLXXcxeNOSdQbe+Zp3BC5sX3mN9nnNpdKkm5Y3oQw9gTxPmzMmipi+cdFAAGWIMOYmpbJvW+Zs0tpQpvE6Al61tbLSygxXHdg/tBg/cFPWgU0oWPuN6xRRCNQ4+lZAE4c09nfN6z66sK9IRIA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC PATCH 2/8] xen/arm: add sve_vl_bits field to domain
Thread-Topic: [RFC PATCH 2/8] xen/arm: add sve_vl_bits field to domain
Thread-Index: AQHZJcqDGP094PnLfE+ehr42WQkWI66ZeH+AgAEkTQCAAXROAIAAQZoA
Date: Fri, 13 Jan 2023 13:01:37 +0000
Message-ID: <31CD6EFE-D460-40AF-AABA-D28772635288@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-3-luca.fancellu@arm.com>
 <91b5c7db-ec9b-efa6-f5cf-dc5e8b176db6@xen.org>
 <9168CB2A-A1F1-43E0-9DAD-BB31AD3979E0@arm.com>
 <096b4129-ace6-01b6-85c1-b153d3bc4ada@xen.org>
In-Reply-To: <096b4129-ace6-01b6-85c1-b153d3bc4ada@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB7939:EE_|VI1EUR03FT021:EE_|AM9PR08MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: 318c1bd7-4eb7-45f1-f68c-08daf5665892
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YsLz36Pfvv81vbYYo67Frz7SWTvykgM96ie9q7Z4ONomugV/n127x4dFVQ42RGVHA6RswnVpRNbhrRTgskWfQI6MqEDZn6Z8d2hoJs82H40TrV/FY6W3wLKqeLRaz6tHW7eGvOjJJtH964NJ6BIV2vjHwsg3hD7Th6X7mx9TImWnOo7T1GhOHJBhk8g/HFXcVLCClPqBe/S+LJ/cbc1It8F4hYF2MLvK5SMHyUEL4qkZT+4b0LrGE6KLPJ4nAaSA3WQVKuuiEOG7zbq/UCBIOhJgWaMne3xf5NDhjupQ4AcxhVkgwQl87DMkSd6SYyRk8gyNzIPSdsZ732BFztVz9EL68484Zb2ZTgMGwwl0yaVnLBSPEESA62CxPY8Cn+m7Q5xoLWJrZw6Fm8FNOCWQYZ7XQkS2HPrxniypDcgdSREDAE/NbmqcEaiZOFV4lYE97a0Rwko27K5zx0c7qfjQP6H8bAJQkoZIsO41rYzS7pv97YZm04Q9w7oeyCgw5A4mQ6hnwHeBbw/DcM60cvXM8Wa4VAfRrnWP6q50S3qKBogBEt5/soPEmWrjE9u/2+g9C0cvZ2/Cq5o6U8/iALkuaOhpdbUdvV2NegPbXajzpR+32764Ii1eKQPUsxf9njN2rXFW26LIOq57kClrKgRA8TutIpCSQHomib/LJbKjgkPmljPnAQPZ+yo8ofUaTKvQ0qM+YYYfwAsLYUiO03ukHoOp7x6KO5jY6W5r4S8olwE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199015)(83380400001)(316002)(6506007)(54906003)(71200400001)(86362001)(6486002)(6916009)(33656002)(38070700005)(36756003)(5660300002)(122000001)(38100700002)(6512007)(26005)(186003)(2616005)(76116006)(2906002)(66446008)(478600001)(64756008)(41300700001)(8676002)(8936002)(66476007)(91956017)(66556008)(4326008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <32D4C7F170D1014D9CAF4FDC82146705@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7939
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ef58ddb-ec29-4345-70d9-08daf5664e47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DyTvWELsstQIq+YRWfRLufFXsso4IghZ7lfasVDnUO4p3KdZ9w4fg0PMSUk9NekIox62WwKjOFvZnzxzL+NnYbzQpHbOo9uv0yu6fWzqNWzldrTq9cZp3av2RiVBh8g80IpRWEeGpp9r/wOwSFAPRysPme/qc4P0txWUtRlwzTSciGkVkw1n9MRWuA5jqxcVdQ7JxIzBV5GPAn5THdiiTldYaURRW6Gi31B+zP3IN1+2RJ9rQSYe0QBOLTuEghrjKDPxa6B+HV69j1uyVfNqzNaW/mLT7xrwiHHGq76pcYn7tWpJckcvyGE5yZSf3HLBKrl1mSW0D0nlw0k0qRQUgYN6sQr9s8oZYENaSEVNoyedYRQY9uAckxCWAvZWZcPLo/6V6AS6NaXwzbFQs4egAcTR8ptGfK4xmiULeM82vWoY20v2v/u9nuPVEnkU7EHVkVlKkQGq4eYJzwaXL8+Sd0XpB/AbxR4TNScHUG1dqkxZ3IrQOPleMWQPuUFgE7u0c6SsMT3oC/G64oSFuyAKqfbv/+cLxq34309M4wSBM4XPoVEyqOf6rM/WAtsSVtltsZgpZcVTSbd55dR7gfaez9EPYRyL0TDp0ar3tgIvIrysR7qroWBM4N++vCk3hO7l7xH47gGaEqID6A6TKjMidvFPtdAgZRHmh30eG7xJjucY5+QBoI6gkRcIPJPtkRHQoKQstQAuDiL/5O5qaUDYdQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(336012)(70206006)(70586007)(8676002)(356005)(4326008)(316002)(81166007)(2616005)(54906003)(33656002)(40480700001)(2906002)(36860700001)(5660300002)(82740400003)(47076005)(40460700003)(41300700001)(36756003)(6862004)(83380400001)(478600001)(8936002)(186003)(6506007)(6486002)(26005)(6512007)(86362001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 13:01:54.6436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318c1bd7-4eb7-45f1-f68c-08daf5665892
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6641

DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluLmMNCj4+Pj4gaW5kZXggOGVhMzg0M2VhOGU4Li4yN2YzODcyOTMwMmIgMTAwNjQ0DQo+
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluLmMNCj4+Pj4gQEAgLTEzLDYgKzEzLDcgQEANCj4+Pj4gICNpbmNsdWRlIDx4ZW4vd2Fp
dC5oPg0KPj4+PiAgICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+DQo+Pj4+ICsjaW5jbHVk
ZSA8YXNtL2FybTY0L3N2ZS5oPg0KPj4+PiAgI2luY2x1ZGUgPGFzbS9jcHVlcnJhdGEuaD4NCj4+
Pj4gICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPg0KPj4+PiAgI2luY2x1ZGUgPGFzbS9jdXJy
ZW50Lmg+DQo+Pj4+IEBAIC0xODMsNiArMTg0LDExIEBAIHN0YXRpYyB2b2lkIGN0eHRfc3dpdGNo
X3RvKHN0cnVjdCB2Y3B1ICpuKQ0KPj4+PiAgICAgICAgV1JJVEVfU1lTUkVHKG4tPmFyY2guY3B0
cl9lbDIsIENQVFJfRUwyKTsNCj4+Pj4gICsjaWZkZWYgQ09ORklHX0FSTTY0X1NWRQ0KPj4+PiAr
ICAgIGlmICggaXNfc3ZlX2RvbWFpbihuLT5kb21haW4pICkNCj4+Pj4gKyAgICAgICAgV1JJVEVf
U1lTUkVHKG4tPmFyY2guemNyX2VsMiwgWkNSX0VMMik7DQo+Pj4+ICsjZW5kaWYNCj4+PiANCj4+
PiBJIHdvdWxkIGFjdHVhbGx5IGV4cGVjdCB0aGF0IGlzX3N2ZV9kb21haW4oKSByZXR1cm5zIGZh
bHNlIHdoZW4gdGhlIFNWRSBpcyBub3QgZW5hYmxlZC4gU28gY2FuIHdlIHNpbXBseSByZW1vdmUg
dGhlICNpZmRlZj8NCj4+IEkgd2FzIHRyaWNrZWQgYnkgaXQgdG9vLCB0aGUgYXJtMzIgYnVpbGQg
d2lsbCBmYWlsIGJlY2F1c2UgaXQgZG9lc27igJl0IGtub3cgWkNSX0VMMg0KPiANCj4gT2suIElu
IHdoaWNoIGNhc2UsIEkgdGhpbmsgd2Ugc2hvdWxkIG1vdmUgdGhlIGNhbGwgdG8gc3ZlX3Jlc3Rv
cmVfc3RhdGUoKS4NCg0KT2sgZm9yIG1lLCBJIHdpbGwgbW92ZSB0aGUgemNyX2VsMiBpbnRyb2R1
Y3Rpb24gdG9nZXRoZXIgd2l0aCB0aGUgY29udGV4dCBzd2l0Y2ggY29kZSBpbnRyb2R1Y2VkIGJ5
IHRoZSBwYXRjaA0KbGF0ZXIuDQoNCj4gDQo+Pj4gDQo+Pj4+ICsNCj4+Pj4gICAgICAvKiBWRlAg
Ki8NCj4+Pj4gICAgICB2ZnBfcmVzdG9yZV9zdGF0ZShuKTsNCj4+Pj4gIEBAIC01NTEsNiArNTU3
LDExIEBAIGludCBhcmNoX3ZjcHVfY3JlYXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPj4+PiAgICAgIHYt
PmFyY2gudm1waWRyID0gTVBJRFJfU01QIHwgdmNwdWlkX3RvX3ZhZmZpbml0eSh2LT52Y3B1X2lk
KTsNCj4+Pj4gICAgICAgIHYtPmFyY2guY3B0cl9lbDIgPSBnZXRfZGVmYXVsdF9jcHRyX2ZsYWdz
KCk7DQo+Pj4+ICsgICAgaWYgKCBpc19zdmVfZG9tYWluKHYtPmRvbWFpbikgKQ0KPj4+PiArICAg
IHsNCj4+Pj4gKyAgICAgICAgdi0+YXJjaC5jcHRyX2VsMiAmPSB+SENQVFJfQ1AoOCk7DQo+Pj4+
ICsgICAgICAgIHYtPmFyY2guemNyX2VsMiA9IHZsX3RvX3pjcih2LT5kb21haW4tPmFyY2guc3Zl
X3ZsX2JpdHMpOw0KPj4+PiArICAgIH0NCj4+Pj4gICAgICAgIHYtPmFyY2guaGNyX2VsMiA9IGdl
dF9kZWZhdWx0X2hjcl9mbGFncygpOw0KPj4+PiAgQEAgLTU5NSw2ICs2MDYsNyBAQCBpbnQgYXJj
aF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAq
Y29uZmlnKQ0KPj4+PiAgICAgIHVuc2lnbmVkIGludCBtYXhfdmNwdXM7DQo+Pj4+ICAgICAgdW5z
aWduZWQgaW50IGZsYWdzX3JlcXVpcmVkID0gKFhFTl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01D
VExfQ0RGX2hhcCk7DQo+Pj4+ICAgICAgdW5zaWduZWQgaW50IGZsYWdzX29wdGlvbmFsID0gKFhF
Tl9ET01DVExfQ0RGX2lvbW11IHwgWEVOX0RPTUNUTF9DREZfdnBtdSk7DQo+Pj4+ICsgICAgdW5z
aWduZWQgaW50IHN2ZV92bF9iaXRzID0gY29uZmlnLT5hcmNoLnN2ZV92bF9iaXRzOw0KPj4+PiAg
ICAgICAgaWYgKCAoY29uZmlnLT5mbGFncyAmIH5mbGFnc19vcHRpb25hbCkgIT0gZmxhZ3NfcmVx
dWlyZWQgKQ0KPj4+PiAgICAgIHsNCj4+Pj4gQEAgLTYwMyw2ICs2MTUsMzYgQEAgaW50IGFyY2hf
c2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNv
bmZpZykNCj4+Pj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICAgICAgfQ0KPj4+PiAg
KyAgICAvKiBDaGVjayBmZWF0dXJlIGZsYWdzICovDQo+Pj4+ICsgICAgaWYgKCBzdmVfdmxfYml0
cyA+IDAgKSB7DQo+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCB6Y3JfbWF4X2JpdHM7DQo+Pj4+
ICsNCj4+Pj4gKyAgICAgICAgaWYgKCAhY3B1X2hhc19zdmUgKQ0KPj4+PiArICAgICAgICB7DQo+
Pj4+ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiU1ZFIGlzIHVuc3VwcG9ydGVk
IG9uIHRoaXMgbWFjaGluZS5cbiIpOw0KPj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKyAgICAgICAgZWxzZSBpZiAoICFpc192bF92YWxpZChz
dmVfdmxfYml0cykgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAgICBkcHJpbnRr
KFhFTkxPR19JTkZPLCAiVW5zdXBwb3J0ZWQgU1ZFIHZlY3RvciBsZW5ndGggKCV1KVxuIiwNCj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgc3ZlX3ZsX2JpdHMpOw0KPj4+PiArICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKyAgICAgICAgLyoNCj4+Pj4g
KyAgICAgICAgICogZ2V0X3N5c192bF9sZW4oKSBpcyB0aGUgY29tbW9uIHNhZmUgdmFsdWUgYW1v
bmcgYWxsIGNwdXMsIHNvIGlmIHRoZQ0KPj4+PiArICAgICAgICAgKiB2YWx1ZSBzcGVjaWZpZWQg
YnkgdGhlIHVzZXIgaXMgYWJvdmUgdGhhdCB2YWx1ZSwgdXNlIHRoZSBzYWZlIHZhbHVlDQo+Pj4+
ICsgICAgICAgICAqIGluc3RlYWQuDQo+Pj4+ICsgICAgICAgICAqLw0KPj4+PiArICAgICAgICB6
Y3JfbWF4X2JpdHMgPSBnZXRfc3lzX3ZsX2xlbigpOw0KPj4+PiArICAgICAgICBpZiAoIHN2ZV92
bF9iaXRzID4gemNyX21heF9iaXRzICkNCj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAg
ICAgY29uZmlnLT5hcmNoLnN2ZV92bF9iaXRzID0gemNyX21heF9iaXRzOw0KPj4+PiArICAgICAg
ICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIlNW
RSB2ZWN0b3IgbGVuZ3RoIGxvd2VyZWQgdG8gJXUsIHNhZmUgdmFsdWUgYW1vbmcgQ1BVc1xuIiwN
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgemNyX21heF9iaXRzKTsNCj4+Pj4gKyAgICAgICAg
fQ0KPj4+IA0KPj4+IEkgZG9uJ3QgdGhpbmsgWGVuIHNob3VsZCAiZG93bmdyYWRlIiB0aGUgdmFs
dWUuIEluc3RlYWQsIHRoaXMgc2hvdWxkIGJlIHRoZSBkZWNpc2lvbiBmcm9tIHRoZSB0b29scy4g
U28gd2Ugd2FudCB0byBmaW5kIGEgZGlmZmVyZW50IHdheSB0byByZXByb2R1Y2UgdGhlIHZhbHVl
IChBbmRyZXcgbWF5IGhhdmUgc29tZSBpZGVhcyBoZXJlIGFzIGhlIHdhcyBsb29raW5nIGF0IGl0
KS4NCj4+IENhbiB5b3UgZXhwbGFpbiB0aGlzIGluIG1vcmUgZGV0YWlscz8NCj4gDQo+IEkgd291
bGQgZXh0ZW5kIFhFTl9TWVNDVExfcGh5c2luZm8gdG8gcmV0dXJuIHRoZSBtYXhpbXVtIFNWRSB2
ZWN0byBsZW5ndGggc3VwcG9ydGVkIGJ5IHRoZSBIYXJkd2FyZS4NCj4gDQo+IExpYnhsIHdvdWxk
IHRoZW4gcmVhZCB0aGUgdmFsdWUgYW5kIGNvbXBhcmUgdG8gd2hhdCB0aGUgdXNlciByZXF1ZXN0
ZWQuIFRoaXMgd291bGQgdGhlbiBiZSB1cCB0byB0aGUgdG9vbHN0YWNrIHRvIGRlY2lkZSB3aGF0
IHRvIGRvLg0KDQpTb3VuZHMgZ29vZCwgbG9va2luZyBpbnRvIHN0cnVjdCB4ZW5fc3lzY3RsX3Bo
eXNpbmZvLCBzZWVtcyB0aGF0IEkgbWlnaHQgYmUgdGhlIGZpcnN0IHVzZXIgb2YgdGhlIGFyY2hf
Y2FwYWJpbGl0aWVzIGZpZWxkDQooYXMgd2VsbCBhcyBpbnRyb2R1Y2luZyBhIG5ldyBvbmUgZm9y
IHRoZSBWTCB2YWx1ZSksIHdoZXJlIGNhbiBJIHB1dCB0aGUgZGVmaW5lIGZvciB0aGUgYXJjaF9j
YXBhYmlsaXRpZXMgZmxhZz8NCklzIGl0IG9rIGluc2lkZSBzeXNjdGwuaCBzb21ldGhpbmcgYWxv
bmcgdGhlc2UgbGluZXM6IA0KDQojZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9BUk1fU1ZFICgx
dSA8PCAwKQ0KDQpvcg0KDQojZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9BUk1fU1ZFICgxdSkN
Cg0KQW5kLCBpcyBpdCBvayB0byBwdXQgdGhlIFZMIHZhbHVlIGluIHRoZSBzdHJ1Y3QgeGVuX3N5
c2N0bF9waHlzaW5mbyBldmVuIGlmIGl04oCZcyBqdXN0IGZvciBhcm02ND8NCg0KDQo+IA0KPj4g
QnkgdGhlIHRvb2xzIHlvdSBtZWFuIHhsPw0KPiANCj4gSSB0aGluayBsaWJ4bCBzaG91bGQgZG8g
c3RyaWN0IGNoZWNraW5nLiBJZiB3ZSBhbHNvIHdhbnQgdG8gcmVkdWNlIHdoYXQgdGhlIHVzZXIg
cmVxdWVzdGVkLCB0aGVuIHRoaXMgcGFydCBzaG91bGQgYmUgaW4geGwuDQo+IA0KPj4gVGhpcyB3
b3VsZCBiZSBvayBmb3IgRG9tVXMsIGJ1dCBob3cgdG8gZG8gaXQgZm9yIERvbTA/DQo+IFRoZW4g
d2Ugc2hvdWxkIGZhaWwgdG8gY3JlYXRlIGRvbTAgYW5kIHNheSB0aGUgdmVjdG9yLWxlbmd0aCBy
ZXF1ZXN0ZWQgaXMgbm90IHN1cHBvcnRlZC4NCg0KRmluZSBmb3IgbWUNCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQoNCg==

