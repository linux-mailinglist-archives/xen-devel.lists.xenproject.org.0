Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15D428BE4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205807.361207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtP4-0000cZ-EO; Mon, 11 Oct 2021 11:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205807.361207; Mon, 11 Oct 2021 11:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtP4-0000Zp-BL; Mon, 11 Oct 2021 11:23:34 +0000
Received: by outflank-mailman (input) for mailman id 205807;
 Mon, 11 Oct 2021 11:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mZtP3-0000Zj-AL
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:23:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b916ca21-32fc-49e8-b5bb-e02556346704;
 Mon, 11 Oct 2021 11:23:31 +0000 (UTC)
Received: from AM6PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:f0::35)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 11:23:28 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::ef) by AM6PR04CA0058.outlook.office365.com
 (2603:10a6:20b:f0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Mon, 11 Oct 2021 11:23:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 11:23:26 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Mon, 11 Oct 2021 11:23:26 +0000
Received: from d31eb5426ab2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5822FCD6-8780-43EA-B382-17714D9F3B18.1; 
 Mon, 11 Oct 2021 11:23:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d31eb5426ab2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 11:23:20 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6925.eurprd08.prod.outlook.com (2603:10a6:102:13a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 11:23:19 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:23:19 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 11:23:18 +0000
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
X-Inumbo-ID: b916ca21-32fc-49e8-b5bb-e02556346704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSxEyE53U20d4hvbj9ZxTr2LRWp2djw+W1PTiXIolDQ=;
 b=CmJdEPXms61CQcaWB5DFT1dNvdxasYCgODcnvmQeM6y+xnEsSNtzo9RjtQNMCjr9HlowrcFUB6toVk6mnjWWcu4/PiwyX2m1ul3RZdJ/klRQjd8WG1lBzxCwWoJLPQ5LmdYQhhZN4SQ5qdW6QSx9R6YoLwzXdjoilQPctXa8Av4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: da9b363cd250488d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIEbvRYAvskhKamCrbiQlVAYeqXt1bc7vb/ocSAZZOKeIV0xvKbUffYvLPaKsHLi3E+fWW8LNXLWTCzHyd/qWR9WrKDVQXxWtia3JVqJPsVEFnXMMYO5jI/V6tUrmWjQ9W70FtAIO3e/kvwKd7fQmtVvmRHZ4vsSxd+MUZM4j23raGlmnT4L7porcOedl/c9busvfVMiNoXmc6iPYXPTyHH8zEetjy6slV29j60UxYjPuWLSNNkRZJxKwhJpE/rKEFmEV7nS8bPsk4lcm0fovfBZIbvibI4XRrbVRhg4FUmPjWvFEAY4h56pw7XpW3uScyJUz86U3fcF6+LqVouG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSxEyE53U20d4hvbj9ZxTr2LRWp2djw+W1PTiXIolDQ=;
 b=CD0QAWv9pnsyvgkjxBS9EKT1ANA1Biqs2RhqCq3ZJqWBTTEdOhK98d0XivR5QTTP8VsZP41BvtAt3dLIKJ8sqDQoAkpXBvs4+mHrhjyAhFCUF65oxFihRBmYKGorYjyiwlUGQ0gs6FpVOJ4CXjVV2xmAQ1SdqKVIVP5OkVvZWRMXwEm/glnFX58WjUmj3HAe3lcufuXPGYgn/AIsseZJOy1gqYyKvAupc3V3IyjoxUJie+z7uHjTqyTJJWVSta5RHHJfWC+RzGyy3KhrasUvwsSGyAedYPff/47YpPH7/vASs2tTo0fwdojK2RFpU+dlZhin5NDVWRtKYYv05Ut67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSxEyE53U20d4hvbj9ZxTr2LRWp2djw+W1PTiXIolDQ=;
 b=CmJdEPXms61CQcaWB5DFT1dNvdxasYCgODcnvmQeM6y+xnEsSNtzo9RjtQNMCjr9HlowrcFUB6toVk6mnjWWcu4/PiwyX2m1ul3RZdJ/klRQjd8WG1lBzxCwWoJLPQ5LmdYQhhZN4SQ5qdW6QSx9R6YoLwzXdjoilQPctXa8Av4=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <81e30575-d823-830b-6f80-4e7a7fb4f9ff@xen.org>
Date: Mon, 11 Oct 2021 12:23:11 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC2506EC-8BCD-487C-AFF4-0C99A9020BDA@arm.com>
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
 <81e30575-d823-830b-6f80-4e7a7fb4f9ff@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6c4a0fd-749f-4de2-7a73-08d98ca98b9c
X-MS-TrafficTypeDiagnostic: PAXPR08MB6925:|AM8PR08MB5761:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB57619569EE844198C87892AEE4B59@AM8PR08MB5761.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M9dCU4D7v+tzMJuc84VWCHuQlphsdMvOWe0y+R41k+srT9QYhDaQca2+elE3rLDhwDHv90xtmYS6UviNWEe++mzMZO4GYgEL14A1tdT5yb+KLJHZrTeioHX0C0jFg+miLBL9XQ2GX1GX92ZRchTfW7KDwzSWnIDTRi7RqBqZbTwBT/aYp6upMBDD1eZIClrF9Mv8dCzyQG+WRoCMkYBqPIMVIHN741Xy1N2TA0BOn/gXXXPGfgcPrL1ftj3Be135NnP5lw/Qh3qkXAS5n36CkN6K3dpzvTSJZARVrMsVQzhb2l8isIGkCyessnQodNUj7CA8UVElf7GA66TpagNP/0Q8WYsdD2ga8F5ruBD1e5+rVgHjllkxr6eZ04mg3+xUMnJYYtlpl5UxLt8BHoRkRFUd+KWiQKmzTKp7+Njdq9ALRa5S/tbD/6LKHpyVEctqDMThnEs5cUlGWjMo9FtY4ZHQnJwq8M4j0OT4CPuFprS99BnpNs98r6TTVheE7ALJKJZAZFNPKaJYL77y44KEF6QPcno2nD3TlLWMW1ltR80eJdgnYlpJosv/O7kghTU7qaKebz7bnaB4aI/WSJmfvBRO/YhMepJdlMlPYw66jZxUd4Y44ZBCnDgSNDsjeiPAxH6L/q+FKWPxnG8o+ItuMdERTAsk37GoMzuFfFsm5zmYYcyT0Fctm/2uj9PVUdsScGsw1y6LIg33X+w6balHkqr1plu6OHKEOkBWsJOIkAFpmmuSxNCs0ePL8q5up8/UPwWTgXSJ2Xmo5Q2p6ZhFSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(6666004)(4326008)(6512007)(956004)(26005)(2616005)(66556008)(66476007)(53546011)(6506007)(86362001)(44832011)(8936002)(36756003)(33656002)(508600001)(2906002)(52116002)(8676002)(6916009)(38350700002)(54906003)(6486002)(38100700002)(186003)(316002)(4744005)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6925
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec429fb2-fa1d-434b-da0d-08d98ca98722
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jkvq8mEShsoyV/SQUsh2Bm+r6AiULWTSr/tv5lVaxYARhCxOKPHePqSm6Y7rTrRJLIVsmoNsprUwhHcFgjjbt13Np0OJ2nWMu4tkpF6UXS2jleL9z9euxHttJbZCLMI0W/IPzha5fQbXmQdSWxcoreC7SoHznOQZd6vekWZnEncxjjFTm6CQTeBHvyNAsyPNtdsyIW+6UYefvjUkhEIby5nC1u2NBSeAuv4y6n5yPuYhB3FqFDVLCZ3lH75cS5srz5WEwE2ah3J1lyJH3rnOwgsPEG/x2YbCgavA+RW8NkdPv0z/oiPF1ye6VgsHR50zVqYezt4JH7E/osP1oPCIIlNfpAY/tf4ohCI8X7PZIWpjCvPAuY/7DmxvttjYy0ZfJC1JitEpLVtHkPEv46m5KfAM9ovpgR/QCFUBqLnSWPo66dL7sHuP080PHBrYLs3mC9V9D4lSMsxxM0h+GG4G/99nQKQr9EhMvbYlxFnpIwW9x25Mv0HtvE2nqByUY5t2UKrfM6wBdMCHzUiFUsOLYx6VDF3AsxFbnpFHJ3gMRJNFxlfDx3XcuxKCe/K6ynmDddwBzSnmekdxXJ++coDevFF14q3QDM7o9M4d/7ZK9WgNtbZNR11zLgVTWVUYybUHk0Um+8nIEdNkqklw1ynatPCgJZdFLE72kVn+Gs5rM6qPDl7ROylPqw0xGiWbDvrjiLPwhB+hiR3brkpLWOvHx1gaonOVjzmXEmgSzEPtnk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(6666004)(356005)(8676002)(8936002)(5660300002)(70206006)(70586007)(4744005)(82310400003)(316002)(6506007)(2906002)(36756003)(44832011)(4326008)(336012)(54906003)(508600001)(6862004)(956004)(53546011)(186003)(6512007)(47076005)(33656002)(2616005)(36860700001)(6486002)(86362001)(26005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:23:26.8495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c4a0fd-749f-4de2-7a73-08d98ca98b9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761



> On 11 Oct 2021, at 10:39, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20

Hi Julien,

> On 11/10/2021 09:03, Luca Fancellu wrote:
>> +static bool __init is_boot_module(int dt_module_offset)
>> +{
>> +    if ( (fdt_node_check_compatible(fdt, dt_module_offset,
>> +                                    "multiboot,kernel") =3D=3D 0) ||
>> +         (fdt_node_check_compatible(fdt, dt_module_offset,
>> +                                    "multiboot,ramdisk") =3D=3D 0) ||
>> +         (fdt_node_check_compatible(fdt, dt_module_offset,
>> +                                    "multiboot,device-tree") =3D=3D 0) =
)
>> +        return true;
>=20
> A boot module *must* have the compatible "multiboot,module". I would pref=
er if we simply check that "multiboot,module" is present.
>=20
> This will also make easier to add new boot module in the future.

I thought that also the XSM policy was a multiboot,module so I checked expl=
icitly for kernel, ramdisk, device-tree that are supported
by domU.

Do you still think that I should check just for multiboot,module instead?

Cheers,
Luca


>=20
>> +
>> +    return false;
>> +}
>> +
> Cheers,
>=20
> --=20
> Julien Grall


