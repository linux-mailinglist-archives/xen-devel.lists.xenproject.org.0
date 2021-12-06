Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE74691A2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 09:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238748.413802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu9Xc-0001uy-HW; Mon, 06 Dec 2021 08:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238748.413802; Mon, 06 Dec 2021 08:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu9Xc-0001sG-EL; Mon, 06 Dec 2021 08:40:08 +0000
Received: by outflank-mailman (input) for mailman id 238748;
 Mon, 06 Dec 2021 08:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7EA=QX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mu9Xb-0001s7-9c
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 08:40:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bcd075d-5670-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 09:40:05 +0100 (CET)
Received: from DB6PR0501CA0019.eurprd05.prod.outlook.com (2603:10a6:4:8f::29)
 by VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 08:40:01 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::fe) by DB6PR0501CA0019.outlook.office365.com
 (2603:10a6:4:8f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 08:40:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 08:40:01 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Mon, 06 Dec 2021 08:40:01 +0000
Received: from c033d31f18c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BDD2AA8-CCDE-49CA-98C1-817EC150A7A1.1; 
 Mon, 06 Dec 2021 08:39:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c033d31f18c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Dec 2021 08:39:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5918.eurprd08.prod.outlook.com (2603:10a6:102:e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 08:39:43 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622%5]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 08:39:43 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP265CA0075.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 08:39:42 +0000
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
X-Inumbo-ID: 1bcd075d-5670-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXPbVL2EdEFUiGXcxX5ln7kXU648RW6dIlZm86JJVgo=;
 b=MzP3W7delf2qLP4Inqfye8e8DydJTOkayGck/eIGtPQtMzhQABeeR+coJsueWwOM3vtKD2Cr0qgOkYOXU1nbrJ1u5cvmrG9kLusaADDc5v2TURnI0t93M3PcM7MEbc/NciScDu22BYyD/a1SFM2GSJPw6SthxEJpQFR+FpKpSx0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42c5fcbab6fa6cec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRlEC2FT+0nPVtObVgZbZTJzYB2Mf356lvyBRC+CyZ08WdJRt1eMTwss7cONv3sBsJ0wikyZTyaMOqO1UKTGd9rjbZI83tFNRHIRNaN4qd9GQGuXeBtHKCDRyBXcyEXwadMtmTV0DmjK1JtZejAow0CiXj65Ypu6abg558T2Q3b9Rc4oN9IS5AN/K3UHrCah6jJ6yjF2R7g4JGIqg1Ug18PN4BShtYf6k6b8qXM73X0G1YMCDDDKfY6hBw0kpIoOjuD5mdSoZ9yrpoQp2SmfhATndLsQUaJNQN2sO+A8cOo/uu/voaQZuzDVcJmwuwZExZKqzFdYwM8LCDjbfwfsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXPbVL2EdEFUiGXcxX5ln7kXU648RW6dIlZm86JJVgo=;
 b=PkwoAmfG1Q/bkeYoTS8L9kCB+Lv4ChUsNdHmzASbW8OisvsBhSDChNQg7hR7PnjnIc2BDFCn+L78mpM0wLCte3aUpo7f6to59vkuR0GCK0ytG7oXB62jL0XrajWcIxZLiP6CfWXCoRFgfdJm2Eev/HlkEDnGpM9TQCU0A7QA0ZHmhEFfh3/9ss1/qRf8BSq2UsAWcXaoDtC/pCH2j9uq+HnydKLD1S5qEIFNio6plUQOQZLeJwCWh48+Chcj8WZLYFLmqgRoS0liyoM2OBYQvQhwjAVttBuPhtb73rW5XhnpGIRMtf4k0fgfjtiSO9cFJbSvGQx3VHmu336RcpBXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXPbVL2EdEFUiGXcxX5ln7kXU648RW6dIlZm86JJVgo=;
 b=MzP3W7delf2qLP4Inqfye8e8DydJTOkayGck/eIGtPQtMzhQABeeR+coJsueWwOM3vtKD2Cr0qgOkYOXU1nbrJ1u5cvmrG9kLusaADDc5v2TURnI0t93M3PcM7MEbc/NciScDu22BYyD/a1SFM2GSJPw6SthxEJpQFR+FpKpSx0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/3] EFI: move efi-boot.h inclusion point
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1a6dd0a2-5a09-d39f-b0b9-c7c33f313403@suse.com>
Date: Mon, 6 Dec 2021 08:39:35 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DF1E272-4A0E-43AE-8140-B5B9B4C3252F@arm.com>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
 <F1FE39BE-191B-4245-84EE-1109B9762B54@arm.com>
 <1a6dd0a2-5a09-d39f-b0b9-c7c33f313403@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LNXP265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::15) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ecdba553-e770-49cb-b23f-08d9b893fe2a
X-MS-TrafficTypeDiagnostic:
	PA4PR08MB5918:EE_|DB5EUR03FT036:EE_|VI1PR08MB3967:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB39678EB099FA209DA177098FE46D9@VI1PR08MB3967.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CgRRzr7ZuNVfyYWxLUkNFyQceiuV1dnZELtqn5amzEu1AU0AVrmN159ARd1YmxgojmB5gf1P9tzc9UHgTeC8PonfXt1mW7XBVpPMfhnfUm3MvzQmdliTDGSXIZa7G6eJ9ehjgc2K2QPsRVwEnKFfiF3KE7HLoXJ/aO0+S0QL74IBCiosaX1ulCBSlLOUlPYdUCfiyUdaS3kHg6+pFi2Vpzh0vjQTv6dWeTquZcwnLzMgeT3mhsBZph5lHyaizyJwtmUYsFtFU4ojoVlOUYBZN+cFLmKj0lBvBeAJjYtOuQNFJCecj1fjMQansFTUuEeFAbRhYjxDvfcsPHm41bvkShUI3fi1xIdTXphOrOS26xLfRdMeIbHMIPKYN2OwlKNBwcZEzSwKVnNfNMcCPQ2E2RW9avZuO6LuFE2YbyV+dMZac7LVD2OJcvGZItZ/w+mLN2M6FuSWWZnKcvu9FbUoKEVfVjaWhojRErpvmTqGLUiuhmI8PSU13lBBjH+XDB9l6hJnDV8ofUhEDg0t/wFb55dGXr7HBdsG2LOfwWczmaeg2WZrkrRXYR3TfnFXaf2qprv+DWMLL1rhtTOOiCVEY5OkbM9yXENItc874FX0Ca3ryFY8PpW6AgLqHVF5EPpvU9KOKuJ2d6bYxi1tPhKEhnMLfD48xPEEN5EMmiuImFlrBUxDfLADBeN6kswI5RvRb91UzQ0Dxir6/j6tIPHwdPCjxdtm446/9sXW/9PwSgENMZ2C6mS5AbxYEd6jTXfa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(38100700002)(38350700002)(508600001)(53546011)(83380400001)(6506007)(2906002)(186003)(8676002)(6512007)(26005)(5660300002)(33656002)(6916009)(66946007)(66556008)(6486002)(44832011)(66476007)(956004)(52116002)(4326008)(54906003)(36756003)(2616005)(6666004)(316002)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5918
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f06d6c5-2927-4527-b622-08d9b893f32f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jwnvFn+D8twBR2bFh7RS/3b3IBW8H+iDHT2GONxHLmMUDIh+w3CmMb1Ay4t3Du+o+mOjMNlebmo/gPhOnxLZuGQV18u4+ppPi+hDxQEOccaIBCff4x2VAW5/40A73EPaJIotDnSENYl7TsTUfKfQTXvrRhvvP95okoEMEya7K00jGJAWdeRhbpMrX/mFUnEA2TgA+5a0Nub9+q02K9e1gHzASYB/vSPA8BCqAnKLUCnatO10nttL4NBgwqj5BDx9mjpUcUIoBLm5NbffTPD4KPtpbeL5TCW1wZ86cj1Q+MkSuCikLIjbNKPDVl71IpUFd7iWIgH52USDnpgmIlNJvdTxqarKao68LFXl/ZIIOpV2NgDH5DLjsQx1xOmwN4OCzr/rpLuWXD13NxZCiKRQMYumccP9DDU+/JGmWmeYxwwXrhslHv6879e/X6rua+YrO4YAhTGgMIbnqLWtGQw4vOYBa0jUWt6tAF1f3wzUhvlGwBFh77kurC7JzqKWofzdKcDk3efMev2qyjGzvhSTcwlLyZ4jpf8Oi5/bUeb9pztSeecK9c0Wy3nL9A/lRrKpbD4Ti/WGZQiYqVm64QRHps/biSunCKbW2oQpAvLWdAU/5G9zKEUW2GzzyLDYc04MCheEBlXxsMCOF89Z5Z2rHQPDKJBbdhjbPPAfxO8h3ogzsMmv6bu3XzRNh1iKRsM5D0nhehh7LeRMnlDKkTRYKQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(70586007)(82310400004)(36756003)(5660300002)(53546011)(70206006)(54906003)(956004)(6506007)(6862004)(8676002)(8936002)(336012)(4326008)(2906002)(26005)(186003)(33656002)(2616005)(6486002)(356005)(83380400001)(81166007)(47076005)(36860700001)(86362001)(6512007)(316002)(508600001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:40:01.3393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdba553-e770-49cb-b23f-08d9b893fe2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3967



> On 6 Dec 2021, at 07:27, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.12.2021 17:10, Luca Fancellu wrote:
>>> On 3 Dec 2021, at 10:56, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> When it was introduced, it was imo placed way too high up, making it
>>> necessary to forward-declare way too many static functions. Move it dow=
n
>>> together with
>>> - the efi_check_dt_boot() stub, which afaict was deliberately placed
>>> immediately ahead of the #include,
>>> - blexit(), because of its use of the efi_arch_blexit() hook.
>>> Move up get_value() and set_color() to before the inclusion so their
>>> forward declarations can also be zapped.
>>>=20
>>=20
>> With the =E2=80=9Cconst=E2=80=9D attribute now some function in this ser=
ie are above the char line
>> limit, however everything looks fine.
>=20
> I wonder which part of this patch you're referring to. I don't recall any
> addition of const here - I think I'm strictly only moving code around som=
e
> code and delete some declarations. I've further checked the code being
> moved, and I couldn't spot any line going beyond 80 chars.

Yes sorry, it was a comment for the second patch, where you constify a=20
function parameter

>=20
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Thanks.
>=20
> Jan


