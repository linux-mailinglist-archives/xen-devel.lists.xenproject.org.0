Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6642A27F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 12:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207092.362842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maFEG-0004Bc-VS; Tue, 12 Oct 2021 10:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207092.362842; Tue, 12 Oct 2021 10:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maFEG-00049U-RD; Tue, 12 Oct 2021 10:41:52 +0000
Received: by outflank-mailman (input) for mailman id 207092;
 Tue, 12 Oct 2021 10:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maFEF-00049O-B1
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 10:41:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 017918ba-2b49-11ec-811d-12813bfff9fa;
 Tue, 12 Oct 2021 10:41:50 +0000 (UTC)
Received: from DU2PR04CA0347.eurprd04.prod.outlook.com (2603:10a6:10:2b4::27)
 by VE1PR08MB5856.eurprd08.prod.outlook.com (2603:10a6:800:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 10:41:40 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::52) by DU2PR04CA0347.outlook.office365.com
 (2603:10a6:10:2b4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Tue, 12 Oct 2021 10:41:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 10:41:40 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Tue, 12 Oct 2021 10:41:40 +0000
Received: from e976e0b4b12a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3F02F59-F06D-47F3-A243-F9B4CAFBE269.1; 
 Tue, 12 Oct 2021 10:41:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e976e0b4b12a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 10:41:29 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0802MB2582.eurprd08.prod.outlook.com (2603:10a6:4:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 10:41:23 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:41:23 +0000
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
X-Inumbo-ID: 017918ba-2b49-11ec-811d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu7nT04e8SwimeoWa4uhZ2M5IJUjFclNEp5sAd9mDcU=;
 b=nkLIgogfRs0rR6VHs7qZc95TfY1lIrNc33E2IRIpIIM143XScih5pIg+40SD83SK1W/WyyqXOb3ae8aEMOvK5zfFMXpEAxI1EcphckzNHjuOHzCtNKkyG6KTWwyjOkF19w7sySw6oSDGEKGWAHeyaT9s9BrNejuiDmupfZNsrx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b084969528c43722
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/Xh3t6EPbUDcgwHDidQqGzYBEPBaxPQ2jrazC4ZEDromrbAJ4uQnlAjpwnmV/L/MROwRVyNOCTMR+J7xiLOUv0TJTMZf4do54wMBYStDv9wQkyCTwxPhS2lhl8ZcrrE6lUoY5wC+jFKeXrmisZs3J+H394kyjOhqCXI2gPnf0Scp5bMzXk3KiVAA97Lln2E5k04ilkH2wU+yDEbSlXD2eah115Snaw5CDrXG8T+ieOUWaqyulbnV1P6GaBK8kUb3Eoh6Xl3SSZi69lNUn8O+m7Dflf2G2rBQ7w4aTQyFVXDiw3uz+fVp8mlshLTKt8bZR7v5z41IPwpwQfbjJ9lAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu7nT04e8SwimeoWa4uhZ2M5IJUjFclNEp5sAd9mDcU=;
 b=M2HXLF8KrsGLfQffjNbJBjlXilQ8tr6CwvO4gUehBU4C5UCrT7yz8TSDhak7ZpkYS6uOWFUsh83koB1hiXM1wvNmg6ByDBui4SmAt3thQFlfb5NeVwYyWOgcPnAuZhVDbT0toTPlP8gOW0T9qEA6aXBrYq6raG2Ks9/ptdRQFhT+rFmw2o8TzWgXFDnUz+xym/xGSXEI4iPmtJ9GVLPLQEeu68qkWDGCAAaJfNh3pU3F4bj+eoDTzDbH325/2TdqsdEoNsIzTm6rQvK1NreV1lC5yu5wTXysnKHd5zVOEOhk1C3/0kxyu2CYyoTbN85dpcHROO/Q+qdYvdL0WHP7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu7nT04e8SwimeoWa4uhZ2M5IJUjFclNEp5sAd9mDcU=;
 b=nkLIgogfRs0rR6VHs7qZc95TfY1lIrNc33E2IRIpIIM143XScih5pIg+40SD83SK1W/WyyqXOb3ae8aEMOvK5zfFMXpEAxI1EcphckzNHjuOHzCtNKkyG6KTWwyjOkF19w7sySw6oSDGEKGWAHeyaT9s9BrNejuiDmupfZNsrx8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index:
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0ICAAQCPgIAAA0qAgAAOJYCAAAHCAIAABnQAgAABQgCAAAQNAIAABdAA
Date: Tue, 12 Oct 2021 10:41:23 +0000
Message-ID: <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
 <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
 <09656882-b297-7144-c291-1ee997edb119@suse.com>
In-Reply-To: <09656882-b297-7144-c291-1ee997edb119@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7f701b-1974-4294-05ae-08d98d6ce042
x-ms-traffictypediagnostic: DB6PR0802MB2582:|VE1PR08MB5856:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5856C976AF6A71A9D37CA28D9DB69@VE1PR08MB5856.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j36J/qGzBTdW2KjK9xEepxp5r/V/cLYdRLTW7pNO+QZJIrG3qp6a+uoy1TlosGzEv0JG4RxQoIrPs9r3Hz3RH6GkW7Q2D5fwF54MHbj+XrIEf02yXLnfQONRvpv7z2MDy2tqjmn04uyrJmQ7HTIn8bdMn34S9ytVoAy698WdaJyICjCvuLfDczRFaX1uKGkiFEvZeQ/R8SY6JcCraIJbF2K99EZqEwilxMwSejJHA8ktHj0mlJOsEp6kIwUKstgEFcU8M86i1vZK12nLsbPEhuvSJaiWsEsPHOZYiBnsGpPXJFECh0QWv5+i5Dw6hPAoIUvDBmoN4u4uAw/puGXKbwV3qUz3HlF4K6KqsL7zkMZM84t5EpOBmLpQL8RljvcTumEEEekhgNVT5OCdP+wV8cFEbj+LS6ZNPgL/ajwuegoV/HmF0l+cR6iPJ0AWY8NViVcp270FgOT3MZFWq24IY5GjQf2PRzHAEaDmLI9D5RpwD/CA7PMz1dlOKVHY4N9hFmcM6yWNUo5dZIZglG6RvlmBxxQqn0cRErFYZl/d7btxdu3ITQm5hssKvBZVAWQnVGBpFp3iXLWwONOBqnW6ubhhoWe+c2w4/OfafpYkgCeT3uL2KJEarH3C8fLDvGyLc4QRjGbhPIy/sJZWeg9iRmD+rhbTGNVz2s/0EuUJiqKTHvsq4ilAKn5PRFGL7HYxE9BhokBM3Wl4UbMTXvErTDeUEQR5JxamyrH4w6ABCVN1KWA5rLwAlsk9psit+tr8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(4326008)(186003)(6506007)(8676002)(66476007)(26005)(54906003)(6916009)(38100700002)(36756003)(8936002)(66556008)(53546011)(316002)(6486002)(86362001)(2906002)(2616005)(508600001)(71200400001)(66446008)(33656002)(38070700005)(122000001)(64756008)(66946007)(76116006)(91956017)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <44730136B7A0B2488DB839C18441993E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2582
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b68a57c3-1e78-40aa-92ca-08d98d6cd5f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GWE8Yb2GtpqvIr1lhm7oqXO5NisWC/dECksAMZZrTZXS/ZeRbVtUgpv6zKoqTynxOLjSUJqy1RZbixU4d7uwAVh92dolR0qERd+7ls6hY8GFbg80SVxmE/mvtwVlW/S1U65ZZeYsoyAZRAZKseAAAga1zyzZ3RCWspPYEvA/u1f6g7iCQFWBuCKywMxFn9WYKoE46aEZsumkbWcx6lUnhBy+GOtbl9nosbHvxXSJ/3y0wKHvFVwgDWAKuD2c1iqj9Ax/HOhZ9VNCX6yQKgcmKwlWb3SQ8kh8aZWYFFTwxciAS4ehAgUdv3nwuHuIXyW9c1E+RHZTZfLdrgT8pj3QaJWrkyufyimmfYzUHadKaMqwoNSMKgeEL0XajhoenMqakctwMZfF5ds4XEMVj6YCKYe7Mqr74SzCOi18neMtL7N6wRjDoJrFxlVeew6M8uscVphexiKSJ2+un5SmyvwQpCDzSnMmAMgaiWQMVg0VN53tecEfHwo+KAxK0IHTbaAH7FB3d+Ql4kTmOoz3G2KrlyOMh/xlOEl3w29GWa+mDZak04evxHvkk059S9DEXPpuuRwEqzpJXKx7bRQ/Vrwl4SLgsB2mGbcZywVj1z1eBuYK71vtYmK/bi+1+SlCQ84rUcAadXiHn87KHws9/+qiosdUeNzja0Y7DN+CXb30WxfBmQTLxNI9BYNQT0H53CGUTlKqs0pZxLneqcObAx7AQQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(5660300002)(2906002)(86362001)(508600001)(81166007)(107886003)(6506007)(53546011)(186003)(36756003)(36860700001)(2616005)(336012)(6486002)(47076005)(82310400003)(8676002)(6512007)(54906003)(6862004)(33656002)(4326008)(356005)(8936002)(70586007)(70206006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:41:40.7973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7f701b-1974-4294-05ae-08d98d6ce042
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5856

Hi Jan,

> On 12 Oct 2021, at 11:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 12.10.2021 12:06, Oleksandr Andrushchenko wrote:
>> On 12.10.21 13:01, Jan Beulich wrote:
>>> On 12.10.2021 11:38, Oleksandr Andrushchenko wrote:
>>>> On 12.10.21 12:32, Jan Beulich wrote:
>>>>> The minimal thing I'd suggest (or maybe you're doing this already)
>>>>> would be to expose such BARs to the guest as r/o zero, rather than
>>>>> letting their port nature "shine through".
>>>> If we have the same, but baremetal then which entity disallows
>>>> those BARs to shine?
>>> I'm sorry, but I don't understand what you're trying to say.
>>>=20
>>>> I mean that if guest wants to crash... why
>>>> should we stop it and try emulating something special for it?
>>> This isn't about a guest "wanting to crash", but a driver potentially
>>> getting mislead into thinking that it can driver a device a certain
>>> way.
>> Well, for the guest, as we do not advertise IO in the emulated host
>> bridge, the driver won't be able to allocate any IO at all. Thus, even
>> if we have a BAR with PCI_BASE_ADDRESS_SPACE_IO bit set, the
>> driver won't get anything. So, I think this is equivalent to a baremetal
>> use-case where we have no IO supported by the host bridge and
>> a device with IO BAR.
>=20
> Oh, now I follow. Fair enough.

So there is no comment remaining on this patch ?

Would it possible to get an ack on it ?

Thanks
Bertrand

>=20
> Jan


