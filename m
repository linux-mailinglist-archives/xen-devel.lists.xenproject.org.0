Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569D3FA62B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 16:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174376.317955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJyuq-0004W8-Eh; Sat, 28 Aug 2021 14:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174376.317955; Sat, 28 Aug 2021 14:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJyuq-0004Ta-Ac; Sat, 28 Aug 2021 14:02:36 +0000
Received: by outflank-mailman (input) for mailman id 174376;
 Sat, 28 Aug 2021 14:02:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJyuo-0004TU-SF
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 14:02:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 970c1f9e-0808-11ec-ab6b-12813bfff9fa;
 Sat, 28 Aug 2021 14:02:33 +0000 (UTC)
Received: from DB8PR06CA0056.eurprd06.prod.outlook.com (2603:10a6:10:120::30)
 by AM6PR08MB4882.eurprd08.prod.outlook.com (2603:10a6:20b:c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 14:02:31 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::68) by DB8PR06CA0056.outlook.office365.com
 (2603:10a6:10:120::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Sat, 28 Aug 2021 14:02:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 14:02:31 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Sat, 28 Aug 2021 14:02:31 +0000
Received: from d2e8d1c7b429.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 344BC3BF-5A4C-4D22-8867-5E9E352247D9.1; 
 Sat, 28 Aug 2021 14:02:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2e8d1c7b429.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 14:02:25 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com (2603:10a6:20b:39e::19)
 by AM6PR08MB4309.eurprd08.prod.outlook.com (2603:10a6:20b:bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 14:02:24 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::d3d:d054:2fe1:e3a3]) by AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::d3d:d054:2fe1:e3a3%5]) with mapi id 15.20.4457.023; Sat, 28 Aug 2021
 14:02:24 +0000
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
X-Inumbo-ID: 970c1f9e-0808-11ec-ab6b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tldh9PMds4EnoTN8NXMfFwAXWlmY6JW0cNWPUPnfLE=;
 b=HKJ4HvF1r3YaqtFpzBI8JVtB7h/xeDh2sz8nIZFRdmdz+DGK2BP+TwrwpW6jyAvZjtVQdVpdRlhz2ipBFpE85MavsVi3LKrl124EsLEjdOKnBIWJ4uj39oZd0nIw3WX1svB5FTqX/iWbAjsAXl4wpXkF/nu7mHVu4co5CdqLMv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNQHL4VvJtexaVgeoxqRWb11LzpasEcAJgYN2VG8RQhx2BrLCYI21qudNfG7CZ7JYfzm0i0n+Gb/tAGbj8P+3sD5ZA69J36oIlJ4szTA/idNeBxf3y4s9OgHwzCmKuPNMAAA4GVktQnlb4QwE7dGYlUbVq/GLkgSDqS9OeZvd/3lKmNxEAvQxvGQ0yIsed1BQY1LAKR9HBv+NHfMORTEsIcWiLYz1xuJbRYAK7KmKPTMAuk/gppvvI2HNXkgX0QZQpJbyRQaybUlTcDi1QyZz1SlSRMC2P8HDQEXGreVl9z+qtUqFdFxxlbshdx0HVgIudTg/9iYgNdzsOi2koNIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tldh9PMds4EnoTN8NXMfFwAXWlmY6JW0cNWPUPnfLE=;
 b=BQe1150UqXUn/NDHSB3j8FpaCgpe4ssIz7xITO9idr2ok7ca+TariwPzzQfIcZs0+ASqBLqlWi87Tmzu1Zh+5HksQHV73nTTTbMTBzczs+4onyr9pMmZbeC4mGQW/nQ7uXfVkJwuN4ot5c7zQlgm5VWyo6vP8AMHYPP1HpMtf/wHHmDAhR174NBrsEbSjELssgl798iOXPVfO4+/Zn41+Bw8kHSyfm3Vb+ia0sKC0adVsvxPa0kAK6DaQl1zM36xnUN0HsZ40NFLDLEKNWeLVhOYKCxYgN0JAFel1hR+L5vAqnYPaqBCiFiaFfIhlxaCIZGzn5DYmWvv0s4FSHGmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tldh9PMds4EnoTN8NXMfFwAXWlmY6JW0cNWPUPnfLE=;
 b=HKJ4HvF1r3YaqtFpzBI8JVtB7h/xeDh2sz8nIZFRdmdz+DGK2BP+TwrwpW6jyAvZjtVQdVpdRlhz2ipBFpE85MavsVi3LKrl124EsLEjdOKnBIWJ4uj39oZd0nIw3WX1svB5FTqX/iWbAjsAXl4wpXkF/nu7mHVu4co5CdqLMv0=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
Thread-Topic: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
Thread-Index: AQHXjptQCVAwokAljU6uEdAOvxt6uKuHg4WAgADUAaCAAH7iAIAANfMA
Date: Sat, 28 Aug 2021 14:02:24 +0000
Message-ID:
 <AS8PR08MB685360E10DE9D2BA9166A4C39EC99@AS8PR08MB6853.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-39-wei.chen@arm.com>
 <86469c72-68d0-2a30-66ef-497884125437@xen.org>
 <DB9PR08MB68570138E19683934DA86B1B9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <0b4ac394-03c4-9ed7-29cd-339090ae5768@xen.org>
In-Reply-To: <0b4ac394-03c4-9ed7-29cd-339090ae5768@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4BB4CB25F4F6484D9764961FD0C7602C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 153aae33-1dec-453d-d460-08d96a2c7a81
x-ms-traffictypediagnostic: AM6PR08MB4309:|AM6PR08MB4882:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB48822A854943874BFB627C1E9EC99@AM6PR08MB4882.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y/7x5plhD2xCshT1ypz0yXlLOeFgHf5y3BNGk7I1Rt6ZX16B8TULFs7MYgw8xXuy9oktivt6CX+Nty1cGQQf8rknTDGfJtMWP73+CdpyKrJuYTrlMRTCArTkrw14qiMmzPgl6TgJOXq5dWLjFrxogPWQG3DZAPAnniGSnMEvp6EbeF1zzk+GdzYCjBuVZxag96mGVPnzD5w+cx9qa7NFXrxfpFKWjarOXnuQwJkLpNp/uzRWzAhBMHO55hxXWrxS/idoV2hfpiDMyPSAYjfhA8KEwLHD6MAhreCaMsAq8OvrJ4Bn59CnO7cFDOlr8RFjLFeaqHpOFQapYXirK6ggNx/IP3kUJc9YPm7UZ+HlzlHty5KrCvjp6NhM5CC5s4LOuWkwK//lQBkYASzvPE6uX8ur3aa4R751bP8ZDb+Ru/8/D67vwV+VPc9RJc65jYrtkUJdVD7Ef3nrdF3CGStBS32GElzV14wgG4eWYs5ZBLuM6jNuSd05Fi0LvlY6JauCjdhnZhNH0f5kVzCDBl5zxxfo1o1szCPEYkRTiSoS+O+pW31l5HmXAhvWY9tBz3neN4TmMj8DFltPnq6l6zN+Rq+cJ4PW+C467o3oL53xmspOa4/39QEi7xFB9b/5oV2gzNoHEgkw6Apb7xC9w6Aq+cgsiEZsa4K/F3S3YpWY/4Ewo6H4NFr8XSE4pMjq/osjNOgrVdUvch1dta0K5fz9fw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6853.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(396003)(366004)(346002)(2906002)(33656002)(122000001)(55016002)(52536014)(9686003)(4326008)(38100700002)(8676002)(38070700005)(7696005)(66476007)(83380400001)(5660300002)(71200400001)(26005)(66446008)(53546011)(66556008)(64756008)(478600001)(6506007)(316002)(186003)(8936002)(86362001)(110136005)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2hacXNXMEZGMld6clFqVHR1R0FqbGlqWm1qbU5mTHFjVWlrZFBTR1MySEph?=
 =?utf-8?B?QWJwNHFMemtSOVRzUEYvV3FsZytnRlZLMXJITHVMdForSGJlaU12bHRwNWJh?=
 =?utf-8?B?c1FDK29TbG1yb1A0SnB0dGJub1FORXRUUmovWC9vWDN2YjFhZzVtY21oTU1H?=
 =?utf-8?B?YXIzN01QMTNwUjlmRW0yUHFNdmNBL0M3MWZmQWJjcDkzRHJKR0laK0RXREZH?=
 =?utf-8?B?cXdCcEVLdFRjTktiODFDMmlQOEVMZzBWc0hwTmtPQ05SZmVuVXpmcnBKQ2l4?=
 =?utf-8?B?anBCNEM0dk45bG4wSUMwUStMYUY3UUpRNDFTZGJwRTZKeWUrYVcvVG9wV2Fn?=
 =?utf-8?B?VnlUZlBnSnE5YmVmQzhhMXZDZTBpUnQ0bVJHQVQvQ1k3QTRiOUJPcER3UzVv?=
 =?utf-8?B?d3NJNmlEdGp1cE94Z0tlSjBRNXJGNWw0a3RHRS9QYTRaRiswSC9QZkh2bG5k?=
 =?utf-8?B?bjN5Snp0ZG1oQ3I1ODh4QXdTWFY0UlJvQlBjdUEwQSthZldaaVFaSG9CcFhP?=
 =?utf-8?B?NGN0LzQzN0FQZFFHY3hJSkhHeHVHcXJaNnlDMG4ycU5kYmxxdC9vUDZmYW52?=
 =?utf-8?B?cnA0ZCt2NnNZNWlFSFZFS2dPSkhWVlZSTGdrQzBtUVdYT0ZZUGtFSGNCMGRH?=
 =?utf-8?B?cE1XVWZ5SnFKWVBPUUs5ZTdNZmRxZ3k3cWEyWXJyMGtCWFpPaEwwS0NiNWdQ?=
 =?utf-8?B?TXhmNk01Z25mUk92UE1VVStZbXY3MUlWUWh0SVpQWWN6d3V5dm1TY3JxTVlm?=
 =?utf-8?B?WEJ2ank3aml4WFk3TzVIaEhhLzlCa3VPMWtXQWhWSDhjOHQ3dU9wZjdMSE1V?=
 =?utf-8?B?NWs0NzIxRFpRaDBFc0hrVllZSk5EOEUvMzBtcG9iaUpFYjFpcjY5c1ZQQlc5?=
 =?utf-8?B?UjZKN29RU00xYmVkNzMyaTcxRG51UW9uS0x0ZzloK21xQlpVL3BpQmxyVUpu?=
 =?utf-8?B?OXFjK29HZ3lFaERNZWxJZFlENTNtWlczQXBLNlY3ZVRTa3NDNE52V25OM1Zj?=
 =?utf-8?B?Q2FnV3gwL0N6RktudTJIOWY2ckFtc2RsL0dzUmo0YjAzWGhhZnJaeVNDNDYy?=
 =?utf-8?B?eDFzQW5RUlpLZTQvcjhCQTMrY1RHK085OW9RUHhPREdWVmZ1TmtWSnZ4YVNW?=
 =?utf-8?B?Znc3UWx6UFVJVDYybTJxb3BCbllyMUc5RDBueVFpTStxMmdqb0dGckZRKzVl?=
 =?utf-8?B?YUVUNUhZbS90clAzSDhzNExSd1FXN29PemN1TTEvdndPY0t1RGM0Wkl2V0JO?=
 =?utf-8?B?d3NRbDhKWTFOeGVmejkzZ3R2ZXFQbFBQSFVqLzlDVHVCN3VwcXlxT1hFOXRp?=
 =?utf-8?B?RHlhaWxONFdobzYvbitEN05KeUJFYWNMZTNLcWlqb2J0UUdHejZmRFN6WkJB?=
 =?utf-8?B?azJMRWx0SVh1ZWcyZmc1SVhiTVByTXRLWFI1RkNRWmtsTjFGTkhpV1JKOS83?=
 =?utf-8?B?QW9lTUtxY2NrVXpaZ2VCMzR3R2NqdWNGWm5mdlV4VXRTY2tUL3pvWEx5V1Fk?=
 =?utf-8?B?SUdWemlSRHJPOG05cktIQVpNWFYvaXRFVnpIcnpvOVY3RFNDVGVBSXc3c0dL?=
 =?utf-8?B?bGZkOHR0dGE5MzlJelNMdzVQdU9ycDB2YVlXNThvZ1FzblJFYk91YWk1MHFO?=
 =?utf-8?B?bmJqWWZSSnhYQUQvcWc3RXU0d3JGY25tN2lSaFh1RGVwZFFRMFE2R1lWaEYr?=
 =?utf-8?B?bGhDQzdIL3VJNjkwTTFGdlZUeG1RWEFzWjNhckN2R0VJL09jbVJJY3MrTEZo?=
 =?utf-8?Q?zMW3b2oud3Xd9B7ORrqTIYA1JeJWz4yy92Ptfa4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4309
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4bb1e3d9-9f42-459d-e4b8-08d96a2c7623
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WvBIoVLJL071drNIIrJ6AxVIMMG+Wj1fXvG5/482VhrhCnKoedZNl6q5gjDGxSr/3/2JSkLekJCX58+VVP3curyD37yBNVeCoXkxNWc/jERf4VVZK+kAx+qJywKSmrZHKs6jW33Wl/7RcnG+G/GyAE7Jzy6UNzc/Rr4R7iMI11slZIxFJT621ZueEVyUc8Tl62Dw0R1ScYfQ3t3raGcBnBcI8qCLgaBwm1NlQqFxPJepDDBE5GdFTmE1NXtWcNyzkl0fxPDyluMkZxDS51tQgjpBhjQGRfp47bPP80X0S8vWC97DKJUtWdWj0dFGqMjtIBIpmizdhlY19B8Na4X3bwoEb/ZYObs1eO1/92QzXuRYmAn6NiB3qIK/cW7+UXUvi2/vEiyQIiTnWHvE8aIVh+CV0qFu4yLQTmmwcx8HXEFrYrHuzciiGzIiw2dC9cW2KtU3wzefObmIJrq2nU2sDtombDS/hYV0zH/VhQnGhdhJtT0ahHJ6hVqw61LVjnG+3f96d/0f7NnZqx++2HlPdtZU1aByIUO1rK05IOMSHCNsTNWxKser6Hg4bYpQukX+3S3FUXGRBKH/7PTm8QNZj9NyuY6dH8xMYrZvOg1msjIzSclytufHasofMovQ4zradzpV9ziKGcZPtMt5LHmyhCVwBKfHoda5aOUXo8GmUFOR5NGIcRYBgY/dlbQj1ULe0EW680fPsg5Qyg09SyVZkA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39850400004)(46966006)(36840700001)(81166007)(2906002)(33656002)(356005)(55016002)(52536014)(9686003)(4326008)(8676002)(82740400003)(7696005)(47076005)(83380400001)(5660300002)(26005)(53546011)(478600001)(6506007)(316002)(36860700001)(70586007)(186003)(336012)(82310400003)(8936002)(86362001)(110136005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 14:02:31.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 153aae33-1dec-453d-d460-08d96a2c7a81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4882

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjjml6UgMTg6NDUN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAzOC80MF0geGVuL2FybTogZW5hYmxlIGRldmljZSB0cmVlIGJhc2VkIE5VTUENCj4gaW4g
c3lzdGVtIGluaXQNCj4gDQo+IA0KPiANCj4gT24gMjgvMDgvMjAyMSAwNDoxNywgV2VpIENoZW4g
d3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGkgV2VpLA0KPiANCj4gPg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPg0KPiA+PiBTZW50OiAyMDIx5bm0OOaciDI35pelIDIyOjMzDQo+ID4+IFRvOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsN
Cj4gPj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4gPj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPj4gU3ViamVj
dDogUmU6IFtYRU4gUkZDIFBBVENIIDM4LzQwXSB4ZW4vYXJtOiBlbmFibGUgZGV2aWNlIHRyZWUg
YmFzZWQNCj4gTlVNQQ0KPiA+PiBpbiBzeXN0ZW0gaW5pdA0KPiA+Pg0KPiA+PiBIaSBXZWksDQo+
ID4+DQo+ID4+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gRXZl
cnl0aGluZyBpcyByZWFkeSwgd2UgY2FuIHJlbW92ZSB0aGUgZmFrZSBOVU1BIG5vZGUgYW5kDQo+
ID4+PiBkZXBlbmRzIG9uIGRldmljZSB0cmVlIHRvIGNyZWF0ZSBOVU1BIHN5c3RlbS4NCj4gPj4N
Cj4gPj4gU28geW91IGp1c3QgYWRkZWQgY29kZSBhIGZldyBwYXRjaGVzIGJlZm9yZSB0aGF0IGFy
ZSBub3cgY29tcGxldGVseQ0KPiA+PiByZXdyaXR0ZW4uIENhbiB5b3UgcGxlYXNlIHJlLW9yZGVy
IHRoaXMgc2VyaWVzIHNvIGl0IGRvZXNuJ3QgaGFwcGVuPw0KPiA+Pg0KPiA+PiBUaGlzIG1heSBt
ZWFuIHRoYXQgQ09ORklHX05VTUEgaXMgb25seSBzZWxlY3RlZCB1bnRpbCBsYXRlIGluIHRoaXMN
Cj4gc2VyaWVzLg0KPiA+Pg0KPiA+DQo+ID4gV2h5IEkgZGlkIGxpa2UgdGhpcyBpcyBiZWNhdXNl
IG15IG9yaWdpbmFsIGNvbmNlcm5zIGFyZToNCj4gPiAxLiBXaGVuIEkgaW50cm9kdWNlZCB0aGUg
Q09ORklHX05VTUEuIFVzZXJzIHdpbGwgYmUgdXNpbmcgYSBjb2RlIGJhc2Ugb24NCj4gPiAgICAg
dGhpcyBjb21taXQgYnkgYWNjaWRlbnQuDQo+ID4gMi4gSWYgdXNlcnMgc2VsZWN0IENPTkZJR19O
VU1BLCBidXQgbm90IGFsbCBOVU1BIGRhdGEgYXJlIG5vdA0KPiBpbml0aWFsaXplZA0KPiA+ICAg
ICBwcm9wZXJseS4gVGhlIHN5c3RlbSBtYXkgbm90IHdvcmsgcHJvcGVybHkuDQo+IA0KPiBXZSBo
YXZlIHRvIG1ha2Ugc3VyZSB3ZSBkb24ndCBicmVhayBhbnkgZXhpc3RpbmcgdXNlIGNhc2Ugd2hl
biB3cml0aW5nIGENCj4gbmV3IGZlYXR1cmUuIEhvd2V2ZXIsIGEgdXNlciBzaG91bGQgbm90IGV4
cGVjdCBhIG5ldyBmZWF0dXJlIHRvIHdvcmsgaXQNCj4gaXMgdXNpbmcgYSByYW5kb20gY29tbWl0
IGluIHRoZSBtaWRkbGUgb2YgdGhlIHNlcmllcy4NCj4gDQo+IFRoaXMgaXMgYWxzbyB3aHkgSSBz
dWdnZXN0ZWQgdGhhdCBtYXliZSBDT05GSUdfTlVNQSBpcyBvbmx5IHNlbGVjdGVkIGZvcg0KPiBB
cm0gdG93YXJkcyB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuIFNvIHlvdSByZWR1Y2UgdGhlIHJpc2sg
b2Ygc29tZW9uZQ0KPiBzZWxlY3RpbmcgaXQuDQo+IA0KDQpUaGFua3MgZm9yIHRoaXMgY2xhcmlm
aWNhdGlvbi4NCg0KPiA+IDMuIFNvIEkgY3JlYXRlZCB0aGUgZmFrZSBub2RlIHRvIGluaXRpYWxp
emUgdGhlIE5VTUEgZGF0YSwgYmVmb3JlIHdlDQo+IHBhcnNlcg0KPiA+ICAgICByZWFsIGRhdGEg
ZnJvbSBEVEIuDQo+ID4gNC4gSW4gdGhpcyBjYXNlLCB1c2VyIGNhbiB3b3JrIHdlbGwgd2l0aCBD
T05GSUdfTlVNQSBpcyBlbmFibGVkLCB3aXRob3V0DQo+ID4gICAgIHRoaXMgc2VyaWVzIGlzIGNv
bXBsZXRlZC4NCj4gDQo+IFRoZSBmbGlwIHNpZGUgaXMgeW91IGFyZSBhZGRpbmcgbW9yZSBsb2Fk
IG9uIHRoZSByZXZpZXdlcnMgYmVjYXVzZSB0aGVyZQ0KPiBhcmUgZXh0cmEgY29kZS4gVGhlIHNl
cmllcyBpcyBhbHJlYWR5IHF1aXRlIGJpZyAoNDAgcGF0Y2hlcyksIGFueSB3YXkgdG8NCj4gZWFz
ZSB0aGUgcmV2aWV3IHdpbGwgZGVmaW5pdGVseSBiZSBhcHByZWNpYXRlZC4NCj4gDQo+IEFub3Ro
ZXIgcG9zc2libGUgd2F5IHRvIGVhc2UgdGhlIHJldmlldyBpcyB0byBtb3ZlIHRoZSBwYXRjaCB0
aGF0DQo+IHJld29yay9tb3ZlIGNvZGUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVzIGFu
ZCBsZWF2ZSB0aGUgQXJtIHBhcnQNCj4gZm9yIHRoZSBzZWNvbmQgcGFydCBvZiB0aGUgc2VyaWVz
LiBUaGlzIHdheSwgd2UgY2FuIHN0YXJ0IHRvIG1lcmdlIHRoZQ0KPiBzZXJpZXMgd2l0aG91dCB3
YWl0aW5nIGZvciB0aGUgQXJtIGJpdHMgdG8gYmUgY29tcGxldGVkLg0KPiANCg0KWWVzLCBJIHdp
bGwgdHJ5IHRvIHJlLW9yZGVyIHRoZSBwYXRjaGVzIGluIHRoaXMgd2F5IGluIG5leHQgdmVyc2lv
bi4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

