Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA34336A9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213180.371322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcooU-0003aG-8r; Tue, 19 Oct 2021 13:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213180.371322; Tue, 19 Oct 2021 13:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcooU-0003Xq-5Y; Tue, 19 Oct 2021 13:05:54 +0000
Received: by outflank-mailman (input) for mailman id 213180;
 Tue, 19 Oct 2021 13:05:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcooR-0003Xg-O3
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:05:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc938249-39a4-4a50-9e48-0a2e9ec84e25;
 Tue, 19 Oct 2021 13:05:50 +0000 (UTC)
Received: from AS9PR06CA0219.eurprd06.prod.outlook.com (2603:10a6:20b:45e::10)
 by DB7PR08MB3321.eurprd08.prod.outlook.com (2603:10a6:5:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 13:05:47 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::f4) by AS9PR06CA0219.outlook.office365.com
 (2603:10a6:20b:45e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 13:05:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 13:05:45 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Tue, 19 Oct 2021 13:05:45 +0000
Received: from d642cc7d897b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B570AB22-6B7D-48A5-AC84-F5E7472E968C.1; 
 Tue, 19 Oct 2021 13:05:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d642cc7d897b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Oct 2021 13:05:38 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5500.eurprd08.prod.outlook.com (2603:10a6:10:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 13:05:36 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 13:05:36 +0000
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
X-Inumbo-ID: fc938249-39a4-4a50-9e48-0a2e9ec84e25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+DAAJ6yElLUOSAXT8J9gjdVlPvdfkobfHgCkZea4+Y=;
 b=fx5siJoYXLLDnTtoDbp5AQzJn4k2aSzIrRLVTX1yC46rtbdDXcwFneGoCM66Bn4EMLz4blNo86crRgrWbBxUtLBhlUT1b1Z2GCCUIBFN3usblduTIFhO11djiK0L63UHAKIjUitlLuI5EqlBo3nAlca5At27fBh+7krHScSbfJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f83d36f314adb2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZenecUtbVvSdJZ4RI1BJfSCuTGTLu+GvFMXdzt/+I2t8mvu88UdG3G9oHBYqYLFaiGp/Pds8xfFb05chVPjictrIZAEupF9j1mZtwHbY/BORcJ7yXcxLC7z42adyGPL/isM5lisYnVjOkrMc7I7ZIRu3Xn8CyPLo9S2+7gsUhVHQv5ubH6OURUaDzyIXH0cvsqBaIGjPEz+NoFpBSiNHd6TTLW1Rg+k99Ohs7/AfaCxyxfd1VUVN2ofBBCvQwHTTM0zVcmEaVd4IytfrRHPbFS8YU3k6w+NvDMJOTtLNe/S4VbTD1BjN1Fv8OVLXjGSYmYwxCr3u9SKo2wLM/KVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+DAAJ6yElLUOSAXT8J9gjdVlPvdfkobfHgCkZea4+Y=;
 b=PAyFaU8HzR8xvjN4S3bKhkHUFW+qZe93UwK3N5fQexvvEP/ajg1fIeI6wc5TD5JtBpecteUcn7Q9LkPiyMWswQOBBo/pVt6WFSS+BpzAttqWnES4bwA+TqjJQgw/byHrM4yQv1WTgunMRkPwBbJ6WioUprURq5daXRjetNjSOCHK0Sd4TZm5+7aveUDlgAcszXOYFao04OXCcFW87L3aSEymWqB5tOZkMYNYxMfvNIb9MijU5vjchwR4zkxamunXr4sdROyUBWPUAoGlhGEvTH2UH8XuOZwhW7NkmHww9q0dKCQ0qmUOBmQraDjGsKFJ4zblzrZ7ATxwEOyCS9N2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+DAAJ6yElLUOSAXT8J9gjdVlPvdfkobfHgCkZea4+Y=;
 b=fx5siJoYXLLDnTtoDbp5AQzJn4k2aSzIrRLVTX1yC46rtbdDXcwFneGoCM66Bn4EMLz4blNo86crRgrWbBxUtLBhlUT1b1Z2GCCUIBFN3usblduTIFhO11djiK0L63UHAKIjUitlLuI5EqlBo3nAlca5At27fBh+7krHScSbfJo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "iwj@xenproject.org" <iwj@xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] xen/arm: call vpci_add_handlers on x86
Thread-Topic: [PATCH 1/3] xen/arm: call vpci_add_handlers on x86
Thread-Index: AQHXxNXoEqujjTQSU06NPtp38xWsdavaQCGAgAAKNYA=
Date: Tue, 19 Oct 2021 13:05:36 +0000
Message-ID: <573C3D95-6283-4B4C-86D5-0337D061F84C@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <24f88973257b7038511a0ca49a992d38b295c26f.1634639117.git.bertrand.marquis@arm.com>
 <00829182-6055-ea88-27c1-44e1d3c7e8fd@suse.com>
In-Reply-To: <00829182-6055-ea88-27c1-44e1d3c7e8fd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 357e6c41-f8f6-46f4-9b0c-08d993012a09
x-ms-traffictypediagnostic: DB8PR08MB5500:|DB7PR08MB3321:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3321A6043349B112F579BD699DBD9@DB7PR08MB3321.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Vo7v1SDXBLjCkUpaWMFcgrFTUA/GtU1aNSOcoO9lPbqy7CgCWS9dhk+DGgd6O1ciUzhyjtk5ulkbGpodC5n4Hi1kmfw78ZWjV5DsFdDBKOLqxgN/7Mgr+waB6q8SuJktYH90MRg6RUIB29plA7uu/4UdHj8HOkihkovX5ldBKxfUcGybh77iGCyVpjczS19VVCA+to55bLnTRSSdi6RGBhCTMU3FTVtZ8sSKW3K1znkmhuiWhBHhhhUQKdR7fR0iGQ6OtOoZmh7PULUbEK+haO+FiD6vI6ebMVlGV7sxZsi4H2/MTQzn/+aijaiTRvab5SRLGgaq88bGdx6LpRDo3U9krhzxPqEIxPUVFKeIo83rqrVHW/wsp9WIaayMprS0wFRcj+CrjfrjBZOcJoQXptsrWtCgxUul4RG9mYaqP0JbxKXouRVToc61u4QdLLtzreppdGTsnvweP3UmR08lrWqPEex28Lvpg0c39xgD24EDkjGVtPR84Ru+K7LnMYuFE4XRGmlUFAlNZtR7+Ri14C7DD+AbrGbJrTH6VWMyFSNlPqTc6Ak5ZzvWnMUMaxsPj9PNMJDSg0lHfsDDpu5vior+p7wrXTDs5tpXrBl/JJSi9SctHpy0I023Y1R1kJMUpbkDtRQJuumkMH68jf/9iDIXTDXBjmXpxKug0lqubjEVJ3gUh/OdQz8e3KCX+xVRO2tBckEQDAAyxrqj+DWzS8NjlWf9zj09+PMzXH/N9+sr+yW5rT0eOGW0vM2PBHAK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4744005)(91956017)(6506007)(76116006)(66946007)(2906002)(8676002)(316002)(66446008)(38100700002)(6486002)(66476007)(2616005)(122000001)(66556008)(4326008)(53546011)(33656002)(86362001)(8936002)(64756008)(508600001)(186003)(36756003)(6916009)(6512007)(26005)(71200400001)(5660300002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6EA3B06E8B6C3644B2ABF9CF18A02C09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5500
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7928ad13-d8ed-48f8-90b7-08d99301246e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KMjJFKDNkHyRa1wvh4Mk5BcYl90f14Cz5uXQIvYYzEFEGgIIcZSLYSyMQljrBU05Pzqn9l3VNRiis1/e/1m2i1h+hl1QvSTiXDWVc+2BmUpfHOMk5+VqXLM/IJ9FoSyqCz2nFmwMV3tqtXnm7/KFCrl2K5TKRUQru+Q0N7ZoNmkLPvrrhFI3jBCYgdHIYrPx2PEoKgi9ZJ0/48K5ZObNdtZJIkO6D1lr6ic657G0PmhlaW6w2QinnhQU0LMDc2vZ05NpYOMADKUWxP7GqshpJWf2J/q5mb6LviyJeMS760TH7lPweLMPHQLB4fWmVAYPDpB/oU6PNusXPxsTQxrgBKesmC/r8+DffbTd8lDrsHE2Zso8P+yxH+BPh/ENGgQzODBj6Kwa0YvAcwr6WTAPD9FvhO2Bv7VHHaopUYvhHi+ot7yZGmv6im5J8eZiQX6EDuftrBkoTrJoYCfG+LCF812Sm4hXwZ+MR1v/ZmUAYObMPkt9bH2bscfUMAdpPEvt596CvKixNe4KK3CU+r2a3i+2jIJC2jZlOxajK3txKaNr/hcnsBqKzjDiV3ZebV8jT/Hd3c5AQwgJuNPbLKfo5axZb/TGP5ud3xTufDYD5HFRvo8IKLpUithCnYkt9aZ3x3Dz/GZsuyJenALj5VRlRKEDSwWE1ZKCPmfXHYzclo8KN2x9Vg0tNizZIuwb435Gn0ISvY0sAFCur02knDVD3A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(70206006)(5660300002)(356005)(8676002)(6506007)(6862004)(53546011)(86362001)(4744005)(47076005)(508600001)(6486002)(81166007)(186003)(36860700001)(316002)(33656002)(36756003)(2616005)(70586007)(82310400003)(2906002)(4326008)(6512007)(8936002)(26005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:05:45.8629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357e6c41-f8f6-46f4-9b0c-08d993012a09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3321

Hi Jan,

> On 19 Oct 2021, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.10.2021 12:40, Bertrand Marquis wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -756,11 +756,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>     if ( !pdev->domain )
>>     {
>>         pdev->domain =3D hardware_domain;
>> -#ifdef CONFIG_ARM
>> -        /*
>> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci =
handler
>> -         * when Dom0 inform XEN to add the PCI devices in XEN.
>> -         */
>>         ret =3D vpci_add_handlers(pdev);
>=20
> I think it wouldn't hurt to retain a (re-worded) comment here, maybe
> along the lines of "For devices not discovered by Xen during boot,
> add vPCI handlers when Dom0 first informs Xen about such devices."

Ok, I will add that in v2.

Cheers
Bertrand

>=20
> Jan
>=20


